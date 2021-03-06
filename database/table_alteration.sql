
ALTER TABLE login DROP PRIMARY KEY;

ALTER TABLE login ADD user_role INT(1) NOT NULL;

ALTER TABLE login ADD last_login TIMESTAMP;

ALTER TABLE login ADD login_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE job_seeker ADD login_id INT(11) NOT NULL; 
ALTER TABLE job_seeker ADD CONSTRAINT FK_login_username1 FOREIGN KEY (login_id) REFERENCES login(login_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE employer_agent_company ADD login_id INT(11) NOT NULL; 
ALTER TABLE employer_agent_company ADD CONSTRAINT FK_login_username2 FOREIGN KEY (login_id) REFERENCES login(login_id) ON UPDATE CASCADE ON DELETE CASCADE;
