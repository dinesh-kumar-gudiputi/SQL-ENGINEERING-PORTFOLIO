USE nova_retail;

-- =========================================
-- IN OPERATOR
-- =========================================

-- Customers from selected cities
SELECT *
FROM customers
WHERE city IN ('Berlin', 'Munich', 'Hamburg');

-- Orders by payment methods
SELECT *
FROM orders
WHERE payment_method IN ('PayPal', 'Credit Card');

-- Products from selected brands
SELECT *
FROM products
WHERE brand IN ('Apple', 'Nike', 'Samsung');

-- Business use case
SELECT *
FROM orders
WHERE order_status IN ('Pending', 'Shipped');