USE nova_retail;

-- =========================================
-- NESTED CASE WHEN
-- =========================================

-- Advanced product categorization
SELECT
    product_name,
    price,
    stock_quantity,

    CASE
        WHEN price >= 1000 THEN
            CASE
                WHEN stock_quantity < 20 THEN 'Premium Low Stock'
                ELSE 'Premium In Stock'
            END

        WHEN price >= 500 THEN
            CASE
                WHEN stock_quantity < 20 THEN 'Mid Range Low Stock'
                ELSE 'Mid Range In Stock'
            END

        ELSE 'Budget Product'
    END AS product_status

FROM products;

-- Order risk classification
SELECT
    order_id,
    total_amount,
    payment_method,

    CASE
        WHEN total_amount > 1000 THEN
            CASE
                WHEN payment_method = 'Credit Card' THEN 'Priority Order'
                ELSE 'Manual Review'
            END

        ELSE 'Normal Order'
    END AS order_priority

FROM orders;