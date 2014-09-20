SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `Get-The-Job` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `Get-The-Job` ;

-- -----------------------------------------------------
-- Table `Get-The-Job`.`WORK_TYPE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`WORK_TYPE` (
  `WorkTypeID` INT NOT NULL ,
  `WorkType` VARCHAR(20) NULL ,
  PRIMARY KEY (`WorkTypeID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`LOGIN`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`LOGIN` (
  `UserName` VARCHAR(30) NOT NULL ,
  `PassWord` VARCHAR(10) NULL ,
  PRIMARY KEY (`UserName`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`COUNTRY`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`COUNTRY` (
  `CountryID` INT NOT NULL AUTO_INCREMENT ,
  `CountryName` VARCHAR(50) NULL ,
  PRIMARY KEY (`CountryID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`REGION`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`REGION` (
  `RegionID` INT NOT NULL AUTO_INCREMENT ,
  `RegionName` VARCHAR(50) NULL ,
  `CountryID` INT NULL ,
  PRIMARY KEY (`RegionID`) ,
  INDEX `CountryID_idx` (`CountryID` ASC) ,
  CONSTRAINT `CountryID`
    FOREIGN KEY (`CountryID` )
    REFERENCES `Get-The-Job`.`COUNTRY` (`CountryID` )
    ON DELETE NO ACTION
   /* ON UPDATE NO ACTION */)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`DISTRICT`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`DISTRICT` (
  `DistrictID` INT NOT NULL AUTO_INCREMENT ,
  `DistrictName` VARCHAR(50) NULL ,
  `RegionID` INT NULL ,
  PRIMARY KEY (`DistrictID`) ,
  INDEX `CityID_idx` (`RegionID` ASC) ,
  CONSTRAINT `RegionID`
    FOREIGN KEY (`RegionID` )
    REFERENCES `Get-The-Job`.`REGION` (`RegionID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOB_SEEKER`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`JOB_SEEKER` (
  `SeekerID` INT NOT NULL AUTO_INCREMENT ,
  `FirstName` VARCHAR(25) NULL ,
  `LastName` VARCHAR(25) NULL ,
  `EmailID` VARCHAR(35) NULL ,
  `Address` VARCHAR(100) NULL ,
  `MobileNumber` INT NULL ,
  `HomePhone` INT NULL ,
  `Qualification` TEXT NULL ,
  `CurrentJob` TEXT NULL ,
  `Experience` TEXT NULL ,
  `SummaryOfSkills` TEXT NULL ,
  `SalaryExpectation` FLOAT(8,2) NULL ,
  `VisaStatus` VARCHAR(50) NULL ,
  `LinkedinProfileLink` VARCHAR(100) NULL ,
  `CoverLetter` LONGTEXT NULL ,
  `Availability` DATETIME NULL ,
  `IsPublicDownloadResume` TINYINT NULL ,
  `DistrictID` INT NULL ,
  PRIMARY KEY (`SeekerID`) ,
  INDEX `_idx` (`EmailID` ASC) ,
  INDEX `DistrictID_idx` (`DistrictID` ASC) ,
  CONSTRAINT `Login`
    FOREIGN KEY (`EmailID` )
    REFERENCES `Get-The-Job`.`LOGIN` (`UserName` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DistrictID`
    FOREIGN KEY (`DistrictID` )
    REFERENCES `Get-The-Job`.`DISTRICT` (`DistrictID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOBSEEKER_RESUME`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`JOBSEEKER_RESUME` (
  `ResumeNo` INT NOT NULL AUTO_INCREMENT ,
  `SeekerID` INT NULL ,
  `ResumeFile` LONGTEXT NULL ,
  PRIMARY KEY (`ResumeNo`) ,
  INDEX `SeekerID_idx` (`SeekerID` ASC) ,
  CONSTRAINT `SeekerID`
    FOREIGN KEY (`SeekerID` )
    REFERENCES `Get-The-Job`.`JOB_SEEKER` (`SeekerID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOB`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`JOB` (
  `JobID` INT NOT NULL AUTO_INCREMENT ,
  `JobTitle` VARCHAR(50) NULL ,
  `JobDescription` LONGTEXT NULL ,
  `WorkTypeID` INT NULL ,
  `DistrictID` INT NULL ,
  `SubCategoryID` INT NULL ,
  `Salary` FLOAT(8,2) NULL ,
  `DateOfAdvertisement` DATETIME NULL ,
  `EndDateOfAdvertisement` DATETIME NULL ,
  PRIMARY KEY (`JobID`) ,
  INDEX `DistrictID_idx` (`DistrictID` ASC) ,
  INDEX `WorkTypeID_idx` (`WorkTypeID` ASC) ,
  CONSTRAINT `DistrictID`
    FOREIGN KEY (`DistrictID` )
    REFERENCES `Get-The-Job`.`DISTRICT` (`DistrictID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `WorkTypeID`
    FOREIGN KEY (`WorkTypeID` )
    REFERENCES `Get-The-Job`.`WORK_TYPE` (`WorkTypeID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOB_CATEGORY`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`JOB_CATEGORY` (
  `CategoryID` INT NOT NULL AUTO_INCREMENT ,
  `CategoryName` VARCHAR(50) NULL ,
  PRIMARY KEY (`CategoryID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOB_SUB_CATEGORY`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`JOB_SUB_CATEGORY` (
  `SubCategoryID` INT NOT NULL AUTO_INCREMENT ,
  `SubCategoryName` VARCHAR(45) NULL ,
  `CategoryID` INT NULL ,
  PRIMARY KEY (`SubCategoryID`) ,
  INDEX `CategoryID_idx` (`CategoryID` ASC) ,
  CONSTRAINT `CategoryID`
    FOREIGN KEY (`CategoryID` )
    REFERENCES `Get-The-Job`.`JOB_CATEGORY` (`CategoryID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOB_ALERT`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`JOB_ALERT` (
  `JobAlertID` INT NOT NULL AUTO_INCREMENT ,
  `SeekerID` INT NULL ,
  `JobAlertTitle` VARCHAR(100) NULL ,
  `CategoryIDs` VARCHAR(45) NULL ,
  `Area/DistrictIDs` VARCHAR(45) NULL ,
  `SalaryIDs` VARCHAR(45) NULL ,
  `WorkTypeIDs` VARCHAR(45) NULL ,
  PRIMARY KEY (`JobAlertID`) ,
  INDEX `SeekerID_idx` (`SeekerID` ASC) ,
  CONSTRAINT `SeekerID`
    FOREIGN KEY (`SeekerID` )
    REFERENCES `Get-The-Job`.`JOB_SEEKER` (`SeekerID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOBALERT_DISTRICT`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`JOBALERT_DISTRICT` (
  `JOBALERT_ID` INT NOT NULL ,
  `DISTRICT_ID` INT NOT NULL ,
  `JOBSEEKER_ID` INT NULL ,
  PRIMARY KEY (`JOBALERT_ID`, `DISTRICT_ID`) ,
  INDEX `JobAlertID_idx` (`JOBALERT_ID` ASC) ,
  INDEX `DistrictID_idx` (`DISTRICT_ID` ASC) ,
  INDEX `JobSeekerID_idx` (`JOBSEEKER_ID` ASC) ,
  CONSTRAINT `JobAlertID`
    FOREIGN KEY (`JOBALERT_ID` )
    REFERENCES `Get-The-Job`.`JOB_ALERT` (`JobAlertID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DistrictID`
    FOREIGN KEY (`DISTRICT_ID` )
    REFERENCES `Get-The-Job`.`DISTRICT` (`DistrictID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `JobSeekerID`
    FOREIGN KEY (`JOBSEEKER_ID` )
    REFERENCES `Get-The-Job`.`JOB_SEEKER` (`SeekerID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`EMPLOYER_TYPE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`EMPLOYER_TYPE` (
  `EMPLOYER_TYPEID` INT NOT NULL AUTO_INCREMENT ,
  `EMPLOYER_TYPE_DESCRIPTION` VARCHAR(45) NULL ,
  PRIMARY KEY (`EMPLOYER_TYPEID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`EMPLOYER_AGENT/COMPANY`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`EMPLOYER_AGENT/COMPANY` (
  `EMPLOYER_ID` INT NOT NULL AUTO_INCREMENT ,
  `FirstName` VARCHAR(45) NULL ,
  `LastName` VARCHAR(45) NULL ,
  `Address` VARCHAR(50) NULL ,
  `Company/AgentLogo` BLOB NULL ,
  `MobilePhone` INT NULL ,
  `WorkPhone` INT NULL ,
  `EmailForApplication` VARCHAR(50) NULL ,
  `Company/AgentURL` VARCHAR(100) NULL ,
  `EMPLOYER_TYPE_ID` INT NULL ,
  `AGENT/COMPANY_NAME` VARCHAR(50) NULL ,
  `Username/Email` VARCHAR(45) NULL ,
  PRIMARY KEY (`EMPLOYER_ID`) ,
  INDEX `EmployerTypeID_idx` (`EMPLOYER_TYPE_ID` ASC) ,
  UNIQUE INDEX `Username/Email_UNIQUE` (`Username/Email` ASC) ,
  CONSTRAINT `EmployerTypeID`
    FOREIGN KEY (`EMPLOYER_TYPE_ID` )
    REFERENCES `Get-The-Job`.`EMPLOYER_TYPE` (`EMPLOYER_TYPEID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`SALARY_RANGE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`SALARY_RANGE` (
  `SalaryID` INT NOT NULL AUTO_INCREMENT ,
  `Salary_Range_From` VARCHAR(45) NULL ,
  `Salary_Range_To` VARCHAR(45) NULL ,
  PRIMARY KEY (`SalaryID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOB_JOBSEEKER`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job`.`JOB_JOBSEEKER` (
  `JobID` INT NOT NULL ,
  `JobSeekerID` INT NOT NULL ,
  PRIMARY KEY (`JobID`, `JobSeekerID`) ,
  INDEX `Job_JobID_idx` (`JobID` ASC) ,
  INDEX `JobSeeker_SeekerID_idx` (`JobSeekerID` ASC) ,
  CONSTRAINT `Job_JobID`
    FOREIGN KEY (`JobID` )
    REFERENCES `Get-The-Job`.`JOB` (`JobID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `JobSeeker_SeekerID`
    FOREIGN KEY (`JobSeekerID` )
    REFERENCES `Get-The-Job`.`JOB_SEEKER` (`SeekerID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Get-The-Job` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
