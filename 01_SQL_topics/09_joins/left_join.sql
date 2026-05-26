USE nova_retail;

-- =========================================
-- LEFT JOIN
-- =========================================

-- All customers including those without orders
SELECT
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- Products with inventory
SELECT
    p.product_name,
    i.stock_level
FROM products p
LEFT JOIN inventory i
ON p.product_id = i.product_id;