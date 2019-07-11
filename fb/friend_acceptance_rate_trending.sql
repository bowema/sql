# friend acceptance rate trending

# 1. Assume acceptance is valid if accpeted within 24 hours. We also assume trending means daily acceptance rate.

# 2. SQL query
SELECT sent.datetime, 
       SUM(CASE WHEN request_accepted='accepted' THEN 1 ELSE 0 END)/COUNT(*)::FLOAT AS daily_accept_rate
FROM 
    (SELECT datetime, action AS request_sent, actor_id, target_id
    FROM fb.friend 
    WHERE action = 'sent') AS sent
    LEFT JOIN 
    (SELECT datetime, action AS request_accepted, actor_id, target_id
    FROM fb.friend
    WHERE action != 'sent') AS accepted
    ON sent.datetime = accepted.datetime AND 
       sent.actor_id = accepted.target_id AND
       sent.target_id = accepted.actor_id
GROUP BY sent.datetime
;