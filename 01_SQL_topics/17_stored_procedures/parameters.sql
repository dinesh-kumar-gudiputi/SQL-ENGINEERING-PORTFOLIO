USE nova_retail;

-- =========================================
-- STORED PROCEDURES WITH PARAMETERS
-- =========================================

DELIMITER $$

CREATE PROCEDURE get_customer_orders(
    IN input_customer_id INT
)
BEGIN

    SELECT
        order_id,
        order_date,
        total_amount
    FROM orders
    WHERE customer_id = input_customer_id;

END $$

DELIMITER ;

-- Execute procedure
CALL get_customer_orders(1);

-- Product search procedure
DELIMITER $$

CREATE PROCEDURE get_products_by_brand(
    IN input_brand VARCHAR(50)
)
BEGIN

    SELECT *
    FROM products
    WHERE brand = input_brand;

END $$

DELIMITER ;

CALL get_products_by_brand('Apple');