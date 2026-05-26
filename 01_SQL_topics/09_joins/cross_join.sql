USE nova_retail;

-- =========================================
-- CROSS JOIN
-- =========================================

-- All possible customer-product combinations
SELECT
    c.first_name,
    p.product_name
FROM customers c
CROSS JOIN products p;

-- Business use case
SELECT
    e.first_name,
    p.product_name
FROM employees e
CROSS JOIN products p;