-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: ideal_pay
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_bank_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_branch`
--

DROP TABLE IF EXISTS `bank_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_branch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bank_id` bigint NOT NULL,
  `branch_code` varchar(20) NOT NULL,
  `branch_name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_bank_branch_bank` (`bank_id`),
  CONSTRAINT `fk_bank_branch_bank` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_branch`
--

LOCK TABLES `bank_branch` WRITE;
/*!40000 ALTER TABLE `bank_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_branches_code` (`code`),
  KEY `fk_branches_created_by` (`created_by`),
  KEY `fk_branches_modified_by` (`modified_by`),
  CONSTRAINT `fk_branches_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_branches_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (-1,'DEFAULT','Default Branch','Y','System Default Branch','N/A',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'BR001','Colombo Branch','Y','Main Colombo Branch','Colombo',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(2,'BR002','Kandy Branch','Y','Kandy Regional Branch','Kandy',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(3,'BR003','Galle Branch','Y','Southern Branch','Galle',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(4,'BR004','Jaffna Branch','Y','Northern Branch','Jaffna',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(5,'BR005','Kurunegala Branch','Y','North Western Branch','Kurunegala',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(6,'BR006','Batticaloa Branch','Y','Eastern Branch','Batticaloa',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(7,'BR007','Negombo Branch','Y','Western Branch','Negombo',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(8,'BR008','Matara Branch','Y','Southern Branch','Matara',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(9,'BR009','Anuradhapura Branch','Y','Central North Branch','Anuradhapura',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(10,'BR010','Ratnapura Branch','Y','Sabaragamuwa Branch','Ratnapura',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(11,'BR011','Trincomalee Branch','Y','Eastern Port Branch','Trincomalee',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `contact_person` varchar(150) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `address_email` varchar(150) DEFAULT NULL,
  `telephone` varchar(20) NOT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_company_code` (`code`),
  KEY `fk_company_created_by` (`created_by`),
  KEY `fk_company_modified_by` (`modified_by`),
  CONSTRAINT `fk_company_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_company_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (-1,'DEFAULT','Default Company','Y','System','N/A','N/A','N/A','system@local','0000000000','N/A','system@local','N/A',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'CMP001','Ideal Pay Solutions','Y','John Doe','No 123 Main Street','Floor 2','Colombo','info@idealpay.com','0112345678','0112345679','contact@idealpay.com','logo.png',1,'2026-05-17 15:14:06',1,'2026-05-17 15:14:06');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL DEFAULT '',
  `iso2` char(2) NOT NULL DEFAULT '',
  `iso3` char(3) NOT NULL,
  `phone_code` bigint NOT NULL,
  `postcode_required` char(1) NOT NULL DEFAULT '0',
  `is_eu` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iso2` (`iso2`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (-1,'Default Country','DF','DEF',0,'0','0'),(1,'Andorra','AD','AND',376,'0','0'),(2,'Birleşik Arap Emirlikleri','AE','ARE',971,'0','0'),(3,'Afganistan','AF','AFG',93,'0','0'),(4,'Antigua ve Barbuda','AG','ATG',1268,'0','0'),(5,'Anguilla','AI','AIA',1264,'0','0'),(6,'Arnavutluk','AL','ALB',355,'0','0'),(7,'Ermenistan','AM','ARM',374,'0','0'),(8,'Angola','AO','AGO',244,'0','0'),(9,'Antarktika','AQ','ATA',672,'0','0'),(10,'Arjantin','AR','ARG',54,'0','0'),(11,'Amerikan Samoası','AS','ASM',1684,'0','0'),(12,'Avusturya','AT','AUT',43,'0','1'),(13,'Avustralya','AU','AUS',61,'0','0'),(14,'Aruba','AW','ABW',297,'0','0'),(15,'Åland Adaları','AX','ALA',0,'0','0'),(16,'Azerbaycan','AZ','AZE',994,'0','0'),(17,'Bosna Hersek','BA','BIH',387,'0','0'),(18,'Barbados','BB','BRB',1246,'0','0'),(19,'Bangladeş','BD','BGD',880,'0','0'),(20,'Belçika','BE','BEL',32,'0','1'),(21,'Burkina Faso','BF','BFA',226,'0','0'),(22,'Bulgaristan','BG','BGR',359,'0','1'),(23,'Bahreyn','BH','BHR',973,'0','0'),(24,'Burundi','BI','BDI',257,'0','0'),(25,'Benin','BJ','BEN',229,'0','0'),(26,'Saint Barthélemy','BL','BLM',0,'0','0'),(27,'Bermuda','BM','BMU',1441,'0','0'),(28,'Brunei Darussalam','BN','BRN',673,'0','0'),(29,'Bolivya','BO','BOL',591,'0','0'),(30,'Bonaire, Sint Eustatius ve Saba','BQ','BES',0,'0','0'),(31,'Brezilya','BR','BRA',55,'0','0'),(32,'Bahamalar','BS','BHS',1242,'0','0'),(33,'Butan','BT','BTN',975,'0','0'),(34,'Bouvet Adası','BV','BVT',44,'0','0'),(35,'Botsvana','BW','BWA',267,'0','0'),(36,'Beyaz Rusya','BY','BLR',375,'0','0'),(37,'Belize','BZ','BLZ',501,'0','0'),(38,'Kanada','CA','CAN',1,'0','0'),(39,'Cocos (Keeling) Adaları','CC','CCK',61,'0','0'),(40,'Kongo (Demokratik Cumhuriyeti)','CD','COD',243,'0','0'),(41,'Orta Afrika Cumhuriyeti','CF','CAF',236,'0','0'),(42,'Kongo','CG','COG',242,'0','0'),(43,'İsviçre','CH','CHE',41,'0','0'),(44,'Fildişi Sahili','CI','CIV',225,'0','0'),(45,'Cook Adaları','CK','COK',682,'0','0'),(46,'Şili','CL','CHL',56,'0','0'),(47,'Kamerun','CM','CMR',237,'0','0'),(48,'Çin','CN','CHN',86,'0','0'),(49,'Kolombiya','CO','COL',57,'0','0'),(50,'Kosta Rika','CR','CRI',506,'0','0'),(51,'Küba','CU','CUB',53,'0','0'),(52,'Cape Verde','CV','CPV',238,'0','0'),(53,'Curaçao','CW','CUW',0,'0','0'),(54,'Noel Adası','CX','CXR',61,'0','0'),(55,'Kıbrıs','CY','CYP',357,'0','1'),(56,'Çek Cumhuriyeti','CZ','CZE',420,'0','1'),(57,'Almanya','DE','DEU',49,'0','1'),(58,'Cibuti','DJ','DJI',253,'0','0'),(59,'Danimarka','DK','DNK',45,'0','1'),(60,'Dominika','DM','DMA',1767,'0','0'),(61,'Dominik Cumhuriyeti','DO','DOM',1809,'0','0'),(62,'Cezayir','DZ','DZA',213,'0','0'),(63,'Ekvador','EC','ECU',593,'0','0'),(64,'Estonya','EE','EST',372,'0','1'),(65,'Mısır','EG','EGY',20,'0','0'),(66,'Batı Sahra','EH','ESH',0,'0','0'),(67,'Eritre','ER','ERI',291,'0','0'),(68,'İspanya','ES','ESP',34,'0','1'),(69,'Etiyopya','ET','ETH',251,'0','0'),(70,'Finlandiya','FI','FIN',358,'0','1'),(71,'Fiji','FJ','FJI',679,'0','0'),(72,'Falkland Adaları (Malvinas)','FK','FLK',500,'0','0'),(73,'Mikronezya (Federal Devletler)','FM','FSM',691,'0','0'),(74,'Faroe Adaları','FO','FRO',298,'0','0'),(75,'Fransa','FR','FRA',33,'0','1'),(76,'Gabon','GA','GAB',241,'0','0'),(77,'Birleşik Krallık','GB','GBR',44,'1','1'),(78,'Grenada','GD','GRD',1473,'0','0'),(79,'Gürcistan','GE','GEO',995,'0','0'),(80,'Fransız Guyanası','GF','GUF',594,'0','0'),(81,'Guernsey','GG','GGY',0,'0','0'),(82,'Gana','GH','GHA',233,'0','0'),(83,'Cebelitarık','GI','GIB',350,'0','0'),(84,'Grönland','GL','GRL',299,'0','0'),(85,'Gambiya','GM','GMB',220,'0','0'),(86,'Gine','GN','GIN',224,'0','0'),(87,'Guadeloupe','GP','GLP',590,'0','0'),(88,'Ekvator Ginesi','GQ','GNQ',240,'0','0'),(89,'Yunanistan','GR','GRC',30,'0','1'),(90,'Güney Georgia ve Güney Sandwich Adaları','GS','SGS',44,'0','0'),(91,'Guatemala','GT','GTM',502,'0','0'),(92,'Guam','GU','GUM',1671,'0','0'),(93,'Gine-Bissau','GW','GNB',245,'0','0'),(94,'Guyana','GY','GUY',592,'0','0'),(95,'Hong Kong','HK','HKG',852,'0','0'),(96,'Heard Adası ve McDonald Adaları','HM','HMD',44,'0','0'),(97,'Honduras','HN','HND',504,'0','0'),(98,'Hırvatistan (Hrvatska)','HR','HRV',385,'0','1'),(99,'Haiti','HT','HTI',509,'0','0'),(100,'Macaristan','HU','HUN',36,'0','1'),(101,'Endonezya','ID','IDN',62,'0','0'),(102,'İrlanda','IE','IRL',353,'0','1'),(103,'İsrail','IL','ISR',972,'0','0'),(104,'Man Adası','IM','IMN',0,'0','0'),(105,'Hindistan','IN','IND',91,'0','0'),(106,'İngiliz Hint Okyanusu Bölgesi','IO','IOT',0,'0','0'),(107,'Irak','IQ','IRQ',964,'0','0'),(108,'İran (İslam Cumhuriyeti)','IR','IRN',98,'0','0'),(109,'İzlanda','IS','ISL',354,'0','0'),(110,'İtalya','IT','ITA',39,'0','1'),(111,'Jersey','JE','JEY',0,'0','1'),(112,'Jamaika','JM','JAM',1876,'0','0'),(113,'Ürdün','JO','JOR',962,'0','0'),(114,'Japonya','JP','JPN',81,'0','0'),(115,'Kenya','KE','KEN',254,'0','0'),(116,'Kırgızistan','KG','KGZ',996,'0','0'),(117,'Kamboçya','KH','KHM',855,'0','0'),(118,'Kiribati','KI','KIR',686,'0','0'),(119,'Komorlar','KM','COM',269,'0','0'),(120,'Saint Kitts ve Nevis','KN','KNA',1869,'0','0'),(121,'Kore (Demokratik Halk Cumhuriyeti)','KP','PRK',850,'0','0'),(122,'Kore (Cumhuriyeti)','KR','KOR',82,'0','0'),(123,'Kuveyt','KW','KWT',965,'0','0'),(124,'Cayman Adaları','KY','CYM',1345,'0','0'),(125,'Kazakistan','KZ','KAZ',7,'0','0'),(126,'Lao Halk Demokratik Cumhuriyeti','LA','LAO',856,'0','0'),(127,'Lübnan','LB','LBN',961,'0','0'),(128,'Saint Lucia','LC','LCA',1758,'0','0'),(129,'Lihtenştayn','LI','LIE',423,'0','0'),(130,'Sri Lanka','LK','LKA',94,'0','0'),(131,'Liberya','LR','LBR',231,'0','0'),(132,'Lesotho','LS','LSO',266,'0','0'),(133,'Litvanya','LT','LTU',370,'0','1'),(134,'Lüksemburg','LU','LUX',352,'0','1'),(135,'Letonya','LV','LVA',371,'0','1'),(136,'Libya','LY','LBY',218,'0','0'),(137,'Fas','MA','MAR',212,'0','0'),(138,'Monako','MC','MCO',377,'0','0'),(139,'Moldova (Cumhuriyeti)','MD','MDA',373,'0','0'),(140,'Karadağ','ME','MNE',382,'0','0'),(141,'Saint Martin (Fransız kısmı)','MF','MAF',0,'0','0'),(142,'Madagaskar','MG','MDG',261,'0','0'),(143,'Marshall Adaları','MH','MHL',692,'0','0'),(144,'Makedonya','MK','MKD',389,'0','0'),(145,'Mali','ML','MLI',223,'0','0'),(146,'Myanmar','MM','MMR',95,'0','0'),(147,'Moğolistan','MN','MNG',976,'0','0'),(148,'Makau','MO','MAC',853,'0','0'),(149,'Kuzey Mariana Adaları','MP','MNP',1670,'0','0'),(150,'Martinik','MQ','MTQ',596,'0','0'),(151,'Moritanya','MR','MRT',222,'0','0'),(152,'Montserrat','MS','MSR',1664,'0','0'),(153,'Malta','MT','MLT',356,'0','1'),(154,'Mauritius','MU','MUS',230,'0','0'),(155,'Maldivler','MV','MDV',960,'0','0'),(156,'Malavi','MW','MWI',265,'0','0'),(157,'Meksika','MX','MEX',52,'0','0'),(158,'Malezya','MY','MYS',60,'0','0'),(159,'Mozambik','MZ','MOZ',258,'0','0'),(160,'Namibya','NA','NAM',264,'0','0'),(161,'Yeni Kaledonya','NC','NCL',687,'0','0'),(162,'Nijer','NE','NER',227,'0','0'),(163,'Norfolk Adası','NF','NFK',672,'0','0'),(164,'Nijerya','NG','NGA',234,'0','0'),(165,'Nikaragua','NI','NIC',505,'0','0'),(166,'Hollanda','NL','NLD',31,'0','1'),(167,'Norveç','NO','NOR',47,'0','0'),(168,'Nepal','NP','NPL',977,'0','0'),(169,'Nauru','NR','NRU',674,'0','0'),(170,'Niue','NU','NIU',683,'0','0'),(171,'Yeni Zelanda','NZ','NZL',64,'0','0'),(172,'Umman','OM','OMN',968,'0','0'),(173,'Panama','PA','PAN',507,'0','0'),(174,'Peru','PE','PER',51,'0','0'),(175,'Fransız Polinezyası','PF','PYF',689,'0','0'),(176,'Papua Yeni Gine','PG','PNG',675,'0','0'),(177,'Filipinler','PH','PHL',63,'0','0'),(178,'Pakistan','PK','PAK',92,'0','0'),(179,'Polonya','PL','POL',48,'0','1'),(180,'Saint Pierre ve Miquelon','PM','SPM',508,'0','0'),(181,'Pitcairn','PN','PCN',870,'0','0'),(182,'Porto Riko','PR','PRI',1,'0','0'),(183,'Filistin','PS','PSE',0,'0','0'),(184,'Portekiz','PT','PRT',351,'0','1'),(185,'Palau','PW','PLW',680,'0','0'),(186,'Paraguay','PY','PRY',595,'0','0'),(187,'Katar','QA','QAT',974,'0','0'),(188,'Reunion','RE','REU',262,'0','0'),(189,'Romanya','RO','ROU',40,'0','1'),(190,'Sırbistan','RS','SRB',381,'0','0'),(191,'Rusya Federasyonu','RU','RUS',7,'0','0'),(192,'Ruanda','RW','RWA',250,'0','0'),(193,'Suudi Arabistan','SA','SAU',966,'0','0'),(194,'Süleyman Adaları','SB','SLB',677,'0','0'),(195,'Seyşeller','SC','SYC',248,'0','0'),(196,'Sudan','SD','SDN',249,'0','0'),(197,'İsveç','SE','SWE',46,'0','1'),(198,'Singapur','SG','SGP',65,'0','0'),(199,'Saint Helena, Ascension ve Tristan da Cunha','SH','SHN',290,'0','0'),(200,'Slovenya','SI','SVN',386,'0','1'),(201,'Svalbard ve Jan Mayen','SJ','SJM',0,'0','0'),(202,'Slovakya','SK','SVK',421,'0','1'),(203,'Sierra Leone','SL','SLE',232,'0','0'),(204,'San Marino','SM','SMR',378,'0','0'),(205,'Senegal','SN','SEN',221,'0','0'),(206,'Somali','SO','SOM',252,'0','0'),(207,'Surinam','SR','SUR',597,'0','0'),(208,'Güney Sudan','SS','SSD',0,'0','0'),(209,'Sao Tome ve Principe','ST','STP',239,'0','0'),(210,'El Salvador','SV','SLV',503,'0','0'),(211,'Sint Maarten (Hollanda kısmı)','SX','SXM',0,'0','0'),(212,'Suriye Arap Cumhuriyeti','SY','SYR',963,'0','0'),(213,'Svaziland','SZ','SWZ',268,'0','0'),(214,'Turks ve Caicos Adaları','TC','TCA',1649,'0','0'),(215,'Çad','TD','TCD',235,'0','0'),(216,'Fransız Güney Toprakları','TF','ATF',44,'0','0'),(217,'Togo','TG','TGO',228,'0','0'),(218,'Tayland','TH','THA',66,'0','0'),(219,'Tacikistan','TJ','TJK',992,'0','0'),(220,'Tokelau','TK','TKL',690,'0','0'),(221,'Doğu Timor','TL','TLS',670,'0','0'),(222,'Türkmenistan','TM','TKM',993,'0','0'),(223,'Tunus','TN','TUN',216,'0','0'),(224,'Tonga','TO','TON',676,'0','0'),(225,'Türkiye','TR','TUR',90,'0','0'),(226,'Trinidad ve Tobago','TT','TTO',1868,'0','0'),(227,'Tuvalu','TV','TUV',688,'0','0'),(228,'Tayvan','TW','TWN',886,'0','0'),(229,'Tanzanya, Birleşik Cumhuriyeti','TZ','TZA',255,'0','0'),(230,'Ukrayna','UA','UKR',380,'0','0'),(231,'Uganda','UG','UGA',256,'0','0'),(232,'Birleşik Devletler Çevresindeki Küçük Adalar','UM','UMI',44,'0','0'),(233,'Amerika Birleşik Devletleri','US','USA',1,'0','0'),(234,'Uruguay','UY','URY',598,'0','0'),(235,'Özbekistan','UZ','UZB',998,'0','0'),(236,'Vatikan Şehir Devleti','VA','VAT',39,'0','0'),(237,'Saint Vincent ve Grenadinler','VC','VCT',1784,'0','0'),(238,'Venezuela','VE','VEN',58,'0','0'),(239,'Virgin Adaları (İngiliz)','VG','VGB',1284,'0','0'),(240,'Virgin Adaları (ABD)','VI','VIR',1340,'0','0'),(241,'Viet Nam','VN','VNM',84,'0','0'),(242,'Vanuatu','VU','VUT',678,'0','0'),(243,'Wallis ve Futuna','WF','WLF',681,'0','0'),(244,'Samoa','WS','WSM',685,'0','0'),(245,'Yemen','YE','YEM',967,'0','0'),(246,'Mayotte','YT','MYT',262,'0','0'),(247,'Güney Afrika','ZA','ZAF',27,'0','0'),(248,'Zambiya','ZM','ZMB',260,'0','0'),(249,'Zimbabve','ZW','ZWE',263,'0','0');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_department_code` (`code`),
  KEY `fk_department_created_by` (`created_by`),
  KEY `fk_department_modified_by` (`modified_by`),
  CONSTRAINT `fk_department_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_department_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (-1,'DEFAULT','Default Department','Y','System Default Department',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'DEP001','Human Resources','Y','HR Department',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(2,'DEP002','Finance','Y','Finance Department',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(3,'DEP003','IT','Y','IT Department',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(4,'DEP004','Payroll','Y','Payroll Department',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(5,'DEP005','Administration','Y','Admin Department',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(6,'DEP006','Operations','Y','Operations Department',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(7,'DEP007','Sales','Y','Sales Department',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(8,'DEP008','Marketing','Y','Marketing Department',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(9,'DEP009','Procurement','Y','Procurement Department',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(10,'DEP010','Security','Y','Security Department',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(11,'DEP011','Legal','Y','Legal Department',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_designations_code` (`code`),
  KEY `fk_designations_created_by` (`created_by`),
  KEY `fk_designations_modified_by` (`modified_by`),
  CONSTRAINT `fk_designations_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_designations_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (-1,'DEFAULT','Default Designation','Y','System Default Designation',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'DS001','Software Engineer','Y','Software Engineer',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(2,'DS002','Senior Engineer','Y','Senior Engineer',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(3,'DS003','Team Lead','N','Team Lead',1,'2026-05-17 13:34:49',1,'2026-05-19 04:09:29'),(4,'DS004','HR Executive','Y','HR Executive',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(5,'DS005','Accountant','N','Accountant',1,'2026-05-17 13:34:49',1,'2026-05-19 04:09:29'),(6,'DS006','Payroll Officer','Y','Payroll Officer',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(7,'DS007','Manager','Y','Manager',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(8,'DS008','Director','Y','Director',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(9,'DS009','Clerk','Y','Clerk',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(10,'DS010','QA Engineer','Y','QA Engineer',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(11,'DS011','Support Engineer','Y','Support Engineer',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49');
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_fa`
--

DROP TABLE IF EXISTS `emp_fa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_fa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `emp_id` bigint NOT NULL,
  `fa_id` bigint NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `payroll_month` varchar(20) NOT NULL,
  `is_processed` char(1) NOT NULL DEFAULT 'N',
  `processed_date` datetime DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_emp_fa_emp_id` (`emp_id`),
  KEY `fk_emp_fa_fa_id` (`fa_id`),
  KEY `fk_emp_fa_created_by` (`created_by`),
  KEY `fk_emp_fa_modified_by` (`modified_by`),
  CONSTRAINT `fk_emp_fa_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_emp_fa_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_emp_fa_fa_id` FOREIGN KEY (`fa_id`) REFERENCES `fixed_allowance` (`id`),
  CONSTRAINT `fk_emp_fa_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_fa`
--

LOCK TABLES `emp_fa` WRITE;
/*!40000 ALTER TABLE `emp_fa` DISABLE KEYS */;
INSERT INTO `emp_fa` VALUES (-1,-1,-1,0.00,'MMYYYY','0',NULL,-1,'2026-05-18 14:39:05',-1,'2026-05-18 14:39:05'),(1,1,1,15000.00,'2026-01','Y','2026-05-25 08:23:02',1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(2,2,2,12000.00,'2026-01','Y','2026-05-25 08:23:02',1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(3,3,3,8000.00,'2026-01','N',NULL,1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(4,4,1,10000.00,'2026-01','Y','2026-05-25 08:23:02',1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(5,5,4,5000.00,'2026-01','N',NULL,1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(6,6,2,14000.00,'2026-02','Y','2026-05-25 08:23:02',1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(7,7,5,7500.00,'2026-02','N',NULL,1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(8,8,1,16000.00,'2026-02','Y','2026-05-25 08:23:02',1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(9,9,3,9500.00,'2026-02','N',NULL,1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(10,10,4,11000.00,'2026-02','Y','2026-05-25 08:23:02',1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02');
/*!40000 ALTER TABLE `emp_fa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_fd`
--

DROP TABLE IF EXISTS `emp_fd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_fd` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `emp_id` bigint NOT NULL,
  `fd_id` bigint NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `payroll_month` varchar(20) NOT NULL,
  `is_processed` tinyint(1) NOT NULL DEFAULT '0',
  `processed_date` datetime DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_emp_fd_emp_id` (`emp_id`),
  KEY `fk_emp_fd_fd_id` (`fd_id`),
  KEY `fk_emp_fd_created_by` (`created_by`),
  KEY `fk_emp_fd_modified_by` (`modified_by`),
  CONSTRAINT `fk_emp_fd_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_emp_fd_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_emp_fd_fd_id` FOREIGN KEY (`fd_id`) REFERENCES `fixed_deduction` (`id`),
  CONSTRAINT `fk_emp_fd_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_fd`
--

LOCK TABLES `emp_fd` WRITE;
/*!40000 ALTER TABLE `emp_fd` DISABLE KEYS */;
INSERT INTO `emp_fd` VALUES (-1,-1,-1,0.00,'MMYYYY',0,NULL,-1,'2026-05-18 14:39:05',-1,'2026-05-18 14:39:05'),(1,1,1,2500.00,'2026-01',1,'2026-05-25 08:23:57',1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(2,2,2,1800.00,'2026-01',1,'2026-05-25 08:23:57',1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(3,3,3,3200.00,'2026-01',0,NULL,1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(4,4,1,1500.00,'2026-01',1,'2026-05-25 08:23:57',1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(5,5,4,4100.00,'2026-01',0,NULL,1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(6,6,2,2750.00,'2026-02',1,'2026-05-25 08:23:57',1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(7,7,5,1950.00,'2026-02',0,NULL,1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(8,8,1,3600.00,'2026-02',1,'2026-05-25 08:23:57',1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(9,9,3,2900.00,'2026-02',0,NULL,1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(10,10,4,2250.00,'2026-02',1,'2026-05-25 08:23:57',1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57');
/*!40000 ALTER TABLE `emp_fd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_np`
--

DROP TABLE IF EXISTS `emp_np`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_np` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `emp_id` bigint NOT NULL,
  `nopay_id` bigint NOT NULL,
  `days` decimal(5,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `payroll_month` varchar(20) DEFAULT NULL,
  `is_processed` char(1) NOT NULL DEFAULT 'N',
  `processed_date` datetime DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_emp_np_emp` (`emp_id`),
  KEY `fk_emp_np_nopay` (`nopay_id`),
  KEY `fk_emp_np_created_by` (`created_by`),
  KEY `fk_emp_np_modified_by` (`modified_by`),
  CONSTRAINT `fk_emp_np_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_emp_np_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_emp_np_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_emp_np_nopay` FOREIGN KEY (`nopay_id`) REFERENCES `nopay_days` (`id`),
  CONSTRAINT `chk_emp_np_processed` CHECK ((`is_processed` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_np`
--

LOCK TABLES `emp_np` WRITE;
/*!40000 ALTER TABLE `emp_np` DISABLE KEYS */;
INSERT INTO `emp_np` VALUES (-1,-1,-1,0.00,0.00,NULL,'N',NULL,-1,'2026-05-24 04:01:41',-1,'2026-05-24 04:01:41');
/*!40000 ALTER TABLE `emp_np` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_ot`
--

DROP TABLE IF EXISTS `emp_ot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_ot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `emp_id` bigint NOT NULL,
  `overtime_id` bigint NOT NULL,
  `hours` decimal(5,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `payroll_month` varchar(20) DEFAULT NULL,
  `is_processed` char(1) NOT NULL DEFAULT 'N',
  `processed_date` datetime DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_emp_ot_emp` (`emp_id`),
  KEY `fk_emp_ot_overtime` (`overtime_id`),
  KEY `fk_emp_ot_created_by` (`created_by`),
  KEY `fk_emp_ot_modified_by` (`modified_by`),
  CONSTRAINT `fk_emp_ot_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_emp_ot_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_emp_ot_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_emp_ot_overtime` FOREIGN KEY (`overtime_id`) REFERENCES `overtime` (`id`),
  CONSTRAINT `chk_emp_ot_processed` CHECK ((`is_processed` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_ot`
--

LOCK TABLES `emp_ot` WRITE;
/*!40000 ALTER TABLE `emp_ot` DISABLE KEYS */;
INSERT INTO `emp_ot` VALUES (-1,-1,-1,0.00,0.00,NULL,'N',NULL,-1,'2026-05-24 04:06:37',-1,'2026-05-24 04:06:37'),(1,1,1,12.50,8500.00,'2026-01','Y','2026-05-25 08:22:13',1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(2,2,1,8.00,5200.00,'2026-01','Y','2026-05-25 08:22:13',1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(3,3,2,15.75,11250.00,'2026-01','N',NULL,1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(4,4,2,6.50,4300.00,'2026-01','Y','2026-05-25 08:22:13',1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(5,5,1,10.00,7000.00,'2026-01','N',NULL,1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(6,6,3,18.00,13500.00,'2026-02','Y','2026-05-25 08:22:13',1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(7,7,2,5.25,3900.00,'2026-02','N',NULL,1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(8,8,1,20.00,15000.00,'2026-02','Y','2026-05-25 08:22:13',1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(9,9,3,7.50,5600.00,'2026-02','N',NULL,1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(10,10,2,11.00,8200.00,'2026-02','Y','2026-05-25 08:22:13',1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13');
/*!40000 ALTER TABLE `emp_ot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_type`
--

DROP TABLE IF EXISTS `emp_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_emp_type_code` (`code`),
  KEY `fk_emp_type_created_by` (`created_by`),
  KEY `fk_emp_type_modified_by` (`modified_by`),
  CONSTRAINT `fk_emp_type_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_emp_type_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_type`
--

LOCK TABLES `emp_type` WRITE;
/*!40000 ALTER TABLE `emp_type` DISABLE KEYS */;
INSERT INTO `emp_type` VALUES (-1,'DEFAULT','Default Employee Type','Y','System Default Employee Type',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'ET001','Permanent','Y','Permanent Employee',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(2,'ET002','Contract','Y','Contract Employee',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(3,'ET003','Temporary','Y','Temporary Employee',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(4,'ET004','Intern','Y','Intern Employee',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(5,'ET005','Part Time','Y','Part Time Employee',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(6,'ET006','Consultant','Y','Consultant',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(7,'ET007','Probation','Y','Probation Employee',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(8,'ET008','Remote','Y','Remote Employee',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(9,'ET009','Freelance','Y','Freelancer',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(10,'ET010','Seasonal','Y','Seasonal Employee',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(11,'ET011','Casual','Y','Casual Employee',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49');
/*!40000 ALTER TABLE `emp_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_va`
--

DROP TABLE IF EXISTS `emp_va`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_va` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `emp_id` bigint NOT NULL,
  `va_id` bigint NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `payroll_month` varchar(20) DEFAULT NULL,
  `is_processed` char(1) NOT NULL DEFAULT 'N',
  `processed_date` datetime DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_emp_va_emp` (`emp_id`),
  KEY `fk_emp_va_va` (`va_id`),
  KEY `fk_emp_va_created_by` (`created_by`),
  KEY `fk_emp_va_modified_by` (`modified_by`),
  CONSTRAINT `fk_emp_va_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_emp_va_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_emp_va_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_emp_va_va` FOREIGN KEY (`va_id`) REFERENCES `variable_allowance` (`id`),
  CONSTRAINT `chk_emp_va_processed` CHECK ((`is_processed` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_va`
--

LOCK TABLES `emp_va` WRITE;
/*!40000 ALTER TABLE `emp_va` DISABLE KEYS */;
INSERT INTO `emp_va` VALUES (-1,-1,-1,0.00,NULL,'N',NULL,-1,'2026-05-24 03:50:15',-1,'2026-05-24 03:50:15');
/*!40000 ALTER TABLE `emp_va` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_vd`
--

DROP TABLE IF EXISTS `emp_vd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_vd` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `emp_id` bigint NOT NULL,
  `vd_id` bigint NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `payroll_month` varchar(20) DEFAULT NULL,
  `is_processed` char(1) NOT NULL DEFAULT 'N',
  `processed_date` datetime DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_emp_vd_emp` (`emp_id`),
  KEY `fk_emp_vd_vd` (`vd_id`),
  KEY `fk_emp_vd_created_by` (`created_by`),
  KEY `fk_emp_vd_modified_by` (`modified_by`),
  CONSTRAINT `fk_emp_vd_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_emp_vd_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_emp_vd_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_emp_vd_vd` FOREIGN KEY (`vd_id`) REFERENCES `variable_deduction` (`id`),
  CONSTRAINT `chk_emp_vd_processed` CHECK ((`is_processed` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_vd`
--

LOCK TABLES `emp_vd` WRITE;
/*!40000 ALTER TABLE `emp_vd` DISABLE KEYS */;
INSERT INTO `emp_vd` VALUES (-1,-1,-1,0.00,NULL,'N',NULL,-1,'2026-05-24 03:52:40',-1,'2026-05-24 03:52:40');
/*!40000 ALTER TABLE `emp_vd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_no` varchar(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nic` varchar(15) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `remarks` varchar(500) DEFAULT NULL,
  `payroll_name` varchar(150) NOT NULL,
  `epf_no` varchar(50) DEFAULT NULL,
  `etf_no` varchar(50) DEFAULT NULL,
  `basic_salary` decimal(10,2) DEFAULT '0.00',
  `joined_date` date NOT NULL,
  `employee_type_id` bigint NOT NULL,
  `nopay_days_id` bigint NOT NULL,
  `job_category_id` bigint NOT NULL,
  `designation_id` bigint NOT NULL,
  `branch_id` bigint NOT NULL,
  `grade_id` bigint NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `adrs_line1` varchar(255) DEFAULT NULL,
  `adrs_line2` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `country_id` bigint NOT NULL,
  `contact_person` varchar(150) DEFAULT NULL,
  `cp_address` varchar(255) DEFAULT NULL,
  `cp_contact_number` varchar(20) DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_employee_no` (`employee_no`),
  KEY `fk_employee_emp_type` (`employee_type_id`),
  KEY `fk_employee_nopay_days` (`nopay_days_id`),
  KEY `fk_employee_job_category` (`job_category_id`),
  KEY `fk_employee_designation` (`designation_id`),
  KEY `fk_employee_branch` (`branch_id`),
  KEY `fk_employee_grade` (`grade_id`),
  KEY `fk_employee_created_by` (`created_by`),
  KEY `fk_employee_modified_by` (`modified_by`),
  KEY `fk_employee_country_id` (`country_id`),
  CONSTRAINT `fk_employee_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `fk_employee_country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `fk_employee_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_employee_designation` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`),
  CONSTRAINT `fk_employee_emp_type` FOREIGN KEY (`employee_type_id`) REFERENCES `emp_type` (`id`),
  CONSTRAINT `fk_employee_grade` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `fk_employee_job_category` FOREIGN KEY (`job_category_id`) REFERENCES `job_category` (`id`),
  CONSTRAINT `fk_employee_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_employee_nopay_days` FOREIGN KEY (`nopay_days_id`) REFERENCES `nopay_days` (`id`),
  CONSTRAINT `chk_employee_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (-1,'DEFAULT','System','Employee',NULL,NULL,'Y','Default Record','System Employee','N/A','N/A',0.00,'2026-05-17',-1,-1,-1,-1,-1,-1,'0000000000','system@local','N/A','N/A','N/A','N/A',-1,'N/A','N/A','N/A',-1,'2026-05-17 12:34:46',-1,'2026-05-19 11:21:04'),(1,'EMP001','John','Fernando','1990-01-15','901234567V','Y','Active employee','John Fernando','EPF001','ETF001',85000.00,'2022-01-10',1,1,1,1,1,1,'0771000001','john1@idealpay.com','No 10','Main Street','Colombo','Colombo',1,'Mary Fernando','No 10 Main Street','0779000001',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(2,'EMP002','Kamal','Perera','1988-03-21','881234568V','Y','Senior staff','Kamal Perera','EPF002','ETF002',95000.00,'2021-05-12',1,1,2,2,2,2,'0771000002','kamal2@idealpay.com','No 20','Lake Road','Kandy','Kandy',1,'Nimali Perera','No 20 Lake Road','0779000002',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(3,'EMP003','Nimal','Silva','1992-07-11','921234569V','Y','IT employee','Nimal Silva','EPF003','ETF003',78000.00,'2023-02-01',1,1,1,3,1,1,'0771000003','nimal3@idealpay.com','No 30','Temple Road','Galle','Galle',1,'Suneth Silva','No 30 Temple Road','0779000003',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(4,'EMP004','Saman','Jayasinghe','1991-09-19','911234570V','Y','Finance staff','Saman Jayasinghe','EPF004','ETF004',88000.00,'2020-03-14',2,1,3,4,2,2,'0771000004','saman4@idealpay.com','No 40','Flower Road','Kurunegala','Kurunegala',1,'Anoma Jayasinghe','No 40 Flower Road','0779000004',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(5,'EMP005','Ruwan','Dias','1987-12-05','871234571V','Y','HR Executive','Ruwan Dias','EPF005','ETF005',92000.00,'2019-08-22',2,1,2,5,3,3,'0771000005','ruwan5@idealpay.com','No 50','Station Road','Matara','Matara',1,'Kumari Dias','No 50 Station Road','0779000005',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(6,'EMP006','Tharindu','Peris','1993-11-12','931234572V','Y','Operations staff','Tharindu Peris','EPF006','ETF006',73000.00,'2024-01-01',1,1,4,2,1,1,'0771000006','tharindu6@idealpay.com','No 60','Park Lane','Negombo','Gampaha',1,'Rashmi Peris','No 60 Park Lane','0779000006',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(7,'EMP007','Ashan','Fernando','1995-05-17','951234573V','Y','Support engineer','Ashan Fernando','EPF007','ETF007',67000.00,'2023-07-10',1,1,1,3,2,2,'0771000007','ashan7@idealpay.com','No 70','Sea Road','Kalutara','Kalutara',1,'Nadeesha Fernando','No 70 Sea Road','0779000007',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(8,'EMP008','Dilshan','Gunawardena','1990-08-23','901234574V','Y','Marketing executive','Dilshan Gunawardena','EPF008','ETF008',81000.00,'2021-11-15',2,1,5,6,3,2,'0771000008','dilshan8@idealpay.com','No 80','Market Street','Jaffna','Jaffna',1,'Chathuri Gunawardena','No 80 Market Street','0779000008',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(9,'EMP009','Charith','Silva','1989-06-10','891234575V','Y','Sales executive','Charith Silva','EPF009','ETF009',76000.00,'2022-04-18',1,1,5,6,2,1,'0771000009','charith9@idealpay.com','No 90','Hospital Road','Badulla','Badulla',1,'Piumi Silva','No 90 Hospital Road','0779000009',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(10,'EMP010','Kasun','Madushanka','1994-04-09','941234576V','Y','Junior accountant','Kasun Madushanka','EPF010','ETF010',69000.00,'2023-09-20',1,1,3,4,1,1,'0771000010','kasun10@idealpay.com','No 100','River Road','Anuradhapura','Anuradhapura',1,'Sanduni Madushanka','No 100 River Road','0779000010',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(11,'EMP011','Isuru','Perera','1991-10-14','911234577V','Y','Warehouse staff','Isuru Perera','EPF011','ETF011',64000.00,'2022-05-11',1,1,4,2,3,1,'0771000011','isuru11@idealpay.com','No 11','Hill Street','Ratnapura','Ratnapura',1,'Nilmini Perera','No 11 Hill Street','0779000011',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(12,'EMP012','Ravindu','Silva','1988-02-27','881234578V','Y','System admin','Ravindu Silva','EPF012','ETF012',120000.00,'2018-01-15',2,1,1,1,1,3,'0771000012','ravindu12@idealpay.com','No 12','Palm Avenue','Colombo','Colombo',1,'Sachini Silva','No 12 Palm Avenue','0779000012',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(13,'EMP013','Nuwan','Fernando','1996-12-01','961234579V','Y','Support staff','Nuwan Fernando','EPF013','ETF013',58000.00,'2024-03-01',1,1,7,7,2,1,'0771000013','nuwan13@idealpay.com','No 13','Church Road','Panadura','Kalutara',1,'Maleesha Fernando','No 13 Church Road','0779000013',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(14,'EMP014','Sachin','Peris','1992-01-08','921234580V','Y','Developer','Sachin Peris','EPF014','ETF014',98000.00,'2021-06-16',1,1,1,3,1,2,'0771000014','sachin14@idealpay.com','No 14','Green Road','Moratuwa','Colombo',1,'Yasasvi Peris','No 14 Green Road','0779000014',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(15,'EMP015','Lahiru','Jayasuriya','1993-07-07','931234581V','Y','Analyst','Lahiru Jayasuriya','EPF015','ETF015',83000.00,'2020-12-10',1,1,3,4,2,2,'0771000015','lahiru15@idealpay.com','No 15','Canal Road','Hambantota','Hambantota',1,'Harini Jayasuriya','No 15 Canal Road','0779000015',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(16,'EMP016','Prabath','Fernando','1987-11-03','871234582V','Y','Manager','Prabath Fernando','EPF016','ETF016',140000.00,'2017-09-01',2,1,4,1,1,3,'0771000016','prabath16@idealpay.com','No 16','Sunset Road','Colombo','Colombo',1,'Dilini Fernando','No 16 Sunset Road','0779000016',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(17,'EMP017','Roshan','Perera','1995-09-29','951234583V','Y','Coordinator','Roshan Perera','EPF017','ETF017',72000.00,'2023-01-05',1,1,2,5,3,1,'0771000017','roshan17@idealpay.com','No 17','Temple Lane','Kegalle','Kegalle',1,'Pabasara Perera','No 17 Temple Lane','0779000017',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(18,'EMP018','Madhawa','Silva','1994-06-18','941234584V','Y','Assistant','Madhawa Silva','EPF018','ETF018',61000.00,'2022-08-20',1,1,7,7,2,1,'0771000018','madhawa18@idealpay.com','No 18','Cross Street','Trincomalee','Trincomalee',1,'Ruwini Silva','No 18 Cross Street','0779000018',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(19,'EMP019','Danushka','Dias','1990-03-13','901234585V','Y','Executive','Danushka Dias','EPF019','ETF019',89000.00,'2021-10-11',2,1,5,6,1,2,'0771000019','danushka19@idealpay.com','No 19','Lake View','Batticaloa','Batticaloa',1,'Pavithra Dias','No 19 Lake View','0779000019',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(20,'EMP020','Shehan','Fernando','1989-08-08','891234586V','Y','Senior Developer','Shehan Fernando','EPF020','ETF020',135000.00,'2019-04-01',2,1,1,1,1,3,'0771000020','shehan20@idealpay.com','No 20','Marine Drive','Colombo','Colombo',1,'Keshani Fernando','No 20 Marine Drive','0779000020',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(21,'EMP021','Ayesh','Perera','1991-12-24','911234587V','Y','QA Engineer','Ayesh Perera','EPF021','ETF021',87000.00,'2020-06-21',1,1,1,3,2,2,'0771000021','ayesh21@idealpay.com','No 21','Railway Road','Gampaha','Gampaha',1,'Thilini Perera','No 21 Railway Road','0779000021',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(22,'EMP022','Kavindu','Silva','1996-05-14','961234588V','Y','Support Officer','Kavindu Silva','EPF022','ETF022',55000.00,'2024-02-12',1,1,7,7,3,1,'0771000022','kavindu22@idealpay.com','No 22','Hill Road','Matale','Matale',1,'Shenali Silva','No 22 Hill Road','0779000022',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(23,'EMP023','Pasindu','Fernando','1993-04-02','931234589V','Y','Operations Executive','Pasindu Fernando','EPF023','ETF023',79000.00,'2021-09-15',1,1,4,2,1,2,'0771000023','pasindu23@idealpay.com','No 23','Main Avenue','Nuwara Eliya','Nuwara Eliya',1,'Dinithi Fernando','No 23 Main Avenue','0779000023',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(24,'EMP024','Thilina','Jayawardena','1992-07-20','921234590V','Y','Sales Manager','Thilina Jayawardena','EPF024','ETF024',115000.00,'2018-11-05',2,1,5,6,2,3,'0771000024','thilina24@idealpay.com','No 24','Queens Road','Kurunegala','Kurunegala',1,'Hashini Jayawardena','No 24 Queens Road','0779000024',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27'),(25,'EMP025','Vishwa','Gunasekara','1990-10-10','901234591V','Y','HR Manager','Vishwa Gunasekara','EPF025','ETF025',125000.00,'2017-07-17',2,1,2,5,1,3,'0771000025','vishwa25@idealpay.com','No 25','Flower Garden','Colombo','Colombo',1,'Rashika Gunasekara','No 25 Flower Garden','0779000025',1,'2026-05-20 02:28:27',1,'2026-05-20 02:28:27');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_allowance`
--

DROP TABLE IF EXISTS `fixed_allowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixed_allowance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `is_taxable` varchar(1) NOT NULL DEFAULT 'N',
  `is_active` char(1) NOT NULL DEFAULT 'N',
  `liable_for_epf` char(1) NOT NULL DEFAULT 'N',
  `liable_for_etf` char(1) NOT NULL DEFAULT 'N',
  `liable_for_paye` char(1) NOT NULL DEFAULT 'N',
  `liable_no_pay` char(1) NOT NULL DEFAULT 'N',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_fixed_allowance_code` (`code`),
  KEY `fk_fixed_allowance_created_by` (`created_by`),
  KEY `fk_fixed_allowance_modified_by` (`modified_by`),
  CONSTRAINT `fk_fixed_allowance_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_fixed_allowance_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `chk_fixed_allowance_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_allowance_epf` CHECK ((`liable_for_epf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_allowance_etf` CHECK ((`liable_for_etf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_allowance_no_pay` CHECK ((`liable_no_pay` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_allowance_paye` CHECK ((`liable_for_paye` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_allowance`
--

LOCK TABLES `fixed_allowance` WRITE;
/*!40000 ALTER TABLE `fixed_allowance` DISABLE KEYS */;
INSERT INTO `fixed_allowance` VALUES (-1,'DEFAULT','Default Fixed Allowance','System Default Fixed Allowance',0.00,'N','Y','N','N','N','N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'FA001','Transport Allowance','Monthly transport allowance',5000.00,'Y','Y','Y','Y','Y','Y',1,'2026-05-17 15:05:08',1,'2026-05-19 00:05:20'),(2,'FA002','Meal Allowance','Daily meal support allowance',3000.00,'Y','Y','Y','Y','Y','N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(3,'FA003','Housing Allowance','Housing rent support',15000.00,'Y','Y','Y','Y','Y','N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(4,'FA004','Mobile Allowance','Mobile phone allowance',2000.00,'Y','Y','Y','Y','Y','N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(5,'FA005','Internet Allowance','Internet reimbursement',2500.00,'Y','N','Y','Y','Y','Y',1,'2026-05-17 15:05:08',1,'2026-05-19 00:05:20'),(6,'FA006','Fuel Allowance','Fuel and travel allowance',8000.00,'Y','Y','Y','Y','Y','N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(7,'FA007','Performance Bonus','Monthly performance bonus',10000.00,'Y','Y','Y','Y','Y','N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(8,'FA008','Attendance Bonus','Attendance incentive bonus',4000.00,'Y','Y','Y','Y','Y','N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(9,'FA009','Shift Allowance','Shift based allowance',6000.00,'Y','Y','Y','Y','Y','N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(10,'FA010','Special Allowance','Special management allowance',12000.00,'Y','Y','Y','Y','Y','N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(11,'FA011','Festival Allowance','Annual festival bonus allowance',7000.00,'Y','Y','Y','Y','Y','N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08');
/*!40000 ALTER TABLE `fixed_allowance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_deduction`
--

DROP TABLE IF EXISTS `fixed_deduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixed_deduction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'N',
  `is_taxable` char(1) NOT NULL DEFAULT 'N',
  `liable_for_epf` char(1) NOT NULL DEFAULT 'N',
  `liable_for_etf` char(1) NOT NULL DEFAULT 'N',
  `liable_for_paye` char(1) NOT NULL DEFAULT 'N',
  `liable_no_pay` char(1) NOT NULL DEFAULT 'N',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_fixed_deduction_code` (`code`),
  KEY `fk_fixed_deduction_created_by` (`created_by`),
  KEY `fk_fixed_deduction_modified_by` (`modified_by`),
  CONSTRAINT `fk_fixed_deduction_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_fixed_deduction_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `chk_fixed_deduction_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_deduction_epf` CHECK ((`liable_for_epf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_deduction_etf` CHECK ((`liable_for_etf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_deduction_no_pay` CHECK ((`liable_no_pay` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_deduction_paye` CHECK ((`liable_for_paye` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_deduction`
--

LOCK TABLES `fixed_deduction` WRITE;
/*!40000 ALTER TABLE `fixed_deduction` DISABLE KEYS */;
INSERT INTO `fixed_deduction` VALUES (-1,'DEFAULT','Default Fixed Deduction','System Default Fixed Deduction',0.00,'Y','N','N','N','N','N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'FD001','EPF Contribution','Employee EPF deduction',2000.00,'Y','N','Y','Y','N','N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(2,'FD002','ETF Contribution','Employee ETF deduction',1000.00,'Y','N','Y','Y','N','N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(3,'FD003','Tax Deduction','Income tax deduction',5000.00,'Y','Y','N','N','Y','N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(4,'FD004','Loan Installment','Monthly loan repayment',3000.00,'Y','N','N','N','N','N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(5,'FD005','Advance Recovery','Salary advance recovery',1500.00,'Y','N','N','N','N','N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(6,'FD006','Penalty Deduction','Late/disciplinary penalty',2000.00,'Y','N','N','N','N','Y',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(7,'FD007','Insurance Deduction','Employee insurance premium',1200.00,'Y','N','N','N','N','N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(8,'FD008','Equipment Recovery','Recovery for company equipment',2500.00,'Y','N','N','N','N','N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(9,'FD009','Union Fee','Trade union membership fee',800.00,'Y','N','N','N','N','N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(10,'FD010','Absence Deduction','No pay absence deduction',1000.00,'Y','N','N','N','N','Y',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(11,'FD011','Misc Deduction','Other miscellaneous deductions',500.00,'Y','N','N','N','N','N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37');
/*!40000 ALTER TABLE `fixed_deduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_grade_code` (`code`),
  KEY `fk_grade_created_by` (`created_by`),
  KEY `fk_grade_modified_by` (`modified_by`),
  CONSTRAINT `fk_grade_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_grade_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (-1,'DEFAULT','Default Grade','Y',0.00,-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'GR001','Grade 1','Y',25000.00,1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(2,'GR002','Grade 2','Y',35000.00,1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(3,'GR003','Grade 3','Y',45000.00,1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(4,'GR004','Grade 4','Y',55000.00,1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(5,'GR005','Grade 5','Y',65000.00,1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(6,'GR006','Grade 6','Y',75000.00,1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(7,'GR007','Grade 7','Y',85000.00,1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(8,'GR008','Grade 8','Y',95000.00,1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(9,'GR009','Grade 9','Y',105000.00,1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(10,'GR010','Grade 10','Y',115000.00,1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(11,'GR011','Executive Grade','Y',150000.00,1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49');
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_category`
--

DROP TABLE IF EXISTS `job_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_job_category_code` (`code`),
  KEY `fk_job_category_created_by` (`created_by`),
  KEY `fk_job_category_modified_by` (`modified_by`),
  CONSTRAINT `fk_job_category_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_job_category_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_category`
--

LOCK TABLES `job_category` WRITE;
/*!40000 ALTER TABLE `job_category` DISABLE KEYS */;
INSERT INTO `job_category` VALUES (-1,'DEFAULT','Default Job Category','Y','System Default Job Category',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'JC001','Information Technology','Y','IT related job category',1,'2026-05-17 14:11:04',1,'2026-05-17 14:11:04'),(2,'JC002','Human Resources','Y','HR and administration category',1,'2026-05-17 14:11:04',1,'2026-05-17 14:11:04'),(3,'JC003','Finance','Y','Finance and accounting category',1,'2026-05-17 14:11:04',1,'2026-05-17 14:11:04'),(4,'JC004','Operations','Y','Operations management category',1,'2026-05-17 14:11:04',1,'2026-05-17 14:11:04'),(5,'JC005','Sales','Y','Sales and business development category',1,'2026-05-17 14:11:04',1,'2026-05-17 14:11:04'),(6,'JC006','Marketing','Y','Marketing and promotions category',1,'2026-05-17 14:11:04',1,'2026-05-17 14:11:04'),(7,'JC007','Customer Support','N','Customer support services category',1,'2026-05-17 14:11:04',1,'2026-05-18 23:56:55'),(8,'JC008','Engineering','Y','Engineering and technical category',1,'2026-05-17 14:11:04',1,'2026-05-17 14:11:04'),(9,'JC009','Administration','Y','Administrative services category',1,'2026-05-17 14:11:04',1,'2026-05-17 14:11:04'),(10,'JC010','Procurement','Y','Purchasing and procurement category',1,'2026-05-17 14:11:04',1,'2026-05-17 14:11:04'),(11,'JC011','Security','Y','Security and compliance category',1,'2026-05-17 14:11:04',1,'2026-05-17 14:11:04');
/*!40000 ALTER TABLE `job_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_loan_code` (`code`),
  KEY `fk_loan_created_by` (`created_by`),
  KEY `fk_loan_modified_by` (`modified_by`),
  CONSTRAINT `fk_loan_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_loan_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (-1,'DEFAULT','Default Loan','Y','System Default Loan',0.00,-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nopay_days`
--

DROP TABLE IF EXISTS `nopay_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nopay_days` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `days` decimal(5,2) NOT NULL DEFAULT '0.00',
  `formula` varchar(500) DEFAULT NULL,
  `formula_enabled` char(1) NOT NULL DEFAULT 'N',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_nopay_days_code` (`code`),
  KEY `fk_nopay_days_created_by` (`created_by`),
  KEY `fk_nopay_days_modified_by` (`modified_by`),
  CONSTRAINT `fk_nopay_days_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_nopay_days_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nopay_days`
--

LOCK TABLES `nopay_days` WRITE;
/*!40000 ALTER TABLE `nopay_days` DISABLE KEYS */;
INSERT INTO `nopay_days` VALUES (-1,'DEFAULT','Default NoPay','Y','System Default NoPay Rule',0.00,NULL,'N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'NP001','No Pay - Default','Y','Default no pay rule',0.00,NULL,'N',1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(2,'NP002','Half Day Deduction','Y','Deduct 0.5 day per absence',0.50,NULL,'N',1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(3,'NP003','Full Day Deduction','Y','Deduct 1 full day',1.00,NULL,'N',1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(4,'NP004','Late Mark Deduction','Y','Penalty for late arrival',0.25,NULL,'N',1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(5,'NP005','Early Leave Deduction','Y','Deduction for early leave',0.25,NULL,'N',1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(6,'NP006','Unpaid Leave','Y','Unpaid leave rule',1.00,NULL,'N',1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(7,'NP007','Absence Penalty','Y','Absence deduction rule',1.00,NULL,'N',1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(8,'NP008','Disciplinary Leave','N','Disciplinary no pay rule',1.00,NULL,'N',1,'2026-05-17 14:21:45',1,'2026-05-19 00:35:31'),(9,'NP009','No Pay Holiday','Y','Holiday without pay rule',1.00,NULL,'N',1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(10,'NP010','Suspension','Y','Suspension no pay rule',1.00,NULL,'N',1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(11,'NP011','Custom Rule','Y','Custom no pay configuration',1.00,NULL,'N',1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45');
/*!40000 ALTER TABLE `nopay_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overtime`
--

DROP TABLE IF EXISTS `overtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overtime` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `formula` varchar(500) DEFAULT NULL,
  `formula_enabled` char(1) NOT NULL DEFAULT 'N',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_overtime_code` (`code`),
  KEY `fk_overtime_created_by` (`created_by`),
  KEY `fk_overtime_modified_by` (`modified_by`),
  CONSTRAINT `fk_overtime_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_overtime_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtime`
--

LOCK TABLES `overtime` WRITE;
/*!40000 ALTER TABLE `overtime` DISABLE KEYS */;
INSERT INTO `overtime` VALUES (-1,'DEFAULT','Default Overtime','Y','System Default Overtime',0.00,NULL,'N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'OT001','Normal Overtime','Y','Standard overtime rate (1x)',1000.00,NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(2,'OT002','Weekend Overtime','Y','Weekend overtime rate (1.5x)',1500.00,NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(3,'OT003','Holiday Overtime','Y','Public holiday overtime (2x)',2000.00,NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(4,'OT004','Night Shift OT','Y','Night shift overtime allowance',1200.00,NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(5,'OT005','Emergency OT','Y','Emergency duty overtime',1800.00,NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(6,'OT006','Project OT','Y','Project based overtime',1300.00,NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(7,'OT007','Field OT','Y','Field work overtime',1100.00,NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(8,'OT008','Travel OT','Y','Travel related overtime',1400.00,NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(9,'OT009','Extra Shift OT','Y','Additional shift overtime',1600.00,NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(10,'OT010','Double Shift OT','Y','Double shift overtime pay',2200.00,NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(11,'OT011','Special Assignment OT','Y','Special assignment overtime',2500.00,NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45');
/*!40000 ALTER TABLE `overtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'N',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_role_code` (`code`),
  CONSTRAINT `chk_user_role_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (-1,'DEFAULT','Default Role','Y',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'ROLE1','Administrator','Y',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(2,'ROLE2','HR Manager','Y',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(3,'ROLE3','Payroll Officer','Y',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(4,'ROLE4','Finance Manager','Y',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(5,'ROLE5','Employee','Y',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(6,'ROLE6','Supervisor','Y',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(7,'ROLE7','Branch Manager','Y',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(8,'ROLE8','Auditor','Y',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(9,'ROLE9','System User','Y',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(10,'ROLE10','Operations Manager','Y',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(11,'ROLE11','Guest User','Y',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usr`
--

DROP TABLE IF EXISTS `usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usr` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `role_id` bigint NOT NULL DEFAULT '0',
  `is_active` char(1) NOT NULL DEFAULT 'N',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_users_code` (`code`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  KEY `fk_users_role` (`role_id`),
  CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`),
  CONSTRAINT `chk_users_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usr`
--

LOCK TABLES `usr` WRITE;
/*!40000 ALTER TABLE `usr` DISABLE KEYS */;
INSERT INTO `usr` VALUES (-1,'DEFAULT','System User','default','SYSTEM','',-1,'Y',-1,'2026-05-17 12:34:46',-1,'2026-05-20 01:39:06'),(1,'ADMIN','System Administrator','admin','$2a$10$7kufHBi4GalXl268iFsBQeKEnv6Izk9qQJD6jY1gGC1F0poVA2vVa','jzmamn@gmail.com',1,'Y',-1,'2026-05-17 12:55:59',-1,'2026-05-20 01:39:06'),(2,'HR001','HR Manager','manager','$2a$10$7kufHBi4GalXl268iFsBQeKEnv6Izk9qQJD6jY1gGC1F0poVA2vVa',NULL,1,'Y',-1,'2026-05-17 12:55:59',-1,'2026-05-19 17:54:52'),(3,'PAY001','Payroll Officer','payroll','$2a$10$7kufHBi4GalXl268iFsBQeKEnv6Izk9qQJD6jY1gGC1F0poVA2vVa',NULL,2,'Y',-1,'2026-05-17 12:55:59',-1,'2026-05-19 17:54:52');
/*!40000 ALTER TABLE `usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable_allowance`
--

DROP TABLE IF EXISTS `variable_allowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variable_allowance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'N',
  `liable_for_epf` char(1) NOT NULL DEFAULT 'N',
  `liable_for_etf` char(1) NOT NULL DEFAULT 'N',
  `liable_for_paye` char(1) NOT NULL DEFAULT 'N',
  `liable_no_pay` char(1) NOT NULL DEFAULT 'N',
  `formula` varchar(500) DEFAULT NULL,
  `formula_enabled` char(1) NOT NULL DEFAULT 'N',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_variable_allowance_code` (`code`),
  KEY `fk_variable_allowance_created_by` (`created_by`),
  KEY `fk_variable_allowance_modified_by` (`modified_by`),
  CONSTRAINT `fk_variable_allowance_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_variable_allowance_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `chk_variable_allowance_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_allowance_epf` CHECK ((`liable_for_epf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_allowance_etf` CHECK ((`liable_for_etf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_allowance_no_pay` CHECK ((`liable_no_pay` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_allowance_paye` CHECK ((`liable_for_paye` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable_allowance`
--

LOCK TABLES `variable_allowance` WRITE;
/*!40000 ALTER TABLE `variable_allowance` DISABLE KEYS */;
INSERT INTO `variable_allowance` VALUES (-1,'DEFAULT','Default Variable Allowance','Y','N','N','N','N',NULL,'N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'VA001','Overtime Allowance','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(2,'VA002','Performance Bonus','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(3,'VA003','Sales Incentive','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(4,'VA004','Project Bonus','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(5,'VA005','Attendance Bonus','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(6,'VA006','Commission','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(7,'VA007','Festival Bonus','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(8,'VA008','Shift Incentive','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(9,'VA009','Target Achievement','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(10,'VA010','Special Incentive','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(11,'VA011','Extra Duty Allowance','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29');
/*!40000 ALTER TABLE `variable_allowance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable_deduction`
--

DROP TABLE IF EXISTS `variable_deduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variable_deduction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'N',
  `liable_for_epf` char(1) NOT NULL DEFAULT 'N',
  `liable_for_etf` char(1) NOT NULL DEFAULT 'N',
  `liable_for_paye` char(1) NOT NULL DEFAULT 'N',
  `liable_no_pay` char(1) NOT NULL DEFAULT 'N',
  `formula` varchar(500) DEFAULT NULL,
  `formula_enabled` char(1) NOT NULL DEFAULT 'N',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_variable_deductions_code` (`code`),
  KEY `fk_variable_deductions_created_by` (`created_by`),
  KEY `fk_variable_deductions_modified_by` (`modified_by`),
  CONSTRAINT `fk_variable_deductions_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_variable_deductions_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `chk_variable_deductions_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_deductions_epf` CHECK ((`liable_for_epf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_deductions_etf` CHECK ((`liable_for_etf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_deductions_no_pay` CHECK ((`liable_no_pay` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_deductions_paye` CHECK ((`liable_for_paye` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable_deduction`
--

LOCK TABLES `variable_deduction` WRITE;
/*!40000 ALTER TABLE `variable_deduction` DISABLE KEYS */;
INSERT INTO `variable_deduction` VALUES (-1,'DEFAULT','Default Variable Deduction','Y','N','N','N','N',NULL,'N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'VD001','Late Attendance Deduction','Y','N','N','N','Y',NULL,'N',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(2,'VD002','Early Leave Deduction','Y','N','N','N','Y',NULL,'N',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(3,'VD003','Absence Deduction','Y','N','N','N','Y',NULL,'N',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(4,'VD004','Penalty Deduction','Y','N','N','N','Y',NULL,'N',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(5,'VD005','Disciplinary Deduction','Y','N','N','N','Y',NULL,'N',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(6,'VD006','Damage Recovery','Y','N','N','N','Y',NULL,'N',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(7,'VD007','Loan Adjustment','Y','N','N','N','Y',NULL,'N',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(8,'VD008','Advance Adjustment','Y','N','N','N','Y',NULL,'N',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(9,'VD009','Leave Without Pay','Y','N','N','N','Y',NULL,'N',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(10,'VD010','System Adjustment','Y','N','N','N','Y',NULL,'N',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(11,'VD011','Misc Deduction','Y','N','N','N','Y',NULL,'N',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27');
/*!40000 ALTER TABLE `variable_deduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ideal_pay'
--

--
-- Dumping routines for database 'ideal_pay'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_employee_fixed_allowance_pivot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_employee_fixed_allowance_pivot`(
    IN p_payroll_month VARCHAR(20)
)
BEGIN

    SET SESSION group_concat_max_len = 1000000;

    SET @columns = NULL;
    SET @sql = NULL;

    /*
        Generate dynamic pivot columns
    */
    SELECT
        GROUP_CONCAT(
            DISTINCT CONCAT(
                'SUM(CASE WHEN fa.id = ',
                fa.id,
                ' THEN ef.amount ELSE 0 END) AS `',
                REPLACE(REPLACE(fa.name, ' ', '_'), '`', ''),
                '`'
            )
            ORDER BY fa.id
            SEPARATOR ', '
        )
    INTO @columns
    FROM fixed_allowance fa
    WHERE fa.is_active = 'Y';

    /*
        Build query
    */
    SET @sql = CONCAT(
    '
    SELECT
        e.id,
        e.employee_no,
        e.payroll_name,
        e.basic_salary,
        ',
        @columns,
    '

    FROM employee e

    LEFT JOIN emp_fa ef
        ON e.id = ef.emp_id
        AND ef.payroll_month = ''',
        p_payroll_month,
    '''

    LEFT JOIN fixed_allowance fa
        ON ef.fa_id = fa.id

    WHERE e.is_active = ''Y''

    GROUP BY
        e.id,
        e.employee_no,
        e.payroll_name,
        e.basic_salary

    ORDER BY e.id
    '
    );

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_emp_fa_pivot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_emp_fa_pivot`(
    IN p_payroll_month VARCHAR(20)
)
BEGIN

    SET SESSION group_concat_max_len = 1000000;

    SET @columns = NULL;
    SET @sql = NULL;

    /*
        Generate dynamic pivot columns
    */
    SELECT
        GROUP_CONCAT(
            DISTINCT CONCAT(
                'SUM(CASE WHEN fa.id = ',
                fa.id,
                ' THEN ef.amount ELSE 0 END) AS `',
                REPLACE(REPLACE(fa.name, ' ', '_'), '`', ''),
                '`'
            )
            ORDER BY fa.id
            SEPARATOR ', '
        )
    INTO @columns
    FROM fixed_allowance fa
    WHERE fa.is_active = 'Y';

    /*
        Build query
    */
    SET @sql = CONCAT(
    '
    SELECT
        e.id,
        e.employee_no,
        e.payroll_name,
        e.basic_salary,
        ',
        @columns,
    '

    FROM employee e

    LEFT JOIN emp_fa ef
        ON e.id = ef.emp_id
        AND ef.payroll_month = ''',
        p_payroll_month,
    '''

    LEFT JOIN fixed_allowance fa
        ON ef.fa_id = fa.id

    WHERE e.is_active = ''Y''

    GROUP BY
        e.id,
        e.employee_no,
        e.payroll_name,
        e.basic_salary

    ORDER BY e.id
    '
    );

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_emp_fd_pivot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_emp_fd_pivot`(
    IN p_payroll_month VARCHAR(20)
)
BEGIN

    DECLARE v_columns LONGTEXT DEFAULT '';
    DECLARE v_sql LONGTEXT DEFAULT '';

    SET SESSION group_concat_max_len = 1000000;

    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN fd.id = ',
            fd.id,
            ' THEN IFNULL(efd.amount,0) ELSE 0 END) AS `',
            REPLACE(REPLACE(fd.name, ' ', '_'), '`', ''),
            '`'
        )
        ORDER BY fd.id
        SEPARATOR ', '
    )
    INTO v_columns
    FROM fixed_deduction fd
    WHERE fd.is_active = 'Y';

    IF v_columns IS NULL THEN
        SET v_columns = '';
    END IF;

    SET v_sql = CONCAT(
        'SELECT
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name',

        IF(v_columns <> '', CONCAT(', ', v_columns), ''),

        ' FROM employee e

        LEFT JOIN emp_fd efd
            ON e.id = efd.emp_id
            AND efd.payroll_month = ''', p_payroll_month, '''

        LEFT JOIN fixed_deduction fd
            ON efd.fd_id = fd.id

        WHERE e.is_active = ''Y''

        GROUP BY
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name

        ORDER BY e.id'
    );

    SET @stmt = v_sql;
    PREPARE stmt FROM @stmt;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_emp_np_pivot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_emp_np_pivot`(
    IN p_payroll_month VARCHAR(20)
)
BEGIN

    SELECT
        e.id,
        e.employee_no,
        e.first_name,
        e.last_name,
        e.payroll_name,

        SUM(IFNULL(enp.days,0)) AS total_days,
        SUM(IFNULL(enp.amount,0)) AS total_amount

    FROM employee e

    LEFT JOIN emp_np enp
        ON e.id = enp.emp_id
        AND enp.payroll_month = p_payroll_month

    WHERE e.is_active = 'Y'

    GROUP BY
        e.id,
        e.employee_no,
        e.first_name,
        e.last_name,
        e.payroll_name

    ORDER BY e.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_emp_ot_pivot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_emp_ot_pivot`(
    IN p_payroll_month VARCHAR(20)
)
BEGIN

    SELECT
        e.id,
        e.employee_no,
        e.first_name,
        e.last_name,
        e.payroll_name,

        SUM(IFNULL(eot.hours,0)) AS total_hours,
        SUM(IFNULL(eot.amount,0)) AS total_amount

    FROM employee e

    LEFT JOIN emp_ot eot
        ON e.id = eot.emp_id
        AND eot.payroll_month = p_payroll_month

    WHERE e.is_active = 'Y'

    GROUP BY
        e.id,
        e.employee_no,
        e.first_name,
        e.last_name,
        e.payroll_name

    ORDER BY e.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_emp_va_pivot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_emp_va_pivot`(
    IN p_payroll_month VARCHAR(20)
)
BEGIN

    DECLARE v_columns LONGTEXT DEFAULT '';
    DECLARE v_sql LONGTEXT DEFAULT '';

    SET SESSION group_concat_max_len = 1000000;

    /* =========================
       Build dynamic columns
    ========================= */
    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN va.id = ',
            va.id,
            ' THEN IFNULL(eva.amount,0) ELSE 0 END) AS `',
            REPLACE(REPLACE(va.name, ' ', '_'), '`', ''),
            '`'
        )
        ORDER BY va.id
        SEPARATOR ', '
    )
    INTO v_columns
    FROM variable_allowance va
    WHERE va.is_active = 'Y';

    /* Prevent NULL crash */
    IF v_columns IS NULL THEN
        SET v_columns = '';
    END IF;

    /* =========================
       Build final SQL
    ========================= */
    SET v_sql = CONCAT(
        'SELECT
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name',
            
            IF(v_columns <> '', CONCAT(', ', v_columns), ''),

        ' FROM employee e

        LEFT JOIN emp_va eva
            ON e.id = eva.emp_id
            AND eva.payroll_month = ''', p_payroll_month, '''

        LEFT JOIN variable_allowance va
            ON eva.va_id = va.id

        WHERE e.is_active = ''Y''

        GROUP BY
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name

        ORDER BY e.id'
    );

    /* Debug SQL */
    SELECT v_sql;

    /* Execute */
    SET @stmt = v_sql;
    PREPARE stmt FROM @stmt;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_emp_vd_pivot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_emp_vd_pivot`(
    IN p_payroll_month VARCHAR(20)
)
BEGIN

    DECLARE v_columns LONGTEXT DEFAULT '';
    DECLARE v_sql LONGTEXT DEFAULT '';

    SET SESSION group_concat_max_len = 1000000;

    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN vd.id = ',
            vd.id,
            ' THEN IFNULL(evd.amount,0) ELSE 0 END) AS `',
            REPLACE(REPLACE(vd.name, ' ', '_'), '`', ''),
            '`'
        )
        ORDER BY vd.id
        SEPARATOR ', '
    )
    INTO v_columns
    FROM variable_deduction vd
    WHERE vd.is_active = 'Y';

    IF v_columns IS NULL THEN
        SET v_columns = '';
    END IF;

    SET v_sql = CONCAT(
        'SELECT
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name',

        IF(v_columns <> '', CONCAT(', ', v_columns), ''),

        ' FROM employee e

        LEFT JOIN emp_vd evd
            ON e.id = evd.emp_id
            AND evd.payroll_month = ''', p_payroll_month, '''

        LEFT JOIN variable_deduction vd
            ON evd.vd_id = vd.id

        WHERE e.is_active = ''Y''

        GROUP BY
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name

        ORDER BY e.id'
    );

    SET @stmt = v_sql;
    PREPARE stmt FROM @stmt;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_payroll_monthly_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_payroll_monthly_detail`(
    IN p_payroll_month VARCHAR(20)
)
BEGIN

    DECLARE v_fa LONGTEXT DEFAULT '';
    DECLARE v_va LONGTEXT DEFAULT '';
    DECLARE v_fd LONGTEXT DEFAULT '';
    DECLARE v_vd LONGTEXT DEFAULT '';
    DECLARE v_sql LONGTEXT DEFAULT '';

    SET SESSION group_concat_max_len = 1000000;

    /* =========================
       FIXED ALLOWANCE
    ========================= */
    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN ef.fa_id = ', fa.id,
            ' THEN IFNULL(ef.amount,0) ELSE 0 END) AS `FA_',
            REPLACE(REPLACE(fa.name,' ','_'),'`',''),
            '`'
        )
        ORDER BY fa.id
        SEPARATOR ', '
    )
    INTO v_fa
    FROM fixed_allowance fa
    WHERE fa.is_active = 'Y';

    /* =========================
       VARIABLE ALLOWANCE
    ========================= */
    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN eva.va_id = ', va.id,
            ' THEN IFNULL(eva.amount,0) ELSE 0 END) AS `VA_',
            REPLACE(REPLACE(va.name,' ','_'),'`',''),
            '`'
        )
        ORDER BY va.id
        SEPARATOR ', '
    )
    INTO v_va
    FROM variable_allowance va
    WHERE va.is_active = 'Y';

    /* =========================
       FIXED DEDUCTION
    ========================= */
    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN efd.fd_id = ', fd.id,
            ' THEN IFNULL(efd.amount,0) ELSE 0 END) AS `FD_',
            REPLACE(REPLACE(fd.name,' ','_'),'`',''),
            '`'
        )
        ORDER BY fd.id
        SEPARATOR ', '
    )
    INTO v_fd
    FROM fixed_deduction fd
    WHERE fd.is_active = 'Y';

    /* =========================
       VARIABLE DEDUCTION
    ========================= */
    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN evd.vd_id = ', vd.id,
            ' THEN IFNULL(evd.amount,0) ELSE 0 END) AS `VD_',
            REPLACE(REPLACE(vd.name,' ','_'),'`',''),
            '`'
        )
        ORDER BY vd.id
        SEPARATOR ', '
    )
    INTO v_vd
    FROM variable_deduction vd
    WHERE vd.is_active = 'Y';

    /* =========================
       FINAL QUERY
    ========================= */
    SET v_sql = CONCAT(
        'SELECT
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name,
            e.basic_salary',

        IF(v_fa <> '', CONCAT(', ', v_fa), ''),
        IF(v_va <> '', CONCAT(', ', v_va), ''),
        IF(v_fd <> '', CONCAT(', ', v_fd), ''),
        IF(v_vd <> '', CONCAT(', ', v_vd), ''),

        ', 
        IFNULL((SELECT SUM(eot.amount)
                FROM emp_ot eot
                WHERE eot.emp_id = e.id
                AND eot.payroll_month = ''', p_payroll_month, '''),0) AS overtime_total,

        IFNULL((SELECT SUM(enp.amount)
                FROM emp_np enp
                WHERE enp.emp_id = e.id
                AND enp.payroll_month = ''', p_payroll_month, '''),0) AS nopay_total,

        (
            e.basic_salary +
            IFNULL((SELECT SUM(ef.amount) FROM emp_fa ef WHERE ef.emp_id = e.id AND ef.payroll_month = ''', p_payroll_month, '''),0) +
            IFNULL((SELECT SUM(eva.amount) FROM emp_va eva WHERE eva.emp_id = e.id AND eva.payroll_month = ''', p_payroll_month, '''),0)
        ) AS gross_salary,

        (
            IFNULL((SELECT SUM(efd.amount) FROM emp_fd efd WHERE efd.emp_id = e.id AND efd.payroll_month = ''', p_payroll_month, '''),0) +
            IFNULL((SELECT SUM(evd.amount) FROM emp_vd evd WHERE evd.emp_id = e.id AND evd.payroll_month = ''', p_payroll_month, '''),0) +
            IFNULL((SELECT SUM(enp.amount) FROM emp_np enp WHERE enp.emp_id = e.id AND enp.payroll_month = ''', p_payroll_month, '''),0)
        ) AS total_deductions,

        (
            (
                e.basic_salary +
                IFNULL((SELECT SUM(ef.amount) FROM emp_fa ef WHERE ef.emp_id = e.id AND ef.payroll_month = ''', p_payroll_month, '''),0) +
                IFNULL((SELECT SUM(eva.amount) FROM emp_va eva WHERE eva.emp_id = e.id AND eva.payroll_month = ''', p_payroll_month, '''),0)
            )
            -
            (
                IFNULL((SELECT SUM(efd.amount) FROM emp_fd efd WHERE efd.emp_id = e.id AND efd.payroll_month = ''', p_payroll_month, '''),0) +
                IFNULL((SELECT SUM(evd.amount) FROM emp_vd evd WHERE evd.emp_id = e.id AND evd.payroll_month = ''', p_payroll_month, '''),0) +
                IFNULL((SELECT SUM(enp.amount) FROM emp_np enp WHERE enp.emp_id = e.id AND enp.payroll_month = ''', p_payroll_month, '''),0)
            )
        ) AS net_salary

        FROM employee e

        LEFT JOIN emp_fa ef ON e.id = ef.emp_id AND ef.payroll_month = ''', p_payroll_month, '''
        LEFT JOIN emp_va eva ON e.id = eva.emp_id AND eva.payroll_month = ''', p_payroll_month, '''
        LEFT JOIN emp_fd efd ON e.id = efd.emp_id AND efd.payroll_month = ''', p_payroll_month, '''
        LEFT JOIN emp_vd evd ON e.id = evd.emp_id AND evd.payroll_month = ''', p_payroll_month, '''

        WHERE e.is_active = ''Y''

        GROUP BY
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name,
            e.basic_salary

        ORDER BY e.id'
    );

    /* DEBUG */
    SELECT v_sql;

    /* EXECUTE */
    SET @stmt = v_sql;
    PREPARE stmt FROM @stmt;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_payroll_monthly_summary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_payroll_monthly_summary`(
    IN p_payroll_month VARCHAR(20)
)
BEGIN

    SELECT
        e.employee_no AS Employee,
        e.basic_salary AS Basic,

        /* =========================
           TOTAL ALLOWANCES (FA + VA)
        ========================= */
        (
            IFNULL((SELECT SUM(ef.amount)
                    FROM emp_fa ef
                    WHERE ef.emp_id = e.id
                    AND ef.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
            +
            IFNULL((SELECT SUM(eva.amount)
                    FROM emp_va eva
                    WHERE eva.emp_id = e.id
                    AND eva.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
        ) AS Allowances,

        /* =========================
           OVERTIME
        ========================= */
        IFNULL((SELECT SUM(eot.amount)
                FROM emp_ot eot
                WHERE eot.emp_id = e.id
                AND eot.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0) AS OT,

        /* =========================
           GROSS
        ========================= */
        (
            e.basic_salary
            +
            IFNULL((SELECT SUM(ef.amount)
                    FROM emp_fa ef
                    WHERE ef.emp_id = e.id
                    AND ef.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
            +
            IFNULL((SELECT SUM(eva.amount)
                    FROM emp_va eva
                    WHERE eva.emp_id = e.id
                    AND eva.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
            +
            IFNULL((SELECT SUM(eot.amount)
                    FROM emp_ot eot
                    WHERE eot.emp_id = e.id
                    AND eot.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
        ) AS Gross,

        /* =========================
           DEDUCTIONS
        ========================= */
        (
            IFNULL((SELECT SUM(efd.amount)
                    FROM emp_fd efd
                    WHERE efd.emp_id = e.id
                    AND efd.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
            +
            IFNULL((SELECT SUM(evd.amount)
                    FROM emp_vd evd
                    WHERE evd.emp_id = e.id
                    AND evd.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
            +
            IFNULL((SELECT SUM(enp.amount)
                    FROM emp_np enp
                    WHERE enp.emp_id = e.id
                    AND enp.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
        ) AS Deductions,

        /* =========================
           NET
        ========================= */
        (
            (
                e.basic_salary
                +
                IFNULL((SELECT SUM(ef.amount)
                        FROM emp_fa ef
                        WHERE ef.emp_id = e.id
                        AND ef.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
                +
                IFNULL((SELECT SUM(eva.amount)
                        FROM emp_va eva
                        WHERE eva.emp_id = e.id
                        AND eva.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
                +
                IFNULL((SELECT SUM(eot.amount)
                        FROM emp_ot eot
                        WHERE eot.emp_id = e.id
                        AND eot.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
            )
            -
            (
                IFNULL((SELECT SUM(efd.amount)
                        FROM emp_fd efd
                        WHERE efd.emp_id = e.id
                        AND efd.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
                +
                IFNULL((SELECT SUM(evd.amount)
                        FROM emp_vd evd
                        WHERE evd.emp_id = e.id
                        AND evd.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
                +
                IFNULL((SELECT SUM(enp.amount)
                        FROM emp_np enp
                        WHERE enp.emp_id = e.id
                        AND enp.payroll_month = p_payroll_month COLLATE utf8mb4_0900_ai_ci),0)
            )
        ) AS Net

    FROM employee e
    WHERE e.is_active = 'Y'
    ORDER BY e.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_setup_add_is_active_column_to_all_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_setup_add_is_active_column_to_all_tables`(IN db_name VARCHAR(64))
BEGIN

    DECLARE done INT DEFAULT 0;
    DECLARE tbl VARCHAR(255);

    DECLARE cur CURSOR FOR 
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = db_name
          AND table_type = 'BASE TABLE';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO tbl;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Check if column 'name' exists in table
        SET @has_name := (
            SELECT COUNT(*)
            FROM information_schema.columns
            WHERE table_schema = db_name
              AND table_name = tbl
              AND column_name = 'name'
        );

        -- Check if column 'is_active' already exists
        SET @has_active := (
            SELECT COUNT(*)
            FROM information_schema.columns
            WHERE table_schema = db_name
              AND table_name = tbl
              AND column_name = 'is_active'
        );

        -- Add column only if:
        -- 1. table has 'name'
        -- 2. does NOT already have 'is_active'
        IF @has_name > 0 AND @has_active = 0 THEN

            SET @sql = CONCAT(
                'ALTER TABLE `', db_name, '`.`', tbl, '` ',
                'ADD COLUMN `is_active` CHAR(1) NOT NULL DEFAULT ''Y'' ',
                'AFTER `name`'
            );

            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

        END IF;

    END LOOP;

    CLOSE cur;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tool_missing_default_row` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tool_missing_default_row`(IN db_name VARCHAR(64))
BEGIN

    DECLARE done INT DEFAULT 0;
    DECLARE tbl VARCHAR(255);

    DECLARE cur CURSOR FOR 
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = db_name
          AND table_type = 'BASE TABLE';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    DROP TEMPORARY TABLE IF EXISTS temp_missing;

    CREATE TEMPORARY TABLE temp_missing (
        table_name VARCHAR(255)
    );

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO tbl;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Check if table has 'id' column
        SET @has_id := (
            SELECT COUNT(*)
            FROM information_schema.columns
            WHERE table_schema = db_name
              AND table_name = tbl
              AND column_name = 'id'
        );

        IF @has_id > 0 THEN

            -- Check if id = -1 exists
            SET @sql := CONCAT(
                'SELECT COUNT(*) INTO @cnt ',
                'FROM `', db_name, '`.`', tbl, '` ',
                'WHERE id = -1'
            );

            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

            -- If no -1 record exists, mark table
            IF @cnt = 0 THEN
                INSERT INTO temp_missing VALUES (tbl);
            END IF;

        END IF;

    END LOOP;

    CLOSE cur;

    -- Final result
SELECT 
    *
FROM
    temp_missing;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tool_reset_all_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tool_reset_all_tables`(IN db_name VARCHAR(64))
BEGIN

    DECLARE done INT DEFAULT 0;
    DECLARE tbl VARCHAR(255);

    DECLARE cur CURSOR FOR 
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = db_name
          AND table_type = 'BASE TABLE';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Disable FK checks
    SET FOREIGN_KEY_CHECKS = 0;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO tbl;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Skip system tables (optional filter)
        IF tbl NOT IN ('usr') THEN

            SET @sql = CONCAT('TRUNCATE TABLE `', db_name, '`.`', tbl, '`');
            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

        END IF;

    END LOOP;

    CLOSE cur;

    -- Re-enable FK checks
    SET FOREIGN_KEY_CHECKS = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-26 16:18:58
