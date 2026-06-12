-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: ideal_pay_license
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_customer_code` (`customer_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'DEV','Dev',NULL,NULL,NULL,NULL,1,'2026-06-10 05:12:54.214207','2026-06-10 05:12:54.215207'),(2,'CMP001','Ideal Pay Solutions',NULL,NULL,NULL,NULL,1,'2026-06-10 05:29:32.720789','2026-06-10 05:29:32.720789');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issued_license`
--

DROP TABLE IF EXISTS `issued_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issued_license` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `license_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint NOT NULL,
  `plan` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_limit` int NOT NULL,
  `valid_from` date NOT NULL,
  `valid_till` date NOT NULL,
  `maintenance_available` tinyint(1) NOT NULL,
  `encrypted_payload` tinyint(1) NOT NULL,
  `license_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `raw_license_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued_at` datetime(6) NOT NULL,
  `revoked_at` datetime(6) DEFAULT NULL,
  `revocation_reason` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_issued_license_id` (`license_id`),
  KEY `idx_issued_license_customer` (`customer_id`),
  KEY `idx_issued_license_issued_at` (`issued_at`),
  CONSTRAINT `fk_issued_license_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issued_license`
--

LOCK TABLES `issued_license` WRITE;
/*!40000 ALTER TABLE `issued_license` DISABLE KEYS */;
INSERT INTO `issued_license` VALUES (1,'ec3f27e1-1a27-4350-af3c-aa989adab7f2',1,'STANDARD',25,'2026-06-10','2027-06-10',1,1,'ACTIVE','eyJmb3JtYXRWZXJzaW9uIjoxLCJrZXlJZCI6ImlkZWFscGF5LWRldi0xIiwiZW5jcnlwdGVkIjp0\r\ncnVlLCJwYXlsb2FkIjoiK1gxeUF6U1lxSkpEREt0bVFPSEZRTUh2cFdNclNJODgxbXk0ZXh5VDdV\r\nTW0xYWJmUEsxRThmZ003NEtzTFg2dHNkME8rbkdkdC81TmtveFdPR0dPcXhkSEw3SDZrWGgrb0tG\r\nZWZVVzNHRnRlMm53MFFyNTJIYzk1WjdaWDFnOVFYcTF4UTRjOGwyb29ackpGTEZIeWl3ekh3QzlN\r\nejZ3Mk9qZkROWHBYc21LSDBUYnNxM016UnJlL2FQUldWWFdHS0dtYTl1N3RZMTFVc1hHaXhjZUpj\r\nL2NsYXBjblpTZU81RFhIcWV6WGNpeVdGUHgyL3NsWE0rQjlENVRtMjlzLzVXUjdZKzZGR08vWFlw\r\nSm9GVFBzMUVBTFpCSWFTZmFFVGtoOGRSVmZicFArZmhOWUlncmI2R1RRS3RNSHA0Um00RnB5d2FR\r\nUWJjbjZqUXV1WWh6b25GdERZcTByUkdmOWxnK2xuYUJsL2NnPSIsImVuY3J5cHRlZEtleSI6IiIs\r\nIml2IjoiNmFiSFZScHBrWCtJWFJuKyIsInNpZ25hdHVyZSI6ImxUekpJdmNjUlhzNHBidCtrSHJT\r\ncE5QbVB0dURtK3k1bkhWVFhadDdLQXp6RzVjQkRZTHZQMStKd3huVXZzOEpBTlArSS9IQTdRaldP\r\nOUluQmtQaDlJcXdTemhuVy9tbkRXbDdGK1NFQlVacnF2VmJhbHhlRWpjSFpGUWwxTjVwbmkwMUxK\r\nM1M5ZCtwRmhqRXh0UTZUWHRNc0RvSnRJRzN6eGtLakRPRC9aK3B1c04yY3NEOWtiM00zUThKSEpk\r\nZnU2MWUxMXlJSjB0OS9RLzlTUlBTNVJuMldTci94SThOZEdtaitSQ2pCbHU0ZkhaN0tldkh3ZTB2\r\na2ZzSXRyejhaOC82ZTdRK0tkRGZPUVNNbWt0dUJTQ2VzWUtXNUlWMDJDbHhybHlCYTlHR01qUUtk\r\nbHAvenQvWlY5MFJWZVY0b284VTVsZ3NCYUI4eVFKa2pyZ0hPYllpaG9ua0QwdXV4VWVtTXRrZDVy\r\neGJ4VDBFOVZkMGlsdXdUM1YvMDZxaEZjQktXb0kxUFVyUS9OK3V4YmpPNjVoRzlENm9kdGFtYlBz\r\na1oyMHFNVXFMQlVnTE52VHpCWWlnYituNlNTaHdLSDY4K28rS3B3RmJ2SjVQdHI3SWZZZ21oOGRm\r\nUUNUa1plMThVb0hwTXRYQzFuMlVjWWJHck5pRjU5VnBsZkQ0In0=','2026-06-10 05:13:10.054708',NULL,NULL),(2,'e06dff0a-2a9f-450c-93bd-8e6ceef00b1d',2,'PROFESSIONAL',50,'2026-06-10','2027-06-10',1,1,'ACTIVE','eyJmb3JtYXRWZXJzaW9uIjoxLCJrZXlJZCI6ImlkZWFscGF5LWRldi0xIiwiZW5jcnlwdGVkIjp0\r\ncnVlLCJwYXlsb2FkIjoiMndjc04zOTdRM2d4MHlHMUJ1c0YvQnF3TWRuY1ZBNTRKcDB3aE1uQkxh\r\nL2ZXQ084Qy9ta1hvVkQyZEp4WFJQeXZMWW5obXNCekZZekcrdzdxQ0YyL2FOM05saHpldmVrS3Uy\r\nb1FyTXR4TzJHa1ZlcnJHTEJPZTd4N21KTnd0eEJkSW4vdVlETncxby9sSVJvdWNlbldZNHBPWDFY\r\nYzlSU05HVGJHOXJJT1JxUkIycVV2WURsTWtzcU14Y1ZLcmdiVHF2OEVRVTJiQk9Jc05jTzlSZTla\r\nREFoa296Zk11czdCSGpyN3prd05ybUhtVTl3dmthK2M2OUsxNWJtSG1ZUTEwNUJUMlNYOVBKM2JT\r\nR3FnNnMyOS92aktkdHJHeHo1dndJVGtUNGJJTEtzeHFUcHdKNDFZdExsNitBNEJEZ2xVbnVmWnNa\r\neVZHSkVZMXF3QWttbEE2Nk1xdWExRVpVTUN2cWZ5enBDaGY5dXFldDdyTUs5MHpselZTRlJhT1FZ\r\nMHlzSTgvVG1VZz09IiwiZW5jcnlwdGVkS2V5IjoiIiwiaXYiOiJzTzdQYkZoRHNzejc3WVdEIiwi\r\nc2lnbmF0dXJlIjoiWSt4OGtVUTBBMWFGZEJxMnRxTWhZVS9TVStsaW8vNUpuTzV2T2dVejh6ZGgz\r\neFlmTmRVdVA3bm9rc0l2dmdxQ2Rxd3dEQlAvSk1ONUREVUpnWWpjUCttSzdrOXkrUFhBZzB5dnBZ\r\nYnNSTm1rYjdsU00wUitnNEZndkVpRXNWck5uOGY5ek5KL1JwQ1hzOWUzb0N4eENRYmoxMW5GYWNr\r\nNHl2eTROb29jRGpWLzJQWVRxTXN1d2FIcHpFWFlzQVBhTTdPWXZ2cElCREFwVS9HaVZBZUZlellG\r\nWjFFbGtkYVoyRWN3dUJVQWgxVXA4dXM3eXhJZFpMUVZPMkdGc25zN3pnMHJQZXZEcEg1eUg2ZjdS\r\nd3JTSTBIcUxuK3BLb3R1ZHZsejc0Rkp0aENDSFU1QmV0cmFHSVYrQVNVSDZvaVQyK056NWcyQmUy\r\nYVdobGZzZ0NPOGRTWTBkWWptUENZYVJGK0N3QjVTbkhDeFJZL2tPUmhQc1AxTkhkaks2UFBZYU9m\r\nOHJ3VUI4TjRBSzJHMmx4TWZzckd2NVk5ZzhDZHB6MnByZjJGVkdIWnhYeU9wSXNWS0J5Q1h1UjBD\r\neG9wYzZzQnVZd1VRa3pGMEhxUjBkNkt4OFFKNU4wU1dDZzV0S2dOLzJRTmJiTTljSzhtQzFRRXFO\r\nbC9tNU1wY01WMU8ifQ==','2026-06-10 05:30:00.302530',NULL,NULL);
/*!40000 ALTER TABLE `issued_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_generator_audit_log`
--

DROP TABLE IF EXISTS `license_generator_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_generator_audit_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `license_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `performed_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_generator_audit_license` (`license_id`),
  KEY `idx_generator_audit_customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_generator_audit_log`
--

LOCK TABLES `license_generator_audit_log` WRITE;
/*!40000 ALTER TABLE `license_generator_audit_log` DISABLE KEYS */;
INSERT INTO `license_generator_audit_log` VALUES (1,NULL,1,'CUSTOMER_CREATED','DEV - Dev','license-admin','2026-06-10 05:12:54.277685'),(2,'ec3f27e1-1a27-4350-af3c-aa989adab7f2',1,'LICENSE_GENERATED','STANDARD license issued until 2027-06-10','license-admin','2026-06-10 05:13:10.067218'),(3,'ec3f27e1-1a27-4350-af3c-aa989adab7f2',1,'LICENSE_DOWNLOADED','License file downloaded','license-admin','2026-06-10 05:13:12.197285'),(4,NULL,2,'CUSTOMER_CREATED','CMP001 - Ideal Pay Solutions','license-admin','2026-06-10 05:29:32.725289'),(5,'e06dff0a-2a9f-450c-93bd-8e6ceef00b1d',2,'LICENSE_GENERATED','PROFESSIONAL license issued until 2027-06-10','license-admin','2026-06-10 05:30:00.303662');
/*!40000 ALTER TABLE `license_generator_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ideal_pay_license'
--

--
-- Dumping routines for database 'ideal_pay_license'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-11  7:45:18
