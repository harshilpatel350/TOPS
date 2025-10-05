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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `grade` int DEFAULT NULL,
  `salesman_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Sophia Hernandez','Sophia','Hernandez','sophia.hernandez@protonmail.com','555-1234','123 Oak St','Los Angeles','CA','90001','USA',85,201),(2,'Michael Nguyen','Michael','Nguyen','michael.nguyen@gmail.com','555-5678','456 Maple Rd','Chicago','IL','60601','USA',92,202),(3,'Olivia Gonzalez','Olivia','Gonzalez','olivia.gonzalez@yahoo.com','555-9012','789 Pine Ave','Houston','TX','77001','USA',78,203),(4,'William Patel','William','Patel','william.patel@hotmail.com','555-3456','321 Elm St','Seattle','WA','98101','USA',88,204),(5,'Emma Tanaka','Emma','Tanaka','emma.tanaka@outlook.com','555-7890','654 Oak Rd','Miami','FL','33101','USA',91,205),(6,'Jacob Müller','Jacob','Müller','jacob.muller@zohomail.com','555-2345','987 Maple Ave','Boston','MA','02101','USA',83,206),(7,'Isabella Moreno','Isabella','Moreno','isabella.moreno@proton.me','555-6789','159 Pine St','Denver','CO','80201','USA',90,207),(8,'Ethan Sato','Ethan','Sato','ethan.sato@gmail.com','555-0123','753 Oak Rd','Portland','OR','97201','USA',87,208),(9,'Ava Nguyen','Ava','Nguyen','ava.nguyen@zohomail.com','555-4567','951 Elm Ave','Atlanta','GA','30301','USA',93,209),(10,'Benjamin Ramirez','Benjamin','Ramirez','benjamin.ramirez@hotmail.com','555-8901','357 Maple St','Phoenix','AZ','85001','USA',85,210);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-05 15:57:41
