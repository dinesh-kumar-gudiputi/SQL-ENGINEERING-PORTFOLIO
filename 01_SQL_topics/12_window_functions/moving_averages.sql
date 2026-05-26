USE nova_retail;

-- =========================================
-- MOVING AVERAGES
-- =========================================

SELECT
    order_date,
    total_amount,

    AVG(total_amount)
    OVER(
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average

FROM orders;

-- Revenue moving average by customer
SELECT
    customer_id,
    order_date,
    total_amount,

    AVG(total_amount)
    OVER(
        PARTITION BY customer_id
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS customer_moving_avg

FROM orders;