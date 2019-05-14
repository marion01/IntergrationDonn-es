SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `ConvocationRattrapage` ;
CREATE SCHEMA IF NOT EXISTS `ConvocationRattrapage` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
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
  INDEX `idEpreuve` (`idEpreuve` ASC) ,
  INDEX `idFiliere` (`idFiliere` ASC) ,
  CONSTRAINT `idEpreuve2`
    FOREIGN KEY (`idEpreuve` )
    REFERENCES `ConvocationRattrapage`.`Epreuve` (`idEpreuve` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idFiliere`
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
  INDEX `idEleve` (`idEleve` ASC) ,
  CONSTRAINT `idFiliere2`
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



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
