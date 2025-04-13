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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Fichardt','Vanderbijlpark','1911',3),(2,'Leslie','Gabana','7895',7),(3,'Mpinga','Alexandra','7820',9),(4,'Gcina','Polokwane','0124',11),(5,'Plaatjie','Soweto','4561',17),(6,'Van Riebeek','Kingshasa','3651',22),(7,'Olwethu','Nairobi','1597',30),(8,'Makhubela','Musana','7539',18),(9,'Zimba','Richards Bay','4679',4),(10,'Tumahole','Vereeniging','1959',12),(11,'Moi Avenue','Nairobi','00100',1),(12,'Jinja Road','Kampala','00200',2),(13,'Uhuru Street','Dar es Salaam','00300',3),(14,'KN 3 Ave','Kigali','00400',4),(15,'Boulevard de l’Indépendance','Bujumbura','00500',5),(16,'Nimule Road','Juba','00600',6),(17,'Bole Road','Addis Ababa','00700',7),(18,'Makara Street','Mogadishu','00800',8),(19,'Awolowo Road','Lagos','00900',9),(20,'Oxford Street','Accra','01000',10);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_status`
--

DROP TABLE IF EXISTS `address_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_description` varchar(50) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_status`
--

LOCK TABLES `address_status` WRITE;
/*!40000 ALTER TABLE `address_status` DISABLE KEYS */;
INSERT INTO `address_status` VALUES (1,'Old'),(2,'New'),(3,'Current'),(4,'active'),(5,'inactive'),(6,'verified');
/*!40000 ALTER TABLE `address_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'naima'),(2,'aisha'),(3,'mercy'),(4,'nancy'),(5,'mark'),(6,'titus'),(7,'Thandeks'),(8,'mary'),(9,'abel'),(10,'adam'),(11,'joseph'),(12,'sarah'),(13,'abigael'),(14,'George'),(15,'Rowling'),(16,'Twain'),(17,'Agatha'),(18,'Stephen'),(19,'Tolkien'),(20,'Charles'),(21,'Fitzgerald'),(22,'Haruki'),(23,'Jane'),(24,'Chinua'),(25,'Ngugi'),(26,'Leo'),(27,'Ernest'),(28,'Gabriel'),(29,'dragon'),(30,'kasongo');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (8,1),(11,2),(10,4),(14,6),(13,7),(12,12);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_language`
--

DROP TABLE IF EXISTS `book_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_language` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `language_name` varchar(50) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_language`
--

