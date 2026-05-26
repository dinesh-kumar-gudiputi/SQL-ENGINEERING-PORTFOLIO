USE nova_retail;

-- =========================================
-- MARKETING CAMPAIGN ANALYSIS
-- =========================================

-- Simulated campaign performance
SELECT
    shipping_country,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS avg_order_value
FROM orders
GROUP BY shipping_country
ORDER BY total_revenue DESC;

-- Payment method performance
SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(total_amount) AS revenue_generated
FROM orders
GROUP BY payment_method
ORDER BY revenue_generated DESC;

-- Top customer cities
SELECT
    city,
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

-- High revenue customer segments
SELECT
    c.country,
    SUM(o.total_amount) AS customer_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY customer_revenue DESC;