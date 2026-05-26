USE nova_retail;

CREATE INDEX idx_customer_email
ON customers(email);

CREATE INDEX idx_order_date
ON orders(order_date);

CREATE INDEX idx_product_category
ON products(category_id);

CREATE INDEX idx_payment_status
ON payments(payment_status);