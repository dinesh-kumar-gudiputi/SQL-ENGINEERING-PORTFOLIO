USE nova_retail;

-- =========================================
-- SELF JOIN
-- =========================================

-- Employees in same department
SELECT
    e1.first_name AS employee_1,
    e2.first_name AS employee_2,
    e1.department
FROM employees e1
JOIN employees e2
ON e1.department = e2.department
AND e1.employee_id <> e2.employee_id;

-- Customers from same city
SELECT
    c1.first_name AS customer_1,
    c2.first_name AS customer_2,
    c1.city
FROM customers c1
JOIN customers c2
ON c1.city = c2.city
AND c1.customer_id <> c2.customer_id;