
/*************************
Question 3:
The Management Team wants to identify users with irregular login patterns.
To support this analysis, provide a report showing:

The list of user IDs who logged in during December 2025

Exclude any users who also logged in during September 2025
Finally, order the results by user ID in ascending order.
**********************/
Select * from logins
where login_timestamp between '2025-12-01' and '2025-12-31' 
and user_id not in (Select user_id from logins
where login_timestamp between '2025-09-01' and '2025-09-30' )
-- 3,4,5,9, 10
-- 4,5