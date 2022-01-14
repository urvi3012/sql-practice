-- Finding User Purchases
-- Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.

WITH CTE AS(
SELECT *,
DATEDIFF(LEAD(CREATED_AT,1) OVER(PARTITION BY USER_ID ORDER BY CREATED_AT),CREATED_AT) AS DATE_DIFFERANCE
FROM AMAZON_TRANSACTIONS
ORDER BY USER_ID)

SELECT DISTINCT user_id FROM CTE
WHERE date_differance<=7