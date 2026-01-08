/*****************
Question : 2
The Management Team wants to perform a quarterly analysis of user activity.
To support this analysis, provide a report showing:
- The first day of each quarter
- Total number of unique users (user_cnt) who logged in during that quarter
- Total number of sessions (session_cnt) during that quarter
- Total number of session in previous quarter
- Percent change in sessions from the last quarter
Finally, order the results by quarter from newest to oldest.
*************************/

-- Quarterly analysis of user activity
WITH quarter_logins AS (
SELECT 
    MAKEDATE(YEAR(LOGIN_TIMESTAMP), 1) + INTERVAL (QUARTER(LOGIN_TIMESTAMP) - 1) * 3 MONTH AS quarter_start,
    COUNT(DISTINCT USER_ID) AS user_cnt,
    COUNT(SESSION_ID) AS session_cnt
    FROM logins
GROUP BY 1) 
SELECT quarter_start, user_cnt, session_cnt,
    LAG(session_cnt,1,0) OVER(ORDER BY quarter_start) AS prev_session_cnt,
    (session_cnt - LAG(session_cnt,1,0) OVER(ORDER BY quarter_start))* 100.0 / 
    LAG(session_cnt,1,0) OVER(ORDER BY quarter_start)AS percent_change_sessions
FROM quarter_logins
ORDER BY 1;
