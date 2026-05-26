USE nova_retail;

-- =========================================
-- SAVEPOINTS
-- =========================================

START TRANSACTION;

-- First operation
INSERT INTO categories(category_name)
VALUES ('Gaming');

SAVEPOINT category_inserted;

-- Second operation
INSERT INTO categories(category_name)
VALUES ('Office Equipment');

-- Rollback to savepoint
ROLLBACK TO category_inserted;

-- Commit remaining transaction
COMMIT;

-- Verify results
SELECT *
FROM categories;