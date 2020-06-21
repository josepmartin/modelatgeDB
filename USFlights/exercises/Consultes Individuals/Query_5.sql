SELECT UniqueCarrier, colYear, colMonth, sum(Cancelled) as 'total_cancelled'
FROM flights
GROUP BY UniqueCarrier, colYear, colMonth
HAVING sum(Cancelled) > 0
ORDER BY total_cancelled DESC;