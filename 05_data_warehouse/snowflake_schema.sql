USE nova_retail;

-- =========================================
-- SNOWFLAKE SCHEMA
-- =========================================

-- =========================================
-- NORMALIZED DIMENSIONS
-- =========================================

CREATE TABLE dim_categories (
    category_key INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    category_name VARCHAR(100)
);

CREATE TABLE dim_brands (
    brand_key INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(100)
);

CREATE TABLE dim_products_snowflake (
    product_key INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    product_name VARCHAR(100),
    category_key INT,
    brand_key INT
);

-- =========================================
-- FACT TABLE
-- =========================================

CREATE TABLE fact_orders_snowflake (
    sales_key INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_key INT,
    sales_amount DECIMAL(10,2)
);

-- =========================================
-- LOAD DIMENSIONS
-- =========================================

INSERT INTO dim_categories (
    category_id,
    category_name
)

SELECT
    category_id,
    category_name
FROM categories;

INSERT INTO dim_brands (
    brand_name
)

SELECT DISTINCT
    brand
FROM products;

INSERT INTO dim_products_snowflake (
    product_id,
    product_name,
    category_key,
    brand_key
)

SELECT
    p.product_id,
    p.product_name,
    dc.category_key,
    db.brand_key

FROM products p

JOIN dim_categories dc
ON p.category_id = dc.category_id

JOIN dim_brands db
ON p.brand = db.brand_name;

-- =========================================
-- LOAD FACT TABLE
-- =========================================

INSERT INTO fact_orders_snowflake (
    order_id,
    product_key,
    sales_amount
)

SELECT
    oi.order_id,
    dps.product_key,
    oi.total_price

FROM order_items oi

JOIN dim_products_snowflake dps
ON oi.product_id = dps.product_id;

-- =========================================
-- ANALYTICAL QUERY
-- =========================================

SELECT
    dc.category_name,
    SUM(f.sales_amount) AS revenue

FROM fact_orders_snowflake f

JOIN dim_products_snowflake dp
ON f.product_key = dp.product_key

JOIN dim_categories dc
ON dp.category_key = dc.category_key

GROUP BY dc.category_name;