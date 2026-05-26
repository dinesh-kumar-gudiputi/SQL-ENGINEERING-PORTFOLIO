USE nova_retail;

-- =========================================
-- EXECUTION PLAN ANALYSIS
-- =========================================

-- Analyze simple query
EXPLAIN
SELECT *
FROM customers
WHERE email = 'john@example.com';

-- Analyze JOIN query
EXPLAIN
SELECT
    c.first_name,
    o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.total_amount > 500;

-- Analyze aggregation query
EXPLAIN
SELECT
    payment_method,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY payment_method;

-- Analyze sorting query
EXPLAIN
SELECT *
FROM products
ORDER BY price DESC;

-- Analyze filtering with index
EXPLAIN
SELECT *
FROM orders
WHERE order_date >= '2025-01-01';