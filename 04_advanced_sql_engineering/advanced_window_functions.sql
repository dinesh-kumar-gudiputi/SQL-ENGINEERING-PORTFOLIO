USE nova_retail;

-- =========================================
-- ADVANCED WINDOW FUNCTIONS
-- =========================================

-- Customer revenue ranking
SELECT
    customer_id,
    SUM(total_amount) AS total_revenue,

    RANK()
    OVER(
        ORDER BY SUM(total_amount) DESC
    ) AS revenue_rank

FROM orders
GROUP BY customer_id;

-- Dense ranking products by sales
SELECT
    p.product_name,
    SUM(oi.total_price) AS total_sales,

    DENSE_RANK()
    OVER(
        ORDER BY SUM(oi.total_price) DESC
    ) AS sales_rank

FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name;

-- Percentile distribution
SELECT
    customer_id,
    total_amount,

    NTILE(4)
    OVER(
        ORDER BY total_amount DESC
    ) AS customer_segment

FROM orders;

-- Revenue contribution percentage
SELECT
    customer_id,
    total_amount,

    ROUND(
        total_amount * 100.0 /
        SUM(total_amount)
        OVER(),
        2
    ) AS revenue_percentage

FROM orders;