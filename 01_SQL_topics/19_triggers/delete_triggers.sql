USE nova_retail;

-- =========================================
-- DELETE TRIGGERS
-- =========================================

-- Audit table
CREATE TABLE deleted_customers_log (
    customer_id INT,
    customer_name VARCHAR(100),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER after_customer_delete
AFTER DELETE
ON customers

FOR EACH ROW

BEGIN

    INSERT INTO deleted_customers_log (
        customer_id,
        customer_name
    )

    VALUES (
        OLD.customer_id,
        CONCAT(OLD.first_name, ' ', OLD.last_name)
    );

END $$

DELIMITER ;

-- Example delete
-- DELETE FROM customers WHERE customer_id = 1;