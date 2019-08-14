SELECT player_id, min(event_date) AS first_login
FROM activity
GROUP BY 1;

# https://zqt0.gitbook.io/leetcode/sql/511.-game-play-analysisi-jian-dan