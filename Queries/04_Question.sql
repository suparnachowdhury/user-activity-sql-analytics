/*************************
Question 4:
The Management Team wants to identify the top-performing user for each day based on session activity.
To support this analysis, provide a report showing:
- The calendar date of activity
- The user ID with the highest session score on that date
- The corresponding maximum session score for that day

If multiple users share the same highest session score on a given day, include all such users.
**********************/

with session_scores as (
select 
	cast(login_timestamp as date) as date
    , user_id
    , sum(session_score) as session_score
from logins
group by 
cast(login_timestamp as date) 
    , user_id)
    select * from (
    select date, user_id,session_score, row_number() over(partition by date order by session_score desc) as rn
    from session_scores) a 
    where rn =1;