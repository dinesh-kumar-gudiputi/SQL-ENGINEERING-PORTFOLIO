USE nova_retail;

-- =========================================
-- BASIC CTEs
-- =========================================

WITH high_value_orders AS
(
    SELECT
        order_id,
        customer_id,
        total_amount
    FROM orders
    WHERE total_amount > 1000
)

SELECT *
FROM high_value_orders;

-- Revenue summary CTE
WITH revenue_summary AS
(
    SELECT
        shipping_country,
        SUM(total_amount) AS revenue
    FROM orders
    GROUP BY shipping_country
)

SELECT *
FROM revenue_summary;