-- CREATE SCHEMA lc;

-- DROP TABLE lc.game;

-- CREATE TABLE lc.activity (
--     player_id  INT
--     , device_id INT
--     , event_date DATE
--     , games_played INT
-- );

-- INSERT INTO lc.activity VALUES (1,2, '2016-03-01',5);
-- INSERT INTO lc.activity VALUES (1,2, '2016-05-02',6);
-- INSERT INTO lc.activity VALUES (1,3, '2017-06-25',1);
-- INSERT INTO lc.activity VALUES (3,1, '2016-03-02',0);
-- INSERT INTO lc.activity VALUES (3,4, '2018-07-03',5);

-- alternative 1 - analytic function
SELECT player_id, 
	   event_date, 
       SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date ASC) AS games_played_so_far
FROM lc.game;


-- alternative 2 - using joins
SELECT a.player_id, 
       a.event_date,
       SUM(b.games_played) AS games_played_so_far
FROM lc.activity a LEFT JOIN lc.activity b ON
    a.player_id = b.player_id AND
    a.event_date >= b.event_date
GROUP BY 1, 2
ORDER BY 1, 2;
-- https://zqt0.gitbook.io/leetcode/sql/534.-game-play-analysis-iii-zhong-deng