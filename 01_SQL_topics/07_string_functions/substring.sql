USE nova_retail;

-- =========================================
-- SUBSTRING FUNCTION
-- =========================================

-- First 3 characters of customer names
SELECT
    first_name,
    SUBSTRING(first_name, 1, 3) AS short_name
FROM customers;

-- Email username extraction
SELECT
    email,
    SUBSTRING(email, 1, 5) AS email_prefix
FROM customers;

-- Product short code
SELECT
    product_name,
    SUBSTRING(product_name, 1, 4) AS product_code
FROM products;