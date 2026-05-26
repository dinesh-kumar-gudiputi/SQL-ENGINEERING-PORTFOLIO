USE nova_retail;

-- =========================================
-- MULTIPLE GROUPING
-- =========================================

-- Revenue by country and payment method
SELECT
    shipping_country,
    payment_method,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY shipping_country, payment_method;

-- Product count by category and brand
SELECT
    category_id,
    brand,
    COUNT(*) AS total_products
FROM products
GROUP BY category_id, brand;