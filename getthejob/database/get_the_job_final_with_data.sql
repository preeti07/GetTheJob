CREATE DATABASE  IF NOT EXISTS get_the_job;
USE get_the_job;
CREATE TABLE get_the_job.country (
	country_id int(10) NOT NULL auto_increment,
	country_name varchar(50),
	PRIMARY KEY (country_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.district (
	district_id int(10) NOT NULL auto_increment,
	district_name varchar(100) NOT NULL,
	region_id int(10),
	PRIMARY KEY (district_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.employer_agent_company (
	employer_id int(10) NOT NULL auto_increment,
	first_name varchar(50),
	last_name varchar(50),
	address varchar(100),
	company_logo varchar(30),
	mobile_phone varchar(11),
	work_phone varchar(11),
	email varchar(100),
	company_url varchar(100),
	employer_type_id int(10),
	company_name varchar(100),
	user_email varchar(100),
	login_id int(10) NOT NULL,
	PRIMARY KEY (employer_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.employer_type (
	employer_type_id int(10) NOT NULL auto_increment,
	employer_description varchar(100) NOT NULL,
	PRIMARY KEY (employer_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.experience_level (
	experience_description varchar(100) NOT NULL,
	PRIMARY KEY (experience_description)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.job (
	job_id int(10) NOT NULL auto_increment,
	job_title varchar(100),
	job_description longtext,
	work_type_id int(10),
	district_id int(10),
	subcategory_id int(10),
	salary float(8),
	start_ad_date datetime,
	end_ad_date datetime,
	experience_level varchar(100),
	employer_id int(10),
	PRIMARY KEY (job_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.job_alert (
	job_alert_id int(10) NOT NULL auto_increment,
	seeker_id int(10),
	job_alert_title varchar(100),
	category_ids varchar(45),
	area_district_ids varchar(45),
	salary_ids varchar(45),
	work_type_ids varchar(45),
	PRIMARY KEY (job_alert_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.job_category (
	category_id int(10) NOT NULL auto_increment,
	category_name varchar(100),
	PRIMARY KEY (category_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.job_seeker (
	seeker_id int(10) NOT NULL auto_increment,
	first_name varchar(50),
	last_name varchar(50),
	email_id varchar(50),
	address varchar(100),
	mobile_phone int(10),
	home_phone int(10),
	qualification text(65535),
	current_job text(65535),
	experience text(65535),
	summary_of_skills text(65535),
	salary_expectation float(8),
	visa_status varchar(100),
	linkedin_profile_url varchar(100),
	cover_letter longtext,
	availability datetime,
	is_public_resume tinyint(3),
	district_id int(10),
	login_id int(10) NOT NULL,
	PRIMARY KEY (seeker_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.job_sub_category (
	subcategory_id int(10) NOT NULL auto_increment,
	subcategory_name varchar(45),
	category_id int(10),
	PRIMARY KEY (subcategory_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.jobalert_district (
	job_alert_id int(10) NOT NULL,
	district_id int(10) NOT NULL,
	job_seeker_id int(10),
	PRIMARY KEY (job_alert_id,district_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.jobseeker_resume (
	resume_no int(10) NOT NULL auto_increment,
	seeker_id int(10),
	resume_file longtext,
	PRIMARY KEY (resume_no)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.login (
	user_name varchar(30) NOT NULL,
	pass_word varchar(10),
	user_role int(1) NOT NULL,
	last_login timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	login_id int(10) NOT NULL auto_increment,
	PRIMARY KEY (login_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.region (
	region_id int(10) NOT NULL auto_increment,
	region_name varchar(50),
	country_id int(10),
	PRIMARY KEY (region_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.salary_range (
	salary_id int(10) NOT NULL auto_increment,
	salary_range_from varchar(45),
	salary_range_to varchar(45),
	PRIMARY KEY (salary_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.seeker_appliedjobs (
	seeker_id int(10) NOT NULL,
	job_id int(10) NOT NULL,
	PRIMARY KEY (seeker_id,job_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.seeker_saved_searches (
	search_id int(10) NOT NULL,
	search_name varchar(100),
	seeker_id int(10),
	region_id int(10),
	job_category_id int(10),
	job_subcategory_id int(10),
	PRIMARY KEY (search_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.seekerjob_shortlist (
	shortlist_id int(10) NOT NULL,
	seeker_id int(10) NOT NULL,
	job_id int(10) NOT NULL,
	PRIMARY KEY (shortlist_id,seeker_id,job_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE get_the_job.work_type (
	work_type_id int(10) NOT NULL auto_increment,
	work_type varchar(100) NOT NULL,
	PRIMARY KEY (work_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO get_the_job.country(country_id, country_name) VALUES (1, 'New Zealand');
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (1, 'Far North', 9);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (2, 'Franklin', 1);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (3, 'Thames-Coromandel', 13);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (4, 'Hauraki', 13);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (5, 'Waikato', 13);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (6, 'Matamata-Piako', 13);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (7, 'Hamilton', 13);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (8, 'Waipa', 13);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (9, 'Otorohanga', 13);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (10, 'South Waikato', 13);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (11, 'Whangarei', 9);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (12, 'Waitomo', 13);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (13, 'Taupo', 13);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (14, 'Western Bay Of Plenty', 2);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (15, 'Tauranga', 2);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (16, 'Rotorua', 2);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (17, 'Whakatane', 2);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (18, 'Kawerau', 2);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (19, 'Opotiki', 2);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (20, 'Gisborne', 4);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (21, 'Wairoa', 5);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (22, 'Kaipara', 9);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (23, 'Hastings', 5);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (24, 'Napier', 5);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (25, 'Central Hawkes Bay', 5);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (26, 'New Plymouth', 12);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (27, 'Stratford', 12);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (28, 'South Taranaki', 12);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (29, 'Ruapehu', 6);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (30, 'Wanganui', 6);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (31, 'Rangitikei', 6);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (32, 'Manawatu', 6);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (33, 'Rodney', 1);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (34, 'Palmerston North', 6);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (35, 'Tararua', 6);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (36, 'Horowhenua', 6);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (37, 'Kapiti Coast', 14);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (38, 'Porirua', 14);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (39, 'Upper Hutt', 14);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (40, 'Lower Hutt', 14);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (41, 'Wellington', 14);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (42, 'Masterton', 14);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (43, 'Carterton', 14);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (44, 'North Shore City', 1);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (45, 'South Wairarapa', 14);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (46, 'Tasman', 8);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (47, 'Nelson', 8);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (48, 'Marlborough', 7);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (49, 'Kaikoura', 7);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (50, 'Buller', 15);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (51, 'Grey', 15);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (52, 'Westland', 15);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (53, 'Hurunui', 3);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (54, 'Waimakariri', 3);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (55, 'Waitakere City', 1);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (56, 'Christchurch City', 3);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (57, 'Banks Peninsula', 3);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (58, 'Selwyn', 3);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (59, 'Ashburton', 3);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (60, 'Timaru', 3);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (61, 'Mackenzie', 3);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (62, 'Waimate', 3);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (63, 'Waitaki', 10);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (64, 'Central Otago', 10);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (65, 'Auckland City', 1);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (66, 'Queenstown-Lakes', 10);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (67, 'Dunedin', 10);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (68, 'Clutha', 10);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (69, 'Southland', 11);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (70, 'Gore', 11);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (71, 'Invercargill', 11);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (72, 'Waiheke Island', 1);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (73, 'Catlins', 11);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (74, 'South Otago', 10);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (75, 'Manukau City', 1);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (76, 'Hauraki Gulf Islands', 1);
INSERT INTO get_the_job.district(district_id, district_name, region_id) VALUES (77, 'Papakura', 1);
INSERT INTO get_the_job.employer_type(employer_type_id, employer_description) VALUES (1, 'Consultant');
INSERT INTO get_the_job.employer_type(employer_type_id, employer_description) VALUES (2, 'Company');
INSERT INTO get_the_job.experience_level(experience_description) VALUES ('2to3 Years');
INSERT INTO get_the_job.experience_level(experience_description) VALUES ('3to5 Years');
INSERT INTO get_the_job.experience_level(experience_description) VALUES ('5 Year above');
INSERT INTO get_the_job.experience_level(experience_description) VALUES ('Entry');
INSERT INTO get_the_job.experience_level(experience_description) VALUES ('Executive');
INSERT INTO get_the_job.experience_level(experience_description) VALUES ('Graduate');
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (1, 'Job in Waikato', 'Job description(1) for job in Hamilton(7), Waikato(13), part-time(2),Banking, finance &amp; insurance(3), Analysts(14), salary range 80.000 - 100.000, date advertised: 14-05-2013, valid through 28-06-2013', 2, 13, 14, 90000.00, '2013-05-14 00:00:00', '2013-06-28 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (2, 'Job in Southland', 'Caregiving contract job in Invercargill, Southland, in the domain of Healthcare, salary $58000. Posted on Tue, 7th of May, 2013, valid until Thu, 6th of June, 2013', 3, 71, 66, 58000.00, '2013-05-07 00:00:00', '2013-06-06 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (3, 'Job in Canterbury', 'Warehouse & distribution volunteer job in Waimakariri, Canterbury, in the domain of Transport & logistics, salary $119000. Posted on Sun, 30th of June, 2013, valid until Tue, 30th of July, 2013', 4, 54, 58, 119000.00, '2013-06-30 00:00:00', '2013-07-30 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (4, 'Job in Nelson/Tasman', 'Other full-time job in Nelson, Nelson/Tasman, in the domain of Government & council, salary $115000. Posted on Wed, 22nd of May, 2013, valid until Fri, 21st of June, 2013', 1, 47, 64, 115000.00, '2013-05-22 00:00:00', '2013-06-21 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (5, 'Job in Otago', 'Administration full-time job in Waitaki, Otago, in the domain of Office & administration, salary $63000. Posted on Fri, 21st of June, 2013, valid until Sun, 21st of July, 2013', 1, 63, 123, 63000.00, '2013-06-21 00:00:00', '2013-07-21 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (6, 'Job in Wellington', 'Project & contracts management contract job in Upper Hutt, Wellington, in the domain of Construction & architecture, salary $75000. Posted on Sun, 5th of May, 2013, valid until Tue, 4th of June, 2013', 3, 39, 29, 75000.00, '2013-05-05 00:00:00', '2013-06-04 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (7, 'Job in Waikato', 'Architects volunteer job in Otorohanga, Waikato, in the domain of IT, salary $43000. Posted on Thu, 23rd of May, 2013, valid until Sat, 22nd of June, 2013', 4, 9, 89, 43000.00, '2013-05-23 00:00:00', '2013-06-22 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (8, 'Job in Hawkes Bay', 'Marketing assistants & coordinators contract job in Hastings, Hawkes Bay, in the domain of Marketing, media & communications, salary $144000. Posted on Fri, 7th of June, 2013, valid until Sun, 7th of July, 2013', 3, 23, 118, 144000.00, '2013-06-07 00:00:00', '2013-07-07 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (9, 'Job in Manawatu/Wanganui', 'Corporate & institutional banking part-time job in Ruapehu, Manawatu/Wanganui, in the domain of Banking, finance & insurance, salary $123000. Posted on Fri, 5th of July, 2013, valid until Sun, 4th of August, 2013', 2, 29, 17, 123000.00, '2013-07-05 00:00:00', '2013-08-04 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (10, 'Job in Wellington', 'Service desk contract job in Kapiti Coast, Wellington, in the domain of IT, salary $91000. Posted on Sat, 27th of April, 2013, valid until Mon, 27th of May, 2013', 3, 37, 92, 91000.00, '2013-04-27 00:00:00', '2013-05-27 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (11, 'Job in Canterbury', 'Data warehousing & BI full-time job in Timaru, Canterbury, in the domain of IT, salary $41000. Posted on Sun, 21st of April, 2013, valid until Tue, 21st of May, 2013', 1, 60, 184, 41000.00, '2013-04-21 00:00:00', '2013-05-21 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (12, 'Job in Waikato', 'Mechanical part-time job in Waitomo, Waikato, in the domain of Engineering, salary $111000. Posted on Tue, 9th of July, 2013, valid until Thu, 8th of August, 2013', 2, 12, 49, 111000.00, '2013-07-09 00:00:00', '2013-08-08 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (13, 'Job in Canterbury', 'Supply chain & planning full-time job in Timaru, Canterbury, in the domain of Transport & logistics, salary $73000. Posted on Wed, 22nd of May, 2013, valid until Fri, 21st of June, 2013', 1, 60, 57, 73000.00, '2013-05-22 00:00:00', '2013-06-21 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (14, 'Job in Canterbury', 'Sign writers part-time job in Mackenzie, Canterbury, in the domain of Trades & services, salary $54000. Posted on Wed, 15th of May, 2013, valid until Fri, 14th of June, 2013', 2, 61, 176, 54000.00, '2013-05-15 00:00:00', '2013-06-14 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (15, 'Job in Canterbury', 'Consultancy & valuation volunteer job in Ashburton, Canterbury, in the domain of Property, salary $83000. Posted on Sat, 22nd of June, 2013, valid until Mon, 22nd of July, 2013', 4, 59, 192, 83000.00, '2013-06-22 00:00:00', '2013-07-22 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (16, 'Job in Southland', 'Management part-time job in Invercargill, Southland, in the domain of Marketing, media & communications, salary $102000. Posted on Wed, 5th of June, 2013, valid until Fri, 5th of July, 2013', 2, 71, 120, 102000.00, '2013-06-05 00:00:00', '2013-07-05 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (17, 'Job in Otago', 'Drafting contract job in Dunedin, Otago, in the domain of Engineering, salary $200000. Posted on Tue, 16th of April, 2013, valid until Thu, 16th of May, 2013', 3, 67, 44, 200000.00, '2013-04-16 00:00:00', '2013-05-16 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (18, 'Job in Southland', 'Other part-time job in Invercargill, Southland, in the domain of Legal, salary $185000. Posted on Thu, 13th of June, 2013, valid until Sat, 13th of July, 2013', 2, 71, 105, 185000.00, '2013-06-13 00:00:00', '2013-07-13 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (19, 'Job in West Coast', 'Import & export volunteer job in Grey, West Coast, in the domain of Transport & logistics, salary $51000. Posted on Tue, 9th of July, 2013, valid until Thu, 8th of August, 2013', 4, 51, 59, 51000.00, '2013-07-09 00:00:00', '2013-08-08 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (20, 'Job in Canterbury', 'Other part-time job in Mackenzie, Canterbury, in the domain of Legal, salary $111000. Posted on Fri, 19th of April, 2013, valid until Sun, 19th of May, 2013', 2, 61, 105, 111000.00, '2013-04-19 00:00:00', '2013-05-19 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (21, 'Job in Auckland', 'Doctors & specialists part-time job in Hauraki Gulf Islands, Auckland, in the domain of Healthcare, salary $161000. Posted on Sat, 6th of July, 2013, valid until Mon, 5th of August, 2013', 2, 76, 69, 161000.00, '2013-07-06 00:00:00', '2013-08-05 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (22, 'Job in Auckland', 'Area managers full-time job in Auckland City, Auckland, in the domain of Retail, salary $70000. Posted on Fri, 24th of May, 2013, valid until Sun, 23rd of June, 2013', 1, 65, 188, 70000.00, '2013-05-24 00:00:00', '2013-06-23 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (23, 'Job in Wellington', 'Management volunteer job in South Wairarapa, Wellington, in the domain of Banking, finance & insurance, salary $98000. Posted on Sun, 9th of June, 2013, valid until Tue, 9th of July, 2013', 4, 45, 21, 98000.00, '2013-06-09 00:00:00', '2013-07-09 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (24, 'Job in Wellington', 'Occupational therapy full-time job in Upper Hutt, Wellington, in the domain of Healthcare, salary $42000. Posted on Tue, 28th of May, 2013, valid until Thu, 27th of June, 2013', 1, 39, 72, 42000.00, '2013-05-28 00:00:00', '2013-06-27 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (25, 'Job in Auckland', 'Office management full-time job in Manukau City, Auckland, in the domain of Office & administration, salary $61000. Posted on Sun, 30th of June, 2013, valid until Tue, 30th of July, 2013', 1, 75, 125, 61000.00, '2013-06-30 00:00:00', '2013-07-30 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (26, 'Job in Auckland', 'Freight forwarders part-time job in Franklin, Auckland, in the domain of Transport & logistics, salary $113000. Posted on Sun, 2nd of June, 2013, valid until Tue, 2nd of July, 2013', 2, 2, 54, 113000.00, '2013-06-02 00:00:00', '2013-07-02 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (27, 'Job in Waikato', 'Architecture contract job in Waipa, Waikato, in the domain of Construction & architecture, salary $105000. Posted on Sun, 5th of May, 2013, valid until Tue, 4th of June, 2013', 3, 8, 23, 105000.00, '2013-05-05 00:00:00', '2013-06-04 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (28, 'Job in Gisborne', 'Data warehousing & BI contract job in Gisborne, Gisborne, in the domain of IT, salary $70000. Posted on Sun, 26th of May, 2013, valid until Tue, 25th of June, 2013', 3, 20, 184, 70000.00, '2013-05-26 00:00:00', '2013-06-25 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (29, 'Job in Bay Of Plenty', 'Process & assembly full-time job in Western Bay Of Plenty, Bay Of Plenty, in the domain of Manufacturing & operations, salary $100000. Posted on Mon, 15th of April, 2013, valid until Wed, 15th of May, 2013', 1, 14, 109, 100000.00, '2013-04-15 00:00:00', '2013-05-15 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (30, 'Job in Auckland', 'Tellers & branch staff volunteer job in Rodney, Auckland, in the domain of Banking, finance & insurance, salary $80000. Posted on Sat, 11th of May, 2013, valid until Mon, 10th of June, 2013', 4, 33, 15, 80000.00, '2013-05-11 00:00:00', '2013-06-10 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (31, 'Job in Taranaki', 'Process & assembly contract job in New Plymouth, Taranaki, in the domain of Manufacturing & operations, salary $44000. Posted on Fri, 21st of June, 2013, valid until Sun, 21st of July, 2013', 3, 26, 109, 44000.00, '2013-06-21 00:00:00', '2013-07-21 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (32, 'Job in Canterbury', 'Communications & PR contract job in Mackenzie, Canterbury, in the domain of Marketing, media & communications, salary $99000. Posted on Sun, 21st of April, 2013, valid until Tue, 21st of May, 2013', 3, 61, 119, 99000.00, '2013-04-21 00:00:00', '2013-05-21 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (33, 'Job in Manawatu/Wanganui', 'Tellers & branch staff contract job in Palmerston North, Manawatu/Wanganui, in the domain of Banking, finance & insurance, salary $22000. Posted on Fri, 26th of April, 2013, valid until Sun, 26th of May, 2013', 3, 34, 15, 22000.00, '2013-04-26 00:00:00', '2013-05-26 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (34, 'Job in Wellington', 'Other volunteer job in Lower Hutt, Wellington, in the domain of HR & recruitment, salary $192000. Posted on Sun, 2nd of June, 2013, valid until Tue, 2nd of July, 2013', 4, 40, 88, 192000.00, '2013-06-02 00:00:00', '2013-07-02 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (35, 'Job in Otago', 'Project & contracts management full-time job in Queenstown-Lakes, Otago, in the domain of Construction & architecture, salary $158000. Posted on Thu, 13th of June, 2013, valid until Sat, 13th of July, 2013', 1, 66, 29, 158000.00, '2013-06-13 00:00:00', '2013-07-13 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (36, 'Job in Hawkes Bay', 'Building services full-time job in Central Hawkes Bay, Hawkes Bay, in the domain of Engineering, salary $124000. Posted on Sat, 6th of July, 2013, valid until Mon, 5th of August, 2013', 1, 25, 42, 124000.00, '2013-07-06 00:00:00', '2013-08-05 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (37, 'Job in Waikato', 'Account management contract job in Otorohanga, Waikato, in the domain of Sales, salary $26000. Posted on Thu, 23rd of May, 2013, valid until Sat, 22nd of June, 2013', 3, 9, 129, 26000.00, '2013-05-23 00:00:00', '2013-06-22 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (38, 'Job in Hawkes Bay', 'Residential sales & management full-time job in Wairoa, Hawkes Bay, in the domain of Property, salary $37000. Posted on Mon, 10th of June, 2013, valid until Wed, 10th of July, 2013', 1, 21, 194, 37000.00, '2013-06-10 00:00:00', '2013-07-10 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (39, 'Job in Canterbury', 'Insurance full-time job in Ashburton, Canterbury, in the domain of Banking, finance & insurance, salary $57000. Posted on Fri, 5th of July, 2013, valid until Sun, 4th of August, 2013', 1, 59, 20, 57000.00, '2013-07-05 00:00:00', '2013-08-04 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (40, 'Job in Wellington', 'Financial planning & investment volunteer job in Masterton, Wellington, in the domain of Banking, finance & insurance, salary $47000. Posted on Mon, 22nd of April, 2013, valid until Wed, 22nd of May, 2013', 4, 42, 19, 47000.00, '2013-04-22 00:00:00', '2013-05-22 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (41, 'Job in Waikato', 'Management full-time job in Thames-Coromandel, Waikato, in the domain of Transport & logistics, salary $39000. Posted on Mon, 10th of June, 2013, valid until Wed, 10th of July, 2013', 1, 3, 56, 39000.00, '2013-06-10 00:00:00', '2013-07-10 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (42, 'Job in Waikato', 'Technicians full-time job in Waitomo, Waikato, in the domain of Trades & services, salary $197000. Posted on Tue, 21st of May, 2013, valid until Thu, 20th of June, 2013', 1, 12, 157, 197000.00, '2013-05-21 00:00:00', '2013-06-20 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (43, 'Job in West Coast', 'Planning full-time job in Grey, West Coast, in the domain of Construction & architecture, salary $164000. Posted on Fri, 12th of July, 2013, valid until Sun, 11th of August, 2013', 1, 51, 27, 164000.00, '2013-07-12 00:00:00', '2013-08-11 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (44, 'Job in Auckland', 'Management contract job in Waitakere City, Auckland, in the domain of Banking, finance & insurance, salary $46000. Posted on Tue, 30th of April, 2013, valid until Thu, 30th of May, 2013', 3, 55, 21, 46000.00, '2013-04-30 00:00:00', '2013-05-30 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (45, 'Job in Wellington', 'Reception & front desk volunteer job in Carterton, Wellington, in the domain of Hospitality & tourism, salary $76000. Posted on Mon, 8th of July, 2013, valid until Wed, 7th of August, 2013', 4, 43, 81, 76000.00, '2013-07-08 00:00:00', '2013-08-07 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (46, 'Job in Northland', 'Service desk volunteer job in Whangarei, Northland, in the domain of IT, salary $78000. Posted on Fri, 3rd of May, 2013, valid until Sun, 2nd of June, 2013', 4, 11, 92, 78000.00, '2013-05-03 00:00:00', '2013-06-02 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (47, 'Job in Marlborough', 'Management full-time job in Marlborough, Marlborough, in the domain of IT, salary $90000. Posted on Sat, 29th of June, 2013, valid until Mon, 29th of July, 2013', 1, 48, 93, 90000.00, '2013-06-29 00:00:00', '2013-07-29 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (48, 'Job in Wellington', 'Other full-time job in Lower Hutt, Wellington, in the domain of Manufacturing & operations, salary $23000. Posted on Fri, 10th of May, 2013, valid until Sun, 9th of June, 2013', 1, 40, 113, 23000.00, '2013-05-10 00:00:00', '2013-06-09 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (49, 'Job in Wellington', 'Accounts administrators full-time job in Porirua, Wellington, in the domain of Accounting, salary $65000. Posted on Mon, 22nd of April, 2013, valid until Wed, 22nd of May, 2013', 1, 38, 4, 65000.00, '2013-04-22 00:00:00', '2013-05-22 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (50, 'Job in Canterbury', 'Corporate & institutional banking part-time job in Waimakariri, Canterbury, in the domain of Banking, finance & insurance, salary $81000. Posted on Wed, 3rd of July, 2013, valid until Fri, 2nd of August, 2013', 2, 54, 17, 81000.00, '2013-07-03 00:00:00', '2013-08-02 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (51, 'Job in Gisborne', 'Energy part-time job in Gisborne, Gisborne, in the domain of Engineering, salary $78000. Posted on Tue, 9th of July, 2013, valid until Thu, 8th of August, 2013', 2, 20, 164, 78000.00, '2013-07-09 00:00:00', '2013-08-08 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (52, 'Job in Bay Of Plenty', 'Nursing & midwifery contract job in Tauranga, Bay Of Plenty, in the domain of Healthcare, salary $153000. Posted on Sun, 14th of April, 2013, valid until Tue, 14th of May, 2013', 3, 15, 71, 153000.00, '2013-04-14 00:00:00', '2013-05-14 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (53, 'Job in Bay Of Plenty', 'Quality assurance part-time job in Whakatane, Bay Of Plenty, in the domain of Manufacturing & operations, salary $23000. Posted on Fri, 10th of May, 2013, valid until Sun, 9th of June, 2013', 2, 17, 111, 23000.00, '2013-05-10 00:00:00', '2013-06-09 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (54, 'Job in Canterbury', 'Management contract job in Mackenzie, Canterbury, in the domain of Engineering, salary $156000. Posted on Mon, 24th of June, 2013, valid until Wed, 24th of July, 2013', 3, 61, 48, 156000.00, '2013-06-24 00:00:00', '2013-07-24 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (55, 'Job in West Coast', 'HR part-time job in Grey, West Coast, in the domain of HR & recruitment, salary $100000. Posted on Sat, 11th of May, 2013, valid until Mon, 10th of June, 2013', 2, 51, 86, 100000.00, '2013-05-11 00:00:00', '2013-06-10 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (56, 'Job in Manawatu/Wanganui', 'Security contract job in Palmerston North, Manawatu/Wanganui, in the domain of Trades & services, salary $161000. Posted on Tue, 21st of May, 2013, valid until Thu, 20th of June, 2013', 3, 34, 156, 161000.00, '2013-05-21 00:00:00', '2013-06-20 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (57, 'Job in Auckland', 'Management part-time job in North Shore City, Auckland, in the domain of Accounting, salary $56000. Posted on Wed, 8th of May, 2013, valid until Fri, 7th of June, 2013', 2, 44, 6, 56000.00, '2013-05-08 00:00:00', '2013-06-07 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (58, 'Job in Southland', 'Farming volunteer job in Southland, Southland, in the domain of Agriculture, fishing & forestry, salary $162000. Posted on Thu, 20th of June, 2013, valid until Sat, 20th of July, 2013', 4, 69, 9, 162000.00, '2013-06-20 00:00:00', '2013-07-20 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (59, 'Job in Auckland', 'Other contract job in Rodney, Auckland, in the domain of Property, salary $37000. Posted on Tue, 14th of May, 2013, valid until Thu, 13th of June, 2013', 3, 33, 195, 37000.00, '2013-05-14 00:00:00', '2013-06-13 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (60, 'Job in Wellington', 'Boilermakers & welders part-time job in Upper Hutt, Wellington, in the domain of Trades & services, salary $39000. Posted on Thu, 25th of April, 2013, valid until Sat, 25th of May, 2013', 2, 39, 144, 39000.00, '2013-04-25 00:00:00', '2013-05-25 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (61, 'Job in Southland', 'Supervisors & forepersons part-time job in Southland, Southland, in the domain of Manufacturing & operations, salary $182000. Posted on Sat, 4th of May, 2013, valid until Mon, 3rd of June, 2013', 2, 69, 170, 182000.00, '2013-05-04 00:00:00', '2013-06-03 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (62, 'Job in Auckland', 'Client services part-time job in Manukau City, Auckland, in the domain of Banking, finance & insurance, salary $47000. Posted on Tue, 23rd of April, 2013, valid until Thu, 23rd of May, 2013', 2, 75, 16, 47000.00, '2013-04-23 00:00:00', '2013-05-23 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (63, 'Job in Marlborough', 'Boilermakers & welders full-time job in Kaikoura, Marlborough, in the domain of Trades & services, salary $40000. Posted on Tue, 16th of April, 2013, valid until Thu, 16th of May, 2013', 1, 49, 144, 40000.00, '2013-04-16 00:00:00', '2013-05-16 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (64, 'Job in Waikato', 'Web design full-time job in Matamata-Piako, Waikato, in the domain of IT, salary $54000. Posted on Sat, 4th of May, 2013, valid until Mon, 3rd of June, 2013', 1, 6, 100, 54000.00, '2013-05-04 00:00:00', '2013-06-03 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (65, 'Job in Auckland', 'Horticulture volunteer job in Franklin, Auckland, in the domain of Agriculture, fishing & forestry, salary $147000. Posted on Thu, 4th of July, 2013, valid until Sat, 3rd of August, 2013', 4, 2, 12, 147000.00, '2013-07-04 00:00:00', '2013-08-03 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (66, 'Job in Wellington', 'HR volunteer job in Kapiti Coast, Wellington, in the domain of HR & recruitment, salary $32000. Posted on Mon, 17th of June, 2013, valid until Wed, 17th of July, 2013', 4, 37, 86, 32000.00, '2013-06-17 00:00:00', '2013-07-17 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (67, 'Job in Southland', 'Pharmacy volunteer job in Southland, Southland, in the domain of Healthcare, salary $174000. Posted on Sat, 29th of June, 2013, valid until Mon, 29th of July, 2013', 4, 69, 73, 174000.00, '2013-06-29 00:00:00', '2013-07-29 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (68, 'Job in Manawatu/Wanganui', 'Commercial sales & leasing full-time job in Rangitikei, Manawatu/Wanganui, in the domain of Property, salary $200000. Posted on Sat, 11th of May, 2013, valid until Mon, 10th of June, 2013', 1, 31, 191, 200000.00, '2013-05-11 00:00:00', '2013-06-10 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (69, 'Job in Hawkes Bay', 'Other full-time job in Hastings, Hawkes Bay, in the domain of Agriculture, fishing & forestry, salary $149000. Posted on Tue, 28th of May, 2013, valid until Thu, 27th of June, 2013', 1, 23, 13, 149000.00, '2013-05-28 00:00:00', '2013-06-27 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (70, 'Job in Manawatu/Wanganui', 'Assistant store managers contract job in Manawatu, Manawatu/Wanganui, in the domain of Retail, salary $67000. Posted on Fri, 5th of July, 2013, valid until Sun, 4th of August, 2013', 3, 32, 140, 67000.00, '2013-07-05 00:00:00', '2013-08-04 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (71, 'Job in Northland', 'Drafting volunteer job in Kaipara, Northland, in the domain of Construction & architecture, salary $47000. Posted on Sun, 23rd of June, 2013, valid until Tue, 23rd of July, 2013', 4, 22, 24, 47000.00, '2013-06-23 00:00:00', '2013-07-23 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (72, 'Job in Bay Of Plenty', 'Service desk volunteer job in Western Bay Of Plenty, Bay Of Plenty, in the domain of IT, salary $200000. Posted on Sat, 25th of May, 2013, valid until Mon, 24th of June, 2013', 4, 14, 92, 200000.00, '2013-05-25 00:00:00', '2013-06-24 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (73, 'Job in Wellington', 'Training full-time job in South Wairarapa, Wellington, in the domain of IT, salary $113000. Posted on Wed, 19th of June, 2013, valid until Fri, 19th of July, 2013', 1, 45, 169, 113000.00, '2013-06-19 00:00:00', '2013-07-19 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (74, 'Job in Bay Of Plenty', 'Accounts payable contract job in Whakatane, Bay Of Plenty, in the domain of Accounting, salary $190000. Posted on Sun, 2nd of June, 2013, valid until Tue, 2nd of July, 2013', 3, 17, 2, 190000.00, '2013-06-02 00:00:00', '2013-07-02 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (75, 'Job in Manawatu/Wanganui', 'Retail assistants part-time job in Manawatu, Manawatu/Wanganui, in the domain of Retail, salary $84000. Posted on Wed, 8th of May, 2013, valid until Fri, 7th of June, 2013', 2, 32, 138, 84000.00, '2013-05-08 00:00:00', '2013-06-07 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (76, 'Job in Marlborough', 'Tutoring & training contract job in Kaikoura, Marlborough, in the domain of Education, salary $49000. Posted on Thu, 9th of May, 2013, valid until Sat, 8th of June, 2013', 3, 49, 163, 49000.00, '2013-05-09 00:00:00', '2013-06-08 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (77, 'Job in Bay Of Plenty', 'Au pairs & nannies volunteer job in Rotorua, Bay Of Plenty, in the domain of Education, salary $57000. Posted on Sat, 29th of June, 2013, valid until Mon, 29th of July, 2013', 4, 16, 179, 57000.00, '2013-06-29 00:00:00', '2013-07-29 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (78, 'Job in Otago', 'Quantity surveying full-time job in Clutha, Otago, in the domain of Construction & architecture, salary $169000. Posted on Tue, 9th of July, 2013, valid until Thu, 8th of August, 2013', 1, 68, 177, 169000.00, '2013-07-09 00:00:00', '2013-08-08 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (79, 'Job in Taranaki', 'Community & social services volunteer job in South Taranaki, Taranaki, in the domain of Healthcare, salary $75000. Posted on Sat, 11th of May, 2013, valid until Mon, 10th of June, 2013', 4, 28, 67, 75000.00, '2013-05-11 00:00:00', '2013-06-10 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (80, 'Job in Wellington', 'Reception & front desk full-time job in Porirua, Wellington, in the domain of Hospitality & tourism, salary $192000. Posted on Mon, 1st of July, 2013, valid until Wed, 31st of July, 2013', 1, 38, 81, 192000.00, '2013-07-01 00:00:00', '2013-07-31 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (81, 'Job in Northland', 'Primary volunteer job in Far North, Northland, in the domain of Education, salary $88000. Posted on Sat, 1st of June, 2013, valid until Mon, 1st of July, 2013', 4, 1, 38, 88000.00, '2013-06-01 00:00:00', '2013-07-01 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (82, 'Job in Otago', 'Web design part-time job in Queenstown-Lakes, Otago, in the domain of IT, salary $46000. Posted on Sun, 14th of April, 2013, valid until Tue, 14th of May, 2013', 2, 66, 100, 46000.00, '2013-04-14 00:00:00', '2013-05-14 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (83, 'Job in Canterbury', 'Cleaning part-time job in Banks Peninsula, Canterbury, in the domain of Trades & services, salary $83000. Posted on Tue, 14th of May, 2013, valid until Thu, 13th of June, 2013', 2, 57, 147, 83000.00, '2013-05-14 00:00:00', '2013-06-13 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (84, 'Job in Otago', 'Horticulture full-time job in South Otago, Otago, in the domain of Agriculture, fishing & forestry, salary $82000. Posted on Wed, 26th of June, 2013, valid until Fri, 26th of July, 2013', 1, 74, 12, 82000.00, '2013-06-26 00:00:00', '2013-07-26 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (85, 'Job in Taranaki', 'Surveying volunteer job in Stratford, Taranaki, in the domain of Construction & architecture, salary $43000. Posted on Wed, 17th of April, 2013, valid until Fri, 17th of May, 2013', 4, 27, 32, 43000.00, '2013-04-17 00:00:00', '2013-05-17 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (86, 'Job in Waikato', 'Waiting staff volunteer job in South Waikato, Waikato, in the domain of Hospitality & tourism, salary $129000. Posted on Sun, 14th of April, 2013, valid until Tue, 14th of May, 2013', 4, 10, 79, 129000.00, '2013-04-14 00:00:00', '2013-05-14 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (87, 'Job in Marlborough', 'Project & contracts management full-time job in Marlborough, Marlborough, in the domain of Construction & architecture, salary $79000. Posted on Wed, 15th of May, 2013, valid until Fri, 14th of June, 2013', 1, 48, 29, 79000.00, '2013-05-15 00:00:00', '2013-06-14 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (88, 'Job in Canterbury', 'Management full-time job in Ashburton, Canterbury, in the domain of Banking, finance & insurance, salary $166000. Posted on Fri, 3rd of May, 2013, valid until Sun, 2nd of June, 2013', 1, 59, 21, 166000.00, '2013-05-03 00:00:00', '2013-06-02 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (89, 'Job in Waikato', 'Printing full-time job in Hauraki, Waikato, in the domain of Trades & services, salary $28000. Posted on Fri, 19th of April, 2013, valid until Sun, 19th of May, 2013', 1, 4, 155, 28000.00, '2013-04-19 00:00:00', '2013-05-19 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (90, 'Job in Northland', 'Other part-time job in Whangarei, Northland, in the domain of Sales, salary $98000. Posted on Thu, 27th of June, 2013, valid until Sat, 27th of July, 2013', 2, 11, 135, 98000.00, '2013-06-27 00:00:00', '2013-07-27 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (91, 'Job in Nelson/Tasman', 'Project management full-time job in Nelson, Nelson/Tasman, in the domain of Engineering, salary $126000. Posted on Tue, 25th of June, 2013, valid until Thu, 25th of July, 2013', 1, 47, 50, 126000.00, '2013-06-25 00:00:00', '2013-07-25 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (92, 'Job in Waikato', 'Waiting staff volunteer job in Otorohanga, Waikato, in the domain of Hospitality & tourism, salary $75000. Posted on Wed, 12th of June, 2013, valid until Fri, 12th of July, 2013', 4, 9, 79, 75000.00, '2013-06-12 00:00:00', '2013-07-12 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (93, 'Job in Wellington', 'Management full-time job in Kapiti Coast, Wellington, in the domain of Manufacturing & operations, salary $61000. Posted on Wed, 26th of June, 2013, valid until Fri, 26th of July, 2013', 1, 37, 108, 61000.00, '2013-06-26 00:00:00', '2013-07-26 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (94, 'Job in Southland', 'Digital marketing contract job in Southland, Southland, in the domain of Marketing, media & communications, salary $82000. Posted on Mon, 24th of June, 2013, valid until Wed, 24th of July, 2013', 3, 69, 187, 82000.00, '2013-06-24 00:00:00', '2013-07-24 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (95, 'Job in Canterbury', 'Supply chain & planning full-time job in Waimate, Canterbury, in the domain of Transport & logistics, salary $195000. Posted on Thu, 13th of June, 2013, valid until Sat, 13th of July, 2013', 1, 62, 57, 195000.00, '2013-06-13 00:00:00', '2013-07-13 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (96, 'Job in Canterbury', 'Supply chain & planning full-time job in Selwyn, Canterbury, in the domain of Transport & logistics, salary $76000. Posted on Sun, 5th of May, 2013, valid until Tue, 4th of June, 2013', 1, 58, 57, 76000.00, '2013-05-05 00:00:00', '2013-06-04 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (97, 'Job in Manawatu/Wanganui', 'Kitchen staff part-time job in Horowhenua, Manawatu/Wanganui, in the domain of Hospitality & tourism, salary $69000. Posted on Tue, 16th of April, 2013, valid until Thu, 16th of May, 2013', 2, 36, 82, 69000.00, '2013-04-16 00:00:00', '2013-05-16 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (98, 'Job in Otago', 'Import & export contract job in Central Otago, Otago, in the domain of Transport & logistics, salary $121000. Posted on Fri, 21st of June, 2013, valid until Sun, 21st of July, 2013', 3, 64, 59, 121000.00, '2013-06-21 00:00:00', '2013-07-21 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (99, 'Job in Canterbury', 'Department managers volunteer job in Waimate, Canterbury, in the domain of Retail, salary $168000. Posted on Tue, 21st of May, 2013, valid until Thu, 20th of June, 2013', 4, 62, 190, 168000.00, '2013-05-21 00:00:00', '2013-06-20 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (100, 'Job in Otago', 'Management contract job in Dunedin, Otago, in the domain of Marketing, media & communications, salary $163000. Posted on Mon, 3rd of June, 2013, valid until Wed, 3rd of July, 2013', 3, 67, 120, 163000.00, '2013-06-03 00:00:00', '2013-07-03 00:00:00', null, null);
INSERT INTO get_the_job.job(job_id, job_title, job_description, work_type_id, district_id, subcategory_id, salary, start_ad_date, end_ad_date, experience_level, employer_id) VALUES (101, 'Job in Taranaki', 'Housekeeping part-time job in South Taranaki, Taranaki, in the domain of Hospitality & tourism, salary $67000. Posted on Sat, 6th of July, 2013, valid until Mon, 5th of August, 2013', 2, 28, 166, 67000.00, '2013-07-06 00:00:00', '2013-08-05 00:00:00', null, null);
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (1, 'Accounting');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (2, 'Agriculture, fishing &amp; forestry');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (3, 'Banking, finance &amp; insurance');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (4, 'Construction &amp; architecture');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (5, 'Customer service');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (6, 'Education');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (7, 'Engineering');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (8, 'Government &amp; council');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (9, 'Healthcare');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (10, 'Hospitality &amp; tourism');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (11, 'HR &amp; recruitment');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (12, 'IT');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (13, 'Legal');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (14, 'Manufacturing &amp; operations');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (15, 'Marketing, media &amp; communications');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (16, 'Office &amp; administration');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (17, 'Property');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (18, 'Retail');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (19, 'Sales');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (20, 'Trades &amp; services');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (21, 'Transport &amp; logistics');
INSERT INTO get_the_job.job_category(category_id, category_name) VALUES (22, 'Other');
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (1, 'Accountants', 1);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (2, 'Accounts payable', 1);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (3, 'Accounts receivable', 1);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (4, 'Accounts administrators', 1);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (5, 'Finance managers & controllers', 1);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (6, 'Management', 1);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (7, 'Payroll', 1);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (8, 'Other', 1);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (9, 'Farming', 2);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (10, 'Fishing', 2);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (11, 'Forestry', 2);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (12, 'Horticulture', 2);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (13, 'Other', 2);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (14, 'Analysts', 3);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (15, 'Tellers & branch staff', 3);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (16, 'Client services', 3);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (17, 'Corporate & institutional banking', 3);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (18, 'Credit & lending', 3);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (19, 'Financial planning & investment', 3);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (20, 'Insurance', 3);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (21, 'Management', 3);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (22, 'Other', 3);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (23, 'Architecture', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (24, 'Drafting', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (25, 'Estimation', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (26, 'Interior design', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (27, 'Planning', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (28, 'Labouring', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (29, 'Project & contracts management', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (30, 'Site management', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (31, 'Supervisors & forepersons', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (32, 'Surveying', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (33, 'Other', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (34, 'Customer-facing', 5);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (35, 'Management', 5);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (36, 'Other', 5);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (37, 'Early childhood', 6);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (38, 'Primary', 6);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (39, 'Secondary', 6);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (40, 'Tertiary', 6);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (41, 'Other', 6);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (42, 'Building services', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (43, 'Civil & structural', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (44, 'Drafting', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (45, 'Electrical', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (46, 'Environmental', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (47, 'Maintenance', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (48, 'Management', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (49, 'Mechanical', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (50, 'Project management', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (51, 'Water & waste', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (52, 'Other', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (53, 'Drivers & couriers', 21);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (54, 'Freight forwarders', 21);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (55, 'Operations', 21);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (56, 'Management', 21);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (57, 'Supply chain & planning', 21);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (58, 'Warehouse & distribution', 21);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (59, 'Import & export', 21);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (60, 'Other', 21);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (61, 'Local & regional council', 8);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (62, 'Central government', 8);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (63, 'Defence', 8);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (64, 'Other', 8);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (65, 'Administration', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (66, 'Caregiving', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (67, 'Community & social services', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (68, 'Dentistry', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (69, 'Doctors & specialists', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (70, 'Management', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (71, 'Nursing & midwifery', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (72, 'Occupational therapy', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (73, 'Pharmacy', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (74, 'Physiotherapy', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (75, 'Psychology & counselling', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (76, 'Radiography & sonography', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (77, 'Other', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (78, 'Bar staff & baristas', 10);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (79, 'Waiting staff', 10);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (80, 'Chefs', 10);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (81, 'Reception & front desk', 10);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (82, 'Kitchen staff', 10);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (83, 'Management', 10);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (84, 'Travel consultants', 10);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (85, 'Other', 10);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (86, 'HR', 11);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (87, 'Recruitment', 11);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (88, 'Other', 11);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (89, 'Architects', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (90, 'Business & systems analysts', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (91, 'Database', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (92, 'Service desk', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (93, 'Management', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (94, 'Networking & storage', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (95, 'Programming & development', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (96, 'Project management', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (97, 'Sales & pre-sales', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (98, 'Telecommunications', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (99, 'Testing', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (100, 'Web design', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (101, 'Other', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (102, 'Secretarial', 13);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (103, 'In-house counsel', 13);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (104, 'Private practice', 13);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (105, 'Other', 13);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (106, 'Fitters & machining', 14);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (107, 'Machine operation', 14);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (108, 'Management', 14);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (109, 'Process & assembly', 14);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (110, 'Purchasing & inventory', 14);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (111, 'Quality assurance', 14);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (112, 'Storepersons & warehousing', 14);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (113, 'Other', 14);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (114, 'Brand & product management', 15);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (115, 'Design', 15);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (116, 'Direct marketing', 15);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (117, 'Market research & analysis', 15);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (118, 'Marketing assistants & coordinators', 15);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (119, 'Communications & PR', 15);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (120, 'Management', 15);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (121, 'Journalism', 15);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (122, 'Other', 15);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (123, 'Administration', 16);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (124, 'Data entry', 16);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (125, 'Office management', 16);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (126, 'EA, PA & secretarial', 16);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (127, 'Reception', 16);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (128, 'Other', 16);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (129, 'Account management', 19);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (130, 'Business development manager', 19);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (131, 'Sales Managers', 19);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (132, 'Sales Reps', 19);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (133, 'Sales Support', 19);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (134, 'Telesales', 19);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (135, 'Other', 19);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (136, 'Merchandising', 18);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (137, 'Management', 18);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (138, 'Retail assistants', 18);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (139, 'Store managers', 18);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (140, 'Assistant store managers', 18);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (141, 'Other', 18);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (142, 'Automotive trades', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (143, 'Air con. & refrigeration', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (144, 'Boilermakers & welders', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (145, 'Butchers & bakers', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (146, 'Building & carpentry', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (147, 'Cleaning', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (148, 'Electrical', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (149, 'Gardening & landscaping', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (150, 'Hairdressing', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (151, 'Handy-persons', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (152, 'Labourers', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (153, 'Painting', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (154, 'Plumbing', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (155, 'Printing', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (156, 'Security', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (157, 'Technicians', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (158, 'Other', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (159, 'Risk & compliance', 3);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (160, 'Analysts', 1);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (161, 'Settlements', 3);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (162, 'Machine operators', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (163, 'Tutoring & training', 6);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (164, 'Energy', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (165, 'Industrial', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (166, 'Housekeeping', 10);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (167, 'Functional consultants', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (168, 'Security', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (169, 'Training', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (170, 'Supervisors & forepersons', 14);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (171, 'Beautician', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (172, 'Boat building', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (173, 'Flooring', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (174, 'Glaziers', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (175, 'Roofing', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (176, 'Sign writers', 20);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (177, 'Quantity surveying', 4);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (178, 'Call centre', 5);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (179, 'Au pairs & nannies', 6);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (180, 'Geotechnical', 7);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (181, 'Fitness & wellbeing', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (182, 'Veterinary', 9);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (183, 'Tourism & tour guides', 10);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (184, 'Data warehousing & BI', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (185, 'Systems engineers', 12);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (186, 'Advertising', 15);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (187, 'Digital marketing', 15);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (188, 'Area managers', 18);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (189, 'Buying', 18);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (190, 'Department managers', 18);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (191, 'Commercial sales & leasing', 17);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (192, 'Consultancy & valuation', 17);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (193, 'Facilities & commercial property management', 17);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (194, 'Residential sales & management', 17);
INSERT INTO get_the_job.job_sub_category(subcategory_id, subcategory_name, category_id) VALUES (195, 'Other', 17);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (1, 'Auckland', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (2, 'Bay Of Plenty', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (3, 'Canterbury', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (4, 'Gisborne', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (5, 'Hawkes Bay', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (6, 'Manawatu/Wanganui', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (7, 'Marlborough', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (8, 'Nelson/Tasman', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (9, 'Northland', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (10, 'Otago', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (11, 'Southland', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (12, 'Taranaki', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (13, 'Waikato', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (14, 'Wellington', 1);
INSERT INTO get_the_job.region(region_id, region_name, country_id) VALUES (15, 'West Coast', 1);
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (1, '0', '');
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (2, '30', '30');
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (3, '40', '40');
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (4, '50', '50');
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (5, '60', '60');
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (6, '70', '70');
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (7, '80', '80');
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (8, '90', '90');
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (9, '100', '100');
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (10, '120', '120');
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (11, '150', '150');
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (12, '200', '200');
INSERT INTO get_the_job.salary_range(salary_id, salary_range_from, salary_range_to) VALUES (13, 'Hourly rates', 'Hourly rates');
INSERT INTO get_the_job.work_type(work_type_id, work_type) VALUES (1, 'All Work Types');
INSERT INTO get_the_job.work_type(work_type_id, work_type) VALUES (2, 'Full Time');
INSERT INTO get_the_job.work_type(work_type_id, work_type) VALUES (3, 'Part Time');
INSERT INTO get_the_job.work_type(work_type_id, work_type) VALUES (4, 'Contract/Temp');
INSERT INTO get_the_job.work_type(work_type_id, work_type) VALUES (5, 'Casual/Vacation');
ALTER TABLE get_the_job.district
	ADD FOREIGN KEY (region_id) 
	REFERENCES region (region_id);


ALTER TABLE get_the_job.employer_agent_company
	ADD FOREIGN KEY (employer_type_id) 
	REFERENCES employer_type (employer_type_id);

ALTER TABLE get_the_job.employer_agent_company
	ADD FOREIGN KEY (login_id) 
	REFERENCES login (login_id);


ALTER TABLE get_the_job.job
	ADD FOREIGN KEY (district_id) 
	REFERENCES district (district_id);

ALTER TABLE get_the_job.job
	ADD FOREIGN KEY (work_type_id) 
	REFERENCES work_type (work_type_id);

ALTER TABLE get_the_job.job
	ADD FOREIGN KEY (employer_id) 
	REFERENCES employer_agent_company (employer_id);

ALTER TABLE get_the_job.job
	ADD FOREIGN KEY (experience_level) 
	REFERENCES experience_level (experience_description);

ALTER TABLE get_the_job.job
	ADD FOREIGN KEY (subcategory_id) 
	REFERENCES job_sub_category (subcategory_id);


ALTER TABLE get_the_job.job_alert
	ADD FOREIGN KEY (seeker_id) 
	REFERENCES job_seeker (seeker_id);


ALTER TABLE get_the_job.job_seeker
	ADD FOREIGN KEY (district_id) 
	REFERENCES district (district_id);

ALTER TABLE get_the_job.job_seeker
	ADD FOREIGN KEY (login_id) 
	REFERENCES login (login_id);


ALTER TABLE get_the_job.job_sub_category
	ADD FOREIGN KEY (category_id) 
	REFERENCES job_category (category_id);


ALTER TABLE get_the_job.jobalert_district
	ADD FOREIGN KEY (district_id) 
	REFERENCES district (district_id);

ALTER TABLE get_the_job.jobalert_district
	ADD FOREIGN KEY (job_alert_id) 
	REFERENCES job_alert (job_alert_id);

ALTER TABLE get_the_job.jobalert_district
	ADD FOREIGN KEY (job_seeker_id) 
	REFERENCES job_seeker (seeker_id);


ALTER TABLE get_the_job.jobseeker_resume
	ADD FOREIGN KEY (seeker_id) 
	REFERENCES job_seeker (seeker_id);


ALTER TABLE get_the_job.region
	ADD FOREIGN KEY (country_id) 
	REFERENCES country (country_id);


ALTER TABLE get_the_job.seeker_appliedjobs
	ADD FOREIGN KEY (job_id) 
	REFERENCES job (job_id);

ALTER TABLE get_the_job.seeker_appliedjobs
	ADD FOREIGN KEY (seeker_id) 
	REFERENCES job_seeker (seeker_id);


ALTER TABLE get_the_job.seeker_saved_searches
	ADD FOREIGN KEY (job_category_id) 
	REFERENCES job_category (category_id);

ALTER TABLE get_the_job.seeker_saved_searches
	ADD FOREIGN KEY (seeker_id) 
	REFERENCES job_seeker (seeker_id);

ALTER TABLE get_the_job.seeker_saved_searches
	ADD FOREIGN KEY (region_id) 
	REFERENCES region (region_id);

ALTER TABLE get_the_job.seeker_saved_searches
	ADD FOREIGN KEY (job_subcategory_id) 
	REFERENCES job_sub_category (subcategory_id);


ALTER TABLE get_the_job.seekerjob_shortlist
	ADD FOREIGN KEY (seeker_id) 
	REFERENCES job_seeker (seeker_id);

ALTER TABLE get_the_job.seekerjob_shortlist
	ADD FOREIGN KEY (job_id) 
	REFERENCES job (job_id);


