SELECT Origin, AVG(ArrDelay) as 'prom_arribades', AVG(DepDelay) as 'prom_sortides' 
FROM flights
GROUP BY Origin;