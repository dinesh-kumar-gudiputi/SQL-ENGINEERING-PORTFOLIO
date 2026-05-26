USE nova_retail;

-- =========================================
-- INVENTORY ANALYSIS
-- =========================================

-- Current inventory levels
SELECT
    p.product_name,
    i.stock_level,
    i.reorder_level
FROM inventory i
JOIN products p
ON i.product_id = p.product_id;

-- Low stock products
SELECT
    p.product_name,
    i.stock_level,
    i.reorder_level
FROM inventory i
JOIN products p
ON i.product_id = p.product_id
WHERE i.stock_level <= i.reorder_level;

-- Inventory valuation
SELECT
    p.product_name,
    i.stock_level,
    p.cost,
    (i.stock_level * p.cost) AS inventory_value
FROM inventory i
JOIN products p
ON i.product_id = p.product_id
ORDER BY inventory_value DESC;

-- Warehouse stock summary
SELECT
    warehouse_location,
    SUM(stock_level) AS total_stock
FROM inventory
GROUP BY warehouse_location;