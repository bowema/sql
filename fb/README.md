# User status

Given a table that each day shows who was active in the  system and a table that tracks ongoing user status, write a procedure that will take each day's active table and pass it into the ongoing daily tracking table. Possible states are: 
* user stayed (yesterday yes, today yes) 
* user churned (yesterday yes, today no) 
* user revived (yesterday no, today yes) 
* user new (yesterday null, today yes) 
Note: you'll want to spot and account for the undefined state.