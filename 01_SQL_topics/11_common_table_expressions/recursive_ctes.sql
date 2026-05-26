USE nova_retail;

-- =========================================
-- RECURSIVE CTE
-- =========================================

WITH RECURSIVE numbers AS
(
    SELECT 1 AS num

    UNION ALL

    SELECT num + 1
    FROM numbers
    WHERE num < 10
)

SELECT *
FROM numbers;

-- Factorial style sequence
WITH RECURSIVE sequence_cte AS
(
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM sequence_cte
    WHERE n < 5
)

SELECT *
FROM sequence_cte;