USE nova_retail;

-- =========================================
-- UPDATING VIEWS
-- =========================================

-- Create simple updatable view
CREATE VIEW active_products_view AS
SELECT
    product_id,
    product_name,
    price,
    stock_quantity
FROM products;

-- Update through view
UPDATE active_products_view
SET stock_quantity = 150
WHERE product_id = 1;

-- Verify update
SELECT *
FROM active_products_view;

-- Modify product price
UPDATE active_products_view
SET price = 1300
WHERE product_id = 1;