ALTER TABLE `get_the_job`.`login` CHANGE COLUMN `pass_word` `pass_word` VARCHAR(40) NULL ;

ALTER TABLE `get_the_job`.`login` ADD COLUMN `active` VARCHAR(32) NULL DEFAULT NULL  AFTER `active` ;

ALTER TABLE `get_the_job`.`employer_agent_company` ADD COLUMN `postal_address` VARCHAR(100) NULL DEFAULT NULL  AFTER `physical_address` ;
