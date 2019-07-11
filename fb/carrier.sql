-- Warm up: How many requests fb sent to each carrier yesterday?
SELECT carrier, COUNT(*)
FROM sms_send
GROUP BY 1
WHERE ds = DATE(CURRENT_DATE - INTERVAL 1 'DAY');

-- Q1: If the confirmation rate decreased by x%, what might be the reason?
It might be carrier issue, people churn to other competitors, seasonality effect (holidays people use less of our app). 

-- Q2: Assume the number of messages FB sent don’t change, but confirmation rate decreased by x%, why?

-- Q3: Assume carrier is the reason for confirmation decrease, how to find which carrier? (sql)
SELECT s.carrier, SUM( CASE WHEN c.phone IS NULL THEN 1 ELSE 0 END)/SUM(*) AS no_resp_rate
FROM
	(SELECT * FROM 
	 	(SELECT * FROM sms_send
	 	 WHERE event_type = 'confirm') AS s
     LEFT JOIN confirmation c
     ON s.ds = c.ds AND s.phone_number = c.phone) InnerQ
GROUP BY 1
ORDER BY 2 DESC;

-- Q4: If multiple carrier are down at the same time, FB needs to contact 5, how to choose?
-- choose top 5 from the query result above