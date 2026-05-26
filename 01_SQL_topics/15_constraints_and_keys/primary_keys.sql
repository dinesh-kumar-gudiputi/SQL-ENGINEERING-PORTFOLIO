USE nova_retail;

-- =========================================
-- PRIMARY KEYS
-- =========================================

-- Table with primary key
CREATE TABLE customers_pk_demo (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

-- Insert records
INSERT INTO customers_pk_demo
VALUES
(1, 'John Smith', 'Berlin'),
(2, 'Emma Johnson', 'Munich');

-- View data
SELECT *
FROM customers_pk_demo;