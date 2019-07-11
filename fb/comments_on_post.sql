--1) percent of post having at least one comment

SELECT ROUND(SUM(CASE WHEN comment_cnt >= 1 THEN 1 ELSE 0 END)/ COUNT(*)::NUMERIC, 2) AS percent
FROM
	(SELECT a.current_link_id, COUNT(b.data_type) AS comment_cnt
	FROM post a
		LEFT JOIN post b
		ON a.current_link_id = b.previous_link_id
		WHERE a.data_type != 'comment'
	GROUP BY 1) AS InnerQ;

--2) percent of post having at least 5 comments
SELECT SUM(CASE WHEN comment_cnt >= 5 THEN 1 ELSE 0 END)/COUNT(*)::NUMERIC AS percent
FROM (
SELECT a.current_link_id, COUNT(b.data_type) AS comment_cnt
FROM post a
LEFT JOIN post b ON a.current_link_id = b.previous_link_id
WHERE a.data_type != 'comment'
GROUP BY 1) AS InnerQ;