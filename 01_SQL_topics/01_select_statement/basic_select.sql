USE nova_retail;

-- =========================================
-- BASIC SELECT STATEMENTS
-- =========================================

-- View all customers
SELECT *
FROM customers;

-- View all products
SELECT *
FROM products;

-- Select specific columns
SELECT
    first_name,
    last_name,
    city,
    country
FROM customers;

-- Product information
SELECT
    product_name,
    brand,
    price
FROM products;

-- Orders information
SELECT
    order_id,
    order_date,
    total_amount
FROM orders;

-- Business use case
SELECT
    customer_id,
    first_name,
    email
FROM customers;