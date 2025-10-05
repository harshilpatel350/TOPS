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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Samsung Galaxy S21',55000.00,25,2),(2,'Apple iPhone 13',70000.00,18,2),(3,'OnePlus 9 Pro',60000.00,20,2),(4,'Dell Inspiron 15',48000.00,15,3),(5,'HP Pavilion x360',52000.00,12,3),(6,'MacBook Air M1',95000.00,10,3),(7,'iPad Pro 11',75000.00,14,4),(8,'Samsung Galaxy Tab S7',65000.00,16,4),(9,'Sony Bravia 55inch',82000.00,8,5),(10,'LG OLED 65inch',120000.00,5,5),(11,'Canon EOS 90D',98000.00,7,6),(12,'Nikon D7500',85000.00,9,6),(13,'Sony WH-1000XM4',25000.00,30,7),(14,'JBL Tune 750BT',8000.00,40,7),(15,'Bose SoundLink Speaker',15000.00,22,8),(16,'Sony Bluetooth Speaker',12000.00,25,8),(17,'Samsung Refrigerator 350L',40000.00,11,10),(18,'LG Washing Machine 7kg',35000.00,13,11),(19,'IFB Microwave 25L',15000.00,20,12),(20,'Voltas AC 1.5 Ton',42000.00,10,13),(21,'Prestige Mixer Grinder',5500.00,40,14),(22,'Wooden Sofa Set',28000.00,8,16),(23,'King Size Bed',45000.00,6,17),(24,'Wardrobe 3 Door',32000.00,7,18),(25,'Dining Table 6 Seater',38000.00,5,19),(26,'Office Chair',8000.00,15,20),(27,'Men\'s Formal Shirt',1800.00,50,21),(28,'Women\'s Kurti',1500.00,45,22),(29,'Kids\' T-shirt',800.00,60,23),(30,'Nike Sports Shoes',6000.00,25,25),(31,'Adidas Tracksuit',4500.00,20,26),(32,'Fastrack Watch',2500.00,30,27),(33,'Titan Gold Jewellery',55000.00,4,28),(34,'The Alchemist',400.00,35,29),(35,'Sapiens: A Brief History',550.00,28,30),(36,'Notebook A5',120.00,100,32),(37,'Remote Control Car',1500.00,20,33),(38,'Cricket Bat SS',3500.00,15,34),(39,'Apple Red (1kg)',200.00,60,36),(40,'Tropicana Juice 1L',120.00,50,37),(41,'Lays Chips 100g',30.00,200,38),(42,'Dove Shampoo 650ml',450.00,40,39),(43,'Dettol Soap (Pack of 4)',140.00,70,40),(44,'Lakme Lipstick',499.00,35,41),(45,'Paracetamol 500mg (10 tabs)',35.00,100,42),(46,'Car Seat Cover',4500.00,12,43),(47,'Bike Helmet',2500.00,15,44),(48,'Garden Hose Pipe 20m',1200.00,10,45),(49,'Dog Food 5kg',1500.00,20,46),(50,'Office Printer A4',12000.00,8,47),(51,'Yamaha Acoustic Guitar',15000.00,6,48),(52,'PlayStation 5',55000.00,5,50),(53,'invalid product',100.00,10,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
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
