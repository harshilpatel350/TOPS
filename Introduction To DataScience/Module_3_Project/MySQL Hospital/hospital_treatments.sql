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
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatments` (
  `treatment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `treatment_date` date DEFAULT NULL,
  `description` text,
  `cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`treatment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `treatments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatments`
--

LOCK TABLES `treatments` WRITE;
/*!40000 ALTER TABLE `treatments` DISABLE KEYS */;
INSERT INTO `treatments` VALUES (1,1,1,'2023-01-01','General checkup and consultation',500.00),(2,2,2,'2023-01-02','Neurological assessment',1200.00),(3,3,3,'2023-01-03','Orthopedic examination',800.00),(4,4,4,'2023-01-04','Skin allergy treatment',600.00),(5,5,5,'2023-01-05','Child vaccination',700.00),(6,6,6,'2023-01-06','Cancer screening',2000.00),(7,7,7,'2023-01-07','X-ray and imaging',1000.00),(8,8,8,'2023-01-08','Pregnancy consultation',1500.00),(9,9,9,'2023-01-09','Psychiatric evaluation',900.00),(10,10,10,'2023-01-10','Kidney function test',1100.00),(11,11,11,'2023-01-11','Cardiac health check',1800.00),(12,12,12,'2023-01-12','Neurological therapy',2200.00),(13,13,13,'2023-01-13','Bone fracture treatment',2500.00),(14,14,14,'2023-01-14','Skin infection medication',750.00),(15,15,15,'2023-01-15','Pediatric consultation',650.00),(16,16,16,'2023-01-16','Chemotherapy session',5000.00),(17,17,17,'2023-01-17','MRI scan',3000.00),(18,18,18,'2023-01-18','Gynecology checkup',1400.00),(19,19,19,'2023-01-19','Depression therapy',2000.00),(20,20,20,'2023-01-20','Urology procedure',2800.00),(21,21,21,'2023-01-21','Heart surgery follow-up',3500.00),(22,22,22,'2023-01-22','Brain scan and evaluation',3200.00),(23,23,23,'2023-01-23','Joint pain treatment',1200.00),(24,24,24,'2023-01-24','Cosmetic skin procedure',4500.00),(25,25,25,'2023-01-25','Child nutrition consultation',800.00),(26,26,26,'2023-01-26','Tumor removal surgery',15000.00),(27,27,27,'2023-01-27','CT scan',3500.00),(28,28,28,'2023-01-28','Fertility consultation',2000.00),(29,29,29,'2023-01-29','Anxiety treatment',1800.00),(30,30,30,'2023-01-30','Kidney dialysis session',4000.00),(31,31,31,'2023-01-31','Cardiac monitoring',2100.00),(32,32,32,'2023-02-01','Neurological surgery',20000.00),(33,33,33,'2023-02-02','Spine correction procedure',12000.00),(34,34,34,'2023-02-03','Laser skin treatment',6000.00),(35,35,35,'2023-02-04','Child immunization',900.00),(36,36,36,'2023-02-05','Chemotherapy cycle',7000.00),(37,37,37,'2023-02-06','Ultrasound imaging',1500.00),(38,38,38,'2023-02-07','Maternity care',5000.00),(39,39,39,'2023-02-08','Psychological counseling',2500.00),(40,40,40,'2023-02-09','Bladder surgery',18000.00),(41,41,41,'2023-02-10','Heart valve replacement',22000.00),(42,42,42,'2023-02-11','Epilepsy treatment',5000.00),(43,43,43,'2023-02-12','Knee replacement surgery',30000.00),(44,44,44,'2023-02-13','Skin biopsy',3500.00),(45,45,45,'2023-02-14','Child growth consultation',1200.00),(46,46,46,'2023-02-15','Radiation therapy',16000.00),(47,47,47,'2023-02-16','CT-guided biopsy',8000.00),(48,48,48,'2023-02-17','C-section delivery',25000.00),(49,49,49,'2023-02-18','Addiction treatment',7000.00),(50,50,50,'2023-02-19','Kidney stone removal',12000.00),(51,51,1,'2023-02-20','General checkup and consultation',510.00),(52,52,2,'2023-02-21','Neurological assessment',1210.00),(53,53,3,'2023-02-22','Orthopedic examination',810.00),(54,54,4,'2023-02-23','Skin allergy treatment',610.00),(55,55,5,'2023-02-24','Child vaccination',710.00),(56,56,6,'2023-02-25','Cancer screening',2010.00),(57,57,7,'2023-02-26','X-ray and imaging',1010.00),(58,58,8,'2023-02-27','Pregnancy consultation',1510.00),(59,59,9,'2023-02-28','Psychiatric evaluation',910.00),(60,60,10,'2023-03-01','Kidney function test',1110.00),(61,61,11,'2023-03-02','Cardiac health check',1810.00),(62,62,12,'2023-03-03','Neurological therapy',2210.00),(63,63,13,'2023-03-04','Bone fracture treatment',2510.00),(64,64,14,'2023-03-05','Skin infection medication',760.00),(65,65,15,'2023-03-06','Pediatric consultation',660.00),(66,66,16,'2023-03-07','Chemotherapy session',5010.00),(67,67,17,'2023-03-08','MRI scan',3010.00),(68,68,18,'2023-03-09','Gynecology checkup',1410.00),(69,69,19,'2023-03-10','Depression therapy',2010.00),(70,70,20,'2023-03-11','Urology procedure',2810.00),(71,71,21,'2023-03-12','Heart surgery follow-up',3510.00),(72,72,22,'2023-03-13','Brain scan and evaluation',3210.00),(73,73,23,'2023-03-14','Joint pain treatment',1210.00),(74,74,24,'2023-03-15','Cosmetic skin procedure',4510.00),(75,75,25,'2023-03-16','Child nutrition consultation',810.00),(76,76,26,'2023-03-17','Tumor removal surgery',15010.00),(77,77,27,'2023-03-18','CT scan',3510.00),(78,78,28,'2023-03-19','Fertility consultation',2010.00),(79,79,29,'2023-03-20','Anxiety treatment',1810.00),(80,80,30,'2023-03-21','Kidney dialysis session',4010.00),(81,81,31,'2023-03-22','Cardiac monitoring',2110.00),(82,82,32,'2023-03-23','Neurological surgery',20010.00),(83,83,33,'2023-03-24','Spine correction procedure',12010.00),(84,84,34,'2023-03-25','Laser skin treatment',6010.00),(85,85,35,'2023-03-26','Child immunization',910.00),(86,86,36,'2023-03-27','Chemotherapy cycle',7010.00),(87,87,37,'2023-03-28','Ultrasound imaging',1510.00),(88,88,38,'2023-03-29','Maternity care',5010.00),(89,89,39,'2023-03-30','Psychological counseling',2510.00),(90,90,40,'2023-03-31','Bladder surgery',18010.00),(91,91,41,'2023-04-01','Heart valve replacement',22010.00),(92,92,42,'2023-04-02','Epilepsy treatment',5010.00),(93,93,43,'2023-04-03','Knee replacement surgery',30010.00),(94,94,44,'2023-04-04','Skin biopsy',3510.00),(95,95,45,'2023-04-05','Child growth consultation',1210.00),(96,96,46,'2023-04-06','Radiation therapy',16010.00),(97,97,47,'2023-04-07','CT-guided biopsy',8010.00),(98,98,48,'2023-04-08','C-section delivery',25010.00),(99,99,49,'2023-04-09','Addiction treatment',7010.00),(100,100,50,'2023-04-10','Kidney stone removal',12010.00),(101,101,1,'2023-05-11','General checkup and consultation',550.00),(102,102,2,'2023-05-12','Neurological assessment',1250.00),(103,103,3,'2023-05-13','Orthopedic examination',850.00),(104,104,4,'2023-05-14','Skin allergy treatment',650.00),(105,105,5,'2023-05-15','Child vaccination',720.00),(106,106,6,'2023-05-16','Cancer screening',2100.00),(107,107,7,'2023-05-17','X-ray and imaging',1050.00),(108,108,8,'2023-05-18','Pregnancy consultation',1550.00),(109,109,9,'2023-05-19','Psychiatric evaluation',950.00),(110,110,10,'2023-05-20','Kidney function test',1150.00),(111,111,11,'2023-05-21','Cardiac health check',1850.00),(112,112,12,'2023-05-22','Neurological therapy',2250.00),(113,113,13,'2023-05-23','Bone fracture treatment',2550.00),(114,114,14,'2023-05-24','Skin infection medication',800.00),(115,115,15,'2023-05-25','Pediatric consultation',680.00),(116,116,16,'2023-05-26','Chemotherapy session',5100.00),(117,117,17,'2023-05-27','MRI scan',3050.00),(118,118,18,'2023-05-28','Gynecology checkup',1450.00),(119,119,19,'2023-05-29','Depression therapy',2050.00),(120,120,20,'2023-05-30','Urology procedure',2850.00),(121,121,21,'2023-05-31','Heart surgery follow-up',3550.00),(122,122,22,'2023-06-01','Brain scan and evaluation',3250.00),(123,123,23,'2023-06-02','Joint pain treatment',1250.00),(124,124,24,'2023-06-03','Cosmetic skin procedure',4550.00),(125,125,25,'2023-06-04','Child nutrition consultation',820.00),(126,126,26,'2023-06-05','Tumor removal surgery',15100.00),(127,127,27,'2023-06-06','CT scan',3550.00),(128,128,28,'2023-06-07','Fertility consultation',2050.00),(129,129,29,'2023-06-08','Anxiety treatment',1850.00),(130,130,30,'2023-06-09','Kidney dialysis session',4050.00),(131,131,31,'2023-06-10','Cardiac monitoring',2150.00),(132,132,32,'2023-06-11','Neurological surgery',20100.00),(133,133,33,'2023-06-12','Spine correction procedure',12150.00),(134,134,34,'2023-06-13','Laser skin treatment',6100.00),(135,135,35,'2023-06-14','Child immunization',980.00),(136,136,36,'2023-06-15','Chemotherapy cycle',7050.00),(137,137,37,'2023-06-16','Ultrasound imaging',1550.00),(138,138,38,'2023-06-17','Maternity care',5050.00),(139,139,39,'2023-06-18','Psychological counseling',2550.00),(140,140,40,'2023-06-19','Bladder surgery',18100.00),(141,141,41,'2023-06-20','Heart valve replacement',22100.00),(142,142,42,'2023-06-21','Epilepsy treatment',5050.00),(143,143,43,'2023-06-22','Knee replacement surgery',30100.00),(144,144,44,'2023-06-23','Skin biopsy',3550.00),(145,145,45,'2023-06-24','Child growth consultation',1250.00),(146,146,46,'2023-06-25','Radiation therapy',16100.00),(147,147,47,'2023-06-26','CT-guided biopsy',8050.00),(148,148,48,'2023-06-27','C-section delivery',25100.00),(149,149,49,'2023-06-28','Addiction treatment',7050.00),(150,150,50,'2023-06-29','Kidney stone removal',12150.00),(151,151,1,'2023-06-30','General checkup and consultation',560.00),(152,152,2,'2023-07-01','Neurological assessment',1260.00),(153,153,3,'2023-07-02','Orthopedic examination',860.00),(154,154,4,'2023-07-03','Skin allergy treatment',660.00),(155,155,5,'2023-07-04','Child vaccination',730.00),(156,156,6,'2023-07-05','Cancer screening',2120.00),(157,157,7,'2023-07-06','X-ray and imaging',1060.00),(158,158,8,'2023-07-07','Pregnancy consultation',1560.00),(159,159,9,'2023-07-08','Psychiatric evaluation',960.00),(160,160,10,'2023-07-09','Kidney function test',1160.00),(161,161,11,'2023-07-10','Cardiac health check',1860.00),(162,162,12,'2023-07-11','Neurological therapy',2260.00),(163,163,13,'2023-07-12','Bone fracture treatment',2560.00),(164,164,14,'2023-07-13','Skin infection medication',810.00),(165,165,15,'2023-07-14','Pediatric consultation',690.00),(166,166,16,'2023-07-15','Chemotherapy session',5150.00),(167,167,17,'2023-07-16','MRI scan',3060.00),(168,168,18,'2023-07-17','Gynecology checkup',1460.00),(169,169,19,'2023-07-18','Depression therapy',2060.00),(170,170,20,'2023-07-19','Urology procedure',2860.00),(171,171,21,'2023-07-20','Heart surgery follow-up',3560.00),(172,172,22,'2023-07-21','Brain scan and evaluation',3260.00),(173,173,23,'2023-07-22','Joint pain treatment',1260.00),(174,174,24,'2023-07-23','Cosmetic skin procedure',4560.00),(175,175,25,'2023-07-24','Child nutrition consultation',830.00),(176,176,26,'2023-07-25','Tumor removal surgery',15150.00),(177,177,27,'2023-07-26','CT scan',3560.00),(178,178,28,'2023-07-27','Fertility consultation',2060.00),(179,179,29,'2023-07-28','Anxiety treatment',1860.00),(180,180,30,'2023-07-29','Kidney dialysis session',4060.00),(181,181,31,'2023-07-30','Cardiac monitoring',2160.00),(182,182,32,'2023-07-31','Neurological surgery',20150.00),(183,183,33,'2023-08-01','Spine correction procedure',12160.00),(184,184,34,'2023-08-02','Laser skin treatment',6120.00),(185,185,35,'2023-08-03','Child immunization',990.00),(186,186,36,'2023-08-04','Chemotherapy cycle',7060.00),(187,187,37,'2023-08-05','Ultrasound imaging',1560.00),(188,188,38,'2023-08-06','Maternity care',5060.00),(189,189,39,'2023-08-07','Psychological counseling',2560.00),(190,190,40,'2023-08-08','Bladder surgery',18150.00),(191,191,41,'2023-08-09','Heart valve replacement',22150.00),(192,192,42,'2023-08-10','Epilepsy treatment',5060.00),(193,193,43,'2023-08-11','Knee replacement surgery',30150.00),(194,194,44,'2023-08-12','Skin biopsy',3560.00),(195,195,45,'2023-08-13','Child growth consultation',1260.00),(196,196,46,'2023-08-14','Radiation therapy',16150.00),(197,197,47,'2023-08-15','CT-guided biopsy',8060.00),(198,198,48,'2023-08-16','C-section delivery',25150.00),(199,199,49,'2023-08-17','Addiction treatment',7060.00),(200,200,50,'2023-08-18','Kidney stone removal',12160.00);
/*!40000 ALTER TABLE `treatments` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `checktreatmentcost` BEFORE INSERT ON `treatments` FOR EACH ROW begin
if new.cost < 0 then
signal sqlstate '45000' set message_text = 'treatment cost cannot be negative';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `afterinserttreatment` AFTER INSERT ON `treatments` FOR EACH ROW begin
insert into billing(treatment_id, patient_id, amount, billing_date, paid)
values (new.treatment_id, new.patient_id, new.cost, curdate(), 0);
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

-- Dump completed on 2025-10-06 10:21:37
