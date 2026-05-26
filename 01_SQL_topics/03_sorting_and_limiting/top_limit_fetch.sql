USE nova_retail;

-- =========================================
-- TOP / LIMIT / FETCH
-- =========================================

-- Top expensive products
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

-- Latest orders
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 10;

-- Highest revenue orders
SELECT
    order_id,
    total_amount
FROM orders
ORDER BY total_amount DESC
LIMIT 10;

-- Lowest inventory products
SELECT *
FROM inventory
ORDER BY stock_level ASC
LIMIT 5;