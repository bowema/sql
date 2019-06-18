# Recommend pages your friends liked

You have two tables  
 - the first table has data about the users and their friends  
 - the second table has data about the users and the pages they have liked
 
 TABLE1: Friends {user_id, friend_id}  
 TABLE2: Page {user_id, page_id}  
 
Write an SQL query to make recommendations using pages that your friends liked. The query result should not recommend the pages that have already been liked by a user.