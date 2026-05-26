-- =====================================================
-- LEETCODE 569
-- Median Employee Salary
-- =====================================================

/*
Question:
Find median employee salary by company.
*/

WITH ranked_salaries AS
(
    SELECT
        *,
        ROW_NUMBER() OVER(
            PARTITION BY company
            ORDER BY salary
        ) AS row_num,

        COUNT(*) OVER(
            PARTITION BY company
        ) AS total_rows

    FROM Employee
)

SELECT
    company,
    salary
FROM ranked_salaries

WHERE row_num BETWEEN total_rows / 2.0
AND total_rows / 2.0 + 1;