ALTER TABLE `get_the_job`.`job` ADD COLUMN `company_name` VARCHAR(100) NULL DEFAULT NULL ;


<!-- for making login id field in jobseeker table null by default -->

ALTER TABLE `get_the_job`.`job_seeker` DROP FOREIGN KEY `job_seeker_ibfk_1` ;
ALTER TABLE `get_the_job`.`job_seeker` CHANGE COLUMN `login_id` `login_id` INT(10) NULL DEFAULT NULL  , 
  ADD CONSTRAINT `job_seeker_ibfk_1`
  FOREIGN KEY (`login_id` )
  REFERENCES `get_the_job`.`login` (`login_id` );

<!-- added a column in job_alert table -->
ALTER TABLE `get_the_job`.`job_alert` ADD COLUMN `is_received` ENUM('0','1') NOT NULL  AFTER `work_type_ids` ;