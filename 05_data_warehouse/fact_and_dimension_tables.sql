USE nova_retail;

-- =========================================
-- FACT AND DIMENSION TABLES
-- =========================================

-- =========================================
-- DIMENSION TABLES
-- =========================================

CREATE TABLE dim_customers (
    customer_key INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE dim_products (
    product_key INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    product_name VARCHAR(100),
    brand VARCHAR(50),
    category_id INT
);

CREATE TABLE dim_dates (
    date_key INT PRIMARY KEY AUTO_INCREMENT,
    full_date DATE,
    year INT,
    month INT,
    quarter_number INT
);

-- =========================================
-- FACT TABLE
-- =========================================

CREATE TABLE fact_sales (
    sales_key INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    customer_key INT,
    product_key INT,
    date_key INT,
    quantity INT,
    sales_amount DECIMAL(10,2),
    profit_amount DECIMAL(10,2)
);

-- =========================================
-- LOAD DIMENSION TABLES
-- =========================================

INSERT INTO dim_customers (
    customer_id,
    first_name,
    last_name,
    city,
    country
)

SELECT
    customer_id,
    first_name,
    last_name,
    city,
    country
FROM customers;

INSERT INTO dim_products (
    product_id,
    product_name,
    brand,
    category_id
)

SELECT
    product_id,
    product_name,
    brand,
    category_id
FROM products;

INSERT INTO dim_dates (
    full_date,
    year,
    month,
    quarter_number
)

SELECT DISTINCT
    order_date,
    YEAR(order_date),
    MONTH(order_date),
    QUARTER(order_date)
FROM orders;

-- =========================================
-- LOAD FACT TABLE
-- =========================================

INSERT INTO fact_sales (
    order_id,
    customer_key,
    product_key,
    date_key,
    quantity,
    sales_amount,
    profit_amount
)

SELECT
    o.order_id,
    dc.customer_key,
    dp.product_key,
    dd.date_key,
    oi.quantity,
    oi.total_price,
    (oi.quantity * (p.price - p.cost))

FROM orders o

JOIN order_items oi
ON o.order_id = oi.order_id

JOIN products p
ON oi.product_id = p.product_id

JOIN dim_customers dc
ON o.customer_id = dc.customer_id

JOIN dim_products dp
ON p.product_id = dp.product_id

JOIN dim_dates dd
ON o.order_date = dd.full_date;

-- =========================================
-- ANALYTICAL QUERY
-- =========================================

SELECT
    dp.product_name,
    SUM(fs.sales_amount) AS total_sales
FROM fact_sales fs
JOIN dim_products dp
ON fs.product_key = dp.product_key
GROUP BY dp.product_name
ORDER BY total_sales DESC;