USE nova_retail;

-- =========================================
-- CREATING VIEWS
-- =========================================

-- Customer orders view
CREATE VIEW customer_orders_view AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Product inventory view
CREATE VIEW product_inventory_view AS
SELECT
    p.product_name,
    p.brand,
    i.stock_level,
    i.warehouse_location
FROM products p
JOIN inventory i
ON p.product_id = i.product_id;

-- View data
SELECT *
FROM customer_orders_view;

SELECT *
FROM product_inventory_view;