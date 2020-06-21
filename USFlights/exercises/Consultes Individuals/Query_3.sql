SELECT Origin, colYear, colMonth, AVG(ArrDelay) as 'prom_arribades'
FROM flights
GROUP BY Origin, colYear, colMonth;