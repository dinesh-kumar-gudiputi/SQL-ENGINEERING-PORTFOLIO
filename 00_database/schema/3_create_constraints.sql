USE nova_retail;

ALTER TABLE customers
ADD CONSTRAINT unique_email UNIQUE(email);

ALTER TABLE products
ADD CONSTRAINT check_price CHECK(price > 0);

ALTER TABLE orders
ADD CONSTRAINT check_total_amount CHECK(total_amount >= 0);

ALTER TABLE inventory
ADD CONSTRAINT check_stock_level CHECK(stock_level >= 0);