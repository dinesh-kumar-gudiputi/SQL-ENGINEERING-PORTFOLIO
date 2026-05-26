USE nova_retail;

-- =========================================
-- EXISTS / NOT EXISTS
-- =========================================

-- Customers who placed orders
SELECT
    customer_id,
    first_name
FROM customers c
WHERE EXISTS
(
    SELECT 1
    FROM orders o
    WHERE c.customer_id = o.customer_id
);

-- Customers without orders
SELECT
    customer_id,
    first_name
FROM customers c
WHERE NOT EXISTS
(
    SELECT 1
    FROM orders o
    WHERE c.customer_id = o.customer_id
);

-- Products available in inventory
SELECT
    product_name
FROM products p
WHERE EXISTS
(
    SELECT 1
    FROM inventory i
    WHERE p.product_id = i.product_id
);