SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`FiliereAnnee`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`FiliereAnnee` (
  `idFiliere` INT NOT NULL ,
  `nomFiliere` VARCHAR(45) NOT NULL ,
  `niveauFiliere` VARCHAR(45) NOT NULL ,
  `anneeFiliere` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idFiliere`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Eleve`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Eleve` (
  `idEleve` INT NOT NULL ,
  `nomEtudiant` VARCHAR(45) NOT NULL ,
  `prenomEtudiant` VARCHAR(45) NOT NULL ,
  `idFiliere` INT NULL ,
  PRIMARY KEY (`idEleve`) ,
  INDEX `idFiliere` () ,
  CONSTRAINT `idFiliere`
    FOREIGN KEY ()
    REFERENCES `mydb`.`FiliereAnnee` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Prof`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Prof` (
  `idProf` INT NOT NULL ,
  `nomProf` VARCHAR(45) NOT NULL ,
  `prenomProf` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idProf`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Epreuve`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Epreuve` (
  `idEpreuve` INT NOT NULL ,
  `dateEpreuve` DATE NOT NULL ,
  `salleEpreuve` VARCHAR(45) NULL ,
  `idProf` INT NOT NULL ,
  `nomEpreuve` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idEpreuve`) ,
  INDEX `idProf` () ,
  CONSTRAINT `idProf`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Prof` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Convocation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Convocation` (
  `idEleve` INT NOT NULL ,
  `idEpreuve` INT NOT NULL ,
  PRIMARY KEY (`idEleve`, `idEpreuve`) ,
  INDEX `idEleve` () ,
  INDEX `idEpreuve` () ,
  CONSTRAINT `idEleve`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Eleve` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEpreuve`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Epreuve` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FiliereEpreuve`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`FiliereEpreuve` (
  `idEpreuve` INT NOT NULL ,
  `idFiliere` INT NOT NULL ,
  PRIMARY KEY (`idEpreuve`, `idFiliere`) ,
  INDEX `idEpreuve` () ,
  INDEX `idFiliere` () ,
  CONSTRAINT `idEpreuve`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Epreuve` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idFiliere`
    FOREIGN KEY ()
    REFERENCES `mydb`.`FiliereAnnee` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
