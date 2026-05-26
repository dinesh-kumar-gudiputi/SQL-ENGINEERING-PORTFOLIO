USE nova_retail;

INSERT INTO orders
(customer_id, order_date, order_status, shipping_city,
shipping_country, payment_method, total_amount)
VALUES
(1, '2025-01-05', 'Delivered', 'Berlin', 'Germany', 'Credit Card', 1350),
(2, '2025-01-10', 'Delivered', 'Munich', 'Germany', 'PayPal', 300),
(3, '2025-01-15', 'Pending', 'Hamburg', 'Germany', 'Debit Card', 60);