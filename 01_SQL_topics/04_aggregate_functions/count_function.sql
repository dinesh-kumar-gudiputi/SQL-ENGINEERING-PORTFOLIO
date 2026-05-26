USE nova_retail;

-- =========================================
-- COUNT FUNCTION
-- =========================================

-- Total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total products
SELECT COUNT(*) AS total_products
FROM products;

-- Total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Orders by status
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;