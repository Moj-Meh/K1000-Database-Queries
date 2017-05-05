SELECT T.ID, COUNT(DISTINCT(CLOSED.ID)) AS TIMESCLOSED, COUNT(DISTINCT(REOPENED.ID)) AS TIMESREOPENED, T.TITLE, T.CREATED,
GROUP_CONCAT(DISTINCT(REOPENED.TIMESTAMP)) AS WHENREOPENED,
GROUP_CONCAT(DISTINCT(CLOSED.TIMESTAMP)) AS WHENCLOSED
FROM HD_TICKET T
LEFT JOIN HD_TICKET_CHANGE CLOSED on CLOSED.HD_TICKET_ID = T.ID and CLOSED.DESCRIPTION like '%Changed ticket Status from%to "Closed"%'
LEFT JOIN HD_TICKET_CHANGE REOPENED on REOPENED.HD_TICKET_ID = T.ID and REOPENED.DESCRIPTION like '%Changed ticket Status from "Closed" to%'
GROUP BY T.ID
HAVING TIMESCLOSED > 1
ORDER BY TIMESCLOSED DESC