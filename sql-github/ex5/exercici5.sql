-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercici5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercici5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercici5` ;
USE `exercici5` ;

-- -----------------------------------------------------
-- Table `exercici5`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici5`.`Clients` (
  `idClients` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Telefon` VARCHAR(12) NULL,
  `Usuari` VARCHAR(45) NOT NULL,
  `Contrasenya` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idClients`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  UNIQUE INDEX `Usuari_UNIQUE` (`Usuari` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici5`.`Vehicle` (
  `idVehicle` INT NOT NULL,
  `Marca` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `Matricula` VARCHAR(45) NOT NULL,
  `NumCarroseria` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Clients_idClients` INT NOT NULL,
  PRIMARY KEY (`idVehicle`),
  UNIQUE INDEX `NumCarroseria_UNIQUE` (`NumCarroseria` ASC) VISIBLE,
  UNIQUE INDEX `Matricula_UNIQUE` (`Matricula` ASC) VISIBLE,
  INDEX `fk_Vehicle_Clients_idx` (`Clients_idClients` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Clients`
    FOREIGN KEY (`Clients_idClients`)
    REFERENCES `exercici5`.`Clients` (`idClients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici5`.`Treballador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici5`.`Treballador` (
  `idTreballador` INT NOT NULL,
  `NomEmpleat` VARCHAR(45) NULL,
  `CognomsEmpleat` VARCHAR(45) NULL,
  `EmailEmpleat` VARCHAR(45) NULL,
  `TelefonEmpleat` VARCHAR(45) NULL,
  `DNIempleat` VARCHAR(45) NULL,
  PRIMARY KEY (`idTreballador`),
  UNIQUE INDEX `DNIempleat_UNIQUE` (`DNIempleat` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici5`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici5`.`Cita` (
  `idCita` INT NOT NULL,
  `Data` DATE NULL,
  `Hora` VARCHAR(45) NULL,
  `Box` VARCHAR(45) NULL,
  `Vehicle_idVehicle` INT NOT NULL,
  `Treballador_idTreballador` INT NOT NULL,
  PRIMARY KEY (`idCita`),
  INDEX `fk_Cita_Vehicle1_idx` (`Vehicle_idVehicle` ASC) VISIBLE,
  INDEX `fk_Cita_Treballador1_idx` (`Treballador_idTreballador` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Vehicle1`
    FOREIGN KEY (`Vehicle_idVehicle`)
    REFERENCES `exercici5`.`Vehicle` (`idVehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cita_Treballador1`
    FOREIGN KEY (`Treballador_idTreballador`)
    REFERENCES `exercici5`.`Treballador` (`idTreballador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
