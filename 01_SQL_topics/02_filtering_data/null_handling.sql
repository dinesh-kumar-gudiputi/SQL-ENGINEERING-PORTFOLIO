USE nova_retail;

-- =========================================
-- NULL HANDLING
-- =========================================

-- Customers with missing phone numbers
SELECT *
FROM customers
WHERE phone IS NULL;

-- Customers with phone numbers
SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- Orders with missing payment method
SELECT *
FROM orders
WHERE payment_method IS NULL;

-- Business use case
SELECT *
FROM products
WHERE brand IS NULL;