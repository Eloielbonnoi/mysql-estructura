
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Cul_d'ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cul_d'ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cul_d'ampolla` DEFAULT CHARACTER SET utf8 ;
USE `Cul_d'ampolla` ;

-- -----------------------------------------------------
-- Table `Cul_d'ampolla`.`proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_d'ampolla`.`proveidor` (
  `proveidor_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `ciutat` VARCHAR(45) NOT NULL,
  `codi_postal` INT NOT NULL,
  `país` VARCHAR(2) NOT NULL,
  `telefon` INT NOT NULL,
  `fax` INT NULL,
  `NIF` INT NOT NULL,
  PRIMARY KEY (`proveidor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_d'ampolla`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_d'ampolla`.`client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognom` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `ciutat` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(2) NOT NULL,
  `telefon` VARCHAR(12) NOT NULL,
  `e-mail` VARCHAR(45) NOT NULL,
  `data_registre` DATETIME NOT NULL,
  `treballador_id` INT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_d'ampolla`.`treballador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_d'ampolla`.`treballador` (
  `treballador_id` INT NOT NULL,
  PRIMARY KEY (`treballador_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_d'ampolla`.`Comanda_ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_d'ampolla`.`Comanda_ulleres` (
  `comanda_id` INT NOT NULL,
  `proveidor_id` INT NOT NULL,
  `client_id` INT NOT NULL,
  `marca` VARCHAR(50) NOT NULL,
  `tipus_montura` VARCHAR(20) NOT NULL,
  `color_montura` VARCHAR(20) NOT NULL,
  `color_vidre` VARCHAR(20) NOT NULL,
  `graduacio_D` VARCHAR(45) NOT NULL,
  `graduacio_E` VARCHAR(45) NOT NULL,
  `preu` DECIMAL(4,2) NOT NULL,
  `treballador_id` INT NOT NULL,
  `client_client_id` INT NOT NULL,
  `proveidor_proveidor_id` INT NOT NULL,
  `treballador_treballador_id` INT NOT NULL,
  PRIMARY KEY (`comanda_id`),
  INDEX `fk_Comanda_ulleres_client1_idx` (`client_client_id` ASC) VISIBLE,
  INDEX `fk_Comanda_ulleres_proveidor1_idx` (`proveidor_proveidor_id` ASC) VISIBLE,
  INDEX `fk_Comanda_ulleres_treballador1_idx` (`treballador_treballador_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comanda_ulleres_client1`
    FOREIGN KEY (`client_client_id`)
    REFERENCES `Cul_d'ampolla`.`client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comanda_ulleres_proveidor1`
    FOREIGN KEY (`proveidor_proveidor_id`)
    REFERENCES `Cul_d'ampolla`.`proveidor` (`proveidor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comanda_ulleres_treballador1`
    FOREIGN KEY (`treballador_treballador_id`)
    REFERENCES `Cul_d'ampolla`.`treballador` (`treballador_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
