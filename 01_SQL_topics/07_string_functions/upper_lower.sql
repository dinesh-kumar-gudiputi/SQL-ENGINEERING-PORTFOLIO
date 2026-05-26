USE nova_retail;

-- =========================================
-- UPPER AND LOWER FUNCTIONS
-- =========================================

-- Convert names to uppercase
SELECT
    first_name,
    UPPER(first_name) AS upper_name
FROM customers;

-- Convert emails to lowercase
SELECT
    email,
    LOWER(email) AS lower_email
FROM customers;

-- Standardize product names
SELECT
    product_name,
    UPPER(product_name) AS standardized_name
FROM products;