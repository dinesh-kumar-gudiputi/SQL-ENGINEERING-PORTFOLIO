USE nova_retail;

-- =========================================
-- QUERY OPTIMIZATION
-- =========================================

-- BAD PRACTICE
-- SELECT * FROM orders;

-- GOOD PRACTICE
SELECT
    order_id,
    customer_id,
    total_amount
FROM orders;

-- =========================================
-- FILTER EARLY
-- =========================================

SELECT
    order_id,
    total_amount
FROM orders
WHERE total_amount > 1000;

-- =========================================
-- OPTIMIZED JOIN
-- =========================================

SELECT
    c.customer_id,
    c.first_name,
    o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.total_amount > 500;

-- =========================================
-- OPTIMIZED AGGREGATION
-- =========================================

SELECT
    payment_method,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY payment_method;

-- =========================================
-- LIMIT LARGE OUTPUTS
-- =========================================

SELECT *
FROM orders
LIMIT 20;

-- =========================================
-- AVOID FUNCTIONS IN WHERE
-- =========================================

-- BAD
-- WHERE YEAR(order_date) = 2025

-- GOOD
SELECT *
FROM orders
WHERE order_date >= '2025-01-01'
AND order_date < '2026-01-01';

-- =========================================
-- EXISTS VS IN
-- =========================================

SELECT
    customer_id,
    first_name
FROM customers c
WHERE EXISTS
(
    SELECT 1
    FROM orders o
    WHERE c.customer_id = o.customer_id
);

-- =========================================
-- COVERING INDEX STYLE QUERY
-- =========================================

SELECT
    customer_id,
    order_date
FROM orders
WHERE customer_id = 1;