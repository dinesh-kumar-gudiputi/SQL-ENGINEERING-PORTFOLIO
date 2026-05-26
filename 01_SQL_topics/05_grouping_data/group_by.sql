USE nova_retail;

-- =========================================
-- GROUP BY
-- =========================================

-- Orders by payment method
SELECT
    payment_method,
    COUNT(*) AS total_orders
FROM orders
GROUP BY payment_method;

-- Revenue by country
SELECT
    shipping_country,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY shipping_country;

-- Products by brand
SELECT
    brand,
    COUNT(*) AS total_products
FROM products
GROUP BY brand;