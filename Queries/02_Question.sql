/*****************
Question : 2
The Management Team wants to perform a quarterly analysis of user activity.
To support this analysis, provide a report showing:
The first day of each quarter
Total number of unique users (user_cnt) who logged in during that quarter
Total number of sessions (session_cnt) during that quarter
Finally, order the results by quarter from newest to oldest.
*************************/

-- Quarterly analysis of user activity
SELECT
    DATE_FORMAT(LOGIN_TIMESTAMP, '%Y-%m-01') - INTERVAL (MONTH(LOGIN_TIMESTAMP)-1) % 3 MONTH AS QUARTER_START,
    COUNT(DISTINCT USER_ID) AS user_cnt,
    COUNT(SESSION_ID) AS session_cnt
FROM logins
GROUP BY QUARTER_START
ORDER BY QUARTER_START DESC;
