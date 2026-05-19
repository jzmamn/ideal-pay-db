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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_fa`
--

LOCK TABLES `emp_fa` WRITE;
/*!40000 ALTER TABLE `emp_fa` DISABLE KEYS */;
INSERT INTO `emp_fa` VALUES (-1,-1,-1,0.00,'MMYYYY','0',NULL,-1,'2026-05-18 14:39:05',-1,'2026-05-18 14:39:05');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_fd`
--

LOCK TABLES `emp_fd` WRITE;
/*!40000 ALTER TABLE `emp_fd` DISABLE KEYS */;
INSERT INTO `emp_fd` VALUES (-1,-1,-1,0.00,'MMYYYY',0,NULL,-1,'2026-05-18 14:39:05',-1,'2026-05-18 14:39:05');
/*!40000 ALTER TABLE `emp_fd` ENABLE KEYS */;
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
  `country` varchar(100) DEFAULT NULL,
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
  CONSTRAINT `fk_employee_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `fk_employee_created_by` FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_employee_designation` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`),
  CONSTRAINT `fk_employee_emp_type` FOREIGN KEY (`employee_type_id`) REFERENCES `emp_type` (`id`),
  CONSTRAINT `fk_employee_grade` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `fk_employee_job_category` FOREIGN KEY (`job_category_id`) REFERENCES `job_category` (`id`),
  CONSTRAINT `fk_employee_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),
  CONSTRAINT `fk_employee_nopay_days` FOREIGN KEY (`nopay_days_id`) REFERENCES `nopay_days` (`id`),
  CONSTRAINT `chk_employee_active` CHECK ((`is_active` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (-1,'DEFAULT','System','Employee',NULL,NULL,'Y','Default Record','System Employee','N/A','N/A',0.00,'2026-05-17',-1,-1,-1,-1,-1,-1,'0000000000','system@local','N/A','N/A','N/A','N/A','N/A','N/A','N/A','N/A',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46');
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
INSERT INTO `nopay_days` VALUES (-1,'DEFAULT','Default NoPay','Y','System Default NoPay Rule',0.00,-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'NP001','No Pay - Default','Y','Default no pay rule',0.00,1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(2,'NP002','Half Day Deduction','Y','Deduct 0.5 day per absence',0.50,1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(3,'NP003','Full Day Deduction','Y','Deduct 1 full day',1.00,1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(4,'NP004','Late Mark Deduction','Y','Penalty for late arrival',0.25,1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(5,'NP005','Early Leave Deduction','Y','Deduction for early leave',0.25,1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(6,'NP006','Unpaid Leave','Y','Unpaid leave rule',1.00,1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(7,'NP007','Absence Penalty','Y','Absence deduction rule',1.00,1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(8,'NP008','Disciplinary Leave','N','Disciplinary no pay rule',1.00,1,'2026-05-17 14:21:45',1,'2026-05-19 00:35:31'),(9,'NP009','No Pay Holiday','Y','Holiday without pay rule',1.00,1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(10,'NP010','Suspension','Y','Suspension no pay rule',1.00,1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45'),(11,'NP011','Custom Rule','Y','Custom no pay configuration',1.00,1,'2026-05-17 14:21:45',1,'2026-05-17 14:21:45');
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
INSERT INTO `overtime` VALUES (-1,'DEFAULT','Default Overtime','Y','System Default Overtime',0.00,-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'OT001','Normal Overtime','Y','Standard overtime rate (1x)',1000.00,1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(2,'OT002','Weekend Overtime','Y','Weekend overtime rate (1.5x)',1500.00,1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(3,'OT003','Holiday Overtime','Y','Public holiday overtime (2x)',2000.00,1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(4,'OT004','Night Shift OT','Y','Night shift overtime allowance',1200.00,1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(5,'OT005','Emergency OT','Y','Emergency duty overtime',1800.00,1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(6,'OT006','Project OT','Y','Project based overtime',1300.00,1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(7,'OT007','Field OT','Y','Field work overtime',1100.00,1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(8,'OT008','Travel OT','Y','Travel related overtime',1400.00,1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(9,'OT009','Extra Shift OT','Y','Additional shift overtime',1600.00,1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(10,'OT010','Double Shift OT','Y','Double shift overtime pay',2200.00,1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45'),(11,'OT011','Special Assignment OT','Y','Special assignment overtime',2500.00,1,'2026-05-17 15:08:45',1,'2026-05-17 15:08:45');
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
INSERT INTO `usr` VALUES (-1,'DEFAULT','System User','default','SYSTEM',-1,'Y',-1,'2026-05-17 12:34:46',-1,'2026-05-17 13:01:15'),(1,'ADMIN','System Administrator','admin','$2a$10$7kufHBi4GalXl268iFsBQeKEnv6Izk9qQJD6jY1gGC1F0poVA2vVa',-1,'Y',-1,'2026-05-17 12:55:59',-1,'2026-05-17 13:01:15'),(2,'HR001','HR Manager','manager','$2a$10$7kufHBi4GalXl268iFsBQeKEnv6Izk9qQJD6jY1gGC1F0poVA2vVa',-1,'Y',-1,'2026-05-17 12:55:59',-1,'2026-05-17 13:01:15'),(3,'PAY001','Payroll Officer','payroll','$2a$10$7kufHBi4GalXl268iFsBQeKEnv6Izk9qQJD6jY1gGC1F0poVA2vVa',-1,'Y',-1,'2026-05-17 12:55:59',-1,'2026-05-17 13:01:15');
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
INSERT INTO `variable_allowance` VALUES (-1,'DEFAULT','Default Variable Allowance','Y','N','N','N','N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'VA001','Overtime Allowance','Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(2,'VA002','Performance Bonus','Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(3,'VA003','Sales Incentive','Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(4,'VA004','Project Bonus','Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(5,'VA005','Attendance Bonus','Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(6,'VA006','Commission','Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(7,'VA007','Festival Bonus','Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(8,'VA008','Shift Incentive','Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(9,'VA009','Target Achievement','Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(10,'VA010','Special Incentive','Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29'),(11,'VA011','Extra Duty Allowance','Y','Y','Y','Y','N',1,'2026-05-17 15:06:29',1,'2026-05-17 15:06:29');
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
INSERT INTO `variable_deduction` VALUES (-1,'DEFAULT','Default Variable Deduction','Y','N','N','N','N',-1,'2026-05-17 12:34:46',-1,'2026-05-17 12:34:46'),(1,'VD001','Late Attendance Deduction','Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(2,'VD002','Early Leave Deduction','Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(3,'VD003','Absence Deduction','Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(4,'VD004','Penalty Deduction','Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(5,'VD005','Disciplinary Deduction','Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(6,'VD006','Damage Recovery','Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(7,'VD007','Loan Adjustment','Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(8,'VD008','Advance Adjustment','Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(9,'VD009','Leave Without Pay','Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(10,'VD010','System Adjustment','Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27'),(11,'VD011','Misc Deduction','Y','N','N','N','Y',1,'2026-05-17 15:07:27',1,'2026-05-17 15:07:27');
/*!40000 ALTER TABLE `variable_deduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ideal_pay'
--

--
-- Dumping routines for database 'ideal_pay'
--
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

-- Dump completed on 2026-05-19 14:12:05
