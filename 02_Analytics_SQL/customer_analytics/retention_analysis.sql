USE nova_retail;

-- =========================================
-- CUSTOMER RETENTION ANALYSIS
-- =========================================

-- Repeat customers
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- Customer retention percentage
SELECT
    ROUND(
        (
            COUNT(DISTINCT customer_id) * 100.0
        ) /
        (
            SELECT COUNT(*)
            FROM customers
        ),
        2
    ) AS retention_percentage
FROM
(
    SELECT
        customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
) retained_customers;

-- Monthly repeat customer analysis
SELECT
    MONTH(order_date) AS order_month,
    COUNT(DISTINCT customer_id) AS repeat_customers
FROM orders
GROUP BY MONTH(order_date)
ORDER BY order_month;