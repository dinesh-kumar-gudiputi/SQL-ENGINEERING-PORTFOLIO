USE nova_retail;

-- =========================================
-- NESTED SUBQUERIES
-- =========================================

-- Highest spending customer
SELECT
    first_name,
    last_name
FROM customers
WHERE customer_id =
(
    SELECT customer_id
    FROM orders
    WHERE total_amount =
    (
        SELECT MAX(total_amount)
        FROM orders
    )
);

-- Most expensive product
SELECT
    product_name,
    price
FROM products
WHERE price =
(
    SELECT MAX(price)
    FROM products
);

-- Product with lowest stock
SELECT
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity =
(
    SELECT MIN(stock_quantity)
    FROM products
);