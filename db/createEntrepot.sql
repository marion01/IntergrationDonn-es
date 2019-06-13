SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `entrepotRattrapage` ;
CREATE SCHEMA IF NOT EXISTS `entrepotRattrapage` ;
USE `entrepotRattrapage` ;

-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_etu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_etu` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_etu` (
  `codeEtudiant` INT NOT NULL ,
  `nom` VARCHAR(45) NULL DEFAULT NULL ,
  `prenom` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`codeEtudiant`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_age`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_age` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_age` (
  `age` INT NOT NULL ,
  `cat_age` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`age`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_nationalite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_nationalite` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_nationalite` (
  `nationalite` VARCHAR(45) NOT NULL ,
  `cat_nationalite` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`nationalite`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_bac`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_bac` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_bac` (
  `bac` VARCHAR(45) NOT NULL ,
  `cat_bac` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`bac`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_geo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_geo` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_geo` (
  `ville` VARCHAR(45) NOT NULL ,
  `dept` VARCHAR(45) NULL DEFAULT NULL ,
  `region` VARCHAR(45) NULL DEFAULT NULL ,
  `pays` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`ville`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_csp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_csp` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_csp` (
  `csp` INT NOT NULL ,
  `cat_csp` VARCHAR(150) NULL DEFAULT NULL ,
  PRIMARY KEY (`csp`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_provenance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_provenance` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_provenance` (
  `provenance` VARCHAR(45) NOT NULL ,
  `cat_provenance` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`provenance`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`Etudiants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`Etudiants` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`Etudiants` (
  `codeEtudiant` INT NOT NULL ,
  `annee` VARCHAR(45) NULL DEFAULT NULL ,
  `age` INT NULL DEFAULT NULL ,
  `sexe` VARCHAR(45) NULL DEFAULT NULL ,
  `nationalite` VARCHAR(45) NULL DEFAULT NULL ,
  `bac` VARCHAR(45) NULL DEFAULT NULL ,
  `ville` VARCHAR(45) NULL DEFAULT NULL ,
  `niveau` VARCHAR(45) NULL DEFAULT NULL ,
  `csp` INT NULL DEFAULT NULL ,
  `lv2` VARCHAR(45) NULL DEFAULT NULL ,
  `provenance` VARCHAR(45) NULL DEFAULT NULL ,
  `filiere` VARCHAR(45) NULL DEFAULT NULL ,
  `nbRattrapage` INT NULL DEFAULT '0' ,
  PRIMARY KEY (`codeEtudiant`,`annee`) ,
  INDEX `codeEtudiant` (`codeEtudiant` ASC) ,
  INDEX `age` (`age` ASC) ,
  INDEX `nationalite` (`nationalite` ASC) ,
  INDEX `bac` (`bac` ASC) ,
  INDEX `ville` (`ville` ASC) ,
  INDEX `csp` (`csp` ASC) ,
  INDEX `provenance` (`provenance` ASC) ,
  CONSTRAINT `codeEtudiant`
    FOREIGN KEY (`codeEtudiant` )
    REFERENCES `entrepotRattrapage`.`D_etu` (`codeEtudiant` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `age`
    FOREIGN KEY (`age` )
    REFERENCES `entrepotRattrapage`.`D_age` (`age` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nationalite`
    FOREIGN KEY (`nationalite` )
    REFERENCES `entrepotRattrapage`.`D_nationalite` (`nationalite` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bac`
    FOREIGN KEY (`bac` )
    REFERENCES `entrepotRattrapage`.`D_bac` (`bac` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ville`
    FOREIGN KEY (`ville` )
    REFERENCES `entrepotRattrapage`.`D_geo` (`ville` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `csp`
    FOREIGN KEY (`csp` )
    REFERENCES `entrepotRattrapage`.`D_csp` (`csp` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `provenance`
    FOREIGN KEY (`provenance` )
    REFERENCES `entrepotRattrapage`.`D_provenance` (`provenance` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
