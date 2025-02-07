-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercici6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercici6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercici6` ;
USE `exercici6` ;

-- -----------------------------------------------------
-- Table `exercici6`.`Passatger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici6`.`Passatger` (
  `idPassatger` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Direccio` VARCHAR(100) NULL,
  PRIMARY KEY (`idPassatger`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici6`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici6`.`Avio` (
  `idAvio` INT NOT NULL,
  `Companyia` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Capacitat` INT NULL,
  PRIMARY KEY (`idAvio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici6`.`Vol` (
  `idVol` INT NOT NULL,
  `NumeroVol` VARCHAR(7) NULL,
  `Origen` VARCHAR(45) NULL,
  `Desti` VARCHAR(45) NULL,
  `Sortida` VARCHAR(45) NULL,
  `Arribada` VARCHAR(45) NULL,
  `Avio_idAvio` INT NOT NULL,
  PRIMARY KEY (`idVol`),
  INDEX `fk_Vol_Avio1_idx` (`Avio_idAvio` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avio1`
    FOREIGN KEY (`Avio_idAvio`)
    REFERENCES `exercici6`.`Avio` (`idAvio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici6`.`Reserva` (
  `idReserva` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `NumeroReserva` VARCHAR(45) NULL,
  `Import` VARCHAR(45) NULL,
  `Passatger_idPassatger` INT NOT NULL,
  `Vol_idVol` INT NOT NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_Reserva_Passatger_idx` (`Passatger_idPassatger` ASC) VISIBLE,
  INDEX `fk_Reserva_Vol1_idx` (`Vol_idVol` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Passatger`
    FOREIGN KEY (`Passatger_idPassatger`)
    REFERENCES `exercici6`.`Passatger` (`idPassatger`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Vol1`
    FOREIGN KEY (`Vol_idVol`)
    REFERENCES `exercici6`.`Vol` (`idVol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
