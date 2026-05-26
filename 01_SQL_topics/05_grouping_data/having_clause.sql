USE nova_retail;

-- =========================================
-- HAVING CLAUSE
-- =========================================

-- Countries with high revenue
SELECT
    shipping_country,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY shipping_country
HAVING revenue > 1000;

-- Brands with many products
SELECT
    brand,
    COUNT(*) AS total_products
FROM products
GROUP BY brand
HAVING total_products > 2;