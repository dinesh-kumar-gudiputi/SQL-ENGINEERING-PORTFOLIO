USE nova_retail;

-- =========================================
-- NULL HANDLING
-- =========================================

-- Create NULL handling demo table
CREATE TABLE customers_null_demo AS
SELECT *
FROM customers;

-- Introduce NULL values
UPDATE customers_null_demo
SET phone = NULL
WHERE customer_id IN (1, 2);

UPDATE customers_null_demo
SET city = NULL
WHERE customer_id = 3;

-- View NULL values
SELECT *
FROM customers_null_demo;

-- Find NULL values
SELECT *
FROM customers_null_demo
WHERE phone IS NULL;

-- Replace NULL values using IFNULL
SELECT
    customer_id,
    first_name,
    IFNULL(phone, 'Phone Not Available') AS phone_number
FROM customers_null_demo;

-- Replace NULL city values
SELECT
    customer_id,
    first_name,
    IFNULL(city, 'Unknown City') AS city
FROM customers_null_demo;

-- Update NULL values
UPDATE customers_null_demo
SET city = 'Berlin'
WHERE city IS NULL;

-- Verify cleaned data
SELECT *
FROM customers_null_demo;

-- Product NULL handling
CREATE TABLE products_null_demo AS
SELECT *
FROM products;

UPDATE products_null_demo
SET brand = NULL
WHERE product_id = 1;

SELECT
    product_name,
    IFNULL(brand, 'Unknown Brand') AS brand_name
FROM products_null_demo;