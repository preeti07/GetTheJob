SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `Get-The-Job-suga` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
CREATE SCHEMA IF NOT EXISTS `mysql` DEFAULT CHARACTER SET latin1 ;
USE `Get-The-Job-suga` ;

-- -----------------------------------------------------
-- Table `Get-The-Job`.`WORK_TYPE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`WORK_TYPE` (
  `WorkTypeID` INT NOT NULL ,
  `WorkType` VARCHAR(20) NULL ,
  PRIMARY KEY (`WorkTypeID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`LOGIN`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`LOGIN` (
  `UserName` VARCHAR(30) NOT NULL ,
  `PassWord` VARCHAR(10) NULL ,
  PRIMARY KEY (`UserName`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`COUNTRY`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`COUNTRY` (
  `CountryID` INT NOT NULL AUTO_INCREMENT ,
  `CountryName` VARCHAR(50) NULL ,
  PRIMARY KEY (`CountryID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`REGION`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`REGION` (
  `RegionID` INT NOT NULL AUTO_INCREMENT ,
  `RegionName` VARCHAR(50) NULL ,
  `CountryID` INT NULL ,
  PRIMARY KEY (`RegionID`) ,
  INDEX `CountryID_idx` (`CountryID` ASC) ,
  CONSTRAINT `CountryID`
    FOREIGN KEY (`CountryID` )
    REFERENCES `Get-The-Job-suga`.`COUNTRY` (`CountryID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`DISTRICT`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`DISTRICT` (
  `DistrictID` INT NOT NULL AUTO_INCREMENT ,
  `DistrictName` VARCHAR(50) NULL ,
  `RegionID` INT NULL ,
  PRIMARY KEY (`DistrictID`) ,
  INDEX `CityID_idx` (`RegionID` ASC) ,
  CONSTRAINT `RegionID`
    FOREIGN KEY (`RegionID` )
    REFERENCES `Get-The-Job-suga`.`REGION` (`RegionID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOB_SEEKER`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`JOB_SEEKER` (
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
    REFERENCES `Get-The-Job-suga`.`LOGIN` (`UserName` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DistrictID`
    FOREIGN KEY (`DistrictID` )
    REFERENCES `Get-The-Job-suga`.`DISTRICT` (`DistrictID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOBSEEKER_RESUME`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`JOBSEEKER_RESUME` (
  `ResumeNo` INT NOT NULL AUTO_INCREMENT ,
  `SeekerID` INT NULL ,
  `ResumeFile` LONGTEXT NULL ,
  PRIMARY KEY (`ResumeNo`) ,
  INDEX `SeekerID_idx` (`SeekerID` ASC) ,
  CONSTRAINT `SeekerID`
    FOREIGN KEY (`SeekerID` )
    REFERENCES `Get-The-Job-suga`.`JOB_SEEKER` (`SeekerID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOB`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`JOB` (
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
    REFERENCES `Get-The-Job-suga`.`DISTRICT` (`DistrictID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `WorkTypeID`
    FOREIGN KEY (`WorkTypeID` )
    REFERENCES `Get-The-Job-suga`.`WORK_TYPE` (`WorkTypeID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOB_CATEGORY`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`JOB_CATEGORY` (
  `CategoryID` INT NOT NULL AUTO_INCREMENT ,
  `CategoryName` VARCHAR(50) NULL ,
  PRIMARY KEY (`CategoryID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOB_SUB_CATEGORY`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`JOB_SUB_CATEGORY` (
  `SubCategoryID` INT NOT NULL AUTO_INCREMENT ,
  `SubCategoryName` VARCHAR(45) NULL ,
  `CategoryID` INT NULL ,
  PRIMARY KEY (`SubCategoryID`) ,
  INDEX `CategoryID_idx` (`CategoryID` ASC) ,
  CONSTRAINT `CategoryID`
    FOREIGN KEY (`CategoryID` )
    REFERENCES `Get-The-Job-suga`.`JOB_CATEGORY` (`CategoryID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOB_ALERT`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`JOB_ALERT` (
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
    REFERENCES `Get-The-Job-suga`.`JOB_SEEKER` (`SeekerID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOBALERT_DISTRICT`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`JOBALERT_DISTRICT` (
  `JOBALERT_ID` INT NOT NULL ,
  `DISTRICT_ID` INT NOT NULL ,
  `JOBSEEKER_ID` INT NULL ,
  PRIMARY KEY (`JOBALERT_ID`, `DISTRICT_ID`) ,
  INDEX `JobAlertID_idx` (`JOBALERT_ID` ASC) ,
  INDEX `DistrictID_idx` (`DISTRICT_ID` ASC) ,
  INDEX `JobSeekerID_idx` (`JOBSEEKER_ID` ASC) ,
  CONSTRAINT `JobAlertID`
    FOREIGN KEY (`JOBALERT_ID` )
    REFERENCES `Get-The-Job-suga`.`JOB_ALERT` (`JobAlertID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DistrictID`
    FOREIGN KEY (`DISTRICT_ID` )
    REFERENCES `Get-The-Job-suga`.`DISTRICT` (`DistrictID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `JobSeekerID`
    FOREIGN KEY (`JOBSEEKER_ID` )
    REFERENCES `Get-The-Job-suga`.`JOB_SEEKER` (`SeekerID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`EMPLOYER_TYPE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`EMPLOYER_TYPE` (
  `EMPLOYER_TYPEID` INT NOT NULL AUTO_INCREMENT ,
  `EMPLOYER_TYPE_DESCRIPTION` VARCHAR(45) NULL ,
  PRIMARY KEY (`EMPLOYER_TYPEID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`EMPLOYER_AGENT/COMPANY`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`EMPLOYER_AGENT/COMPANY` (
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
    REFERENCES `Get-The-Job-suga`.`EMPLOYER_TYPE` (`EMPLOYER_TYPEID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`SALARY_RANGE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`SALARY_RANGE` (
  `SalaryID` INT NOT NULL AUTO_INCREMENT ,
  `Salary_Range_From` VARCHAR(45) NULL ,
  `Salary_Range_To` VARCHAR(45) NULL ,
  PRIMARY KEY (`SalaryID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Get-The-Job`.`JOB_JOBSEEKER`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Get-The-Job-suga`.`JOB_JOBSEEKER` (
  `JobID` INT NOT NULL ,
  `JobSeekerID` INT NOT NULL ,
  PRIMARY KEY (`JobID`, `JobSeekerID`) ,
  INDEX `Job_JobID_idx` (`JobID` ASC) ,
  INDEX `JobSeeker_SeekerID_idx` (`JobSeekerID` ASC) ,
  CONSTRAINT `Job_JobID`
    FOREIGN KEY (`JobID` )
    REFERENCES `Get-The-Job-suga`.`JOB` (`JobID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `JobSeeker_SeekerID`
    FOREIGN KEY (`JobSeekerID` )
    REFERENCES `Get-The-Job-suga`.`JOB_SEEKER` (`SeekerID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mysql` ;

-- -----------------------------------------------------
-- Table `mysql`.`columns_priv`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`columns_priv` (
  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `User` CHAR(16) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Table_name` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Column_name` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `Column_priv` SET('Select','Insert','Update','References') NOT NULL DEFAULT '' ,
  PRIMARY KEY (`Host`, `Db`, `User`, `Table_name`, `Column_name`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Column privileges';


-- -----------------------------------------------------
-- Table `mysql`.`db`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`db` (
  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `User` CHAR(16) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Select_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Insert_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Update_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Delete_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Drop_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Grant_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `References_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Index_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Alter_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_tmp_table_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Lock_tables_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_view_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Show_view_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_routine_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Alter_routine_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Execute_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Event_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Trigger_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  PRIMARY KEY (`Host`, `Db`, `User`) ,
  INDEX `User` (`User` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Database privileges';


-- -----------------------------------------------------
-- Table `mysql`.`event`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`event` (
  `db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `name` CHAR(64) NOT NULL DEFAULT '' ,
  `body` LONGBLOB NOT NULL ,
  `definer` CHAR(77) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `execute_at` DATETIME NULL DEFAULT NULL ,
  `interval_value` INT(11) NULL DEFAULT NULL ,
  `interval_field` ENUM('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') NULL DEFAULT NULL ,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `modified` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `last_executed` DATETIME NULL DEFAULT NULL ,
  `starts` DATETIME NULL DEFAULT NULL ,
  `ends` DATETIME NULL DEFAULT NULL ,
  `status` ENUM('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED' ,
  `on_completion` ENUM('DROP','PRESERVE') NOT NULL DEFAULT 'DROP' ,
  `sql_mode` SET('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '' ,
  `comment` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `originator` INT(10) UNSIGNED NOT NULL ,
  `time_zone` CHAR(64) CHARACTER SET 'latin1' NOT NULL DEFAULT 'SYSTEM' ,
  `character_set_client` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `collation_connection` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `db_collation` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `body_utf8` LONGBLOB NULL DEFAULT NULL ,
  PRIMARY KEY (`db`, `name`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'Events';


-- -----------------------------------------------------
-- Table `mysql`.`func`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`func` (
  `name` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `ret` TINYINT(1) NOT NULL DEFAULT '0' ,
  `dl` CHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `type` ENUM('function','aggregate') CHARACTER SET 'utf8' NOT NULL ,
  PRIMARY KEY (`name`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'User defined functions';


-- -----------------------------------------------------
-- Table `mysql`.`general_log`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`general_log` (
  `event_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `user_host` MEDIUMTEXT NOT NULL ,
  `thread_id` INT(11) NOT NULL ,
  `server_id` INT(10) UNSIGNED NOT NULL ,
  `command_type` VARCHAR(64) NOT NULL ,
  `argument` MEDIUMTEXT NOT NULL )
ENGINE = CSV
DEFAULT CHARACTER SET = utf8
COMMENT = 'General log';


-- -----------------------------------------------------
-- Table `mysql`.`help_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`help_category` (
  `help_category_id` SMALLINT(5) UNSIGNED NOT NULL ,
  `name` CHAR(64) NOT NULL ,
  `parent_category_id` SMALLINT(5) UNSIGNED NULL DEFAULT NULL ,
  `url` CHAR(128) NOT NULL ,
  PRIMARY KEY (`help_category_id`) ,
  UNIQUE INDEX `name` (`name` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'help categories';


-- -----------------------------------------------------
-- Table `mysql`.`help_keyword`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`help_keyword` (
  `help_keyword_id` INT(10) UNSIGNED NOT NULL ,
  `name` CHAR(64) NOT NULL ,
  PRIMARY KEY (`help_keyword_id`) ,
  UNIQUE INDEX `name` (`name` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'help keywords';


-- -----------------------------------------------------
-- Table `mysql`.`help_relation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`help_relation` (
  `help_topic_id` INT(10) UNSIGNED NOT NULL ,
  `help_keyword_id` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`help_keyword_id`, `help_topic_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'keyword-topic relation';


-- -----------------------------------------------------
-- Table `mysql`.`help_topic`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`help_topic` (
  `help_topic_id` INT(10) UNSIGNED NOT NULL ,
  `name` CHAR(64) NOT NULL ,
  `help_category_id` SMALLINT(5) UNSIGNED NOT NULL ,
  `description` TEXT NOT NULL ,
  `example` TEXT NOT NULL ,
  `url` CHAR(128) NOT NULL ,
  PRIMARY KEY (`help_topic_id`) ,
  UNIQUE INDEX `name` (`name` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'help topics';


-- -----------------------------------------------------
-- Table `mysql`.`host`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`host` (
  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Select_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Insert_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Update_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Delete_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Drop_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Grant_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `References_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Index_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Alter_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_tmp_table_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Lock_tables_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_view_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Show_view_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_routine_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Alter_routine_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Execute_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Trigger_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  PRIMARY KEY (`Host`, `Db`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Host privileges;  Merged with database privileges';


-- -----------------------------------------------------
-- Table `mysql`.`ndb_binlog_index`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`ndb_binlog_index` (
  `Position` BIGINT(20) UNSIGNED NOT NULL ,
  `File` VARCHAR(255) NOT NULL ,
  `epoch` BIGINT(20) UNSIGNED NOT NULL ,
  `inserts` BIGINT(20) UNSIGNED NOT NULL ,
  `updates` BIGINT(20) UNSIGNED NOT NULL ,
  `deletes` BIGINT(20) UNSIGNED NOT NULL ,
  `schemaops` BIGINT(20) UNSIGNED NOT NULL ,
  PRIMARY KEY (`epoch`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mysql`.`plugin`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`plugin` (
  `name` VARCHAR(64) NOT NULL DEFAULT '' ,
  `dl` VARCHAR(128) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`name`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'MySQL plugins';


-- -----------------------------------------------------
-- Table `mysql`.`proc`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`proc` (
  `db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `name` CHAR(64) NOT NULL DEFAULT '' ,
  `type` ENUM('FUNCTION','PROCEDURE') NOT NULL ,
  `specific_name` CHAR(64) NOT NULL DEFAULT '' ,
  `language` ENUM('SQL') NOT NULL DEFAULT 'SQL' ,
  `sql_data_access` ENUM('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL' ,
  `is_deterministic` ENUM('YES','NO') NOT NULL DEFAULT 'NO' ,
  `security_type` ENUM('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER' ,
  `param_list` BLOB NOT NULL ,
  `returns` LONGBLOB NOT NULL ,
  `body` LONGBLOB NOT NULL ,
  `definer` CHAR(77) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `modified` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `sql_mode` SET('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '' ,
  `comment` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `character_set_client` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `collation_connection` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `db_collation` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `body_utf8` LONGBLOB NULL DEFAULT NULL ,
  PRIMARY KEY (`db`, `name`, `type`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stored Procedures';


-- -----------------------------------------------------
-- Table `mysql`.`procs_priv`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`procs_priv` (
  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `User` CHAR(16) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Routine_name` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '' ,
  `Routine_type` ENUM('FUNCTION','PROCEDURE') CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `Grantor` CHAR(77) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Proc_priv` SET('Execute','Alter Routine','Grant') NOT NULL DEFAULT '' ,
  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`Host`, `Db`, `User`, `Routine_name`, `Routine_type`) ,
  INDEX `Grantor` (`Grantor` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Procedure privileges';


-- -----------------------------------------------------
-- Table `mysql`.`proxies_priv`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`proxies_priv` (
  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `User` CHAR(16) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Proxied_host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Proxied_user` CHAR(16) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `With_grant` TINYINT(1) NOT NULL DEFAULT '0' ,
  `Grantor` CHAR(77) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`Host`, `User`, `Proxied_host`, `Proxied_user`) ,
  INDEX `Grantor` (`Grantor` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'User proxy privileges';


-- -----------------------------------------------------
-- Table `mysql`.`servers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`servers` (
  `Server_name` CHAR(64) NOT NULL DEFAULT '' ,
  `Host` CHAR(64) NOT NULL DEFAULT '' ,
  `Db` CHAR(64) NOT NULL DEFAULT '' ,
  `Username` CHAR(64) NOT NULL DEFAULT '' ,
  `Password` CHAR(64) NOT NULL DEFAULT '' ,
  `Port` INT(4) NOT NULL DEFAULT '0' ,
  `Socket` CHAR(64) NOT NULL DEFAULT '' ,
  `Wrapper` CHAR(64) NOT NULL DEFAULT '' ,
  `Owner` CHAR(64) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`Server_name`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'MySQL Foreign Servers table';


-- -----------------------------------------------------
-- Table `mysql`.`slow_log`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`slow_log` (
  `start_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `user_host` MEDIUMTEXT NOT NULL ,
  `query_time` TIME NOT NULL ,
  `lock_time` TIME NOT NULL ,
  `rows_sent` INT(11) NOT NULL ,
  `rows_examined` INT(11) NOT NULL ,
  `db` VARCHAR(512) NOT NULL ,
  `last_insert_id` INT(11) NOT NULL ,
  `insert_id` INT(11) NOT NULL ,
  `server_id` INT(10) UNSIGNED NOT NULL ,
  `sql_text` MEDIUMTEXT NOT NULL )
ENGINE = CSV
DEFAULT CHARACTER SET = utf8
COMMENT = 'Slow log';


-- -----------------------------------------------------
-- Table `mysql`.`tables_priv`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`tables_priv` (
  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Db` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `User` CHAR(16) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Table_name` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Grantor` CHAR(77) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `Table_priv` SET('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') NOT NULL DEFAULT '' ,
  `Column_priv` SET('Select','Insert','Update','References') NOT NULL DEFAULT '' ,
  PRIMARY KEY (`Host`, `Db`, `User`, `Table_name`) ,
  INDEX `Grantor` (`Grantor` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Table privileges';


-- -----------------------------------------------------
-- Table `mysql`.`time_zone`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`time_zone` (
  `Time_zone_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Use_leap_seconds` ENUM('Y','N') NOT NULL DEFAULT 'N' ,
  PRIMARY KEY (`Time_zone_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'Time zones';


-- -----------------------------------------------------
-- Table `mysql`.`time_zone_leap_second`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`time_zone_leap_second` (
  `Transition_time` BIGINT(20) NOT NULL ,
  `Correction` INT(11) NOT NULL ,
  PRIMARY KEY (`Transition_time`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'Leap seconds information for time zones';


-- -----------------------------------------------------
-- Table `mysql`.`time_zone_name`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`time_zone_name` (
  `Name` CHAR(64) NOT NULL ,
  `Time_zone_id` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`Name`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'Time zone names';


-- -----------------------------------------------------
-- Table `mysql`.`time_zone_transition`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`time_zone_transition` (
  `Time_zone_id` INT(10) UNSIGNED NOT NULL ,
  `Transition_time` BIGINT(20) NOT NULL ,
  `Transition_type_id` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`Time_zone_id`, `Transition_time`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'Time zone transitions';


-- -----------------------------------------------------
-- Table `mysql`.`time_zone_transition_type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`time_zone_transition_type` (
  `Time_zone_id` INT(10) UNSIGNED NOT NULL ,
  `Transition_type_id` INT(10) UNSIGNED NOT NULL ,
  `Offset` INT(11) NOT NULL DEFAULT '0' ,
  `Is_DST` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' ,
  `Abbreviation` CHAR(8) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`Time_zone_id`, `Transition_type_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'Time zone transition types';


-- -----------------------------------------------------
-- Table `mysql`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mysql`.`user` (
  `Host` CHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `User` CHAR(16) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `Password` CHAR(41) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NOT NULL DEFAULT '' ,
  `Select_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Insert_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Update_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Delete_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Drop_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Reload_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Shutdown_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Process_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `File_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Grant_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `References_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Index_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Alter_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Show_db_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Super_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_tmp_table_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Lock_tables_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Execute_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Repl_slave_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Repl_client_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_view_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Show_view_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_routine_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Alter_routine_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_user_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Event_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Trigger_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `Create_tablespace_priv` ENUM('N','Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N' ,
  `ssl_type` ENUM('','ANY','X509','SPECIFIED') CHARACTER SET 'utf8' NOT NULL DEFAULT '' ,
  `ssl_cipher` BLOB NOT NULL ,
  `x509_issuer` BLOB NOT NULL ,
  `x509_subject` BLOB NOT NULL ,
  `max_questions` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `max_updates` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `max_connections` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `max_user_connections` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `plugin` CHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT '' ,
  `authentication_string` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  PRIMARY KEY (`Host`, `User`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Users and global privileges';

USE `Get-The-Job-suga` ;
USE `mysql` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
