USE nova_retail;

-- =========================================
-- RIGHT JOIN
-- =========================================

-- All orders including unmatched customers
SELECT
    c.first_name,
    o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- Inventory with products
SELECT
    p.product_name,
    i.stock_level
FROM products p
RIGHT JOIN inventory i
ON p.product_id = i.product_id;