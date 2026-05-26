USE nova_retail;

-- =========================================
-- TOP / LIMIT
-- =========================================

-- Top 5 expensive products
SELECT
    product_name,
    price
FROM products
ORDER BY price DESC
LIMIT 5;

-- Latest 10 orders
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 10;

-- Top customers by spending
SELECT
    customer_id,
    total_amount
FROM orders
ORDER BY total_amount DESC
LIMIT 5;

-- Lowest stock products
SELECT
    product_name,
    stock_quantity
FROM products
ORDER BY stock_quantity ASC
LIMIT 10;