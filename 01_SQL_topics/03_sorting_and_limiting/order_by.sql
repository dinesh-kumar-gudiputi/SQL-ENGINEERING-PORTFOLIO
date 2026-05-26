USE nova_retail;

-- =========================================
-- ORDER BY
-- =========================================

-- Products sorted by price
SELECT
    product_name,
    price
FROM products
ORDER BY price DESC;

-- Customers sorted alphabetically
SELECT
    first_name,
    last_name
FROM customers
ORDER BY last_name ASC;

-- Orders sorted by latest date
SELECT *
FROM orders
ORDER BY order_date DESC;

-- Multiple sorting
SELECT *
FROM customers
ORDER BY country, city;