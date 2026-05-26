USE nova_retail;

-- =========================================
-- BETWEEN OPERATOR
-- =========================================

-- Products between price range
SELECT
    product_name,
    price
FROM products
WHERE price BETWEEN 100 AND 1000;

-- Orders between dates
SELECT *
FROM orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-12-31';

-- Employee salary range
SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 80000;

-- Business use case
SELECT *
FROM inventory
WHERE stock_level BETWEEN 10 AND 100;