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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'kasongo','kenya','kasongoyeee@gmail.com','0712345678'),(2,'mathew','job','job@gmail.com','0712345672'),(3,'arnold','ken','ken@gmail.com','0712345671'),(4,'mark','iddi','mark@gmail.com','0712345675'),(5,'james','rama','rama@gmail.com','0712345674'),(6,'leah','joshua','leah@gmail.com','0712345679'),(7,'john','kareem','john@gmail.com','0712345677'),(8,'kijana','wamalwa','wamalwa@gmail.com','0712345673'),(9,'ken','walibora','walibora@gmail.com','0712345672'),(10,'heyley','kesh','kesh@gmail.com','0712345674'),(11,'andrew','kamau','kamau@gmail.com','0712345671'),(12,'honeah','kogea','kogea@gmail.com','0712345676'),(13,'zuchu','mustafa','mustafa@gmail.com','0712345679'),(14,'holla','ramaphosa','ramaphosa@gmail.com','0712375672'),(15,'jay','iinak','innak@gmail.com','0712325671'),(16,'melody','iddi','mark@gmail.com','0712345675'),(17,'sizore','waddy','weddy@gmail.com','0712145674'),(18,'museveni','juma','leah@gmail.com','0712345679'),(19,'jacob','zuma','jacob@gmail.com','0712945677'),(20,'Sihle','Kubheka','sihlekubheka@gmail.com','071234512'),(21,'Mbali','Khumalo','mkhumalo@gmail.com','0712345613'),(22,'Ntlanga','Nodali','ntlangaN@gmail.com','0712345614'),(23,'Athandwa','Tshoko','tshokoAthandwa@gmail.com','0712345615'),(24,'Lihle','Malindi','malindilihle@gmail.com','0712345616'),(25,'Fezeka','Plaatjie','fplaatjie@gmail.com','0712345617');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-12 15:45:34
