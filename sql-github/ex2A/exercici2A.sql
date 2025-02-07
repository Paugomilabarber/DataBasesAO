-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ex2A
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ex2A
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ex2A` ;
USE `ex2A` ;

-- -----------------------------------------------------
-- Table `ex2A`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2A`.`Pacient` (
  `idPacient` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `SS` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  PRIMARY KEY (`idPacient`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  UNIQUE INDEX `SS_UNIQUE` (`SS` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2A`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2A`.`Metge` (
  `idMetge` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `NumeroColegiat` VARCHAR(45) NOT NULL,
  `Especialitat` VARCHAR(45) NULL,
  `Carrec` VARCHAR(45) NULL,
  PRIMARY KEY (`idMetge`),
  UNIQUE INDEX `NumeroColegiat_UNIQUE` (`NumeroColegiat` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2A`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2A`.`Cita` (
  `idCita` INT NOT NULL,
  `Consulta` VARCHAR(45) NOT NULL,
  `Data` VARCHAR(45) NULL,
  `Llit` VARCHAR(45) NULL,
  `Planta` VARCHAR(45) NOT NULL,
  `Diagnostic` VARCHAR(45) NOT NULL,
  `Pacient_idPacient` INT NOT NULL,
  `Metge_idMetge` INT NOT NULL,
  PRIMARY KEY (`idCita`),
  INDEX `fk_Cita_Pacient_idx` (`Pacient_idPacient` ASC) VISIBLE,
  INDEX `fk_Cita_Metge1_idx` (`Metge_idMetge` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Pacient`
    FOREIGN KEY (`Pacient_idPacient`)
    REFERENCES `ex2A`.`Pacient` (`idPacient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cita_Metge1`
    FOREIGN KEY (`Metge_idMetge`)
    REFERENCES `ex2A`.`Metge` (`idMetge`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
