
DROP DATABASE IF EXISTS 'CdA';
CREATE SCHEMA IF NOT EXISTS 'CdA' DEFAULT CHARACTER SET utf8 ;
USE 'CdA' ;

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

INSERT INTO `client` VALUES (1,'Eloi','C/Diagonal,2', '932843954', 'nuntxaku@gmail.com', '2019-04-14', 3);
INSERT INTO `client` VALUES (2,'Marc Martí','C/Aragó,3', '932844528', 'nqeftxaku@gmail.com', '2019-03-28', 3);
INSERT INTO `client` VALUES (3,'Mercè','Av/ Merdidiana,2', '972543954', 'mailu@gmail.com', '2020-07-04', 2);
INSERT INTO `client` VALUES (4,'Maria','Av/ Carrilet,2', '974543954', 'trucutruu@gmail.com', '2020-04-14', 2);
INSERT INTO `client` VALUES (5,'Antoni','Av/ Cacatua,2', '972343954', 'coding@gmail.com', '2018-06-04', 2);

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
  `NIF` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`proveidor_id`))
ENGINE = InnoDB;

INSERT INTO `Proveidor` VALUES (1,'Vidres_cegato','Av/ Merdidiana', '9', '3', '2', 'Salamanca','08076', 'Espanya', '952735222', '952735222', '44014343W');
INSERT INTO `Proveidor` VALUES (2,'Monturas_cegato','Av/ Merdidiana', '6', '88', '25', 'Sitges','08074', 'Catalunya', '952498222', '954565222', '42014343W');
INSERT INTO `Proveidor` VALUES (3,'Bonavista','Av/ Llum', '3', '3', '2', 'El Prat','08076', 'França', '952735222', '952735222', '44654343P');
INSERT INTO `Proveidor` VALUES (4,'Vidreres','C/Manel Boix', '9', '3', '2', 'Tona','08072', 'Filipines', '952735222', '952735222', '45214343B');

CREATE TABLE IF NOT EXISTS `CdA`.`treballador` (
  `treballador_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`treballador_id`))
ENGINE = InnoDB;
INSERT INTO `treballador` VALUES (1,'Manolu');
INSERT INTO `treballador` VALUES (2,'Josep');
INSERT INTO `treballador` VALUES (3,'Martí');
INSERT INTO `treballador` VALUES (4,'Pabla');
INSERT INTO `treballador` VALUES (5,'Lluïsa');

CREATE TABLE IF NOT EXISTS `CdA`.`comanda_ulleres` (
  `comanda_ulleres_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `data_venda` DATETIME,
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
INSERT INTO `comanda_ulleres` VALUES (1, 4, '2019-06-03', 2, "No t'hi fixis", '54E', '55E', 'pasta', 'verda', 'transparent', 2, 213.24);
INSERT INTO `comanda_ulleres` VALUES (2, 2, '2020-07-02', 2, "Cacatua", '54E', '55E', 'metal·lica', 'gris', 'transparent', 2, 113.4);
INSERT INTO `comanda_ulleres` VALUES (3, 3, '2020-01-14', 1, "Cacatua", '24E', '5E', 'flotant', 'groc', 'vermell', 1, 83.4);
INSERT INTO `comanda_ulleres` VALUES (4, 2, '2019-10-12', 3, "Cacatua", '54E', '55E', 'metàl·lica', 'gris', 'transparent', 2, 113.4);
INSERT INTO `comanda_ulleres` VALUES (5, 1, '2019-10-12', 3, "Marmota", '24E', '65E', 'flotant', 'negre', 'verd', 3, 413.4);
INSERT INTO `comanda_ulleres` VALUES (6, 5, '2018-11-12', 1, "No t'hi fixis", '24E', '65E', 'pasta', 'negre', 'transparent', 3, 173.4);
INSERT INTO `comanda_ulleres` VALUES (7, 5, '2019-04-12', 1, "No t'hi fixis", '4E', '61E', 'pasta', 'gris', 'transparent', 1, 1273.4);
INSERT INTO `comanda_ulleres` VALUES (8, 5, '2018-09-06', 4, "Cacatua", '4F', '21E', 'metàl·lica', 'vermell', 'transparent', 1, 273.4);
INSERT INTO `comanda_ulleres` VALUES (9, 3, '2020-06-03', 2, "No t'hi fixis", '54E', '55E', 'pasta', 'verda', 'transparent', 3, 213.24);
INSERT INTO `comanda_ulleres` VALUES (10, 1, '2020-07-02', 2, "Marmota", '5E', '65E', 'metal·lica', 'gris', 'transparent', 2, 513.4);
INSERT INTO `comanda_ulleres` VALUES (11, 3, '2021-07-14', 1, "Cacatua", '24E', '5E', 'flotant', 'groc', 'vermell', 1, 283.4);
INSERT INTO `comanda_ulleres` VALUES (12, 5, NULL, 1, "No t'hi fixis", '14E', '5Y', 'pasta', 'groc', 'vermell', 3, 823.4);
INSERT INTO `comanda_ulleres` VALUES (13, 3, NULL , 2, "Cacatua", '4E', '15E', 'flotant', 'verd', 'verd', 1, 683.4);
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
