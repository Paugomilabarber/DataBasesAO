-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercici2C
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercici2C
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercici2C` ;
USE `exercici2C` ;

-- -----------------------------------------------------
-- Table `exercici2C`.`Alumnat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2C`.`Alumnat` (
  `idAlumnat` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  PRIMARY KEY (`idAlumnat`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici2C`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2C`.`Matricula` (
  `idMatricula` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `NumMatricula` VARCHAR(45) NULL,
  `Alumnat_idAlumnat` INT NOT NULL,
  PRIMARY KEY (`idMatricula`),
  INDEX `fk_Matricula_Alumnat_idx` (`Alumnat_idAlumnat` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumnat`
    FOREIGN KEY (`Alumnat_idAlumnat`)
    REFERENCES `exercici2C`.`Alumnat` (`idAlumnat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici2C`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2C`.`Professor` (
  `idProfessor` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Titol` VARCHAR(45) NULL,
  PRIMARY KEY (`idProfessor`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici2C`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2C`.`Assignatura` (
  `idAssignatura` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Credits` VARCHAR(45) NULL,
  `Departament` VARCHAR(45) NULL,
  `Professor_idProfessor` INT NOT NULL,
  PRIMARY KEY (`idAssignatura`),
  INDEX `fk_Assignatura_Professor1_idx` (`Professor_idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_Assignatura_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `exercici2C`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici2C`.`LiniaMatricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2C`.`LiniaMatricula` (
  `idLiniaMatricula` INT NOT NULL,
  `TipusMatricula` VARCHAR(45) NULL,
  `Matricula_idMatricula` INT NOT NULL,
  `Assignatura_idAssignatura` INT NOT NULL,
  PRIMARY KEY (`idLiniaMatricula`),
  INDEX `fk_LiniaMatricula_Matricula1_idx` (`Matricula_idMatricula` ASC) VISIBLE,
  INDEX `fk_LiniaMatricula_Assignatura1_idx` (`Assignatura_idAssignatura` ASC) VISIBLE,
  CONSTRAINT `fk_LiniaMatricula_Matricula1`
    FOREIGN KEY (`Matricula_idMatricula`)
    REFERENCES `exercici2C`.`Matricula` (`idMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LiniaMatricula_Assignatura1`
    FOREIGN KEY (`Assignatura_idAssignatura`)
    REFERENCES `exercici2C`.`Assignatura` (`idAssignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici2C`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2C`.`Departament` (
  `idDepartament` INT NOT NULL,
  `NumDep` VARCHAR(45) NULL,
  `CapDep` VARCHAR(45) NULL,
  `Professor_idProfessor` INT NOT NULL,
  PRIMARY KEY (`idDepartament`),
  INDEX `fk_Departament_Professor1_idx` (`Professor_idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_Departament_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `exercici2C`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
