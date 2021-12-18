-- MySQL Script generated by MySQL Workbench
-- Sun Dec  5 15:57:13 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Post` (
  `idPost` INT NOT NULL,
  `Post_name` VARCHAR(45) NULL,
  PRIMARY KEY (`idPost`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `idEmployee` INT NOT NULL,
  `LFP` VARCHAR(45) NULL,
  `Passport` VARCHAR(45) NULL,
  `INN` VARCHAR(45) NULL,
  `Phone_number` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Post_idPost` INT NOT NULL,
  PRIMARY KEY (`idEmployee`, `Post_idPost`),
  INDEX `fk_Employee_Post1_idx` (`Post_idPost` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Post1`
    FOREIGN KEY (`Post_idPost`)
    REFERENCES `mydb`.`Post` (`idPost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Timetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Timetable` (
  `idTimetable` INT NOT NULL,
  `Day_of_the_week` DATETIME NULL,
  ` Beginning_of_the_working_day` DATETIME NULL,
  `End_of_the_working_day` DATETIME NULL,
  `Employee_idEmployee` INT NOT NULL,
  PRIMARY KEY (`idTimetable`, `Employee_idEmployee`),
  INDEX `fk_Timetable_Employee_idx` (`Employee_idEmployee` ASC) VISIBLE,
  CONSTRAINT `fk_Timetable_Employee`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `mydb`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Monetary_transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Monetary_transactions` (
  `idMonetary_transactions` INT NOT NULL,
  `Appointment` VARCHAR(45) NULL,
  `Amount` DECIMAL(10,2) NULL,
  `Transaction_date` DATETIME NULL,
  PRIMARY KEY (`idMonetary_transactions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Purchase` (
  `idPurchase` INT NOT NULL,
  `Purchase_date` DATETIME NULL,
  `Completion_status` TINYINT(1) NULL,
  `Employee_idEmployee` INT NOT NULL,
  `Monetary_transactions_idMonetary_transactions` INT NOT NULL,
  PRIMARY KEY (`idPurchase`, `Employee_idEmployee`, `Monetary_transactions_idMonetary_transactions`),
  INDEX `fk_Purchase_Employee1_idx` (`Employee_idEmployee` ASC) VISIBLE,
  INDEX `fk_Purchase_Monetary_transactions1_idx` (`Monetary_transactions_idMonetary_transactions` ASC) VISIBLE,
  CONSTRAINT `fk_Purchase_Employee1`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `mydb`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Purchase_Monetary_transactions1`
    FOREIGN KEY (`Monetary_transactions_idMonetary_transactions`)
    REFERENCES `mydb`.`Monetary_transactions` (`idMonetary_transactions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `idProducts` INT NOT NULL,
  `Product_name` VARCHAR(45) NULL,
  `Quantity` INT(10) NULL,
  `Purchase_price` DECIMAL(10,2) UNSIGNED NULL,
  `Units` VARCHAR(45) NULL,
  `Selling_price` DECIMAL(10,2) UNSIGNED NULL,
  PRIMARY KEY (`idProducts`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Purchase_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Purchase_product` (
  `idPurchase_commodity` INT NOT NULL,
  `Quantity` INT(10) NULL,
  `Amount` DECIMAL(10,2) NULL,
  `Purchase_idPurchase` INT NOT NULL,
  `Purchase_Employee_idEmployee` INT NOT NULL,
  `Commodity_idCommodity` INT NOT NULL,
  PRIMARY KEY (`idPurchase_commodity`, `Purchase_idPurchase`, `Purchase_Employee_idEmployee`, `Commodity_idCommodity`),
  INDEX `fk_Purchase_commodity_Purchase1_idx` (`Purchase_idPurchase` ASC, `Purchase_Employee_idEmployee` ASC) VISIBLE,
  INDEX `fk_Purchase_commodity_Commodity1_idx` (`Commodity_idCommodity` ASC) VISIBLE,
  CONSTRAINT `fk_Purchase_commodity_Purchase1`
    FOREIGN KEY (`Purchase_idPurchase` , `Purchase_Employee_idEmployee`)
    REFERENCES `mydb`.`Purchase` (`idPurchase` , `Employee_idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Purchase_commodity_Commodity1`
    FOREIGN KEY (`Commodity_idCommodity`)
    REFERENCES `mydb`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Buyer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Buyer` (
  `idBuyer` INT NOT NULL,
  `LFP` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`idBuyer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `idOrder` INT NOT NULL,
  `Order_date` DATETIME NULL,
  `Completion_status` TINYINT(1) NULL,
  `Monetary_transactions_idMonetary_transactions` INT NOT NULL,
  `Buyer_idBuyer` INT NOT NULL,
  `Employee_idEmployee` INT NOT NULL,
  `Employee_Post_idPost` INT NOT NULL,
  PRIMARY KEY (`idOrder`, `Monetary_transactions_idMonetary_transactions`, `Buyer_idBuyer`, `Employee_idEmployee`, `Employee_Post_idPost`),
  INDEX `fk_Order_Monetary_transactions1_idx` (`Monetary_transactions_idMonetary_transactions` ASC) VISIBLE,
  INDEX `fk_Order_Buyer1_idx` (`Buyer_idBuyer` ASC) VISIBLE,
  INDEX `fk_Order_Employee1_idx` (`Employee_idEmployee` ASC, `Employee_Post_idPost` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Monetary_transactions1`
    FOREIGN KEY (`Monetary_transactions_idMonetary_transactions`)
    REFERENCES `mydb`.`Monetary_transactions` (`idMonetary_transactions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Buyer1`
    FOREIGN KEY (`Buyer_idBuyer`)
    REFERENCES `mydb`.`Buyer` (`idBuyer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Employee1`
    FOREIGN KEY (`Employee_idEmployee` , `Employee_Post_idPost`)
    REFERENCES `mydb`.`Employee` (`idEmployee` , `Post_idPost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order_product` (
  `idOrder_commodity` INT NOT NULL,
  `Quantity` INT(10) NULL,
  `Amount` DECIMAL(10,2) UNSIGNED NULL,
  `Order_idOrder` INT NOT NULL,
  `Products_idProducts` INT NOT NULL,
  PRIMARY KEY (`idOrder_commodity`, `Order_idOrder`, `Products_idProducts`),
  INDEX `fk_Order_commodity_Order1_idx` (`Order_idOrder` ASC) VISIBLE,
  INDEX `fk_Order_commodity_Products1_idx` (`Products_idProducts` ASC) VISIBLE,
  CONSTRAINT `fk_Order_commodity_Order1`
    FOREIGN KEY (`Order_idOrder`)
    REFERENCES `mydb`.`Order` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_commodity_Products1`
    FOREIGN KEY (`Products_idProducts`)
    REFERENCES `mydb`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Salary_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salary_payment` (
  `idSalary_payment` INT NOT NULL,
  `Payment_date` DATETIME NULL,
  `Amount` DECIMAL(10,2) NULL,
  `Employee_idEmployee` INT NOT NULL,
  `Employee_Post_idPost` INT NOT NULL,
  `Monetary_transactions_idMonetary_transactions` INT NOT NULL,
  PRIMARY KEY (`idSalary_payment`, `Employee_idEmployee`, `Employee_Post_idPost`, `Monetary_transactions_idMonetary_transactions`),
  INDEX `fk_Salary_payment_Employee1_idx` (`Employee_idEmployee` ASC, `Employee_Post_idPost` ASC) VISIBLE,
  INDEX `fk_Salary_payment_Monetary_transactions1_idx` (`Monetary_transactions_idMonetary_transactions` ASC) VISIBLE,
  CONSTRAINT `fk_Salary_payment_Employee1`
    FOREIGN KEY (`Employee_idEmployee` , `Employee_Post_idPost`)
    REFERENCES `mydb`.`Employee` (`idEmployee` , `Post_idPost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Salary_payment_Monetary_transactions1`
    FOREIGN KEY (`Monetary_transactions_idMonetary_transactions`)
    REFERENCES `mydb`.`Monetary_transactions` (`idMonetary_transactions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vacation_schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vacation_schedule` (
  `idVacation_schedule` INT NOT NULL,
  `Begin_date` DATETIME NULL,
  `End_date` DATETIME NULL,
  `Employee_idEmployee` INT NOT NULL,
  `Employee_Post_idPost` INT NOT NULL,
  PRIMARY KEY (`idVacation_schedule`, `Employee_idEmployee`, `Employee_Post_idPost`),
  INDEX `fk_Vacation_schedule_Employee2_idx` (`Employee_idEmployee` ASC, `Employee_Post_idPost` ASC) VISIBLE,
  CONSTRAINT `fk_Vacation_schedule_Employee2`
    FOREIGN KEY (`Employee_idEmployee` , `Employee_Post_idPost`)
    REFERENCES `mydb`.`Employee` (`idEmployee` , `Post_idPost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
