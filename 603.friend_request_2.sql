-- 602. Friend Requests II: Who Has Most Friend? 

SELECT ids AS id, num 
FROM 
(
    SELECT ids, COUNT(*) AS num
    FROM
    (   SELECT requester_id AS ids FROM fb.request_accepted2
        UNION ALL 
        SELECT accepter_id FROM fb.request_accepted2) a
    GROUP BY ids
) AS b
ORDER BY num DESC
LIMIT 1
;

-- Follow-up:
-- In the real world, multiple people could have the same most number of friends, can you find all these people in this case?
