/******************
Question: 1
The Management Team wants to identify users who have not logged in during the past five months.
To support this analysis, provide a report showing:
USER_ID
USER_NAME
USER_STATUS
Last login timestamp (if any)
Include only users who have not logged in in the past five months.
Finally, order the results by USER_STATUS ascending, then USER_NAME ascending.
******************/

SELECT 
    u.USER_ID,
    u.USER_NAME,
    u.USER_STATUS,
    MAX(l.LOGIN_TIMESTAMP) AS LAST_LOGIN
FROM users u
LEFT JOIN logins l
    ON u.USER_ID = l.USER_ID
GROUP BY 
    u.USER_ID,
    u.USER_NAME,
    u.USER_STATUS
HAVING 
    MAX(l.LOGIN_TIMESTAMP) < DATE_ADD(CURRENT_DATE, INTERVAL -5 MONTH)
    OR MAX(l.LOGIN_TIMESTAMP) IS NULL
ORDER BY 
    u.USER_STATUS ASC,
    u.USER_NAME ASC;
