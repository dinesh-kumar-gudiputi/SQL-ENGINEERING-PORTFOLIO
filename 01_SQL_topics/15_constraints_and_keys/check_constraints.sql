USE nova_retail;

-- =========================================
-- CHECK CONSTRAINTS
-- =========================================

-- Create table with check constraints
CREATE TABLE product_constraints_demo (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT,

    CONSTRAINT chk_price
    CHECK(price > 0),

    CONSTRAINT chk_stock
    CHECK(stock_quantity >= 0)
);

-- Valid insert
INSERT INTO product_constraints_demo
VALUES (1, 'Laptop', 1200, 50);

-- View data
SELECT *
FROM product_constraints_demo;