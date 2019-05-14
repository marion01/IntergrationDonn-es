SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `ConvocationRattrapage` ;
CREATE SCHEMA IF NOT EXISTS `ConvocationRattrapage` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
DROP SCHEMA IF EXISTS `entrepotRattrapage` ;
CREATE SCHEMA IF NOT EXISTS `entrepotRattrapage` ;
USE `ConvocationRattrapage` ;

-- -----------------------------------------------------
-- Table `ConvocationRattrapage`.`Eleve`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ConvocationRattrapage`.`Eleve` ;

CREATE  TABLE IF NOT EXISTS `ConvocationRattrapage`.`Eleve` (
  `idEleve` INT NOT NULL AUTO_INCREMENT ,
  `nomEtudiant` VARCHAR(45) NOT NULL ,
  `prenomEtudiant` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idEleve`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConvocationRattrapage`.`Prof`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ConvocationRattrapage`.`Prof` ;

CREATE  TABLE IF NOT EXISTS `ConvocationRattrapage`.`Prof` (
  `idProf` INT NOT NULL AUTO_INCREMENT ,
  `nomProf` VARCHAR(45) NOT NULL ,
  `prenomProf` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idProf`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConvocationRattrapage`.`Epreuve`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ConvocationRattrapage`.`Epreuve` ;

CREATE  TABLE IF NOT EXISTS `ConvocationRattrapage`.`Epreuve` (
  `idEpreuve` INT NOT NULL AUTO_INCREMENT ,
  `dateEpreuve` DATE NOT NULL ,
  `salleEpreuve` VARCHAR(45) NULL ,
  `idProf` INT NOT NULL ,
  `nomEpreuve` VARCHAR(45) NOT NULL ,
  `anneeScolaire` VARCHAR(45) NOT NULL ,
  `niveau` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idEpreuve`) ,
  INDEX `idProf` (`idProf` ASC) ,
  CONSTRAINT `idProf`
    FOREIGN KEY (`idProf` )
    REFERENCES `ConvocationRattrapage`.`Prof` (`idProf` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConvocationRattrapage`.`Filiere`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ConvocationRattrapage`.`Filiere` ;

CREATE  TABLE IF NOT EXISTS `ConvocationRattrapage`.`Filiere` (
  `idFiliere` INT NOT NULL AUTO_INCREMENT ,
  `nomFiliere` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idFiliere`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConvocationRattrapage`.`Convocation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ConvocationRattrapage`.`Convocation` ;

CREATE  TABLE IF NOT EXISTS `ConvocationRattrapage`.`Convocation` (
  `idEleve` INT NOT NULL ,
  `idEpreuve` INT NOT NULL ,
  PRIMARY KEY (`idEleve`, `idEpreuve`) ,
  INDEX `idEleve` (`idEleve` ASC) ,
  INDEX `idEpreuve` (`idEpreuve` ASC) ,
  CONSTRAINT `idEleve`
    FOREIGN KEY (`idEleve` )
    REFERENCES `ConvocationRattrapage`.`Eleve` (`idEleve` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEpreuve`
    FOREIGN KEY (`idEpreuve` )
    REFERENCES `ConvocationRattrapage`.`Epreuve` (`idEpreuve` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConvocationRattrapage`.`FiliereEpreuve`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ConvocationRattrapage`.`FiliereEpreuve` ;

CREATE  TABLE IF NOT EXISTS `ConvocationRattrapage`.`FiliereEpreuve` (
  `idEpreuve` INT NOT NULL ,
  `idFiliere` INT NOT NULL ,
  PRIMARY KEY (`idEpreuve`, `idFiliere`) ,
  INDEX `idEpreuve2` (`idEpreuve` ASC) ,
  INDEX `idFiliere2` (`idFiliere` ASC) ,
  CONSTRAINT `idEpreuve2`
    FOREIGN KEY (`idEpreuve` )
    REFERENCES `ConvocationRattrapage`.`Epreuve` (`idEpreuve` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idFiliere2`
    FOREIGN KEY (`idFiliere` )
    REFERENCES `ConvocationRattrapage`.`Filiere` (`idFiliere` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConvocationRattrapage`.`EleveAnnee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ConvocationRattrapage`.`EleveAnnee` ;

CREATE  TABLE IF NOT EXISTS `ConvocationRattrapage`.`EleveAnnee` (
  `idEleve` INT NOT NULL ,
  `annee` VARCHAR(45) NOT NULL ,
  `niveau` VARCHAR(45) NULL ,
  `idFiliere` INT NOT NULL ,
  PRIMARY KEY (`idEleve`, `annee`) ,
  INDEX `idFiliere` (`idFiliere` ASC) ,
  INDEX `idEleve2` (`idEleve` ASC) ,
  CONSTRAINT `idFiliere`
    FOREIGN KEY (`idFiliere` )
    REFERENCES `ConvocationRattrapage`.`Filiere` (`idFiliere` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEleve2`
    FOREIGN KEY (`idEleve` )
    REFERENCES `ConvocationRattrapage`.`Eleve` (`idEleve` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `entrepotRattrapage` ;

-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_etu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_etu` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_etu` (
  `codeEtudiant` INT NOT NULL ,
  `nom` VARCHAR(45) NULL ,
  `prenom` VARCHAR(45) NULL ,
  PRIMARY KEY (`codeEtudiant`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_age`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_age` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_age` (
  `age` INT NOT NULL ,
  `cat_age` VARCHAR(45) NULL ,
  PRIMARY KEY (`age`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_nationalite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_nationalite` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_nationalite` (
  `nationalite` VARCHAR(45) NOT NULL ,
  `cat_nationalite` VARCHAR(45) NULL ,
  PRIMARY KEY (`nationalite`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_bac`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_bac` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_bac` (
  `bac` VARCHAR(45) NOT NULL ,
  `cat_bac` VARCHAR(45) NULL ,
  PRIMARY KEY (`bac`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_geo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_geo` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_geo` (
  `ville` VARCHAR(45) NOT NULL ,
  `dept` VARCHAR(45) NULL ,
  `region` VARCHAR(45) NULL ,
  `pays` VARCHAR(45) NULL ,
  PRIMARY KEY (`ville`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_csp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_csp` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_csp` (
  `csp` INT NOT NULL ,
  `cat_csp` INT NULL ,
  PRIMARY KEY (`csp`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`D_provenance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`D_provenance` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`D_provenance` (
  `provenance` VARCHAR(45) NOT NULL ,
  `cat_provenance` VARCHAR(45) NULL ,
  PRIMARY KEY (`provenance`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepotRattrapage`.`Etudiants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `entrepotRattrapage`.`Etudiants` ;

CREATE  TABLE IF NOT EXISTS `entrepotRattrapage`.`Etudiants` (
  `codeEtudiant` INT NOT NULL ,
  `annee` VARCHAR(45) NULL ,
  `age` INT NULL ,
  `sexe` VARCHAR(45) NULL ,
  `nationalite` VARCHAR(45) NULL ,
  `bac` VARCHAR(45) NULL ,
  `ville` VARCHAR(45) NULL ,
  `niveau` VARCHAR(45) NULL ,
  `csp` INT NULL ,
  `lv2` VARCHAR(45) NULL ,
  `provenance` VARCHAR(45) NULL ,
  `filiere` VARCHAR(45) NULL ,
  `nbRattrapage` INT NULL ,
  PRIMARY KEY (`codeEtudiant`) ,
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
