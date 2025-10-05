CREATE DATABASE  IF NOT EXISTS `blinkit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blinkit`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blinkit
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
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Rahul','Sharma','Manager',71500.00,1),(2,'Anita','Patel','Sales Executive',42350.00,2),(3,'Vikas','Kumar','Cashier',30800.00,3),(4,'Neha','Verma','Customer Support',33000.00,4),(5,'Arjun','Singh','Assistant Manager',55000.00,5),(6,'Priya','Mehra','HR Executive',44000.00,6),(7,'Amit','Jain','Inventory Manager',49500.00,7),(8,'Sneha','Reddy','Sales Executive',43560.00,8),(9,'Rohit','Kapoor','Cashier',31900.00,9),(10,'Pallavi','Nair','Receptionist',27500.00,10),(11,'Deepak','Bose','Delivery Staff',24200.00,11),(12,'Sunita','Iyer','Sales Executive',41140.00,12),(13,'Kiran','Agarwal','Accountant',46200.00,13),(14,'Manoj','Gupta','Assistant Manager',52800.00,14),(15,'Rekha','Rao','Customer Support',34100.00,15),(16,'Ajay','Desai','Inventory Manager',50600.00,16),(17,'Shweta','Mishra','Sales Executive',44770.00,17),(18,'Tarun','Chopra','Cashier',29700.00,18),(19,'Pooja','Bhatt','Receptionist',28600.00,19),(20,'Karan','Ahluwalia','Delivery Staff',25300.00,20),(21,'Jyoti','Sen','HR Executive',42900.00,21),(22,'Naveen','Pillai','Customer Support',35200.00,22),(23,'Meera','Shetty','Sales Executive',42955.00,23),(24,'Suresh','Rana','Manager',70400.00,24),(25,'Geeta','Khanna','Cashier',31350.00,25),(26,'Alok','Tyagi','Accountant',47300.00,26),(27,'Tanya','Kohli','Receptionist',28050.00,27),(28,'Raj','Saxena','Delivery Staff',23100.00,28),(29,'Lata','Trivedi','Customer Support',33550.00,29),(30,'Vivek','Pathak','Inventory Manager',51700.00,30),(31,'Savita','Shukla','HR Executive',43450.00,31),(32,'Dev','Arora','Assistant Manager',56100.00,32),(33,'Mona','Bhalla','Sales Executive',41745.00,33),(34,'Anil','Chandra','Cashier',32450.00,34),(35,'Ritu','Tiwari','Customer Support',34650.00,35),(36,'Sanjay','Ghosh','Manager',72600.00,36),(37,'Swati','Chaturvedi','Receptionist',26400.00,37),(38,'Pankaj','Menon','Delivery Staff',24750.00,38),(39,'Alka','Singhania','HR Executive',44550.00,39),(40,'Harish','Kulkarni','Accountant',48400.00,40),(41,'Sonali','Dey','Sales Executive',44165.00,41),(42,'Dinesh','Bhagat','Cashier',30800.00,42),(43,'Kavita','Banerjee','Customer Support',36300.00,43),(44,'Mahesh','Ravindra','Inventory Manager',50600.00,44),(45,'Seema','Murthy','Assistant Manager',53900.00,45),(46,'Rajesh','Iyengar','Sales Executive',42350.00,46),(47,'Usha','Bhat','Receptionist',26950.00,47),(48,'Arvind','Kashyap','Delivery Staff',23650.00,48),(49,'Sarla','Bhargava','Customer Support',35750.00,49),(50,'Ramesh','Joshi','Manager',73700.00,50);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-05 15:38:28
