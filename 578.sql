-- 578. Get Highest Answer Rate Question
-- Define answer rate = answer times/ show times per question

-- -----------------------------------------------------
-- Approach 1 Using sub-quesry and SUM() function
-- -----------------------------------------------------
SELECT question_id AS survey_log
FROM 
    (SELECT question_id,
            SUM(CASE WHEN action='answer' THEN 1 ELSE 0 END)
            /
            SUM(CASE WHEN action='show' THEN 1 ELSE 0 END) AS rate
    FROM fb.survey_log
    GROUP BY question_id
    ) t
ORDER BY rate DESC
LIMIT 1;


-- -----------------------------------------------------
-- or can also get the result by creating two columns then 
-- order by the division (answer rate) of the two columns
-- -----------------------------------------------------
SELECT question_id as survey_log
FROM
(
    SELECT question_id,
        SUM(case when action='answer' THEN 1 ELSE 0 END) as num_answer,
        SUM(case when action='show' THEN 1 ELSE 0 END) as num_show 
    FROM fb.survey_log
    GROUP BY question_id
) as t
ORDER BY (num_answer / num_show) DESC
LIMIT 1

