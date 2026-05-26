USE nova_retail;

-- =========================================
-- TABLE VALUED FUNCTION STYLE
-- =========================================
-- MySQL does not support table-valued functions directly.
-- We simulate using views and procedures.

-- Create reusable view
CREATE VIEW high_value_customers AS
SELECT
    customer_id,
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 1000;

-- Query reusable dataset
SELECT *
FROM high_value_customers;

-- Procedure returning table-like result
DELIMITER $$

CREATE PROCEDURE get_high_value_orders()
BEGIN

    SELECT
        order_id,
        customer_id,
        total_amount
    FROM orders
    WHERE total_amount > 1000;

END $$

DELIMITER ;

CALL get_high_value_orders();