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
  `code` varchar(10) DEFAULT NULL,
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
  UNIQUE KEY `code` (`code`),
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
  `code` varchar(10) DEFAULT NULL,
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
  UNIQUE KEY `code` (`code`),
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
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(70) NOT NULL DEFAULT '',
  `is_active` char(1) DEFAULT 'Y',
  `iso2` char(2) NOT NULL DEFAULT '',
  `iso3` char(3) NOT NULL,
  `phone_code` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iso2` (`iso2`),
  UNIQUE KEY `code` (`code`),
  KEY `fk_countries_created_by` (`created_by`),
  KEY `fk_countries_modified_by` (`modified_by`),
  CONSTRAINT `fk_countries_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_countries_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (-1,'SYS','System Default','N','XX','XXX',0,-1,'2026-05-29 03:46:13',-1,'2026-05-29 03:46:13'),(1,'AFG','Afghanistan','Y','AF','AFG',93,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(2,'ALB','Albania','Y','AL','ALB',355,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(3,'DZA','Algeria','Y','DZ','DZA',213,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(4,'AND','Andorra','Y','AD','AND',376,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(5,'AGO','Angola','Y','AO','AGO',244,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(6,'ATG','Antigua and Barbuda','Y','AG','ATG',1268,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(7,'ARG','Argentina','Y','AR','ARG',54,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(8,'ARM','Armenia','Y','AM','ARM',374,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(9,'AUS','Australia','Y','AU','AUS',61,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(10,'AUT','Austria','Y','AT','AUT',43,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(11,'AZE','Azerbaijan','Y','AZ','AZE',994,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(12,'BHS','Bahamas','Y','BS','BHS',1242,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(13,'BHR','Bahrain','Y','BH','BHR',973,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(14,'BGD','Bangladesh','Y','BD','BGD',880,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(15,'BRB','Barbados','Y','BB','BRB',1246,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(16,'BLR','Belarus','Y','BY','BLR',375,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(17,'BEL','Belgium','Y','BE','BEL',32,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(18,'BLZ','Belize','Y','BZ','BLZ',501,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(19,'BEN','Benin','Y','BJ','BEN',229,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(20,'BTN','Bhutan','Y','BT','BTN',975,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(21,'BOL','Bolivia','Y','BO','BOL',591,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(22,'BIH','Bosnia and Herzegovina','Y','BA','BIH',387,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(23,'BWA','Botswana','Y','BW','BWA',267,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(24,'BRA','Brazil','Y','BR','BRA',55,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(25,'BRN','Brunei','Y','BN','BRN',673,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(26,'BGR','Bulgaria','Y','BG','BGR',359,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(27,'BFA','Burkina Faso','Y','BF','BFA',226,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(28,'BDI','Burundi','Y','BI','BDI',257,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(29,'CPV','Cabo Verde','Y','CV','CPV',238,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(30,'KHM','Cambodia','Y','KH','KHM',855,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(31,'CMR','Cameroon','Y','CM','CMR',237,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(32,'CAN','Canada','Y','CA','CAN',1,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(33,'CAF','Central African Republic','Y','CF','CAF',236,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(34,'TCD','Chad','Y','TD','TCD',235,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(35,'CHL','Chile','Y','CL','CHL',56,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(36,'CHN','China','Y','CN','CHN',86,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(37,'COL','Colombia','Y','CO','COL',57,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(38,'COM','Comoros','Y','KM','COM',269,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(39,'COD','Congo (DRC)','Y','CD','COD',243,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(40,'COG','Congo (Republic)','Y','CG','COG',242,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(41,'CRI','Costa Rica','Y','CR','CRI',506,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(42,'CIV','Cote d Ivoire','Y','CI','CIV',225,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(43,'HRV','Croatia','Y','HR','HRV',385,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(44,'CUB','Cuba','Y','CU','CUB',53,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(45,'CYP','Cyprus','Y','CY','CYP',357,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(46,'CZE','Czech Republic','Y','CZ','CZE',420,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(47,'DNK','Denmark','Y','DK','DNK',45,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(48,'DJI','Djibouti','Y','DJ','DJI',253,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(49,'DMA','Dominica','Y','DM','DMA',1767,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(50,'DOM','Dominican Republic','Y','DO','DOM',1809,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(51,'ECU','Ecuador','Y','EC','ECU',593,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(52,'EGY','Egypt','Y','EG','EGY',20,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(53,'SLV','El Salvador','Y','SV','SLV',503,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(54,'GNQ','Equatorial Guinea','Y','GQ','GNQ',240,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(55,'ERI','Eritrea','Y','ER','ERI',291,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(56,'EST','Estonia','Y','EE','EST',372,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(57,'SWZ','Eswatini','Y','SZ','SWZ',268,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(58,'ETH','Ethiopia','Y','ET','ETH',251,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(59,'FJI','Fiji','Y','FJ','FJI',679,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(60,'FIN','Finland','Y','FI','FIN',358,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(61,'FRA','France','Y','FR','FRA',33,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(62,'GAB','Gabon','Y','GA','GAB',241,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(63,'GMB','Gambia','Y','GM','GMB',220,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(64,'GEO','Georgia','Y','GE','GEO',995,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(65,'DEU','Germany','Y','DE','DEU',49,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(66,'GHA','Ghana','Y','GH','GHA',233,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(67,'GRC','Greece','Y','GR','GRC',30,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(68,'GRD','Grenada','Y','GD','GRD',1473,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(69,'GTM','Guatemala','Y','GT','GTM',502,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(70,'GIN','Guinea','Y','GN','GIN',224,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(71,'GNB','Guinea-Bissau','Y','GW','GNB',245,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(72,'GUY','Guyana','Y','GY','GUY',592,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(73,'HTI','Haiti','Y','HT','HTI',509,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(74,'HND','Honduras','Y','HN','HND',504,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(75,'HUN','Hungary','Y','HU','HUN',36,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(76,'ISL','Iceland','Y','IS','ISL',354,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(77,'IND','India','Y','IN','IND',91,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(78,'IDN','Indonesia','Y','ID','IDN',62,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(79,'IRN','Iran','Y','IR','IRN',98,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(80,'IRQ','Iraq','Y','IQ','IRQ',964,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(81,'IRL','Ireland','Y','IE','IRL',353,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(82,'ISR','Israel','Y','IL','ISR',972,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(83,'ITA','Italy','Y','IT','ITA',39,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(84,'JAM','Jamaica','Y','JM','JAM',1876,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(85,'JPN','Japan','Y','JP','JPN',81,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(86,'JOR','Jordan','Y','JO','JOR',962,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(87,'KAZ','Kazakhstan','Y','KZ','KAZ',7,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(88,'KEN','Kenya','Y','KE','KEN',254,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(89,'KIR','Kiribati','Y','KI','KIR',686,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(90,'PRK','Korea (North)','Y','KP','PRK',850,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(91,'KOR','Korea (South)','Y','KR','KOR',82,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(92,'KWT','Kuwait','Y','KW','KWT',965,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(93,'KGZ','Kyrgyzstan','Y','KG','KGZ',996,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(94,'LAO','Laos','Y','LA','LAO',856,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(95,'LVA','Latvia','Y','LV','LVA',371,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(96,'LBN','Lebanon','Y','LB','LBN',961,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(97,'LSO','Lesotho','Y','LS','LSO',266,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(98,'LBR','Liberia','Y','LR','LBR',231,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(99,'LBY','Libya','Y','LY','LBY',218,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(100,'LIE','Liechtenstein','Y','LI','LIE',423,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(101,'LTU','Lithuania','Y','LT','LTU',370,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(102,'LUX','Luxembourg','Y','LU','LUX',352,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(103,'MDG','Madagascar','Y','MG','MDG',261,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(104,'MWI','Malawi','Y','MW','MWI',265,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(105,'MYS','Malaysia','Y','MY','MYS',60,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(106,'MDV','Maldives','Y','MV','MDV',960,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(107,'MLI','Mali','Y','ML','MLI',223,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(108,'MLT','Malta','Y','MT','MLT',356,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(109,'MHL','Marshall Islands','Y','MH','MHL',692,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(110,'MRT','Mauritania','Y','MR','MRT',222,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(111,'MUS','Mauritius','Y','MU','MUS',230,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(112,'MEX','Mexico','Y','MX','MEX',52,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(113,'FSM','Micronesia','Y','FM','FSM',691,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(114,'MDA','Moldova','Y','MD','MDA',373,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(115,'MCO','Monaco','Y','MC','MCO',377,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(116,'MNG','Mongolia','Y','MN','MNG',976,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(117,'MNE','Montenegro','Y','ME','MNE',382,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(118,'MAR','Morocco','Y','MA','MAR',212,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(119,'MOZ','Mozambique','Y','MZ','MOZ',258,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(120,'MMR','Myanmar','Y','MM','MMR',95,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(121,'NAM','Namibia','Y','NA','NAM',264,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(122,'NRU','Nauru','Y','NR','NRU',674,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(123,'NPL','Nepal','Y','NP','NPL',977,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(124,'NLD','Netherlands','Y','NL','NLD',31,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(125,'NZL','New Zealand','Y','NZ','NZL',64,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(126,'NIC','Nicaragua','Y','NI','NIC',505,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(127,'NER','Niger','Y','NE','NER',227,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(128,'NGA','Nigeria','Y','NG','NGA',234,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(129,'MKD','North Macedonia','Y','MK','MKD',389,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(130,'NOR','Norway','Y','NO','NOR',47,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(131,'OMN','Oman','Y','OM','OMN',968,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(132,'PAK','Pakistan','Y','PK','PAK',92,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(133,'PLW','Palau','Y','PW','PLW',680,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(134,'PAN','Panama','Y','PA','PAN',507,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(135,'PNG','Papua New Guinea','Y','PG','PNG',675,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(136,'PRY','Paraguay','Y','PY','PRY',595,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(137,'PER','Peru','Y','PE','PER',51,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(138,'PHL','Philippines','Y','PH','PHL',63,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(139,'POL','Poland','Y','PL','POL',48,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(140,'PRT','Portugal','Y','PT','PRT',351,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(141,'QAT','Qatar','Y','QA','QAT',974,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(142,'ROU','Romania','Y','RO','ROU',40,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(143,'RUS','Russia','Y','RU','RUS',7,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(144,'RWA','Rwanda','Y','RW','RWA',250,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(145,'KNA','Saint Kitts and Nevis','Y','KN','KNA',1869,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(146,'LCA','Saint Lucia','Y','LC','LCA',1758,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(147,'VCT','Saint Vincent and the Grenadines','Y','VC','VCT',1784,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(148,'WSM','Samoa','Y','WS','WSM',685,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(149,'SMR','San Marino','Y','SM','SMR',378,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(150,'STP','Sao Tome and Principe','Y','ST','STP',239,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(151,'SAU','Saudi Arabia','Y','SA','SAU',966,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(152,'SEN','Senegal','Y','SN','SEN',221,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(153,'SRB','Serbia','Y','RS','SRB',381,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(154,'SYC','Seychelles','Y','SC','SYC',248,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(155,'SLE','Sierra Leone','Y','SL','SLE',232,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(156,'SGP','Singapore','Y','SG','SGP',65,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(157,'SVK','Slovakia','Y','SK','SVK',421,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(158,'SVN','Slovenia','Y','SI','SVN',386,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(159,'SLB','Solomon Islands','Y','SB','SLB',677,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(160,'SOM','Somalia','Y','SO','SOM',252,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(161,'ZAF','South Africa','Y','ZA','ZAF',27,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(162,'SSD','South Sudan','Y','SS','SSD',211,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(163,'ESP','Spain','Y','ES','ESP',34,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(164,'LKA','Sri Lanka','Y','LK','LKA',94,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(165,'SDN','Sudan','Y','SD','SDN',249,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(166,'SUR','Suriname','Y','SR','SUR',597,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(167,'SWE','Sweden','Y','SE','SWE',46,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(168,'CHE','Switzerland','Y','CH','CHE',41,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(169,'SYR','Syria','Y','SY','SYR',963,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(170,'TWN','Taiwan','Y','TW','TWN',886,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(171,'TJK','Tajikistan','Y','TJ','TJK',992,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(172,'TZA','Tanzania','Y','TZ','TZA',255,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(173,'THA','Thailand','Y','TH','THA',66,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(174,'TLS','Timor-Leste','Y','TL','TLS',670,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(175,'TGO','Togo','Y','TG','TGO',228,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(176,'TON','Tonga','Y','TO','TON',676,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(177,'TTO','Trinidad and Tobago','Y','TT','TTO',1868,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(178,'TUN','Tunisia','Y','TN','TUN',216,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(179,'TUR','Turkey','Y','TR','TUR',90,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(180,'TKM','Turkmenistan','Y','TM','TKM',993,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(181,'TUV','Tuvalu','Y','TV','TUV',688,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(182,'UGA','Uganda','Y','UG','UGA',256,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(183,'UKR','Ukraine','Y','UA','UKR',380,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(184,'ARE','United Arab Emirates','Y','AE','ARE',971,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(185,'GBR','United Kingdom','Y','GB','GBR',44,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(186,'USA','United States','Y','US','USA',1,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(187,'URY','Uruguay','Y','UY','URY',598,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(188,'UZB','Uzbekistan','Y','UZ','UZB',998,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(189,'VUT','Vanuatu','Y','VU','VUT',678,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(190,'VAT','Vatican City','Y','VA','VAT',379,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(191,'VEN','Venezuela','Y','VE','VEN',58,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(192,'VNM','Vietnam','Y','VN','VNM',84,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(193,'YEM','Yemen','Y','YE','YEM',967,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(194,'ZMB','Zambia','Y','ZM','ZMB',260,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49'),(195,'ZWE','Zimbabwe','Y','ZW','ZWE',263,-1,'2026-05-29 03:47:06',-1,'2026-05-29 03:48:49');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_department_code` (`code`),
  UNIQUE KEY `code` (`code`),
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
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_designations_code` (`code`),
  UNIQUE KEY `code` (`code`),
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
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(70) NOT NULL DEFAULT '',
  `is_active` char(1) DEFAULT 'Y',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `fk_district_created_by` (`created_by`),
  KEY `fk_district_modified_by` (`modified_by`),
  CONSTRAINT `fk_district_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_district_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (-1,'SYS','System Default','N',-1,'2026-05-29 04:04:46',-1,'2026-05-29 04:04:46'),(1,'COL','Colombo','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(2,'GAM','Gampaha','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(3,'KAL','Kalutara','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(4,'KAN','Kandy','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(5,'MAT','Matale','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(6,'NUW','Nuwara Eliya','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(7,'GAL','Galle','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(8,'HAM','Hambantota','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(9,'MATR','Matara','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(10,'JAF','Jaffna','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(11,'KIL','Kilinochchi','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(12,'MAN','Mannar','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(13,'MUL','Mullaitivu','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(14,'VAV','Vavuniya','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(15,'BAT','Batticaloa','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(16,'AMP','Ampara','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(17,'TRI','Trincomalee','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(18,'KUR','Kurunegala','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(19,'PUT','Puttalam','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(20,'ANU','Anuradhapura','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(21,'POL','Polonnaruwa','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(22,'BAD','Badulla','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(23,'MON','Monaragala','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(24,'RAT','Ratnapura','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12'),(25,'KEG','Kegalle','Y',-1,'2026-05-29 04:07:12',-1,'2026-05-29 04:07:12');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
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
  `payroll_month` varchar(20) NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `is_processed` char(1) NOT NULL DEFAULT 'N',
  `processed_date` datetime DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_emp_fa` (`emp_id`,`fa_id`,`payroll_month`),
  KEY `fk_emp_fa_emp_id` (`emp_id`),
  KEY `fk_emp_fa_fa_id` (`fa_id`),
  KEY `fk_emp_fa_created_by` (`created_by`),
  KEY `fk_emp_fa_modified_by` (`modified_by`),
  KEY `idx_emp_fa_month` (`emp_id`,`payroll_month`),
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
INSERT INTO `emp_fa` VALUES (-1,-1,-1,'MMYYYY',0.00,'0',NULL,-1,'2026-05-18 14:39:05',-1,'2026-05-18 14:39:05'),(1,1,1,'2026-01',15000.00,'Y','2026-05-25 08:23:02',1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(2,2,2,'2026-01',12000.00,'Y','2026-05-25 08:23:02',1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(3,3,3,'2026-01',8000.00,'N',NULL,1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(4,4,1,'2026-01',10000.00,'Y','2026-05-25 08:23:02',1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(5,5,4,'2026-01',5000.00,'N',NULL,1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(6,6,2,'2026-02',14000.00,'Y','2026-05-25 08:23:02',1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(7,7,5,'2026-02',7500.00,'N',NULL,1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(8,8,1,'2026-02',16000.00,'Y','2026-05-25 08:23:02',1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(9,9,3,'2026-02',9500.00,'N',NULL,1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02'),(10,10,4,'2026-02',11000.00,'Y','2026-05-25 08:23:02',1,'2026-05-25 02:53:02',1,'2026-05-25 02:53:02');
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
  `payroll_month` varchar(20) NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `is_processed` tinyint(1) NOT NULL DEFAULT '0',
  `processed_date` datetime DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_emp_fd` (`emp_id`,`fd_id`,`payroll_month`),
  KEY `fk_emp_fd_emp_id` (`emp_id`),
  KEY `fk_emp_fd_fd_id` (`fd_id`),
  KEY `fk_emp_fd_created_by` (`created_by`),
  KEY `fk_emp_fd_modified_by` (`modified_by`),
  KEY `idx_emp_fd_month` (`emp_id`,`payroll_month`),
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
INSERT INTO `emp_fd` VALUES (-1,-1,-1,'MMYYYY',0.00,0,NULL,-1,'2026-05-18 14:39:05',-1,'2026-05-18 14:39:05'),(1,1,1,'2026-01',2500.00,1,'2026-05-25 08:23:57',1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(2,2,2,'2026-01',1800.00,1,'2026-05-25 08:23:57',1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(3,3,3,'2026-01',3200.00,0,NULL,1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(4,4,1,'2026-01',1500.00,1,'2026-05-25 08:23:57',1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(5,5,4,'2026-01',4100.00,0,NULL,1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(6,6,2,'2026-02',2750.00,1,'2026-05-25 08:23:57',1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(7,7,5,'2026-02',1950.00,0,NULL,1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(8,8,1,'2026-02',3600.00,1,'2026-05-25 08:23:57',1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(9,9,3,'2026-02',2900.00,0,NULL,1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57'),(10,10,4,'2026-02',2250.00,1,'2026-05-25 08:23:57',1,'2026-05-25 02:53:57',1,'2026-05-25 02:53:57');
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
  `payroll_month` varchar(20) DEFAULT NULL,
  `days` decimal(5,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `is_processed` char(1) NOT NULL DEFAULT 'N',
  `processed_date` datetime DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_emp_np` (`emp_id`,`nopay_id`,`payroll_month`),
  KEY `fk_emp_np_emp` (`emp_id`),
  KEY `fk_emp_np_nopay` (`nopay_id`),
  KEY `fk_emp_np_created_by` (`created_by`),
  KEY `fk_emp_np_modified_by` (`modified_by`),
  KEY `idx_emp_np_month` (`emp_id`,`payroll_month`),
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
INSERT INTO `emp_np` VALUES (-1,-1,-1,NULL,0.00,0.00,'N',NULL,-1,'2026-05-24 04:01:41',-1,'2026-05-24 04:01:41');
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
  `payroll_month` varchar(20) DEFAULT NULL,
  `hours` decimal(5,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `is_processed` char(1) NOT NULL DEFAULT 'N',
  `processed_date` datetime DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_emp_ot` (`emp_id`,`overtime_id`,`payroll_month`),
  KEY `fk_emp_ot_emp` (`emp_id`),
  KEY `fk_emp_ot_overtime` (`overtime_id`),
  KEY `fk_emp_ot_created_by` (`created_by`),
  KEY `fk_emp_ot_modified_by` (`modified_by`),
  KEY `idx_emp_ot_month` (`emp_id`,`payroll_month`),
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
INSERT INTO `emp_ot` VALUES (-1,-1,-1,NULL,0.00,0.00,'N',NULL,-1,'2026-05-24 04:06:37',-1,'2026-05-24 04:06:37'),(1,1,1,'2026-01',12.50,8500.00,'Y','2026-05-25 08:22:13',1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(2,2,1,'2026-01',8.00,5200.00,'Y','2026-05-25 08:22:13',1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(3,3,2,'2026-01',15.75,11250.00,'N',NULL,1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(4,4,2,'2026-01',6.50,4300.00,'Y','2026-05-25 08:22:13',1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(5,5,1,'2026-01',10.00,7000.00,'N',NULL,1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(6,6,3,'2026-02',18.00,13500.00,'Y','2026-05-25 08:22:13',1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(7,7,2,'2026-02',5.25,3900.00,'N',NULL,1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(8,8,1,'2026-02',20.00,15000.00,'Y','2026-05-25 08:22:13',1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(9,9,3,'2026-02',7.50,5600.00,'N',NULL,1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13'),(10,10,2,'2026-02',11.00,8200.00,'Y','2026-05-25 08:22:13',1,'2026-05-25 02:52:13',1,'2026-05-25 02:52:13');
/*!40000 ALTER TABLE `emp_ot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_payroll_run`
--

DROP TABLE IF EXISTS `emp_payroll_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_payroll_run` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `emp_id` bigint NOT NULL,
  `payroll_month` varchar(20) NOT NULL,
  `basic_salary` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_allowances` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_deductions` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gross_pay` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net_pay` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` varchar(20) NOT NULL DEFAULT 'DRAFT' COMMENT 'DRAFT | PROCESSED | LOCKED',
  `processed_date` datetime DEFAULT NULL,
  `processed_by` bigint DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_emp_payroll_run` (`emp_id`,`payroll_month`),
  KEY `idx_run_emp_month` (`emp_id`,`payroll_month`),
  KEY `idx_run_status` (`status`),
  KEY `fk_run_processed_by` (`processed_by`),
  KEY `fk_run_created_by` (`created_by`),
  KEY `fk_run_modified_by` (`modified_by`),
  CONSTRAINT `fk_run_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_run_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_run_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_run_processed_by` FOREIGN KEY (`processed_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `chk_run_status` CHECK ((`status` in (_utf8mb4'DRAFT',_utf8mb4'PROCESSED',_utf8mb4'LOCKED')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_payroll_run`
--

LOCK TABLES `emp_payroll_run` WRITE;
/*!40000 ALTER TABLE `emp_payroll_run` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_payroll_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_payroll_run_detail`
--

DROP TABLE IF EXISTS `emp_payroll_run_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_payroll_run_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run_id` bigint NOT NULL,
  `component_type` varchar(10) NOT NULL COMMENT 'FA | FD | VA | VD | OT | NOPAY',
  `component_id` bigint NOT NULL,
  `component_code` varchar(20) NOT NULL,
  `component_name` varchar(150) NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `hours` decimal(5,2) DEFAULT NULL COMMENT 'OT only',
  `days` decimal(5,2) DEFAULT NULL COMMENT 'NOPAY only',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_run_detail` (`run_id`,`component_type`,`component_id`),
  KEY `idx_detail_run_id` (`run_id`),
  KEY `fk_detail_created_by` (`created_by`),
  KEY `fk_detail_modified_by` (`modified_by`),
  CONSTRAINT `fk_detail_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_detail_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_detail_run_id` FOREIGN KEY (`run_id`) REFERENCES `emp_payroll_run` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chk_detail_component_type` CHECK ((`component_type` in (_utf8mb4'FA',_utf8mb4'FD',_utf8mb4'VA',_utf8mb4'VD',_utf8mb4'OT',_utf8mb4'NOPAY')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_payroll_run_detail`
--

LOCK TABLES `emp_payroll_run_detail` WRITE;
/*!40000 ALTER TABLE `emp_payroll_run_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_payroll_run_detail` ENABLE KEYS */;
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
  `payroll_month` varchar(20) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `is_processed` char(1) NOT NULL DEFAULT 'N',
  `processed_date` datetime DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_emp_va` (`emp_id`,`va_id`,`payroll_month`),
  KEY `fk_emp_va_emp` (`emp_id`),
  KEY `fk_emp_va_va` (`va_id`),
  KEY `fk_emp_va_created_by` (`created_by`),
  KEY `fk_emp_va_modified_by` (`modified_by`),
  KEY `idx_emp_va_month` (`emp_id`,`payroll_month`),
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
INSERT INTO `emp_va` VALUES (-1,-1,-1,NULL,0.00,'N',NULL,-1,'2026-05-24 03:50:15',-1,'2026-05-24 03:50:15');
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
  `payroll_month` varchar(20) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `is_processed` char(1) NOT NULL DEFAULT 'N',
  `processed_date` datetime DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_emp_vd` (`emp_id`,`vd_id`,`payroll_month`),
  KEY `fk_emp_vd_emp` (`emp_id`),
  KEY `fk_emp_vd_vd` (`vd_id`),
  KEY `fk_emp_vd_created_by` (`created_by`),
  KEY `fk_emp_vd_modified_by` (`modified_by`),
  KEY `idx_emp_vd_month` (`emp_id`,`payroll_month`),
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
INSERT INTO `emp_vd` VALUES (-1,-1,-1,NULL,0.00,'N',NULL,-1,'2026-05-24 03:52:40',-1,'2026-05-24 03:52:40');
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
  `cotract_from` date DEFAULT NULL,
  `contract_to` date DEFAULT NULL,
  `nopay_days_id` bigint NOT NULL,
  `job_category_id` bigint NOT NULL,
  `designation_id` bigint NOT NULL,
  `branch_id` bigint NOT NULL,
  `grade_id` bigint NOT NULL,
  `status_id` bigint NOT NULL DEFAULT '1',
  `stat_date` date DEFAULT NULL,
  `stat_from` date DEFAULT NULL,
  `stat_to` date DEFAULT NULL,
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
  KEY `fk_employee_status_id` (`status_id`),
  CONSTRAINT `fk_employee_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `fk_employee_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `fk_employee_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_employee_designation` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`),
  CONSTRAINT `fk_employee_emp_type` FOREIGN KEY (`employee_type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `fk_employee_grade` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `fk_employee_job_category` FOREIGN KEY (`job_category_id`) REFERENCES `job_category` (`id`),
  CONSTRAINT `fk_employee_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_employee_nopay_days` FOREIGN KEY (`nopay_days_id`) REFERENCES `nopay_days` (`id`),
  CONSTRAINT `fk_employee_status_id` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `chk_employee_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (-1,'DEFAULT','System','Employee',NULL,NULL,'Y','Default Record','System Employee','N/A','N/A',0.00,'2026-05-17',-1,NULL,NULL,-1,-1,-1,-1,-1,-1,NULL,NULL,NULL,'0000000000','system@local','N/A','N/A','N/A','N/A',-1,'N/A','N/A','N/A',-1,'2026-05-17 12:34:46',-1,'2026-05-28 05:30:53'),(1,'EMP001','John','Fernando','1990-01-15','901234567V','Y','Active employee','John Fernando','EPF001','ETF001',85000.00,'2022-01-10',1,NULL,NULL,1,1,1,1,1,3,NULL,NULL,NULL,'0771000001','john1@idealpay.com','No 10','Main Street','Colombo','Colombo',1,'Mary Fernando','No 10 Main Street','0779000001',1,'2026-05-20 02:28:27',1,'2026-05-29 01:50:08'),(2,'EMP002','Kamal','Perera','1988-03-21','881234568V','Y','Senior staff','Kamal Perera','EPF002','ETF002',95000.00,'2021-05-12',2,'2026-05-01','2026-05-28',1,2,2,2,2,1,NULL,NULL,NULL,'0771000002','kamal2@idealpay.com','No 20','Lake Road','Kandy','Kandy',1,'Nimali Perera','No 20 Lake Road','0779000002',1,'2026-05-20 02:28:27',1,'2026-05-28 18:00:09'),(3,'EMP003','Nimal','Silva','1992-07-11','921234569V','Y','IT employee','Nimal Silva','EPF003','ETF003',78000.00,'2023-02-01',1,NULL,NULL,1,1,3,1,1,1,NULL,NULL,NULL,'0771000003','nimal3@idealpay.com','No 30','Temple Road','Galle','Galle',1,'Suneth Silva','No 30 Temple Road','0779000003',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(4,'EMP004','Saman','Jayasinghe','1991-09-19','911234570V','Y','Finance staff','Saman Jayasinghe','EPF004','ETF004',88000.00,'2020-03-14',2,NULL,NULL,1,3,4,2,2,1,NULL,NULL,NULL,'0771000004','saman4@idealpay.com','No 40','Flower Road','Kurunegala','Kurunegala',1,'Anoma Jayasinghe','No 40 Flower Road','0779000004',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(5,'EMP005','Ruwan','Dias','1987-12-05','871234571V','Y','HR Executive','Ruwan Dias','EPF005','ETF005',92000.00,'2019-08-22',2,NULL,NULL,1,2,5,3,3,1,NULL,NULL,NULL,'0771000005','ruwan5@idealpay.com','No 50','Station Road','Matara','Matara',1,'Kumari Dias','No 50 Station Road','0779000005',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(6,'EMP006','Tharindu','Peris','1993-11-12','931234572V','Y','Operations staff','Tharindu Peris','EPF006','ETF006',73000.00,'2024-01-01',1,NULL,NULL,1,4,2,1,1,1,NULL,NULL,NULL,'0771000006','tharindu6@idealpay.com','No 60','Park Lane','Negombo','Gampaha',1,'Rashmi Peris','No 60 Park Lane','0779000006',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(7,'EMP007','Ashan','Fernando','1995-05-17','951234573V','Y','Support engineer','Ashan Fernando','EPF007','ETF007',67000.00,'2023-07-10',1,NULL,NULL,1,1,3,2,2,1,NULL,NULL,NULL,'0771000007','ashan7@idealpay.com','No 70','Sea Road','Kalutara','Kalutara',1,'Nadeesha Fernando','No 70 Sea Road','0779000007',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(8,'EMP008','Dilshan','Gunawardena','1990-08-23','901234574V','Y','Marketing executive','Dilshan Gunawardena','EPF008','ETF008',81000.00,'2021-11-15',2,NULL,NULL,1,5,6,3,2,1,NULL,NULL,NULL,'0771000008','dilshan8@idealpay.com','No 80','Market Street','Jaffna','Jaffna',1,'Chathuri Gunawardena','No 80 Market Street','0779000008',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(9,'EMP009','Charith','Silva','1989-06-10','891234575V','Y','Sales executive','Charith Silva','EPF009','ETF009',76000.00,'2022-04-18',1,NULL,NULL,1,5,6,2,1,1,NULL,NULL,NULL,'0771000009','charith9@idealpay.com','No 90','Hospital Road','Badulla','Badulla',1,'Piumi Silva','No 90 Hospital Road','0779000009',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(10,'EMP010','Kasun','Madushanka','1994-04-09','941234576V','Y','Junior accountant','Kasun Madushanka','EPF010','ETF010',69000.00,'2023-09-20',1,NULL,NULL,1,3,4,1,1,1,NULL,NULL,NULL,'0771000010','kasun10@idealpay.com','No 100','River Road','Anuradhapura','Anuradhapura',1,'Sanduni Madushanka','No 100 River Road','0779000010',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(11,'EMP011','Isuru','Perera','1991-10-14','911234577V','Y','Warehouse staff','Isuru Perera','EPF011','ETF011',64000.00,'2022-05-11',1,NULL,NULL,1,4,2,3,1,1,NULL,NULL,NULL,'0771000011','isuru11@idealpay.com','No 11','Hill Street','Ratnapura','Ratnapura',1,'Nilmini Perera','No 11 Hill Street','0779000011',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(12,'EMP012','Ravindu','Silva','1988-02-27','881234578V','Y','System admin','Ravindu Silva','EPF012','ETF012',120000.00,'2018-01-15',2,NULL,NULL,1,1,1,1,3,1,NULL,NULL,NULL,'0771000012','ravindu12@idealpay.com','No 12','Palm Avenue','Colombo','Colombo',1,'Sachini Silva','No 12 Palm Avenue','0779000012',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(13,'EMP013','Nuwan','Fernando','1996-12-01','961234579V','Y','Support staff','Nuwan Fernando','EPF013','ETF013',58000.00,'2024-03-01',1,NULL,NULL,1,7,7,2,1,1,NULL,NULL,NULL,'0771000013','nuwan13@idealpay.com','No 13','Church Road','Panadura','Kalutara',1,'Maleesha Fernando','No 13 Church Road','0779000013',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(14,'EMP014','Sachin','Peris','1992-01-08','921234580V','Y','Developer','Sachin Peris','EPF014','ETF014',98000.00,'2021-06-16',1,NULL,NULL,1,1,3,1,2,1,NULL,NULL,NULL,'0771000014','sachin14@idealpay.com','No 14','Green Road','Moratuwa','Colombo',1,'Yasasvi Peris','No 14 Green Road','0779000014',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(15,'EMP015','Lahiru','Jayasuriya','1993-07-07','931234581V','Y','Analyst','Lahiru Jayasuriya','EPF015','ETF015',83000.00,'2020-12-10',1,NULL,NULL,1,3,4,2,2,1,NULL,NULL,NULL,'0771000015','lahiru15@idealpay.com','No 15','Canal Road','Hambantota','Hambantota',1,'Harini Jayasuriya','No 15 Canal Road','0779000015',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(16,'EMP016','Prabath','Fernando','1987-11-03','871234582V','Y','Manager','Prabath Fernando','EPF016','ETF016',140000.00,'2017-09-01',2,NULL,NULL,1,4,1,1,3,1,NULL,NULL,NULL,'0771000016','prabath16@idealpay.com','No 16','Sunset Road','Colombo','Colombo',1,'Dilini Fernando','No 16 Sunset Road','0779000016',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(17,'EMP017','Roshan','Perera','1995-09-29','951234583V','Y','Coordinator','Roshan Perera','EPF017','ETF017',72000.00,'2023-01-05',1,NULL,NULL,1,2,5,3,1,1,NULL,NULL,NULL,'0771000017','roshan17@idealpay.com','No 17','Temple Lane','Kegalle','Kegalle',1,'Pabasara Perera','No 17 Temple Lane','0779000017',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(18,'EMP018','Madhawa','Silva','1994-06-18','941234584V','Y','Assistant','Madhawa Silva','EPF018','ETF018',61000.00,'2022-08-20',1,NULL,NULL,1,7,7,2,1,1,NULL,NULL,NULL,'0771000018','madhawa18@idealpay.com','No 18','Cross Street','Trincomalee','Trincomalee',1,'Ruwini Silva','No 18 Cross Street','0779000018',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(19,'EMP019','Danushka','Dias','1990-03-13','901234585V','Y','Executive','Danushka Dias','EPF019','ETF019',89000.00,'2021-10-11',2,NULL,NULL,1,5,6,1,2,1,NULL,NULL,NULL,'0771000019','danushka19@idealpay.com','No 19','Lake View','Batticaloa','Batticaloa',1,'Pavithra Dias','No 19 Lake View','0779000019',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(20,'EMP020','Shehan','Fernando','1989-08-08','891234586V','Y','Senior Developer','Shehan Fernando','EPF020','ETF020',135000.00,'2019-04-01',2,NULL,NULL,1,1,1,1,3,1,NULL,NULL,NULL,'0771000020','shehan20@idealpay.com','No 20','Marine Drive','Colombo','Colombo',1,'Keshani Fernando','No 20 Marine Drive','0779000020',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(21,'EMP021','Ayesh','Perera','1991-12-24','911234587V','Y','QA Engineer','Ayesh Perera','EPF021','ETF021',87000.00,'2020-06-21',1,NULL,NULL,1,1,3,2,2,1,NULL,NULL,NULL,'0771000021','ayesh21@idealpay.com','No 21','Railway Road','Gampaha','Gampaha',1,'Thilini Perera','No 21 Railway Road','0779000021',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(22,'EMP022','Kavindu','Silva','1996-05-14','961234588V','Y','Support Officer','Kavindu Silva','EPF022','ETF022',55000.00,'2024-02-12',1,NULL,NULL,1,7,7,3,1,1,NULL,NULL,NULL,'0771000022','kavindu22@idealpay.com','No 22','Hill Road','Matale','Matale',1,'Shenali Silva','No 22 Hill Road','0779000022',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(23,'EMP023','Pasindu','Fernando','1993-04-02','931234589V','Y','Operations Executive','Pasindu Fernando','EPF023','ETF023',79000.00,'2021-09-15',1,NULL,NULL,1,4,2,1,2,1,NULL,NULL,NULL,'0771000023','pasindu23@idealpay.com','No 23','Main Avenue','Nuwara Eliya','Nuwara Eliya',1,'Dinithi Fernando','No 23 Main Avenue','0779000023',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(24,'EMP024','Thilina','Jayawardena','1992-07-20','921234590V','Y','Sales Manager','Thilina Jayawardena','EPF024','ETF024',115000.00,'2018-11-05',2,NULL,NULL,1,5,6,2,3,1,NULL,NULL,NULL,'0771000024','thilina24@idealpay.com','No 24','Queens Road','Kurunegala','Kurunegala',1,'Hashini Jayawardena','No 24 Queens Road','0779000024',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(25,'EMP025','Vishwa','Gunasekara','1990-10-10','901234591V','Y','HR Manager','Vishwa Gunasekara','EPF025','ETF025',125000.00,'2017-07-17',2,NULL,NULL,1,2,5,1,3,1,NULL,NULL,NULL,'0771000025','vishwa25@idealpay.com','No 25','Flower Garden','Colombo','Colombo',1,'Rashika Gunasekara','No 25 Flower Garden','0779000025',1,'2026-05-20 02:28:27',1,'2026-05-28 05:30:26'),(26,'12334','Jezeem','Aymen','2026-05-01','1234567','Y',NULL,'Noohulebbe jezeem Aymen','123','1234',25000.00,'2026-05-28',1,NULL,NULL,1,1,1,1,1,1,NULL,NULL,NULL,NULL,'jzmamn@gmail.com',NULL,NULL,NULL,NULL,130,NULL,NULL,NULL,1,'2026-05-29 02:16:28',1,'2026-05-29 02:16:28');
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
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'N',
  `is_taxable` varchar(1) NOT NULL DEFAULT 'N',
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
  UNIQUE KEY `uk_fixed_allowance_code` (`code`),
  UNIQUE KEY `code` (`code`),
  KEY `fk_fixed_allowance_created_by` (`created_by`),
  KEY `fk_fixed_allowance_modified_by` (`modified_by`),
  CONSTRAINT `fk_fixed_allowance_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_fixed_allowance_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `chk_fixed_allowance_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_allowance_epf` CHECK ((`liable_for_epf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_allowance_etf` CHECK ((`liable_for_etf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_allowance_no_pay` CHECK ((`liable_no_pay` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_allowance_paye` CHECK ((`liable_for_paye` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_allowance`
--

LOCK TABLES `fixed_allowance` WRITE;
/*!40000 ALTER TABLE `fixed_allowance` DISABLE KEYS */;
INSERT INTO `fixed_allowance` VALUES (-1,'DEFAULT','Default Fixed Allowance','System Default Fixed Allowance',0.00,'Y','N','N','N','N','N',NULL,'N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'FA001','Transport Allowance','Monthly transport allowance',5000.00,'Y','Y','Y','Y','Y','Y',NULL,'N',1,'2026-05-17 15:05:08',1,'2026-05-19 00:05:20'),(2,'FA002','Meal Allowance','Daily meal support allowance',3000.00,'Y','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(3,'FA003','Housing Allowance','Housing rent support',15000.00,'Y','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(4,'FA004','Mobile Allowance','Mobile phone allowance',2000.00,'Y','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(5,'FA005','Internet Allowance','Internet reimbursement',2500.00,'N','Y','Y','Y','Y','Y',NULL,'N',1,'2026-05-17 15:05:08',1,'2026-05-19 00:05:20'),(6,'FA006','Fuel Allowance','Fuel and travel allowance',8000.00,'Y','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(7,'FA007','Performance Bonus','Monthly performance bonus',10000.00,'Y','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(8,'FA008','Attendance Bonus','Attendance incentive bonus',4000.00,'Y','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(9,'FA009','Shift Allowance','Shift based allowance',6000.00,'Y','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(10,'FA010','Special Allowance','Special management allowance',12000.00,'Y','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(11,'FA011','Festival Allowance','Annual festival bonus allowance',7000.00,'Y','Y','Y','Y','Y','N',NULL,'N',1,'2026-05-17 15:05:08',1,'2026-05-17 15:05:08'),(12,'FA_12','Tesst001','faes',1000.00,'Y','Y','N','Y','N','Y','basicSalary * 2','Y',1,'2026-05-27 18:38:23',1,'2026-05-27 18:40:16'),(13,'FA_13','Test 0002','Test 0002',1344.00,'Y','Y','Y','N','N','Y','basicSalary * nopayDays','Y',1,'2026-05-27 18:41:03',1,'2026-05-28 00:08:09');
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
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'N',
  `is_taxable` char(1) NOT NULL DEFAULT 'N',
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
  UNIQUE KEY `uk_fixed_deduction_code` (`code`),
  UNIQUE KEY `code` (`code`),
  KEY `fk_fixed_deduction_created_by` (`created_by`),
  KEY `fk_fixed_deduction_modified_by` (`modified_by`),
  CONSTRAINT `fk_fixed_deduction_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_fixed_deduction_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `chk_fixed_deduction_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_deduction_epf` CHECK ((`liable_for_epf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_deduction_etf` CHECK ((`liable_for_etf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_deduction_no_pay` CHECK ((`liable_no_pay` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_fixed_deduction_paye` CHECK ((`liable_for_paye` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_deduction`
--

LOCK TABLES `fixed_deduction` WRITE;
/*!40000 ALTER TABLE `fixed_deduction` DISABLE KEYS */;
INSERT INTO `fixed_deduction` VALUES (-1,'DEFAULT','Default Fixed Deduction','System Default Fixed Deduction',0.00,'Y','N','N','N','N','N',NULL,'N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'FD001','EPF Contribution','Employee EPF deduction',2000.00,'Y','N','Y','Y','N','N','basicSalary/FD006','Y',1,'2026-05-17 15:05:37',1,'2026-05-28 00:09:44'),(2,'FD002','ETF Contribution','Employee ETF deduction',1000.00,'Y','N','Y','Y','N','N',NULL,'N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(3,'FD003','Tax Deduction','Income tax deduction',5000.00,'Y','Y','N','N','Y','N',NULL,'N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(4,'FD004','Loan Installment','Monthly loan repayment',3000.00,'Y','N','N','N','N','N',NULL,'N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(5,'FD005','Advance Recovery','Salary advance recovery',1500.00,'Y','N','N','N','N','N',NULL,'N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(6,'FD006','Penalty Deduction','Late/disciplinary penalty',2000.00,'Y','N','N','N','N','Y',NULL,'N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(7,'FD007','Insurance Deduction','Employee insurance premium',1200.00,'Y','N','N','N','N','N',NULL,'N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(8,'FD008','Equipment Recovery','Recovery for company equipment',2500.00,'Y','N','N','N','N','N',NULL,'N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(9,'FD009','Union Fee','Trade union membership fee',800.00,'Y','N','N','N','N','N',NULL,'N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(10,'FD010','Absence Deduction','No pay absence deduction',1000.00,'Y','N','N','N','N','Y',NULL,'N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(11,'FD011','Misc Deduction','Other miscellaneous deductions',500.00,'Y','N','N','N','N','N',NULL,'N',1,'2026-05-17 15:05:37',1,'2026-05-17 15:05:37'),(12,'FD_12','Test0001','Test0001',1000.00,'Y','N','Y','N','N','Y','basicSalary/workingDays','Y',1,'2026-05-28 00:10:28',1,'2026-05-28 00:10:28');
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
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_grade_code` (`code`),
  UNIQUE KEY `code` (`code`),
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
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_job_category_code` (`code`),
  UNIQUE KEY `code` (`code`),
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
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `days` decimal(5,2) DEFAULT '0.00',
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_nopay_days_code` (`code`),
  UNIQUE KEY `code` (`code`),
  KEY `fk_nopay_days_created_by` (`created_by`),
  KEY `fk_nopay_days_modified_by` (`modified_by`),
  CONSTRAINT `fk_nopay_days_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_nopay_days_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nopay_days`
--

LOCK TABLES `nopay_days` WRITE;
/*!40000 ALTER TABLE `nopay_days` DISABLE KEYS */;
INSERT INTO `nopay_days` VALUES (-1,'SYS','System Default',0.00,'N','System default no-pay configuration',-1,'2026-05-29 04:40:30',-1,'2026-05-29 04:40:30'),(1,'NP001','Half Day No Pay',25.00,'Y','Half-day salary deduction',-1,'2026-05-29 04:40:30',-1,'2026-05-29 04:40:30'),(2,'NP002','Full Day No Pay',26.00,'Y','Full-day salary deduction',-1,'2026-05-29 04:40:30',-1,'2026-05-29 04:40:30'),(3,'NP003','Late Attendance No Pay',30.00,'Y','Quarter-day no-pay deduction for late attendance',-1,'2026-05-29 04:40:30',-1,'2026-05-29 04:40:30');
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
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `formula` varchar(500) DEFAULT NULL,
  `formula_enabled` char(1) NOT NULL DEFAULT 'N',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_overtime_code` (`code`),
  UNIQUE KEY `code` (`code`),
  KEY `fk_overtime_created_by` (`created_by`),
  KEY `fk_overtime_modified_by` (`modified_by`),
  CONSTRAINT `fk_overtime_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_overtime_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtime`
--

LOCK TABLES `overtime` WRITE;
/*!40000 ALTER TABLE `overtime` DISABLE KEYS */;
INSERT INTO `overtime` VALUES (-1,'DEFAULT','Default Overtime','Y','System Default Overtime',NULL,'N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'OT001','Normal Overtime','Y','Standard overtime rate (1x)','basicSalary *2','Y',1,'2026-05-17 15:08:45',1,'2026-05-27 17:13:41'),(2,'OT002','Weekend Overtime','Y','Weekend overtime rate (1.5x)',NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(3,'OT003','Holiday Overtime','Y','Public holiday overtime (2x)',NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(4,'OT004','Night Shift OT','Y','Night shift overtime allowance',NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(5,'OT005','Weekday OT','Y','Updated weekday overtime','(basicSalary / workingDays / 8) * otHours ','Y',1,'2026-05-17 15:08:45',1,'2026-05-27 17:12:49'),(6,'OT006','Project OT','Y','Project based overtime',NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(7,'OT007','Field OT','Y','Field work overtime',NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(8,'OT008','Travel OT','Y','Travel related overtime',NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(9,'OT009','Extra Shift OT','Y','Additional shift overtime',NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(10,'OT010','Double Shift OT','Y','Double shift overtime pay',NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(11,'OT011','Special Assignment OT','Y','Special assignment overtime',NULL,'N',1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(12,'OT_12','POSTMAN0001','Y','PM_Test 0001','(basicSalary / workingDays / 8) * otHours * otRate','Y',1,'2026-05-27 01:13:48',1,'2026-05-27 06:03:49'),(13,'OT_13','Overtime Test','Y','Overtime Test',NULL,'N',1,'2026-05-27 08:27:03',1,'2026-05-27 08:27:03'),(14,'OT_14','Overtime test 1','Y','Overtime test 1',NULL,'N',1,'2026-05-27 08:27:29',1,'2026-05-27 08:27:29'),(15,'OT_15','test 0001','Y','test 0001','basicSalary/2','Y',1,'2026-05-27 17:14:29',1,'2026-05-27 17:14:29');
/*!40000 ALTER TABLE `overtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` bigint NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `date_only` char(1) DEFAULT 'N',
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_status_code` (`code`),
  KEY `fk_status_created_by` (`created_by`),
  KEY `fk_status_modified_by` (`modified_by`),
  CONSTRAINT `fk_status_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_status_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (-1,'DEF','Default','N','Y','Default system status record',-1,'2026-05-28 03:38:52',-1,'2026-05-28 03:38:52'),(1,'ACT','Active','N','Y','Employee is currently active',-1,'2026-05-28 03:44:15',-1,'2026-05-28 03:44:15'),(2,'HOLD','Hold','N','Y','Employee is temporarily on hold',-1,'2026-05-28 03:44:15',-1,'2026-05-28 17:11:31'),(3,'TERM','Terminate','Y','Y','Employee has been terminated',-1,'2026-05-28 03:44:15',-1,'2026-05-28 03:45:08');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(255) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `is_date_range` char(1) DEFAULT 'N',
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (-1,'DEFAULT','Default Employee Type','System Default Employee Type','Y','N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'ET001','Permanent','Permanent Employee','Y','N',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(2,'ET002','Contract','Contract Employee','Y','Y',1,'2026-05-17 13:34:49',1,'2026-05-28 13:42:55'),(3,'ET003','Temporary','Temporary Employee','Y','N',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(4,'ET004','Intern','Intern Employee','Y','N',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(5,'ET005','Part Time','Part Time Employee','Y','N',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(6,'ET006','Consultant','Consultant','Y','N',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(7,'ET007','Probation','Probation Employee','Y','N',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(8,'ET008','Remote','Remote Employee','Y','N',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(9,'ET009','Freelance','Freelancer','Y','N',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(10,'ET010','Seasonal','Seasonal Employee','Y','N',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49'),(11,'ET011','Casual','Casual Employee','Y','N',1,'2026-05-17 13:34:49',1,'2026-05-17 13:34:49');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'N',
  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_role_code` (`code`),
  UNIQUE KEY `code` (`code`),
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
  `code` varchar(10) DEFAULT NULL,
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
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `uk_users_code` (`code`),
  UNIQUE KEY `code` (`code`),
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
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
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
  UNIQUE KEY `uk_variable_allowance_code` (`code`),
  UNIQUE KEY `code` (`code`),
  KEY `fk_variable_allowance_created_by` (`created_by`),
  KEY `fk_variable_allowance_modified_by` (`modified_by`),
  CONSTRAINT `fk_variable_allowance_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_variable_allowance_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `chk_variable_allowance_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_allowance_epf` CHECK ((`liable_for_epf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_allowance_etf` CHECK ((`liable_for_etf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_allowance_no_pay` CHECK ((`liable_no_pay` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_allowance_paye` CHECK ((`liable_for_paye` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable_allowance`
--

LOCK TABLES `variable_allowance` WRITE;
/*!40000 ALTER TABLE `variable_allowance` DISABLE KEYS */;
INSERT INTO `variable_allowance` VALUES (-1,'DEFAULT','Default Variable Allowance',NULL,'Y','N','N','N','N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'VA001','Overtime Allowance',NULL,'Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(2,'VA002','Performance Bonus',NULL,'Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(3,'VA003','Sales Incentive',NULL,'Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(4,'VA004','Project Bonus',NULL,'Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(5,'VA005','Attendance Bonus',NULL,'Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(6,'VA006','Commission',NULL,'Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(7,'VA007','Festival Bonus',NULL,'Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(8,'VA008','Shift Incentive',NULL,'Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(9,'VA009','Target Achievement',NULL,'Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(10,'VA010','Special Incentive',NULL,'Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(11,'VA011','Extra Duty Allowance',NULL,'Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(12,'VA_12','Test','1234','Y','Y','Y','N','Y',1,'2026-05-28 00:08:35',1,'2026-05-28 00:08:52');
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
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
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
  UNIQUE KEY `uk_variable_deductions_code` (`code`),
  UNIQUE KEY `code` (`code`),
  KEY `fk_variable_deductions_created_by` (`created_by`),
  KEY `fk_variable_deductions_modified_by` (`modified_by`),
  CONSTRAINT `fk_variable_deductions_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_variable_deductions_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `chk_variable_deductions_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_deductions_epf` CHECK ((`liable_for_epf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_deductions_etf` CHECK ((`liable_for_etf` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_deductions_no_pay` CHECK ((`liable_no_pay` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `chk_variable_deductions_paye` CHECK ((`liable_for_paye` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable_deduction`
--

LOCK TABLES `variable_deduction` WRITE;
/*!40000 ALTER TABLE `variable_deduction` DISABLE KEYS */;
INSERT INTO `variable_deduction` VALUES (-1,'DEFAULT','Default Variable Deduction',NULL,'Y','N','N','N','N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'VD001','Late Attendance Deduction',NULL,'Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(2,'VD002','Early Leave Deduction',NULL,'Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(3,'VD003','Absence Deduction','123','Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-28 00:11:13'),(4,'VD004','Penalty Deduction',NULL,'Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(5,'VD005','Disciplinary Deduction',NULL,'Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(6,'VD006','Damage Recovery',NULL,'N','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-28 00:12:21'),(7,'VD007','Loan Adjustment',NULL,'Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(8,'VD008','Advance Adjustment',NULL,'Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(9,'VD009','Leave Without Pay',NULL,'Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(10,'VD010','System Adjustment',NULL,'Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(11,'VD011','Misc Deduction',NULL,'Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27');
/*!40000 ALTER TABLE `variable_deduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ideal_pay'
--

--
-- Dumping routines for database 'ideal_pay'
--
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_emp_fa_pivot`(IN p_payroll_month VARCHAR(20))
BEGIN
    DECLARE v_columns LONGTEXT DEFAULT '';
    DECLARE v_sql     LONGTEXT DEFAULT '';

    SET SESSION group_concat_max_len = 1000000;

    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN fa.id = ', fa.id,
            ' THEN IFNULL(ef.amount, 0) ELSE 0 END) AS `', fa.code, '`'
        )
        ORDER BY fa.id
        SEPARATOR ', '
    )
    INTO v_columns
    FROM fixed_allowance fa
    WHERE fa.is_active = 'Y';

    IF v_columns IS NULL OR v_columns = '' THEN
        SET v_columns = '0 AS no_active_components';
    END IF;

    SET v_sql = CONCAT(
        'SELECT
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name,
            e.basic_salary, ',
        v_columns,
        ' FROM employee e
        LEFT JOIN emp_fa ef
            ON e.id = ef.emp_id
            AND ef.payroll_month = ''', p_payroll_month, '''
        LEFT JOIN fixed_allowance fa
            ON ef.fa_id = fa.id
        WHERE e.is_active = ''Y''
        GROUP BY e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_emp_fd_pivot`(IN p_payroll_month VARCHAR(20))
BEGIN
    DECLARE v_columns LONGTEXT DEFAULT '';
    DECLARE v_sql     LONGTEXT DEFAULT '';

    SET SESSION group_concat_max_len = 1000000;

    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN fd.id = ', fd.id,
            ' THEN IFNULL(efd.amount, 0) ELSE 0 END) AS `', fd.code, '`'
        )
        ORDER BY fd.id
        SEPARATOR ', '
    )
    INTO v_columns
    FROM fixed_deduction fd
    WHERE fd.is_active = 'Y';

    IF v_columns IS NULL OR v_columns = '' THEN
        SET v_columns = '0 AS no_active_components';
    END IF;

    SET v_sql = CONCAT(
        'SELECT
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name,
            e.basic_salary, ',
        v_columns,
        ' FROM employee e
        LEFT JOIN emp_fd efd
            ON e.id = efd.emp_id
            AND efd.payroll_month = ''', p_payroll_month, '''
        LEFT JOIN fixed_deduction fd
            ON efd.fd_id = fd.id
        WHERE e.is_active = ''Y''
        GROUP BY e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_emp_np_pivot`(IN p_payroll_month VARCHAR(20))
BEGIN
    DECLARE v_columns LONGTEXT DEFAULT '';
    DECLARE v_sql     LONGTEXT DEFAULT '';

    SET SESSION group_concat_max_len = 1000000;

    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN nd.id = ', nd.id,
            ' THEN IFNULL(enp.days,   0) ELSE 0 END) AS `', nd.code, '_days`, ',
            'SUM(CASE WHEN nd.id = ', nd.id,
            ' THEN IFNULL(enp.amount, 0) ELSE 0 END) AS `', nd.code, '_amount`'
        )
        ORDER BY nd.id
        SEPARATOR ', '
    )
    INTO v_columns
    FROM nopay_days nd
    WHERE nd.is_active = 'Y';

    IF v_columns IS NULL OR v_columns = '' THEN
        SET v_columns = '0 AS no_active_components';
    END IF;

    SET v_sql = CONCAT(
        'SELECT
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name,
            e.basic_salary, ',
        v_columns,
        ' FROM employee e
        LEFT JOIN emp_np enp
            ON e.id = enp.emp_id
            AND enp.payroll_month = ''', p_payroll_month, '''
        LEFT JOIN nopay_days nd
            ON enp.nopay_id = nd.id
        WHERE e.is_active = ''Y''
        GROUP BY e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_emp_ot_pivot`(IN p_payroll_month VARCHAR(20))
BEGIN
    DECLARE v_columns LONGTEXT DEFAULT '';
    DECLARE v_sql     LONGTEXT DEFAULT '';

    SET SESSION group_concat_max_len = 1000000;

    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN ot.id = ', ot.id,
            ' THEN IFNULL(eot.hours,  0) ELSE 0 END) AS `', ot.code, '_hours`, ',
            'SUM(CASE WHEN ot.id = ', ot.id,
            ' THEN IFNULL(eot.amount, 0) ELSE 0 END) AS `', ot.code, '_amount`'
        )
        ORDER BY ot.id
        SEPARATOR ', '
    )
    INTO v_columns
    FROM overtime ot
    WHERE ot.is_active = 'Y';

    IF v_columns IS NULL OR v_columns = '' THEN
        SET v_columns = '0 AS no_active_components';
    END IF;

    SET v_sql = CONCAT(
        'SELECT
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name,
            e.basic_salary, ',
        v_columns,
        ' FROM employee e
        LEFT JOIN emp_ot eot
            ON e.id = eot.emp_id
            AND eot.payroll_month = ''', p_payroll_month, '''
        LEFT JOIN overtime ot
            ON eot.overtime_id = ot.id
        WHERE e.is_active = ''Y''
        GROUP BY e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_emp_va_pivot`(IN p_payroll_month VARCHAR(20))
BEGIN
    DECLARE v_columns LONGTEXT DEFAULT '';
    DECLARE v_sql     LONGTEXT DEFAULT '';

    SET SESSION group_concat_max_len = 1000000;

    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN va.id = ', va.id,
            ' THEN IFNULL(eva.amount, 0) ELSE 0 END) AS `', va.code, '`'
        )
        ORDER BY va.id
        SEPARATOR ', '
    )
    INTO v_columns
    FROM variable_allowance va
    WHERE va.is_active = 'Y';

    IF v_columns IS NULL OR v_columns = '' THEN
        SET v_columns = '0 AS no_active_components';
    END IF;

    SET v_sql = CONCAT(
        'SELECT
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name,
            e.basic_salary, ',
        v_columns,
        ' FROM employee e
        LEFT JOIN emp_va eva
            ON e.id = eva.emp_id
            AND eva.payroll_month = ''', p_payroll_month, '''
        LEFT JOIN variable_allowance va
            ON eva.va_id = va.id
        WHERE e.is_active = ''Y''
        GROUP BY e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_emp_vd_pivot`(IN p_payroll_month VARCHAR(20))
BEGIN
    DECLARE v_columns LONGTEXT DEFAULT '';
    DECLARE v_sql     LONGTEXT DEFAULT '';

    SET SESSION group_concat_max_len = 1000000;

    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN vd.id = ', vd.id,
            ' THEN IFNULL(evd.amount, 0) ELSE 0 END) AS `', vd.code, '`'
        )
        ORDER BY vd.id
        SEPARATOR ', '
    )
    INTO v_columns
    FROM variable_deduction vd
    WHERE vd.is_active = 'Y';

    IF v_columns IS NULL OR v_columns = '' THEN
        SET v_columns = '0 AS no_active_components';
    END IF;

    SET v_sql = CONCAT(
        'SELECT
            e.id,
            e.employee_no,
            e.first_name,
            e.last_name,
            e.payroll_name,
            e.basic_salary, ',
        v_columns,
        ' FROM employee e
        LEFT JOIN emp_vd evd
            ON e.id = evd.emp_id
            AND evd.payroll_month = ''', p_payroll_month, '''
        LEFT JOIN variable_deduction vd
            ON evd.vd_id = vd.id
        WHERE e.is_active = ''Y''
        GROUP BY e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary
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
                    AND ef.payroll_month = p_payroll_month),0)
            +
            IFNULL((SELECT SUM(eva.amount)
                    FROM emp_va eva
                    WHERE eva.emp_id = e.id
                    AND eva.payroll_month = p_payroll_month),0)
        ) AS Allowances,
        /* =========================
           OVERTIME
        ========================= */
        IFNULL((SELECT SUM(eot.amount)
                FROM emp_ot eot
                WHERE eot.emp_id = e.id
                AND eot.payroll_month = p_payroll_month),0) AS OT,
        /* =========================
           GROSS
        ========================= */
        (
            e.basic_salary
            +
            IFNULL((SELECT SUM(ef.amount)
                    FROM emp_fa ef
                    WHERE ef.emp_id = e.id
                    AND ef.payroll_month = p_payroll_month),0)
            +
            IFNULL((SELECT SUM(eva.amount)
                    FROM emp_va eva
                    WHERE eva.emp_id = e.id
                    AND eva.payroll_month = p_payroll_month),0)
            +
            IFNULL((SELECT SUM(eot.amount)
                    FROM emp_ot eot
                    WHERE eot.emp_id = e.id
                    AND eot.payroll_month = p_payroll_month),0)
        ) AS Gross,
        /* =========================
           DEDUCTIONS
        ========================= */
        (
            IFNULL((SELECT SUM(efd.amount)
                    FROM emp_fd efd
                    WHERE efd.emp_id = e.id
                    AND efd.payroll_month = p_payroll_month),0)
            +
            IFNULL((SELECT SUM(evd.amount)
                    FROM emp_vd evd
                    WHERE evd.emp_id = e.id
                    AND evd.payroll_month = p_payroll_month),0)
            +
            IFNULL((SELECT SUM(enp.amount)
                    FROM emp_np enp
                    WHERE enp.emp_id = e.id
                    AND enp.payroll_month = p_payroll_month),0)
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
                        AND ef.payroll_month = p_payroll_month),0)
                +
                IFNULL((SELECT SUM(eva.amount)
                        FROM emp_va eva
                        WHERE eva.emp_id = e.id
                        AND eva.payroll_month = p_payroll_month),0)
                +
                IFNULL((SELECT SUM(eot.amount)
                        FROM emp_ot eot
                        WHERE eot.emp_id = e.id
                        AND eot.payroll_month = p_payroll_month),0)
            )
            -
            (
                IFNULL((SELECT SUM(efd.amount)
                        FROM emp_fd efd
                        WHERE efd.emp_id = e.id
                        AND efd.payroll_month = p_payroll_month),0)
                +
                IFNULL((SELECT SUM(evd.amount)
                        FROM emp_vd evd
                        WHERE evd.emp_id = e.id
                        AND evd.payroll_month = p_payroll_month),0)
                +
                IFNULL((SELECT SUM(enp.amount)
                        FROM emp_np enp
                        WHERE enp.emp_id = e.id
                        AND enp.payroll_month = p_payroll_month),0)
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-31  8:13:07
