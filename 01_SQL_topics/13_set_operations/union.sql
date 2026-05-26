USE nova_retail;

-- =========================================
-- UNION
-- =========================================

SELECT city
FROM customers

UNION

SELECT shipping_city
FROM orders;

-- Product brands and categories
SELECT brand AS names
FROM products

UNION

SELECT category_name
FROM categories;