USE nova_retail;

-- =========================================
-- EXTRACTING DATE PARTS
-- =========================================

-- Extract year
SELECT
    order_id,
    YEAR(order_date) AS order_year
FROM orders;

-- Extract month
SELECT
    order_id,
    MONTH(order_date) AS order_month
FROM orders;

-- Extract day
SELECT
    order_id,
    DAY(order_date) AS order_day
FROM orders;

-- Extract weekday
SELECT
    order_id,
    DAYNAME(order_date) AS weekday_name
FROM orders;

-- Business use case
SELECT
    MONTH(order_date) AS sales_month,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY MONTH(order_date);