CREATE DATABASE  IF NOT EXISTS `get-the-job` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `get-the-job`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: get-the-job
-- ------------------------------------------------------
-- Server version	5.5.31

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
  `DistrictID` int(11) NOT NULL AUTO_INCREMENT,
  `DistrictName` varchar(100) NOT NULL,
  `RegionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DistrictID`),
  KEY `CityID_idx` (`RegionID`),
  CONSTRAINT `RegionID` FOREIGN KEY (`RegionID`) REFERENCES `region` (`RegionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Company_Agent_Logo` varchar(30) DEFAULT NULL,
  `MobilePhone` varchar(11) DEFAULT NULL,
  `WorkPhone` varchar(11) DEFAULT NULL,
  `EmailForApplication` varchar(100) DEFAULT NULL,
  `Company_Agent_URL` varchar(100) DEFAULT NULL,
  `EMPLOYER_TYPE_ID` int(11) DEFAULT NULL,
  `AGENT_COMPANY_NAME` varchar(100) DEFAULT NULL,
  `Username_Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYER_ID`),
  UNIQUE KEY `Username/Email_UNIQUE` (`Username_Email`),
  KEY `EmployerTypeID_idx` (`EMPLOYER_TYPE_ID`),
  CONSTRAINT `EmployerTypeID` FOREIGN KEY (`EMPLOYER_TYPE_ID`) REFERENCES `employer_type` (`EMPLOYER_TYPEID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_agent_company`
--

LOCK TABLES `employer_agent_company` WRITE;
/*!40000 ALTER TABLE `employer_agent_company` DISABLE KEYS */;
/*INSERT INTO v VALUES (1,'Mark','Rob','100 Queen st, Auckland','����\0JFIF\0\0\0\0\0\0��\0�\0	\r( \Z1$1!%)+/0/\Z383,7(-.+\n\n\n\r,% &4,,.,,-,,,,,,,,,,/,4,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,��\0\0�\0�\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0E\0	\0\0\0\0\0!1AQa\"q���#2BRbr��$C���3ST�����st�����\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0��\04\0\0\0\0\0\0!1AQ�\"2Ra��#q���B��3C���\0\0\0?\0�PT���ᬞh���w�>��47�9�i+��;a�m��䧴��Qk�w���,\\��<����|g�a�w��R���\r����4��z�qS�M���k2��ɩ\'��!�4���ą�M��-j��e�Z�\0/U\'uӸ���d���Dt�o���i�f�\\��>�Q|\"��\0�υb���Fz.��v��B��w����a�\\ԋפ�k(�������������������������J�6`K�^Q�p�V}�M�6��\0j^�˶:��~����ͦ�qɆ([,��=�$cs����?�U��-�#Ò��s�i�><�����J�tB\n��Z�z���Y�I�.�b��S�O�7+ڹ8�\\���ⰺ���Z�m+��X�ǜ���S^,6��ٵ���������4��\n<^	�ߝ$V�8���w��/JE�9K=N<�-���:�\0~�z��               ��(��{����8��LF�\"֊�̨*��4�J�I�{���I������+#%���O�7����n�m2^%m+G�cwc\\|���ح?&Ί�mE\"<�Ӛ�\\۲r�s��F�f}��X���[�;;���Z^��V�����w৽>�����I��2fzM7\"�����\\U�I���>{a�+��i*[4l���{Z��]r����Y�v���Z�%�^^��(U���:L�[��/��-�8�G˛G�rpi�����)���&]�c�};V�H�	�Dxg��ɶ>5�db��7��V��t�\r>S���/6t��b��v��[\Zm<���ū��WO��z�B���|�t�8��%�q�~�K��b���;%��kN�/�+�\Z����)䀝1:��r�w�N��Ò/?���6n,SI�\0��\0e�*������������������j��SӃ�Ҹqq�o�]ޭ{:���Eld�kO����R�]�-�L��f��\"Ι��s[�h�\'�*M~N,�y:n������y�夲yq*��b|һ5�;���N��;^�Z���\\T�ۤ)\\��gM&������h���tX0�8a�j�ϓ��H����T�ϒ�H�����k�o�Uݧ��[�-�3Z>_���t�\n/,������ݡ�6�}4ں\r581D9=vN�=���4�Yډ��\r3��8��=�cz�m~�����m>x�����\nJv�#`�Xֱ��E��sv��fe�R�Z�c��P� ��\r� 4I:\0Y\'rDn����T�Z�1�%͌�M<��Σ!-ì��&������9~��w�ھ�z���+qZ�\n�;�J�I�yv61k�ɞ*����V���ǽ�(���\0�����������������ÎWy-4�{{��n�����w��f���y?>�tn<�Ӓ�7��t�tai#�}�|3���\'>5�ea��7����N��(�U�Qӻ�\r�=b>��o\r�tZm�2�O�E�z��\0*���\0ˀY�u(d\n!�m.!���\0\ZI\'Pz���$D���$�o �dg���)�ʹu\0\0�\\�7{�m����Zn�WǬ����m�8�V+��FB���}#��Ž���8��������T���.nM0�\'�k���L�����aĩu�8������v.1>|�b�o�8�Pr�ș��;�/\Z\\>�o�vw��M�O�G���5��x+�O����si�!�*P��B���&m�[;�����ܪ�ڟ�u��\0���m���?��Uk�?ʶ!�ֈ��\Z�=��gr���l{�����ŗ����n������&�R=���>�ͭ�Y�\'�t�V<_�i�lLdlk\Z�4n\r�.zffw�_Z�b\"E	h�(���^l�]v�������6��0N[m����jk���_RUO��W��\\�d��ԯkX�mZ���6�W����AD2J�A䡭x�vڙ�@?z�{�i��m-^���\Z��,�?E���ُU��\r`T��(!�\0t������UQ4����\0���]:�V*�_��6�x�A�rcG�b1��&I7p\r/�j�-�/տٴ����u*gD�b��Tp�y��Ƌ���hI:�Ronxɒ��6�E�ܸ��]��_��\rMS��^a���[Q�ٯ�f��+]7R$(u���_�%�J��v���4��ū���(�:��Z)�<V�~�[Z�45��h\0\r@I33;˥�b��>�   ��WEL�$�66\r�>\0m<�JZ�cw��)��W����q�k�t�����BĐ��i�l�<6b��i��jt�f�al4w�y6R�l�7�n��stv{}58�D5��80�~���Wna%���*�7X^y? �����㲫�O�$�1��!�\0��&����*���;F��*N%6ld�X�7Vq�#��ۇYW:l�y��9��w��=����n��)A �C��̖~%%��L�9�6��3���u�\Z��6�G9�����]4�́��&�F�\Z֍@*KZm;˥�b��^�������^�0�� 4\r�Jb&ghE����c��G�F�qڹ�#u��u��3�\'/��S�կ�����+�C�����:Go\'@�ѩ��V���mX�C�6L��y������0��Aqi\0}<�x�;�>�Yl5�]��v\nۖJ�2��ms�w����w+\r\ry͕=�f�����1t����f�3ּ/����Wk�es�S���<��eo:�QS�ʹڡ��p��w\r�΍�}i4�{v�<v��˧��W��P�BAR7�#�Rbsf����.��{������*��Z]%����+����6C#`�Z>gy�N�KkM�yt��iX�c�м�� �kA��_�S]��\0h�U��-<_�u�p�o~v���Oi��ʜ��\\c8�Ms����������Ss�[b�LQ�Q�ɞw��<\Z�5Y(v��m��t�h��	�\Zߩ*�W��w�<����\\SkG��U+�S�������v�|��E�\0�Ui�\0���p�[���A�±Y������=���k�u�m�@ �^oJ�6�&,��35���/lI�	��6y=�K�N�\"�t���5��\0��@X��u�l-��5_6,�ٍ��8�s��U&L�{qK�Ŋ���ڼ29���JZ�;��h�F��S~|�-�s�m=F�]g��PemV!p��p셗�G[�tp\n����u�P�5�sr��<��e��)yd���5��\0Y\'P	���3�/<��<��=f��;��wx��g��d�;-.�i��l�����������喌�駶�F���?��+\r�������V�Et��bԉ� A*P��\'FL��$��;A�Π}ʦ�f�-��t�=<aǷ��t�]��c�OK��=\'���zR�ðq66,���_>�����2�/j�.�ϓBtf���y���U�%)�yʗQ�2r�(�r�n+YC ���2\nP�y>�70����v�#:����~�۹UkuQ?�O���tY��:�G�XJ�v �e&U�a�һ>R.�Yb���h�{.����/N�mmF����+�W��ى�s)��4����XSE���5FN��ow�G&Ub75�v<��_���k�\0��?�/e^b0��u�̍k��:�[K�|i��_�\0Wy�\\�S�H�iN��o����h��Z���z~ЦNV�>��j,\Z����imζ�BO����	�6���k�p���>\nF��Z�b�A\r����ɍ�ib�	@D%H��E+g�)�G��#~`/����c�lh��X��c4�,Ϩ���Tk{�5�I�U�k�ՇC�-1�����Q�<�����=\\᱙Æ�v\\�\n����~e>~ҵ�c�~.���Iq$�N�I�V�F�s33��K� �	\nP�)Cc����̧���v�7�q���i�7������;R~K�$4e��<��h�L>�>��{���km�ٯ(�^�{6����HvEf �r�*��+\Z���:C�=��6���������h�uq��G�?���D��|�/{�.q7q;�W�9�Zm;�Wȩ�J\n��*�.�H[MV��m\rd�K����6hд�\Zh��^�=�i�_��o����A\0�4��\n�]�@A�e�B���Ҁګt٠6kq��:���oO���m�������j�~�~���G#Ǵ��p!��YD���f���jP�@�J!���d���B��n�X[Q�u��bѴ�R����Ԭ����I�t�nq$�i��Mk����;�w|����J��R��ɚ��a9��wF/�:�.���c��K>&\\��r��X8&�EgU<��y����:��]}�ʜ��|����N���i��C#cX��5�����m;�ε���>�  ���$�)&����8��8����ha\0�\r\0�|\Z�1X�r�T\Z��כ�?�����Z�Z᠂,A�AԷ7�[11�_2�AP�(�	b�+�L���*�y�A!?�q�	�N�ǁѣ����^�+]�i����m*����G��-M���36@,ɛa#x_����kc�L�����r�&j0�3&ћ�s6��Goi�\ZU�,���y���<�y��+\\D%H�C �	R�AJNd�V#gF��v���q���գ�X2�)��_&�\rL��y�� h�,��e��0v=C�犮˫�~��q�A�9�?7T��y(4�C���|�-%�ٛa#wi��p�b�|}?f�}6<��G??;�91>�H3�q�s4t��.��um�=r�.�J\rF��\'�O6���t	bQ(P�%@�y2��+`��w��6�V\r�kǈӰ��V⎋����u�W|�-��Y����X���sN�7�T��w��ҷ�\r���~S%;�ۥ��E�C�q�$^�P�s�W��X�0�\"�	\nFA]�\0\'Yڰ*�x\"(�HZt���:-���^��S4�+�i����\02�<!l���\0\0\0\0\0�\0\Z�\n�wђ>!ELo�f��g4��㸍K�m5������5�rQ�e��a�[K��s���xx����>nwU���x9ҳ5P�,Q(P�Қ��F��\ZC��������궚��#*��C�ͩ`h�\0;��:7S����i���?J�6Dw-p��rz�a�јG�=�E=aW�qVU��T$\"�d�!�p�R_K06��F�G����,]l�:{V��qkM����\\�������i�g���?�#�{�V~T�Ue�M���ҧ�������>���I��?1ߥ?����Z~T����M���ҧ�������>���I��?1ߥ?����O��ڌ��3��T��?����\0��\0����)��F��?0l���v��U�k��\'}�ok�Z6��X�Do\n���0�\\4Y�\Z�� �x�4�1��\\���@�x\\�S���ïc�깼WX��9�ح��Yx\n��ĢP�(A���i%d�<�F�a�����F�ɏ%�ۊ��$2ڟhc���ֈ�;�\'�5�W�Ol|��}]2��\'��-v���I \0	$�\0\rd�o)9D�B�Nt��;c�OMÆ��}��M�i^}eE��/�zC�[-��(d�HR�AJ��R�AK� ���:��N!R֑�Yg�vf�oY\"�Wܵ�9��o�=z7��H껀��uI@@@@A�r���YO����	ѭ��sx��v�[z\\�ធ�����qGX�)�h�b�B�� �Q�%sYY&n���{�+��=a�]^j��g��:���QS$��.\Z�����꘩N��Q�\'+KV�0���BT���$\"(d�s`.w\rjQ��G�RK�\'�\0C��G|޻��J\Z���^���4�u�5��\0��<Do��$��\\btq�Ζ@Z�8_K��e�c�w�&�\r\\��h���`�a��b^��=�\\U6\\��n+:<+��5l�&a\r���}c���	/,;�>�;�n�W\Z|��>p�u�;���OG6��X�\0�B$@@D%�BT�!H�QR�<��&��\Z֍d�:�(�EcyMik�\rc��ɮN�����Q=�-?�i��u��*̺�Zv�(�^`��t���}�=,q\0��lm\Z�ֆ����g�z�������Y�        ���\'��i\\֏?��;Y�F���>�/w�WW��Ƿ�tP�i�,F��wp�f6b�%%�\"Q��srq��E�Nߴ�4�&M���\r��Z��s�!���U�Y�v�Q�              �9R�C�t\r�n?hh�\\~���n�&}��E>�K�����\0*�o*��D�%)�HR��ɖI�C�l��,>e������z��j���z�4\Z^)�-��m��Ѐ��������������ck�Z��\\�.:#hH��1�)R�y�n��f��8�&}W{���t؛m>�2F�������W��8ղ�(@@A(��C��\\�~\"�,������FB=F��νZڍDc���{G����ow�ቱ��cCX�\Zց`\0\0\rʦffw��DDm�$@@@@@@@@@@@@@@@A���� �4���A��1�Uc�����l?H�]LN��n?�{�a�Y��S���\0���\n�x�$c���p-p<A��LLo\n����/��\nHYqF�ִ��٭\0���&v�DL�а�K�w�[5x1ǬS����OR�ͬ��O�i���k/촠����cC�\Zִ\0��\0ԫ�fgy\\DDF��(H�������������������_�`�խͩ��l\"�o��v�-OvX�a�H��w��[Og:\n�#\ZNk��P�i�ۦ��&�;6�k3��¼�����ss~�oc���3a��m��f��qͿ�&K�A�y;n���K` >z�\r�k\Z��	%�E�}m�D,��e:�f}��Ԕ#��5�Q�!�y���|���+X1��a�X�D��',217657788,9865566,'markrob@ghash.co.nz','www.ghash.co.nz',1,'GHASH COMPANY','GHash'); */
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
  `EMPLOYER_TYPE_DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY (`EMPLOYER_TYPEID`)
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
  `EXPERIENCE_LEVEL_DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY (`EXPERIENCE_LEVEL_DESCRIPTION`)
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
  `JobID` int(11) NOT NULL AUTO_INCREMENT,
  `JobTitle` varchar(100) DEFAULT NULL,
  `JobDescription` longtext,
  `WorkTypeID` int(11) DEFAULT NULL,
  `DistrictID` int(11) DEFAULT NULL,
  `SubCategoryID` int(11) DEFAULT NULL,
  `Salary` float(8,2) DEFAULT NULL,
  `DateOfAdvertisement` datetime DEFAULT NULL,
  `EndDateOfAdvertisement` datetime DEFAULT NULL,
  `ExperienceLevel` varchar(100) DEFAULT NULL,
  `EMPLOYER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`JobID`),
  KEY `DistrictID_idx` (`DistrictID`),
  KEY `WorkTypeID_idx` (`WorkTypeID`),
  KEY `ExperienceLevel_ExperienceLevelDescription_idx` (`ExperienceLevel`),
  KEY `SubCategoryID_idx` (`SubCategoryID`),
  KEY `EMPLOYER_ID_idx` (`EMPLOYER_ID`),
  CONSTRAINT `WorkTypeID` FOREIGN KEY (`WorkTypeID`) REFERENCES `work_type` (`WorkTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `DistrictID` FOREIGN KEY (`DistrictID`) REFERENCES `district` (`DistrictID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SubCategoryID` FOREIGN KEY (`SubCategoryID`) REFERENCES `job_sub_category` (`SubCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ExperienceLevel_ExperienceLevelDescription` FOREIGN KEY (`ExperienceLevel`) REFERENCES `experience_level` (`EXPERIENCE_LEVEL_DESCRIPTION`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `EMPLOYER_ID` FOREIGN KEY (`EMPLOYER_ID`) REFERENCES `employer_agent_company` (`EMPLOYER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*INSERT INTO `job` VALUES (1,'Adiministrator - Taumaranui','Adimistrator - Taumaranui suddently theradio stoped the milking maching stopeed the milking cups fellwith a clatter to the floor oh no saidchrisnot a power cut chris knew the coswswould bes sore and uncomfortale if they werent milked and ther would be no milk for the rest of the calves no milk for the pigs and no milk for the family. smehow the coswhad tt be milked what did peopledo before milking machines were inve tedchrsi thoughof old mrs long on the farm up teroad.',2,2,2,445.00,'2013-06-11 00:00:00','2013-06-15 00:00:00','Entry'),(2,'Programming and Systems Administrator, Auckland Council Property Ltd.','We require an experienced Project Co-ordinator or Administrator to join our high performing team in this brand new role. As the Programming and Systems Administrator, you will be an integral part of the Acquisitions and Disposals team. Reporting to the Acquisitions and Disposals Programme Advisor, you will provide process and systems support to the team to ensure that all processes are documented and applied in line with agreed service levels. Auckland Council Property Limited (ACPL) is a focused, commercial organisation working to optimise value from Auckland Council\'s property assets through our actions and advice, to help Council achieve its vision. ACPL manages a property portfolio worth around $900m and has responsibility to deliver a number of significant property developments, manage business interests and undertake acquisitions and disposals on behalf of the Council and Auckland Transport.',NULL,NULL,NULL,NULL,NULL,NULL,NULL);*/
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
  KEY `SeekerID_idx` (`SeekerID`),
  CONSTRAINT `JobSeekerID` FOREIGN KEY (`SeekerID`) REFERENCES `job_seeker` (`SeekerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `CategoryName` varchar(100) DEFAULT NULL,
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
-- Table structure for table `job_seeker`
--

DROP TABLE IF EXISTS `job_seeker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_seeker` (
  `SeekerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `EmailID` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `MobileNumber` int(11) DEFAULT NULL,
  `HomePhone` int(11) DEFAULT NULL,
  `Qualification` text,
  `CurrentJob` text,
  `Experience` text,
  `SummaryOfSkills` text,
  `SalaryExpectation` float(8,2) DEFAULT NULL,
  `VisaStatus` varchar(100) DEFAULT NULL,
  `LinkedinProfileLink` varchar(100) DEFAULT NULL,
  `CoverLetter` longtext,
  `Availability` datetime DEFAULT NULL,
  `IsPublicDownloadResume` tinyint(4) DEFAULT NULL,
  `DistrictID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SeekerID`),
  KEY `_idx` (`EmailID`),
  KEY `DistrictID_idx` (`DistrictID`),
  CONSTRAINT `JobSeeker_DistrictID` FOREIGN KEY (`DistrictID`) REFERENCES `district` (`DistrictID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  KEY `CategoryID_idx` (`CategoryID`),
  CONSTRAINT `JobCategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `job_category` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  KEY `JobSeekerID_idx` (`JOBSEEKER_ID`),
  CONSTRAINT `JobAlert_JobSeekerID` FOREIGN KEY (`JOBSEEKER_ID`) REFERENCES `job_seeker` (`SeekerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `JobAlertID` FOREIGN KEY (`JOBALERT_ID`) REFERENCES `job_alert` (`JobAlertID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Jobalert_DistrictID` FOREIGN KEY (`DISTRICT_ID`) REFERENCES `district` (`DistrictID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  KEY `SeekerID_idx` (`SeekerID`),
  CONSTRAINT `JobseekerResume_SeekerID` FOREIGN KEY (`SeekerID`) REFERENCES `job_seeker` (`SeekerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  KEY `CountryID_idx` (`CountryID`),
  CONSTRAINT `CountryID` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_range`
--

LOCK TABLES `salary_range` WRITE;
/*!40000 ALTER TABLE `salary_range` DISABLE KEYS */;
INSERT INTO `salary_range` VALUES (1,'0',''),(2,'30','30'),(3,'40','40'),(4,'50','50'),(5,'60','60'),(6,'70','70'),(7,'80','80'),(8,'90','90'),(9,'100','100'),(10,'120','120'),(11,'150','150'),(12,'200','200'),(13,'Hourly rates','Hourly rates');
/*!40000 ALTER TABLE `salary_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seeker_appliedjobs`
--

DROP TABLE IF EXISTS `seeker_appliedjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seeker_appliedjobs` (
  `SeekerID` int(11) NOT NULL,
  `JobID` int(11) NOT NULL,
  PRIMARY KEY (`SeekerID`,`JobID`),
  KEY `Seeker_SeekerID_idx` (`SeekerID`),
  KEY `Job_JobID_idx` (`JobID`),
  CONSTRAINT `JobID` FOREIGN KEY (`JobID`) REFERENCES `job` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SeekerID` FOREIGN KEY (`SeekerID`) REFERENCES `job_seeker` (`SeekerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `SEEKER_SAVED_SEARCHES_ID` int(11) NOT NULL,
  `SearchName` varchar(100) DEFAULT NULL,
  `SEEKERID` int(11) DEFAULT NULL,
  `REGIONID` int(11) DEFAULT NULL,
  `JOBCATEGORY_ID` int(11) DEFAULT NULL,
  `JOBSUBCATEGORY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SEEKER_SAVED_SEARCHES_ID`),
  KEY `Region_RegionID_idx` (`REGIONID`),
  KEY `SeekerID_idx` (`SEEKERID`),
  KEY `Job_JobCategoryID_idx` (`JOBCATEGORY_ID`),
  KEY `JobSubCategoryID_idx` (`JOBSUBCATEGORY_ID`),
  CONSTRAINT `JobCategory_ID` FOREIGN KEY (`JOBCATEGORY_ID`) REFERENCES `job_category` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `JobSubCategory_ID` FOREIGN KEY (`JOBSUBCATEGORY_ID`) REFERENCES `job_sub_category` (`SubCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Region_RegionID` FOREIGN KEY (`REGIONID`) REFERENCES `region` (`RegionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Seeker_ID` FOREIGN KEY (`SEEKERID`) REFERENCES `job_seeker` (`SeekerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `SEEKERJOB_SHORTLIST_ID` int(11) NOT NULL,
  `SEEKERID` int(11) NOT NULL,
  `JOBID` int(11) NOT NULL,
  PRIMARY KEY (`SEEKERJOB_SHORTLIST_ID`,`SEEKERID`,`JOBID`),
  KEY `SEEKER_SEEKERID_idx` (`SEEKERID`),
  KEY `JOB_JOBID_idx` (`JOBID`),
  CONSTRAINT `JOB_JOBID` FOREIGN KEY (`JOBID`) REFERENCES `job` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SEEKER_SEEKERID` FOREIGN KEY (`SEEKERID`) REFERENCES `job_seeker` (`SeekerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `WorkTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkType` varchar(100) NOT NULL,
  PRIMARY KEY (`WorkTypeID`)
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

-- Dump completed on 2013-06-23 15:05:57
