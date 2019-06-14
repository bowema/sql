-- 597. Friend Requests I: Overall Acceptance Rate (fb)
-- -----------------------------------------------------
-- Method 1
-- -----------------------------------------------------
SELECT
ROUND(
	IFNULL(
	(SELECT COUNT(*) FROM (SELECT DISTINCT requester_id, accepter_id FROM request_accepted) AS a)
	/
	(SELECT COUNT(*) FROM (SELECT DISTINCT sender_id, send_to_id FROM friend_request) AS b),
	0)
, 2) AS accpet_rate;


-- -----------------------------------------------------
-- Method 2
-- -----------------------------------------------------
SELECT COALESCE(ROUND(
	   			COUNT(DISTINCT requester_id, accepter_id)
	   			/
	   			COUNT(DISTINCT sender_id, send_to_id),2),0) AS accept_rate
FROM request_accepted, friend_request;


-- Follow up 1: Can you write a query to return the accept rate but for every month?
-- note this solution in PostgreSQL
SELECT CASE WHEN request.request_num = 0 THEN 0
            ELSE ROUND(accept.accept_num::NUMERIC/request.request_num,2) END AS accept_rate,
        accept.month
FROM (SELECT COUNT(DISTINCT (requester_id, accepter_id)) AS accept_num, 
             DATE_PART('month', accept_date) AS month
      FROM fb.request_accepted
      GROUP BY month) accept,
      
      (SELECT COUNT(DISTINCT (sender_id, send_to_id)) AS request_num,
              DATE_PART('month', request_date) AS month
       FROM fb.friend_request
       GROUP BY month) request
WHERE accept.month=request.month;


-- Follow up 2: How about the cumulative accept rate for every day?


