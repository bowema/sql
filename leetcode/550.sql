SELECT ROUND(COUNT(DISTINCT CASE WHEN b.event_date IS NOT NULL THEN a.player_id ELSE null END)::numeric
       /
       COUNT(DISTINCT a.player_id), 2)
FROM lc.activity_550 a
LEFT JOIN lc.activity_550 b
ON a.player_id = b.player_id AND
   a.event_date = b.event_date - 1;


-- https://zqt0.gitbook.io/leetcode/sql/550.-game-play-analysis-iv-zhong-deng