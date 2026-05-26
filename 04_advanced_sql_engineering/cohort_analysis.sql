USE nova_retail;

-- =========================================
-- COHORT ANALYSIS
-- =========================================

-- Customer cohort by signup month
SELECT
    customer_id,
    DATE_FORMAT(signup_date, '%Y-%m') AS cohort_month
FROM customers;

-- Monthly active customers
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(DISTINCT customer_id) AS active_customers
FROM orders
GROUP BY order_month
ORDER BY order_month;

-- Customer retention cohorts
WITH customer_cohorts AS
(
    SELECT
        customer_id,
        MIN(DATE_FORMAT(order_date, '%Y-%m')) AS cohort_month
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_cohorts;

-- Cohort revenue analysis
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY order_month
ORDER BY order_month;