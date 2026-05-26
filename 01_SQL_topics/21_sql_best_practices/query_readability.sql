USE nova_retail;

-- =========================================
-- QUERY READABILITY
-- =========================================

-- Use aliases clearly
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Use proper indentation
SELECT
    product_name,
    price,

    CASE
        WHEN price > 1000 THEN 'Premium'
        ELSE 'Standard'
    END AS product_type

FROM products;

-- Use comments for logic explanation

-- Find high value customers
SELECT
    customer_id,
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 1000;