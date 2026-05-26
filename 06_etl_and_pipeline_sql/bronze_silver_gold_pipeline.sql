USE nova_retail;

-- =========================================
-- BRONZE LAYER (RAW DATA)
-- =========================================

CREATE TABLE bronze_orders AS
SELECT *
FROM orders;

-- View bronze data
SELECT *
FROM bronze_orders;

-- =========================================
-- SILVER LAYER (CLEANED DATA)
-- =========================================

CREATE TABLE silver_orders AS
SELECT
    order_id,
    customer_id,
    order_date,
    TRIM(order_status) AS order_status,
    UPPER(payment_method) AS payment_method,
    total_amount
FROM bronze_orders
WHERE total_amount IS NOT NULL;

-- View silver data
SELECT *
FROM silver_orders;

-- =========================================
-- GOLD LAYER (BUSINESS METRICS)
-- =========================================

CREATE TABLE gold_sales_metrics AS

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS avg_order_value

FROM silver_orders

GROUP BY sales_month;

-- View gold metrics
SELECT *
FROM gold_sales_metrics;

-- =========================================
-- BUSINESS KPI QUERY
-- =========================================

SELECT
    sales_month,
    total_revenue
FROM gold_sales_metrics
ORDER BY total_revenue DESC;