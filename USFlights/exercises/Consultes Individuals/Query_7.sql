SELECT UniqueCarrier, AVG(ArrDelay) as 'avgDelay'
FROM flights
GROUP BY UniqueCarrier
HAVING avgDelay > 10
ORDER BY avgDelay DESC;