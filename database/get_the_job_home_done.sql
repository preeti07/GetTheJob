SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `get_the_job` DEFAULT CHARACTER SET latin1 ;
USE `get_the_job` ;

-- -----------------------------------------------------
-- Table `get_the_job`.`country`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`country` (
  `country_id` INT(10) NOT NULL AUTO_INCREMENT ,
  `country_name` VARCHAR(50) NULL DEFAULT NULL ,
  PRIMARY KEY (`country_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`region`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`region` (
  `region_id` INT(10) NOT NULL AUTO_INCREMENT ,
  `region_name` VARCHAR(50) NULL DEFAULT NULL ,
  `country_id` INT(10) NULL DEFAULT NULL ,
  PRIMARY KEY (`region_id`) ,
  INDEX `country_id` (`country_id` ASC) ,
  CONSTRAINT `region_ibfk_1`
    FOREIGN KEY (`country_id` )
    REFERENCES `get_the_job`.`country` (`country_id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`district`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`district` (
  `district_id` INT(10) NOT NULL AUTO_INCREMENT ,
  `district_name` VARCHAR(100) NOT NULL ,
  `region_id` INT(10) NULL DEFAULT NULL ,
  PRIMARY KEY (`district_id`) ,
  INDEX `region_id` (`region_id` ASC) ,
  CONSTRAINT `district_ibfk_1`
    FOREIGN KEY (`region_id` )
    REFERENCES `get_the_job`.`region` (`region_id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 78
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`login`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`login` (
  `user_name` VARCHAR(30) NOT NULL ,
  `pass_word` VARCHAR(40) NOT NULL ,
  `user_role` INT(10) NULL DEFAULT NULL ,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `login_id` INT(10) NOT NULL AUTO_INCREMENT ,
  `active` INT(10) NULL DEFAULT NULL ,
  PRIMARY KEY (`login_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`employer_type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`employer_type` (
  `employer_type_id` INT(10) NOT NULL AUTO_INCREMENT ,
  `employer_description` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`employer_type_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`employer_agent_company`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`employer_agent_company` (
  `employer_id` INT(10) NOT NULL ,
  `first_name` VARCHAR(50) NULL DEFAULT NULL ,
  `last_name` VARCHAR(50) NULL DEFAULT NULL ,
  `address` VARCHAR(100) NULL DEFAULT NULL ,
  `company_logo` VARCHAR(30) NULL DEFAULT NULL ,
  `mobile_phone` VARCHAR(11) NULL DEFAULT NULL ,
  `work_phone` VARCHAR(11) NULL DEFAULT NULL ,
  `email` VARCHAR(100) NULL DEFAULT NULL ,
  `company_url` VARCHAR(100) NULL DEFAULT NULL ,
  `employer_type_id` INT(10) NULL DEFAULT NULL ,
  `company_name` VARCHAR(100) NULL DEFAULT NULL ,
  `user_email` VARCHAR(100) NULL DEFAULT NULL ,
  `login_id` INT(10) NOT NULL ,
  `postal_address` VARCHAR(100) NULL DEFAULT NULL ,
  `company_number` INT(15) NULL DEFAULT NULL ,
  PRIMARY KEY (`employer_id`) ,
  INDEX `login_id` (`login_id` ASC) ,
  INDEX `employer_type_id` (`employer_type_id` ASC) ,
  CONSTRAINT `employer_agent_company_ibfk_1`
    FOREIGN KEY (`login_id` )
    REFERENCES `get_the_job`.`login` (`login_id` ),
  CONSTRAINT `employer_agent_company_ibfk_2`
    FOREIGN KEY (`employer_type_id` )
    REFERENCES `get_the_job`.`employer_type` (`employer_type_id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`experience_level`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`experience_level` (
  `experience_description` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`experience_description`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`job_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`job_category` (
  `category_id` INT(10) NOT NULL AUTO_INCREMENT ,
  `category_name` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`category_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`job_sub_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`job_sub_category` (
  `subcategory_id` INT(10) NOT NULL AUTO_INCREMENT ,
  `subcategory_name` VARCHAR(45) NULL DEFAULT NULL ,
  `category_id` INT(10) NULL DEFAULT NULL ,
  PRIMARY KEY (`subcategory_id`) ,
  INDEX `category_id` (`category_id` ASC) ,
  CONSTRAINT `job_sub_category_ibfk_1`
    FOREIGN KEY (`category_id` )
    REFERENCES `get_the_job`.`job_category` (`category_id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 196
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`work_type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`work_type` (
  `work_type_id` INT(10) NOT NULL AUTO_INCREMENT ,
  `work_type` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`work_type_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`job`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`job` (
  `job_id` INT(10) NOT NULL AUTO_INCREMENT ,
  `job_title` VARCHAR(100) NULL DEFAULT NULL ,
  `job_description` LONGTEXT NULL DEFAULT NULL ,
  `work_type_id` INT(10) NULL DEFAULT NULL ,
  `district_id` INT(10) NULL DEFAULT NULL ,
  `subcategory_id` INT(10) NULL DEFAULT NULL ,
  `start_ad_date` DATETIME NULL DEFAULT NULL ,
  `end_ad_date` DATETIME NULL DEFAULT NULL ,
  `experience_level` VARCHAR(100) NULL DEFAULT NULL ,
  `employer_id` INT(10) NULL DEFAULT NULL ,
  `max_sal` INT(10) NULL DEFAULT NULL ,
  `min_sal` INT(10) NULL DEFAULT NULL ,
  `company_name` VARCHAR(100) NULL DEFAULT NULL ,
  `Number_Of_Hits` INT(11) NOT NULL DEFAULT '0' ,
  `Is_Volunteer` ENUM('0','1') NULL DEFAULT '0' ,
  PRIMARY KEY (`job_id`) ,
  INDEX `subcategory_id` (`subcategory_id` ASC) ,
  INDEX `experience_level` (`experience_level` ASC) ,
  INDEX `employer_id` (`employer_id` ASC) ,
  INDEX `district_id` (`district_id` ASC) ,
  INDEX `work_type_id` (`work_type_id` ASC) ,
  CONSTRAINT `job_ibfk_1`
    FOREIGN KEY (`subcategory_id` )
    REFERENCES `get_the_job`.`job_sub_category` (`subcategory_id` ),
  CONSTRAINT `job_ibfk_2`
    FOREIGN KEY (`experience_level` )
    REFERENCES `get_the_job`.`experience_level` (`experience_description` ),
  CONSTRAINT `job_ibfk_3`
    FOREIGN KEY (`employer_id` )
    REFERENCES `get_the_job`.`employer_agent_company` (`employer_id` ),
  CONSTRAINT `job_ibfk_4`
    FOREIGN KEY (`district_id` )
    REFERENCES `get_the_job`.`district` (`district_id` ),
  CONSTRAINT `job_ibfk_5`
    FOREIGN KEY (`work_type_id` )
    REFERENCES `get_the_job`.`work_type` (`work_type_id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 102
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`job_seeker`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`job_seeker` (
  `seeker_id` INT(10) NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(50) NULL DEFAULT NULL ,
  `last_name` VARCHAR(50) NULL DEFAULT NULL ,
  `email_id` VARCHAR(50) NULL DEFAULT NULL ,
  `address` VARCHAR(100) NULL DEFAULT NULL ,
  `mobile_phone` INT(10) NULL DEFAULT NULL ,
  `home_phone` INT(10) NULL DEFAULT NULL ,
  `qualification` TEXT NULL DEFAULT NULL ,
  `current_job` TEXT NULL DEFAULT NULL ,
  `experience` TEXT NULL DEFAULT NULL ,
  `summary_of_skills` TEXT NULL DEFAULT NULL ,
  `visa_status` VARCHAR(100) NULL DEFAULT NULL ,
  `linkedin_profile_url` VARCHAR(100) NULL DEFAULT NULL ,
  `cover_letter` LONGTEXT NULL DEFAULT NULL ,
  `availability` DATETIME NULL DEFAULT NULL ,
  `is_public_resume` TINYINT(3) NULL DEFAULT NULL ,
  `district_id` INT(10) NULL DEFAULT NULL ,
  `login_id` INT(10) NULL DEFAULT NULL ,
  PRIMARY KEY (`seeker_id`) ,
  INDEX `district_id` (`district_id` ASC) ,
  INDEX `job_seeker_ibfk_1` (`login_id` ASC) ,
  CONSTRAINT `job_seeker_ibfk_1`
    FOREIGN KEY (`login_id` )
    REFERENCES `get_the_job`.`login` (`login_id` ),
  CONSTRAINT `job_seeker_ibfk_2`
    FOREIGN KEY (`district_id` )
    REFERENCES `get_the_job`.`district` (`district_id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 219
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`job_alert`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`job_alert` (
  `job_alert_id` INT(10) NOT NULL AUTO_INCREMENT ,
  `seeker_id` INT(10) NULL DEFAULT NULL ,
  `job_alert_title` VARCHAR(100) NULL DEFAULT NULL ,
  `job_alert_keywords` VARCHAR(45) NULL DEFAULT NULL ,
  `category_ids` VARCHAR(45) NULL DEFAULT NULL ,
  `area_district_ids` VARCHAR(45) NULL DEFAULT NULL ,
  `salary_ids` VARCHAR(45) NULL DEFAULT NULL ,
  `work_type_ids` VARCHAR(45) NULL DEFAULT NULL ,
  `is_received` ENUM('0','1') NOT NULL ,
  PRIMARY KEY (`job_alert_id`) ,
  INDEX `seeker_id` (`seeker_id` ASC) ,
  CONSTRAINT `job_alert_ibfk_1`
    FOREIGN KEY (`seeker_id` )
    REFERENCES `get_the_job`.`job_seeker` (`seeker_id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 200
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`jobalert_district`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`jobalert_district` (
  `job_alert_id` INT(10) NOT NULL ,
  `district_id` INT(10) NOT NULL ,
  `job_seeker_id` INT(10) NULL DEFAULT NULL ,
  PRIMARY KEY (`job_alert_id`, `district_id`) ,
  INDEX `job_seeker_id` (`job_seeker_id` ASC) ,
  INDEX `district_id` (`district_id` ASC) ,
  CONSTRAINT `jobalert_district_ibfk_1`
    FOREIGN KEY (`job_seeker_id` )
    REFERENCES `get_the_job`.`job_seeker` (`seeker_id` ),
  CONSTRAINT `jobalert_district_ibfk_2`
    FOREIGN KEY (`district_id` )
    REFERENCES `get_the_job`.`district` (`district_id` ),
  CONSTRAINT `jobalert_district_ibfk_3`
    FOREIGN KEY (`job_alert_id` )
    REFERENCES `get_the_job`.`job_alert` (`job_alert_id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`jobseeker_resume`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`jobseeker_resume` (
  `resume_no` INT(10) NOT NULL AUTO_INCREMENT ,
  `seeker_id` INT(10) NULL DEFAULT NULL ,
  `resume_file` LONGTEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`resume_no`) ,
  INDEX `seeker_id` (`seeker_id` ASC) ,
  CONSTRAINT `jobseeker_resume_ibfk_1`
    FOREIGN KEY (`seeker_id` )
    REFERENCES `get_the_job`.`job_seeker` (`seeker_id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`seeker_appliedjobs`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`seeker_appliedjobs` (
  `seeker_id` INT(10) NOT NULL ,
  `job_id` INT(10) NOT NULL ,
  PRIMARY KEY (`seeker_id`, `job_id`) ,
  INDEX `job_id` (`job_id` ASC) ,
  CONSTRAINT `seeker_appliedjobs_ibfk_1`
    FOREIGN KEY (`seeker_id` )
    REFERENCES `get_the_job`.`job_seeker` (`seeker_id` ),
  CONSTRAINT `seeker_appliedjobs_ibfk_2`
    FOREIGN KEY (`job_id` )
    REFERENCES `get_the_job`.`job` (`job_id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`seeker_saved_searches`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`seeker_saved_searches` (
  `search_id` INT(10) NOT NULL ,
  `search_name` VARCHAR(100) NULL DEFAULT NULL ,
  `seeker_id` INT(10) NULL DEFAULT NULL ,
  `region_id` INT(10) NULL DEFAULT NULL ,
  `job_category_id` INT(10) NULL DEFAULT NULL ,
  `job_subcategory_id` INT(10) NULL DEFAULT NULL ,
  PRIMARY KEY (`search_id`) ,
  INDEX `seeker_id` (`seeker_id` ASC) ,
  INDEX `region_id` (`region_id` ASC) ,
  INDEX `job_subcategory_id` (`job_subcategory_id` ASC) ,
  INDEX `job_category_id` (`job_category_id` ASC) ,
  CONSTRAINT `seeker_saved_searches_ibfk_1`
    FOREIGN KEY (`seeker_id` )
    REFERENCES `get_the_job`.`job_seeker` (`seeker_id` ),
  CONSTRAINT `seeker_saved_searches_ibfk_2`
    FOREIGN KEY (`region_id` )
    REFERENCES `get_the_job`.`region` (`region_id` ),
  CONSTRAINT `seeker_saved_searches_ibfk_3`
    FOREIGN KEY (`job_subcategory_id` )
    REFERENCES `get_the_job`.`job_sub_category` (`subcategory_id` ),
  CONSTRAINT `seeker_saved_searches_ibfk_4`
    FOREIGN KEY (`job_category_id` )
    REFERENCES `get_the_job`.`job_category` (`category_id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `get_the_job`.`seekerjob_shortlist`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `get_the_job`.`seekerjob_shortlist` (
  `shortlist_id` INT(10) NOT NULL ,
  `seeker_id` INT(10) NOT NULL ,
  `job_id` INT(10) NOT NULL ,
  PRIMARY KEY (`shortlist_id`, `seeker_id`, `job_id`) ,
  INDEX `seeker_id` (`seeker_id` ASC) ,
  INDEX `job_id` (`job_id` ASC) ,
  CONSTRAINT `seekerjob_shortlist_ibfk_1`
    FOREIGN KEY (`seeker_id` )
    REFERENCES `get_the_job`.`job_seeker` (`seeker_id` ),
  CONSTRAINT `seekerjob_shortlist_ibfk_2`
    FOREIGN KEY (`job_id` )
    REFERENCES `get_the_job`.`job` (`job_id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

USE `get_the_job` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
