/*La creació d'aquesta BBDD no funciona del tot. Estan comentades les taules que dan error. No acabo d'entendre perquè apareixen
aquests errors. No em sembla que es tracti d'un error del tipus tauloa creada referenciant taules que encara no existeixen ja que l'ordre
de creació em sembla lògic. Mirar el seguent enllaç
https://es.stackoverflow.com/questions/291998/error-1822-failed-to-add-foreign-key-constraint-missing-index-for-constraint
*/

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
CREATE TABLE IF NOT EXISTS `spoty`.`Subscripció` (
  `id_subscripció` INT NOT NULL,
  `data_inici` DATETIME NOT NULL,
  `data_renovacio` DATETIME NOT NULL,
  `forma_pagament` VARCHAR(5) NOT NULL,
  `usuari_id` INT NOT NULL,
  PRIMARY KEY (`id_subscripció`),
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
    REFERENCES `spoty`.`Usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `total` DECIMAL(6) NOT NULL,
  PRIMARY KEY (`id_pagament`),
    FOREIGN KEY (`usuari_id`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `durada` DATETIME NOT NULL,
  `reproduccions` INT NOT NULL,
  `album_id` INT NULL,
 -- CONSTRAINT `album`
    FOREIGN KEY (`album_id`)
    REFERENCES `spoty`.`Album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Has_favourite_song`
-- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `spoty`.`Has_favourite_song` (
--   `id_has_favourite_song` INT NOT NULL,
--   `song_id` INT NOT NULL,
--   `usuari_id` INT NOT NULL,
--   PRIMARY KEY (`id_has_favourite_song`),
--  -- CONSTRAINT `song`
--     FOREIGN KEY (`song_id`)
--     REFERENCES `spoty`.`Song` (`id_song`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--  -- CONSTRAINT `usuari`
--     FOREIGN KEY (`usuari_id`)
--     REFERENCES `spoty`.`Usuari` (`id_usuari`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Has_favourite_playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Has_favourite_playlist` (
  `id_has_favourite_playlist` INT NOT NULL,
  `playlist_id` INT NOT NULL,
  `usuari_id` INT NOT NULL,
  PRIMARY KEY (`id_has_favourite_playlist`),
-- CONSTRAINT `playlist`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spoty`.`Playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
--  CONSTRAINT `usuari`
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
--  CONSTRAINT `artist`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spoty`.`Artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
--  CONSTRAINT `similar_artist`
    FOREIGN KEY (`similar_artist_id`)
    REFERENCES `spoty`.`Artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Has_song`
-- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `spoty`.`Has_song` (
--   `id_has_song` INT NOT NULL,
--   `playlist_id` INT NOT NULL,
--   `song_id` INT NOT NULL,
--   `usuari_contribucio_id` INT NOT NULL,
--   `data_contribucio` DATETIME NOT NULL,
--   PRIMARY KEY (`id_has_song`),
-- --  CONSTRAINT `playlist`
--     FOREIGN KEY (`playlist_id`)
--     REFERENCES `spoty`.`Playlist` (`id_playlist`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
-- --  CONSTRAINT `song`
--     FOREIGN KEY (`song_id`)
--     REFERENCES `spoty`.`Song` (`id_song`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
-- -- CONSTRAINT `usuari_contrib`
--     FOREIGN KEY (`usuari_contribucio_id`)
--     REFERENCES `spoty`.`Usuari` (`id_usuari`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Following`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Following` (
  `id_following` INT NOT NULL,
  `usuari_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`id_following`),
--  CONSTRAINT `usuari`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
--  CONSTRAINT `artista`
    FOREIGN KEY (`artista_id`)
    REFERENCES `spoty`.`Artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Has_favourite_album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spoty`.`Has_favourite_album` (
  `id_has_favourite_album` INT NOT NULL,
  `usuari_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`id_has_favourite_album`),
--  CONSTRAINT `usuari`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `spoty`.`Usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
--  CONSTRAINT `album`
    FOREIGN KEY (`album_id`)
    REFERENCES `spoty`.`Album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
