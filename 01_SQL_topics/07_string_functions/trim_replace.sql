USE nova_retail;

-- =========================================
-- TRIM AND REPLACE
-- =========================================

-- Remove extra spaces
SELECT
    TRIM('   SQL Learning   ') AS cleaned_text;

-- Replace words
SELECT
    REPLACE('Credit Card', 'Card', 'Payment') AS updated_text;

-- Clean customer emails
SELECT
    email,
    TRIM(email) AS cleaned_email
FROM customers;

-- Replace product naming
SELECT
    product_name,
    REPLACE(product_name, 'Phone', 'Device') AS updated_name
FROM products;