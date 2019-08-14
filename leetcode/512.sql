
-- method 1
SELECT player_id, device_id
FROM activity
WHERE (player_id, event_date) IN (SELECT player_id, min(event_date)
								  FROM activity
								  GROUP BY 1);


-- method 2
SELECT DISTINCT player_id, DISTINCT device_id
FROM (SELECT player)id, FIRST_VALUE(device_id) OVER (PARTITION BY player_id
													 ORDER BY event_date ASC)
	  FROM activity) AS InnerQ;