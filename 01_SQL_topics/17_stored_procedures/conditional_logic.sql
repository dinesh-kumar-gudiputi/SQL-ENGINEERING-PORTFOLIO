USE nova_retail;

-- =========================================
-- CONDITIONAL LOGIC IN PROCEDURES
-- =========================================

DELIMITER $$

CREATE PROCEDURE classify_order(
    IN input_order_amount DECIMAL(10,2)
)
BEGIN

    IF input_order_amount > 1000 THEN

        SELECT 'High Value Order' AS order_category;

    ELSEIF input_order_amount >= 500 THEN

        SELECT 'Medium Value Order' AS order_category;

    ELSE

        SELECT 'Low Value Order' AS order_category;

    END IF;

END $$

DELIMITER ;

-- Execute procedure
CALL classify_order(1500);

CALL classify_order(700);

CALL classify_order(200);