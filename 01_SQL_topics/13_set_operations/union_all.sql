USE nova_retail;

-- =========================================
-- UNION ALL
-- =========================================

SELECT city
FROM customers

UNION ALL

SELECT shipping_city
FROM orders;

-- Product and category names
SELECT product_name AS names
FROM products

UNION ALL

SELECT category_name
FROM categories;