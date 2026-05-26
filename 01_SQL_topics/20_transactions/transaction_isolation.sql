USE nova_retail;

-- =========================================
-- TRANSACTION ISOLATION LEVELS
-- =========================================

-- View current isolation level
SELECT @@transaction_isolation;

-- Set isolation level
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT *
FROM orders
WHERE total_amount > 500;

COMMIT;

-- Repeatable read example
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

SELECT *
FROM products;

COMMIT;