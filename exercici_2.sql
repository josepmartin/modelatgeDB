-- MySQL Script generated by MySQL Workbench
-- Sun May 10 16:17:54 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BotigaQuadres
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BotigaQuadres` ;

-- -----------------------------------------------------
-- Schema BotigaQuadres
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BotigaQuadres` DEFAULT CHARACTER SET utf8 ;
USE `BotigaQuadres` ;

-- -----------------------------------------------------
-- Table `BotigaQuadres`.`Quadres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BotigaQuadres`.`Quadres` (
  `id_quadre` INT NOT NULL,
  `Preu` FLOAT NOT NULL,
  `autor` VARCHAR(45) NULL,
  PRIMARY KEY (`id_quadre`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_quadre_UNIQUE` ON `BotigaQuadres`.`Quadres` (`id_quadre` ASC);


-- -----------------------------------------------------
-- Table `BotigaQuadres`.`Compres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BotigaQuadres`.`Compres` (
  `id_comprador` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `cognom` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(9) NOT NULL,
  `quadre_id` INT NOT NULL,
  PRIMARY KEY (`id_comprador`),
  CONSTRAINT `fk_Compres_Quadres`
    FOREIGN KEY (`quadre_id`)
    REFERENCES `BotigaQuadres`.`Quadres` (`id_quadre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_comprador_UNIQUE` ON `BotigaQuadres`.`Compres` (`id_comprador` ASC);

CREATE UNIQUE INDEX `quadre_id_UNIQUE` ON `BotigaQuadres`.`Compres` (`quadre_id` ASC);

INSERT INTO `quadres` (`id_quadre`, `Preu`, `autor`) VALUES ('1', '2525.50', 'Salvador Dalí'), ('2', '1435.75', 'Pablo Ruiz Picasso'), ('3', '500.00', NULL), ('4', '1225.25', 'Joan Miró');

INSERT INTO `compres` (`id_comprador`, `nom`, `cognom`, `dni`, `quadre_id`) VALUES ('1', 'Joan', 'Solé', '11111111A', '2'), ('2', 'Carla', 'Vidal', '22222222B', '3'), ('3', 'Miquel', 'Vila', '33333333C', '1');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;