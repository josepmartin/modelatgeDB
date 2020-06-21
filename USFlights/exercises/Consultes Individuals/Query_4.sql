SELECT City, colYear, colMonth, AVG(ArrDelay) as 'prom_arribades'
FROM flights
INNER JOIN usairports
ON flights.Origin = usairports.IATA
GROUP BY City, colYear, colMonth;