CREATE DATABASE  IF NOT EXISTS `get_the_job` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `get_the_job`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: get_the_job
-- ------------------------------------------------------
-- Server version	5.5.22

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
  `country_id` int(10) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'New Zealand');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `district_id` int(10) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(100) NOT NULL,
  `region_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`district_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `district_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
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
  `employer_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `company_logo` varchar(30) DEFAULT NULL,
  `mobile_phone` varchar(11) DEFAULT NULL,
  `work_phone` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `company_url` varchar(100) DEFAULT NULL,
  `employer_type_id` int(10) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `login_id` int(10) NOT NULL,
  `postal_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`employer_id`),
  KEY `login_id` (`login_id`),
  KEY `employer_type_id` (`employer_type_id`),
  CONSTRAINT `employer_agent_company_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`),
  CONSTRAINT `employer_agent_company_ibfk_2` FOREIGN KEY (`employer_type_id`) REFERENCES `employer_type` (`employer_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_agent_company`
--

LOCK TABLES `employer_agent_company` WRITE;
/*!40000 ALTER TABLE `employer_agent_company` DISABLE KEYS */;
INSERT INTO `employer_agent_company` VALUES (1,NULL,NULL,'bhbhjb','slide02.png','0220788366','045678899','hjghg@bghj.gfvh','hbhj',1,'uy7868','gjhgj',1,'vgghvgh'),(2,NULL,NULL,'hhhhjj','slide02.png','0220788366','045678987','pppp@pp.ppp','ghjgj',1,'hjgg','ppppp',2,'jhygy'),(3,NULL,NULL,'hgfhygvf','','0220788366','047766558','llll@lll.llll','hghh',1,'phjh76876','lllll',3,'vghvh'),(4,NULL,NULL,'gfhh','','0220788366','048776655','jjhhh@gf.vgh','Asset Management',2,'ft566ygfv','hhhhh',4,'hgjhgj'),(5,NULL,NULL,'vghv','','0220788366','045677889','lll@jhj.jhbgh','vgvg',1,'hbyu67','hghg',5,'bhbhj'),(6,NULL,NULL,'hghvh','logo123.png','0220788366','048776655','vhv@hjy.ghvfh','vghvgh',1,'hjgyu76','hghh',6,'vhg'),(7,NULL,NULL,'hjbjb','','0220788366','040788369','llll@hjh.jhgj','ghjg',1,'ji8u8797j','llllll',7,'bghghj'),(8,NULL,NULL,'hjhjbnj','','0220788366','067890876','kkkk@kkkk.lll','ljkjklj',1,'lkjuik','kkkkk',8,'hbhjb'),(9,NULL,NULL,'jgyug','','0220788366','048776655','bhjbg@hhj.bjhbgj','hghj',1,'hghju','hjhbhj',9,'gygyhu'),(10,NULL,NULL,'bjhbjh','','0224566778','045678765','bjh@jnk.jhbhj','jhbjjhkj.bj',1,'','hbhjbgj',10,'bjhbj'),(11,NULL,NULL,'hbvhbhj','slide04.png','0220788356','045896754','gh@hbj.hbj.hgj','vghgv',1,'ngh6565','hghjghj',11,'gfhhh'),(12,NULL,NULL,'gvhh','slide02.png','0224567654','045678765','vgf@hy.hyu','dfgdfg',2,'t76t7','gvgfcgjbn',12,'fhgfvh'),(13,NULL,NULL,'fhfghfh','','0224566778','045678765','ghfh@khj.bgh','hghjgj',1,'nhghj','jgjyu',13,'hghh');
/*!40000 ALTER TABLE `employer_agent_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer_type`
--

DROP TABLE IF EXISTS `employer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employer_type` (
  `employer_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `employer_description` varchar(100) NOT NULL,
  PRIMARY KEY (`employer_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_type`
--

LOCK TABLES `employer_type` WRITE;
/*!40000 ALTER TABLE `employer_type` DISABLE KEYS */;
INSERT INTO `employer_type` VALUES (1,'Consultant'),(2,'Company');
/*!40000 ALTER TABLE `employer_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience_level`
--

DROP TABLE IF EXISTS `experience_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience_level` (
  `experience_description` varchar(100) NOT NULL,
  PRIMARY KEY (`experience_description`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience_level`
--

LOCK TABLES `experience_level` WRITE;
/*!40000 ALTER TABLE `experience_level` DISABLE KEYS */;
INSERT INTO `experience_level` VALUES ('2to3 Years'),('3to5 Years'),('5 Year above'),('Entry'),('Executive'),('Graduate');
/*!40000 ALTER TABLE `experience_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_id` int(10) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(100) DEFAULT NULL,
  `job_description` longtext,
  `work_type_id` int(10) DEFAULT NULL,
  `district_id` int(10) DEFAULT NULL,
  `subcategory_id` int(10) DEFAULT NULL,
  `start_ad_date` datetime DEFAULT NULL,
  `end_ad_date` datetime DEFAULT NULL,
  `experience_level` varchar(100) DEFAULT NULL,
  `employer_id` int(10) DEFAULT NULL,
  `max_sal` int(10) DEFAULT NULL,
  `min_sal` int(10) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `subcategory_id` (`subcategory_id`),
  KEY `experience_level` (`experience_level`),
  KEY `employer_id` (`employer_id`),
  KEY `district_id` (`district_id`),
  KEY `work_type_id` (`work_type_id`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `job_sub_category` (`subcategory_id`),
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`experience_level`) REFERENCES `experience_level` (`experience_description`),
  CONSTRAINT `job_ibfk_3` FOREIGN KEY (`employer_id`) REFERENCES `employer_agent_company` (`employer_id`),
  CONSTRAINT `job_ibfk_4` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`),
  CONSTRAINT `job_ibfk_5` FOREIGN KEY (`work_type_id`) REFERENCES `work_type` (`work_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Job in Waikato','Job description(1) for job in Hamilton(7), Waikato(13), part-time(2),Banking, finance &amp; insurance(3), Analysts(14), salary range 80.000 - 100.000, date advertised: 14-05-2013, valid through 28-06-2013',2,13,14,'2013-05-14 00:00:00','2013-11-28 00:00:00',NULL,2,90000,50000,'Comapny ABC'),(2,'Job in Southland','Caregiving contract job in Invercargill, Southland, in the domain of Healthcare, salary $58000. Posted on Tue, 7th of May, 2013, valid until Thu, 6th of June, 2013',3,71,66,'2013-05-07 00:00:00','2013-11-13 00:00:00',NULL,2,90000,50000,'Comapny ABC'),(3,'Job in Canterbury','Warehouse & distribution volunteer job in Waimakariri, Canterbury, in the domain of Transport & logistics, salary $119000. Posted on Sun, 30th of June, 2013, valid until Tue, 30th of July, 2013',4,54,58,'2013-06-30 00:00:00','2013-11-30 00:00:00',NULL,2,90000,50000,'Comapny CDA'),(4,'Job in Nelson/Tasman','Other full-time job in Nelson, Nelson/Tasman, in the domain of Government & council, salary $115000. Posted on Wed, 22nd of May, 2013, valid until Fri, 21st of June, 2013',1,47,64,'2013-05-22 00:00:00','2013-11-21 00:00:00',NULL,2,90000,50000,'Comapny DBC'),(5,'Job in Otago','Administration full-time job in Waitaki, Otago, in the domain of Office & administration, salary $63000. Posted on Fri, 21st of June, 2013, valid until Sun, 21st of July, 2013',1,63,123,'2013-06-21 00:00:00','2013-12-21 00:00:00',NULL,2,90000,50000,'Self'),(6,'Job in Wellington','Project & contracts management contract job in Upper Hutt, Wellington, in the domain of Construction & architecture, salary $75000. Posted on Sun, 5th of May, 2013, valid until Tue, 4th of June, 2013',3,39,29,'2013-05-05 00:00:00','2013-12-04 00:00:00',NULL,2,90000,50000,'Self'),(7,'Job in Waikato','Architects volunteer job in Otorohanga, Waikato, in the domain of IT, salary $43000. Posted on Thu, 23rd of May, 2013, valid until Sat, 22nd of June, 2013',4,9,89,'2013-05-23 00:00:00','2013-11-22 00:00:00',NULL,2,90000,50000,'Self'),(8,'Job in Hawkes Bay','Marketing assistants & coordinators contract job in Hastings, Hawkes Bay, in the domain of Marketing, media & communications, salary $144000. Posted on Fri, 7th of June, 2013, valid until Sun, 7th of July, 2013',3,23,118,'2013-06-07 00:00:00','2013-12-07 00:00:00',NULL,2,90000,50000,'Comapny CDA'),(9,'Job in Manawatu/Wanganui','Corporate & institutional banking part-time job in Ruapehu, Manawatu/Wanganui, in the domain of Banking, finance & insurance, salary $123000. Posted on Fri, 5th of July, 2013, valid until Sun, 4th of August, 2013',2,29,17,'2013-07-05 00:00:00','2013-08-04 00:00:00',NULL,NULL,90000,50000,'Comapny DBC'),(10,'Job in Wellington','Service desk contract job in Kapiti Coast, Wellington, in the domain of IT, salary $91000. Posted on Sat, 27th of April, 2013, valid until Mon, 27th of May, 2013',3,37,92,'2013-04-27 00:00:00','2013-05-27 00:00:00',NULL,NULL,90000,50000,NULL),(11,'Job in Canterbury','Data warehousing & BI full-time job in Timaru, Canterbury, in the domain of IT, salary $41000. Posted on Sun, 21st of April, 2013, valid until Tue, 21st of May, 2013',1,60,184,'2013-04-21 00:00:00','2013-05-21 00:00:00',NULL,NULL,90000,50000,NULL),(12,'Job in Waikato','Mechanical part-time job in Waitomo, Waikato, in the domain of Engineering, salary $111000. Posted on Tue, 9th of July, 2013, valid until Thu, 8th of August, 2013',2,12,49,'2013-07-09 00:00:00','2013-08-08 00:00:00',NULL,NULL,90000,50000,NULL),(13,'Job in Canterbury','Supply chain & planning full-time job in Timaru, Canterbury, in the domain of Transport & logistics, salary $73000. Posted on Wed, 22nd of May, 2013, valid until Fri, 21st of June, 2013',1,60,57,'2013-05-22 00:00:00','2013-06-21 00:00:00',NULL,NULL,90000,50000,NULL),(14,'Job in Canterbury','Sign writers part-time job in Mackenzie, Canterbury, in the domain of Trades & services, salary $54000. Posted on Wed, 15th of May, 2013, valid until Fri, 14th of June, 2013',2,61,176,'2013-05-15 00:00:00','2013-06-14 00:00:00',NULL,NULL,90000,50000,NULL),(15,'Job in Canterbury','Consultancy & valuation volunteer job in Ashburton, Canterbury, in the domain of Property, salary $83000. Posted on Sat, 22nd of June, 2013, valid until Mon, 22nd of July, 2013',4,59,192,'2013-06-22 00:00:00','2013-07-22 00:00:00',NULL,NULL,90000,50000,NULL),(16,'Job in Southland','Management part-time job in Invercargill, Southland, in the domain of Marketing, media & communications, salary $102000. Posted on Wed, 5th of June, 2013, valid until Fri, 5th of July, 2013',2,71,120,'2013-06-05 00:00:00','2013-07-05 00:00:00',NULL,NULL,90000,50000,NULL),(17,'Job in Otago','Drafting contract job in Dunedin, Otago, in the domain of Engineering, salary $200000. Posted on Tue, 16th of April, 2013, valid until Thu, 16th of May, 2013',3,67,44,'2013-04-16 00:00:00','2013-05-16 00:00:00',NULL,NULL,90000,50000,NULL),(18,'Job in Southland','Other part-time job in Invercargill, Southland, in the domain of Legal, salary $185000. Posted on Thu, 13th of June, 2013, valid until Sat, 13th of July, 2013',2,71,105,'2013-06-13 00:00:00','2013-07-13 00:00:00',NULL,NULL,90000,50000,NULL),(19,'Job in West Coast','Import & export volunteer job in Grey, West Coast, in the domain of Transport & logistics, salary $51000. Posted on Tue, 9th of July, 2013, valid until Thu, 8th of August, 2013',4,51,59,'2013-07-09 00:00:00','2013-08-08 00:00:00',NULL,NULL,90000,50000,NULL),(20,'Job in Canterbury','Other part-time job in Mackenzie, Canterbury, in the domain of Legal, salary $111000. Posted on Fri, 19th of April, 2013, valid until Sun, 19th of May, 2013',2,61,105,'2013-04-19 00:00:00','2013-05-19 00:00:00',NULL,NULL,90000,50000,NULL),(21,'Job in Auckland','Doctors & specialists part-time job in Hauraki Gulf Islands, Auckland, in the domain of Healthcare, salary $161000. Posted on Sat, 6th of July, 2013, valid until Mon, 5th of August, 2013',2,76,69,'2013-07-06 00:00:00','2013-08-05 00:00:00',NULL,NULL,90000,50000,NULL),(22,'Job in Auckland','Area managers full-time job in Auckland City, Auckland, in the domain of Retail, salary $70000. Posted on Fri, 24th of May, 2013, valid until Sun, 23rd of June, 2013',1,65,188,'2013-05-24 00:00:00','2013-06-23 00:00:00',NULL,NULL,90000,50000,NULL),(23,'Job in Wellington','Management volunteer job in South Wairarapa, Wellington, in the domain of Banking, finance & insurance, salary $98000. Posted on Sun, 9th of June, 2013, valid until Tue, 9th of July, 2013',4,45,21,'2013-06-09 00:00:00','2013-07-09 00:00:00',NULL,NULL,90000,50000,NULL),(24,'Job in Wellington','Occupational therapy full-time job in Upper Hutt, Wellington, in the domain of Healthcare, salary $42000. Posted on Tue, 28th of May, 2013, valid until Thu, 27th of June, 2013',1,39,72,'2013-05-28 00:00:00','2013-06-27 00:00:00',NULL,NULL,90000,50000,NULL),(25,'Job in Auckland','Office management full-time job in Manukau City, Auckland, in the domain of Office & administration, salary $61000. Posted on Sun, 30th of June, 2013, valid until Tue, 30th of July, 2013',1,75,125,'2013-06-30 00:00:00','2013-07-30 00:00:00',NULL,NULL,90000,50000,NULL),(26,'Job in Auckland','Freight forwarders part-time job in Franklin, Auckland, in the domain of Transport & logistics, salary $113000. Posted on Sun, 2nd of June, 2013, valid until Tue, 2nd of July, 2013',2,2,54,'2013-06-02 00:00:00','2013-07-02 00:00:00',NULL,NULL,90000,50000,NULL),(27,'Job in Waikato','Architecture contract job in Waipa, Waikato, in the domain of Construction & architecture, salary $105000. Posted on Sun, 5th of May, 2013, valid until Tue, 4th of June, 2013',3,8,23,'2013-05-05 00:00:00','2013-06-04 00:00:00',NULL,NULL,90000,50000,NULL),(28,'Job in Gisborne','Data warehousing & BI contract job in Gisborne, Gisborne, in the domain of IT, salary $70000. Posted on Sun, 26th of May, 2013, valid until Tue, 25th of June, 2013',3,20,184,'2013-05-26 00:00:00','2013-06-25 00:00:00',NULL,NULL,90000,50000,NULL),(29,'Job in Bay Of Plenty','Process & assembly full-time job in Western Bay Of Plenty, Bay Of Plenty, in the domain of Manufacturing & operations, salary $100000. Posted on Mon, 15th of April, 2013, valid until Wed, 15th of May, 2013',1,14,109,'2013-04-15 00:00:00','2013-05-15 00:00:00',NULL,NULL,90000,50000,NULL),(30,'Job in Auckland','Tellers & branch staff volunteer job in Rodney, Auckland, in the domain of Banking, finance & insurance, salary $80000. Posted on Sat, 11th of May, 2013, valid until Mon, 10th of June, 2013',4,33,15,'2013-05-11 00:00:00','2013-06-10 00:00:00',NULL,NULL,90000,50000,NULL),(31,'Job in Taranaki','Process & assembly contract job in New Plymouth, Taranaki, in the domain of Manufacturing & operations, salary $44000. Posted on Fri, 21st of June, 2013, valid until Sun, 21st of July, 2013',3,26,109,'2013-06-21 00:00:00','2013-07-21 00:00:00',NULL,NULL,90000,50000,NULL),(32,'Job in Canterbury','Communications & PR contract job in Mackenzie, Canterbury, in the domain of Marketing, media & communications, salary $99000. Posted on Sun, 21st of April, 2013, valid until Tue, 21st of May, 2013',3,61,119,'2013-04-21 00:00:00','2013-05-21 00:00:00',NULL,NULL,90000,50000,NULL),(33,'Job in Manawatu/Wanganui','Tellers & branch staff contract job in Palmerston North, Manawatu/Wanganui, in the domain of Banking, finance & insurance, salary $22000. Posted on Fri, 26th of April, 2013, valid until Sun, 26th of May, 2013',3,34,15,'2013-04-26 00:00:00','2013-05-26 00:00:00',NULL,NULL,90000,50000,NULL),(34,'Job in Wellington','Other volunteer job in Lower Hutt, Wellington, in the domain of HR & recruitment, salary $192000. Posted on Sun, 2nd of June, 2013, valid until Tue, 2nd of July, 2013',4,40,88,'2013-06-02 00:00:00','2013-07-02 00:00:00',NULL,NULL,90000,50000,NULL),(35,'Job in Otago','Project & contracts management full-time job in Queenstown-Lakes, Otago, in the domain of Construction & architecture, salary $158000. Posted on Thu, 13th of June, 2013, valid until Sat, 13th of July, 2013',1,66,29,'2013-06-13 00:00:00','2013-07-13 00:00:00',NULL,NULL,90000,50000,NULL),(36,'Job in Hawkes Bay','Building services full-time job in Central Hawkes Bay, Hawkes Bay, in the domain of Engineering, salary $124000. Posted on Sat, 6th of July, 2013, valid until Mon, 5th of August, 2013',1,25,42,'2013-07-06 00:00:00','2013-08-05 00:00:00',NULL,NULL,90000,50000,NULL),(37,'Job in Waikato','Account management contract job in Otorohanga, Waikato, in the domain of Sales, salary $26000. Posted on Thu, 23rd of May, 2013, valid until Sat, 22nd of June, 2013',3,9,129,'2013-05-23 00:00:00','2013-06-22 00:00:00',NULL,NULL,90000,50000,NULL),(38,'Job in Hawkes Bay','Residential sales & management full-time job in Wairoa, Hawkes Bay, in the domain of Property, salary $37000. Posted on Mon, 10th of June, 2013, valid until Wed, 10th of July, 2013',1,21,194,'2013-06-10 00:00:00','2013-07-10 00:00:00',NULL,NULL,90000,50000,NULL),(39,'Job in Canterbury','Insurance full-time job in Ashburton, Canterbury, in the domain of Banking, finance & insurance, salary $57000. Posted on Fri, 5th of July, 2013, valid until Sun, 4th of August, 2013',1,59,20,'2013-07-05 00:00:00','2013-08-04 00:00:00',NULL,NULL,90000,50000,NULL),(40,'Job in Wellington','Financial planning & investment volunteer job in Masterton, Wellington, in the domain of Banking, finance & insurance, salary $47000. Posted on Mon, 22nd of April, 2013, valid until Wed, 22nd of May, 2013',4,42,19,'2013-04-22 00:00:00','2013-05-22 00:00:00',NULL,NULL,90000,50000,NULL),(41,'Job in Waikato','Management full-time job in Thames-Coromandel, Waikato, in the domain of Transport & logistics, salary $39000. Posted on Mon, 10th of June, 2013, valid until Wed, 10th of July, 2013',1,3,56,'2013-06-10 00:00:00','2013-07-10 00:00:00',NULL,NULL,90000,50000,NULL),(42,'Job in Waikato','Technicians full-time job in Waitomo, Waikato, in the domain of Trades & services, salary $197000. Posted on Tue, 21st of May, 2013, valid until Thu, 20th of June, 2013',1,12,157,'2013-05-21 00:00:00','2013-06-20 00:00:00',NULL,NULL,90000,50000,NULL),(43,'Job in West Coast','Planning full-time job in Grey, West Coast, in the domain of Construction & architecture, salary $164000. Posted on Fri, 12th of July, 2013, valid until Sun, 11th of August, 2013',1,51,27,'2013-07-12 00:00:00','2013-08-11 00:00:00',NULL,NULL,90000,50000,NULL),(44,'Job in Auckland','Management contract job in Waitakere City, Auckland, in the domain of Banking, finance & insurance, salary $46000. Posted on Tue, 30th of April, 2013, valid until Thu, 30th of May, 2013',3,55,21,'2013-04-30 00:00:00','2013-05-30 00:00:00',NULL,NULL,90000,50000,NULL),(45,'Job in Wellington','Reception & front desk volunteer job in Carterton, Wellington, in the domain of Hospitality & tourism, salary $76000. Posted on Mon, 8th of July, 2013, valid until Wed, 7th of August, 2013',4,43,81,'2013-07-08 00:00:00','2013-08-07 00:00:00',NULL,NULL,90000,50000,NULL),(46,'Job in Northland','Service desk volunteer job in Whangarei, Northland, in the domain of IT, salary $78000. Posted on Fri, 3rd of May, 2013, valid until Sun, 2nd of June, 2013',4,11,92,'2013-05-03 00:00:00','2013-06-02 00:00:00',NULL,NULL,90000,50000,NULL),(47,'Job in Marlborough','Management full-time job in Marlborough, Marlborough, in the domain of IT, salary $90000. Posted on Sat, 29th of June, 2013, valid until Mon, 29th of July, 2013',1,48,93,'2013-06-29 00:00:00','2013-07-29 00:00:00',NULL,NULL,90000,50000,NULL),(48,'Job in Wellington','Other full-time job in Lower Hutt, Wellington, in the domain of Manufacturing & operations, salary $23000. Posted on Fri, 10th of May, 2013, valid until Sun, 9th of June, 2013',1,40,113,'2013-05-10 00:00:00','2013-06-09 00:00:00',NULL,NULL,90000,50000,NULL),(49,'Job in Wellington','Accounts administrators full-time job in Porirua, Wellington, in the domain of Accounting, salary $65000. Posted on Mon, 22nd of April, 2013, valid until Wed, 22nd of May, 2013',1,38,4,'2013-04-22 00:00:00','2013-05-22 00:00:00',NULL,NULL,90000,50000,NULL),(50,'Job in Canterbury','Corporate & institutional banking part-time job in Waimakariri, Canterbury, in the domain of Banking, finance & insurance, salary $81000. Posted on Wed, 3rd of July, 2013, valid until Fri, 2nd of August, 2013',2,54,17,'2013-07-03 00:00:00','2013-08-02 00:00:00',NULL,NULL,90000,50000,NULL),(51,'Job in Gisborne','Energy part-time job in Gisborne, Gisborne, in the domain of Engineering, salary $78000. Posted on Tue, 9th of July, 2013, valid until Thu, 8th of August, 2013',2,20,164,'2013-07-09 00:00:00','2013-08-08 00:00:00',NULL,NULL,90000,50000,NULL),(52,'Job in Bay Of Plenty','Nursing & midwifery contract job in Tauranga, Bay Of Plenty, in the domain of Healthcare, salary $153000. Posted on Sun, 14th of April, 2013, valid until Tue, 14th of May, 2013',3,15,71,'2013-04-14 00:00:00','2013-05-14 00:00:00',NULL,NULL,90000,50000,NULL),(53,'Job in Bay Of Plenty','Quality assurance part-time job in Whakatane, Bay Of Plenty, in the domain of Manufacturing & operations, salary $23000. Posted on Fri, 10th of May, 2013, valid until Sun, 9th of June, 2013',2,17,111,'2013-05-10 00:00:00','2013-06-09 00:00:00',NULL,NULL,90000,50000,NULL),(54,'Job in Canterbury','Management contract job in Mackenzie, Canterbury, in the domain of Engineering, salary $156000. Posted on Mon, 24th of June, 2013, valid until Wed, 24th of July, 2013',3,61,48,'2013-06-24 00:00:00','2013-07-24 00:00:00',NULL,NULL,90000,50000,NULL),(55,'Job in West Coast','HR part-time job in Grey, West Coast, in the domain of HR & recruitment, salary $100000. Posted on Sat, 11th of May, 2013, valid until Mon, 10th of June, 2013',2,51,86,'2013-05-11 00:00:00','2013-06-10 00:00:00',NULL,NULL,90000,50000,NULL),(56,'Job in Manawatu/Wanganui','Security contract job in Palmerston North, Manawatu/Wanganui, in the domain of Trades & services, salary $161000. Posted on Tue, 21st of May, 2013, valid until Thu, 20th of June, 2013',3,34,156,'2013-05-21 00:00:00','2013-06-20 00:00:00',NULL,NULL,90000,50000,NULL),(57,'Job in Auckland','Management part-time job in North Shore City, Auckland, in the domain of Accounting, salary $56000. Posted on Wed, 8th of May, 2013, valid until Fri, 7th of June, 2013',2,44,6,'2013-05-08 00:00:00','2013-06-07 00:00:00',NULL,NULL,90000,50000,NULL),(58,'Job in Southland','Farming volunteer job in Southland, Southland, in the domain of Agriculture, fishing & forestry, salary $162000. Posted on Thu, 20th of June, 2013, valid until Sat, 20th of July, 2013',4,69,9,'2013-06-20 00:00:00','2013-07-20 00:00:00',NULL,NULL,90000,50000,NULL),(59,'Job in Auckland','Other contract job in Rodney, Auckland, in the domain of Property, salary $37000. Posted on Tue, 14th of May, 2013, valid until Thu, 13th of June, 2013',3,33,195,'2013-05-14 00:00:00','2013-06-13 00:00:00',NULL,NULL,90000,50000,NULL),(60,'Job in Wellington','Boilermakers & welders part-time job in Upper Hutt, Wellington, in the domain of Trades & services, salary $39000. Posted on Thu, 25th of April, 2013, valid until Sat, 25th of May, 2013',2,39,144,'2013-04-25 00:00:00','2013-05-25 00:00:00',NULL,NULL,90000,50000,NULL),(61,'Job in Southland','Supervisors & forepersons part-time job in Southland, Southland, in the domain of Manufacturing & operations, salary $182000. Posted on Sat, 4th of May, 2013, valid until Mon, 3rd of June, 2013',2,69,170,'2013-05-04 00:00:00','2013-06-03 00:00:00',NULL,NULL,90000,50000,NULL),(62,'Job in Auckland','Client services part-time job in Manukau City, Auckland, in the domain of Banking, finance & insurance, salary $47000. Posted on Tue, 23rd of April, 2013, valid until Thu, 23rd of May, 2013',2,75,16,'2013-04-23 00:00:00','2013-05-23 00:00:00',NULL,NULL,90000,50000,NULL),(63,'Job in Marlborough','Boilermakers & welders full-time job in Kaikoura, Marlborough, in the domain of Trades & services, salary $40000. Posted on Tue, 16th of April, 2013, valid until Thu, 16th of May, 2013',1,49,144,'2013-04-16 00:00:00','2013-05-16 00:00:00',NULL,NULL,90000,50000,NULL),(64,'Job in Waikato','Web design full-time job in Matamata-Piako, Waikato, in the domain of IT, salary $54000. Posted on Sat, 4th of May, 2013, valid until Mon, 3rd of June, 2013',1,6,100,'2013-05-04 00:00:00','2013-06-03 00:00:00',NULL,NULL,90000,50000,NULL),(65,'Job in Auckland','Horticulture volunteer job in Franklin, Auckland, in the domain of Agriculture, fishing & forestry, salary $147000. Posted on Thu, 4th of July, 2013, valid until Sat, 3rd of August, 2013',4,2,12,'2013-07-04 00:00:00','2013-08-03 00:00:00',NULL,NULL,90000,50000,NULL),(66,'Job in Wellington','HR volunteer job in Kapiti Coast, Wellington, in the domain of HR & recruitment, salary $32000. Posted on Mon, 17th of June, 2013, valid until Wed, 17th of July, 2013',4,37,86,'2013-06-17 00:00:00','2013-07-17 00:00:00',NULL,NULL,90000,50000,NULL),(67,'Job in Southland','Pharmacy volunteer job in Southland, Southland, in the domain of Healthcare, salary $174000. Posted on Sat, 29th of June, 2013, valid until Mon, 29th of July, 2013',4,69,73,'2013-06-29 00:00:00','2013-07-29 00:00:00',NULL,NULL,90000,50000,NULL),(68,'Job in Manawatu/Wanganui','Commercial sales & leasing full-time job in Rangitikei, Manawatu/Wanganui, in the domain of Property, salary $200000. Posted on Sat, 11th of May, 2013, valid until Mon, 10th of June, 2013',1,31,191,'2013-05-11 00:00:00','2013-06-10 00:00:00',NULL,NULL,90000,50000,NULL),(69,'Job in Hawkes Bay','Other full-time job in Hastings, Hawkes Bay, in the domain of Agriculture, fishing & forestry, salary $149000. Posted on Tue, 28th of May, 2013, valid until Thu, 27th of June, 2013',1,23,13,'2013-05-28 00:00:00','2013-06-27 00:00:00',NULL,NULL,90000,50000,NULL),(70,'Job in Manawatu/Wanganui','Assistant store managers contract job in Manawatu, Manawatu/Wanganui, in the domain of Retail, salary $67000. Posted on Fri, 5th of July, 2013, valid until Sun, 4th of August, 2013',3,32,140,'2013-07-05 00:00:00','2013-08-04 00:00:00',NULL,NULL,90000,50000,NULL),(71,'Job in Northland','Drafting volunteer job in Kaipara, Northland, in the domain of Construction & architecture, salary $47000. Posted on Sun, 23rd of June, 2013, valid until Tue, 23rd of July, 2013',4,22,24,'2013-06-23 00:00:00','2013-07-23 00:00:00',NULL,NULL,90000,50000,NULL),(72,'Job in Bay Of Plenty','Service desk volunteer job in Western Bay Of Plenty, Bay Of Plenty, in the domain of IT, salary $200000. Posted on Sat, 25th of May, 2013, valid until Mon, 24th of June, 2013',4,14,92,'2013-05-25 00:00:00','2013-06-24 00:00:00',NULL,NULL,90000,50000,NULL),(73,'Job in Wellington','Training full-time job in South Wairarapa, Wellington, in the domain of IT, salary $113000. Posted on Wed, 19th of June, 2013, valid until Fri, 19th of July, 2013',1,45,169,'2013-06-19 00:00:00','2013-07-19 00:00:00',NULL,NULL,90000,50000,NULL),(74,'Job in Bay Of Plenty','Accounts payable contract job in Whakatane, Bay Of Plenty, in the domain of Accounting, salary $190000. Posted on Sun, 2nd of June, 2013, valid until Tue, 2nd of July, 2013',3,17,2,'2013-06-02 00:00:00','2013-07-02 00:00:00',NULL,NULL,90000,50000,NULL),(75,'Job in Manawatu/Wanganui','Retail assistants part-time job in Manawatu, Manawatu/Wanganui, in the domain of Retail, salary $84000. Posted on Wed, 8th of May, 2013, valid until Fri, 7th of June, 2013',2,32,138,'2013-05-08 00:00:00','2013-06-07 00:00:00',NULL,NULL,90000,50000,NULL),(76,'Job in Marlborough','Tutoring & training contract job in Kaikoura, Marlborough, in the domain of Education, salary $49000. Posted on Thu, 9th of May, 2013, valid until Sat, 8th of June, 2013',3,49,163,'2013-05-09 00:00:00','2013-06-08 00:00:00',NULL,NULL,90000,50000,NULL),(77,'Job in Bay Of Plenty','Au pairs & nannies volunteer job in Rotorua, Bay Of Plenty, in the domain of Education, salary $57000. Posted on Sat, 29th of June, 2013, valid until Mon, 29th of July, 2013',4,16,179,'2013-06-29 00:00:00','2013-07-29 00:00:00',NULL,NULL,90000,50000,NULL),(78,'Job in Otago','Quantity surveying full-time job in Clutha, Otago, in the domain of Construction & architecture, salary $169000. Posted on Tue, 9th of July, 2013, valid until Thu, 8th of August, 2013',1,68,177,'2013-07-09 00:00:00','2013-08-08 00:00:00',NULL,NULL,90000,50000,NULL),(79,'Job in Taranaki','Community & social services volunteer job in South Taranaki, Taranaki, in the domain of Healthcare, salary $75000. Posted on Sat, 11th of May, 2013, valid until Mon, 10th of June, 2013',4,28,67,'2013-05-11 00:00:00','2013-06-10 00:00:00',NULL,NULL,90000,50000,NULL),(80,'Job in Wellington','Reception & front desk full-time job in Porirua, Wellington, in the domain of Hospitality & tourism, salary $192000. Posted on Mon, 1st of July, 2013, valid until Wed, 31st of July, 2013',1,38,81,'2013-07-01 00:00:00','2013-07-31 00:00:00',NULL,NULL,90000,50000,NULL),(81,'Job in Northland','Primary volunteer job in Far North, Northland, in the domain of Education, salary $88000. Posted on Sat, 1st of June, 2013, valid until Mon, 1st of July, 2013',4,1,38,'2013-06-01 00:00:00','2013-07-01 00:00:00',NULL,NULL,90000,50000,NULL),(82,'Job in Otago','Web design part-time job in Queenstown-Lakes, Otago, in the domain of IT, salary $46000. Posted on Sun, 14th of April, 2013, valid until Tue, 14th of May, 2013',2,66,100,'2013-04-14 00:00:00','2013-05-14 00:00:00',NULL,NULL,90000,50000,NULL),(83,'Job in Canterbury','Cleaning part-time job in Banks Peninsula, Canterbury, in the domain of Trades & services, salary $83000. Posted on Tue, 14th of May, 2013, valid until Thu, 13th of June, 2013',2,57,147,'2013-05-14 00:00:00','2013-06-13 00:00:00',NULL,NULL,90000,50000,NULL),(84,'Job in Otago','Horticulture full-time job in South Otago, Otago, in the domain of Agriculture, fishing & forestry, salary $82000. Posted on Wed, 26th of June, 2013, valid until Fri, 26th of July, 2013',1,74,12,'2013-06-26 00:00:00','2013-07-26 00:00:00',NULL,NULL,90000,50000,NULL),(85,'Job in Taranaki','Surveying volunteer job in Stratford, Taranaki, in the domain of Construction & architecture, salary $43000. Posted on Wed, 17th of April, 2013, valid until Fri, 17th of May, 2013',4,27,32,'2013-04-17 00:00:00','2013-05-17 00:00:00',NULL,NULL,90000,50000,NULL),(86,'Job in Waikato','Waiting staff volunteer job in South Waikato, Waikato, in the domain of Hospitality & tourism, salary $129000. Posted on Sun, 14th of April, 2013, valid until Tue, 14th of May, 2013',4,10,79,'2013-04-14 00:00:00','2013-05-14 00:00:00',NULL,NULL,90000,50000,NULL),(87,'Job in Marlborough','Project & contracts management full-time job in Marlborough, Marlborough, in the domain of Construction & architecture, salary $79000. Posted on Wed, 15th of May, 2013, valid until Fri, 14th of June, 2013',1,48,29,'2013-05-15 00:00:00','2013-06-14 00:00:00',NULL,NULL,90000,50000,NULL),(88,'Job in Canterbury','Management full-time job in Ashburton, Canterbury, in the domain of Banking, finance & insurance, salary $166000. Posted on Fri, 3rd of May, 2013, valid until Sun, 2nd of June, 2013',1,59,21,'2013-05-03 00:00:00','2013-06-02 00:00:00',NULL,NULL,90000,50000,NULL),(89,'Job in Waikato','Printing full-time job in Hauraki, Waikato, in the domain of Trades & services, salary $28000. Posted on Fri, 19th of April, 2013, valid until Sun, 19th of May, 2013',1,4,155,'2013-04-19 00:00:00','2013-05-19 00:00:00',NULL,NULL,90000,50000,NULL),(90,'Job in Northland','Other part-time job in Whangarei, Northland, in the domain of Sales, salary $98000. Posted on Thu, 27th of June, 2013, valid until Sat, 27th of July, 2013',2,11,135,'2013-06-27 00:00:00','2013-07-27 00:00:00',NULL,NULL,90000,50000,NULL),(91,'Job in Nelson/Tasman','Project management full-time job in Nelson, Nelson/Tasman, in the domain of Engineering, salary $126000. Posted on Tue, 25th of June, 2013, valid until Thu, 25th of July, 2013',1,47,50,'2013-06-25 00:00:00','2013-07-25 00:00:00',NULL,NULL,90000,50000,NULL),(92,'Job in Waikato','Waiting staff volunteer job in Otorohanga, Waikato, in the domain of Hospitality & tourism, salary $75000. Posted on Wed, 12th of June, 2013, valid until Fri, 12th of July, 2013',4,9,79,'2013-06-12 00:00:00','2013-07-12 00:00:00',NULL,NULL,90000,50000,NULL),(93,'Job in Wellington','Management full-time job in Kapiti Coast, Wellington, in the domain of Manufacturing & operations, salary $61000. Posted on Wed, 26th of June, 2013, valid until Fri, 26th of July, 2013',1,37,108,'2013-06-26 00:00:00','2013-07-26 00:00:00',NULL,NULL,90000,50000,NULL),(94,'Job in Southland','Digital marketing contract job in Southland, Southland, in the domain of Marketing, media & communications, salary $82000. Posted on Mon, 24th of June, 2013, valid until Wed, 24th of July, 2013',3,69,187,'2013-06-24 00:00:00','2013-07-24 00:00:00',NULL,NULL,90000,50000,NULL),(95,'Job in Canterbury','Supply chain & planning full-time job in Waimate, Canterbury, in the domain of Transport & logistics, salary $195000. Posted on Thu, 13th of June, 2013, valid until Sat, 13th of July, 2013',1,62,57,'2013-06-13 00:00:00','2013-07-13 00:00:00',NULL,NULL,90000,50000,NULL),(96,'Job in Canterbury','Supply chain & planning full-time job in Selwyn, Canterbury, in the domain of Transport & logistics, salary $76000. Posted on Sun, 5th of May, 2013, valid until Tue, 4th of June, 2013',1,58,57,'2013-05-05 00:00:00','2013-06-04 00:00:00',NULL,NULL,90000,50000,NULL),(97,'Job in Manawatu/Wanganui','Kitchen staff part-time job in Horowhenua, Manawatu/Wanganui, in the domain of Hospitality & tourism, salary $69000. Posted on Tue, 16th of April, 2013, valid until Thu, 16th of May, 2013',2,36,82,'2013-04-16 00:00:00','2013-05-16 00:00:00',NULL,NULL,90000,50000,NULL),(98,'Job in Otago','Import & export contract job in Central Otago, Otago, in the domain of Transport & logistics, salary $121000. Posted on Fri, 21st of June, 2013, valid until Sun, 21st of July, 2013',3,64,59,'2013-06-21 00:00:00','2013-07-21 00:00:00',NULL,NULL,90000,50000,NULL),(99,'Job in Canterbury','Department managers volunteer job in Waimate, Canterbury, in the domain of Retail, salary $168000. Posted on Tue, 21st of May, 2013, valid until Thu, 20th of June, 2013',4,62,190,'2013-05-21 00:00:00','2013-06-20 00:00:00',NULL,NULL,90000,50000,NULL),(100,'Job in Otago','Management contract job in Dunedin, Otago, in the domain of Marketing, media & communications, salary $163000. Posted on Mon, 3rd of June, 2013, valid until Wed, 3rd of July, 2013',3,67,120,'2013-06-03 00:00:00','2013-07-03 00:00:00',NULL,NULL,90000,50000,NULL),(101,'Job in Taranaki','Housekeeping part-time job in South Taranaki, Taranaki, in the domain of Hospitality & tourism, salary $67000. Posted on Sat, 6th of July, 2013, valid until Mon, 5th of August, 2013',2,28,166,'2013-07-06 00:00:00','2013-08-05 00:00:00',NULL,NULL,90000,50000,NULL);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_alert`
--

DROP TABLE IF EXISTS `job_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_alert` (
  `job_alert_id` int(10) NOT NULL AUTO_INCREMENT,
  `seeker_id` int(10) DEFAULT NULL,
  `job_alert_title` varchar(100) DEFAULT NULL,
  `category_ids` varchar(45) DEFAULT NULL,
  `area_district_ids` varchar(45) DEFAULT NULL,
  `salary_ids` varchar(45) DEFAULT NULL,
  `work_type_ids` varchar(45) DEFAULT NULL,
  `is_received` enum('0','1') NOT NULL,
  PRIMARY KEY (`job_alert_id`),
  KEY `seeker_id` (`seeker_id`),
  CONSTRAINT `job_alert_ibfk_1` FOREIGN KEY (`seeker_id`) REFERENCES `job_seeker` (`seeker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_alert`
--

LOCK TABLES `job_alert` WRITE;
/*!40000 ALTER TABLE `job_alert` DISABLE KEYS */;
INSERT INTO `job_alert` VALUES (2,3,NULL,NULL,NULL,NULL,NULL,'0'),(3,22,NULL,NULL,NULL,NULL,NULL,'0'),(4,23,NULL,NULL,NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `job_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_category`
--

DROP TABLE IF EXISTS `job_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_category` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
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
-- Table structure for table `job_seeker`
--

DROP TABLE IF EXISTS `job_seeker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_seeker` (
  `seeker_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile_phone` int(10) DEFAULT NULL,
  `home_phone` int(10) DEFAULT NULL,
  `qualification` text,
  `current_job` text,
  `experience` text,
  `summary_of_skills` text,
  `visa_status` varchar(100) DEFAULT NULL,
  `linkedin_profile_url` varchar(100) DEFAULT NULL,
  `cover_letter` longtext,
  `availability` datetime DEFAULT NULL,
  `is_public_resume` tinyint(3) DEFAULT NULL,
  `district_id` int(10) DEFAULT NULL,
  `login_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`seeker_id`),
  KEY `district_id` (`district_id`),
  KEY `job_seeker_ibfk_1` (`login_id`),
  CONSTRAINT `job_seeker_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`),
  CONSTRAINT `job_seeker_ibfk_2` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_seeker`
--

LOCK TABLES `job_seeker` WRITE;
/*!40000 ALTER TABLE `job_seeker` DISABLE KEYS */;
INSERT INTO `job_seeker` VALUES (2,'aaaaa','aaaa','aaaa@aa.aa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(3,'kkkk','kkkk','kkkk@kk.kk',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'hjgjjj',NULL,'ghjgj@bnj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'lllll',NULL,'lkhjk@hbhj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'nhkjhk',NULL,'hkjnhjk@jnj.jnkj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'jhgjhbk',NULL,'bhjbj@nkj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'hjh',NULL,'hjjnhkj@mhbj.hj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'hjh',NULL,'hjjnhkj@mhbj.hj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'hjh',NULL,'hjjnhkj@mhbj.hj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'Gvhgv',NULL,'bhbhj@hvbgh.bhjb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `job_seeker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_sub_category`
--

DROP TABLE IF EXISTS `job_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_sub_category` (
  `subcategory_id` int(10) NOT NULL AUTO_INCREMENT,
  `subcategory_name` varchar(45) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`subcategory_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `job_sub_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `job_category` (`category_id`)
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
  `job_alert_id` int(10) NOT NULL,
  `district_id` int(10) NOT NULL,
  `job_seeker_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`job_alert_id`,`district_id`),
  KEY `job_seeker_id` (`job_seeker_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `jobalert_district_ibfk_1` FOREIGN KEY (`job_seeker_id`) REFERENCES `job_seeker` (`seeker_id`),
  CONSTRAINT `jobalert_district_ibfk_2` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`),
  CONSTRAINT `jobalert_district_ibfk_3` FOREIGN KEY (`job_alert_id`) REFERENCES `job_alert` (`job_alert_id`)
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
  `resume_no` int(10) NOT NULL AUTO_INCREMENT,
  `seeker_id` int(10) DEFAULT NULL,
  `resume_file` longtext,
  PRIMARY KEY (`resume_no`),
  KEY `seeker_id` (`seeker_id`),
  CONSTRAINT `jobseeker_resume_ibfk_1` FOREIGN KEY (`seeker_id`) REFERENCES `job_seeker` (`seeker_id`)
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
  `user_name` varchar(30) NOT NULL,
  `pass_word` varchar(40) NOT NULL,
  `user_role` int(10) DEFAULT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_id` int(10) NOT NULL AUTO_INCREMENT,
  `active` int(10) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('aaaa','7a2b9b812a7b748721dc53f5851847b766137a84',1,'2013-07-29 01:16:31',1,0),('ppppp','fb12f3af0e49285b2077ada21f11da27d91c7dce',2,'2013-07-29 05:52:11',2,0),('lllll','bda4e54569a40487c4bba388633b7a75ce7263d3',2,'2013-07-29 05:53:52',3,0),('hhhhh','2a2c873a10e8088cc2e54a74fd1428d59e0c509b',2,'2013-07-29 05:58:06',4,0),('hghg','5af9c3959a9bd7b25614beea8954059e8eb478a1',2,'2013-07-29 06:03:32',5,0),('hghh','5af9c3959a9bd7b25614beea8954059e8eb478a1',2,'2013-07-29 06:04:19',6,0),('llllll','5af9c3959a9bd7b25614beea8954059e8eb478a1',2,'2013-07-29 06:06:33',7,0),('kkkkk','fb12f3af0e49285b2077ada21f11da27d91c7dce',2,'2013-07-29 06:10:35',8,0),('hjhbhj','7a2b9b812a7b748721dc53f5851847b766137a84',2,'2013-07-29 09:29:44',9,0),('hbhjbgj','7a2b9b812a7b748721dc53f5851847b766137a84',2,'2013-07-29 12:56:01',10,0),('hghjghj','f638fffdf6f6192f8b0c2b764e6f554aa282fb24',2,'2013-09-08 03:13:46',11,0),('gvgfcgjbn','46c8e8dfa3a61fd39d81bfd1a475e13b8dc37ab7',2,'2013-09-22 02:47:04',12,0),('jgjyu','5af9c3959a9bd7b25614beea8954059e8eb478a1',2,'2013-10-27 03:11:29',13,0);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `region_id` int(10) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(50) DEFAULT NULL,
  `country_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`region_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `region_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
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
-- Table structure for table `seeker_appliedjobs`
--

DROP TABLE IF EXISTS `seeker_appliedjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seeker_appliedjobs` (
  `seeker_id` int(10) NOT NULL,
  `job_id` int(10) NOT NULL,
  PRIMARY KEY (`seeker_id`,`job_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `seeker_appliedjobs_ibfk_1` FOREIGN KEY (`seeker_id`) REFERENCES `job_seeker` (`seeker_id`),
  CONSTRAINT `seeker_appliedjobs_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeker_appliedjobs`
--

LOCK TABLES `seeker_appliedjobs` WRITE;
/*!40000 ALTER TABLE `seeker_appliedjobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `seeker_appliedjobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seeker_saved_searches`
--

DROP TABLE IF EXISTS `seeker_saved_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seeker_saved_searches` (
  `search_id` int(10) NOT NULL,
  `search_name` varchar(100) DEFAULT NULL,
  `seeker_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `job_category_id` int(10) DEFAULT NULL,
  `job_subcategory_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`search_id`),
  KEY `seeker_id` (`seeker_id`),
  KEY `region_id` (`region_id`),
  KEY `job_subcategory_id` (`job_subcategory_id`),
  KEY `job_category_id` (`job_category_id`),
  CONSTRAINT `seeker_saved_searches_ibfk_1` FOREIGN KEY (`seeker_id`) REFERENCES `job_seeker` (`seeker_id`),
  CONSTRAINT `seeker_saved_searches_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`),
  CONSTRAINT `seeker_saved_searches_ibfk_3` FOREIGN KEY (`job_subcategory_id`) REFERENCES `job_sub_category` (`subcategory_id`),
  CONSTRAINT `seeker_saved_searches_ibfk_4` FOREIGN KEY (`job_category_id`) REFERENCES `job_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeker_saved_searches`
--

LOCK TABLES `seeker_saved_searches` WRITE;
/*!40000 ALTER TABLE `seeker_saved_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `seeker_saved_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seekerjob_shortlist`
--

DROP TABLE IF EXISTS `seekerjob_shortlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seekerjob_shortlist` (
  `shortlist_id` int(10) NOT NULL,
  `seeker_id` int(10) NOT NULL,
  `job_id` int(10) NOT NULL,
  PRIMARY KEY (`shortlist_id`,`seeker_id`,`job_id`),
  KEY `seeker_id` (`seeker_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `seekerjob_shortlist_ibfk_1` FOREIGN KEY (`seeker_id`) REFERENCES `job_seeker` (`seeker_id`),
  CONSTRAINT `seekerjob_shortlist_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seekerjob_shortlist`
--

LOCK TABLES `seekerjob_shortlist` WRITE;
/*!40000 ALTER TABLE `seekerjob_shortlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `seekerjob_shortlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_type`
--

DROP TABLE IF EXISTS `work_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_type` (
  `work_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `work_type` varchar(100) NOT NULL,
  PRIMARY KEY (`work_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_type`
--

LOCK TABLES `work_type` WRITE;
/*!40000 ALTER TABLE `work_type` DISABLE KEYS */;
INSERT INTO `work_type` VALUES (1,'All Work Types'),(2,'Full Time'),(3,'Part Time'),(4,'Contract/Temp'),(5,'Casual/Vacation');
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

-- Dump completed on 2013-11-27 14:02:38
