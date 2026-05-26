USE nova_retail;

-- =========================================
-- AVG FUNCTION
-- =========================================

-- Average product price
SELECT AVG(price) AS average_price
FROM products;

-- Average order value
SELECT AVG(total_amount) AS average_order_value
FROM orders;

-- Average salary
SELECT AVG(salary) AS average_salary
FROM employees;

-- Business use case
SELECT
    brand,
    AVG(price) AS avg_brand_price
FROM products
GROUP BY brand;