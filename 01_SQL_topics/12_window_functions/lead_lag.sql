USE nova_retail;

-- =========================================
-- LEAD AND LAG
-- =========================================

SELECT
    order_id,
    order_date,
    total_amount,

    LAG(total_amount)
    OVER(ORDER BY order_date) AS previous_order_amount,

    LEAD(total_amount)
    OVER(ORDER BY order_date) AS next_order_amount

FROM orders;

-- Customer revenue trend
SELECT
    customer_id,
    order_date,
    total_amount,

    LAG(total_amount)
    OVER(PARTITION BY customer_id ORDER BY order_date) AS previous_purchase

FROM orders;