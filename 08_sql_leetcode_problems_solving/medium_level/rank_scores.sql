-- =====================================================
-- LEETCODE 178
-- Rank Scores
-- =====================================================

/*
Question:
Rank scores without gaps.

Table: Scores
*/

SELECT
    score,
    DENSE_RANK() OVER(
        ORDER BY score DESC
    ) AS rank_position
FROM Scores;