SELECT Tracking.*, Day.user as user_day
	   CASE WHEN Tracking.state IS NULL AND user_day IS NOT NULL THEN 'new'
	   	    WHEN Tracking.state IN ('stayed', 'revived', 'new') AND user_day IS NOT NULL THEN 'stayed'
	   	    WHEN Tracking.state IN ('stayed', 'revived', 'new') AND user_day IS NULL THEN 'churned'
	   	    WHEN Tracking.state IN ('churned') AND user_day IS NULL THEN 'churned'
	   	    WHEN Tracking.state IN ('churned') AND user_day IS NOT NULL THEN 'revived'
	   	    ELSE 'check' END AS state_new
FROM Tracking FULL JOIN Day ON Tracking.user=Day.user;


-- reference:
--https://www.glassdoor.com/Interview/Given-a-table-that-each-day-shows-who-was-active-in-the-system-and-a-table-that-tracks-ongoing-user-status-write-a-procedu-QTN_1627828.htm

