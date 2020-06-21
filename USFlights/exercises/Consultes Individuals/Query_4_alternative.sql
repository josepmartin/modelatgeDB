SELECT City, colYear, colMonth, AVG(`ArrDelay`) AS "prom_arribades" 
FROM flights, usairports 
WHERE Origin = IATA
GROUP BY City, colYear, colMonth;