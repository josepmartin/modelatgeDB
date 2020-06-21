# Exercici 1
select count(*) from flights;

# Exercici 2
SELECT Origin, AVG(ArrDelay) as 'prom_arribades', AVG(DepDelay) as 'prom_sortides' 
FROM flights
GROUP BY Origin;

# Exercici 3
SELECT Origin, colYear, colMonth, AVG(ArrDelay) as 'prom_arribades'
FROM flights
GROUP BY Origin, colYear, colMonth;

# Exercici 4 - Utilitzant INNER JOIN
SELECT City, colYear, colMonth, AVG(ArrDelay) as 'prom_arribades'
FROM flights
INNER JOIN usairports
ON flights.Origin = usairports.IATA
GROUP BY City, colYear, colMonth;

# Exercici 4 - Alternativa
SELECT City, colYear, colMonth, AVG(`ArrDelay`) AS "prom_arribades" 
FROM flights, usairports 
WHERE Origin = IATA
GROUP BY City, colYear, colMonth;

#Exercici 5
SELECT UniqueCarrier, colYear, colMonth, sum(Cancelled) as 'total_cancelled'
FROM flights
GROUP BY UniqueCarrier, colYear, colMonth
HAVING sum(Cancelled) > 0
ORDER BY total_cancelled DESC;

# Exercici 6
SELECT TailNum, SUM(Distance) AS 'total_distance'
FROM flights
WHERE TailNum <>""
GROUP BY TailNum
ORDER BY sum(Distance) DESC
LIMIT 10;

# Exercici 7
SELECT UniqueCarrier, AVG(ArrDelay) as 'avgDelay'
FROM flights
GROUP BY UniqueCarrier
HAVING avgDelay > 10
ORDER BY avgDelay DESC;