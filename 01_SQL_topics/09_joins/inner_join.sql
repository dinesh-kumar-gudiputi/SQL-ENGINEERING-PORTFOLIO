USE nova_retail;

-- =========================================
-- INNER JOIN
-- =========================================

-- Customers with orders
SELECT
    c.first_name,
    c.last_name,
    o.order_id,
    o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- Products in orders
SELECT
    p.product_name,
    oi.quantity,
    oi.total_price
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id;

-- Business use case
SELECT
    c.first_name,
    o.order_date,
    o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.total_amount > 500;