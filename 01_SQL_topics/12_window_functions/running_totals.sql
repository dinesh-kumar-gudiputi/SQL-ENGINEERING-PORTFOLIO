USE nova_retail;

-- =========================================
-- RUNNING TOTALS
-- =========================================

SELECT
    order_date,
    total_amount,

    SUM(total_amount)
    OVER(ORDER BY order_date) AS cumulative_revenue

FROM orders;

-- Customer cumulative spending
SELECT
    customer_id,
    order_date,
    total_amount,

    SUM(total_amount)
    OVER(
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS customer_running_total

FROM orders;