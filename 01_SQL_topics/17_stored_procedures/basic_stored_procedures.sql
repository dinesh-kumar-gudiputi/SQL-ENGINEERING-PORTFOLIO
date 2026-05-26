USE nova_retail;

-- =========================================
-- BASIC STORED PROCEDURES
-- =========================================

DELIMITER $$

CREATE PROCEDURE get_all_customers()
BEGIN

    SELECT *
    FROM customers;

END $$

DELIMITER ;

-- Execute procedure
CALL get_all_customers();

-- Product procedure
DELIMITER $$

CREATE PROCEDURE get_all_products()
BEGIN

    SELECT *
    FROM products;

END $$

DELIMITER ;

CALL get_all_products();