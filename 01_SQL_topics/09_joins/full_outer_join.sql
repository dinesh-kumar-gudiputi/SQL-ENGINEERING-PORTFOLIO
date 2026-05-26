USE nova_retail;

-- =========================================
-- FULL OUTER JOIN
-- =========================================

-- MySQL alternative using UNION
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id

UNION

SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;