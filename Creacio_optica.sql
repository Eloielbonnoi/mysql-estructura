SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `CdA` DEFAULT CHARACTER SET utf8 ;
USE `CdA` ;

CREATE TABLE IF NOT EXISTS `CdA`.`client` (
  `client_id` INT NOT NULL,
  `client_nom` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(20) NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `data_registre` DATETIME NOT NULL,
  `recomana_client_id` INT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `recomana_client_id_idx` (`recomana_client_id` ASC) VISIBLE,
  CONSTRAINT `recomana_client_id`
    FOREIGN KEY (`recomana_client_id`)
    REFERENCES `Cul_d_ampolla`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `CdA`.`Proveidor` (
  `proveidor_id` INT NOT NULL AUTO_INCREMENT,
  `proveidor_nom` VARCHAR(45) NOT NULL,
  `adressa` VARCHAR(45) NOT NULL,
  `num` VARCHAR(20) NOT NULL,
  `pis` VARCHAR(10) NOT NULL,
  `porta` VARCHAR(10) NOT NULL,
  `ciutat` VARCHAR(45) NOT NULL,
  `codi_postal` VARCHAR(8) NOT NULL,
  `pais` VARCHAR(30) NOT NULL,
  `telefon` VARCHAR(12) NOT NULL,
  `fax` VARCHAR(12) NOT NULL,
  `NIF` VARCHAR(412) NOT NULL,
  PRIMARY KEY (`proveidor_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `CdA`.`treballador` (
  `treballador_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`treballador_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `CdA`.`comanda_ulleres` (
  `comanda_ulleres_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `data_venda` DATETIME NOT NULL,
  `proveidor_id` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `graduacio_ullD` VARCHAR(45) NOT NULL,
  `graduacio_ullE` VARCHAR(45) NOT NULL,
  `tipu_montura` VARCHAR(45) NOT NULL,
  `color_montura` VARCHAR(45) NOT NULL,
  `color_vidre` VARCHAR(45) NOT NULL,
  `treballador_id` INT NOT NULL,
  `preu` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`comanda_ulleres_id`),
  INDEX `client_id_idx` (`client_id` ASC) VISIBLE,
  INDEX `proveidor_id_idx` (`proveidor_id` ASC) VISIBLE,
  INDEX `treballador_id_idx` (`treballador_id` ASC) VISIBLE,
  CONSTRAINT `client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `Cul_d_ampolla`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `proveidor_id`
    FOREIGN KEY (`proveidor_id`)
    REFERENCES `Cul_d_ampolla`.`Proveidor` (`proveidor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `treballador_id`
    FOREIGN KEY (`treballador_id`)
    REFERENCES `Cul_d_ampolla`.`treballador` (`treballador_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
