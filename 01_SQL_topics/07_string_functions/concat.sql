USE nova_retail;

-- =========================================
-- CONCAT FUNCTION
-- =========================================

-- Full customer name
SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM customers;

-- Product display label
SELECT
    CONCAT(product_name, ' - ', brand) AS product_label
FROM products;

-- Customer location
SELECT
    CONCAT(city, ', ', country) AS customer_location
FROM customers;

-- Business use case
SELECT
    CONCAT('Order-', order_id) AS formatted_order_id
FROM orders;