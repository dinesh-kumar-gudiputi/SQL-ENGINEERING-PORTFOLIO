USE nova_retail;

-- =========================================
-- BASIC CASE WHEN
-- =========================================

-- Categorize products by price
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 1000 THEN 'Premium'
        WHEN price >= 500 THEN 'Mid Range'
        ELSE 'Budget'
    END AS product_category
FROM products;

-- Categorize order amount
SELECT
    order_id,
    total_amount,
    CASE
        WHEN total_amount > 1000 THEN 'High Value'
        ELSE 'Regular'
    END AS order_type
FROM orders;

-- Customer region classification
SELECT
    first_name,
    city,
    CASE
        WHEN city = 'Berlin' THEN 'Capital Region'
        ELSE 'Other Region'
    END AS region_type
FROM customers;