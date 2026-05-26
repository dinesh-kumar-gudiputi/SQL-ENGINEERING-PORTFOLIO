USE nova_retail;

-- =========================================
-- SCALAR SUBQUERIES
-- =========================================

-- Compare product price with average price
SELECT
    product_name,
    price,
    (
        SELECT AVG(price)
        FROM products
    ) AS average_price
FROM products;

-- Compare employee salary with company average
SELECT
    first_name,
    salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS company_avg_salary
FROM employees;

-- Order amount vs max order amount
SELECT
    order_id,
    total_amount,
    (
        SELECT MAX(total_amount)
        FROM orders
    ) AS max_order
FROM orders;