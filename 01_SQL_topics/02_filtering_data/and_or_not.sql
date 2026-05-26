USE nova_retail;

-- =========================================
-- AND / OR / NOT
-- =========================================

-- AND condition
SELECT *
FROM customers
WHERE country = 'Germany'
AND city = 'Berlin';

-- OR condition
SELECT *
FROM products
WHERE brand = 'Apple'
OR brand = 'Samsung';

-- NOT condition
SELECT *
FROM orders
WHERE order_status != 'Delivered';

-- Combined conditions
SELECT *
FROM products
WHERE price > 100
AND stock_quantity > 50;

-- Business use case
SELECT *
FROM orders
WHERE payment_method = 'PayPal'
OR payment_method = 'Credit Card';