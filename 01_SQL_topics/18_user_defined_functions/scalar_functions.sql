USE nova_retail;

-- =========================================
-- SCALAR FUNCTIONS
-- =========================================

DELIMITER $$

CREATE FUNCTION calculate_profit(
    selling_price DECIMAL(10,2),
    cost_price DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

    RETURN selling_price - cost_price;

END $$

DELIMITER ;

-- Execute function
SELECT
    product_name,
    price,
    cost,
    calculate_profit(price, cost) AS profit
FROM products;

-- Tax calculation function
DELIMITER $$

CREATE FUNCTION calculate_tax(
    amount DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

    RETURN amount * 0.18;

END $$

DELIMITER ;

SELECT
    order_id,
    total_amount,
    calculate_tax(total_amount) AS tax_amount
FROM orders;