USE nova_retail;

-- =========================================
-- SUM FUNCTION
-- =========================================

-- Total revenue
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- Total inventory stock
SELECT SUM(stock_level) AS total_stock
FROM inventory;

-- Total payment collected
SELECT SUM(payment_amount) AS total_payments
FROM payments;

-- Revenue by payment method
SELECT
    payment_method,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY payment_method;