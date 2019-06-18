SELECT DISTINCT user_id, page_id
FROM 
    (SELECT f.user_id, friend_id, page_id FROM fb.friends f
     LEFT JOIN fb.page p ON f.friend_id = p.user_id) t1
WHERE (user_id, page_id) NOT IN
    (SELECT user_id, page_id FROM fb.friends
     LEFT JOIN fb.page USING (user_id))
;
