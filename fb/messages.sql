-- (3) Write a query find the top partner for each user (most messages)

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