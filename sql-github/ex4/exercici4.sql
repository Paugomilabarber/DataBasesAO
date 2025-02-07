-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercici4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercici4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercici4` ;
USE `exercici4` ;

-- -----------------------------------------------------
-- Table `exercici4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici4`.`Client` (
  `idClient` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `NumTelefon` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `VIP` VARCHAR(45) NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici4`.`TipusPolissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici4`.`TipusPolissa` (
  `idTipusPolissa` INT NOT NULL,
  `automovil` VARCHAR(45) NULL,
  `vida` VARCHAR(45) NULL,
  `llar` VARCHAR(45) NULL,
  `viatge` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipusPolissa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici4`.`Polissa` (
  `idPolissa` INT NOT NULL,
  `preuANUAL` VARCHAR(45) NOT NULL,
  `iniciVIGENCIA` VARCHAR(45) NULL,
  `numPOLISSA` VARCHAR(45) NULL,
  `dataCONTRATACIO` VARCHAR(45) NULL,
  `fiVIGENCIA` VARCHAR(45) NULL,
  `Client_idClient` INT NOT NULL,
  `TipusPolissa_idTipusPolissa` INT NOT NULL,
  PRIMARY KEY (`idPolissa`),
  INDEX `fk_Polissa_Client_idx` (`Client_idClient` ASC) VISIBLE,
  INDEX `fk_Polissa_TipusPolissa1_idx` (`TipusPolissa_idTipusPolissa` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Client`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `exercici4`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_TipusPolissa1`
    FOREIGN KEY (`TipusPolissa_idTipusPolissa`)
    REFERENCES `exercici4`.`TipusPolissa` (`idTipusPolissa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici4`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici4`.`Venedor` (
  `idVenedor` INT NOT NULL,
  `NOM` VARCHAR(45) NULL,
  `dni` VARCHAR(45) NULL,
  `cognoms` VARCHAR(45) NULL,
  `Polissa_idPolissa` INT NOT NULL,
  PRIMARY KEY (`idVenedor`),
  INDEX `fk_Venedor_Polissa1_idx` (`Polissa_idPolissa` ASC) VISIBLE,
  CONSTRAINT `fk_Venedor_Polissa1`
    FOREIGN KEY (`Polissa_idPolissa`)
    REFERENCES `exercici4`.`Polissa` (`idPolissa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
