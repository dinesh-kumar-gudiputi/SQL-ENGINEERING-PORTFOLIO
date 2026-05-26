USE nova_retail;

-- =========================================
-- BEGIN / COMMIT / ROLLBACK
-- =========================================

START TRANSACTION;

-- Insert new customer
INSERT INTO customers (
    first_name,
    last_name,
    gender,
    email,
    phone,
    city,
    country,
    signup_date
)

VALUES (
    'Alex',
    'Brown',
    'Male',
    'alex@example.com',
    '123456789',
    'Berlin',
    'Germany',
    CURRENT_DATE()
);

-- Commit transaction
COMMIT;

-- Rollback example
START TRANSACTION;

UPDATE products
SET price = price * 1.10;

ROLLBACK;