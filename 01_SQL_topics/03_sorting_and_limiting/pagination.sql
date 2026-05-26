USE nova_retail;

-- =========================================
-- PAGINATION
-- =========================================

-- First 10 products
SELECT *
FROM products
LIMIT 10 OFFSET 0;

-- Next 10 products
SELECT *
FROM products
LIMIT 10 OFFSET 10;

-- Orders pagination
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 20 OFFSET 0;

-- Business use case
SELECT *
FROM customers
LIMIT 50 OFFSET 50;