USE nova_retail;

-- =========================================
-- INSERT TRIGGERS
-- =========================================

-- Audit table
CREATE TABLE order_insert_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER after_order_insert
AFTER INSERT
ON orders

FOR EACH ROW

BEGIN

    INSERT INTO order_insert_log(order_id)
    VALUES(NEW.order_id);

END $$

DELIMITER ;

-- Example insert
/*
INSERT INTO orders (
    customer_id,
    order_date,
    order_status,
    shipping_city,
    shipping_country,
    payment_method,
    total_amount
)
VALUES
(1, CURRENT_DATE(), 'Pending', 'Berlin', 'Germany', 'PayPal', 500);
*/