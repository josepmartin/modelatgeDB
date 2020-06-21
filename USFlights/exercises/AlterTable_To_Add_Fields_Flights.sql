# Si no volem eliminar l'estructura de la taula una vegada creada, 
# podem afegir les columnes que ens falten amb un ALTER TABLE

ALTER TABLE `usairlineflights2`.`flights` 
ADD COLUMN `CarrierDelay` SMALLINT(6) NULL DEFAULT NULL AFTER `Diverted`,
ADD COLUMN `WeatherDelay` SMALLINT(6) NULL DEFAULT NULL AFTER `CarrierDelay`,
ADD COLUMN `NASDelay` SMALLINT(6) NULL DEFAULT NULL AFTER `WeatherDelay`,
ADD COLUMN `SecurityDelay` SMALLINT(6) NULL DEFAULT NULL AFTER `NASDelay`,
ADD COLUMN `LateAircraftDelay` SMALLINT(6) NULL DEFAULT NULL AFTER `SecurityDelay`,
ADD COLUMN `flightscol` VARCHAR(45) NULL DEFAULT NULL AFTER `LateAircraftDelay`;