USE nova_retail;

-- =========================================
-- MIN AND MAX
-- =========================================

-- Highest product price
SELECT MAX(price) AS max_price
FROM products;

-- Lowest product price
SELECT MIN(price) AS min_price
FROM products;

-- Latest order date
SELECT MAX(order_date) AS latest_order
FROM orders;

-- Earliest signup date
SELECT MIN(signup_date) AS first_customer
FROM customers;