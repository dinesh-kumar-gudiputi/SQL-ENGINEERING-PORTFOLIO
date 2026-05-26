USE nova_retail;

-- =========================================
-- DUPLICATE HANDLING
-- =========================================

-- Create duplicate demo table
CREATE TABLE customers_duplicates AS
SELECT *
FROM customers;

-- Insert duplicate rows
INSERT INTO customers_duplicates
SELECT *
FROM customers
WHERE customer_id <= 2;

-- View duplicates
SELECT *
FROM customers_duplicates;

-- Identify duplicates using GROUP BY
SELECT
    email,
    COUNT(*) AS duplicate_count
FROM customers_duplicates
GROUP BY email
HAVING COUNT(*) > 1;

-- Identify duplicate customer names
SELECT
    first_name,
    last_name,
    COUNT(*) AS duplicate_count
FROM customers_duplicates
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

-- Remove duplicates using ROW_NUMBER()
WITH duplicate_cte AS
(
    SELECT
        *,
        ROW_NUMBER()
        OVER(
            PARTITION BY email
            ORDER BY customer_id
        ) AS row_num
    FROM customers_duplicates
)

SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- Final cleaned result preview
WITH cleaned_customers AS
(
    SELECT
        *,
        ROW_NUMBER()
        OVER(
            PARTITION BY email
            ORDER BY customer_id
        ) AS row_num
    FROM customers_duplicates
)

SELECT *
FROM cleaned_customers
WHERE row_num = 1;