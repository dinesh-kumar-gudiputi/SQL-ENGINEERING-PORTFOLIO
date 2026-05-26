USE nova_retail;

-- =========================================
-- CURRENT DATE AND TIME
-- =========================================

-- Current date
SELECT CURRENT_DATE();

-- Current timestamp
SELECT NOW();

-- Current year
SELECT YEAR(CURRENT_DATE()) AS current_year;

-- Current month
SELECT MONTH(CURRENT_DATE()) AS current_month;

-- Business use case
SELECT
    order_id,
    order_date,
    DATEDIFF(CURRENT_DATE(), order_date) AS days_since_order
FROM orders;