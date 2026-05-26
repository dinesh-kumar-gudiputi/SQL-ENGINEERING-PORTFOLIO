USE nova_retail;

-- =========================================
-- SQL FORMATTING STANDARDS
-- =========================================

-- GOOD FORMATTING

SELECT
    customer_id,
    first_name,
    last_name,
    city
FROM customers
WHERE country = 'Germany'
ORDER BY first_name;

-- BAD FORMATTING EXAMPLE
-- select * from customers where country='Germany';

-- Proper JOIN formatting
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;