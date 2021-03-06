-- MySQL Script generated by MySQL Workbench
-- Mon May 18 18:27:56 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Amazon
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Amazon` ;

-- -----------------------------------------------------
-- Schema Amazon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Amazon` DEFAULT CHARACTER SET utf8 ;
USE `Amazon` ;

-- -----------------------------------------------------
-- Table `Amazon`.`Autors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amazon`.`Autors` (
  `id_autor` INT NOT NULL,
  `nom_autor` VARCHAR(45) NULL,
  `adreça` VARCHAR(45) NULL,
  `llibres_escrits` INT NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_autor_UNIQUE` ON `Amazon`.`Autors` (`id_autor` ASC);


-- -----------------------------------------------------
-- Table `Amazon`.`Llibres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amazon`.`Llibres` (
  `id_llibre` INT NOT NULL,
  `nom_llibre` VARCHAR(45) NULL,
  `estoc` INT NULL,
  `preu` DECIMAL(6,2) NULL,
  `autors_id_autor` INT NOT NULL,
  PRIMARY KEY (`id_llibre`, `autors_id_autor`),
  CONSTRAINT `fk_Llibres_Autors`
    FOREIGN KEY (`autors_id_autor`)
    REFERENCES `Amazon`.`Autors` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idLlibre_UNIQUE` ON `Amazon`.`Llibres` (`id_llibre` ASC);

CREATE INDEX `fk_Llibres_Autors_idx` ON `Amazon`.`Llibres` (`autors_id_autor` ASC);


-- -----------------------------------------------------
-- Table `Amazon`.`Usuaris`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amazon`.`Usuaris` (
  `id_usuari` INT NOT NULL,
  `nom_usuari` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contrasenya` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_usuari`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `nom_usuari_UNIQUE` ON `Amazon`.`Usuaris` (`nom_usuari` ASC);

CREATE UNIQUE INDEX `email_UNIQUE` ON `Amazon`.`Usuaris` (`email` ASC);

CREATE UNIQUE INDEX `id_usuari_UNIQUE` ON `Amazon`.`Usuaris` (`id_usuari` ASC);


-- -----------------------------------------------------
-- Table `Amazon`.`Factures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amazon`.`Factures` (
  `id_factura` INT NOT NULL,
  `id_llibre` INT NOT NULL,
  `id_usuari` INT NOT NULL,
  PRIMARY KEY (`id_factura`, `id_llibre`),
  CONSTRAINT `fk_id_llibre`
    FOREIGN KEY (`id_llibre`)
    REFERENCES `Amazon`.`Llibres` (`id_llibre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_usuari`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `Amazon`.`Usuaris` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `autors` (`id_autor`, `nom_autor`, `adreça`, `llibres_escrits`) VALUES ('1', 'William Shakespeare', 'London', '2'), ('2', 'Oscar Wilde', 'New York', '1');

INSERT INTO `llibres` (`id_llibre`, `nom_llibre`, `estoc`, `preu`, `autors_id_autor`) VALUES ('1', 'Hamlet', '20', '15.50', '1'), ('2', 'Romeo i Julieta', '15', '13.75', '1'), ('3', 'El retrat de Dorian Gray', '11', '12.35', '2');

INSERT INTO `usuaris` (`id_usuari`, `nom_usuari`, `email`, `contrasenya`) VALUES ('1', 'Josep Martin', 'josep@martin.cat', 'Contrasenya1'), ('2', 'Roger Martin', 'roger@martin.cat', 'Contrasenya2');

INSERT INTO `factures` (`id_factura`, `id_llibre`, `id_usuari`) VALUES ('1', '1', '1'), ('1', '3', '1'), ('2', '2', '2');