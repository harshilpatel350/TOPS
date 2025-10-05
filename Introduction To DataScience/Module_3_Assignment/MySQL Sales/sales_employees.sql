CREATE DATABASE  IF NOT EXISTS `sales` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sales`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sales
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `commission_pct` decimal(10,2) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (41,'Aarav','Sharma','aarav.sharma@company.com','9876543210','2019-03-15','Sales Executive',1,101,55000.00,5.00,'Sales'),(42,'Emma','Wilson','emma.wilson@company.com','9988776655','2020-07-10','Marketing Manager',2,102,72000.00,7.50,'Marketing'),(43,'Rohan','Patel','rohan.patel@company.com','9123456789','2021-01-20','Software Engineer',3,103,68000.00,0.00,'IT'),(44,'Sophia','Fernandez','sophia.fernandez@company.com','8765432190','2018-06-12','HR Executive',4,104,48000.00,3.00,'Human Resources'),(45,'Liam','Brown','liam.brown@company.com','9456781230','2022-03-05','Finance Analyst',5,105,62000.00,4.50,'Finance'),(46,'Isha','Nair','isha.nair@company.com','9654321870','2019-11-15','Product Manager',3,103,81000.00,6.00,'IT'),(47,'Noah','Kim','noah.kim@company.com','9123098765','2017-02-18','Operations Manager',6,106,90000.00,8.00,'Operations'),(48,'Ananya','Verma','ananya.verma@company.com','9988123456','2020-09-22','Sales Associate',1,101,46000.00,4.00,'Sales'),(49,'Lucas','Garcia','lucas.garcia@company.com','9765123489','2021-05-11','Data Analyst',3,103,58000.00,0.00,'IT'),(50,'Meera','Reddy','meera.reddy@company.com','9345612789','2019-12-02','Finance Executive',5,105,52000.00,2.50,'Finance'),(51,'Oliver','Johnson','oliver.johnson@company.com','9876012345','2016-08-17','HR Manager',4,104,75000.00,5.00,'Human Resources'),(52,'Priya','Kaur','priya.kaur@company.com','9987765544','2023-01-25','Junior Developer',3,103,45000.00,0.00,'IT'),(53,'Ethan','Nguyen','ethan.nguyen@company.com','9123344556','2018-10-09','Operations Supervisor',6,106,67000.00,4.00,'Operations'),(54,'Aditi','Menon','aditi.menon@company.com','9345078123','2019-04-14','Marketing Executive',2,102,53000.00,3.50,'Marketing'),(55,'William','Chow','william.chow@company.com','9876504321','2021-11-28','Software Tester',3,103,49000.00,0.00,'IT'),(56,'Nisha','Desai','nisha.desai@company.com','9123409876','2022-06-18','Sales Manager',1,101,78000.00,7.00,'Sales'),(57,'Daniel','Martinez','daniel.martinez@company.com','9345678123','2020-02-11','Accountant',5,105,57000.00,2.00,'Finance'),(58,'Tanya','Bhatt','tanya.bhatt@company.com','9988123012','2017-09-20','HR Coordinator',4,104,50000.00,3.00,'Human Resources'),(59,'Ryan','Singh','ryan.singh@company.com','9345612908','2018-12-07','IT Support Specialist',3,103,52000.00,0.00,'IT'),(60,'Sara','Lopez','sara.lopez@company.com','9123012456','2021-07-01','Operations Executive',6,106,55000.00,2.50,'Operations'),(62,'Ajay','Mehra','ajay.mehra@zohomail.com','9587632495','2025-10-04','Data Engineer',NULL,155,60000.00,9.00,'Data'),(64,'Ajay','Mehra','ajay.mehra@zohomail.com','9587632495','2025-10-04','Data Engineer',70,155,60000.00,9.00,'Data');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-05 15:57:42
