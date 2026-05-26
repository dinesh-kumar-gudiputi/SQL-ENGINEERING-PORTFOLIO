USE nova_retail;

-- =========================================
-- OPTIMIZATION BASICS
-- =========================================

-- Avoid SELECT *
SELECT
    customer_id,
    first_name,
    email
FROM customers;

-- Use indexed columns in filtering
SELECT *
FROM customers
WHERE email = 'john@example.com';

-- Use LIMIT for testing
SELECT *
FROM orders
LIMIT 10;

-- Efficient aggregation
SELECT
    payment_method,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY payment_method;

-- Indexed JOIN example
SELECT
    c.first_name,
    o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;