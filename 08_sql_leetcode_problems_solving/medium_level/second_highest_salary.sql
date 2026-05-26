-- =====================================================
-- LEETCODE 176
-- Second Highest Salary
-- =====================================================

/*
Question:
Find second highest salary.

Table: Employee
*/

SELECT
    (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1
    ) AS SecondHighestSalary;