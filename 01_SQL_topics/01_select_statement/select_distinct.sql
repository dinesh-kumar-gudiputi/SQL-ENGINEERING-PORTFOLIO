USE nova_retail;

-- =========================================
-- DISTINCT VALUES
-- =========================================

-- Unique countries
SELECT DISTINCT country
FROM customers;

-- Unique cities
SELECT DISTINCT city
FROM customers;

-- Unique payment methods
SELECT DISTINCT payment_method
FROM orders;

-- Unique brands
SELECT DISTINCT brand
FROM products;

-- Business use case
SELECT DISTINCT order_status
FROM orders;