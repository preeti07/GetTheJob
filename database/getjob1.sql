CREATE DATABASE  IF NOT EXISTS `get-the-job` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `get-the-job`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: get-the-job
-- ------------------------------------------------------
-- Server version	5.5.31

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `CountryID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `DistrictID` int(11) NOT NULL AUTO_INCREMENT,
  `DistrictName` varchar(50) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DistrictID`),
  KEY `CityID_idx` (`RegionID`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'Far North',9),(2,'Franklin',1),(3,'Thames-Coromandel',13),(4,'Hauraki',13),(5,'Waikato',13),(6,'Matamata-Piako',13),(7,'Hamilton',13),(8,'Waipa',13),(9,'Otorohanga',13),(10,'South Waikato',13),(11,'Whangarei',9),(12,'Waitomo',13),(13,'Taupo',13),(14,'Western Bay Of Plenty',2),(15,'Tauranga',2),(16,'Rotorua',2),(17,'Whakatane',2),(18,'Kawerau',2),(19,'Opotiki',2),(20,'Gisborne',4),(21,'Wairoa',5),(22,'Kaipara',9),(23,'Hastings',5),(24,'Napier',5),(25,'Central Hawkes Bay',5),(26,'New Plymouth',12),(27,'Stratford',12),(28,'South Taranaki',12),(29,'Ruapehu',6),(30,'Wanganui',6),(31,'Rangitikei',6),(32,'Manawatu',6),(33,'Rodney',1),(34,'Palmerston North',6),(35,'Tararua',6),(36,'Horowhenua',6),(37,'Kapiti Coast',14),(38,'Porirua',14),(39,'Upper Hutt',14),(40,'Lower Hutt',14),(41,'Wellington',14),(42,'Masterton',14),(43,'Carterton',14),(44,'North Shore City',1),(45,'South Wairarapa',14),(46,'Tasman',8),(47,'Nelson',8),(48,'Marlborough',7),(49,'Kaikoura',7),(50,'Buller',15),(51,'Grey',15),(52,'Westland',15),(53,'Hurunui',3),(54,'Waimakariri',3),(55,'Waitakere City',1),(56,'Christchurch City',3),(57,'Banks Peninsula',3),(58,'Selwyn',3),(59,'Ashburton',3),(60,'Timaru',3),(61,'Mackenzie',3),(62,'Waimate',3),(63,'Waitaki',10),(64,'Central Otago',10),(65,'Auckland City',1),(66,'Queenstown-Lakes',10),(67,'Dunedin',10),(68,'Clutha',10),(69,'Southland',11),(70,'Gore',11),(71,'Invercargill',11),(72,'Waiheke Island',1),(73,'Catlins',11),(74,'South Otago',10),(75,'Manukau City',1),(76,'Hauraki Gulf Islands',1),(77,'Papakura',1);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer_agent_company`
--

DROP TABLE IF EXISTS `employer_agent_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employer_agent_company` (
  `EMPLOYER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Company_Agent_Logo` blob DEFAULT NULL,
  `MobilePhone` varchar(11) DEFAULT NULL,
  `WorkPhone` varchar(11) DEFAULT NULL,
  `EmailForApplication` varchar(50) DEFAULT NULL,
  `Company_Agent_URL` varchar(100) DEFAULT NULL,
  `EMPLOYER_TYPE_ID` int(11) DEFAULT NULL,
  `AGENT_COMPANY_NAME` varchar(50) DEFAULT NULL,
  `Username_Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYER_ID`),
  UNIQUE KEY `Username_Email_UNIQUE` (`Username_Email`),
  KEY `EmployerTypeID_idx` (`EMPLOYER_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_agent_company`
--

LOCK TABLES `employer_agent_company` WRITE;
/*!40000 ALTER TABLE `employer_agent_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `employer_agent_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer_type`
--

