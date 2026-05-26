USE nova_retail;

-- =========================================
-- CONDITIONAL AGGREGATIONS
-- =========================================

-- Count delivered and pending orders
SELECT
    COUNT(
        CASE
            WHEN order_status = 'Delivered' THEN 1
        END
    ) AS delivered_orders,

    COUNT(
        CASE
            WHEN order_status = 'Pending' THEN 1
        END
    ) AS pending_orders
FROM orders;

-- Revenue by order type
SELECT
    SUM(
        CASE
            WHEN total_amount > 1000 THEN total_amount
            ELSE 0
        END
    ) AS high_value_revenue,

    SUM(
        CASE
            WHEN total_amount <= 1000 THEN total_amount
            ELSE 0
        END
    ) AS regular_revenue
FROM orders;

-- Products by stock condition
SELECT
    COUNT(
        CASE
            WHEN stock_quantity < 50 THEN 1
        END
    ) AS low_stock_products
FROM products;