LOCK TABLES `book_language` WRITE;
/*!40000 ALTER TABLE `book_language` DISABLE KEYS */;
INSERT INTO `book_language` VALUES (1,'kiswahili'),(2,'english'),(3,'arabic'),(4,'zulu'),(5,'french'),(6,'spanish'),(7,'spanish'),(8,'russian'),(9,'portugees'),(10,'portugees'),(11,'chinees'),(12,'hebrew'),(13,'german'),(14,'swedesh'),(15,'xhosa'),(16,'khoi'),(17,'san');
/*!40000 ALTER TABLE `book_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Kenya'),(2,'Uganda'),(3,'Tanzania'),(4,'Rwanda'),(5,'Burundi'),(6,'South Sudan'),(7,'Ethiopia'),(8,'Somalia'),(9,'Nigeria'),(10,'Ghana'),(11,'South Africa'),(12,'Egypt'),(13,'Morocco'),(14,'Algeria'),(15,'Tunisia'),(16,'Libya'),(17,'Sudan'),(18,'Zambia'),(19,'Zimbabwe'),(20,'Botswana'),(21,'Namibia'),(22,'Angola'),(23,'Mozambique'),(24,'Malawi'),(25,'DR Congo'),(26,'Cameroon'),(27,'Ivory Coast'),(28,'Senegal'),(29,'Mali'),(30,'Niger');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `customer_id` int NOT NULL,
  `address_id` int NOT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`address_id`),
  KEY `address_id` (`address_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `customer_address_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `customer_address_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `address_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES (1,1,1),(6,6,1),(2,2,2),(7,7,2),(3,3,3),(8,8,3),(3,5,4),(4,4,4),(9,9,4),(5,5,5);
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `order_id` (`order_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`),
  CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
INSERT INTO `order_history` VALUES (1,1,1,'2025-04-01 08:15:00'),(2,2,2,'2025-04-02 09:00:00'),(3,3,3,'2025-04-03 10:30:00'),(4,4,4,'2025-04-04 11:45:00'),(5,5,5,'2025-04-05 12:10:00'),(6,6,1,'2025-04-06 08:25:00'),(7,7,2,'2025-04-07 09:35:00'),(8,8,3,'2025-04-08 10:45:00'),(9,9,4,'2025-04-09 11:55:00'),(10,10,5,'2025-04-10 12:20:00'),(11,1,1,'2025-04-01 08:15:00'),(12,2,2,'2025-04-02 09:00:00'),(13,3,3,'2025-04-03 10:30:00'),(14,4,4,'2025-04-04 11:45:00'),(15,5,5,'2025-04-05 12:10:00'),(16,6,1,'2025-04-06 08:25:00'),(17,7,2,'2025-04-07 09:35:00'),(18,8,3,'2025-04-08 10:45:00'),(19,9,4,'2025-04-09 11:55:00'),(20,10,5,'2025-04-10 12:20:00'),(21,11,1,'2025-04-11 08:05:00'),(22,12,2,'2025-04-12 09:15:00'),(23,13,3,'2025-04-13 10:25:00'),(24,14,4,'2025-04-14 11:35:00'),(25,15,5,'2025-04-15 12:45:00');
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line` (
  `order_line_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_line_id`),
  KEY `order_id` (`order_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`),
  CONSTRAINT `order_line_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (55,1,8,2,400.00);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'pending'),(2,'shipped'),(3,'verified'),(4,'cancelled'),(5,'running'),(6,'payment received'),(7,'delivered'),(8,'processing'),(9,'awaiting pickup'),(10,'on hold'),(11,'denied'),(12,'order failed');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `phone_number` int DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (39,'Penguin Random House','contact@penguin.com',712345678),(40,'HarperCollins Publishers','info@harpercollins.com',723456789),(41,'Simon & Schuster','support@simonandschuster.com',734567890),(42,'Macmillan Publishers','hello@macmillan.com',745678901),(43,'Hachette Livre','info@hachette.com',756789012),(44,'Scholastic Corporation','support@scholastic.com',767890123),(45,'Pearson Education','contact@pearson.com',778901234),(46,'Oxford University Press','service@oup.com',789012345),(47,'Cambridge University Press','hello@cambridge.org',790123456),(48,'Wiley Publishing','info@wiley.com',701234567),(49,'Springer Nature','contact@springernature.com',712233445),(50,'Cengage Learning','help@cengage.com',723344556),(51,'Elsevier','support@elsevier.com',734455667),(52,'Thomson Reuters','info@thomsonreuters.com',745566778),(53,'McGraw-Hill Education','service@mcgrawhill.com',756677889),(54,'ashley house','asshley@gmail.com',712345678);
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method`
--

DROP TABLE IF EXISTS `shipping_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_method` (
  `shipping_method_id` int NOT NULL AUTO_INCREMENT,
  `method_name` varchar(100) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`shipping_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method`
--

LOCK TABLES `shipping_method` WRITE;
/*!40000 ALTER TABLE `shipping_method` DISABLE KEYS */;
INSERT INTO `shipping_method` VALUES (1,'container',10000.00),(2,'train',2000.00),(3,'Standard Shipping',300.00),(4,'Express Shipping',500.00),(5,'Overnight Shipping',750.00),(6,'Two-Day Shipping',600.00),(7,'In-Store Pickup',0.00),(8,'Local Delivery',250.00),(9,'drone',1200.00),(10,'international',1600.00);
/*!40000 ALTER TABLE `shipping_method` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-13 15:01:05
