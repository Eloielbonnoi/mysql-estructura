DROP DATABASE IF EXISTS `yutup`;
CREATE DATABASE `yutup` CHARACTER SET utf8mb4;
USE `yutup`;

CREATE TABLE IF NOT EXISTS `Usuari` (
  `id_usuari_canal` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(9) NOT NULL,
  `data_naixement` DATETIME NULL,
  `sexe` ENUM ('H', 'M') NOT NULL,
  `pais` VARCHAR(2) NULL,
  `codi_postal` INT(5) NULL,
  `tipus_user`VARCHAR(45) NOT NULL DEFAULT 'Free', 
  `nom_canal`VARCHAR(45) NOT NULL,
  `descripcio_canal` VARCHAR(45) NULL,
  `data_creacio_canal`DATETIME NOT NULL, 
  PRIMARY KEY (`id_usuari_canal`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Subscripcio` (
  `id_subscripcio` INT NOT NULL AUTO_INCREMENT,
  `data_inici` DATETIME NOT NULL,
  `data_renovacio` DATETIME NOT NULL,
  `forma_pagament`VARCHAR (45),
  `id_usuari`INT NOT NULL,
  PRIMARY KEY (`id_subscripcio`),
  FOREIGN KEY (`id_usuari`)
    REFERENCES `yutup`.`Usuari` (`id_usuari_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Etiqueta` (
  `id_etiqueta` INT NOT NULL AUTO_INCREMENT,
  `nom_etiqueta` VARCHAR(45) NOT NULL,
  `usuari` INT NOT NULL,
  `data_publicacio` DATETIME NOT NULL,
  PRIMARY KEY (`id_etiqueta`),
    FOREIGN KEY (`usuari`)
    REFERENCES `yutup`.`Usuari` (`id_usuari_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Video` (
  `id_video` INT NOT NULL AUTO_INCREMENT,
  `titol` VARCHAR(45) NOT NULL,
  `descripcio` VARCHAR(45) NULL,
  `tamany` INT(4) NOT NULL,
  `nom_arxiu` VARCHAR(45) NOT NULL,
  `durada` DATETIME NOT NULL,
  `thumbnail` BLOB NULL,
  `num_reproduccions` INT NOT NULL,
  `num_likes` INT NOT NULL,
  `dislikes` VARCHAR(45) NOT NULL,
  `estat` VARCHAR(45) NOT NULL,
  `etiqueta` INT NULL,
  PRIMARY KEY (`id_video`),
    FOREIGN KEY (`etiqueta`)
    REFERENCES `yutup`.`Etiqueta` (`id_etiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Playlist` (
  `id_playlist` INT NOT NULL AUTO_INCREMENT,
  `nom_playlist` VARCHAR(45) NULL DEFAULT 'NO_NAME',
  `data_creacio` DATETIME NOT NULL,
  `estat` VARCHAR(10) NOT NULL,
  `creador`INT NOT NULL,
  PRIMARY KEY (`id_playlist`),
  FOREIGN KEY (`creador`)
    REFERENCES `yutup`.`Usuari` (`id_usuari_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Comentari` (
  `idComentari` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(45) NOT NULL,
  `data` DATETIME NOT NULL,
  `usuari_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`idComentari`),
    FOREIGN KEY (`usuari_id`)
    REFERENCES `yutup`.`Usuari` (`id_usuari_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`video_id`)
    REFERENCES `yutup`.`Video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Usuaris_subscriuen_canals` (
  `id_Usuaris_subscriuen_canals` INT NOT NULL AUTO_INCREMENT,
  `id_canal`INT NOT NULL,
  `id_usuari_subscrit`INT NOT NULL,
  PRIMARY KEY (`id_Usuaris_subscriuen_canals`),
    FOREIGN KEY (`id_canal`)
    REFERENCES `yutup`.`Usuari`(`id_usuari_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`id_usuari_subscrit`)
    REFERENCES `yutup`.`Usuari`(`id_usuari_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Canal_te_video` (
  `id_Canal_te_video` INT NOT NULL AUTO_INCREMENT,
  `usuari_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`id_Canal_te_video`),
    FOREIGN KEY (`usuari_id`)
    REFERENCES `yutup`.`Usuari` (`id_usuari_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`video_id`)
    REFERENCES `yutup`.`Video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Videos_a_playlist` (
  `id_Videos_a_playlist` INT NOT NULL AUTO_INCREMENT,
  `video_id` INT NOT NULL,
  `playlist_id` INT NOT NULL,
  PRIMARY KEY (`id_Videos_a_playlist`),
    FOREIGN KEY (`video_id`)
    REFERENCES `yutup`.`Video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`playlist_id`)
    REFERENCES `yutup`.`Playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Likes_dislikes` (
  `id_Likes_dislikes` INT NOT NULL AUTO_INCREMENT,
  `usuari_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `comentari_id` INT NULL,
  `like` INT NULL,
  `dislike` INT NULL,
  PRIMARY KEY (`id_Likes_dislikes`),
    FOREIGN KEY (`usuari_id`)
    REFERENCES `yutup`.`Usuari` (`id_usuari_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`video_id`)
    REFERENCES `yutup`.`Video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`comentari_id`)
    REFERENCES `yutup`.`Comentari` (`idComentari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
