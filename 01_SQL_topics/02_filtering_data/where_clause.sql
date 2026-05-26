USE nova_retail;

-- =========================================
-- WHERE CLAUSE
-- =========================================

-- Customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany';

-- Expensive products
SELECT *
FROM products
WHERE price > 500;

-- Delivered orders
SELECT *
FROM orders
WHERE order_status = 'Delivered';

-- Low stock products
SELECT *
FROM products
WHERE stock_quantity < 50;

-- Business use case
SELECT *
FROM inventory
WHERE stock_level <= reorder_level;