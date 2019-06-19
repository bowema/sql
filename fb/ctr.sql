-- 1) How would you access the quality of app? Calculate the click through rate.  
SELECT SUM(CASE WHEN event='click' THEN 1 ELSE 0 END)/SUM(CASE WHEN event='imp' THEN 1 ELSE 0 END) AS ctr
FROM log_table;

-- 2) Now do it in for each app.
SELECT app_id, SUM(CASE WHEN event='click' THEN 1 ELSE 0 END)/SUM(CASE WHEN event='imp' THEN 1 ELSE 0 END) AS ctr
FROM log_table
GROUP BY app_id
ORDER BY 2 DESC;