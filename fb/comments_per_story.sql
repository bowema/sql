-- Comments per story
-- Don't overcomplicate this problem. Use a left join to add comment info to each story, then filter out comments, 
-- lastly group by unique story (assume content_id is unique per story) and count number of target_id's which is number of comments.

SELECT t1.content_id, COUNT(t2.target_id)
FROM fb.content_actions t1 
LEFT JOIN fb.content_actions t2 ON t1.content_id = t2.target_id
WHERE t1.content_type != 'comment'
GROUP BY t1.content_id;