
CREATE SCHEMA IF NOT EXISTS `Pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `Pizzeria` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Provincia` (
  `provincia_id` INT NOT NULL AUTO_INCREMENT,
  `provincia` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`provincia_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Localitat` (
  `localitat_id` INT NOT NULL AUTO_INCREMENT,
  `localitat` VARCHAR(45) NOT NULL,
  `provincia_id` INT NOT NULL,
  PRIMARY KEY (`localitat_id`),
  INDEX `Provincia_id_idx` (`provincia_id` ASC) VISIBLE,
  CONSTRAINT `Provincia_id`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `Pizzeria`.`Provincia` (`provincia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(45) NOT NULL,
  `CP` INT(5) NOT NULL,
  `localitat_id` INT NOT NULL,
  `provincia_id` INT NULL,
  `telefon` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `localitat_id_idx` (`localitat_id` ASC) VISIBLE,
  INDEX `provincia_id_idx` (`provincia_id` ASC) VISIBLE,
  CONSTRAINT `localitat_id`
    FOREIGN KEY (`localitat_id`)
    REFERENCES `Pizzeria`.`Localitat` (`localitat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `provincia1_id`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `Pizzeria`.`Provincia` (`provincia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Pizza_categoria` (
  `pizza_categoria_id` INT NOT NULL AUTO_INCREMENT,
  `nom_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pizza_categoria_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Producte` (
  `producte_id` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `descripcio` VARCHAR(45) NOT NULL,
  `imatge` BLOB NOT NULL,
  `preu` DECIMAL(6,2) NOT NULL,
  `pizza_tipus` INT NULL,
  PRIMARY KEY (`producte_id`),
  INDEX `pizza_tipus_idx` (`pizza_tipus` ASC) VISIBLE,
  CONSTRAINT `pizza_tipus`
    FOREIGN KEY (`pizza_tipus`)
    REFERENCES `Pizzeria`.`Pizza_categoria` (`pizza_categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Botiga` (
  `botiga_id` INT NOT NULL AUTO_INCREMENT,
  `adressa` VARCHAR(45) NOT NULL,
  `CP` INT(5) NOT NULL,
  `localitat_id` INT NOT NULL,
  `provincia_id` INT NOT NULL,
  PRIMARY KEY (`botiga_id`),
  INDEX `localitat_id_idx` (`localitat_id` ASC) VISIBLE,
  INDEX `provincia_id_idx` (`provincia_id` ASC) VISIBLE,
  CONSTRAINT `localitat_bot_id`
    FOREIGN KEY (`localitat_id`)
    REFERENCES `Pizzeria`.`Localitat` (`localitat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `provincia_bot_id`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `Pizzeria`.`Provincia` (`provincia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Empleat` (
  `empleat_id` INT NOT NULL AUTO_INCREMENT,
  `botiga_id` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(9) NOT NULL,
  `telefon` VARCHAR(15) NOT NULL,
  `tipus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`empleat_id`),
  INDEX `botiga_id_idx` (`botiga_id` ASC) VISIBLE,
  CONSTRAINT `botiga_id`
    FOREIGN KEY (`botiga_id`)
    REFERENCES `Pizzeria`.`Botiga` (`botiga_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Comanda` (
  `comanda_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `data_hora` DATETIME NOT NULL,
  `local/domicili` VARCHAR(45) NOT NULL,
  `quantitat` INT NOT NULL,
  `preu` DECIMAL(6,2) NOT NULL,
  `botiga_id` INT NOT NULL,
  `producte_id` INT NOT NULL,
  `repartidor_id` INT NULL,
  `hora_lliurament` DATETIME NOT NULL,
  PRIMARY KEY (`comanda_id`),
  INDEX `client_id_idx` (`client_id` ASC) VISIBLE,
  INDEX `botiga_id_idx` (`botiga_id` ASC) VISIBLE,
  INDEX `producte_id_idx` (`producte_id` ASC) VISIBLE,
  INDEX `repartidor_id_idx` (`repartidor_id` ASC) VISIBLE,
  CONSTRAINT `client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `Pizzeria`.`Client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `botiga_com_id`
    FOREIGN KEY (`botiga_id`)
    REFERENCES `Pizzeria`.`Botiga` (`botiga_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `producte_id`
    FOREIGN KEY (`producte_id`)
    REFERENCES `Pizzeria`.`Producte` (`producte_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `repartidor_id`
    FOREIGN KEY (`repartidor_id`)
    REFERENCES `Pizzeria`.`Empleat` (`empleat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB



