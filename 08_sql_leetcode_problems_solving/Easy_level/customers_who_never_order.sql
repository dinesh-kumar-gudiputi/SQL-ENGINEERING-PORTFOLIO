-- =====================================================
-- LEETCODE 183
-- Customers Who Never Order
-- =====================================================

/*
Question:
Find customers who never placed any order.

Tables:
Customers
Orders
*/

SELECT
    c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.id IS NULL;