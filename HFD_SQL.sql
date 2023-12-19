-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema HFD
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `HFD` ;

-- -----------------------------------------------------
-- Schema HFD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HFD` DEFAULT CHARACTER SET utf8 ;
USE `HFD` ;

-- -----------------------------------------------------
-- Table `HFD`.`Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Person` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Person` (
  `ID` VARCHAR(10) NOT NULL,
  `Fname` VARCHAR(45) NOT NULL,
  `Minit` VARCHAR(45) NOT NULL,
  `Lname` VARCHAR(45) NOT NULL,
  `SSN` INT NOT NULL,
  `Gender` ENUM('M', 'F') NOT NULL,
  `Bdate` DATE NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Person_Phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Person_Phone` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Person_Phone` (
  `Person_ID` VARCHAR(10) NOT NULL,
  `Phone` INT NOT NULL,
  PRIMARY KEY (`Phone`, `Person_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Employee` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Employee` (
  `ID` VARCHAR(10) NOT NULL,
  `job_type` VARCHAR(50) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `salary` DOUBLE NOT NULL,
  `Head_ID` VARCHAR(10) NULL,
  `Department_dID` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Guest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Guest` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Guest` (
  `ID` VARCHAR(10) NOT NULL,
  `disability_type` VARCHAR(50) NOT NULL,
  `Room_rID` INT NOT NULL,
  `Price` DOUBLE NOT NULL,
  `check_inDt` DATE NOT NULL,
  `check_outDt` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Department` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Department` (
  `dID` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `MgrId` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Appoitment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Appoitment` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Appoitment` (
  `date` DATE NOT NULL,
  `job_type` VARCHAR(45) NOT NULL,
  `no_of_employee` INT NOT NULL,
  `Department_dID1` INT NOT NULL,
  PRIMARY KEY (`date`, `Department_dID1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Insurance` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Insurance` (
  `iID` INT NOT NULL,
  `duration` VARCHAR(25) NOT NULL,
  `date` DATE NOT NULL,
  `Department_dID` INT NOT NULL,
  PRIMARY KEY (`iID`, `Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Purchase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Purchase` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Purchase` (
  `pID` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `price` FLOAT NOT NULL,
  `quantity` FLOAT NOT NULL,
  `date` DATE NOT NULL,
  `supplier` VARCHAR(45) NOT NULL,
  `quality` VARCHAR(45) NULL,
  `Employee_checker_ID` VARCHAR(10) NOT NULL,
  `Department_dID` INT NOT NULL,
  PRIMARY KEY (`pID`, `Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Transpoertation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Transpoertation` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Transpoertation` (
  `plate_no` VARCHAR(10) NOT NULL,
  `model` VARCHAR(25) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  `Department_dID` INT NOT NULL,
  `Importing Department_iID` INT NOT NULL,
  `Entertainment_Trip_eID` INT NULL,
  PRIMARY KEY (`plate_no`, `Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Safety`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Safety` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Safety` (
  `sID` INT NOT NULL,
  `incident` VARCHAR(45) NOT NULL,
  `location` VARCHAR(50) NOT NULL,
  `date` DATE NOT NULL,
  `Department_dID` INT NOT NULL,
  `Importing Department_iID` INT NOT NULL,
  PRIMARY KEY (`sID`, `Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Maintenance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Maintenance` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Maintenance` (
  `mID` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `Department_dID` INT NOT NULL,
  `Importing Department_iID` INT NOT NULL,
  PRIMARY KEY (`mID`, `Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Restaurant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Restaurant` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Restaurant` (
  `rID` INT NOT NULL,
  `capacity` FLOAT NOT NULL,
  `location` VARCHAR(50) NOT NULL,
  `Department_dID` INT NOT NULL,
  `Importing Department_iID` INT NOT NULL,
  PRIMARY KEY (`rID`, `Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Cleanliness`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Cleanliness` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Cleanliness` (
  `cID` INT NOT NULL,
  `date` DATE NOT NULL,
  `Importing Department_iID` INT NOT NULL,
  `Room_rID1` INT NOT NULL,
  `Department_dID` INT NOT NULL,
  PRIMARY KEY (`cID`, `Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Medical`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Medical` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Medical` (
  `mID` INT NOT NULL,
  `Guest_ID` VARCHAR(10) NOT NULL,
  `condition` VARCHAR(45) NOT NULL,
  `ex_Date` DATE NOT NULL,
  `Department_dID` INT NOT NULL,
  `Importing Department_iID` INT NOT NULL,
  PRIMARY KEY (`mID`, `Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Rating` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Rating` (
  `ID` INT NOT NULL,
  `date` DATE NOT NULL,
  `evaluation` VARCHAR(45) NOT NULL,
  `feedback` VARCHAR(100) NULL,
  `Department_dID` INT NOT NULL,
  `Guest_ID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID`, `Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Care_Giver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Care_Giver` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Care_Giver` (
  `cID` INT NOT NULL,
  `skills` VARCHAR(45) NOT NULL,
  `Guest_ID` VARCHAR(10) NULL,
  `Department_dID` INT NOT NULL,
  PRIMARY KEY (`cID`, `Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Training`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Training` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Training` (
  `name` VARCHAR(90) NOT NULL,
  `Date` DATE NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `Department_dID` INT NOT NULL,
  PRIMARY KEY (`name`, `Date`, `Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Legal_Affairs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Legal_Affairs` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Legal_Affairs` (
  `lID` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `Department_dID` INT NOT NULL,
  PRIMARY KEY (`lID`, `Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Importing_Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Importing_Department` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Importing_Department` (
  `iID` INT NOT NULL,
  PRIMARY KEY (`iID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Room` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Room` (
  `rID` INT NOT NULL,
  `accesibilty_feature` VARCHAR(50) NOT NULL,
  `capacity` INT NOT NULL,
  `availability` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`rID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Dependent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Dependent` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Dependent` (
  `Name` VARCHAR(60) NOT NULL,
  `SSN` VARCHAR(20) NOT NULL,
  `Guest_ID` VARCHAR(10) NOT NULL,
  `relationship` VARCHAR(50) NOT NULL,
  `Bdate` DATE NOT NULL,
  `Gender` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`SSN`, `Guest_ID`),
  INDEX `fk_Dependent_Guest1_idx` (`Guest_ID` ASC),
  UNIQUE INDEX `SSN_UNIQUE` (`SSN` ASC),
  CONSTRAINT `fk_Dependent_Guest1`
    FOREIGN KEY (`Guest_ID`)
    REFERENCES `HFD`.`Guest` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Dependent_Phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Dependent_Phone` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Dependent_Phone` (
  `Phone` INT NOT NULL,
  `Dependent_SSN` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Phone`, `Dependent_SSN`),
  INDEX `fk_Dependent_Phone_Dependent1_idx` (`Dependent_SSN` ASC),
  CONSTRAINT `fk_Dependent_Phone_Dependent1`
    FOREIGN KEY (`Dependent_SSN`)
    REFERENCES `HFD`.`Dependent` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Entertainment_Trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Entertainment_Trip` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Entertainment_Trip` (
  `eID` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `place` VARCHAR(45) NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`eID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Gets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Gets` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Gets` (
  `trainee_ID` VARCHAR(10) NOT NULL,
  `Training_Date` DATE NOT NULL,
  `Training_name` VARCHAR(90) NOT NULL,
  `rating` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`trainee_ID`, `Training_Date`, `Training_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`lawsuit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`lawsuit` ;

CREATE TABLE IF NOT EXISTS `HFD`.`lawsuit` (
  `Employee_ID` VARCHAR(10) NOT NULL,
  `Guest_ID` VARCHAR(10) NOT NULL,
  `Legal_Affairs_lID` INT NOT NULL,
  PRIMARY KEY (`Guest_ID`, `Legal_Affairs_lID`, `Employee_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Goes_on`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Goes_on` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Goes_on` (
  `Entertainment_Trip_eID` INT NOT NULL,
  `Guest_ID` VARCHAR(10) NOT NULL,
  `Date` DATE NOT NULL,
  PRIMARY KEY (`Entertainment_Trip_eID`, `Guest_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Medication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Medication` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Medication` (
  `Medical_ID` INT NOT NULL,
  `medication` VARCHAR(45) NOT NULL,
  `Medical_Department_dID` INT NOT NULL,
  PRIMARY KEY (`medication`, `Medical_ID`, `Medical_Department_dID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`employee_insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`employee_insurance` ;

CREATE TABLE IF NOT EXISTS `HFD`.`employee_insurance` (
  `Insurance_iID` INT NOT NULL,
  `Employee_ID` VARCHAR(10) NOT NULL,
  `Insurance_Department_dID` INT NOT NULL,
  PRIMARY KEY (`Insurance_iID`, `Insurance_Department_dID`),
  INDEX `fk_employee_insurance_Employee1_idx` (`Employee_ID` ASC),
  CONSTRAINT `fk_employee_insurance_Insurance1`
    FOREIGN KEY (`Insurance_iID` , `Insurance_Department_dID`)
    REFERENCES `HFD`.`Insurance` (`iID` , `Department_dID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_insurance_Employee1`
    FOREIGN KEY (`Employee_ID`)
    REFERENCES `HFD`.`Employee` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`transportation_insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`transportation_insurance` ;

CREATE TABLE IF NOT EXISTS `HFD`.`transportation_insurance` (
  `Insurance_iID` INT NOT NULL,
  `Insurance_Department_dID` INT NOT NULL,
  `Transpoertation_plate_no` VARCHAR(10) NOT NULL,
  `Transpoertation_Department_dID` INT NOT NULL,
  PRIMARY KEY (`Insurance_iID`, `Insurance_Department_dID`),
  INDEX `fk_transportation_insurance_Transpoertation1_idx` (`Transpoertation_plate_no` ASC, `Transpoertation_Department_dID` ASC),
  CONSTRAINT `fk_transportation_insurance_Insurance1`
    FOREIGN KEY (`Insurance_iID` , `Insurance_Department_dID`)
    REFERENCES `HFD`.`Insurance` (`iID` , `Department_dID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transportation_insurance_Transpoertation1`
    FOREIGN KEY (`Transpoertation_plate_no` , `Transpoertation_Department_dID`)
    REFERENCES `HFD`.`Transpoertation` (`plate_no` , `Department_dID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`transportation_maintenance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`transportation_maintenance` ;

CREATE TABLE IF NOT EXISTS `HFD`.`transportation_maintenance` (
  `Maintenance_mID` INT NOT NULL,
  `Transpoertation_plate_no` VARCHAR(10) NOT NULL,
  `Maintenance_Department_dID` INT NOT NULL,
  `Transpoertation_Department_dID` INT NOT NULL,
  INDEX `fk_transportation_maintenance_Transpoertation1_idx` (`Transpoertation_plate_no` ASC, `Transpoertation_Department_dID` ASC),
  PRIMARY KEY (`Maintenance_mID`, `Maintenance_Department_dID`),
  CONSTRAINT `fk_transportation_maintenance_Transpoertation1`
    FOREIGN KEY (`Transpoertation_plate_no` , `Transpoertation_Department_dID`)
    REFERENCES `HFD`.`Transpoertation` (`plate_no` , `Department_dID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transportation_maintenance_Maintenance1`
    FOREIGN KEY (`Maintenance_mID` , `Maintenance_Department_dID`)
    REFERENCES `HFD`.`Maintenance` (`mID` , `Department_dID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`room_maintenance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`room_maintenance` ;

CREATE TABLE IF NOT EXISTS `HFD`.`room_maintenance` (
  `Maintenance_mID` INT NOT NULL,
  `Room_ID` INT NOT NULL,
  `Maintenance_Department_dID` INT NOT NULL,
  PRIMARY KEY (`Maintenance_mID`, `Maintenance_Department_dID`),
  INDEX `fk_room_maintenance_Room1_idx` (`Room_ID` ASC),
  CONSTRAINT `fk_room_maintenance_Maintenance1`
    FOREIGN KEY (`Maintenance_mID` , `Maintenance_Department_dID`)
    REFERENCES `HFD`.`Maintenance` (`mID` , `Department_dID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_room_maintenance_Room1`
    FOREIGN KEY (`Room_ID`)
    REFERENCES `HFD`.`Room` (`rID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Storage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Storage` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Storage` (
  `sID` INT NOT NULL,
  `expair_date` DATE NULL,
  `type` VARCHAR(45) NOT NULL,
  `Purchase_ID` INT NOT NULL,
  `Department_dID` INT NOT NULL,
  `Importing Department_iID` INT NULL,
  `Purchase_Department_dID` INT NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sID`, `Department_dID`),
  UNIQUE INDEX `sID_UNIQUE` (`sID` ASC),
  INDEX `fk_Storage_Department1_idx` (`Department_dID` ASC),
  INDEX `fk_Storage_Purchase1_idx` (`Purchase_ID` ASC, `Purchase_Department_dID` ASC),
  INDEX `fk_Storage_Importing Department1_idx` (`Importing Department_iID` ASC),
  CONSTRAINT `fk_Storage_Department1`
    FOREIGN KEY (`Department_dID`)
    REFERENCES `HFD`.`Department` (`dID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Storage_Purchase1`
    FOREIGN KEY (`Purchase_ID` , `Purchase_Department_dID`)
    REFERENCES `HFD`.`Purchase` (`pID` , `Department_dID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Storage_Importing Department1`
    FOREIGN KEY (`Importing Department_iID`)
    REFERENCES `HFD`.`Importing_Department` (`iID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HFD`.`Has`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HFD`.`Has` ;

CREATE TABLE IF NOT EXISTS `HFD`.`Has` (
  `Entertainment_Trip_eID` INT NOT NULL,
  `Transpoertation_plate_no` VARCHAR(10) NOT NULL,
  `Transpoertation_Department_dID` INT NOT NULL,
  PRIMARY KEY (`Entertainment_Trip_eID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`),
  INDEX `fk_Entertainment_Trip_has_Transpoertation_Transpoertation1_idx` (`Transpoertation_plate_no` ASC, `Transpoertation_Department_dID` ASC),
  INDEX `fk_Entertainment_Trip_has_Transpoertation_Entertainment_Tri_idx` (`Entertainment_Trip_eID` ASC),
  CONSTRAINT `fk_Entertainment_Trip_has_Transpoertation_Entertainment_Trip1`
    FOREIGN KEY (`Entertainment_Trip_eID`)
    REFERENCES `HFD`.`Entertainment_Trip` (`eID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entertainment_Trip_has_Transpoertation_Transpoertation1`
    FOREIGN KEY (`Transpoertation_plate_no` , `Transpoertation_Department_dID`)
    REFERENCES `HFD`.`Transpoertation` (`plate_no` , `Department_dID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `HFD`.`Person`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#001', 'Farid ', 'A', 'Al-Hakim', 385027419, 'M', '1992-06-05');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#002', 'Leila', 'H', 'Abu Nassar', 740928563, 'F', '1996-07-06');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#003', 'Amir ', 'T', 'Al-Mufti', 102938475, 'M', '1985-10-23');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#004', 'Yasmin ', 'Z', 'Abdallah', 876543210, 'F', '1991-04-15');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#005', 'Khalil ', 'F', 'Al-Qadi', 591827364, 'M', '1988-07-06');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#006', 'Salma ', 'K', 'Aziz', 234567890, 'F', '2001-02-18');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#007', 'Aisha ', 'S', 'Al-Khatib', 649205783, 'F', '1982-05-30');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#008', 'Kareem ', 'D', ' Al-Dawood', 918273645, 'M', '1987-09-11');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#009', 'Layla ', 'G', 'Al-Amin', 324756189, 'F', '1993-03-04');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#010', 'Nadim ', 'R', 'Al-Sabah', 807654321, 'M', '1999-06-21');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#011', 'Noor ', 'E', 'Al-Saleh', 456789012, 'M', '1990-01-08');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#012', 'Youssef ', 'J', 'Al-Farsi', 135792468, 'M', '1995-08-02');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#013', 'Hanaa ', 'N', 'Al-Mashriqi', 678901234, 'F', '1983-12-17');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#014', 'Ziad ', 'Q', 'Al-Tahan', 987654322, 'M', '1984-06-19');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#015', 'Sara', 'V', 'Al-Hamad', 543210987, 'F', '2002-12-07');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#016', 'Tariq', 'L', 'Al-Aziz', 876512934, 'M', '1989-04-26');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#017', 'Laila ', 'Y', 'Al-Zoubi', 219876543, 'F', '1998-07-31');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#018', 'Jawad ', 'I', 'Al-Barazi', 890123466, 'M', '1986-02-14');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#019', 'Dalal', 'P', 'Al-Rifai', 741025896, 'F', '1997-10-05');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#020', 'Fahad ', 'X', 'Al-Samarrai', 741025096, 'M', '1981-03-22');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#021', 'Leila ', 'O', 'Al-Husseini', 602938475, 'F', '1994-09-03');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#022', 'Samir ', 'U', 'Al-Jawad', 133456789, 'M', '1980-11-10');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#023', 'Amira ', 'C', 'Al-Zahiri', 806598342, 'F', '2000-05-28');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#024', 'Malik ', 'R', 'Al-Masri', 543217890, 'M', '1987-01-12');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CR#025', 'Fatima ', 'W', 'Al-Khalil', 987654123, 'F', '1991-06-27');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('MD#001', 'Nizar ', 'B', 'Al-Masoud', 456781290, 'M', '1999-08-15');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('MD#002', 'Dalia ', 'A', 'Al-Fahd', 321098765, 'F', '1988-04-03');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('MD#003', 'Nadeem ', 'E', 'Al-Sabbagh', 890217345, 'M', '1995-12-24');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('SF#001', 'Zara', 'I', 'Al-Rashid', 237896541, 'F', '2003-09-19');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('SF#002', 'Karim ', 'F', 'Al-Mahmoud', 765432109, 'M', '1986-10-30');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('SF#003', 'Sanaa ', 'J', 'Al-Haddad', 214365879, 'F', '1992-05-11');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('MA#001', 'Rafiq ', 'G', 'Al-Khayyat', 987654302, 'M', '1983-07-20');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('MA#002', 'Salwa ', 'H', 'Al-Dosari', 543210678, 'F', '1996-08-08');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('MA#003', 'Rania ', 'M', 'Al-Husain', 870432190, 'F', '2001-01-31');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('TR#001', 'Jamal ', 'S', ' Al-Hamidi', 198273645, 'M', '1980-09-01');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('TR#002', 'Amina', 'K', 'Al-Mansoor', 789012345, 'F', '1985-03-25');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('TR#003', 'Khaled ', 'A', 'Al-Najjar', 901827364, 'M', '1990-04-16');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('PU#001', 'Leila ', 'V', 'Al-Fayyad', 345678912, 'F', '1994-12-22');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('PU#002', 'Yazan ', 'D', 'Al-Sheikh', 890123789, 'M', '1989-11-28');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('PU#003', 'Mariam ', 'R', 'Al-Ghazi', 654321098, 'F', '1992-10-14');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('TN#001', 'Omar ', 'P', 'Al-Qasimi', 123987654, 'M', '1984-08-06');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('TN#002', 'Reem ', 'T', 'Al-Kawari', 890123457, 'F', '2002-06-09');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('TN#003', 'Majid', 'J', 'Al-Rais', 432189765, 'M', '1997-01-23');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('IN#001', 'Layla ', 'Y', 'Al-Sharif', 765498321, 'F', '1987-07-04');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('IN#002', 'Hassan ', 'Z', 'Al-Barghouti', 987654987, 'M', '1996-02-13');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('IN#003', 'Rasha ', 'M', 'Al-Sulaiman', 234567891, 'F', '1982-12-31');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CL#001', 'Tamer ', 'N', 'Al-Hamwi', 678902134, 'M', '2000-04-27');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CL#002', 'Hind', 'R', 'Al-Saadi', 892109384, 'F', '1981-05-07');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CL#003', 'Hadi ', 'L', 'Al-Kuwari', 654321789, 'M', '1986-08-18');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('AP#001', 'Layla ', 'S', 'Al-Ali', 879234561, 'F', '1991-11-26');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('AP#002', 'Sami ', 'D', 'Al-Jarrah', 345678901, 'M', '1998-03-10');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('AP#003', 'Lana ', 'Q', 'Al-Hassan', 908273615, 'F', '1983-06-01');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('ST#001', 'Faisal ', 'H', 'Al-Hashmi', 120394857, 'M', '1988-09-07');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('ST#002', 'Amal ', 'T', 'Al-Awad', 678905432, 'F', '1995-02-22');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('ST#003', 'Nour ', 'E', 'Al-Khayami', 987654765, 'M', '1984-12-12');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('RE#001', 'Ziad ', 'F', 'Al-Abboud', 340219876, 'M', '2002-10-25');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('RE#002', 'Leila ', 'R', 'Al-Majid', 908273645, 'F', '1987-03-16');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('RE#003', 'Zainab ', 'K', 'Al-Shami', 567890123, 'F', '1994-01-04');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('LA#001', 'Hamza ', 'M', 'Al-Zarqa', 123432189, 'M', '1989-06-24');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('LA#002', 'Dina ', 'L', 'Al-Tawil', 870543219, 'F', '1996-11-03');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('LA#003', 'Ahmad ', 'R', 'Al-Rawi', 678934210, 'M', '1980-07-09');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('RA#001', 'Yasmina ', 'S', 'Al-Azawi', 234598761, 'F', '1993-04-05');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('RA#002', 'Majid ', 'Q', 'Al-Saad', 890123789, 'M', '1985-01-30');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('RA#003', 'Layla ', 'M', 'Al-Said', 507890123, 'F', '1990-10-19');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('MA#004', 'Karim ', 'W', 'Al-Atrash', 123489765, 'M', '1997-12-20');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('PA#001', 'Fatima ', 'Y', 'Al-Houri', 890123490, 'F', '1982-09-09');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('PA#002', 'Tariq ', 'G', 'Al-Nasri', 876598042, 'M', '1981-08-04');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('PA#003', 'Nadia ', 'A', 'Al-Badawi', 123456780, 'F', '1992-03-27');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('PA#004', 'Rami ', 'S', 'Al-Salman', 987654321, 'M', '1983-06-03');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('AM#001', 'Huda ', 'F', 'Al-Hajjar', 876503219, 'F', '1999-01-28');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#001', 'Ziad', 'N', 'Al-Khatib', 767891234, 'M', '1986-12-21');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#002', 'Layla ', 'J', 'Al-Majali', 890234567, 'F', '1980-05-16');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#003', 'Marwan', 'R', 'Al-Hilal', 678912345, 'M', '1995-09-29');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#004', 'Amira ', 'K', 'Al-Rawi', 109876543, 'F', '1990-07-18');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#005', 'Khaled ', 'S', 'Al-Baz', 987650123, 'M', '2002-04-11');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#006', 'Yasmin ', 'A', 'Al-Banna', 894123456, 'F', '1987-11-01');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#007', 'Walid ', 'Q', 'Al-Akbar', 321987654, 'M', '1994-02-09');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#008', 'Rana ', 'E', 'Al-Hawari', 876543229, 'F', '1989-04-02');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#009', 'Nasser ', 'G', 'Al-Qassab', 987654310, 'M', '1996-12-10');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#010', 'Hala ', 'T', 'Al-Saqr', 876543319, 'F', '2003-08-26');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#011', 'Lina', 'N', 'Al-Masri', 678912045, 'F', '1985-06-14');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#012', 'Rami ', 'O', 'Al-Baghdadi', 345612789, 'M', '1988-09-22');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#013', 'Sana ', 'K', 'Al-Khateeb', 890103456, 'F', '1993-03-07');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#014', 'Nidal ', 'H', 'Al-Dabbagh', 123409876, 'M', '1997-10-30');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#015', 'Mona ', 'Y', 'Al-Sharabi', 876098342, 'F', '1980-08-12');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#016', 'Fahad ', 'S', 'Al-Madani', 123456789, 'M', '1983-05-05');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#017', 'Rima ', 'Z', 'Al-Jazeera', 986654321, 'F', '1989-12-23');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#018', 'Kareem ', 'M', 'Al-Qassim', 406789012, 'M', '1994-07-17');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#019', 'Layla ', 'E', 'Al-Sultan', 678905432, 'F', '2000-02-04');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('G#020', 'Ahmad', 'K', 'Al-anzi', 304050688, 'M', '2004-05-06');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('AM#002', 'Tamer', 'W', 'Al-Jarrah', 234567810, 'M', '1991-11-21');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('AM#003', 'Sami ', 'R', 'Al-Qadi', 237567890, 'M', '1983-08-01');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('AM#004', 'Aisha ', 'G', 'Al-Hamad', 234568890, 'F', '1999-04-28');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('FA#001', 'Amira ', 'F', 'Al-Baz', 568895234, 'F', '1990-08-12');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('FA#002', 'Marwan', 'W', 'Al-Qassab', 566891234, 'M', '1981-08-22');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('FA#003', 'Yasmin ', 'T', 'Al-Zahiri', 547891234, 'F', '1980-08-11');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('FA#004', 'Walid ', 'J', 'Al-Husseini', 567831234, 'M', '1993-08-12');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('SE#001', 'Reem ', 'U', 'Al-Mansoor', 348219876, 'F', '1985-03-25');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('SE#002', 'Leila ', 'K', 'Al-Abboud', 345210876, 'F', '1992-09-11');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('SE#003', 'Khaled ', 'L', 'Al-Qasimi', 345210076, 'M', '1992-05-11');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('SE#004', 'Jamal ', 'E', 'Al-Kawari', 340019876, 'M', '1986-10-20');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('RP#001', 'Dalia ', 'K', 'Al-Rais', 343219876, 'F', '1990-10-19');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('RP#002', 'Nour ', 'H', 'Al-Majid', 346219876, 'M', '1993-04-05');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('RP#003', 'Faisal ', 'C', 'Al-Hashmi', 342198769, 'M', '1990-10-19');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('RP#004', 'Jamal ', 'O', 'Al-Hakim', 345219876, 'M', '1983-06-03');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('QU#001', 'Leila ', 'B', 'Al-Salman', 286654321, 'F', '1995-12-24');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('QU#002', 'Fatima ', 'A', 'Al-Saad', 186654321, 'F', '1995-12-20');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('QU#003', 'Yazan ', 'S', 'Al-Shami', 986755321, 'M', '1983-06-03');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('QU#004', 'Dalia ', 'D', 'Al-Abboud', 906604321, 'F', '1994-01-07');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('MD#004', 'Hadi ', 'T', 'Al-Zahiri', 103409876, 'M', '1999-04-28');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('SF#004', 'Hala ', 'H', 'Al-Hashmi', 100409876, 'F', '1980-09-01');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('TR#004', 'Hala ', 'T', 'Al-Hakim', 120409876, 'F', '2003-09-19');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('PU#004', 'Hadi ', 'N', 'Al-Saad', 120009876, 'M', '2003-09-19');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('TN#004', 'Jawad ', 'M', ' Al-Dawood', 123009876, 'M', '1980-09-01');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('IN#004', 'Karim ', 'C', ' Al-Dawood', 204567890, 'M', '1994-12-22');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('CL#004', 'Mona ', 'S', 'Al-Zahiri', 230567890, 'F', '1990-07-18');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('AP#004', 'Kareem ', 'A', 'Al-Hakim', 200567890, 'M', '1999-04-28');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('ST#004', 'Mona ', 'M', ' Al-Dawood', 230067890, 'F', '1994-12-22');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('RE#004', 'Hadi ', 'W', 'Al-Saad', 204067890, 'M', '1990-07-18');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('LA#004', 'Hala ', 'Z', 'Al-Hashmi', 180654321, 'F', '2003-09-19');
INSERT INTO `HFD`.`Person` (`ID`, `Fname`, `Minit`, `Lname`, `SSN`, `Gender`, `Bdate`) VALUES ('RA#004', 'Jawad ', 'O', 'Al-Rawi', 186604321, 'M', '1994-12-22');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Person_Phone`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#001', 01112345678);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#002', 01123456789);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#003', 01134567890);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#004', 01145678901);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#005', 01156789012);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#006', 01167890123);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#007', 01178901234);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#008', 01101234567);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#009', 01190123481);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#010', 01190123456);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#011', 01012345678);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#012', 01189012345);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#013', 01034567890);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#014', 01112345670);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#015', 01045678901);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#016', 01123456701);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#017', 01167890145);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#018', 01134567812);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#019', 01056789012);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#019', 01156789034);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#020', 01089012345);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#020', 01178901256);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#021', 01031234570);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#022', 01189012367);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#023', 01051234572);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#024', 01101234589);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#024', 01071234574);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CR#025', 01112345690);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('MD#001', 01134567811);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('MD#002', 01123456700);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('MD#003', 01081234575);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('SF#001', 01145678922);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('SF#002', 01091234576);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('SF#003', 01167890144);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('MA#001', 01002345677);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('MA#002', 01178901255);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('MA#003', 01012345679);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('TR#001', 01190123477);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('TR#002', 01022345680);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('TR#003', 01189012366);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('PU#001', 01032345681);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('PU#001', 01101234588);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('PU#002', 01042345682);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('PU#003', 01112345699);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('IN#001', 01134567821);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('IN#001', 01123456710);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('IN#002', 01189012376);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('IN#003', 01145678932);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('TN#001', 01178901265);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('TN#001', 01156789043);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('TN#002', 01190123487);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('TN#003', 01167890154);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CL#001', 01062345684);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CL#002', 01145678934);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CL#003', 01112345601);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('AP#001', 01123456712);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('AP#001', 01101234598);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('AP#002', 01156789045);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('AP#003', 01134567823);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('ST#001', 01167890156);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('ST#002', 01082345686);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('ST#003', 01178901267);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RE#001', 01101234590);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RE#002', 01189012378);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RE#003', 01101234590);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('LA#001', 01190123489);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('LA#001', 01023456790);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('LA#002', 01134567824);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('LA#003', 01123456713);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RA#002', 01112345602);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RA#003', 01156789046);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RA#001', 01092345687);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#001', 01145678935);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#002', 01083456796);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#003', 01178901268);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#004', 01167890157);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#005', 01063456794);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#006', 01189012379);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#007', 01190123480);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#008', 01101234591);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#009', 01134567825);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#010', 01567890123);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#011', 01112345603);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#012', 01190100481);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#013', 01556789012);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#014', 01123456714);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#015', 01101234592);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#016', 01523456789);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#017', 01512345678);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#018', 01510045678);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#019', 01512345978);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('G#020', 01512345698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('MD#004', 01110005678);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('MA#004', 01513345678);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('SF#004', 01512335678);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('TR#004', 01512346678);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('PU#004', 01562345678);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('TN#004', 01512300678);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('IN#004', 01262345678);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('CL#004', 01062345678);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('AP#004', 01222345698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('ST#004', 01211245698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RE#004', 01211115698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('LA#004', 01211145698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RA#004', 01211345698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('PA#001', 01211225660);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('PA#001', 01222222228);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('PA#002', 01211233398);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('PA#003', 01211247348);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('PA#004', 01211212348);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('AM#001', 01211999999);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('AM#001', 01211267668);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('AM#002', 01211255555);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('AM#002', 01210255558);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('AM#003', 01211666698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('AM#004', 01211211198);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('FA#001', 01210000698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('FA#002', 01211245000);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('FA#003', 01211005690);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('FA#004', 01200235698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('SE#001', 01211200098);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('SE#002', 01210025698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('SE#003', 01211005698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('SE#004', 01211200698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RP#001', 01211205698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RP#001', 01211240698);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RP#002', 01211240098);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RP#002', 01211245098);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RP#003', 01211245608);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('RP#004', 01211245690);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('QU#001', 01451245690);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('QU#002', 01441245690);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('QU#003', 01431245690);
INSERT INTO `HFD`.`Person_Phone` (`Person_ID`, `Phone`) VALUES ('QU#004', 01421245690);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#001', 'Personal Care Assistant\n', '54321, Oak Avenue, Rivertown\n', 15000, '', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#002', 'Personal Care Assistant\n', '98765, Maple Street, Hillcrest\n', 13000, 'CR#001', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#003', 'Personal Care Assistant\n', '23456, Elm Lane, Lakeside\n', 12000, 'CR#002', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#004', 'Personal Care Assistant\n', '87654, Cedar Road, Brookside\n', 12000, 'CR#002', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#005', 'Personal Care Assistant\n', '34567, Pine Drive, Parkview\n', 12000, 'CR#002', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#006', 'Personal Care Assistant\n', '78901, Birch Lane, Sunnyside\n', 12000, 'CR#002', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#007', 'Personal Care Assistant\n', '43210, Willow Lane, Riverdale\n', 12000, 'CR#002', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#008', 'Personal Care Assistant\n', '89012, Juniper Avenue, Highland\n', 12000, 'CR#002', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#009', 'Personal Care Assistant\n', '45678, Spruce Road, Valleyview\n', 12000, 'CR#002', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#010', 'Personal Care Assistant\n', '21098, Aspen Street, Meadowview\n', 12000, 'CR#002', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#011', 'Personal Care Assistant\n', '65432, Oak Lane, Summit\n', 13000, 'CR#001', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#012', 'Personal Care Assistant\n', '09876, Maple Avenue, Greenwood', 12000, 'CR#011', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#013', 'Personal Care Assistant\n', '76543, Elm Street, Valleyview\n', 12000, 'CR#011', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#014', 'Personal Care Assistant\n', '32109, Cedar Drive, Sunnyside\n', 12000, 'CR#011', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#015', 'Personal Care Assistant\n', '54321, Pine Road, Brookside\n', 13000, 'CR#001', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#016', 'Personal Care Assistant\n', '98765, Birch Street, Parkview\n', 12000, 'CR#011', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#017', 'Personal Care Assistant\n', '23456, Willow Avenue, Highland\n', 12000, 'CR#011', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#018', 'Personal Care Assistant\n', '87654, Juniper Lane, Hillcrest\n', 12000, 'CR#011', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#019', 'Personal Care Assistant\n', '34567, Spruce Lane, Lakeside\n', 12000, 'CR#011', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#020', 'Personal Care Assistant\n', '78901, Aspen Road, Rivertown', 12000, 'CR#011', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#021', 'Personal Care Assistant\n', '43210, Cedar Street, Meadowview\n', 12000, 'CR#015', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#022', 'Personal Care Assistant\n', '89012, Oak Drive, Summit\n', 12000, 'CR#015', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#023', 'Personal Care Assistant\n', '45678, Maple Lane, Greenwood', 12000, 'CR#015', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#024', 'Personal Care Assistant\n', '21098, Elm Avenue, Valleyview\n', 12000, 'CR#015', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CR#025', 'Personal Care Assistant\n', '65432, Pine Lane, Brookside', 12000, 'CR#015', 6);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('MD#001', 'Medical Technologist\n', '09876, Birch Road, Sunnyside\n', 13000, '', 1);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('MD#002', 'Nurse', '76543, Willow Drive, Highland\n', 9000, 'MD#001', 1);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('MD#003', 'Surgeon', '32109, Juniper Road, Hillcrest\n', 10000, 'MD#002', 1);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('SF#001', 'Safety Manager\n', '54321, Spruce Avenue, Lakeside\n', 13000, '', 2);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('SF#002', 'Environmental Health Specialist', '98765, Aspen Lane, Parkview\n', 11000, 'SF#001', 2);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('SF#003', 'Health and Safety Coordinator\n', '23456, Cedar Lane, Meadowview\n', 10000, 'SF#002', 2);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('MA#001', 'Maintenance Supervisor', '87654, Oak Street, Brookside\n', 10000, '', 3);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('MA#002', 'Maintenance Technician', '34567, Maple Drive, Rivertown\n', 7000, 'MA#001', 3);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('MA#003', 'Building Superintendent', '78901, Elm Drive, Hillcrest\n', 9000, 'MA#002', 3);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('TR#001', 'Fleet Manager\n', '43210, Pine Street, Valleyview\n', 8000, NULL, 4);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('TR#002', 'Truck Driver\n', '89012, Birch Lane, Greenwood\n', 6000, 'TR#001', 4);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('TR#003', 'Driver', '45678, Willow Road, Summit\n', 5000, 'TR#002', 4);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('PU#001', 'Purchasing Manager\n', '21098, Juniper Drive, Sunnyside\n', 8000, NULL, 5);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('PU#002', 'Purchasing Assistant\n', '65432, Spruce Lane, Highland\n', 6000, 'PU#001', 5);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('PU#003', 'Buyer\n', '09876, Aspen Avenue, Lakeside\n', 5000, 'PU#002', 5);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('TN#001', 'Training Manager\n', '76543, Cedar Road, Brookside\n', 11000, '', 7);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('TN#002', 'Training Coordinator', '32109, Maple Drive, Parkview\n', 9000, 'TN#001', 7);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('TN#003', 'Trainer', '54321, Elm Lane, Highland\n', 8000, 'TN#002', 7);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('IN#001', 'Risk Manager\n', '98765, Pine Avenue, Valleyview\n', 10000, NULL, 8);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('IN#002', 'Claims Adjuster', '23456, Birch Road, Meadowview\n', 8000, 'IN#001', 8);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('IN#003', 'Insurance Agent', '87654, Willow Lane, Summit\n', 7000, 'IN#002', 8);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CL#001', 'Cleaning manger', '34567, Juniper Street, Sunnyside\n', 7000, NULL, 9);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CL#002', 'Cleaning Supervisor', '78901, Spruce Avenue, Rivertown\n', 6000, 'CL#001', 9);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CL#003', 'Janitor', '43210, Cedar Lane, Greenwood\n', 5000, 'CL#002', 9);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('AP#001', 'HR Manager\n', '89012, Oak Road, Hillcrest\n', 9000, NULL, 10);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('AP#002', 'Recruiter\n', '45678, Maple Street, Lakeside\n', 7000, 'AP#001', 10);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('AP#003', 'HR Generalist\n', '21098, Birch Drive, Brookside\n', 6000, 'AP#002', 10);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('ST#001', 'Warehouse Supervisor', '65432, Pine Lane, Parkview\n', 10000, NULL, 11);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('ST#002', 'Storekeeper', '09876, Elm Road, Valleyview\n', 8000, 'ST#001', 11);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('ST#003', 'Materials Controller', '76543, Aspen Lane, Highland\n', 7000, 'ST#002', 11);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('RE#001', 'Restaurant Manager', '32109, Cedar Avenue, Summit\n', 9000, NULL, 12);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('RE#002', 'Chef\n', '54321, Oak Drive, Sunnyside\n', 7000, 'RE#001', 12);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('RE#003', 'Server\n', '98765, Maple Lane, Rivertown\n', 6000, 'RE#002', 12);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('LA#001', 'Legal Counsel\n', '23456, Elm Street, Greenwood\n', 10000, NULL, 13);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('LA#002', 'Legal Assistant\n', '87654, Pine Road, Hillcrest\n', 9000, 'LA#001', 13);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('LA#003', 'Attorney\n', '34567, Birch Lane, Lakeside\n', 8000, 'LA#002', 13);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('RA#001', 'Guest Experience Manager', '78901, Willow Avenue, Brookside\n', 8000, NULL, 14);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('RA#002', 'Guest Relations Coordinator', '43210, Juniper Road, Parkview\n', 6000, 'RA#001', 14);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('RA#003', 'Quality Assurance Specialist', '89012, Spruce Drive, Valleyview\n', 5000, 'RA#002', 14);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('MA#004', 'Building Superintendent', '45678, Aspen Street, Highland\n', 9000, 'MA#002', 4);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('MD#004', 'Nurse', '21098, Cedar Lane, Summit\n', 9000, 'MD#002', 1);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('SF#004', 'Health and Safety Coordinator', '65432, Oak Avenue, Sunnyside\n', 10000, 'SF#002', 2);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('TR#004', 'Driver', '09876, Maple Road, Rivertown\n', 5000, 'TR#002', 4);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('PU#004', 'Buyer', '76543, Elm Drive, Greenwood\r ', 5000, 'PU#002', 5);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('TN#004', 'Trainer', '32109, Pine Lane, Hillcrest', 8000, 'TN#002', 7);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('IN#004', 'Insurance Agent', '40210, Juniper Road, Parkview', 7000, 'IN#002', 8);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('CL#004', 'Janitor', '43010, Juniper Road, Parkview', 5000, 'CL#002', 9);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('AP#004', 'HR Generalist', '70001, Willow Avenue, Brookside', 6000, 'AP#002', 10);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('ST#004', 'Materials Controller', '43210,  Birch Drive, Parkview', 7000, 'ST#002', 11);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('RE#004', 'Server', '43000, Juniper Road, Parkview', 6000, 'RE#002', 12);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('LA#004', 'Attorney', '79901, Willow Avenue, Brookside', 8000, 'LA#002', 13);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('RA#004', 'Quality Assurance Specialist', '40608, Maple Street, Lakeside', 5000, 'RA#002', 14);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('PA#001', 'Human Resources Manager', '40078, Maple Street, Lakeside', 13000, NULL, 15);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('PA#002', 'Employee Relations Specialis', '40678, Maple Street, Lakeside', 11000, 'PA#001', 15);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('PA#003', 'Compensation and Benefits Analyst', '70901, Willow Avenue, Brookside', 10000, 'PA#002', 15);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('PA#004', 'Compensation and Benefits Analyst', '45078, Maple Street, Lakeside', 10000, 'PA#002', 15);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('AM#001', 'Marketing Manager', '45780, Maple Street, Lakeside', 10000, NULL, 16);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('AM#002', 'Advertising Manager', '45070, Maple Street, Lakeside', 8000, 'AM#001', 16);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('AM#003', 'Market Research Analyst', '40008, Maple Street, Lakeside', 7000, 'AM#002', 16);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('AM#004', 'Market Research Analyst', '40176, Maple Street, Lakeside', 7000, 'AM#002', 16);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('FA#001', 'Chief Financial Officer ', '78921, Willow Avenue, Brookside', 12000, NULL, 17);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('FA#002', 'Financial Controller', '85685, Maple Street, Lakeside', 10000, 'FA#001', 17);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('FA#003', 'Accountant', '46838, Maple Street, Lakeside', 9000, 'FA#002', 17);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('FA#004', 'Accountant', '99012, Juniper Road, Greenwood', 9000, 'FA#002', 17);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('SE#001', 'Security Manager', '89912, Birch Lane,  Lakeside', 9000, NULL, 18);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('SE#002', 'Security planner', '89013,  Juniper Road, Greenwood', 7000, 'SE#001', 18);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('SE#003', 'Security', '80012, Birch Lane,  Lakeside', 6000, 'SE#002', 18);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('SE#004', 'Security', '87772,  Juniper Road, Greenwood', 6000, 'SE#002', 18);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('RP#001', 'Front Office Manager', '21198, Birch Drive, Brookside', 10000, NULL, 19);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('RP#002', 'Front Desk Receptionist', '31098,  Juniper Road, Brookside', 9000, 'RP#001', 19);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('RP#003', 'Guest Service Agent', '61098,  Juniper Road, Brookside', 7000, 'RP#002', 19);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('RP#004', 'Guest Service Agent', '27098, Birch Drive, Brookside', 7000, 'RP#002', 19);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('QU#001', 'Quality Assurance Manager', '21008, Birch Drive, Brookside', 20000, NULL, 20);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('QU#002', 'Quality Control Inspector', '20098,  Juniper Road, Brookside', 18000, 'QU#001', 20);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('QU#003', 'purchase checker', '41008, Birch Drive, Brookside', 17000, 'QU#002', 20);
INSERT INTO `HFD`.`Employee` (`ID`, `job_type`, `address`, `salary`, `Head_ID`, `Department_dID`) VALUES ('QU#004', 'purchase checker', '21638, Birch Drive, Brookside', 17000, 'QU#002', 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Guest`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#001', 'Paralysis', 101, 300, '2024-03-07		', '2024-02-14');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#002', 'Muscular dystrophy', 103, 350, '2023-12-01	', '2024-06-14');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#003', 'Blindness', 105, 140, '2024-03-09	', '2024-03-20');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#004', 'Deafness', 102, 190, '2024-03-15	', '2024-06-03');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#005', 'Learning disability', 120, 120, '2024-02-25	', '2024-04-13');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#006', 'Intellectual disability', 124, 450, '2023-12-08	', '2023-12-31');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#007', 'Epilespy', 106, 420, '2024-03-07	', '2024-06-28');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#008', 'Intellectual disability', 125, 130, '2023-12-10	', '2024-05-18');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#009', 'Deafness', 113, 240, '2023-12-11	', '2024-01-25');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#010', 'Learning disability', 115, 270, '2024-03-18	', '2024-05-06');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#011', 'Muscular dystrophy', 104, 500, '2024-02-17	', '2024-04-25');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#012', 'Epilespy', 122, 400, '2023-12-28	', '2024-06-13');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#013', 'Paralysis', 112, 270, '2024-03-30	', '2023-12-15');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#014', 'Muscular dystrophy', 118, 290, '2024-02-09	', '2024-03-29');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#015', 'Blindness', 116, 390, '2023-11-09	', '2024-04-24');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#016', 'Deafness', 114, 470, '2024-03-11	', '2024-05-06');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#017', 'Paralysis\n', 111, 300, '2023-12-21	', '2023-12-14');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#018', 'Muscular dystrophy', 117, 350, '2023-12-09	', '2024-06-17');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#019', 'Blindness', 119, 550, '2024-02-29	', '2024-04-30');
INSERT INTO `HFD`.`Guest` (`ID`, `disability_type`, `Room_rID`, `Price`, `check_inDt`, `check_outDt`) VALUES ('G#020', 'Deafness', 123, 500, '2023-11-23	', '2024-04-17');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Department`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (1, 'Medical', 'MD#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (2, 'Safety', 'SF#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (3, 'Maintenance', 'MA#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (4, 'Transportation', 'TR#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (5, 'Purchase', 'PU#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (6, 'Care_giver', 'CR#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (7, 'Training', 'TN#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (8, 'Insurance', 'IN#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (9, 'Cleanliness', 'CL#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (10, 'Appoinment', 'AP#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (11, 'Storage', 'ST#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (12, 'Restaurant', 'RE#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (13, 'Legel_affairs', 'LA#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (14, 'Rating', 'RA#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (15, 'Personnel Affairs ', 'PA#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (16, 'Advertising and Marketing ', 'AM#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (17, 'Financial Affairs ', 'FA#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (18, 'Security', 'SE#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (19, 'Recepion', 'RP#001');
INSERT INTO `HFD`.`Department` (`dID`, `name`, `MgrId`) VALUES (20, 'Quality', 'QU#001');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Appoitment`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-01-01', 'Mechanic', 2, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-03-01', 'Driver', 2, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-02-01', 'Nurse', 10, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-04-01', 'Cleaners', 10, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-05-01', 'Restaurant Server', 3, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-06-01', 'Security', 15, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-07-01', 'Purchase assistant', 2, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-08-01', 'Chif', 8, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-09-01', 'Saftey Managers', 5, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-10-01', 'Stock Assistants', 6, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-11-01', 'Entrainment Coordinator', 4, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-12-01', 'Trainers', 2, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2025-01-01', 'Quality worker', 10, 10);
INSERT INTO `HFD`.`Appoitment` (`date`, `job_type`, `no_of_employee`, `Department_dID1`) VALUES ('2024-03-06', 'Cleaners', 6, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Insurance`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (1, '1 year', '2023-12-08', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (2, '5 years', '2023-12-06', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (3, '2 years', '2023-11-30', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (4, '1 year', '2023-11-28', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (5, '3 years', '2023-11-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (6, '10 years', '2023-11-21', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (7, '1 year', '2023-11-15', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (8, '2 years', '2023-11-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (9, '1 year', '2023-11-08', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (10, '5 years', '2023-11-03', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (11, '3 years', '2023-10-31', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (12, '1 year', '2023-10-27', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (13, '2 years', '2023-10-24', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (14, '7 years', '2023-10-20', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (15, '1 year', '2023-10-18', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (16, '3 years', '2023-10-16', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (17, '1 year', '2023-10-14', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (18, '4 years', '2023-10-12', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (19, '2 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (20, '1 year', '2023-10-08', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (21, '3 years', '2023-10-06', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (22, '8 years', '2023-10-04', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (23, '1 year', '2023-10-02', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (24, '2 years', '2023-09-30', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (25, '1 year', '2023-09-28', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (26, '6 years', '2023-09-26', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (27, '3 years', '2023-09-24', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (28, '1 year', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (29, '2 years', '2023-09-20', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (30, '5 years', '2023-09-18', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (31, '1 year', '2023-09-16', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (32, '3 years', '2023-09-14', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (33, '1 year', '2023-09-12', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (34, '7 years', '2023-09-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (35, '2 years', '2023-09-08', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (36, '1 year', '2023-09-06', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (37, '3 years', '2023-09-04', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (38, '9 years', '2023-09-02', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (39, '1 year', '2023-08-31', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (40, '2 years', '2023-08-29', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (41, '1 year', '2023-08-27', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (42, '4 years', '2023-08-25', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (43, '3 years', '2023-08-23', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (44, '1 year', '2023-08-21', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (45, '2 years', '2023-08-19', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (46, '6 years', '2023-08-17', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (47, '1 year', '2023-08-15', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (48, '3 years', '2023-08-13', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (49, '1 year', '2023-08-11', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (50, '8 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (51, '6 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (52, '2 years', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (53, '6 years', '2023-08-13', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (54, '2 years', '2023-08-23', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (55, '5 years', '2023-10-16', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (56, '1 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (57, '5 years', '2023-10-18', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (58, '1 years', '2023-08-25', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (59, '5 years', '2023-10-18', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (60, '6 years', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (61, '1 years', '2023-08-25', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (62, '1 years', '2023-10-16', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (63, '5 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (64, '6 years', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (65, '2 years', '2023-09-28', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (66, '3 years', '2023-08-25', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (67, '6 years', '2023-08-27', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (68, '2 years', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (69, '1 years', '2023-10-16', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (70, '5 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (71, '6 years', '2023-08-25', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (72, '3 years', '2023-08-27', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (73, '5 years', '2023-09-28', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (74, '2 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (75, '6 years', '2023-10-16', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (76, '3 years', '2023-10-18', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (77, '3 years', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (78, '2 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (79, '5 years', '2023-10-16', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (80, '6 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (81, '3 years', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (82, '2 years', '2023-08-27', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (83, '3 years', '2023-11-03', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (84, '6 years', '2023-08-27', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (85, '5 years', '2023-11-21', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (86, '3 years', '2023-08-11', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (87, '3 years', '2023-09-28', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (88, '6 years', '2023-12-06', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (89, '5 years', '2023-08-27', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (90, '3 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (91, '3 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (92, '5 years', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (93, '2 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (94, '6 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (95, '5 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (96, '6 years', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (97, '2 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (98, '5 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (99, '2 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (100, '6 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (101, '2 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (102, '10 years', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (103, '10 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (104, '10 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (105, '10 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (106, '10 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (107, '10 years', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (108, '10 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (109, '10 years', '2023-08-25', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (110, '10 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (111, '10 years', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (112, '10 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (113, '10 years', '2023-08-25', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (114, '10 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (115, '10 years', '2023-09-22', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (116, '10 years', '2023-08-25', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (117, '10 years', '2023-08-09', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (118, '10 years', '2023-10-10', 8);
INSERT INTO `HFD`.`Insurance` (`iID`, `duration`, `date`, `Department_dID`) VALUES (119, '10 years', '2023-08-25', 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Purchase`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (1, 'Desk Chair', 'Furniture', 240, 10, '2023-12-08', 'Acme Office Supplies', 'Valid', 'QU#001', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (2, 'Whiteboard Markers', 'Office Supplies', 95, 12, '2023-12-06', 'Staples', 'Valid', 'QU#001', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (3, 'Printer Paper', 'Office Supplies', 72, 20, '2023-11-30', 'Office Depot', 'Valid', 'QU#001', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (4, 'Computer Monitor', 'Electronics', 1200, 5, '2023-11-28', 'Dell', 'Valid', 'QU#002', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (5, 'Coffee Machine', 'Appliances', 475, 1, '2023-11-22', 'Keurig', 'Valid', 'QU#002', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (6, 'Coffee Beans', 'Food & Beverages', 118, 2.3, '2023-11-21', 'Starbucks', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (7, 'Paper Towels', 'Cleaning Supplies', 47, 24, '2023-11-15', 'Costco', 'Valid', 'QU#004', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (8, 'Trash Bags', 'Cleaning Supplies', 57, 50, '2023-11-10', 'Glad', 'Valid', 'QU#004', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (9, 'Hand Soap', 'Cleaning Supplies', 24, 6, '2023-11-08', 'Bath & Body Works', 'Valid', 'QU#004', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (10, 'Disinfectant wipes', 'Cleaning Supplies', 38, 3, '2023-11-03', 'Lysol', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (11, 'Light Bulbs', 'Maintenance Supplies', 47, 12, '2023-10-31', 'GE', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (12, 'Batteries', 'Maintenance Supplies', 24, 24, '2023-10-27', 'Duracell', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (13, 'Tool Kit', 'Maintenance Supplies', 143, 1, '2023-10-24', 'Craftsman', 'Valid', 'QU#002', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (14, 'Duct Tape', 'Maintenance Supplies', 14, 6, '2023-10-20', 'Scotch', 'Valid', 'QU#001', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (15, 'WD-40', 'Maintenance Supplies', 19, 3, '2023-10-18', '3M', 'Valid', 'QU#002', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (16, 'Pens', 'Office Supplies', 24, 24, '2023-10-16', 'Bic', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (17, 'Notebooks', 'Office Supplies', 47, 12, '2023-10-14', 'Moleskine', 'Valid', 'QU#001', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (18, 'Highlighters', 'Office Supplies', 14, 8, '2023-10-12', 'Sharpie', 'Valid', 'QU#004', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (19, 'Staplers', 'Office Supplies', 38, 6, '2023-10-10', 'Swingline', 'Not Valid', 'QU#004', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (20, 'Hole Punchers', 'Office Supplies', 47, 4, '2023-10-08', 'Fiskars', 'Not Valid', 'QU#002', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (21, 'Paper Clips', 'Office Supplies', 10, 3, '2023-10-06', 'Gem', 'Not Valid', 'QU#002', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (22, 'Sticky Notes', 'Office Supplies', 19, 4, '2023-10-04', 'Post-it', 'Not Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (23, 'Scissors', 'Office Supplies', 24, 12, '2023-10-02', 'Westcott', 'Not Valid', 'QU#002', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (24, 'Rulers', 'Office Supplies', 10, 24, '2023-09-30', 'Elmer\'s', 'Not Valid', 'QU#001', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (25, 'Correction Tape', 'Office Supplies', 14, 12, '2023-09-28', 'Liquid Paper', 'Not Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (26, 'Sharpeners', 'Office Supplies', 5, 24, '2023-09-26', 'Boston', 'Not Valid', 'QU#004', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (27, 'Pencils', 'Office Supplies', 10, 12, '2023-09-24', 'Dixon Ticonderoga', 'Not Valid', 'QU#001', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (28, 'File Folders', 'Office Supplies', 10, 24, '2023-09-22', 'Smead', 'Not Valid', 'QU#002', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (29, 'Binders', 'Office Supplies', 15, 6, '2023-09-20', 'Avery', 'Not Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (30, 'Dividers', 'Office Supplies', 5, 12, '2023-09-18', 'Five Star', 'Not Valid', 'QU#004', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (31, 'Index Cards', 'Office Supplies', 3, 3, '2023-09-16', 'Rolodex', 'Not Valid', 'QU#004', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (32, 'Rubber Bands', 'Office Supplies', 2, 3, '2023-09-14', 'BAND-IT', 'Not Valid', 'QU#002', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (33, 'Calculators', 'Office Supplies', 15, 4, '2023-09-12', 'Texas Instruments', 'Not Valid', 'QU#002', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (34, 'Mousepads', 'Electronics', 10, 6, '2023-09-10', 'Logitech', 'Not Valid', 'QU#002', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (35, 'Headphones', 'Electronics', 75, 3, '2023-09-08', 'Sony', 'Valid', 'QU#001', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (36, 'USB Drives', 'Electronics', 30, 12, '2023-09-06', 'SanDisk', 'Valid', 'QU#001', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (37, 'Power Strips', 'Electronics', 20, 5, '2023-09-04', 'Belkin', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (38, 'Cleaning Cloths', 'Cleaning Supplies', 5, 12, '2023-09-02', 'Microfiber', 'Not Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (39, 'Floor Cleaner', 'Cleaning Supplies', 10, 2, '2023-08-31', 'Mr. Clean', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (40, 'Dish Soap', 'Cleaning Supplies', 5, 3, '2023-08-29', 'Dawn', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (41, 'Hand Sanitizer', 'Cleaning Supplies', 15, 2, '2023-08-27', 'Purell', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (42, 'Paper Towels (bulk)', 'Cleaning Supplies', 150, 12, '2023-08-25', 'Costco', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (43, 'Toilet Paper (bulk)', 'Cleaning Supplies', 120, 24, '2023-08-23', 'Sam\'s Club', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (44, 'Garbage Bags (bulk)', 'Cleaning Supplies', 80, 50, '2023-08-21', 'Hefty', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (45, 'Coffee Filters', 'Food & Beverages', 5, 3, '2023-08-19', 'Melitta', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (46, 'Tea Bags', 'Food & Beverages', 10, 6, '2023-08-17', 'Twinings', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (47, 'Sugar', 'Food & Beverages', 3, 6, '2023-08-15', 'Domino', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (48, 'Creamer', 'Food & Beverages', 5, 3, '2023-08-13', 'Coffee Mate', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (49, 'Snacks (bulk)', 'Food & Beverages', 100, 30, '2023-08-11', 'Mars', 'Valid', 'QU#003', 5);
INSERT INTO `HFD`.`Purchase` (`pID`, `name`, `type`, `price`, `quantity`, `date`, `supplier`, `quality`, `Employee_checker_ID`, `Department_dID`) VALUES (50, 'Bottled Water (bulk)', 'Food & Beverages', 50, 24, '2023-08-09', 'Nestle', 'Valid', 'QU#003', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Transpoertation`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('BCD678', 'Rowboat', 'Water', 2, 4, 3, 7);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('BCD890', 'Yacht', 'Water', 15, 4, 3, 7);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('DEF456', 'Truck', 'Cargo', 10, 4, 3, NULL);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('EFG890', 'Segway', 'Personal', 1, 4, 3, 8);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('HIJ123', 'Snowmobile', 'Snow', 2, 4, 3, 6);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('HIJ456', 'RV', 'Travel', 6, 4, 3, 6);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('KLM123', 'Unicycle', 'Personal', 1, 4, 3, 5);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('KLM890', 'Roller Skates', 'Personal', 1, 4, 3, 5);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('MNO345', 'Bus', 'Public', 20, 4, 3, 3);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('PQR456', 'Ice Skates', 'Personal', 1, 4, 3, 5);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('STU901', 'Private Jet', 'Air', 10, 4, 3, 1);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('VWX345', 'Paraglider', 'Air', 1, 4, 3, 1);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('VWX678', 'Cable Car', 'Public', 25, 4, 3, 4);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('XYZ789', 'SUV', 'Car', 7, 4, 3, NULL);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('YZA234', 'Subway', 'Public', 50, 4, 3, 4);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('YZA345', 'Segway', 'Personal', 1, 4, 3, 3);
INSERT INTO `HFD`.`Transpoertation` (`plate_no`, `model`, `type`, `capacity`, `Department_dID`, `Importing Department_iID`, `Entertainment_Trip_eID`) VALUES ('YZA567', 'Helicopter', 'Air', 4, 4, 3, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Safety`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (1, 'Slip and Fall', 'Office Lobby', '2023-12-08', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (2, 'Equipment Malfunction', 'Warehouse A', '2023-12-06', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (3, 'Chemical Spill', 'Breakroom', '2023-11-30', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (4, 'Car Accident', 'Parking Lot', '2023-11-28', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (5, 'Fire Drill', 'Conference Room', '2023-11-22', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (6, 'Injury - Tripped', 'Stairwell', '2023-11-21', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (7, 'Fall from Height', 'Roof', '2023-11-15', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (8, 'Food Poisoning', 'Cafeteria', '2023-11-10', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (9, 'Electrical Shock', 'Server Room', '2023-11-08', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (10, 'Sanitary Issue', 'Restroom', '2023-11-03', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (11, 'Malfunction', 'Elevator', '2023-10-31', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (12, 'Injury - Sprain', 'Office Gym', '2023-10-27', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (13, 'Forklift Accident', 'Loading Dock', '2023-10-24', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (14, 'Fire - Electrical', 'Server Room', '2023-10-20', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (15, 'Verbal Altercation', 'Front Desk', '2023-10-18', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (16, 'Falling Objects', 'Storeroom', '2023-10-16', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (17, 'Food Allergy Reaction', 'Breakroom', '2023-10-14', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (18, 'Hit and Run', 'Parking Lot', '2023-10-12', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (19, 'Slip and Fall', 'Office Lobby', '2023-10-10', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (20, 'Fall from Height', 'Roof', '2023-10-08', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (21, 'Food Poisoning', 'Cafeteria', '2023-10-06', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (22, 'Injury - Tripped', 'Stairwell', '2023-10-04', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (23, 'Fire Drill', 'Conference Room', '2023-10-02', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (24, 'Malfunction', 'Elevator', '2023-09-30', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (25, 'Injury - Sprain', 'Office Gym', '2023-09-28', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (26, 'Equipment Malfunction', 'Warehouse B', '2023-09-26', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (27, 'Forklift Accident', 'Loading Dock', '2023-09-24', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (28, 'Verbal Altercation', 'Front Desk', '2023-09-22', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (29, 'Sanitary Issue', 'Restroom', '2023-09-20', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (30, 'Electrical Shock', 'Server Room', '2023-09-18', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (31, 'Chemical Spill', 'Breakroom', '2023-09-16', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (32, 'Car Accident', 'Parking Lot', '2023-09-14', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (33, 'Food Poisoning', 'Cafeteria', '2023-09-12', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (34, 'Falling Objects', 'Storeroom', '2023-09-10', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (35, 'Fall from Height', 'Roof', '2023-09-08', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (36, 'Malfunction', 'Elevator', '2023-09-06', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (37, 'Injury - Sprain', 'Office Gym', '2023-09-04', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (38, 'Equipment Malfunction', 'Warehouse C', '2023-09-02', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (39, 'Fire Drill', 'Conference Room', '2023-08-31', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (40, 'Verbal Altercation', 'Front Desk', '2023-08-29', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (41, 'Injury - Tripped', 'Stairwell', '2023-08-27', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (42, 'Fire - Electrical', 'Server Room', '2023-08-25', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (43, 'Chemical Spill', 'Breakroom', '2023-08-23', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (44, 'Hit and Run', 'Parking Lot', '2023-08-21', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (45, 'Slip and Fall', 'Office Lobby', '2023-08-19', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (46, 'Fall from Height', 'Roof', '2023-08-17', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (47, 'Food Poisoning', 'Cafeteria', '2023-08-15', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (48, 'Falling Objects', 'Storeroom', '2023-08-13', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (49, 'Forklift Accident', 'Loading Dock', '2023-08-11', 2, 5);
INSERT INTO `HFD`.`Safety` (`sID`, `incident`, `location`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (50, 'Equipment Malfunction', 'Warehouse D', '2023-08-09', 2, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Maintenance`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (1, 'Equipment Repair', '2023-12-08', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (2, 'Janitorial Service', '2023-12-06', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (3, 'Vehicle maintenance', '2023-11-30', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (4, 'Plumbing Repair', '2023-11-28', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (5, 'Vehicle maintenance', '2023-11-22', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (6, 'Vehicle maintenance', '2023-11-21', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (7, 'Vehicle maintenance', '2023-11-15', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (8, 'Roof Inspection', '2023-11-10', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (9, 'Vehicle maintenance', '2023-11-08', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (10, 'Lighting Maintenance', '2023-11-03', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (12, 'Vehicle maintenance', '2023-10-27', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (13, 'Vehicle maintenance', '2023-10-24', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (14, 'HVAC Maintenance', '2023-10-20', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (15, 'Vehicle maintenance', '2023-10-18', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (16, 'Electrical Maintenance', '2023-10-16', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (17, 'Painting', '2023-10-14', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (18, 'Flooring Replacement', '2023-10-12', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (19, 'Vehicle maintenance', '2023-10-10', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (20, 'Equipment Calibration', '2023-10-08', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (21, 'Lighting Maintenance', '2023-10-06', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (22, 'Equipment Repair', '2023-10-02', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (11, 'Janitorial Service', '2023-09-30', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (23, 'Lighting Maintenance', '2023-10-06', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (24, 'Equipment Repair', '2023-10-27', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (25, 'Vehicle maintenance', '2023-10-27', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (26, 'Vehicle maintenance', '2023-10-02', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (27, 'Vehicle maintenance', '2023-11-10', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (28, 'Vehicle maintenance', '2023-11-30', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (29, 'Vehicle maintenance', '2023-09-10', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (30, 'Vehicle maintenance', '2023-07-10', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (31, 'Vehicle maintenance', '2023-11-12', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (32, 'Vehicle maintenance', '2023-10-19', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (33, 'Vehicle maintenance', '2023-06-10', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (34, 'Equipment Repair', '2023-11-15', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (35, 'Electrical Maintenance', '2023-11-13', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (36, 'Janitorial Service', '2023-11-21', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (37, 'Roof Inspection', '2023-11-25', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (38, 'Plumbing Repair', '2023-05-10', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (39, 'Plumbing Repair', '2023-11-10', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (40, 'Roof Inspection', '2023-11-20', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (41, 'Janitorial Service', '2023-12-19', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (42, 'Plumbing Repair', '2023-11-16', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (43, 'Plumbing Repair', '2023-01-25', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (44, 'Roof Inspection', '2023-11-24', 3, 4);
INSERT INTO `HFD`.`Maintenance` (`mID`, `type`, `date`, `Department_dID`, `Importing Department_iID`) VALUES (45, 'Janitorial Service', '2023-11-14', 3, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Restaurant`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Restaurant` (`rID`, `capacity`, `location`, `Department_dID`, `Importing Department_iID`) VALUES (1, 150, 'Main Dining Hall', 12, 1);
INSERT INTO `HFD`.`Restaurant` (`rID`, `capacity`, `location`, `Department_dID`, `Importing Department_iID`) VALUES (2, 60, 'Terrace Bistro', 12, 1);
INSERT INTO `HFD`.`Restaurant` (`rID`, `capacity`, `location`, `Department_dID`, `Importing Department_iID`) VALUES (3, 80, 'Skyline Lounge', 12, 1);
INSERT INTO `HFD`.`Restaurant` (`rID`, `capacity`, `location`, `Department_dID`, `Importing Department_iID`) VALUES (4, 120, 'Garden Pavilion', 12, 1);
INSERT INTO `HFD`.`Restaurant` (`rID`, `capacity`, `location`, `Department_dID`, `Importing Department_iID`) VALUES (5, 40, 'Cozy Corner Cafe', 12, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Cleanliness`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (1, '2023-12-08', 2, 101, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (2, '2023-12-06', 2, 122, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (3, '2023-11-30', 2, 113, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (4, '2023-11-28', 2, 102, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (5, '2023-11-22', 2, 123, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (6, '2023-11-21', 2, 112, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (7, '2023-11-15', 2, 103, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (8, '2023-11-10', 2, 124, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (9, '2023-11-08', 2, 111, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (10, '2023-11-03', 2, 104, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (11, '2023-10-31', 2, 125, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (12, '2023-10-27', 2, 110, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (13, '2023-10-24', 2, 105, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (14, '2023-10-20', 2, 124, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (15, '2023-10-18', 2, 109, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (16, '2023-10-16', 2, 106, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (17, '2023-10-14', 2, 124, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (18, '2023-10-12', 2, 108, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (19, '2023-10-10', 2, 107, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (20, '2023-10-08', 2, 123, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (21, '2023-10-06', 2, 107, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (22, '2023-10-04', 2, 108, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (23, '2023-10-02', 2, 122, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (24, '2023-09-30', 2, 106, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (25, '2023-09-28', 2, 109, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (26, '2023-09-26', 2, 122, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (27, '2023-09-24', 2, 110, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (28, '2023-09-22', 2, 121, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (29, '2023-09-20', 2, 111, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (30, '2023-09-18', 2, 120, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (31, '2023-09-16', 2, 112, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (32, '2023-09-14', 2, 119, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (33, '2023-09-12', 2, 113, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (34, '2023-09-10', 2, 118, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (35, '2023-09-08', 2, 114, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (36, '2023-09-06', 2, 117, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (37, '2023-09-04', 2, 115, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (38, '2023-09-02', 2, 116, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (39, '2023-08-31', 2, 116, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (40, '2023-08-29', 2, 115, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (41, '2023-08-27', 2, 117, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (42, '2023-08-25', 2, 114, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (43, '2023-08-23', 2, 118, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (44, '2023-08-21', 2, 118, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (45, '2023-08-19', 2, 119, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (46, '2023-08-17', 2, 119, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (47, '2023-08-15', 2, 120, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (48, '2023-08-13', 2, 120, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (49, '2023-08-11', 2, 121, 9);
INSERT INTO `HFD`.`Cleanliness` (`cID`, `date`, `Importing Department_iID`, `Room_rID1`, `Department_dID`) VALUES (50, '2023-08-09', 2, 121, 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Medical`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (1, 'G#001', 'Fever', '2023-12-08', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (2, 'G#002', 'Cough', '2023-12-06', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (3, 'G#003', 'Headache', '2023-11-30', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (4, 'G#004', 'Sore Throat', '2023-11-28', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (5, 'G#005', 'Sprained Ankle', '2023-11-22', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (6, 'G#006', 'Allergies', '2023-11-21', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (7, 'G#007', 'Minor Burns', '2023-11-15', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (8, 'G#008', 'Upset Stomach', '2023-11-10', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (9, 'G#009', 'Insect Bite', '2023-11-08', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (10, 'G#010', 'Common Cold', '2023-11-03', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (11, 'G#011', 'Back Pain', '2023-10-31', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (12, 'G#012', 'Minor Cut', '2023-10-27', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (13, 'G#013', 'Fever', '2023-10-24', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (14, 'G#014', 'Cough', '2023-10-20', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (15, 'G#015', 'Headache', '2023-10-18', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (16, 'G#016', 'Sore Throat', '2023-10-16', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (17, 'G#017', 'Sprained Ankle', '2023-10-14', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (18, 'G#018', 'Allergies', '2023-10-12', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (19, 'G#019', 'Minor Burns', '2023-10-10', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (20, 'G#020', 'Upset Stomach', '2023-10-08', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (21, 'G#017', 'Minor Burns', '2023-11-01', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (22, 'G#018', 'Allergies', '2023-11-02', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (23, 'G#010', 'Minor Burns', '2023-11-08', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (24, 'G#001', 'Sprained Ankle', '2023-11-12', 1, 6);
INSERT INTO `HFD`.`Medical` (`mID`, `Guest_ID`, `condition`, `ex_Date`, `Department_dID`, `Importing Department_iID`) VALUES (25, 'G#005', 'Headache', '2023-11-28', 1, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (1, '2023-12-15', '4.5', 'Excellent service, very clean rooms!', 14, 'G#001');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (2, '2023-12-22', '3.8', 'Good experience, friendly staff.', 14, 'G#002');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (3, '2023-12-18', '5.0', 'Outstanding stay, highly recommended! ', 14, 'G#003');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (4, '2023-12-25', '4.2', 'Comfortable rooms, but slow Wi-Fi. ', 14, 'G#004');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (5, '2023-12-28', '3.5', 'Average service, needs improvement. ', 14, 'G#005');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (6, '2024-01-05', '4.8', 'Fantastic staff, great amenities! ', 14, 'G#006');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (7, '2024-01-10', '3.0', 'Disappointing experience, noisy environment.', 14, 'G#007');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (8, '2024-01-15', '4.7', 'Loved the breakfast options!', 14, 'G#008');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (9, '2024-01-20', '4.0', 'Clean and cozy, but limited parking space.', 14, 'G#009');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (10, '2024-01-25', '4.5', 'Helpful staff, convenient location.', 14, 'G#010');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (11, '2023/12/20', '1.2', 'Disrespectful staff, regret staying here.', 14, 'G#012');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (12, '2023/12/21', '2.0', 'Disappointed with cleanliness and service.', 14, 'G#013');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (13, '2021/12/22', '1.5', 'Needs major improvement in overall service. ', 14, 'G#014');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (14, '2022/12/23', '1.0', 'Worst hotel ever, unhelpful staff and dirty rooms.', 14, 'G#011');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (15, '2023/12/24', '4.3', 'Great value for money, courteous staff! ', 14, 'G#015');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (16, '2023/12/06', '5.0', 'Absolutely fantastic, exceeded expectations! ', 14, 'G#016');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (17, '2023/12/01', '4.5', 'Polite and helpful staff, enjoyed my stay.   ', 14, 'G#017');
INSERT INTO `HFD`.`Rating` (`ID`, `date`, `evaluation`, `feedback`, `Department_dID`, `Guest_ID`) VALUES (18, '2023/02/22', '4.8', 'Loved the spa facilities, relaxing atmosphere. ', 14, 'G#020');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Care_Giver`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (1, 'First Aid', 'G#001', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (2, 'CPR Certification', 'G#002', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (3, 'Medication Administration', 'G#003', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (4, 'Mobility Assistance', 'G#004', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (5, 'Alzheimer\'s/Dementia Care', 'G#005', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (6, 'Specialized Medical Training', 'G#006', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (7, 'Meal Planning and Preparation', 'G#007', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (8, 'Personal Hygiene Assistance', 'G#008', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (9, 'Patient Advocacy', 'G#009', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (10, 'Emotional Support', 'G#010', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (11, 'Communication Skills', 'G#011', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (12, 'Pain Management', 'G#012', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (13, 'Infection Control', 'G#013', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (14, 'Transferring and Lifting Techniques', 'G#014', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (15, 'Pediatric Care', 'G#015', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (16, 'Geriatric Care', 'G#016', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (17, 'Behavioral Management', 'G#017', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (18, 'Respiratory Care', 'G#018', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (19, 'Rehabilitation Support', 'G#019', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (20, 'Crisis Intervention', 'G#020', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (21, 'Patient Advocacy', '', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (22, 'Geriatric Care', '', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (23, 'First Aid', '', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (24, 'Specialized Medical Training', '', 6);
INSERT INTO `HFD`.`Care_Giver` (`cID`, `skills`, `Guest_ID`, `Department_dID`) VALUES (25, 'Emotional Support', '', 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Training`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Training` (`name`, `Date`, `duration`, `location`, `type`, `Department_dID`) VALUES ('CaringHands Academy: Empathetic Caregiving Skills Workshop', '2023-07-05', '5', 'Elysian Institute for Ethereal training', 'Care_giver', 7);
INSERT INTO `HFD`.`Training` (`name`, `Date`, `duration`, `location`, `type`, `Department_dID`) VALUES ('MedEd360: Advanced Healthcare Excellence Training', '2023-01-21', '4', 'NexGen Academy of Futuristic training\n', 'Medical', 7);
INSERT INTO `HFD`.`Training` (`name`, `Date`, `duration`, `location`, `type`, `Department_dID`) VALUES ('SafeGuard Pro: Comprehensive Safety & Risk Management Course', '2023-09-29', '3', 'etherius Institute of Advanced training\n', 'Safety', 7);
INSERT INTO `HFD`.`Training` (`name`, `Date`, `duration`, `location`, `type`, `Department_dID`) VALUES ('MaintainMastery: Elite Facility Care & Equipment Management Workshop', '2023-08-19', '2', 'Elysian Institute for Ethereal training', 'Maintenance', 7);
INSERT INTO `HFD`.`Training` (`name`, `Date`, `duration`, `location`, `type`, `Department_dID`) VALUES ('TransitElite: Precision Transport Logistics Training', '2023-05-07', '4', 'etherius Institute of Advanced training', 'Transportation', 7);
INSERT INTO `HFD`.`Training` (`name`, `Date`, `duration`, `location`, `type`, `Department_dID`) VALUES ('ProcurePrime: Strategic Procurement & Supply Chain Excellence Seminar', '2023-02-14', '6', 'hotel', 'Purchase', 7);
INSERT INTO `HFD`.`Training` (`name`, `Date`, `duration`, `location`, `type`, `Department_dID`) VALUES ('SkillForge Inc.: Professional Development & Training Bootcamp', '2023_04-09', '3', 'NexGen Academy of Futuristic training', 'Training', 7);
INSERT INTO `HFD`.`Training` (`name`, `Date`, `duration`, `location`, `type`, `Department_dID`) VALUES ('InsuraElevate: Advanced Risk Management & Insurance Solutions Forum', '2023-05-16', '2', 'etherius Institute of Advanced training', 'Insurance ', 7);
INSERT INTO `HFD`.`Training` (`name`, `Date`, `duration`, `location`, `type`, `Department_dID`) VALUES ('CleanSavvy Institute: Hygiene Optimization & Sanitation Mastery Program', '2023-06-27', '5', 'NexGen Academy of Futuristic training', 'Cleanliness', 7);
INSERT INTO `HFD`.`Training` (`name`, `Date`, `duration`, `location`, `type`, `Department_dID`) VALUES ('TaskMaster Pro: Effective Task & Project Management Seminar', '2023-05-06', '6', 'hotel', 'Appointment', 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Legal_Affairs`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Legal_Affairs` (`lID`, `type`, `date`, `Department_dID`) VALUES (1, 'External issues', '2023-03-12', 13);
INSERT INTO `HFD`.`Legal_Affairs` (`lID`, `type`, `date`, `Department_dID`) VALUES (2, 'Internal issues', '2023-12-05', 13);
INSERT INTO `HFD`.`Legal_Affairs` (`lID`, `type`, `date`, `Department_dID`) VALUES (3, 'External issues', '2023-03-27', 13);
INSERT INTO `HFD`.`Legal_Affairs` (`lID`, `type`, `date`, `Department_dID`) VALUES (4, 'Internal issues', '2023-10-18', 13);
INSERT INTO `HFD`.`Legal_Affairs` (`lID`, `type`, `date`, `Department_dID`) VALUES (5, 'Internal issues', '2023-11-19', 13);
INSERT INTO `HFD`.`Legal_Affairs` (`lID`, `type`, `date`, `Department_dID`) VALUES (6, 'External issues', '2023-07-14', 13);
INSERT INTO `HFD`.`Legal_Affairs` (`lID`, `type`, `date`, `Department_dID`) VALUES (7, 'External issues', '2023-12-15', 13);
INSERT INTO `HFD`.`Legal_Affairs` (`lID`, `type`, `date`, `Department_dID`) VALUES (8, 'Internal issues', '2023-09-26', 13);
INSERT INTO `HFD`.`Legal_Affairs` (`lID`, `type`, `date`, `Department_dID`) VALUES (9, 'External issues', '2023-05-18', 13);
INSERT INTO `HFD`.`Legal_Affairs` (`lID`, `type`, `date`, `Department_dID`) VALUES (10, 'Internal issues', '2023-02-05', 13);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Importing_Department`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Importing_Department` (`iID`) VALUES (1);
INSERT INTO `HFD`.`Importing_Department` (`iID`) VALUES (2);
INSERT INTO `HFD`.`Importing_Department` (`iID`) VALUES (3);
INSERT INTO `HFD`.`Importing_Department` (`iID`) VALUES (4);
INSERT INTO `HFD`.`Importing_Department` (`iID`) VALUES (5);
INSERT INTO `HFD`.`Importing_Department` (`iID`) VALUES (6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Room`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (101, 'Wheelchair Accessibility', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (102, 'Visual Alerts', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (103, 'Room Controls', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (104, 'Room Controls', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (105, 'Assistive Devices', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (106, 'Emergency Evacuation Plan', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (107, 'Room Controls', 2, 'not available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (108, 'Communication Features', 2, 'not available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (109, 'Instructional Technology', 1, 'not available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (110, 'Wheelchair Accessibility', 2, 'not available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (111, 'Wheelchair Accessibility', 3, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (112, 'Wheelchair Accessibility', 1, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (113, 'Visual Alerts', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (114, 'Visual Alerts', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (115, 'Instructional Technology', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (116, 'Assistive Devices', 3, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (117, 'Room Controls', 1, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (118, 'Room Controls', 1, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (119, 'Assistive Devices', 1, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (120, 'Instructional Technology', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (121, 'Assistive Devices', 3, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (122, 'Emergency Evacuation Plan', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (123, 'Visual Alerts', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (124, 'Communication Features', 2, 'available');
INSERT INTO `HFD`.`Room` (`rID`, `accesibilty_feature`, `capacity`, `availability`) VALUES (125, 'Communication Features', 2, 'available');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Dependent`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Layla Fatima Al-Mansoori', '48291037281', 'G#001', 'Spouse', '1983-02-05', 'Female');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Noura Aisha Al-Hakim', '76502198354', 'G#002', 'Spouse', '1990-05-12', 'Female');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Mariam Yasmin Al-Jabari', '63018745129', 'G#003', 'Spouse', '1987-06-17', 'Female');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Hana Amirah Al-Hakimi', '91723560482', 'G#004', 'Spouse', '1990-01-01', 'Female');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Amirah Leila Al-Abadi', '24138967105', 'G#005', 'Spouse', '1980-02-15', 'Female');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Khaled Bassem Al-Mahmoud', '58327019364', 'G#020', 'Child', '2000-01-15', 'Male');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Amina Saleh Al-Aziz', '10987654320', 'G#015', 'Child', '2000-02-15', 'Female');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Noor Hisham Al-Mazari', '42658309571', 'G#006', 'Child', '2000-03-15', 'Male');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Mariam Tariq Al-Hadi', '85623940217', 'G#011', 'Child', '2000-04-15', 'Female');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Bilal Jamal Al-Qasimi', '37409156280', 'G#010', 'Child', '2000-05-15', 'Male');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Faisal Hamza Al-Hashmi', '50923418765', 'G#011', 'friend', '1982-07-15', 'Male');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Zayd Farid Al-Ghazali', '73642801954', 'G#013', 'friend', '1988-04-22', 'Male');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Khalid Amir Al-Mazari', '18275043896', 'G#009', 'friend', '1990-11-08', 'Male');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Ahmed Mustafa Al-Khatib', '69501234789', 'G#017', 'friend', '1985-06-17', 'Male');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Yusuf Mahmoud Al-Abadi', '23056179384', 'G#001', 'friend', '1993-02-03', 'Male');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Omar Ali Al-Farsi', '87415096362', 'G#019', 'cousin', '1980-09-29', 'Male');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Fatima Ahmed Al-Mansoori', '14986520738', 'G#010', 'cousin', '1992-12-11', 'Female');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Yasmina Noor Al-Abadi', '56739012834', 'G#012', 'cousin', '1987-05-26', 'Female');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Amir Faisal Al-Jabari', '94562830174', 'G#011', 'cousin', '1995-02-14', 'Male');
INSERT INTO `HFD`.`Dependent` (`Name`, `SSN`, `Guest_ID`, `relationship`, `Bdate`, `Gender`) VALUES ('Samir Bilal Al-Mahmoud', '30824761590', 'G#003', 'cousin', '1983-10-05', 'Male');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Dependent_Phone`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01011345678, '9456283017496021');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01023456789, '9172356048236905');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01034567890, '8741509636281503');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01045678901, '8562394021765031');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01056789012, '7650219835461872');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01112345678, '7364280195436179');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01123456789, '6950123478905623');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01134567890, '6301874512985032');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01145678901, '5832701936409821');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01156789012, '5673901283456182');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01512345678, '5092341876561204');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01523456789, '4829103728465921');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01534567890, '4265830957126948');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01545678901, '3740915628036429');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01556789012, '3082476159047315');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01212345678, '2413896710547328');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01223456789, '2305617938469402');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01234567890, '1827504389613709');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01245678901, '1498652073860417');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01256789012, '1098765432014785');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01212395678, '9172356048236905');
INSERT INTO `HFD`.`Dependent_Phone` (`Phone`, `Dependent_SSN`) VALUES (01012345678, '1827504389613709');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Entertainment_Trip`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Entertainment_Trip` (`eID`, `type`, `place`, `duration`) VALUES (1, 'Sightseeing', 'City Museum', '1 day');
INSERT INTO `HFD`.`Entertainment_Trip` (`eID`, `type`, `place`, `duration`) VALUES (2, 'Theme Park', 'Adventure World', '2 days');
INSERT INTO `HFD`.`Entertainment_Trip` (`eID`, `type`, `place`, `duration`) VALUES (3, 'Beach Retreat', 'Tropical Resort', '3 days ');
INSERT INTO `HFD`.`Entertainment_Trip` (`eID`, `type`, `place`, `duration`) VALUES (4, 'Cultural Tour', 'Historic Village', '1 week');
INSERT INTO `HFD`.`Entertainment_Trip` (`eID`, `type`, `place`, `duration`) VALUES (5, 'Outdoor Concert', 'Lakeside Park', '1 day ');
INSERT INTO `HFD`.`Entertainment_Trip` (`eID`, `type`, `place`, `duration`) VALUES (6, 'Ski Trip', 'Mountain Resort', '4 days ');
INSERT INTO `HFD`.`Entertainment_Trip` (`eID`, `type`, `place`, `duration`) VALUES (7, 'Fishing', 'Vineyard Estate', '2 days');
INSERT INTO `HFD`.`Entertainment_Trip` (`eID`, `type`, `place`, `duration`) VALUES (8, 'Wildlife Safari', 'Safari Reserve', '3 days');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Gets`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Gets` (`trainee_ID`, `Training_Date`, `Training_name`, `rating`) VALUES ('CR#005', '2023-07-05', 'CaringHands Academy: Empathetic Caregiving Skills Workshop', '8');
INSERT INTO `HFD`.`Gets` (`trainee_ID`, `Training_Date`, `Training_name`, `rating`) VALUES ('MD#003', '2023-01-21', 'MedEd360: Advanced Healthcare Excellence Training', '5');
INSERT INTO `HFD`.`Gets` (`trainee_ID`, `Training_Date`, `Training_name`, `rating`) VALUES ('SF#003', '2023-09-29', 'SafeGuard Pro: Comprehensive Safety & Risk Management Course', '4');
INSERT INTO `HFD`.`Gets` (`trainee_ID`, `Training_Date`, `Training_name`, `rating`) VALUES ('MA#002', '2023-08-19', 'MaintainMastery: Elite Facility Care & Equipment Management Workshop', '7');
INSERT INTO `HFD`.`Gets` (`trainee_ID`, `Training_Date`, `Training_name`, `rating`) VALUES ('TR#004', '2023-05-07', 'TransitElite: Precision Transport Logistics Training', '9');
INSERT INTO `HFD`.`Gets` (`trainee_ID`, `Training_Date`, `Training_name`, `rating`) VALUES ('PU#002', '2023-02-14', 'ProcurePrime: Strategic Procurement & Supply Chain Excellence Seminar', '6');
INSERT INTO `HFD`.`Gets` (`trainee_ID`, `Training_Date`, `Training_name`, `rating`) VALUES ('TN#004', '2023-04-09', 'SkillForge Inc.: Professional Development & Training Bootcamp', '5');
INSERT INTO `HFD`.`Gets` (`trainee_ID`, `Training_Date`, `Training_name`, `rating`) VALUES ('IN#003', '2023-05-16', 'InsuraElevate: Advanced Risk Management & Insurance Solutions Forum', '7');
INSERT INTO `HFD`.`Gets` (`trainee_ID`, `Training_Date`, `Training_name`, `rating`) VALUES ('CL#002', '2023-06-27', 'CleanSavvy Institute: Hygiene Optimization & Sanitation Mastery Program', '8');
INSERT INTO `HFD`.`Gets` (`trainee_ID`, `Training_Date`, `Training_name`, `rating`) VALUES ('AP#001', '2023-05-06', 'TaskMaster Pro: Effective Task & Project Management Seminar', '4');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`lawsuit`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`lawsuit` (`Employee_ID`, `Guest_ID`, `Legal_Affairs_lID`) VALUES ('CR#002', 'G#010', 1);
INSERT INTO `HFD`.`lawsuit` (`Employee_ID`, `Guest_ID`, `Legal_Affairs_lID`) VALUES ('CR#004', 'G#012', 2);
INSERT INTO `HFD`.`lawsuit` (`Employee_ID`, `Guest_ID`, `Legal_Affairs_lID`) VALUES ('CR#006', 'G#015', 3);
INSERT INTO `HFD`.`lawsuit` (`Employee_ID`, `Guest_ID`, `Legal_Affairs_lID`) VALUES ('CR#008', 'G#019', 4);
INSERT INTO `HFD`.`lawsuit` (`Employee_ID`, `Guest_ID`, `Legal_Affairs_lID`) VALUES ('CR#010', 'G#011', 5);
INSERT INTO `HFD`.`lawsuit` (`Employee_ID`, `Guest_ID`, `Legal_Affairs_lID`) VALUES ('CR#012', 'G#006', 6);
INSERT INTO `HFD`.`lawsuit` (`Employee_ID`, `Guest_ID`, `Legal_Affairs_lID`) VALUES ('CR#013', 'G#007', 7);
INSERT INTO `HFD`.`lawsuit` (`Employee_ID`, `Guest_ID`, `Legal_Affairs_lID`) VALUES ('CR#016', 'G#001', 8);
INSERT INTO `HFD`.`lawsuit` (`Employee_ID`, `Guest_ID`, `Legal_Affairs_lID`) VALUES ('CR#017', 'G#020', 9);
INSERT INTO `HFD`.`lawsuit` (`Employee_ID`, `Guest_ID`, `Legal_Affairs_lID`) VALUES ('CR#023', 'G#011', 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Goes_on`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (1, 'G#001', '2023/12/20');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (1, 'G#002', '2023/12/20');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (1, 'G#003', '2023/12/20');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (2, 'G#001', '2024/01/15');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (2, 'G#007', '2024/01/15');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (2, 'G#005', '2024/01/15');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (3, 'G#008', '2024/06/15');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (4, 'G#009', '2024/02/15');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (4, 'G#005', '2024/02/15');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (5, 'G#001', '2024/01/09');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (5, 'G#010', '2024/01/09');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (5, 'G#011', '2024/01/09');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (5, 'G#012', '2024/01/09');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (6, 'G#015', '2024/01/23');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (6, 'G#020', '2024/01/23');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (6, 'G#016', '2024/01/23');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (7, 'G#004', '2024/01/04');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (8, 'G#016', '2023/12/28');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (8, 'G#017', '2023/12/28');
INSERT INTO `HFD`.`Goes_on` (`Entertainment_Trip_eID`, `Guest_ID`, `Date`) VALUES (8, 'G#018', '2023/12/28');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Medication`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (1, 'Acetaminophen', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (1, 'Cough Syrup', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (1, 'Ibuprofen', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (1, 'Throat Lozenges', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (2, 'Pain Relievers', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (2, 'Antihistamines', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (3, 'Burn Cream', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (3, 'Antacids', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (3, 'Anti-Itch Cream', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (3, 'Cold Medicine', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (4, 'Muscle Relaxants', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (4, 'Antibiotic Ointment', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (4, 'Acetaminophen', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (5, 'Cough Syrup', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (5, 'Ibuprofen', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (5, 'Throat Lozenges', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (5, 'Pain Relievers', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (5, 'Antihistamines', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (6, 'Burn Cream', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (6, 'Antacids', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (7, 'Anti-Itch Cream', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (8, 'Cold Medicine', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (9, 'Muscle Relaxants', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (9, 'Antibiotic Ointment', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (9, 'Acetaminophen', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (9, 'Cough Syrup', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (9, 'Ibuprofen', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (9, 'Throat Lozenges', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (9, 'Pain Relievers', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (10, 'Antihistamines', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (11, 'Burn Cream', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (12, 'Antacids', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (13, 'Anti-Itch Cream', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (13, 'Cold Medicine', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (13, 'Muscle Relaxants', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (13, 'Antibiotic Ointment', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (13, 'Acetaminophen', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (14, 'Cough Syrup', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (14, 'Ibuprofen', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (15, 'Throat Lozenges', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (15, 'Pain Relievers', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (15, 'Antihistamines', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (16, 'Burn Cream', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (16, 'Antacids', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (17, 'Anti-Itch Cream', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (18, 'Cold Medicine', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (19, 'Muscle Relaxants', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (20, 'Antibiotic Ointment', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (20, 'Acetaminophen', 1);
INSERT INTO `HFD`.`Medication` (`Medical_ID`, `medication`, `Medical_Department_dID`) VALUES (20, 'Cough Syrup', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`employee_insurance`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (1, 'CR#001', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (2, 'CR#002', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (3, 'CR#003', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (4, 'CR#004', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (5, 'CR#005', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (6, 'CR#006', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (7, 'CR#007', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (8, 'CR#008', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (9, 'CR#009', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (10, 'CR#010', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (11, 'CR#011', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (12, 'CR#012', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (13, 'CR#013', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (14, 'CR#014', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (15, 'CR#015', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (16, 'CR#016', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (17, 'CR#017', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (18, 'CR#018', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (19, 'CR#019', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (20, 'CR#020', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (21, 'CR#021', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (22, 'CR#022', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (23, 'CR#023', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (24, 'CR#024', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (25, 'CR#025', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (26, 'MD#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (27, 'MD#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (28, 'MD#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (29, 'MD#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (30, 'SF#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (31, 'SF#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (32, 'SF#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (33, 'SF#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (34, 'MA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (35, 'MA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (36, 'MA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (37, 'MA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (38, 'TR#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (39, 'TR#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (40, 'TR#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (41, 'TR#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (42, 'PU#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (43, 'PU#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (44, 'PU#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (45, 'PU#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (46, 'TN#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (47, 'TN#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (48, 'TN#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (49, 'TN#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (50, 'IN#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (51, 'IN#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (52, 'IN#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (53, 'IN#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (54, 'CL#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (55, 'CL#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (56, 'CL#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (57, 'CL#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (58, 'AP#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (59, 'AP#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (60, 'AP#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (61, 'AP#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (62, 'ST#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (63, 'ST#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (64, 'ST#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (65, 'ST#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (66, 'RE#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (67, 'RE#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (68, 'RE#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (69, 'RE#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (70, 'LA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (71, 'LA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (72, 'LA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (73, 'LA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (74, 'RA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (75, 'RA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (76, 'RA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (77, 'RA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (78, 'PA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (79, 'PA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (80, 'PA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (81, 'PA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (82, 'AM#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (83, 'AM#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (84, 'AM#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (85, 'AM#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (86, 'FA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (87, 'FA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (88, 'FA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (89, 'FA#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (90, 'SE#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (91, 'SE#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (92, 'SE#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (93, 'SE#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (94, 'RP#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (95, 'RP#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (96, 'RP#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (97, 'RP#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (98, 'QU#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (99, 'QU#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (100, 'QU#00', 8);
INSERT INTO `HFD`.`employee_insurance` (`Insurance_iID`, `Employee_ID`, `Insurance_Department_dID`) VALUES (101, 'QU#00', 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`transportation_insurance`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (102, 8, 'BCD678', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (103, 8, 'BCD890', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (104, 8, 'DEF456', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (105, 8, 'EFG890', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (106, 8, 'HIJ123', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (107, 8, 'HIJ456', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (108, 8, 'KLM123', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (109, 8, 'KLM890', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (110, 8, 'MNO345', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (111, 8, 'PQR456', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (112, 8, 'STU901', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (113, 8, 'VWX345', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (114, 8, 'VWX678', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (115, 8, 'XYZ789', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (116, 8, 'YZA234', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (117, 8, 'YZA345', 4);
INSERT INTO `HFD`.`transportation_insurance` (`Insurance_iID`, `Insurance_Department_dID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (118, 8, 'YZA567', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`transportation_maintenance`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (3, 'BCD678', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (5, 'DFE456', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (6, 'EFG890', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (7, 'KLM123', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (9, 'MNO345', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (12, 'PQR456', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (13, 'STU901', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (15, 'MNO345', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (19, 'YZA234', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (25, 'BCD890', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (26, 'KLM890', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (27, 'HIJ123', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (28, 'HIJ456', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (29, 'VWX345', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (30, 'XYZ789', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (31, 'VWX678', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (32, 'YZA345', 3, 4);
INSERT INTO `HFD`.`transportation_maintenance` (`Maintenance_mID`, `Transpoertation_plate_no`, `Maintenance_Department_dID`, `Transpoertation_Department_dID`) VALUES (33, 'YZA567', 3, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`room_maintenance`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (1, 101, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (2, 105, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (4, 108, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (8, 109, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (10, 104, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (11, 102, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (14, 105, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (16, 106, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (17, 119, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (18, 120, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (20, 101, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (21, 118, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (22, 110, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (23, 103, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (24, 107, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (34, 111, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (35, 112, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (36, 113, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (37, 114, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (38, 115, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (39, 116, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (40, 117, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (41, 121, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (42, 122, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (43, 123, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (44, 124, 3);
INSERT INTO `HFD`.`room_maintenance` (`Maintenance_mID`, `Room_ID`, `Maintenance_Department_dID`) VALUES (45, 125, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Storage`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (1, NULL, 'Electronics', 1, 11, 5, 5, 'Basement');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (2, NULL, 'Clothing', 2, 11, NULL, 5, 'Floor 4');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (3, NULL, 'Appliances', 3, 11, 6, 5, 'Floor 1');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (4, NULL, 'Furniture', 4, 11, NULL, 5, 'Basement');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (5, '2023-11-22', 'Office Supplies', 5, 11, NULL, 5, 'Floor 3');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (6, '2023-11-21', 'Food & Beverages', 6, 11, 1, 5, 'Floor 1');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (7, '2023-11-15', 'Cleaning Supplies', 7, 11, 2, 5, 'Basement');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (8, '2023-10-30', 'Maintenance Supplies', 8, 11, 4, 5, 'Basement');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (9, '2023-11-08', 'Cleaning Supplies', 9, 11, 2, 5, 'Basement');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (10, '2023-11-03', 'Cleaning Supplies', 10, 11, NULL, 5, 'Basement');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (11, '2023-11-27', 'Maintenance Supplies', 11, 11, 4, 5, 'Garage');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (12, '2023-10-27', 'Maintenance Supplies', 12, 11, NULL, 5, 'Basement');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (13, '2023-10-24', 'Maintenance Supplies', 13, 11, 4, 5, 'Basement');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (14, '2023-10-20', 'Maintenance Supplies', 14, 11, NULL, 5, 'Floor 1');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (15, '2023-10-18', 'Maintenance Supplies', 15, 11, 4, 5, 'Floor 2');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (16, '2023-10-16', 'Office Supplies', 16, 11, NULL, 5, 'Basement');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (17, '2023-10-14', 'Office Supplies', 17, 11, NULL, 5, 'Floor 2');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (18, '2023-10-12', 'Office Supplies', 18, 11, NULL, 5, 'Floor 4');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (19, NULL, 'Electronics', 34, 11, 5, 5, 'Basement');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (20, NULL, 'Electronics', 35, 11, 5, 5, 'Basement');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (21, NULL, 'Electronics', 36, 11, NULL, 5, 'Floor 1');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (22, NULL, 'Electronics', 37, 11, 5, 5, 'Floor 2');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (24, '2023-08-31', 'Cleaning Supplies', 39, 11, NULL, 5, 'Floor 2');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (25, '2023-08-29', 'Cleaning Supplies', 40, 11, 2, 5, 'Floor 3');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (26, '2023-08-27', 'Cleaning Supplies', 41, 11, 2, 5, 'Floor 4');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (27, '2023-08-25', 'Cleaning Supplies', 42, 11, NULL, 5, 'Floor 1');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (28, '2023-08-23', 'Cleaning Supplies', 43, 11, 2, 5, 'Floor 2');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (29, '2023-08-21', 'Cleaning Supplies', 44, 11, 2, 5, 'Floor 3');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (30, '2023-08-19', 'Food & Beverages', 45, 11, 1, 5, 'Floor 1');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (31, '2023-08-17', 'Food & Beverages', 46, 11, NULL, 5, 'Floor 2');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (32, '2023-08-15', 'Food & Beverages', 47, 11, 1, 5, 'Floor 2');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (33, '2023-08-13', 'Food & Beverages', 48, 11, NULL, 5, 'Floor 3');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (34, '2023-08-11', 'Food & Beverages', 49, 11, 1, 5, 'Floor 3');
INSERT INTO `HFD`.`Storage` (`sID`, `expair_date`, `type`, `Purchase_ID`, `Department_dID`, `Importing Department_iID`, `Purchase_Department_dID`, `location`) VALUES (35, '2023-08-09', 'Food & Beverages', 50, 11, NULL, 5, 'Floor 1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HFD`.`Has`
-- -----------------------------------------------------
START TRANSACTION;
USE `HFD`;
INSERT INTO `HFD`.`Has` (`Entertainment_Trip_eID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (1, 'BCD678', 4);
INSERT INTO `HFD`.`Has` (`Entertainment_Trip_eID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (2, 'BCD890', 4);
INSERT INTO `HFD`.`Has` (`Entertainment_Trip_eID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (3, 'DEF456', 4);
INSERT INTO `HFD`.`Has` (`Entertainment_Trip_eID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (4, 'EFG890', 4);
INSERT INTO `HFD`.`Has` (`Entertainment_Trip_eID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (5, 'HIJ123', 4);
INSERT INTO `HFD`.`Has` (`Entertainment_Trip_eID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (6, 'HIJ456', 4);
INSERT INTO `HFD`.`Has` (`Entertainment_Trip_eID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (7, 'KLM123', 4);
INSERT INTO `HFD`.`Has` (`Entertainment_Trip_eID`, `Transpoertation_plate_no`, `Transpoertation_Department_dID`) VALUES (8, 'KLM890', 4);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
