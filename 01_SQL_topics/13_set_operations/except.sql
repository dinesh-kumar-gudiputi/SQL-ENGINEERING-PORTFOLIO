USE nova_retail;

-- =========================================
-- EXCEPT OPERATION
-- =========================================

-- MySQL alternative using NOT IN

SELECT customer_id
FROM customers
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM orders
);

-- Products not ordered
SELECT product_id
FROM products
WHERE product_id NOT IN
(
    SELECT product_id
    FROM order_items
);