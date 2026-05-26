USE nova_retail;

-- =========================================
-- INCREMENTAL LOADING
-- =========================================

-- Target table
CREATE TABLE incremental_orders (

    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================
-- INITIAL LOAD
-- =========================================

INSERT INTO incremental_orders (
    order_id,
    customer_id,
    order_date,
    total_amount
)

SELECT
    order_id,
    customer_id,
    order_date,
    total_amount
FROM orders
WHERE order_date <= '2025-01-31';

-- View initial load
SELECT *
FROM incremental_orders;

-- =========================================
-- INCREMENTAL LOAD
-- =========================================

INSERT INTO incremental_orders (
    order_id,
    customer_id,
    order_date,
    total_amount
)

SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount

FROM orders o

LEFT JOIN incremental_orders io
ON o.order_id = io.order_id

WHERE io.order_id IS NULL;

-- =========================================
-- VERIFY INCREMENTAL LOAD
-- =========================================

SELECT *
FROM incremental_orders
ORDER BY order_date;