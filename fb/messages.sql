-- 2)  Write a query for the distribution of number of messages for each user. How the distribution is gonna look like and why? 
-- output 2 columns: X: number of unique messages for each user; Y: number of user with this many messages
SELECT num_msg, COUNT(user_A) AS user_cnt 
FROM 
    (SELECT user_A, SUM(number_messages) AS num_msg
     FROM fb.messages
     GROUP BY user_A, user_B
     UNION ALL
     SELECT user_B, SUM(number_messages) AS num_msg
     FROM fb.messages
     GROUP BY user_B, user_A) AS InnerQ
GROUP BY 1
ORDER BY 1;


-- (3) Write a query find the top partner for each user (most messages)
-- use union all

SELECT user_A, user_B, num_msg
FROM (
    SELECT user_A, user_B, num_msg, ROW_NUMBER() OVER (PARTITION BY user_A ORDER BY num_msg DESC) AS rank
    FROM (
        SELECT user_A, user_B, SUM(number_messages) AS num_msg
        FROM fb.messages
        GROUP BY user_A, user_B
        UNION ALL 
        SELECT user_B, user_A, SUM(number_messages) AS num_msg
        FROM fb.messages
        GROUP BY user_B, user_A
        ) InnerQ
     ) InnerQ2
WHERE rank=1
;