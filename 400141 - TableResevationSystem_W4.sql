-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Table Reservation System
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Table Reservation System
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Table Reservation System` DEFAULT CHARACTER SET utf8 ;
USE `Table Reservation System` ;

-- -----------------------------------------------------
-- Table `Table Reservation System`.`CustomerInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Table Reservation System`.`CustomerInfo` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(45) NOT NULL,
  `Phone` INT NOT NULL,
  `Addressline1` VARCHAR(100) NOT NULL,
  `Addressline2` VARCHAR(100) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `PostalCode` INT NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `EmailAddress` VARCHAR(45) NOT NULL,
  `TypeofUser` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Table Reservation System`.`Restaurants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Table Reservation System`.`Restaurants` (
  `RestaurantID` INT NOT NULL,
  `RestaurantLocation` VARCHAR(45) NULL,
  `RestaurantsName` VARCHAR(45) NULL,
  `RestaurantsPhoneNumber` VARCHAR(45) NULL,
  `CrusineName` VARCHAR(45) NULL,
  `RestaurantTimings` VARCHAR(45) NULL,
  `RestaurantMenu` VARCHAR(45) NULL,
  PRIMARY KEY (`RestaurantID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Table Reservation System`.`Tables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Table Reservation System`.`Tables` (
  `TableID` INT NOT NULL,
  `TableLocation` VARCHAR(45) NOT NULL,
  `TypeofTable` VARCHAR(45) NOT NULL,
  `SeatingCapacity` INT NOT NULL,
  PRIMARY KEY (`TableID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Table Reservation System`.`Device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Table Reservation System`.`Device` (
  `DeviceID` INT NOT NULL,
  `DeviceType` VARCHAR(45) NOT NULL,
  `DeviceOS` VARCHAR(45) NOT NULL,
  `BookingConfirmationNotification` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DeviceID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Table Reservation System`.`BookingStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Table Reservation System`.`BookingStatus` (
  `BookingStatusID` INT NOT NULL,
  `BookingStatusName` VARCHAR(45) NOT NULL,
  `PaymentOption1` INT NOT NULL,
  `PaymentOption2` INT NOT NULL,
  `TableID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `RestaurantID` INT NOT NULL,
  `DeviceID` INT NOT NULL,
  PRIMARY KEY (`BookingStatusID`),
  UNIQUE INDEX `BookingStatusID_UNIQUE` (`BookingStatusID` ASC) VISIBLE,
  INDEX `TableID_idx` (`TableID` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `RestaurantID_idx` (`RestaurantID` ASC) VISIBLE,
  INDEX `DeviceID_idx` (`DeviceID` ASC) VISIBLE,
  CONSTRAINT `TableID`
    FOREIGN KEY (`TableID`)
    REFERENCES `Table Reservation System`.`Tables` (`TableID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Table Reservation System`.`CustomerInfo` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RestaurantID`
    FOREIGN KEY (`RestaurantID`)
    REFERENCES `Table Reservation System`.`Restaurants` (`RestaurantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DeviceID`
    FOREIGN KEY (`DeviceID`)
    REFERENCES `Table Reservation System`.`Device` (`DeviceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
