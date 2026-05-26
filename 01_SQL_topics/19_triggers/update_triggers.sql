USE nova_retail;

-- =========================================
-- UPDATE TRIGGERS
-- =========================================

-- Audit table
CREATE TABLE product_price_audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER after_product_price_update
AFTER UPDATE
ON products

FOR EACH ROW

BEGIN

    IF OLD.price <> NEW.price THEN

        INSERT INTO product_price_audit(
            product_id,
            old_price,
            new_price
        )

        VALUES(
            NEW.product_id,
            OLD.price,
            NEW.price
        );

    END IF;

END $$

DELIMITER ;

-- Example update
/*
UPDATE products
SET price = 1500
WHERE product_id = 1;
*/