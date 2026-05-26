USE nova_retail;

-- =========================================
-- TEMP TABLES
-- =========================================

-- Create temporary table
CREATE TEMPORARY TABLE temp_high_value_orders AS
SELECT
    order_id,
    customer_id,
    total_amount
FROM orders
WHERE total_amount > 1000;

-- View temp table
SELECT *
FROM temp_high_value_orders;

-- Temporary customer revenue table
CREATE TEMPORARY TABLE temp_customer_revenue AS
SELECT
    customer_id,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY customer_id;

SELECT *
FROM temp_customer_revenue;