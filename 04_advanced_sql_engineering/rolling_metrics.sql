USE nova_retail;

-- =========================================
-- ROLLING METRICS
-- =========================================

-- Rolling revenue total
SELECT
    order_date,
    total_amount,

    SUM(total_amount)
    OVER(
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_revenue

FROM orders;

-- 3-day moving average
SELECT
    order_date,
    total_amount,

    AVG(total_amount)
    OVER(
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average

FROM orders;

-- Customer rolling revenue
SELECT
    customer_id,
    order_date,
    total_amount,

    SUM(total_amount)
    OVER(
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS cumulative_customer_spend

FROM orders;

-- Product rolling sales
SELECT
    oi.product_id,
    o.order_date,
    oi.total_price,

    SUM(oi.total_price)
    OVER(
        PARTITION BY oi.product_id
        ORDER BY o.order_date
    ) AS cumulative_product_sales

FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id;