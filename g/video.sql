-- CREATE SCHEMA IF NOT EXISTS gg;
-- ​
-- CREATE TABLE gg.video_a (
--     video_id    VARCHAR,
--     video_name  VARCHAR
-- );
-- ​
-- INSERT INTO gg.video_a VALUES ('1', 'Star War');
-- INSERT INTO gg.video_a VALUES ('2', 'Harry Potter');
-- INSERT INTO gg.video_a VALUES ('3', 'Avengers');
-- ​
-- CREATE TABLE IF NOT EXISTS gg.video_b (
--     date          DATE,
--     video_id      VARCHAR,
--     played_number INT
-- );
-- ​
-- INSERT INTO gg.video_b VALUES ('2019-08-01', '1', 50);
-- INSERT INTO gg.video_b VALUES ('2019-08-01', '2', 10);
-- INSERT INTO gg.video_b VALUES ('2019-08-02', '1', 10);
-- INSERT INTO gg.video_b VALUES ('2019-08-02', '2', 50);
-- INSERT INTO gg.video_b VALUES ('2019-08-02', '3', 10);
-- INSERT INTO gg.video_b VALUES ('2019-08-03', '1', 500);
-- INSERT INTO gg.video_b VALUES ('2019-08-03', '2', 500);
-- INSERT INTO gg.video_b VALUES ('2019-08-03', '3', 10);


SELECT video_name FROM
(
SELECT video_name, SUM(played_number) AS num
FROM gg.video_a
LEFT JOIN gg.video_b USING (video_id)
GROUP BY 1) AS INNERQ
WHERE num IN (
    SELECT max(num)
    FROM 
        (SELECT video_name, SUM(played_number) AS num
         FROM gg.video_a
         LEFT JOIN gg.video_b USING (video_id)
         GROUP BY 1) AS innerq2)
;