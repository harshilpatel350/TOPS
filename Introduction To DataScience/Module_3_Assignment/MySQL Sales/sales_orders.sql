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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `ship_address` varchar(200) DEFAULT NULL,
  `ship_city` varchar(100) DEFAULT NULL,
  `ship_state` varchar(50) DEFAULT NULL,
  `ship_zip_code` varchar(20) DEFAULT NULL,
  `ship_country` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `order_total` decimal(10,2) DEFAULT NULL,
  `purchase_amount` decimal(10,2) DEFAULT NULL,
  `target_value` decimal(10,2) DEFAULT NULL,
  `achieved_percentage` decimal(10,2) DEFAULT NULL,
  `unachieved_percentage` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (11,1,1,'2023-01-15','2023-01-20','123 Oak St','Los Angeles','CA','90001','USA','Shipped',500.00,500.00,6000.00,8.33,91.67),(12,2,2,'2023-02-01','2023-02-05','456 Maple Rd','Chicago','IL','60601','USA','Shipped',800.00,800.00,6000.00,13.33,86.67),(13,3,3,'2023-03-10','2023-03-15','789 Pine Ave','Houston','TX','77001','USA','Shipped',650.00,650.00,6000.00,10.83,89.17),(14,4,4,'2023-04-05','2023-04-10','321 Elm St','Seattle','WA','98101','USA','Shipped',900.00,900.00,6000.00,15.00,85.00),(15,5,5,'2023-05-20','2023-05-25','654 Oak Rd','Miami','FL','33101','USA','Shipped',750.00,750.00,6000.00,12.50,87.50),(16,6,6,'2023-06-01','2023-06-06','987 Maple Ave','Boston','MA','02101','USA','Shipped',600.00,600.00,6000.00,10.00,90.00),(17,7,7,'2023-07-15','2023-07-20','159 Pine St','Denver','CO','80201','USA','Shipped',850.00,850.00,6000.00,14.17,85.83),(18,8,8,'2023-08-10','2023-08-15','753 Oak Rd','Portland','OR','97201','USA','Shipped',700.00,700.00,6000.00,11.67,88.33),(19,9,9,'2023-09-01','2023-09-06','951 Elm Ave','Atlanta','GA','30301','USA','Shipped',550.00,550.00,6000.00,9.17,90.83),(20,10,10,'2023-10-20','2023-10-25','357 Maple St','Phoenix','AZ','85001','USA','Shipped',800.00,800.00,6000.00,13.33,86.67);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
