USE nova_retail;

-- =========================================
-- LIKE OPERATOR
-- =========================================

-- Names starting with J
SELECT *
FROM customers
WHERE first_name LIKE 'J%';

-- Names ending with n
SELECT *
FROM customers
WHERE first_name LIKE '%n';

-- Email containing gmail
SELECT *
FROM customers
WHERE email LIKE '%gmail%';

-- Products containing Phone
SELECT *
FROM products
WHERE product_name LIKE '%Phone%';

-- Business use case
SELECT *
FROM customers
WHERE city LIKE 'B%';