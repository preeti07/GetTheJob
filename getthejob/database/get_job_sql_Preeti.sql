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
/*INSERT INTO v VALUES (1,'Mark','Rob','100 Queen st, Auckland','ˇÿˇ‡\0JFIF\0\0\0\0\0\0ˇ€\0Ñ\0	\r( \Z1$1!%)+/0/\Z383,7(-.+\n\n\n\r,% &4,,.,,-,,,,,,,,,,/,4,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,ˇ¿\0\0Â\0‹\0ˇƒ\0\0\0\0\0\0\0\0\0\0\0\0\0ˇƒ\0E\0	\0\0\0\0\0!1AQa\"qÅë°#2BRbr±¡$CÇì“3STí≤¬¢—st≥·ˇƒ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ˇƒ\04\0\0\0\0\0\0!1AQ°\"2RaÅ±#që—B¡Ò3C·ˇ⁄\0\0\0?\0ºPTÔ Ÿ·¨ûhüù§wö>Éö47·9†i+°ç;a≠mˆÍ‰ß¥≤”Qk÷wâûû,\\äæ<¯çà∞|g“a‹wç≈RÁ”ﬂ\r∂∑ÓÈ4∫¨zäqSÎMö¿Ÿk2ö∑…©\'ñˆ!Ñ4˚ŒË∑ƒÖüMèè-j÷÷eÓ∞Zˇ\0/U\'u”∏á∑≈d¢ô≥Dtço™ÊÌi‡±f≈\\¥·≥>õQ|\"ıˇ\0µœÖb´ÖìFz.∂–v¥ÒBÊ≤„úwö€¡⁄aÕ\\‘ã◊§Ωk(ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÉáÂJª6`Kﬁ^ÔÖÉQÌpÓV}ôMÔ6Úˇ\0j^⁄À∂:”Œ~ ÷ÍÈÕ¶Ëáq…Ü([,îÆ=É$cs€È÷›?ÖUˆñ-Î#√í˜±sÌi≈><„ı˛˝ñJ¶tB\náîZÓzπÌ£Y›Iﬁ.∑bø–SáOü7+⁄π8ı\\úÕ÷‚∞∫ëµ…ZÉm+áÒXŒ«ú”‡ÂÉS^,6èóŸµ°∑¢ìÛ€˜‰ª◊4Ïƒ\n<^	Êñﬂù$Vœ8ÿÌ±–wñ¯/JEÊ9K=N<ô-é≥Œ:ˇ\0~ÔzƒŒ               ˘œ(çé{çö–Á8ÂLFÛ¥\"÷äƒÃ®*∫ì4íJÔIÓ{›÷‚I˘Æûïä÷+#%Ê˜õOè7∆Î”¬n§m2^%m+GÒcwc\\|¡©∂ÿ≠?&ŒäìmE\"<„”öÚ\\€≤rôsîﬁFŒf}°„X˚∂ü[‚;;˙˜ÙZ^ˆ‹VÈ™Æ“◊w‡ßΩ>ë˝Ë≠åIÙì2fzM7\"˙§”÷ﬁ\\UÀI§πΩ>{a…+·Íªi*[4lëÜÏ{Zˆû]r˜¨“”YvÿÔ¨ZΩ%ˆ^^ƒﬂ(U‹≈†:Lÿ[¯Ω/ˆá-Ω8≥GÀõG¥rpiÌÛÂ˝˙)´´Á&]›c…};VÈH—	ﬁDxg≠–…∂>5Ødb‚Õ7ÚèøˆV∫§t¢\r>S„¨√·/6téªbè⁄vÛÓçø˚[\Zm<Êæ—”≈´¨’WOèäz¯Bö™™|œtí8πÓ%Œq⁄~ùK¢•bëéé;%Ìí”kNÛ/ò+€\Zœ‰«Á)‰Äù1:Ì¯rıw™N“«√í/?È”ˆ6n,SIˇ\0¥ˇ\0eŸ*’¿ÄÄÄÄÄÄÄÄÄÄÄÄÄÇ≥Âj∫ÚS”ÉËµ“∏qqÕoÉ]ﬁ≠{:ú¶ﬂEldﬁkO´Ä∫≥RÏ]Ë-ﬁL∞˛fèù\"Œô≈¸s[—h\'Ò*M~N,ªy:nÀ≈¡Éã∆y∫Â§≤yq*¯Èb|“ª5ç;Œ‡“NÖÔ;^—Z±ÂÀ\\Tõ€§)\\íægM&Å©åÿ∆Ïh˙ù•tX0◊8a»jµœìäﬂHÚÜºô™êTéœíÈH´ïªâÎkŸoôU›ßïÛ[ˆ-¶3Z>_ÓÇ§t¬\n/,´¸¶∫•‡›°Ê6Ó¥}4⁄∫\r581D9=vNÛ=ßÈ˚4∑Y⁄â∫Ω\r3ßñ8ôÈ=Õcz‹m~•Êˆä÷m>xÒÕÔèË\nJv√#`≥X÷±£ÉEá…sv¥⁄feŸR±Z≈c¡ˆPÙ ≈Ô\rŒ 4I:\0Y\'rDnâòàﬁTÓZÂ1ƒ%ÕåëM<ÿˆŒ£!-√¨´Ì&ü∫ÆÛ÷ª9~–÷w˜⁄æÏz¸‹ÿ+qZ»\nî;ÆJ©Iûyv61k‹…û*∑¥ÔÏV´Æ≈«ΩÌ(€˜ˇ\0•ñ©ùÄÄÄÄÄÄÄÄÄÄÄÄÉ√éWy-4Û{{á≈nàÔ≤˜äúwä±f…›„õy?>›tn<∫”íÃ7û´tƒtai#„}√|3ºéø\'>5üea‚À7üº≠≈NËÑü(ŸUŒQ”ª†\r™=b>Ï√o\rÌtZmø2ﬂOÂE⁄z›ˇ\0*ì˙ˇ\0ÀÄY©u(d\n!úm.!≠∏ê\0\ZI\'PzùˆÁ$DÃÌØ$∞o ¶dg˜áß)˜Õ¥u\0\0Ï\\Ó´7{ím·‡ÎÙZn„W«¨˛≠“◊mà8éV+˘∫FBô§Ï}#˛Ï≈Ω†¶˘8ºïù©ìáü˙Tä›œ.nM0ﬂ\'°k»ÈÃL«·‘¡’aƒ©uπ8≤ÌÂ…“ˆv.1>|›b‘oà8ﬁPr´»ô‰;Ì/\Z\\>ÈáoƒvwÓæÓìMﬁO∫G™∑¥5ùÕx+ÔO¢£∫∫si∫!ê*Põ©B∆‰ﬂ&mõ[;ÌÿÚÚÔ‹™µ⁄ü˝u˙ˇ\0ﬁÀ—m˘◊˙?¬ƒUk¡? ∂!Œ÷àÅ—\Z“=ÁÙèÅgr∑–”l{˘π˛‘…≈óá…≈›n´†˚–”Âé&˙R=ëé∑>´Õ≠√Yü\'ºt„¥V<_¢i†lLdlk\Z÷4n\r∏.zffwó_Z≈b\"E	hÚ∑(ôÜ¿^lÈ]v√¥ÌÁ›”ÿ6¨¯0N[m·‚÷’jkÇõœ_RUOùÔñW»Ú\\Ádü˛‘ØkX¨mZ˜µÌ6∑W Î”¬AD2JéA‰°≠xûv⁄ôß@?z·∞{£iÏﬂm-^´ªé\Zı˚,˚?Eﬁœ„ŸèU∂¥\r`TÆë(!Œ\0t§îù±ä„UQ4ÁÔ˜é\0ûàÓ∞]:V*‰≥_º…6ÛxÓΩ±óA÷rcGœb1ì™&I7p\r/±jÎ-∂/’øŸ¥‚œÂÕu*gDÚb∏åTpæyùö∆ãù‰ÏhI:∫Ronx…í∏Î6∑Eî‹∏ÑÓö]–∆_¢∆\rMS¥›^a≈Î√[QûŸØ≈f∫Î+]7R$(uíéƒ_ü%€J””v¢ÛÏ4¸Œ≈´©‘∆(⁄:∑ÙZ)œ<V˜~Îí[Z∆45ç≠h\0\r@I33;À•≠b±¥>ä   Û◊WEL√$“66\rÆ>\0m<˜JZÛµcwåô)éºWù°Â¡q®k£têìòË˙BƒêΩ∑iﬁl≈<6b”Íiû≥jtﬂf…al4wày6R‡lÁ7ön˚»stv{}58≤D5µô80⁄~ü∫áWna%ì»‘*π7X^y? ´µÛÓ¬„≤´ÔOË≥$ê1•Œ!≠\0πŒ&¿¨ì∞*Ëç÷Û;FÚ§≤Á*N%6ldäX…7Vq€#Ü˝€áYW:l’yıó9≠’w÷⁄=ÿ˛ÓÊn∂ö)A ©C§»Ãñ~%%ÕŸL¬9Ÿ6ìÏ3ﬁ˘¿uı\Zà≈6ÊèG9Ìº˚±◊¯]4îÃÅçé&ÜF–\Z÷ç@*KZm;À•≠b±√^è≤á°Ãÿ⁄^˜0πŒ 4\r‰ùJb&ghE≠çÂ√c¸¢GŸFﬁq⁄π◊#uª¿u´ü3œ\'/íüS⁄’Ø≥ãú˘¯+¸Cö©¸‰Ú:Go\'@‡—©£ÄVÿÒ◊mXŸCõ6L≥≈y›Ô¡ÒÁ“0±£Aqi\0}<∫x…;À>üYl5·à]´õv\n€ñJÎ2ñúmsÊw·≠˛Áw+\r\ryÕï=©fµ˙™˚´1t†≥πòf÷3÷º/Ï≥«”≈Wk„ùesŸS —˙<º¶eo:ÁQSªÕ¥⁄°„÷p˚∞w\rªŒçö}i4˚{v˙<vÜØÀß◊¯Wä¡PîBAR7˘#ìRbsfã≤ÿÕ.·Ï∑{èÜæºÛ∆*¸€Z]%≥€Â„+ø¢éö6C#`≥Z>gy⁄N’KkMßytî•iX≠cì–ºΩà õkA«Â_”S]îˇ\0hóU¡Û-<_Îu∑pËo~vÂ™›Oi„« úÁ—\\c8ıMs≥ßêë≠±ç∑©øSs≈[b¡LQÏ¬áQ™…ûwº˝<\Z‡≥5Y(vŸìm¨ßtéh˝„ö	‹\Zﬂ©*øW©úw⁄<óü£Æ\\SkGè¥U+£SºØºöË∆¡vÌ|ä”Eˇ\0éUiˇ\0Âè”˘p◊[ä‚ËAÓ¬±Y®‹˜¿Ú«=èâƒkÕuØm«@ Ï^oJﬁ6≥&,∂«35Ò‰Ò/lI∫	∫î6y=ÉKàNÿ\"÷tΩ˛´5∏ˇ\0∆“@XÚÂåu‚ñl-ö¸5_6,ÇŸç€Î8Ìsé“U&Lì{qK¶≈ä∏´´⁄º29º¢ÀJZ≥;ûúhÊòFÉÔªS~|Œ-ÚsÈm=Fª]g éPemV!p˜ÛpÏÖó¸G[ªtp\n◊öò˙uÛPÍ5πsrô⁄<°£e¶»)yd°Ùç•ƒ5†ó\0Y\'P	æ‹Â3¥/<õ√<äñ=f∂Ô;ﬁ„wxïŒgÀﬁdõ;-.ÁiÂ˜l÷¿ÄÄÄÄÄÄÄÇ®ÂñåâÈß∂áFËâÿú?º˜+\rΩô™õ¥ÈÌVﬂEt∑ïb‘â∫ A*PΩ≤\'FLá⁄$≥Ê;AÿŒ†} ¶‘fÔ-Útö=<a«∑åıtã]∂”c˘OKáè=\'úµ€zRü√∞q66,…Ó√_>ßˆßÈ‚¨2ã/j´.»œìBtf∞˘«y˙˚ªUû%)Œy óQ⁄2rØ(ırÅn+YC •Çî2\nP≤y>…70∂≤•∂v∏#:≈˛Ò√~·€πUkuQ?óO™˜≥tYåπ:¯G˚XJ±v —e&U”a¢“ª>R.ÿYbÛƒÏh‚{.≥·”ﬂ/NûmmFØˆ∫˘+úWîäŸâÊs)ô∞4øµŒÓXSEéæ˜5FN”ÀowìG&Ub75≥v<Å‹_¯¯ækˇ\0Ãœ?Â/e^b0ˆéuæÃçkÅÎ:‚º[Kä|iØœ_ˇ\0Wyì\\£S’HÚiNÄ‚oè≈ÍûΩhÂ“ZúÎŒz~–¶NVÂ>é›j,\Zµ¿ø‘imŒ∂“BO∂€Ëæ‚	´6ù›˜kÍp˜∏Êæ>\nF◊◊ZÊëb–A\r’∆˚π…çßib•	@D%Hﬁ‰E+gƒ)ÔGúœ#~`/Ω´¢€côlhÈÕXï·åc4Ù,œ®ï±èTk{∏5£IÏU«kŒ’áCì-1∆ˆùïñQÚì<˜éç¶û=\\·±ô√Ü∆v\\Ò\n«äµÁ~e>~“µπcÂ~.ÚÁÁIq$íN≤I÷VÙF›s33ºÅKÀ •	\nP»)CcÉ‡ıÆÃßàø⁄v¶7‚q–åôié7¥≤·”‰Õ;R~K‰$4e≤‘<‚ƒhÛL>Ë>ë‚{Ç™‘kmìŸØ(ı^È{6òΩ´ÛüHvEf ÂrÔ*∆é+\ZßéÄ:C´=√‰6û•µ¶”˜≥ºÙhÎuqÇªGΩ?›‘≈DÓïŒ|é/{â.q7q;…W¥9ÀZm;œW»©®J\nÑ±*Ó≤.ùH[MV‚Ím\rdáK°›÷Œ6h–¥µ\Zh∑µ^´=∂iÏ_ßŸo±·¿êA\0Ç4Ç¢\n¨]≤@A¬eˆBäÎ‘“Ä⁄´tŸ†6kqÿ˛:é›ÎoO®‡ˆm”Ï–’Ë˚œjΩ~Í~¢ƒ˜G#«¥ŸÃp!¿ÒYDƒ∆§µf≥¥æjPî@§J!È√Îd¶ïìBÏ…n◊X[Q–u®µb—¥ΩRˆ•∏´‘¨´í°ÊI§tínq$ıiŸ¡Mkç°ΩØ;⁄w|ÇÙ…J°êRÜÁ…ö∫Îa9ü≈wF/Í:˚.∞‰‘c«ÔK>&\\æÏrÛX8&–EgU<Œ˝yÇÌàìº:ñÜ]}≠ úæÎ|óéºÚNÛËÌiÈŸC#cX¡†5†é†å⁄m; Œµä∆—>™  ®≤∑$±)&ñ•ÃÁ8ªÕ8∏µ£—ha\0õ\r\0´|\Zú1X¨r˝T\ZΩ¢◊õœ?—ƒ»¬“Z‡Z·†Ç,A‹A‘∑7›[11 _2†APñ(î	b°+ìL±Ê⁄*óyóA!?ªqı	ˆNÕ«Å—£™¡ø∑^æ+]ØiÓÔ”¡m*Â¿ÄÉGîŸ-Mâ≤”36@,…õa#x_÷ÜµókcûL¥ÙÀ◊Ó•rü&j0π3&—õÛs6˘èGoiÒ\ZU¶,’…îyÙ◊√<˙y¥À+\\D%HîC •	RÜAJNdïV#gFÃ»vÃ˚ÜqÕ⁄„’£àX2Í)èØ_&÷\rL‹„îy¨‹ hÈ,Á∑ eˆ§0v=C∂ÁäÆÀ´…~ú°qÉAã9Á?7Tñ´y(4πCì∏ã|Û-%¨Ÿõa#wiıáp≥bœ|}?fæ}6<—ÌG??;ï91>˚H3‚q¥s4t¿˚.·›umá=r«.æJ\rFñ¯\'üO6à¨≠t	bQ(Pñ%@∏y2 Ô+`§®w⁄ﬂ6ÛÆV\rÁk«à”∞™ÕV‚éãÕ´ºéuèW|µ-Ü≈Y‡ùôÒ∏Xç†ÏsN¬7ØTº÷wáã“∑Ø\rüüÚó~S%;Ù€•˝∂EﬂCƒqã$^ºPÁs·úWöÀX≤0§\"•	\nFA]ˇ\0\'Y⁄∞*Íõx\"(∂HZtπﬁ‡:-¥É≥^û´S4ˆ+’i°—≈ˇ\02˝<!l±°†\0\0\0\0\0–\0\ZÄ\n≠w—í>!ELoÜf∆·g4¸∆„∏çK’m5ù·ÊÙ≠Î5¥rQŸeíÚaì[KÈﬂsü‡ÔxxÎﬁ∆Òñ>nwU•ú˘x9“≥5P°,Q(Pó“ö°Ω≤F‚…\ZCò·¨®®òâç•Í∂öŒΩ≤#*ôäC¶Õ©`hˇ\0ÕæÈ:7Sü„∑…–iµöø?J∞6Dw-p∂ÙrzÁüa‚—òGâ=ÎE=aW⁄qVUÇﬂT$\"§d°!ÔpûR_K06ëÑF∆GùŒùö,]l›:{VùÙqkM∑Í≤«⁄\\äÙ˘ΩüµiìgÊªÙØ?#‚{¸V~TéUe˛MüòÔ“ß¯¯Ω¯¥¸>©˝™I¸õ?1ﬂ•?èã–¸Z~T˛‘‰˛MüòÔ“ß¯¯Ω¯º¸>©˝©I¸£?1ﬂ•?èã—åO¡Íü⁄åü 3Û˙T˛¢?üÉ◊ˇ\0éˇ\0´í¢û)•åF˜∑?0l£§çv±ÌUŸkº÷\'}óok„ãZ6›ÓXŸDo\nä∫¡0ª\\4YÆ\Zúﬁ ØxÔ4∑1Â≈\\îöŸ@„x\\îS…£¶√ØcõÍπºWXÔØ9¨ÿ≠äÛYx\nÙ∆ƒ¢P°(AÍ¬Òi%d–<≤Fùaﬁ⁄ÂÊÙãF“…è%±€ä´≥$2⁄ühcàÜ´÷àù;„\'“5èWõOl|¸∫}]2∆›\'…’-v“‡–I \0	$Ë\0\rdîo)9DÃB®NtÇ∆;c‹OM√ÜÄ√}™◊Mäi^}eE≠œ/µzCí[-†ï(dàHRÜAJ°êRÜAKÀ •Çî:ã¿N!R÷ëÊYgÃvfÏoY\"›W‹µı9ª™o„=z7ìüHÍªÄ≤°uI@@@@A≈rùìûYOÂ∂Û¬	—≠ÒÎsxë¨vÔ[z\\‹·ûí–◊È˚ qGX˚)Öh°bâBÑ° ﬂQÂû%sYY&n¿¸Ÿ{¡+‡«=a±]^j∆—gó : ¡õQS$çˆ.\Z√÷∆ÿÂÍò©NêÛìQì\'+KV≤0àÑÑBTåÇî$\"(d¡s`.w\rjQ¥œG†RK¸\'ˇ\0Cø·G|ﬁªª˘J\Zÿ·÷^¢–Ò4¥uÑ5§Ë\0íΩ<Do ¸$™Î\\btqËŒñ@Z¿8_Kè‡∞e’c«wü&ﬁ\r\\≥”hÛï¡Ä`—aàb^ÛÈ=€\\U6\\∂Àn+:<+Üú5lñ&a\róÿ˙}c⁄∆⁄	/,;Ä>ì;ãnÕW\Z|ΩÂ>pÁuò;¨ú∫OG6≥µXï\0âB$@@D%ÑBT°!HÙQR…<åä&»Ú\Z÷çd˝:ˆ(õEcyMikœ\rcö›…ÆN©©⁄◊’Q=Å-?πi‹Îuª∏*Ã∫ªZvØ(ı^`Ï¸tçÔŒ}ç=,q\0ÿ„lm\Zö÷ÜÅÿ§⁄g´zµä∆—≤á°Y†        ÊÚÛ\'ø‘i\\÷è?‰ÑÔ;Y‘Féªã>ü/wìWWÉΩ«∑åtPÓiÇ,FÇ∞wpÁf6bÇ%%ï\"Qî°srqíûEîNﬂ¥»4Æ&M‡„¨ˆ\rÜıZ¨¸s√!°“˜U‚∑YÙv´Qæ              ™9R…Cçt\rÛn?hhı\\~Û®Ì„ßnã&}„ÇﬂE>øK¥˜ï˙ˇ\0*Âo*êâDà%)àHRÖÉ…ñI˘C≈lÌÛ,>eßÔ•Éﬁz¥ÈjÛ«z≠4\Z^)Ô-”¡m™≈–ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÉck⁄Z‡“\\“.:#hHùë1ø)RŸyën√‹fÄ“8Ò&}W{ªùÿtÿõm>¢2F”◊Ó°’ËÁÒW›˚8’≤—(@@A(Å©CÆ»\\é~\"Ò,†≤ëß§ÌFB=F€ŒŒΩZ⁄çDcç£´{G£ú≥≈owÓ∫·â±µ¨cCX–\Z÷Å`\0\0\r ¶ffwï¸DDm‘$@@@@@@@@@@@@@@@AååÆÕ á4ãÇ∞A÷°1øUcïºöõ∫l?H“]LNØ˙n?⁄{≈aáY·›S©Ïˇ\0Ú≈˚\nﬁxã$còÒ°Ãp-p<A“¸LLo\nôâ¨Ì/öî\nHYqFÁê÷¥πƒŸ≠\0ó∏≠&vÍDLŒ–∞ÚKìw»[5x1«¨SÉÁÒëËéOR—Õ¨àÂO›i¶ÏÈük/Ï¥†Ö±µ¨cC–\Z÷¥\0–†\0‘´¶fgy\\DDF–˙(HÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÉ_ã`î’≠Õ©Å≤l\"œo¬Ò§vÓô-OvXÚa¶Hˆ£wäÚ[Og:\nâ#\ZNk⁄ŸP±iÔ∫€¶∂›&˘;6ùk3™Ô¬ºï˘π˘¸ss~•oc…«´3aÓÁmÃÚßfÁÊqÕø‘&KAáy;n∞∞ÆK` >zô\rék\Zÿ˚	%ﬂE•}m∫D,±ˆe:⁄f}¶ì‘î#Ï5áQ•!Îyπ∑©|∑øΩ+X1„˜a¥XŸDˇŸ',217657788,9865566,'markrob@ghash.co.nz','www.ghash.co.nz',1,'GHASH COMPANY','GHash'); */
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
