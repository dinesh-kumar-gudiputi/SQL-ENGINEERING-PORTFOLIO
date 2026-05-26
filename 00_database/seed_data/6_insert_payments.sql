USE nova_retail;

INSERT INTO payments
(order_id, payment_date, payment_status, payment_amount)
VALUES
(1, '2025-01-05', 'Paid', 1350),
(2, '2025-01-10', 'Paid', 300),
(3, '2025-01-15', 'Pending', 60);