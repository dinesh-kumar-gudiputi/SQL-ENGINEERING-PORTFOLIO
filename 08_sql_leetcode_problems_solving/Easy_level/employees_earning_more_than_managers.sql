-- =====================================================
-- LEETCODE 181
-- Employees Earning More Than Their Managers
-- =====================================================

/*
Question:
Find employees who earn more than their managers.

Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
*/

SELECT
    e1.name AS Employee
FROM Employee e1
JOIN Employee e2
ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;