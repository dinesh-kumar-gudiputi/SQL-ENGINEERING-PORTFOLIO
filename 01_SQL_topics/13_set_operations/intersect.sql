USE nova_retail;

-- =========================================
-- INTERSECT OPERATION
-- =========================================

-- MySQL alternative using INNER JOIN

SELECT DISTINCT c.customer_id
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- Products available in inventory and ordered
SELECT DISTINCT p.product_id
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id;