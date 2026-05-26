USE nova_retail;

-- =========================================
-- REVENUE KPI ANALYSIS
-- =========================================

-- Total revenue
SELECT
    SUM(total_amount) AS total_revenue
FROM orders;

-- Average order value
SELECT
    AVG(total_amount) AS average_order_value
FROM orders;

-- Monthly revenue
SELECT
    MONTH(order_date) AS order_month,
    SUM(total_amount) AS monthly_revenue
FROM orders
GROUP BY MONTH(order_date)
ORDER BY order_month;

-- Revenue by payment method
SELECT
    payment_method,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY payment_method
ORDER BY revenue DESC;

-- Revenue by country
SELECT
    shipping_country,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY shipping_country
ORDER BY revenue DESC;