USE nova_retail;

-- =========================================
-- PROFIT ANALYSIS
-- =========================================

-- Product profit analysis
SELECT
    product_name,
    brand,
    price,
    cost,
    (price - cost) AS profit_per_unit
FROM products
ORDER BY profit_per_unit DESC;

-- Total profit generated
SELECT
    SUM(
        oi.quantity * (p.price - p.cost)
    ) AS total_profit
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;

-- Profit by brand
SELECT
    p.brand,
    SUM(
        oi.quantity * (p.price - p.cost)
    ) AS brand_profit
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.brand
ORDER BY brand_profit DESC;

-- High profit products
SELECT
    product_name,
    (price - cost) AS profit_margin
FROM products
WHERE (price - cost) > 200;