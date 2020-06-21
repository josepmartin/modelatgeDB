-- MySQL Script generated by MySQL Workbench
-- Sun May 10 17:37:45 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Stube
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Stube` ;

-- -----------------------------------------------------
-- Schema Stube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Stube` DEFAULT CHARACTER SET utf8 ;
USE `Stube` ;

-- -----------------------------------------------------
-- Table `Stube`.`Usuaris`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stube`.`Usuaris` (
  `id_usuari` INT NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `contrasenya` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id_usuari`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_usuari_UNIQUE` ON `Stube`.`Usuaris` (`id_usuari` ASC);

CREATE UNIQUE INDEX `email_UNIQUE` ON `Stube`.`Usuaris` (`email` ASC);


-- -----------------------------------------------------
-- Table `Stube`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stube`.`Videos` (
  `id_video` VARCHAR(12) NOT NULL,
  `titol` VARCHAR(80) NOT NULL,
  `descripcio` VARCHAR(250) NOT NULL,
  `url` VARCHAR(150) NOT NULL DEFAULT 'https://www.youtube.com/watch?v=',
  `usuari_id` INT NOT NULL,
  PRIMARY KEY (`id_video`),
  CONSTRAINT `fk_Videos_Usuaris`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `Stube`.`Usuaris` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_video_UNIQUE` ON `Stube`.`Videos` (`id_video` ASC);

CREATE INDEX `fk_Videos_Usuaris_idx` ON `Stube`.`Videos` (`usuari_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `usuaris` (`id_usuari`, `email`, `contrasenya`) VALUES ('1', 'usuari1@stube.com', 'aaaaa'), ('2', 'usuari2@stube.com', 'bbbbb');

INSERT INTO `videos` (`id_video`, `titol`, `descripcio`, `url`, `usuari_id`) VALUES ('97As6FKLn5x2', 'Vídeo número 1', 'Aquest és el vídeo número 1.', 'https://www.youtube.com/watch?v=97As6FKLn5x2', '1'), ('JI37lmGVRbhh', 'Vídeo número 2', 'Aquest és el vídeo número 2.', 'https://www.youtube.com/watch?v=JI37lmGVRbhh', '1'), ('LB3Or94tjf0U', 'Vídeo número 3', 'Aquest és el vídeo número 3.', 'https://www.youtube.com/watch?v=LB3Or94tjf0U', '2');