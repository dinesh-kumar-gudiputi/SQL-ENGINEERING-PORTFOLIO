USE nova_retail;

-- =========================================
-- STAR SCHEMA
-- =========================================

-- =========================================
-- DIMENSION TABLES
-- =========================================

CREATE TABLE dim_customer_star (
    customer_key INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE dim_product_star (
    product_key INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    product_name VARCHAR(100),
    brand VARCHAR(50),
    category_name VARCHAR(100)
);

CREATE TABLE dim_date_star (
    date_key INT PRIMARY KEY AUTO_INCREMENT,
    full_date DATE,
    year INT,
    month INT
);

-- =========================================
-- FACT TABLE
-- =========================================

CREATE TABLE fact_sales_star (
    sales_key INT PRIMARY KEY AUTO_INCREMENT,
    customer_key INT,
    product_key INT,
    date_key INT,
    quantity INT,
    revenue DECIMAL(10,2)
);

-- =========================================
-- LOAD DIMENSIONS
-- =========================================

INSERT INTO dim_customer_star (
    customer_id,
    customer_name,
    city,
    country
)

SELECT
    customer_id,
    CONCAT(first_name, ' ', last_name),
    city,
    country
FROM customers;

INSERT INTO dim_product_star (
    product_id,
    product_name,
    brand,
    category_name
)

SELECT
    p.product_id,
    p.product_name,
    p.brand,
    c.category_name

FROM products p

JOIN categories c
ON p.category_id = c.category_id;

INSERT INTO dim_date_star (
    full_date,
    year,
    month
)

SELECT DISTINCT
    order_date,
    YEAR(order_date),
    MONTH(order_date)
FROM orders;

-- =========================================
-- LOAD FACT TABLE
-- =========================================

INSERT INTO fact_sales_star (
    customer_key,
    product_key,
    date_key,
    quantity,
    revenue
)

SELECT
    dcs.customer_key,
    dps.product_key,
    dds.date_key,
    oi.quantity,
    oi.total_price

FROM orders o

JOIN order_items oi
ON o.order_id = oi.order_id

JOIN dim_customer_star dcs
ON o.customer_id = dcs.customer_id

JOIN dim_product_star dps
ON oi.product_id = dps.product_id

JOIN dim_date_star dds
ON o.order_date = dds.full_date;

-- =========================================
-- BUSINESS ANALYTICS QUERY
-- =========================================

SELECT
    dps.category_name,
    SUM(fss.revenue) AS total_revenue

FROM fact_sales_star fss

JOIN dim_product_star dps
ON fss.product_key = dps.product_key

GROUP BY dps.category_name
ORDER BY total_revenue DESC;