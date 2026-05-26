USE nova_retail;

-- =========================================
-- RANK AND DENSE_RANK
-- =========================================

SELECT
    product_name,
    price,

    RANK()
    OVER(ORDER BY price DESC) AS product_rank,

    DENSE_RANK()
    OVER(ORDER BY price DESC) AS dense_product_rank

FROM products;

-- Customer revenue ranking
SELECT
    customer_id,
    total_amount,

    RANK()
    OVER(ORDER BY total_amount DESC) AS customer_rank

FROM orders;