-- =====================================================
-- LEETCODE 197
-- Rising Temperature
-- =====================================================

/*
Question:
Find dates where temperature is higher than previous day.

Table: Weather
*/

SELECT
    w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;