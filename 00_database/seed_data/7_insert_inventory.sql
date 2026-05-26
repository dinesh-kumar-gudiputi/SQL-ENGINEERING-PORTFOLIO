USE nova_retail;

INSERT INTO inventory
(product_id, warehouse_location, stock_level,
reorder_level, last_updated)
VALUES
(1, 'Berlin Warehouse', 100, 20, '2025-01-01'),
(2, 'Munich Warehouse', 200, 30, '2025-01-01'),
(3, 'Hamburg Warehouse', 50, 10, '2025-01-01');