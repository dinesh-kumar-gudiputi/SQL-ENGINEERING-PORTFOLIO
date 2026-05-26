USE nova_retail;

-- =========================================
-- CORRELATED SUBQUERIES
-- =========================================

-- Customers with orders above their average order value
SELECT
    o.order_id,
    o.customer_id,
    o.total_amount
FROM orders o
WHERE o.total_amount >
(
    SELECT AVG(o2.total_amount)
    FROM orders o2
    WHERE o.customer_id = o2.customer_id
);

-- Products priced above category average
SELECT
    p.product_name,
    p.price
FROM products p
WHERE p.price >
(
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p.category_id = p2.category_id
);

-- Employees earning above department average
SELECT
    e.first_name,
    e.salary
FROM employees e
WHERE e.salary >
(
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e.department = e2.department
);