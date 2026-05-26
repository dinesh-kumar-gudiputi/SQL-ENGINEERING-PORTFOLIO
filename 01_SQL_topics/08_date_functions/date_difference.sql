USE nova_retail;

-- =========================================
-- DATE DIFFERENCE
-- =========================================

-- Days since customer signup
SELECT
    first_name,
    signup_date,
    DATEDIFF(CURRENT_DATE(), signup_date) AS days_as_customer
FROM customers;

-- Days between orders and payments
SELECT
    o.order_id,
    o.order_date,
    p.payment_date,
    DATEDIFF(p.payment_date, o.order_date) AS payment_delay
FROM orders o
JOIN payments p
ON o.order_id = p.order_id;

-- Business use case
SELECT
    order_id,
    DATEDIFF(CURRENT_DATE(), order_date) AS pending_days
FROM orders
WHERE order_status = 'Pending';