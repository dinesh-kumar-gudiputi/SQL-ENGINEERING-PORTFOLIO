USE nova_retail;

-- =========================================
-- SALES ANALYSIS
-- =========================================

-- Top selling products
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;

-- Best performing customers
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC;

-- Daily sales trend
SELECT
    order_date,
    SUM(total_amount) AS daily_sales
FROM orders
GROUP BY order_date
ORDER BY order_date;

-- Product category sales
SELECT
    cat.category_name,
    SUM(oi.total_price) AS category_sales
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN categories cat
ON p.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY category_sales DESC;

-- Order status analysis
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;