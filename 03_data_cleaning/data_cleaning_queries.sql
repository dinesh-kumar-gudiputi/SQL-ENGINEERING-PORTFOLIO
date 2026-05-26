USE nova_retail;

-- =========================================
-- DATA CLEANING QUERIES
-- =========================================

-- Create dirty customers table
CREATE TABLE customers_dirty AS
SELECT *
FROM customers;

-- View dirty data
SELECT *
FROM customers_dirty;

-- Standardize customer names
UPDATE customers_dirty
SET first_name = TRIM(first_name),
    last_name = TRIM(last_name);

-- Standardize email formatting
UPDATE customers_dirty
SET email = LOWER(email);

-- Remove leading/trailing spaces in city names
UPDATE customers_dirty
SET city = TRIM(city);

-- Replace blank phone numbers with NULL
UPDATE customers_dirty
SET phone = NULL
WHERE phone = '';

-- Verify cleaned data
SELECT *
FROM customers_dirty;

-- Product cleaning
CREATE TABLE products_dirty AS
SELECT *
FROM products;

-- Standardize product names
UPDATE products_dirty
SET product_name = TRIM(product_name);

-- Convert brand names to uppercase
UPDATE products_dirty
SET brand = UPPER(brand);

-- View cleaned products
SELECT *
FROM products_dirty;