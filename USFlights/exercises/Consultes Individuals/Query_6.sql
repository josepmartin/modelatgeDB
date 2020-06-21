SELECT TailNum, SUM(Distance) AS 'total_distance'
FROM flights
WHERE TailNum <>""
GROUP BY TailNum
ORDER BY sum(Distance) DESC
LIMIT 10;