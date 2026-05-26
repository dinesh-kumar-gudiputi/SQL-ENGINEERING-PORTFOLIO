USE nova_retail;

-- =========================================
-- MULTIPLE CTEs
-- =========================================

WITH customer_orders AS
(
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
),

customer_revenue AS
(
    SELECT
        customer_id,
        SUM(total_amount) AS total_revenue
    FROM orders
    GROUP BY customer_id
)

SELECT
    co.customer_id,
    co.total_orders,
    cr.total_revenue
FROM customer_orders co
JOIN customer_revenue cr
ON co.customer_id = cr.customer_id;