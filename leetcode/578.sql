-- CREATE TABLE lc.survey_log (
--     uid     INT, 
--     action  VARCHAR, 
--     question_id INT, 
--     answer_id   INT, 
--     q_num   INT, 
--     timestamp   INT
-- );

-- INSERT INTO lc.survey_log VALUES (5, 'show', 285, null, 1, 123);
-- INSERT INTO lc.survey_log VALUES (5, 'answer', 285, 124124, 1, 124);
-- INSERT INTO lc.survey_log VALUES (5, 'show', 369, null, 2, 125);
-- INSERT INTO lc.survey_log VALUES (5, 'skip', 369, null, 2, 126);

-- SELECT * FROM lc.survey_log;


-- alternative 1
SELECT t1.question_id AS survey_log
FROM
	(SELECT * 
	FROM lc.survey_log
	WHERE action = 'show') t1
	LEFT JOIN
	(SELECT *
	FROM lc.survey_log
	WHERE action != 'show') t2
	ON t1.uid = t2.uid AND t1.question_id = t2.question_id
GROUP BY t1.question_id
ORDER BY SUM(CASE WHEN t2.action = 'answer' THEN 1 ELSE 0 END) / COUNT(t1.action) DESC
LIMIT 1;


-- alternative 2
SELECT question_id AS survey_log
FROM (
SELECT question_id,
        SUM(CASE WHEN action='answer' THEN 1 ELSE 0 END) AS num_answer,
        SUM(CASE WHEN action='show' THEN 1 ELSE 0 END) AS num_show
FROM lc.survey_log
GROUP BY 1) AS innerQ
ORDER BY num_answer/num_show DESC
LIMIT 1
;


-- alternative 3
SELECT 
    question_id AS 'survey_log'
FROM
    survey_log
GROUP BY question_id
ORDER BY COUNT(answer_id) / COUNT(IF(action = 'show', 1, 0)) DESC
LIMIT 1;
