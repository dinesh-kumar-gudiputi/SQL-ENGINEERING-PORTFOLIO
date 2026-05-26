USE nova_retail;

-- =========================================
-- INDEXING STRATEGIES
-- =========================================

-- Single column index
CREATE INDEX idx_customer_email
ON customers(email);

-- Order date index
CREATE INDEX idx_order_date
ON orders(order_date);

-- Product brand index
CREATE INDEX idx_product_brand
ON products(brand);

-- Composite index
CREATE INDEX idx_orders_customer_date
ON orders(customer_id, order_date);

-- Inventory stock index
CREATE INDEX idx_inventory_stock
ON inventory(stock_level);

-- =========================================
-- INDEXED QUERY EXAMPLES
-- =========================================

SELECT *
FROM customers
WHERE email = 'john@example.com';

SELECT *
FROM orders
WHERE customer_id = 1
AND order_date >= '2025-01-01';

SELECT *
FROM products
WHERE brand = 'Apple';

-- =========================================
-- VIEW INDEXES
-- =========================================

SHOW INDEXES FROM customers;

SHOW INDEXES FROM orders;

SHOW INDEXES FROM products;