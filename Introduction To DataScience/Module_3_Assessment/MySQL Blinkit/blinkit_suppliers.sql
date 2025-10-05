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
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Tech Distributors Pvt Ltd','Amit Sharma','amit.sharma@techdist.com','9876500001'),(2,'Gadget World Suppliers','Neha Verma','neha.verma@gadgetworld.com','9876500002'),(3,'ElectroHub Traders','Rajesh Gupta','rajesh.gupta@electrohub.com','9876500003'),(4,'Appliance Mart','Pooja Mehta','pooja.mehta@apmart.com','9876500004'),(5,'Smart Devices Co','Karan Patel','karan.patel@smartdevices.com','9876500005'),(6,'Future Electronics','Anita Rao','anita.rao@futureelec.com','9876500006'),(7,'Bright Vision Traders','Deepak Kumar','deepak.kumar@bvtraders.com','9876500007'),(8,'NextGen Suppliers','Sunita Iyer','sunita.iyer@nextgensup.com','9876500008'),(9,'Prime Mobiles','Arjun Singh','arjun.singh@primemobiles.com','9876500009'),(10,'Elite Laptops','Priya Nair','priya.nair@elitelaptops.com','9876500010'),(11,'Camera King Distributors','Manoj Desai','manoj.desai@cameraking.com','9876500011'),(12,'SoundTech Supplies','Shweta Kapoor','shweta.kapoor@soundtech.com','9876500012'),(13,'Home Essentials Pvt Ltd','Rohit Bansal','rohit.bansal@homeessentials.com','9876500013'),(14,'KitchenMate Traders','Lata Reddy','lata.reddy@kitchenmate.com','9876500014'),(15,'Furniture House','Vikas Chandra','vikas.chandra@furnhouse.com','9876500015'),(16,'Clothify Distributors','Anjali Saxena','anjali.saxena@clothify.com','9876500016'),(17,'Shoe World Suppliers','Tarun Khanna','tarun.khanna@shoeworld.com','9876500017'),(18,'TimeZone Traders','Geeta Pillai','geeta.pillai@timezone.com','9876500018'),(19,'JewelsKart Distributors','Ajay Bose','ajay.bose@jewelskart.com','9876500019'),(20,'BookHub Suppliers','Meera Sharma','meera.sharma@bookhub.com','9876500020'),(21,'Toy Universe','Suresh Agarwal','suresh.agarwal@toyuniv.com','9876500021'),(22,'SportsPro Distributors','Savita Menon','savita.menon@sportspro.com','9876500022'),(23,'FreshMart Groceries','Ramesh Joshi','ramesh.joshi@freshmart.com','9876500023'),(24,'Daily Beverages Co','Jyoti Tyagi','jyoti.tyagi@dailybev.com','9876500024'),(25,'Snacky Traders','Pankaj Kohli','pankaj.kohli@snacky.com','9876500025'),(26,'CarePlus Suppliers','Alka Mishra','alka.mishra@careplus.com','9876500026'),(27,'HealthFirst Distributors','Harish Kulkarni','harish.kulkarni@healthfirst.com','9876500027'),(28,'Glow Beauty Traders','Sonali Banerjee','sonali.banerjee@glowbeauty.com','9876500028'),(29,'MediKart Distributors','Dinesh Rana','dinesh.rana@medikart.com','9876500029'),(30,'AutoHub Suppliers','Kavita Arora','kavita.arora@autohub.com','9876500030'),(31,'CarPlus Accessories','Raj Kumar','raj.kumar@carplus.com','9876500031'),(32,'BikeMax Traders','Ritu Verma','ritu.verma@bikemax.com','9876500032'),(33,'GreenLeaf Gardening','Sanjay Chopra','sanjay.chopra@greenleaf.com','9876500033'),(34,'PetCare Distributors','Seema Bhatt','seema.bhatt@petcare.com','9876500034'),(35,'OfficeMart Supplies','Dev Arora','dev.arora@officemart.com','9876500035'),(36,'MusicWorld Traders','Mona Dey','mona.dey@musicworld.com','9876500036'),(37,'GameZone Suppliers','Naveen Shetty','naveen.shetty@gamezone.com','9876500037'),(38,'Vision Electronics','Swati Tiwari','swati.tiwari@visionelec.com','9876500038'),(39,'Star Traders Pvt Ltd','Mahesh Bhagat','mahesh.bhagat@startraders.com','9876500039'),(40,'Metro Distributors','Kiran Deshmukh','kiran.deshmukh@metro.com','9876500040'),(41,'Royal Appliances','Pooja Nanda','pooja.nanda@royalappl.com','9876500041'),(42,'Global Traders','Vivek Rana','vivek.rana@globaltraders.com','9876500042'),(43,'Urban Essentials','Shreya Jain','shreya.jain@urbanessentials.com','9876500043'),(44,'Cosmo Distributors','Anil Bhatia','anil.bhatia@cosmo.com','9876500044'),(45,'NextStep Traders','Rashmi Khurana','rashmi.khurana@nextstep.com','9876500045'),(46,'BrightMart Suppliers','Lokesh Sharma','lokesh.sharma@brightmart.com','9876500046'),(47,'ValueKart Distributors','Tanvi Mehta','tanvi.mehta@valuekart.com','9876500047'),(48,'MegaStore Suppliers','Nikhil Kapoor','nikhil.kapoor@megastore.com','9876500048'),(49,'UniTrade Pvt Ltd','Kalyan Reddy','kalyan.reddy@unitrade.com','9876500049'),(50,'Allied Traders','Reena Saxena','reena.saxena@allied.com','9876500050');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
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
