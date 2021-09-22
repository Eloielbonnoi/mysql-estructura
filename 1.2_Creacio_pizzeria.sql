DROP DATABASE IF EXISTS `Pizzeria`;
CREATE SCHEMA IF NOT EXISTS `Pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `Pizzeria` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Provincia` (
  `provincia_id` INT NOT NULL AUTO_INCREMENT,
  `provincia` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`provincia_id`))
ENGINE = InnoDB;
INSERT INTO `Provincia` VALUES (1, 'BA');
INSERT INTO `Provincia` VALUES (2, 'TA');
INSERT INTO `Provincia` VALUES (3, 'LL');
INSERT INTO `Provincia` VALUES (4, 'GI');

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Localitat` (
  `localitat_id` INT NOT NULL AUTO_INCREMENT,
  `localitat` VARCHAR(45) NOT NULL,
  `provincia_id` INT NOT NULL,
  PRIMARY KEY (`localitat_id`),
  INDEX `Provincia_id_idx` (`provincia_id` ASC) VISIBLE,
  CONSTRAINT `Fk_provincia_id`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `Pizzeria`.`Provincia` (`provincia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



INSERT INTO `Localitat` VALUES (1, 'Centelles', 1);
INSERT INTO `Localitat` VALUES (2, 'Tona', 1);
INSERT INTO `Localitat` VALUES (3, 'Aitona', 3);
INSERT INTO `Localitat` VALUES (4, 'Maials', 3);
INSERT INTO `Localitat` VALUES (5, 'Salou', 2);
INSERT INTO `Localitat` VALUES (6, 'Torredembarra', 2);
INSERT INTO `Localitat` VALUES (7, 'Figueres', 4);
INSERT INTO `Localitat` VALUES (8, 'Roses', 4);

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
INSERT INTO `Client` VALUES (1, 'Eloi', 'Isern Rabella', 'C/Diagonal, 2', 08540, 1, 1, 687453298);
INSERT INTO `Client` VALUES (2, 'Manel', 'Fortià Rus', 'C/Cacatua, 2', 08550, 2, 1, 687469297);
INSERT INTO `Client` VALUES (3, 'Bruce', 'Dickinson', 'C/Maiden, 666', 08666, 3, 3, 666666666);
INSERT INTO `Client` VALUES (4, 'Bruce', 'Springsteen', 'C/Plasta, 2', 08000, 4, 3, 686723298);
INSERT INTO `Client` VALUES (5, 'Marilyn', 'Manson', 'C/Antichrist, 2', 13134, 5, 3, 347453298);
INSERT INTO `Client` VALUES (6, 'Robert', 'Fripp', 'C/Crimson, 2', 08540, 1, 1, 687623298);
INSERT INTO `Client` VALUES (7, 'James', 'Hetfield', 'C/Metall, 2', 08523, 8, 4, 681153298);
INSERT INTO `Client` VALUES (8, 'Evaristo', 'Paramo', 'C/No somos nada, 2', 08320, 4, 3, 687453298);
INSERT INTO `Client` VALUES (9, 'Steven', 'Spielverg', 'C/Micasa, 2', 08450, 3, 3, 687113298);
INSERT INTO `Client` VALUES (10, 'Sílvia', 'Subirós', 'C/Dameargo, 2', 08220, 7, 4, 687453298);
INSERT INTO `Client` VALUES (11, 'Jaume', 'Subirós', 'C/Dameargo, 6', 08220, 8, 4, 687453298);
INSERT INTO `Client` VALUES (11, 'Anna', 'Subirós', 'C/Dameo, 6', 08220, 3, 3, 687400298);

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Pizza_categoria` (
  `pizza_categoria_id` INT NOT NULL AUTO_INCREMENT,
  `nom_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pizza_categoria_id`))
ENGINE = InnoDB;
INSERT INTO `Pizza_categoria` VALUES (1, 'Pepperoni');
INSERT INTO `Pizza_categoria` VALUES (2, 'Allioli');
INSERT INTO `Pizza_categoria` VALUES (3, 'Amanitamuscariense');
INSERT INTO `Pizza_categoria` VALUES (4, 'Rica- rica');
INSERT INTO `Pizza_categoria` VALUES (5, 'Con fundamento');
INSERT INTO `Pizza_categoria` VALUES (6, 'Esferificada');

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Producte` (
  `producte_id` INT NOT NULL,
  `tipus_producte` VARCHAR (4) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `descripcio` VARCHAR(45) NOT NULL,
  `imatge` BLOB NULL,
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
INSERT INTO `Producte` VALUES (1, 'Pizz', 'Pizza Chachi Piruli', 'Molt bona', NULL, 12.50, 1);
INSERT INTO `Producte` VALUES (2, 'Begu', 'Coca-caca', 'Refrescant', NULL, 2.50, NULL);
INSERT INTO `Producte` VALUES (3, 'Pizz', 'Pizza Napoli', 'Suculenta', NULL, 14.50, 3);
INSERT INTO `Producte` VALUES (4, 'Hamb', 'MacDonovan', 'Horrorosa', NULL, 22.50, NULL);
INSERT INTO `Producte` VALUES (5, 'Pizz', 'Pizza Cacatua', 'Molt bona', NULL, 10.50, 1);
INSERT INTO `Producte` VALUES (6, 'Begu', 'Fanta Taronja', 'Els adults no han de beure fanta', NULL, 12.50, NULL);
INSERT INTO `Producte` VALUES (7, 'Pizz', 'Pizzeta', 'Molt bona', NULL, 12, 4);
INSERT INTO `Producte` VALUES (8, 'Hamb', 'Burguer de rata', 'Uauuuu', NULL, 12.50, NULL);
INSERT INTO `Producte` VALUES (9, 'Pizz', 'Pizza Crocanti', 'Dolça i salada', NULL, 14.50, 4);
INSERT INTO `Producte` VALUES (10, 'Begu', 'Whisky', 'Marida bé amb pizza', NULL, 22.50, NULL);
INSERT INTO `Producte` VALUES (11, 'Pizz', 'Pizza Chachi', 'Bona', NULL, 12.50, 4);

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
INSERT INTO `Botiga` VALUES (1, 'C/Cacatua, 16', 08976, 1, 1);
INSERT INTO `Botiga` VALUES (2, 'Av/Maracatua, 6', 08475, 2, 1);
INSERT INTO `Botiga` VALUES (3, 'C/Carbó, 16', 08216, 3, 3);
INSERT INTO `Botiga` VALUES (4, 'C/Brocanters, 16', 02116, 4, 3);
INSERT INTO `Botiga` VALUES (5, 'C/Carbonara, 1', 08216, 5, 2);
INSERT INTO `Botiga` VALUES (6, 'C/Arrimate, 16', 08216, 6, 2);
INSERT INTO `Botiga` VALUES (7, 'C/Malaje, 16', 08216, 7, 4);
INSERT INTO `Botiga` VALUES (8, 'C/Cfufu, 16', 08216, 3, 3);
INSERT INTO `Botiga` VALUES (9, 'C/Anastasio, 4', 08216, 3, 3);
INSERT INTO `Botiga` VALUES (10, 'C/frotolo, 16', 08221, 5, 2);
INSERT INTO `Botiga` VALUES (11, 'C/Cruscat, 16', 08216, 4, 3);
INSERT INTO `Botiga` VALUES (12, 'C/ó, 16', 08216, 6, 2);
INSERT INTO `Botiga` VALUES (13, 'C/Salines, 9', 08216, 6, 3);
INSERT INTO `Botiga` VALUES (14, 'C/Carbó, 1', 08216, 3, 3);


CREATE TABLE IF NOT EXISTS `Pizzeria`.`Empleat` (
  `empleat_id` INT NOT NULL AUTO_INCREMENT,
  `botiga_id` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(9) NOT NULL,
  `telefon` VARCHAR(15) NOT NULL,
  `tipus` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`empleat_id`),
  INDEX `botiga_id_idx` (`botiga_id` ASC) VISIBLE,
  CONSTRAINT `botiga_id`
    FOREIGN KEY (`botiga_id`)
    REFERENCES `Pizzeria`.`Botiga` (`botiga_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `Empleat` VALUES (1, 1, 'Manel', 'Martínez Cacauet', '44014343W', 936342518, 'Cuin');
INSERT INTO `Empleat` VALUES (2, 1, 'Marta', 'Martí Canet', '62014343P', 996458723, 'Cuin');
INSERT INTO `Empleat` VALUES (3, 1, 'Martí', 'Martínet Cantó', '67265434P', 996453223, 'Repa');
INSERT INTO `Empleat` VALUES (4, 2, 'Marc', 'Marquez Moto', '62012143P', 996458723, 'Cuin');
INSERT INTO `Empleat` VALUES (5, 2, 'Martona', 'Martínez Canet', '67201434P', 996458723, 'Cuin');
INSERT INTO `Empleat` VALUES (6, 2, 'Alexia', 'Tíanet', '67201434P', 996458723, 'Repa');
INSERT INTO `Empleat` VALUES (7, 3, 'Manolu', 'Manolez', '67201987E', 996458723, 'Cuin');
INSERT INTO `Empleat` VALUES (8, 3, 'Ernest', 'Crusats Anselm', '67203287L', 996450223, 'Cuin');
INSERT INTO `Empleat` VALUES (9, 3, 'Marc', 'Mateu Redperill', '67231987E', 996458543, 'Repa');
INSERT INTO `Empleat` VALUES (10, 4, 'Tarta', 'Relena Arnal', '67231987E', 996456523, 'Cuin');
INSERT INTO `Empleat` VALUES (11, 4, 'Marcel', 'Bages Arnal', '67201987E', 996458723, 'Cuin');
INSERT INTO `Empleat` VALUES (12, 4, 'Mercedes', 'Milà', '67221987E', 996458653, 'Repa');

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Comanda` (
  `comanda_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `data_hora` DATETIME NOT NULL,
  `local/domicili` VARCHAR(4) NOT NULL,
  `quantitat` INT NOT NULL,
  `preu` DECIMAL(6,2) NOT NULL,
  `botiga_id` INT NOT NULL,
  `producte_id` INT NOT NULL,
  `repartidor_id` INT NULL,
  `hora_lliurament` DATETIME NULL,
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
INSERT INTO `Comanda` VALUES (1, 3, '2021-05-12 22:34:34','Domi', 2, 24.54, 2, 2, 3,'2021-05-12 23:40:34' );
INSERT INTO `Comanda` VALUES (2, 2, '2021-05-13 20:30:34','Domi', 2, 14.54, 2, 2, 3,'2021-05-13 22:12:00' );
INSERT INTO `Comanda` VALUES (3, 2, '2021-05-13 20:30:34','Domi', 2, 4.54, 2, 3, 3,'2021-05-13 22:12:00' );
INSERT INTO `Comanda` VALUES (4, 3, '2021-05-09 19:20:34','Loca', 1, 18.54, 3, 3, NULL, NULL );
INSERT INTO `Comanda` VALUES (5, 3, '2021-05-09 19:20:34','Loca', 1, 18.54, 3, 4, NULL, NULL );

INSERT INTO `Comanda` VALUES (6, 1, '2021-05-11 20:30:32','Domi', 2, 8.54, 1, 3, 6,'2021-05-13 22:12:00' );
INSERT INTO `Comanda` VALUES (7, 1, '2021-05-11 20:30:32','Domi', 1, 3.54, 1, 4, 6,'2021-05-13 22:12:00' );
INSERT INTO `Comanda` VALUES (8, 1, '2021-05-11 20:30:32','Domi', 2, 10.54, 1, 5, 6,'2021-05-13 22:12:00' );
INSERT INTO `Comanda` VALUES (9, 1, '2021-05-11 20:30:32','Domi', 3, 13.22, 1, 3, 6,'2021-05-13 22:12:00' );
INSERT INTO `Comanda` VALUES (10, 3, '2021-06-11 20:30:32','Loca', 1, 10.54, 4, 5, NULL, NULL);

INSERT INTO `Comanda` VALUES (11, 3, '2021-06-11 20:30:32','Loca', 2, 3.54, 4, 3, NULL, NULL);
INSERT INTO `Comanda` VALUES (12, 3, '2021-06-11 20:30:32','Loca', 1, 18.54, 4, 3, NULL, NULL);



