USE nova_retail;

-- =========================================
-- DYNAMIC SQL
-- =========================================

-- Dynamic table query
SET @table_name = 'customers';

SET @sql_query = CONCAT(
    'SELECT * FROM ',
    @table_name,
    ' LIMIT 5'
);

PREPARE dynamic_statement FROM @sql_query;

EXECUTE dynamic_statement;

DEALLOCATE PREPARE dynamic_statement;

-- Dynamic filtering query
SET @city_name = 'Berlin';

SET @customer_query = CONCAT(
    'SELECT * FROM customers WHERE city = "',
    @city_name,
    '"'
);

PREPARE customer_statement FROM @customer_query;

EXECUTE customer_statement;

DEALLOCATE PREPARE customer_statement;

-- Dynamic aggregation query
SET @aggregation_query = '
SELECT
    payment_method,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY payment_method
';

PREPARE revenue_statement FROM @aggregation_query;

EXECUTE revenue_statement;

DEALLOCATE PREPARE revenue_statement;