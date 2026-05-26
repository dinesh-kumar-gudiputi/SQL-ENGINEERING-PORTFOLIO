USE nova_retail;

-- =========================================
-- NAMING CONVENTIONS
-- =========================================

-- GOOD TABLE NAMES
-- customers
-- order_items
-- product_inventory

-- GOOD COLUMN NAMES
-- customer_id
-- order_date
-- total_amount

-- GOOD INDEX NAMES
-- idx_customer_email
-- idx_order_date

-- GOOD PROCEDURE NAMES
-- get_customer_orders
-- calculate_revenue

-- GOOD FUNCTION NAMES
-- calculate_profit
-- calculate_tax

-- Example query
SELECT
    customer_id,
    first_name,
    last_name
FROM customers;