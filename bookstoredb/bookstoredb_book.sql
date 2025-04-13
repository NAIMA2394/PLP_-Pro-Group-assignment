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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `book_language` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (8,'mathematics','17345679',300.00,39,1,4),(10,'KAmusi YA karner','12345679',257.00,42,2,3),(11,'Discovery Physics','24567890',150.00,43,3,300),(12,'Things FAll Apart','367899643',24.00,44,4,3),(13,'The river and the source','56789934',34.00,45,5,9),(14,'A man of the people','456678333',36.00,46,6,15),(31,'The Kenyan Coder','ISBN000038',850.00,44,3,28),(32,'Rewriting the Future','ISBN000039',915.00,45,4,19),(33,'Digital Minds','ISBN000040',940.00,46,5,21),(34,'Cloud Empire','ISBN000041',880.00,47,1,16),(35,'Tech from the Village','ISBN000042',835.00,48,2,27),(36,'eCommerce Africa','ISBN000043',765.00,49,3,24),(37,'Green Code','ISBN000044',920.00,50,4,29),(38,'The Hackathon Hero','ISBN000045',770.00,51,5,15),(39,'Mobile Mania','ISBN000046',890.00,52,1,30),(40,'The Silent River','ISBN000001',850.00,39,1,20),(41,'Whispers of the Wind','ISBN000002',920.00,40,2,15),(42,'Mystery in the Shadows','ISBN000003',640.00,41,3,25),(43,'Journey to the Unknown','ISBN000004',730.00,42,4,30),(44,'The Lost Tribe','ISBN000005',810.00,43,5,10),(45,'Under African Skies','ISBN000006',950.00,44,1,18),(46,'Echoes of the Savannah','ISBN000007',870.00,45,2,14),(47,'The Code Breaker','ISBN000008',760.00,46,3,21);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-13 13:22:33
