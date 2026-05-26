USE nova_retail;

-- =========================================
-- MERGE / UPSERT OPERATIONS
-- =========================================

-- Target table
CREATE TABLE customer_summary (

    customer_id INT PRIMARY KEY,
    total_orders INT,
    total_spent DECIMAL(10,2)
);

-- =========================================
-- INITIAL LOAD
-- =========================================

INSERT INTO customer_summary (

    customer_id,
    total_orders,
    total_spent

)

SELECT
    customer_id,
    COUNT(order_id),
    SUM(total_amount)

FROM orders

GROUP BY customer_id;

-- View initial data
SELECT *
FROM customer_summary;

-- =========================================
-- UPSERT USING INSERT ... ON DUPLICATE KEY
-- =========================================

INSERT INTO customer_summary (

    customer_id,
    total_orders,
    total_spent

)

SELECT
    customer_id,
    COUNT(order_id),
    SUM(total_amount)

FROM orders

GROUP BY customer_id

ON DUPLICATE KEY UPDATE

    total_orders = VALUES(total_orders),
    total_spent = VALUES(total_spent);

-- =========================================
-- VERIFY UPSERT
-- =========================================

SELECT *
FROM customer_summary
ORDER BY total_spent DESC;

-- =========================================
-- HIGH VALUE CUSTOMERS
-- =========================================

SELECT *
FROM customer_summary
WHERE total_spent > 1000;