DROP DATABASE IF EXISTS Yutup;
CREATE SCHEMA IF NOT EXISTS Yutup DEFAULT CHARACTER SET utf8 ;
USE Yutup;

CREATE TABLE IF NOT EXISTS Yutup.XXX (
  `client_id` INT NOT NULL,
  `client_nom` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(20) NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `data_registre` DATETIME NOT NULL,
  `recomana_client_id` INT NULL,
  PRIMARY KEY (`client_id`),
    FOREIGN KEY (`recomana_client_id`)
    REFERENCES `CdA`.`client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;