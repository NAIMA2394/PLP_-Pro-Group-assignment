CREATE DATABASE  IF NOT EXISTS `bookstoredb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookstoredb`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstoredb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `cust_order`
--

DROP TABLE IF EXISTS `cust_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `shipping_method_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `shipping_method_id` (`shipping_method_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `cust_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `cust_order_ibfk_2` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`shipping_method_id`),
  CONSTRAINT `cust_order_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_order`
--

LOCK TABLES `cust_order` WRITE;
/*!40000 ALTER TABLE `cust_order` DISABLE KEYS */;
INSERT INTO `cust_order` VALUES (1,1,'2025-04-01',1,1200.00,1),(2,2,'2025-04-02',2,1500.00,2),(3,3,'2025-04-03',3,2000.00,3),(4,4,'2025-04-04',4,3000.00,4),(5,5,'2025-04-05',5,1800.00,5),(6,6,'2025-04-06',1,1000.00,2),(7,7,'2025-04-07',2,2500.00,3),(8,8,'2025-04-08',3,1700.00,1),(9,9,'2025-04-09',4,900.00,4),(10,10,'2025-04-10',5,2100.00,5),(11,11,'2025-04-11',1,1350.00,1),(12,12,'2025-04-12',2,1200.00,2),(13,13,'2025-04-13',3,1950.00,3),(14,14,'2025-04-14',4,2300.00,4),(15,15,'2025-04-15',5,1600.00,5),(16,16,'2025-04-16',1,1800.00,1),(17,17,'2025-04-17',2,1450.00,2),(18,18,'2025-04-18',3,1250.00,3),(19,19,'2025-04-19',4,1750.00,4),(20,20,'2025-04-25',7,12345.55,7);
/*!40000 ALTER TABLE `cust_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-13 14:55:05
