USE nova_retail;

-- =========================================
-- COLUMN ALIASES
-- =========================================

-- Rename columns for better readability
SELECT
    first_name AS first_name,
    last_name AS last_name,
    email AS customer_email
FROM customers;

-- Product aliases
SELECT
    product_name AS product,
    price AS selling_price,
    cost AS product_cost
FROM products;

-- Calculated column alias
SELECT
    product_name,
    price,
    cost,
    (price - cost) AS profit_per_unit
FROM products;

-- Business use case
SELECT
    order_id AS order_number,
    total_amount AS revenue,
    payment_method AS payment_type
FROM orders;
