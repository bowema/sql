# Friend acceptance rate trending

TABLE Friend: {datetime | action: ('request_sent', 'request_accepted') | actor_id | target_id}
Find friend acceptance rate trending
1. Define how long you have to wait before a friend request is considered rejected (e.g. 1 week)
2. Here a user may send multiple request to a same user at different time

Note: different version of LeetCode #597