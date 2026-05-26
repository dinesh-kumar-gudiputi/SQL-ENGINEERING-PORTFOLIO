USE nova_retail;

-- =========================================
-- DATE FORMATTING
-- =========================================

-- Format order date
SELECT
    order_id,
    DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_date
FROM orders;

-- Month and year
SELECT
    order_id,
    DATE_FORMAT(order_date, '%M %Y') AS month_year
FROM orders;

-- Customer signup format
SELECT
    first_name,
    DATE_FORMAT(signup_date, '%W, %d %M %Y') AS signup_day
FROM customers;