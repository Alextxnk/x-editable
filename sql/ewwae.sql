-- ------------------------------------------------------- Table `mydb`.`Employee`-- -----------------------------------------------------CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (  `idEmployee` INT NOT NULL,  `LFP` VARCHAR(45) NULL,  `Passport` VARCHAR(45) NULL,  `INN` VARCHAR(45) NULL,  `Phone_number` VARCHAR(45) NULL,  `Address` VARCHAR(45) NULL,  `Post_idPost` INT NOT NULL,  PRIMARY KEY (`idEmployee`, `Post_idPost`),  INDEX `fk_Employee_Post1_idx` (`Post_idPost` ASC) VISIBLE,  CONSTRAINT `fk_Employee_Post1`,    FOREIGN KEY (`Post_idPost`)    REFERENCES `mydb`.`Post` (`idPost`)    ON DELETE NO ACTION    ON UPDATE NO ACTION)ENGINE = InnoDB