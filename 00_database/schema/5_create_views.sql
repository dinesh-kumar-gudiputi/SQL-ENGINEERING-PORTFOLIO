USE nova_retail;

CREATE VIEW sales_summary AS
SELECT
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_date,
    o.total_amount
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;