USE nova_retail;

-- =========================================
-- COMPOSITE INDEXES
-- =========================================

-- Create composite index
CREATE INDEX idx_orders_customer_date
ON orders(customer_id, order_date);

-- Query using composite index
SELECT *
FROM orders
WHERE customer_id = 1
AND order_date >= '2025-01-01';

-- Multi-column product index
CREATE INDEX idx_products_brand_price
ON products(brand, price);

SELECT *
FROM products
WHERE brand = 'Apple'
AND price > 500;