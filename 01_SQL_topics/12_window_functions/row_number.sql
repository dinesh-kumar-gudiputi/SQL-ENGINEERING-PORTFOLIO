USE nova_retail;

-- =========================================
-- ROW NUMBER
-- =========================================

SELECT
    order_id,
    customer_id,
    total_amount,

    ROW_NUMBER()
    OVER(ORDER BY total_amount DESC) AS row_num

FROM orders;

-- Customer order numbering
SELECT
    customer_id,
    order_id,
    order_date,

    ROW_NUMBER()
    OVER(PARTITION BY customer_id ORDER BY order_date) AS customer_order_number

FROM orders;