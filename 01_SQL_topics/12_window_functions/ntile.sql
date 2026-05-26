USE nova_retail;

-- =========================================
-- NTILE
-- =========================================

SELECT
    customer_id,
    total_amount,

    NTILE(4)
    OVER(ORDER BY total_amount DESC) AS revenue_quartile

FROM orders;

-- Product pricing quartiles
SELECT
    product_name,
    price,

    NTILE(3)
    OVER(ORDER BY price DESC) AS pricing_segment

FROM products;