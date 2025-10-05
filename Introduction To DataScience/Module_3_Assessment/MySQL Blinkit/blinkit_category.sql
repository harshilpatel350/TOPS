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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electronics'),(2,'Mobile Phones'),(3,'Laptops'),(4,'Tablets'),(5,'Televisions'),(6,'Cameras'),(7,'Headphones'),(8,'Speakers'),(9,'Home Appliances'),(10,'Refrigerators'),(11,'Washing Machines'),(12,'Microwaves'),(13,'Air Conditioners'),(14,'Kitchen Appliances'),(15,'Furniture'),(16,'Sofas'),(17,'Beds'),(18,'Wardrobes'),(19,'Dining Tables'),(20,'Chairs'),(21,'Clothing'),(22,'Men\'s Wear'),(23,'Women\'s Wear'),(24,'Kids\' Wear'),(25,'Footwear'),(26,'Sportswear'),(27,'Watches'),(28,'Jewellery'),(29,'Books'),(30,'Fiction'),(31,'Non-Fiction'),(32,'Stationery'),(33,'Toys'),(34,'Sports Equipment'),(35,'Groceries'),(36,'Fruits & Vegetables'),(37,'Beverages'),(38,'Snacks'),(39,'Personal Care'),(40,'Health & Wellness'),(41,'Beauty Products'),(42,'Pharmaceuticals'),(43,'Automotive'),(44,'Car Accessories'),(45,'Bike Accessories'),(46,'Gardening'),(47,'Pet Supplies'),(48,'Office Supplies'),(49,'Musical Instruments'),(50,'Gaming Consoles');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-05 15:38:29
