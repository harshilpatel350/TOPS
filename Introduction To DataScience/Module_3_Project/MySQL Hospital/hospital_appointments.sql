CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospital
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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `appointment_date` date NOT NULL,
  `status` enum('Scheduled','Completed','Cancelled','No-show') DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,4,'2023-05-31','Scheduled'),(2,2,5,'2023-06-01','Completed'),(3,3,6,'2023-06-02','Cancelled'),(4,4,7,'2023-06-03','Scheduled'),(5,5,8,'2023-06-04','Completed'),(6,6,9,'2023-06-05','Scheduled'),(7,7,10,'2023-06-06','Cancelled'),(8,8,11,'2023-06-07','Completed'),(9,9,12,'2023-06-08','Scheduled'),(10,10,13,'2023-06-09','Completed'),(11,11,14,'2023-06-10','Scheduled'),(12,12,15,'2023-06-11','Cancelled'),(13,13,16,'2023-06-12','Completed'),(14,14,17,'2023-06-13','Scheduled'),(15,15,18,'2023-06-14','Completed'),(16,16,19,'2023-06-15','Scheduled'),(17,17,20,'2023-06-16','Cancelled'),(18,18,21,'2023-06-17','Completed'),(19,19,22,'2023-06-18','Scheduled'),(20,20,23,'2023-06-19','Completed'),(21,21,24,'2023-06-20','Scheduled'),(22,22,25,'2023-06-21','Cancelled'),(23,23,26,'2023-06-22','Completed'),(24,24,27,'2023-06-23','Scheduled'),(25,25,28,'2023-06-24','Completed'),(26,26,29,'2023-06-25','Scheduled'),(27,27,30,'2023-06-26','Cancelled'),(28,28,31,'2023-06-27','Completed'),(29,29,32,'2023-06-28','Scheduled'),(30,30,33,'2023-06-29','Completed'),(31,31,34,'2023-06-30','Scheduled'),(32,32,35,'2023-07-01','Cancelled'),(33,33,36,'2023-07-02','Completed'),(34,34,37,'2023-07-03','Scheduled'),(35,35,38,'2023-07-04','Completed'),(36,36,39,'2023-07-05','Scheduled'),(37,37,40,'2023-07-06','Cancelled'),(38,38,41,'2023-07-07','Completed'),(39,39,42,'2023-07-08','Scheduled'),(40,40,43,'2023-07-09','Completed'),(41,41,44,'2023-07-10','Scheduled'),(42,42,45,'2023-07-11','Cancelled'),(43,43,46,'2023-07-12','Completed'),(44,44,47,'2023-07-13','Scheduled'),(45,45,48,'2023-07-14','Completed'),(46,46,49,'2023-07-15','Scheduled'),(47,47,50,'2023-07-16','Cancelled'),(48,48,1,'2023-07-17','Completed'),(49,49,2,'2023-07-18','Scheduled'),(50,50,3,'2023-07-19','Completed'),(51,51,11,'2023-06-01','Scheduled'),(52,52,12,'2023-06-02','Completed'),(53,53,13,'2023-06-03','Cancelled'),(54,54,14,'2023-06-04','Scheduled'),(55,55,15,'2023-06-05','Completed'),(56,56,16,'2023-06-06','Scheduled'),(57,57,17,'2023-06-07','Cancelled'),(58,58,18,'2023-06-08','Completed'),(59,59,19,'2023-06-09','Scheduled'),(60,60,20,'2023-06-10','Completed'),(61,61,21,'2023-06-11','Scheduled'),(62,62,22,'2023-06-12','Cancelled'),(63,63,23,'2023-06-13','Completed'),(64,64,24,'2023-06-14','Scheduled'),(65,65,25,'2023-06-15','Completed'),(66,66,26,'2023-06-16','Scheduled'),(67,67,27,'2023-06-17','Cancelled'),(68,68,28,'2023-06-18','Completed'),(69,69,29,'2023-06-19','Scheduled'),(70,70,30,'2023-06-20','Completed'),(71,71,31,'2023-06-21','Scheduled'),(72,72,32,'2023-06-22','Cancelled'),(73,73,33,'2023-06-23','Completed'),(74,74,34,'2023-06-24','Scheduled'),(75,75,35,'2023-06-25','Completed'),(76,76,36,'2023-06-26','Scheduled'),(77,77,37,'2023-06-27','Cancelled'),(78,78,38,'2023-06-28','Completed'),(79,79,39,'2023-06-29','Scheduled'),(80,80,40,'2023-06-30','Completed'),(81,81,41,'2023-07-01','Scheduled'),(82,82,42,'2023-07-02','Cancelled'),(83,83,43,'2023-07-03','Completed'),(84,84,44,'2023-07-04','Scheduled'),(85,85,45,'2023-07-05','Completed'),(86,86,46,'2023-07-06','Scheduled'),(87,87,47,'2023-07-07','Cancelled'),(88,88,48,'2023-07-08','Completed'),(89,89,49,'2023-07-09','Scheduled'),(90,90,50,'2023-07-10','Completed'),(91,91,1,'2023-07-11','Scheduled'),(92,92,2,'2023-07-12','Cancelled'),(93,93,3,'2023-07-13','Completed'),(94,94,4,'2023-07-14','Scheduled'),(95,95,5,'2023-07-15','Completed'),(96,96,6,'2023-07-16','Scheduled'),(97,97,7,'2023-07-17','Cancelled'),(98,98,8,'2023-07-18','Completed'),(99,99,9,'2023-07-19','Scheduled'),(100,100,10,'2023-07-20','Completed'),(101,101,1,'2023-05-01','Scheduled'),(102,102,2,'2023-05-02','Completed'),(103,103,3,'2023-05-03','Cancelled'),(104,104,4,'2023-05-04','Scheduled'),(105,105,5,'2023-05-05','Completed'),(106,106,6,'2023-05-06','Scheduled'),(107,107,7,'2023-05-07','Cancelled'),(108,108,8,'2023-05-08','Completed'),(109,109,9,'2023-05-09','Scheduled'),(110,110,10,'2023-05-10','Completed'),(111,111,11,'2023-05-11','Scheduled'),(112,112,12,'2023-05-12','Cancelled'),(113,113,13,'2023-05-13','Completed'),(114,114,14,'2023-05-14','Scheduled'),(115,115,15,'2023-05-15','Completed'),(116,116,16,'2023-05-16','Scheduled'),(117,117,17,'2023-05-17','Cancelled'),(118,118,18,'2023-05-18','Completed'),(119,119,19,'2023-05-19','Scheduled'),(120,120,20,'2023-05-20','Completed'),(121,121,21,'2023-05-21','Scheduled'),(122,122,22,'2023-05-22','Cancelled'),(123,123,23,'2023-05-23','Completed'),(124,124,24,'2023-05-24','Scheduled'),(125,125,25,'2023-05-25','Completed'),(126,126,26,'2023-05-26','Scheduled'),(127,127,27,'2023-05-27','Cancelled'),(128,128,28,'2023-05-28','Completed'),(129,129,29,'2023-05-29','Scheduled'),(130,130,30,'2023-05-30','Completed'),(131,131,31,'2023-05-31','Scheduled'),(132,132,32,'2023-06-01','Cancelled'),(133,133,33,'2023-06-02','Completed'),(134,134,34,'2023-06-03','Scheduled'),(135,135,35,'2023-06-04','Completed'),(136,136,36,'2023-06-05','Scheduled'),(137,137,37,'2023-06-06','Cancelled'),(138,138,38,'2023-06-07','Completed'),(139,139,39,'2023-06-08','Scheduled'),(140,140,40,'2023-06-09','Completed'),(141,141,41,'2023-06-10','Scheduled'),(142,142,42,'2023-06-11','Cancelled'),(143,143,43,'2023-06-12','Completed'),(144,144,44,'2023-06-13','Scheduled'),(145,145,45,'2023-06-14','Completed'),(146,146,46,'2023-06-15','Scheduled'),(147,147,47,'2023-06-16','Cancelled'),(148,148,48,'2023-06-17','Completed'),(149,149,49,'2023-06-18','Scheduled'),(150,150,50,'2023-06-19','Completed'),(151,151,1,'2023-06-20','Scheduled'),(152,152,2,'2023-06-21','Completed'),(153,153,3,'2023-06-22','Cancelled'),(154,154,4,'2023-06-23','Scheduled'),(155,155,5,'2023-06-24','Completed'),(156,156,6,'2023-06-25','Scheduled'),(157,157,7,'2023-06-26','Cancelled'),(158,158,8,'2023-06-27','Completed'),(159,159,9,'2023-06-28','Scheduled'),(160,160,10,'2023-06-29','Completed'),(161,161,11,'2023-06-30','Scheduled'),(162,162,12,'2023-07-01','Cancelled'),(163,163,13,'2023-07-02','Completed'),(164,164,14,'2023-07-03','Scheduled'),(165,165,15,'2023-07-04','Completed'),(166,166,16,'2023-07-05','Scheduled'),(167,167,17,'2023-07-06','Cancelled'),(168,168,18,'2023-07-07','Completed'),(169,169,19,'2023-07-08','Scheduled'),(170,170,20,'2023-07-09','Completed'),(171,171,21,'2023-07-10','Scheduled'),(172,172,22,'2023-07-11','Cancelled'),(173,173,23,'2023-07-12','Completed'),(174,174,24,'2023-07-13','Scheduled'),(175,175,25,'2023-07-14','Completed'),(176,176,26,'2023-07-15','Scheduled'),(177,177,27,'2023-07-16','Cancelled'),(178,178,28,'2023-07-17','Completed'),(179,179,29,'2023-07-18','Scheduled'),(180,180,30,'2023-07-19','Completed'),(181,181,31,'2023-07-20','Scheduled'),(182,182,32,'2023-07-21','Cancelled'),(183,183,33,'2023-07-22','Completed'),(184,184,34,'2023-07-23','Scheduled'),(185,185,35,'2023-07-24','Completed'),(186,186,36,'2023-07-25','Scheduled'),(187,187,37,'2023-07-26','Cancelled'),(188,188,38,'2023-07-27','Completed'),(189,189,39,'2023-07-28','Scheduled'),(190,190,40,'2023-07-29','Completed'),(191,191,41,'2023-07-30','Scheduled'),(192,192,42,'2023-07-31','Cancelled'),(193,193,43,'2023-08-01','Completed'),(194,194,44,'2023-08-02','Scheduled'),(195,195,45,'2023-08-03','Completed'),(196,196,46,'2023-08-04','Scheduled'),(197,197,47,'2023-08-05','Cancelled'),(198,198,48,'2023-08-06','Completed'),(199,199,49,'2023-08-07','Scheduled'),(200,200,50,'2023-08-08','Completed');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `beforeinsertappointment` BEFORE INSERT ON `appointments` FOR EACH ROW begin
if (select count(*) from doctors where doctor_id = new.doctor_id) = 0 then
signal sqlstate '45000' set message_text = 'cannot schedule appointment for inactive doctor';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `logdeletedappointments` AFTER DELETE ON `appointments` FOR EACH ROW begin
insert into deleted_appointments_log(appointment_id, patient_id, doctor_id, deleted_at)
values (old.appointment_id, old.patient_id, old.doctor_id, now());
end */;;
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

-- Dump completed on 2025-10-06 10:21:36