DROP TABLE IF EXISTS `employer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employer_type` (
  `EMPLOYER_TYPEID` int(11) NOT NULL AUTO_INCREMENT,
  `EMPLOYER_TYPE_DESCRIPTION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYER_TYPEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_type`
--

INSERT INTO `employer_type` (`EMPLOYER_TYPEID`, `EMPLOYER_TYPE_DESCRIPTION`) VALUES
(1, 'Recruitment Agency'),
(2, 'Company'),
(3, 'NZ Govt');


LOCK TABLES `employer_type` WRITE;
/*!40000 ALTER TABLE `employer_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `employer_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `job` (
  `JobID` int(11) NOT NULL AUTO_INCREMENT,
  `JobTitle` varchar(50) DEFAULT NULL,
  `JobDescription` longtext,
  `WorkTypeID` int(11) DEFAULT NULL,
  `DistrictID` int(11) DEFAULT NULL,
  `SubCategoryID` int(11) DEFAULT NULL,
  `Salary` float(8,2) DEFAULT NULL,
  `DateOfAdvertisement` datetime DEFAULT NULL,
  `EndDateOfAdvertisement` datetime DEFAULT NULL,
  `EMPLOYER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`JobID`),
  KEY `DistrictID_idx` (`DistrictID`),
  KEY `WorkTypeID_idx` (`WorkTypeID`),
  KEY `EMPLOYER_ID_idx` (`EMPLOYER_ID`),
  FULLTEXT KEY `fulltext_index` (`JobDescription`,`JobTitle`),
  FULLTEXT KEY `JobTitle` (`JobTitle`),
  FULLTEXT KEY `JobDescription` (`JobDescription`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=102 ;

--
-- Dumping data for table `job`
--




INSERT INTO `job` (`JobID`, `JobTitle`, `JobDescription`, `WorkTypeID`, `DistrictID`, `SubCategoryID`, `Salary`, `DateOfAdvertisement`, `EndDateOfAdvertisement`) VALUES
(1, 'Job in Waikato', 'Job description(1) for job in Hamilton(7), Waikato(13), part-time(2),Banking, finance &amp; insurance(3), Analysts(14), salary range 80.000 - 100.000, date advertised: 14-05-2013, valid through 28-06-2013', 2, 13, 14, 90000.00, '2013-05-14 00:00:00', '2013-06-28 00:00:00');

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_alert`
--

DROP TABLE IF EXISTS `job_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_alert` (
  `JobAlertID` int(11) NOT NULL AUTO_INCREMENT,
  `SeekerID` int(11) DEFAULT NULL,
  `JobAlertTitle` varchar(100) DEFAULT NULL,
  `CategoryIDs` varchar(45) DEFAULT NULL,
  `Area_DistrictIDs` varchar(45) DEFAULT NULL,
  `SalaryIDs` varchar(45) DEFAULT NULL,
  `WorkTypeIDs` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`JobAlertID`),
  KEY `SeekerID_idx` (`SeekerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_alert`
--

LOCK TABLES `job_alert` WRITE;
/*!40000 ALTER TABLE `job_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_category`
--

DROP TABLE IF EXISTS `job_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_category`
--

LOCK TABLES `job_category` WRITE;
/*!40000 ALTER TABLE `job_category` DISABLE KEYS */;
INSERT INTO `job_category` VALUES (1,'Accounting'),(2,'Agriculture, fishing &amp; forestry'),(3,'Banking, finance &amp; insurance'),(4,'Construction &amp; architecture'),(5,'Customer service'),(6,'Education'),(7,'Engineering'),(8,'Government &amp; council'),(9,'Healthcare'),(10,'Hospitality &amp; tourism'),(11,'HR &amp; recruitment'),(12,'IT'),(13,'Legal'),(14,'Manufacturing &amp; operations'),(15,'Marketing, media &amp; communications'),(16,'Office &amp; administration'),(17,'Property'),(18,'Retail'),(19,'Sales'),(20,'Trades &amp; services'),(21,'Transport &amp; logistics'),(22,'Other');
/*!40000 ALTER TABLE `job_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_jobseeker`
--

DROP TABLE IF EXISTS `job_jobseeker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_jobseeker` (
  `JobID` int(11) NOT NULL,
  `JobSeekerID` int(11) NOT NULL,
  PRIMARY KEY (`JobID`,`JobSeekerID`),
  KEY `Job_JobID_idx` (`JobID`),
  KEY `JobSeeker_SeekerID_idx` (`JobSeekerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_jobseeker`
--

LOCK TABLES `job_jobseeker` WRITE;
/*!40000 ALTER TABLE `job_jobseeker` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_jobseeker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_seeker`
--

DROP TABLE IF EXISTS `job_seeker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_seeker` (
  `SeekerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(25) DEFAULT NULL,
  `LastName` varchar(25) DEFAULT NULL,
  `EmailID` varchar(35) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `MobileNumber` int(11) DEFAULT NULL,
  `HomePhone` int(11) DEFAULT NULL,
  `Qualification` text,
  `CurrentJob` text,
  `Experience` text,
  `SummaryOfSkills` text,
  `SalaryExpectation` float(8,2) DEFAULT NULL,
  `VisaStatus` varchar(50) DEFAULT NULL,
  `LinkedinProfileLink` varchar(100) DEFAULT NULL,
  `CoverLetter` longtext,
  `Availability` datetime DEFAULT NULL,
  `IsPublicDownloadResume` tinyint(4) DEFAULT NULL,
  `DistrictID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SeekerID`),
  KEY `_idx` (`EmailID`),
  KEY `DistrictID_idx` (`DistrictID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_seeker`
--

LOCK TABLES `job_seeker` WRITE;
/*!40000 ALTER TABLE `job_seeker` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_seeker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_sub_category`
--

DROP TABLE IF EXISTS `job_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_sub_category` (
  `SubCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `SubCategoryName` varchar(45) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SubCategoryID`),
  KEY `CategoryID_idx` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_sub_category`
--

LOCK TABLES `job_sub_category` WRITE;
/*!40000 ALTER TABLE `job_sub_category` DISABLE KEYS */;
INSERT INTO `job_sub_category` VALUES (1,'Accountants',1),(2,'Accounts payable',1),(3,'Accounts receivable',1),(4,'Accounts administrators',1),(5,'Finance managers & controllers',1),(6,'Management',1),(7,'Payroll',1),(8,'Other',1),(9,'Farming',2),(10,'Fishing',2),(11,'Forestry',2),(12,'Horticulture',2),(13,'Other',2),(14,'Analysts',3),(15,'Tellers & branch staff',3),(16,'Client services',3),(17,'Corporate & institutional banking',3),(18,'Credit & lending',3),(19,'Financial planning & investment',3),(20,'Insurance',3),(21,'Management',3),(22,'Other',3),(23,'Architecture',4),(24,'Drafting',4),(25,'Estimation',4),(26,'Interior design',4),(27,'Planning',4),(28,'Labouring',4),(29,'Project & contracts management',4),(30,'Site management',4),(31,'Supervisors & forepersons',4),(32,'Surveying',4),(33,'Other',4),(34,'Customer-facing',5),(35,'Management',5),(36,'Other',5),(37,'Early childhood',6),(38,'Primary',6),(39,'Secondary',6),(40,'Tertiary',6),(41,'Other',6),(42,'Building services',7),(43,'Civil & structural',7),(44,'Drafting',7),(45,'Electrical',7),(46,'Environmental',7),(47,'Maintenance',7),(48,'Management',7),(49,'Mechanical',7),(50,'Project management',7),(51,'Water & waste',7),(52,'Other',7),(53,'Drivers & couriers',21),(54,'Freight forwarders',21),(55,'Operations',21),(56,'Management',21),(57,'Supply chain & planning',21),(58,'Warehouse & distribution',21),(59,'Import & export',21),(60,'Other',21),(61,'Local & regional council',8),(62,'Central government',8),(63,'Defence',8),(64,'Other',8),(65,'Administration',9),(66,'Caregiving',9),(67,'Community & social services',9),(68,'Dentistry',9),(69,'Doctors & specialists',9),(70,'Management',9),(71,'Nursing & midwifery',9),(72,'Occupational therapy',9),(73,'Pharmacy',9),(74,'Physiotherapy',9),(75,'Psychology & counselling',9),(76,'Radiography & sonography',9),(77,'Other',9),(78,'Bar staff & baristas',10),(79,'Waiting staff',10),(80,'Chefs',10),(81,'Reception & front desk',10),(82,'Kitchen staff',10),(83,'Management',10),(84,'Travel consultants',10),(85,'Other',10),(86,'HR',11),(87,'Recruitment',11),(88,'Other',11),(89,'Architects',12),(90,'Business & systems analysts',12),(91,'Database',12),(92,'Service desk',12),(93,'Management',12),(94,'Networking & storage',12),(95,'Programming & development',12),(96,'Project management',12),(97,'Sales & pre-sales',12),(98,'Telecommunications',12),(99,'Testing',12),(100,'Web design',12),(101,'Other',12),(102,'Secretarial',13),(103,'In-house counsel',13),(104,'Private practice',13),(105,'Other',13),(106,'Fitters & machining',14),(107,'Machine operation',14),(108,'Management',14),(109,'Process & assembly',14),(110,'Purchasing & inventory',14),(111,'Quality assurance',14),(112,'Storepersons & warehousing',14),(113,'Other',14),(114,'Brand & product management',15),(115,'Design',15),(116,'Direct marketing',15),(117,'Market research & analysis',15),(118,'Marketing assistants & coordinators',15),(119,'Communications & PR',15),(120,'Management',15),(121,'Journalism',15),(122,'Other',15),(123,'Administration',16),(124,'Data entry',16),(125,'Office management',16),(126,'EA, PA & secretarial',16),(127,'Reception',16),(128,'Other',16),(129,'Account management',19),(130,'Business development manager',19),(131,'Sales Managers',19),(132,'Sales Reps',19),(133,'Sales Support',19),(134,'Telesales',19),(135,'Other',19),(136,'Merchandising',18),(137,'Management',18),(138,'Retail assistants',18),(139,'Store managers',18),(140,'Assistant store managers',18),(141,'Other',18),(142,'Automotive trades',20),(143,'Air con. & refrigeration',20),(144,'Boilermakers & welders',20),(145,'Butchers & bakers',20),(146,'Building & carpentry',20),(147,'Cleaning',20),(148,'Electrical',20),(149,'Gardening & landscaping',20),(150,'Hairdressing',20),(151,'Handy-persons',20),(152,'Labourers',20),(153,'Painting',20),(154,'Plumbing',20),(155,'Printing',20),(156,'Security',20),(157,'Technicians',20),(158,'Other',20),(159,'Risk & compliance',3),(160,'Analysts',1),(161,'Settlements',3),(162,'Machine operators',4),(163,'Tutoring & training',6),(164,'Energy',7),(165,'Industrial',7),(166,'Housekeeping',10),(167,'Functional consultants',12),(168,'Security',12),(169,'Training',12),(170,'Supervisors & forepersons',14),(171,'Beautician',20),(172,'Boat building',20),(173,'Flooring',20),(174,'Glaziers',20),(175,'Roofing',20),(176,'Sign writers',20),(177,'Quantity surveying',4),(178,'Call centre',5),(179,'Au pairs & nannies',6),(180,'Geotechnical',7),(181,'Fitness & wellbeing',9),(182,'Veterinary',9),(183,'Tourism & tour guides',10),(184,'Data warehousing & BI',12),(185,'Systems engineers',12),(186,'Advertising',15),(187,'Digital marketing',15),(188,'Area managers',18),(189,'Buying',18),(190,'Department managers',18),(191,'Commercial sales & leasing',17),(192,'Consultancy & valuation',17),(193,'Facilities & commercial property management',17),(194,'Residential sales & management',17),(195,'Other',17);
/*!40000 ALTER TABLE `job_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobalert_district`
--

DROP TABLE IF EXISTS `jobalert_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobalert_district` (
  `JOBALERT_ID` int(11) NOT NULL,
  `DISTRICT_ID` int(11) NOT NULL,
  `JOBSEEKER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`JOBALERT_ID`,`DISTRICT_ID`),
  KEY `JobAlertID_idx` (`JOBALERT_ID`),
  KEY `DistrictID_idx` (`DISTRICT_ID`),
  KEY `JobSeekerID_idx` (`JOBSEEKER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobalert_district`
--

LOCK TABLES `jobalert_district` WRITE;
/*!40000 ALTER TABLE `jobalert_district` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobalert_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobseeker_resume`
--

DROP TABLE IF EXISTS `jobseeker_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobseeker_resume` (
  `ResumeNo` int(11) NOT NULL AUTO_INCREMENT,
  `SeekerID` int(11) DEFAULT NULL,
  `ResumeFile` longtext,
  PRIMARY KEY (`ResumeNo`),
  KEY `SeekerID_idx` (`SeekerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobseeker_resume`
--

LOCK TABLES `jobseeker_resume` WRITE;
/*!40000 ALTER TABLE `jobseeker_resume` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobseeker_resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `UserName` varchar(30) NOT NULL,
  `PassWord` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `RegionID` int(11) NOT NULL AUTO_INCREMENT,
  `RegionName` varchar(50) DEFAULT NULL,
  `CountryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RegionID`),
  KEY `CountryID_idx` (`CountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Auckland',1),(2,'Bay Of Plenty',1),(3,'Canterbury',1),(4,'Gisborne',1),(5,'Hawkes Bay',1),(6,'Manawatu/Wanganui',1),(7,'Marlborough',1),(8,'Nelson/Tasman',1),(9,'Northland',1),(10,'Otago',1),(11,'Southland',1),(12,'Taranaki',1),(13,'Waikato',1),(14,'Wellington',1),(15,'West Coast',1);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_range`
--

DROP TABLE IF EXISTS `salary_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_range` (
  `SalaryID` int(11) NOT NULL AUTO_INCREMENT,
  `Salary_Range_From` varchar(45) DEFAULT NULL,
  `Salary_Range_To` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SalaryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_range`
--

LOCK TABLES `salary_range` WRITE;
/*!40000 ALTER TABLE `salary_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_type`
--

DROP TABLE IF EXISTS `work_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_type` (
  `WorkTypeID` int(11) NOT NULL,
  `WorkType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`WorkTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_type`
--

INSERT INTO `work_type` (`WorkTypeID`, `WorkType`) VALUES
(1, 'Full-time'),
(2, 'Part-time'),
(3, 'Contract'),
(4, 'Volunteer');


LOCK TABLES `work_type` WRITE;
/*!40000 ALTER TABLE `work_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-26 14:14:34
