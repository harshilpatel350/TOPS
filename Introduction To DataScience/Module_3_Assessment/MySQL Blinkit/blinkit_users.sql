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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'rahul90','rahul.sharma90@gmail.com','2021-01-15 10:23:45'),(2,'anita87','anita.patel87@gmail.com','2021-02-10 14:11:30'),(3,'vikas92','vikas.kumar92@gmail.com','2021-03-05 09:45:12'),(4,'neha88','neha.verma88@gmail.com','2021-04-12 19:21:05'),(5,'arjun91','arjun.singh91@gmail.com','2021-05-08 08:12:54'),(6,'priya89','priya.mehra89@gmail.com','2021-06-17 12:35:40'),(7,'amit85','amit.jain85@gmail.com','2021-07-03 17:59:20'),(8,'sneha93','sneha.reddy93@gmail.com','2021-08-14 20:40:55'),(9,'rohit90','rohit.kapoor90@gmail.com','2021-09-01 09:10:30'),(10,'pallavi86','pallavi.nair104@proton.me','2021-09-22 15:44:19'),(11,'deepak92','deepak.bose92@gmail.com','2021-10-11 11:21:14'),(12,'sunita88','sunita.iyer88@gmail.com','2021-11-05 16:35:22'),(13,'kiran87','kiran.agarwal87@gmail.com','2021-12-09 18:55:12'),(14,'manoj91','manoj.gupta91@gmail.com','2022-01-13 07:20:00'),(15,'rekha89','rekha.rao89@gmail.com','2022-02-15 21:44:05'),(16,'ajay92','ajay.desai92@gmail.com','2022-03-19 10:11:50'),(17,'shweta85','shweta.mishra85@gmail.com','2022-04-23 13:59:33'),(18,'tarun90','tarun.chopra90@gmail.com','2022-05-30 08:15:27'),(19,'pooja93','pooja.bhatt93@gmail.com','2022-06-11 17:39:44'),(20,'karan88','karan.ahluwalia88@gmail.com','2022-07-05 19:22:12'),(21,'jyoti87','jyoti.sen87@gmail.com','2022-08-19 12:05:09'),(22,'naveen89','naveen.pillai89@gmail.com','2022-09-25 09:31:47'),(23,'meera86','meera.shetty86@gmail.com','2022-10-15 14:48:22'),(24,'suresh92','suresh.rana92@gmail.com','2022-11-07 16:18:59'),(25,'geeta91','geeta.khanna91@gmail.com','2022-12-28 20:50:33'),(26,'alok90','alok.tyagi90@gmail.com','2023-01-09 10:07:11'),(27,'tanya93','tanya.kohli93@gmail.com','2023-02-21 18:25:56'),(28,'raj85','raj.saxena85@gmail.com','2023-03-12 07:40:45'),(29,'lata89','lata.trivedi89@gmail.com','2023-04-04 15:10:30'),(30,'vivek87','vivek.pathak87@gmail.com','2023-05-18 11:55:42'),(31,'savita92','savita.shukla92@gmail.com','2023-06-06 20:19:51'),(32,'dev90','dev.arora90@gmail.com','2023-07-21 09:41:17'),(33,'mona91','mona.bhalla91@gmail.com','2023-08-17 13:35:12'),(34,'anil88','anil.chandra88@gmail.com','2023-09-23 16:55:03'),(35,'ritu85','ritu.tiwari85@gmail.com','2023-10-15 18:20:59'),(36,'sanjay92','sanjay.ghosh92@gmail.com','2023-11-01 07:22:14'),(37,'swati89','swati.chaturvedi89@gmail.com','2023-12-05 12:45:39'),(38,'pankaj87','pankaj.menon87@gmail.com','2023-12-30 19:30:12'),(39,'alka93','alka.singhania93@gmail.com','2024-01-09 09:14:55'),(40,'harish90','harish.kulkarni90@gmail.com','2024-02-16 20:11:20'),(41,'sonali86','sonali.dey86@gmail.com','2024-03-14 14:37:33'),(42,'dinesh91','dinesh.bhagat91@gmail.com','2024-04-20 10:21:19'),(43,'kavita88','kavita.banerjee88@gmail.com','2024-05-07 17:55:22'),(44,'mahesh85','mahesh.ravindra85@gmail.com','2024-06-11 07:10:40'),(45,'seema92','seema.murthy92@gmail.com','2024-07-18 13:42:15'),(46,'rajesh90','rajesh.iyengar90@gmail.com','2024-08-22 16:25:33'),(47,'usha87','usha.bhat87@gmail.com','2024-09-10 11:39:09'),(48,'arvind89','arvind.kashyap89@gmail.com','2024-09-29 08:44:50'),(49,'sarla93','sarla.bhargava93@gmail.com','2024-09-30 12:55:11'),(50,'ramesh90','ramesh.joshi90@gmail.com','2024-10-01 10:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
