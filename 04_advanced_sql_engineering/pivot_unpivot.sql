USE nova_retail;

-- =========================================
-- PIVOT AND UNPIVOT
-- =========================================

-- Simulated PIVOT using CASE WHEN
SELECT
    payment_method,

    SUM(
        CASE
            WHEN order_status = 'Delivered'
            THEN total_amount
            ELSE 0
        END
    ) AS delivered_revenue,

    SUM(
        CASE
            WHEN order_status = 'Pending'
            THEN total_amount
            ELSE 0
        END
    ) AS pending_revenue

FROM orders
GROUP BY payment_method;

-- Monthly sales pivot
SELECT
    shipping_country,

    SUM(
        CASE
            WHEN MONTH(order_date) = 1
            THEN total_amount
            ELSE 0
        END
    ) AS january_sales,

    SUM(
        CASE
            WHEN MONTH(order_date) = 2
            THEN total_amount
            ELSE 0
        END
    ) AS february_sales

FROM orders
GROUP BY shipping_country;

-- Simulated UNPIVOT
SELECT
    'Delivered Revenue' AS metric,
    SUM(total_amount) AS value
FROM orders
WHERE order_status = 'Delivered'

UNION ALL

SELECT
    'Pending Revenue' AS metric,
    SUM(total_amount) AS value
FROM orders
WHERE order_status = 'Pending';