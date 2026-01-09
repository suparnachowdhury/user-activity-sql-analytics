/*************************
Question 5:
The Management Team wants to identify the most engaged (best) customers based on consistent platform usage.
To support this analysis, provide a report showing:

The user IDs of customers who have logged in on every single calendar day
Starting from their first recorded login date
Up to the most recent login date available in the data

Only include users with no missing login days within their active period.
**********************/
with login_dates as(
select user_id, cast(login_timestamp as date) as date
from logins)
select user_id, datediff(max(date), min(date))+ 1 as total_days,
count(*) as login_days
from login_dates
group by user_id