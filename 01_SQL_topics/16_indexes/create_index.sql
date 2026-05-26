USE nova_retail;

-- =========================================
-- CREATE INDEX
-- =========================================

-- Create index on email
CREATE INDEX idx_customer_email
ON customers(email);

-- Create index on order date
CREATE INDEX idx_order_date
ON orders(order_date);

-- Create product brand index
CREATE INDEX idx_product_brand
ON products(brand);

-- Query examples
SELECT *
FROM customers
WHERE email = 'john@example.com';

SELECT *
FROM orders
WHERE order_date = '2025-01-05';