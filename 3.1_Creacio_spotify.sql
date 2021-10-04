DROP DATABASE IF EXISTS `spoty`;
CREATE DATABASE `spoty` CHARACTER SET utf8mb4;
USE `spoty`;
-- -----------------------------------------------------
-- Table `mydb`.`Usuari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Usuari` (
  `id_usuari` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(9) NOT NULL,
  `data_naixement` DATETIME NULL,
  `sexe` VARCHAR(2) BINARY NOT NULL,
  `pais` VARCHAR(2) NULL,
  `CP` INT(5) NULL,
  `nivell_usuari` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`id_usuari`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Subscripció`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Subscripcio` (
  `id_subscripcio` INT NOT NULL,
  `data_inici` DATETIME NOT NULL,
  `data_renovacio` DATETIME NOT NULL,
  `forma_pagament` VARCHAR(6) NOT NULL,
  `usuari_id` INT NOT NULL,
  PRIMARY KEY (`id_subscripcio`),
    FOREIGN KEY (`usuari_id`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Targetes_credit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Targetes_credit` (
  `id_targeta` INT NOT NULL,
  `num_targeta` INT NOT NULL,
  `caducitat` VARCHAR(5) NOT NULL,
  `codi_seguretat` INT(3) NOT NULL,
  `usuari_id` INT NOT NULL,
  PRIMARY KEY (`id_targeta`),
    FOREIGN KEY (`usuari_id`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Paypal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Paypal` (
  `id_paypal` INT NOT NULL,
  `usuari_id` INT NOT NULL,
  `nom_usuari` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_paypal`),
    FOREIGN KEY (`usuari_id`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Pagament` (
  `id_pagament` INT NOT NULL AUTO_INCREMENT,
  `usuari_id` INT NOT NULL,
  `data_pagament` DATETIME NOT NULL,
  `total` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id_pagament`),
    FOREIGN KEY (`usuari_id`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Playlist` (
  `id_playlist` INT NOT NULL,
  `titol` VARCHAR(45) NOT NULL,
  `num_songs` INT NOT NULL,
  `data_creacio` DATETIME NOT NULL,
  `eliminada` VARCHAR(2) BINARY NULL,
  `data_eliminada` DATETIME NULL,
  `usuari_creador` INT NOT NULL,
  PRIMARY KEY (`id_playlist`),
    FOREIGN KEY (`usuari_creador`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Artista` (
  `id_artista` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `imatge` BLOB NULL,
  PRIMARY KEY (`id_artista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Album` (
  `id_album` INT NOT NULL,
  `artista_id` INT NOT NULL,
  `titol` VARCHAR(45) NOT NULL,
  `any_publicacio` INT(4) NULL,
  `portada` BLOB NULL,
  PRIMARY KEY (`id_album`),
    FOREIGN KEY (`artista_id`)
    REFERENCES `spoty`.`Artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Song` (
  `id_song` INT NOT NULL,
  `titol` VARCHAR(45) NOT NULL,
  `durada` VARCHAR (9) NOT NULL,
  `reproduccions` INT NOT NULL,
  `album_id` INT NULL,
  PRIMARY KEY (`id_song`),
    FOREIGN KEY (`album_id`)
    REFERENCES `spoty`.`Album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Has_favourite_song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Has_favourite_song` (
  `id_has_favourite_song` INT NOT NULL,
  `song_id` INT NOT NULL,
  `usuari_id` INT NOT NULL,
  PRIMARY KEY (`id_has_favourite_song`),
    FOREIGN KEY (`song_id`)
    REFERENCES `spoty`.`Song` (`id_song`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`usuari_id`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Has_favourite_playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Has_favourite_playlist` (
  `id_has_favourite_playlist` INT NOT NULL,
  `playlist_id` INT NOT NULL,
  `usuari_id` INT NOT NULL,
  PRIMARY KEY (`id_has_favourite_playlist`),
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spoty`.`Playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`usuari_id`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Similar_artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Similar_artist` (
  `id_similar_artist` INT NOT NULL,
  `artist_id` INT NULL,
  `similar_artist_id` INT NULL,
  PRIMARY KEY (`id_similar_artist`),
    FOREIGN KEY (`artist_id`)
    REFERENCES `spoty`.`Artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`similar_artist_id`)
    REFERENCES `spoty`.`Artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Has_song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Has_song` (
  `id_has_song` INT NOT NULL,
  `playlist_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  `usuari_contribucio_id` INT NOT NULL,
  `data_contribucio` DATETIME NOT NULL,
  PRIMARY KEY (`id_has_song`),
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spoty`.`Playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`song_id`)
    REFERENCES `spoty`.`Song` (`id_song`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`usuari_contribucio_id`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Following`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Following` (
  `id_following` INT NOT NULL,
  `usuari_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`id_following`),
    FOREIGN KEY (`usuari_id`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`artista_id`)
    REFERENCES `spoty`.`Artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
--`Has_favourite_album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Has_favourite_album` (
  `id_has_favourite_album` INT NOT NULL,
  `usuari_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`id_has_favourite_album`),
    FOREIGN KEY (`usuari_id`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`album_id`)
    REFERENCES `spoty`.`Album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO `Usuari` VALUES (1, 'manolu@gmail.com', 012345678, '1992-07-13', 'H', 'ES', 08025, 'free');
INSERT INTO `Usuari` VALUES (2, 'i_mm_o@gmail.com', 012825678, '1997-11-03', 'D', 'ES', 08425, 'free');
INSERT INTO `Usuari` VALUES (3, 'l_mo@gmail.com', 011225678, '2001-01-15', 'D', 'ES', 08024, 'prem');
INSERT INTO `Usuari` VALUES (4, 'miquelet@gmail.com', 012825234, '1998-04-03', 'D', 'FR', 18425, 'free');
INSERT INTO `Usuari` VALUES (5, 'cacatua@gmail.com', 0128355678, '2002-11-03', 'D', 'FR', 08415, 'prem');
INSERT INTO `Usuari` VALUES (6, 'matisn@gmail.com', 012829178, '1998-01-13', 'H', 'ES', 18425, 'prem');
INSERT INTO `Usuari` VALUES (7, 'cactus@hotmail.com', '01AFE678', '1999-07-23', 'H', 'FR', 02425, 'free');
INSERT INTO `Usuari` VALUES (8, 'canativ@gmail.com', '01DR25678', '1997-12-26', 'D', 'GE', 05425, 'free');

INSERT INTO `Subscripcio` VALUES (1, '2010-07-13', '2011-07-13', 'paypal', 1);
INSERT INTO `Subscripcio` VALUES (2, '2011-11-03', '2012-11-03', 'paypal', 2);
INSERT INTO `Subscripcio` VALUES (3, '2010-01-15', '2011-01-15', 'paypal', 3);
INSERT INTO `Subscripcio` VALUES (4, '2007-04-03', '2008-04-03', 'paypal', 3);
INSERT INTO `Subscripcio` VALUES (5, '2007-11-03', '2008-07-13', 'credit', 4);
INSERT INTO `Subscripcio` VALUES (6, '2008-01-13', '2009-07-13', 'credit', 5);
INSERT INTO `Subscripcio` VALUES (7, '2010-07-23', '2011-07-13', 'credit', 5);
INSERT INTO `Subscripcio` VALUES (8, '2008-12-26', '2009-07-13', 'credit', 6);

INSERT INTO `Targetes_credit` VALUES (1, 01234567, '06/22', '239', 1 );
INSERT INTO `Targetes_credit` VALUES (2, 01234566, '03/24', '231', 2 );
INSERT INTO `Targetes_credit` VALUES (3, 01234565, '10/23', '232', 3 );
INSERT INTO `Targetes_credit` VALUES (4, 01234564, '11/22', '233', 4 );
INSERT INTO `Targetes_credit` VALUES (5, 01234563, '02/24', '235', 5 );
INSERT INTO `Targetes_credit` VALUES (6, 01234562, '05/24', '236', 6 );
INSERT INTO `Targetes_credit` VALUES (7, 01234561, '03/26', '237', 7 );
INSERT INTO `Targetes_credit` VALUES (8, 01234560, '07/27', '238', 8 );

INSERT INTO `Pagament` VALUES (1, 1, '2018-12-13', '12.34');
INSERT INTO `Pagament` VALUES (2, 2, '2018-11-13', '10.34');
INSERT INTO `Pagament` VALUES (3, 3, '2018-10-13', '12.4');
INSERT INTO `Pagament` VALUES (4, 4, '2018-09-23', '12.37');
INSERT INTO `Pagament` VALUES (5, 5, '2018-08-03', '12.33');
INSERT INTO `Pagament` VALUES (6, 6, '2018-07-13', '12.32');
INSERT INTO `Pagament` VALUES (7, 7, '2018-06-23', '12.44');
INSERT INTO `Pagament` VALUES (8, 7, '2018-05-13', '12.14');
INSERT INTO `Pagament` VALUES (9, 8, '2018-03-03', '11.34');
INSERT INTO `Playlist` VALUES (1, 'Playlist_de_1', 23, '2019-01-01','Y', '2020-01-01', 1 );
INSERT INTO `Playlist` VALUES (2, 'Playlist_de_2', 24, '2019-01-01','Y', '2020-01-01', 1);
INSERT INTO `Playlist` VALUES (3, 'Playlist_de_3', 33, '2019-01-01', NULL, NULL, 3 );
INSERT INTO `Playlist` VALUES (4, 'Playlist_de_4', 43, '2019-01-01', NULL,  NULL, 3);
INSERT INTO `Playlist` VALUES (5, 'Playlist_de_5', 32, '2019-01-01',NULL, NULL, 1);
INSERT INTO `Playlist` VALUES (6, 'Playlist_de_6', 13, '2019-01-01','Y', '2020-01-01', 5 );
INSERT INTO `Playlist` VALUES (7, 'Playlist_de_7', 62, '2019-11-01',NULL, NULL, 5);

INSERT INTO `Artista` VALUES (1, 'Radiohead', NULL);
INSERT INTO `Artista` VALUES (2, 'Iron Maiden', NULL);
INSERT INTO `Artista` VALUES (3, 'Ramones', NULL);
INSERT INTO `Artista` VALUES (4, 'Metallica', NULL);
INSERT INTO `Artista` VALUES (5, 'King Crimson', NULL);
INSERT INTO `Artista` VALUES (6, 'Anal count', NULL);
INSERT INTO `Artista` VALUES (7, 'Lil Data', NULL);
INSERT INTO `Artista` VALUES (8, 'Genesis', NULL);
INSERT INTO `Artista` VALUES (9, 'Manowar', NULL);

INSERT INTO `Album` VALUES (1, 2, 'Tubular bells', 1978, NULL);
INSERT INTO `Album` VALUES (2, 1, 'Tubular bells 2', 1978, NULL);
INSERT INTO `Album` VALUES (3, 3, 'Tubular bells 3', 1978, NULL);
INSERT INTO `Album` VALUES (4, 3, 'Tubular bells 4', 1978, NULL);
INSERT INTO `Album` VALUES (5, 2, 'Tubular bells 5', 1978, NULL);
INSERT INTO `Album` VALUES (6, 5, 'Tubular bells 6', 1978, NULL);
INSERT INTO `Album` VALUES (7, 3, 'Tubular bells 7', 1978, NULL);
INSERT INTO `Album` VALUES (8, 5, 'Tubular bells 8', 1978, NULL);
INSERT INTO `Album` VALUES (9, 1, 'Tubular bells re-re-remastered', 1978, NULL);

INSERT INTO `Song`VALUES (1, 'Tubular Bells','23:24:05', 1543, 2);
INSERT INTO `Song`VALUES (2, 'Tubular Bells','12:44:03', 1543, 3 );
INSERT INTO `Song`VALUES (3, 'Tubular Bells','12:44:03', 1543, 3 );
INSERT INTO `Song`VALUES (4, 'Tubular Bells','12:44:03', 1543, 2 );
INSERT INTO `Song`VALUES (5, 'Tubular Bells','12:44:03', 1543, 4 );
INSERT INTO `Song`VALUES (6, 'Tubular Bells','12:44:03', 1543, 4 );
INSERT INTO `Song`VALUES (7, 'Tubular Bells','12:44:03', 1543, 2);

INSERT INTO `Has_favourite_song` VALUES (1, 2, 3);
INSERT INTO `Has_favourite_song` VALUES (2, 3 , 3);
INSERT INTO `Has_favourite_song` VALUES (3, 3, 2);
INSERT INTO `Has_favourite_song` VALUES (4, 2, 5);
INSERT INTO `Has_favourite_song` VALUES (5, 1, 2);
INSERT INTO `Has_favourite_song` VALUES (6, 5, 5);
INSERT INTO `Has_favourite_song` VALUES (7, 5, 5);
INSERT INTO `Has_favourite_song` VALUES (8, 3, 3);

INSERT INTO `Has_favourite_playlist`VALUES (1, 1, 1);
INSERT INTO `Has_favourite_playlist`VALUES (2, 1, 5);
INSERT INTO `Has_favourite_playlist`VALUES (3, 2, 5);
INSERT INTO `Has_favourite_playlist`VALUES (4, 2, 3);
INSERT INTO `Has_favourite_playlist`VALUES (5, 3, 3);
INSERT INTO `Has_favourite_playlist`VALUES (6, 4, 2);
INSERT INTO `Has_favourite_playlist`VALUES (7, 3, 2);
INSERT INTO `Has_favourite_playlist`VALUES (8, 4, 1);
INSERT INTO `Has_favourite_playlist`VALUES (9, 5, 1);

INSERT INTO `Similar_artist`VALUES (1, 1, 2);
INSERT INTO `Similar_artist`VALUES (2, 1, 3);
INSERT INTO `Similar_artist`VALUES (3, 2, 4);
INSERT INTO `Similar_artist`VALUES (4, 2, 5);
INSERT INTO `Similar_artist`VALUES (5, 3, 2);
INSERT INTO `Similar_artist`VALUES (6, 3, 4);

INSERT INTO `Has_song` VALUES (1, 2, 1, 4, '2020-03-02');
INSERT INTO `Has_song` VALUES (2, 2, 2, 4, '2020-03-02');
INSERT INTO `Has_song` VALUES (3, 1, 3, 3, '2020-03-02');
INSERT INTO `Has_song` VALUES (4, 1, 4, 3, '2020-03-02');
INSERT INTO `Has_song` VALUES (5, 3, 2, 3, '2020-03-02');
INSERT INTO `Has_song` VALUES (6, 4, 3, 5, '2020-03-02');

INSERT INTO `Following`VALUES (1, 2, 1);
INSERT INTO `Following`VALUES (2, 2, 2);
INSERT INTO `Following`VALUES (3, 2, 3);
INSERT INTO `Following`VALUES (4, 3, 1);
INSERT INTO `Following`VALUES (5, 4, 1);
INSERT INTO `Following`VALUES (6, 3, 2);

INSERT INTO `Has_favourite_album` VALUES (1, 1, 2); 
INSERT INTO `Has_favourite_album` VALUES (2, 1, 3); 
INSERT INTO `Has_favourite_album` VALUES (3, 2, 3); 
INSERT INTO `Has_favourite_album` VALUES (4, 2, 2); 
INSERT INTO `Has_favourite_album` VALUES (5, 3, 1); 
INSERT INTO `Has_favourite_album` VALUES (6 ,3, 2); 

