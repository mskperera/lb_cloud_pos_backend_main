-- MariaDB dump 10.19-11.3.0-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: lbposc_light
-- ------------------------------------------------------
-- Server version	11.3.0-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__operational_info`
--

DROP TABLE IF EXISTS `__operational_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__operational_info` (
  `db_version` varchar(50) NOT NULL,
  `releasedDate` datetime DEFAULT NULL,
  `system_category_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__operational_info`
--

LOCK TABLES `__operational_info` WRITE;
/*!40000 ALTER TABLE `__operational_info` DISABLE KEYS */;
INSERT INTO `__operational_info` VALUES
('1.0.0-alpha.1','2024-05-19 00:00:00','1');
/*!40000 ALTER TABLE `__operational_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_payments`
--

DROP TABLE IF EXISTS `card_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_payments` (
  `PaymentId` int(11) NOT NULL,
  `CardHolderName` varchar(100) DEFAULT NULL,
  `CardTypeId` int(11) DEFAULT NULL,
  `CardLastFourDigits` varchar(4) DEFAULT NULL,
  `CardExpirationMonth` int(11) DEFAULT NULL,
  `CardExpirationYear` int(11) DEFAULT NULL,
  `bankId` int(11) DEFAULT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `FK_CardPayments_CardTypes` (`CardTypeId`),
  CONSTRAINT `FK_CardPayments_CardTypes` FOREIGN KEY (`CardTypeId`) REFERENCES `card_types` (`CardTypeId`),
  CONSTRAINT `cardpayments_ibfk` FOREIGN KEY (`PaymentId`) REFERENCES `order_payments` (`PaymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_payments`
--

LOCK TABLES `card_payments` WRITE;
/*!40000 ALTER TABLE `card_payments` DISABLE KEYS */;
INSERT INTO `card_payments` VALUES
(93,'JOHN DOE',1,'1234',12,2025,1),
(95,'JOHN DOE',1,'1234',12,2025,1),
(98,'JOHN DOE',1,'1234',12,2025,1),
(100,'JOHN DOE',1,'1234',12,2025,1),
(102,'JOHN DOE',1,'1234',12,2025,1),
(104,'JOHN DOE',1,'1234',12,2025,1),
(106,'JOHN DOE',1,'1234',12,2025,1),
(108,'JOHN DOE',1,'1234',12,2025,1),
(110,'JOHN DOE',1,'1234',12,2025,1),
(112,'JOHN DOE',1,'1234',12,2025,1),
(114,'JOHN DOE',1,'1234',12,2025,1),
(116,'JOHN DOE',1,'1234',12,2025,1),
(118,'hhhh',2,'2222',12,25,2),
(121,'JOHN DOE',1,'1234',12,2025,1),
(123,'JOHN DOE',1,'1234',12,2025,1),
(124,'hjhjkkk',1,'4545',12,52,1),
(125,'hjj',1,'1225',12,25,NULL),
(126,'hjkj',1,'1225',12,25,NULL),
(128,'JOHN DOE',1,'1234',12,2025,1),
(130,'JOHN DOE',1,'1234',12,2025,1),
(132,'JOHN DOE',1,'1234',12,2025,1),
(134,'JOHN DOE',1,'1234',12,2025,1),
(136,'JOHN DOE',1,'1234',12,2025,1),
(138,'JOHN DOE',1,'1234',12,2025,1),
(140,'JOHN DOE',1,'1234',12,2025,1),
(142,'JOHN DOE',1,'1234',12,2025,1),
(160,'iuhjkhk',1,'1155',12,25,NULL),
(161,'iuhjkhk',1,'1155',12,25,NULL),
(163,'hkhkj',1,'1211',12,25,NULL),
(167,'gjhjg',1,'0215',12,25,NULL),
(169,'hghj',1,'1225',12,25,NULL);
/*!40000 ALTER TABLE `card_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_types`
--

DROP TABLE IF EXISTS `card_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_types` (
  `CardTypeId` int(11) NOT NULL,
  `CardTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CardTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_types`
--

LOCK TABLES `card_types` WRITE;
/*!40000 ALTER TABLE `card_types` DISABLE KEYS */;
INSERT INTO `card_types` VALUES
(1,'Visa'),
(2,'MasterCard'),
(3,'American Express'),
(4,'Discover'),
(5,'Diners Club'),
(6,'JCB');
/*!40000 ALTER TABLE `card_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_payments`
--

DROP TABLE IF EXISTS `cash_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_payments` (
  `PaymentId` int(11) NOT NULL,
  `BalanceAmount` decimal(10,4) DEFAULT NULL,
  `ReceivedAmount` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`PaymentId`),
  CONSTRAINT `cashpayments_ibfk` FOREIGN KEY (`PaymentId`) REFERENCES `order_payments` (`PaymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_payments`
--

LOCK TABLES `cash_payments` WRITE;
/*!40000 ALTER TABLE `cash_payments` DISABLE KEYS */;
INSERT INTO `cash_payments` VALUES
(92,NULL,4000.0000),
(94,NULL,4000.0000),
(96,NULL,20.0000),
(97,NULL,4000.0000),
(99,NULL,4000.0000),
(101,NULL,4000.0000),
(103,NULL,4000.0000),
(105,NULL,4000.0000),
(107,NULL,4000.0000),
(109,NULL,4000.0000),
(111,NULL,4000.0000),
(113,NULL,4000.0000),
(115,NULL,4000.0000),
(117,NULL,100.0000),
(119,NULL,4.5800),
(120,NULL,4000.0000),
(122,NULL,4000.0000),
(127,NULL,4000.0000),
(129,-5349.0900,10115.0000),
(131,-5349.0900,10115.0000),
(133,5349.0900,10115.0000),
(135,5349.0900,10115.0000),
(137,6339.0900,11105.0000),
(139,6339.0900,11105.0000),
(141,6338.0900,11104.0000),
(143,NULL,4.2100),
(144,NULL,4.2100),
(145,NULL,4.2100),
(146,NULL,4.2100),
(147,NULL,4.2100),
(148,NULL,0.0000),
(149,NULL,4.2100),
(150,NULL,4.2100),
(151,NULL,4.2100),
(152,NULL,4.2100),
(153,NULL,4.2100),
(154,NULL,4.2100),
(155,NULL,4.2100),
(156,5234.0900,10000.0000),
(157,NULL,4.2100),
(158,0.0000,4.2100),
(159,16.5400,20.0000),
(162,14.3800,20.0000),
(164,0.0000,5.6200),
(165,0.0000,4.7500),
(166,0.0000,4.7500),
(168,0.0000,NULL),
(170,15.2500,20.0000),
(171,3.0900,10.0000),
(172,5234.0900,10000.0000),
(173,3.5200,10.0000),
(174,5.2500,10.0000),
(175,10.1700,20.0000),
(176,46.5400,50.0000),
(177,27.7600,50.0000),
(178,48.7000,50.0000),
(179,44.6000,50.0000),
(180,94.6000,100.0000),
(181,15.7900,20.0000),
(182,31.4200,50.0000),
(183,272.1200,500.0000),
(184,41.5800,50.0000),
(185,37.6900,50.0000),
(186,494.6000,500.0000),
(187,8.4400,20.0000),
(188,9.2000,20.0000),
(189,271.0000,1000.0000),
(190,778.0600,1000.0000),
(191,336.2700,500.0000),
(192,260.2400,500.0000),
(193,272.8800,500.0000),
(194,307.4400,500.0000),
(195,70.5200,100.0000),
(196,252.6800,500.0000),
(197,479.3700,500.0000),
(198,40.2800,50.0000),
(199,272.6600,500.0000),
(200,488.8800,500.0000),
(201,274.5000,500.0000),
(202,37.5800,50.0000),
(203,47.3000,50.0000),
(204,487.4700,500.0000),
(205,87.0400,100.0000),
(206,271.4700,500.0000),
(207,6.1700,500.0000),
(208,24.5300,500.0000),
(209,21.3400,500.0000),
(210,89.9600,100.0000),
(211,468.7900,500.0000),
(212,86.3900,100.0000),
(213,261.8600,500.0000),
(214,479.0500,500.0000),
(215,3873.7800,5000.0000),
(216,47.7300,50.0000),
(217,406.8500,500.0000),
(218,94.6000,100.0000),
(219,383.3600,500.0000),
(220,75.1600,100.0000),
(221,9521.5600,10000.0000),
(222,9521.5600,10000.0000),
(223,9521.5600,10000.0000),
(224,31.6400,50.0000),
(225,31.6400,50.0000),
(226,45.2500,50.0000),
(227,39.7400,50.0000),
(228,4.9100,100.0000),
(229,485.7400,500.0000),
(230,298.9700,1000.0000),
(231,9511.8400,10000.0000),
(232,9511.8400,10000.0000),
(233,92.4400,100.0000),
(234,9511.8400,10000.0000),
(235,9511.8400,10000.0000),
(236,9511.8400,10000.0000),
(237,9511.8400,10000.0000),
(238,9511.8400,10000.0000),
(239,9511.8400,10000.0000),
(240,388.7600,500.0000),
(241,493.4100,500.0000),
(242,390.3800,500.0000),
(243,96.5400,100.0000),
(244,490.5500,500.0000);
/*!40000 ALTER TABLE `cash_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) NOT NULL,
  `CreatedDate_Server` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedDate_Server` datetime DEFAULT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES
(1,'Other','2023-05-21 23:42:45',NULL),
(2,'Fruits','2023-12-21 22:59:23',NULL),
(3,'Drinks','2023-12-21 22:59:23',NULL),
(4,'Grocery Items','2023-12-21 23:00:46',NULL),
(5,'Beverages','2023-12-21 23:38:18',NULL),
(6,'Bakery','2023-12-21 23:38:18',NULL),
(7,'Canned Goods','2023-12-21 23:38:18',NULL),
(8,'Dairy','2023-12-21 23:38:18',NULL),
(9,'Dry/Baking Goods','2023-12-21 23:38:18',NULL),
(10,'Frozen Foods','2023-12-21 23:38:18',NULL),
(11,'Meat','2023-12-21 23:38:18',NULL),
(12,'Produce','2023-12-21 23:38:18',NULL),
(13,'Cleaners','2023-12-21 23:38:18',NULL),
(14,'Paper Goods','2023-12-21 23:38:18',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `CountryId` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES
(1,'Sri Lanka');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `CurrencyID` int(11) NOT NULL,
  `CurrencyCode` varchar(3) DEFAULT NULL,
  `CurrencyName` varchar(50) DEFAULT NULL,
  `Symbol` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CurrencyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES
(1,'LKR','Sri Lankan Rupee','Rs'),
(2,'USD','United States Dollar','$'),
(3,'EUR','Euro',NULL),
(4,'RON','Romanian Leu',NULL),
(5,'RUB','Russian Ruble',NULL),
(6,'JPY','Japanese Yen',NULL),
(7,'GBP','British Pound Sterling',NULL),
(8,'AUD','Australian Dollar',NULL),
(9,'CAD','Canadian Dollar',NULL),
(10,'CHF','Swiss Franc',NULL),
(11,'CNY','Chinese Yuan Renminbi',NULL),
(12,'INR','Indian Rupee',NULL),
(13,'SGD','Singapore Dollar',NULL),
(14,'ZAR','South African Rand',NULL),
(15,'NZD','New Zealand Dollar',NULL),
(16,'SEK','Swedish Krona',NULL),
(17,'KRW','South Korean Won',NULL),
(18,'BRL','Brazilian Real',NULL),
(19,'TRY','Turkish Lira',NULL);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(100) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Mobile` varchar(15) DEFAULT NULL,
  `Tel` varchar(15) DEFAULT NULL,
  `WhatsappNumber` varchar(15) DEFAULT NULL,
  `Remark` varchar(200) DEFAULT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedDate_ServerTime` datetime DEFAULT NULL,
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  `CustomerCode` varchar(50) DEFAULT NULL,
  `UserLogID` int(11) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES
(1,'custnamekk0kk1','spmkk@ggm1','44445','555','4447','rerrrer','2023-10-05 18:15:01','2023-10-05 23:45:01',NULL,NULL,NULL,1),
(13,'custname11','spmkk@ggm','444454','555','4447','rerrrer','2023-09-20 19:40:57','2023-09-20 19:40:57','2023-09-20 19:41:39','2023-09-20 14:11:39','00013',1),
(14,'custnamekk14edd 14e','spmkk@ggmkk','07744484876','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2024-05-19 13:12:23','2024-05-19 07:42:23','00014',1),
(17,'custnamekk02i','spmkk@ggmk','444454','555','4447','rerrrer','2023-09-20 20:33:31','2023-09-20 20:33:31','2024-04-13 20:04:08','2024-04-13 14:34:08','00013',1),
(21,'custnamekk0kk2','spmkk@ggm','44445','555','4447','rerrrer','2023-10-05 18:03:22','2023-10-05 23:33:22','2024-03-02 22:51:01','2024-03-02 17:21:01','00021',1),
(22,'custnamekk0kk27','spmkk@ggm27','44445','555','4447','rerrrer','2023-10-05 18:05:58','2023-10-05 23:35:58','2024-03-01 20:58:27','2024-03-01 15:28:27','00022',1),
(23,'custnamekk0kk28','spmkk@ggm28','44445','555','4447','rerrrer','2023-10-05 18:07:43','2023-10-05 23:37:43','2024-03-01 20:58:25','2024-03-01 15:28:25','00023',1),
(30,'custnamekk0kk30','spmkk@ggm30','44445','555','4447','rerrrer','2023-10-05 18:09:26','2023-10-05 23:39:26',NULL,NULL,NULL,1),
(31,'custnamekk0kk31','spmkk@ggm31','44445','555','4447','rerrrer','2023-10-05 18:11:06','2023-10-05 23:41:06',NULL,NULL,NULL,1),
(32,'custnamekk0kk32','spmkk@ggm32','44445','555','4447','rerrrer','2023-10-05 18:11:23','2023-10-05 23:41:23','2024-03-01 20:58:30','2024-03-01 15:28:30','00032',1),
(33,'custnamekk0kk33','spmkk@ggm33','44445','555','4447','rerrrer','2023-10-05 18:11:39','2023-10-05 23:41:39','2024-03-01 20:58:22','2024-03-01 15:28:22','00033',1),
(35,'custnamekk0kk35','spmkk@ggm35','44445','555','4447','rerrrer','2023-10-05 18:11:53','2023-10-05 23:41:53',NULL,NULL,NULL,1),
(41,'SUSANTHA Perera','spmskperera@gmail.com','0771147484','0117878',NULL,'rere','2024-02-21 16:29:44','2024-02-21 21:59:44','2024-03-01 20:58:38','2024-03-01 15:28:38','00041',1),
(44,'SUSANTHA Perera33','spmskperera@gmail.com','0771147484','44','234','dfgfg','2024-03-02 17:06:25','2024-03-02 22:36:25',NULL,NULL,'00044',1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datachangelog`
--

DROP TABLE IF EXISTS `datachangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datachangelog` (
  `dataChangeLogID` int(11) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(255) NOT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`dataChangeLogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datachangelog`
--

LOCK TABLES `datachangelog` WRITE;
/*!40000 ALTER TABLE `datachangelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `datachangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_country`
--

DROP TABLE IF EXISTS `dc_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_country` (
  `DC_CountryId` int(11) NOT NULL AUTO_INCREMENT,
  `CountryId` int(11) NOT NULL,
  `CountryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DC_CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_country`
--

LOCK TABLES `dc_country` WRITE;
/*!40000 ALTER TABLE `dc_country` DISABLE KEYS */;
INSERT INTO `dc_country` VALUES
(2,1,'Sri Lanka');
/*!40000 ALTER TABLE `dc_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_customer`
--

DROP TABLE IF EXISTS `dc_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_customer` (
  `DC_CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(100) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Mobile` varchar(15) DEFAULT NULL,
  `Tel` varchar(15) DEFAULT NULL,
  `WhatsappNumber` varchar(15) DEFAULT NULL,
  `Remark` varchar(200) DEFAULT NULL,
  `CreatedDate_UTC` datetime NOT NULL,
  `CreatedDate_ServerTime` datetime NOT NULL,
  `ModifiedDate_ServerTime` datetime DEFAULT NULL,
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  `CustomerCode` varchar(50) DEFAULT NULL,
  `UserLogID` int(11) NOT NULL,
  PRIMARY KEY (`DC_CustomerID`),
  UNIQUE KEY `DC_CustomerID_UNIQUE` (`DC_CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_customer`
--

LOCK TABLES `dc_customer` WRITE;
/*!40000 ALTER TABLE `dc_customer` DISABLE KEYS */;
INSERT INTO `dc_customer` VALUES
(1,14,'custnamekk02','spmkk@ggm','44445','555','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09',NULL,NULL,'00014',1),
(2,14,'custnamekk14edd','spmkk@ggmkk','444454','555','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-24 21:21:38','2023-09-24 15:51:38','00014',1),
(3,14,'custnamekk14edd eee','spmkk@ggmkk','444454','555','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-24 21:39:55','2023-09-24 16:09:55','00014',1),
(4,14,'custnamekk14edd eee','spmkk@ggmkk','444454','555','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-24 21:40:02','2023-09-24 16:10:02','00014',1),
(5,14,'custnamekk14edd eee','spmkk@ggmkk','444454','555','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-24 21:40:13','2023-09-24 16:10:13','00014',1),
(6,14,'custnamekk14edd eee','spmkk@ggmkk','444454','555','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-24 21:41:57','2023-09-24 16:11:57','00014',1),
(7,14,'custnamekk14edd eee','spmkk@ggmkk','444454','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-24 21:42:23','2023-09-24 16:12:23','00014',1),
(8,13,'custname11','spmkk@ggm','444454','555','4447','rerrrer','2023-09-20 19:40:57','2023-09-20 19:40:57','2023-09-20 19:41:39','2023-09-20 14:11:39','00013',1),
(9,17,'custnamekk02i','spmkk@ggmk','444454','555','4447','rerrrer','2023-09-20 20:33:31','2023-09-20 20:33:31','2023-09-24 21:20:15','2023-09-24 15:50:15','00013',1),
(10,14,'custnamekk14edd eee','spmkk@ggmkk','444454','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-24 22:01:11','2023-09-24 16:31:11','00014',1),
(11,14,'custnamekk14edd eee','spmkk@ggmkk','444454','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-24 22:01:20','2023-09-24 16:31:20','00014',1),
(12,14,'custnamekk14edd eee','spmkk@ggmkk','444454','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-24 22:01:25','2023-09-24 16:31:25','00014',1),
(13,14,'custnamekk14edd eee','spmkk@ggmkk','444454','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-24 22:01:30','2023-09-24 16:31:30','00014',1),
(14,14,'custnamekk14edd john kamil','spmkk@ggmkk','0774448484','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-24 22:05:05','2023-09-24 16:35:05','00014',1),
(15,14,'custnamekk14edd john kamil 14','spmkk@ggmkk','0774448484','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-24 22:06:00','2023-09-24 16:36:00','00014',1),
(16,14,'custnamekk14edd john kamil 14','spmkk@ggmkk','07744484876','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-09-26 23:22:16','2023-09-26 17:52:16','00014',1),
(17,14,'custnamekk14edd 14','spmkk@ggmkk','07744484876','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2023-10-05 23:45:36','2023-10-05 18:15:36','00014',1),
(18,14,'custnamekk14edd 14','spmkk@ggmkk','07744484876','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2024-02-21 20:38:31','2024-02-21 15:08:31','00014',1),
(19,33,'custnamekk0kk33','spmkk@ggm33','44445','555','4447','rerrrer','2023-10-05 18:11:39','2023-10-05 23:41:39',NULL,NULL,'00033',1),
(20,23,'custnamekk0kk28','spmkk@ggm28','44445','555','4447','rerrrer','2023-10-05 18:07:43','2023-10-05 23:37:43',NULL,NULL,'00023',1),
(21,32,'custnamekk0kk32','spmkk@ggm32','44445','555','4447','rerrrer','2023-10-05 18:11:23','2023-10-05 23:41:23',NULL,NULL,'00032',1),
(22,41,'SUSANTHA Perera','spmskperera@gmail.com','0771147484','0117878',NULL,'rere','2024-02-21 16:29:44','2024-02-21 21:59:44',NULL,NULL,'00041',1),
(23,22,'custnamekk0kk27','spmkk@ggm27','44445','555','4447','rerrrer','2023-10-05 18:05:58','2023-10-05 23:35:58',NULL,NULL,'00022',1),
(24,33,'custnamekk0kk33','spmkk@ggm33','44445','555','4447','rerrrer','2023-10-05 18:11:39','2023-10-05 23:41:39','2024-03-01 20:58:22','2024-03-01 15:28:22','00033',1),
(25,22,'custnamekk0kk27','spmkk@ggm27','44445','555','4447','rerrrer','2023-10-05 18:05:58','2023-10-05 23:35:58','2024-03-01 20:58:27','2024-03-01 15:28:27','00022',1),
(26,14,'custnamekk14edd 14e','spmkk@ggmkk','07744484876','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2024-03-02 22:51:24','2024-03-02 17:21:24','00014',1),
(27,21,'custnamekk0kk2','spmkk@ggm','44445','555','4447','rerrrer','2023-10-05 18:03:22','2023-10-05 23:33:22','2024-03-02 22:51:01','2024-03-02 17:21:01','00021',1),
(29,14,'custnamekk14edd 14e','spmkk@ggmkk','07744484876','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2024-03-22 22:21:15','2024-03-22 16:51:15','00014',1),
(30,32,'custnamekk0kk32','spmkk@ggm32','44445','555','4447','rerrrer','2023-10-05 18:11:23','2023-10-05 23:41:23','2024-03-01 20:58:30','2024-03-01 15:28:30','00032',1),
(31,23,'custnamekk0kk28','spmkk@ggm28','44445','555','4447','rerrrer','2023-10-05 18:07:43','2023-10-05 23:37:43','2024-03-01 20:58:25','2024-03-01 15:28:25','00023',1),
(32,17,'custnamekk02i','spmkk@ggmk','444454','555','4447','rerrrer','2023-09-20 20:33:31','2023-09-20 20:33:31','2024-04-13 20:04:08','2024-04-13 14:34:08','00013',1),
(33,14,'custnamekk14edd 14e','spmkk@ggmkk','07744484876','55554','4447','rerrrer','2023-09-20 19:41:09','2023-09-20 19:41:09','2024-05-19 13:12:23','2024-05-19 07:42:23','00014',1);
/*!40000 ALTER TABLE `dc_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_product`
--

DROP TABLE IF EXISTS `dc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_product` (
  `DC_ProductId` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `MeasurementUnitId` int(11) NOT NULL,
  `ProductNo` varchar(100) NOT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `UserLogId` int(11) NOT NULL,
  `ReorderLevel` decimal(10,2) DEFAULT NULL,
  `Barcode` varchar(100) DEFAULT NULL,
  `CreatedDate_UTC` datetime NOT NULL,
  `CreatedDate_ServerTime` datetime NOT NULL,
  `ModifiedDate_ServerTime` datetime DEFAULT NULL,
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  `DepartmentId` int(11) DEFAULT NULL,
  `TaxRate_perc` decimal(10,2) DEFAULT NULL,
  `imageUrl` text DEFAULT NULL,
  PRIMARY KEY (`DC_ProductId`),
  UNIQUE KEY `DC_ProductId_UNIQUE` (`DC_ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=770 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_product`
--

LOCK TABLES `dc_product` WRITE;
/*!40000 ALTER TABLE `dc_product` DISABLE KEYS */;
INSERT INTO `dc_product` VALUES
(1,10,'TTorint4544',1,'00248',12.00,1,10.00,'00024','2023-09-15 18:05:12','2023-09-15 23:35:12',NULL,NULL,NULL,NULL,NULL),
(2,10,'prodct10',1,'000010',12.00,1,11.00,'00003','2023-09-15 18:05:12','2023-09-15 23:35:12','2023-10-03 22:13:16','2023-10-03 16:43:16',NULL,NULL,NULL),
(3,10,'prodct10',1,'000010',12.00,1,11.00,'00003','2023-09-15 18:05:12','2023-09-15 23:35:12','2023-10-03 22:13:25','2023-10-03 16:43:25',NULL,NULL,NULL),
(4,4,'tttt',1,'0027',12.00,1,10.00,'00002','2023-09-04 12:47:48','2023-09-04 18:17:48','2023-09-11 00:28:41','2023-09-10 18:58:41',NULL,NULL,NULL),
(5,5,'prodct5',1,'00005',12.00,1,11.00,'00003','2023-09-04 12:48:25','2023-09-04 18:18:25','2023-09-18 20:40:40','2023-09-18 15:10:40',NULL,NULL,NULL),
(6,1,'product 001',1,'001',1.00,1,10.00,'000001','2023-10-03 20:08:07','2023-10-04 01:38:07',NULL,NULL,NULL,NULL,NULL),
(7,1,'product 001',1,'001',1.00,1,10.00,'000001','2023-10-03 20:08:29','2023-10-04 01:38:29',NULL,NULL,NULL,NULL,NULL),
(8,1,'product 001',1,'001',1.00,1,10.00,'000001','2023-10-03 20:08:31','2023-10-04 01:38:31',NULL,NULL,NULL,NULL,NULL),
(9,1,'product 001',1,'001',1.00,1,10.00,'000001','2023-10-03 20:10:06','2023-10-04 01:40:06',NULL,NULL,NULL,NULL,NULL),
(10,1,'product 001',1,'001',1.00,1,10.00,'000001','2023-10-03 20:10:07','2023-10-04 01:40:07',NULL,NULL,NULL,NULL,NULL),
(11,1,'product 001',1,'001',1.00,1,10.00,'000001','2023-10-03 20:10:26','2023-10-04 01:40:26',NULL,NULL,NULL,NULL,NULL),
(12,1,'product 001',1,'001',1.00,1,10.00,'000001','2023-10-03 20:10:28','2023-10-04 01:40:28',NULL,NULL,NULL,NULL,NULL),
(13,1,'product 001',1,'001',1.00,1,10.00,'000001','2023-10-03 20:13:16','2023-10-04 01:43:16',NULL,NULL,NULL,NULL,NULL),
(14,1,'product 001',1,'001',1.00,1,10.00,'000001','2023-10-04 03:13:50','2023-10-04 08:43:50',NULL,NULL,NULL,NULL,NULL),
(15,1,'product 001',1,'001',1.00,1,10.00,'000001','2023-10-04 15:50:25','2023-10-04 21:20:25',NULL,NULL,NULL,NULL,NULL),
(16,2,'Yorgut2ooeed',1,'00022',12.00,1,10.00,'00002','2023-08-26 13:59:35','2023-08-26 19:29:35','2023-09-04 18:50:34','2023-09-04 13:20:34',NULL,NULL,NULL),
(17,3,'prodct3',1,'00003',10.00,1,10.00,'1000','2023-09-02 05:34:02','2023-09-02 11:04:02',NULL,NULL,NULL,NULL,NULL),
(18,2,'prodct02',1,'00002',12.00,1,11.00,'00003','2023-08-26 13:59:35','2023-08-26 19:29:35','2023-10-04 22:45:43','2023-10-04 17:15:43',NULL,NULL,NULL),
(19,2,'prodct02',1,'00002',12.00,1,11.00,'00003','2023-08-26 13:59:35','2023-08-26 19:29:35','2023-10-04 22:46:17','2023-10-04 17:16:17',NULL,NULL,NULL),
(20,3,'prodct03',1,'00003',12.00,1,11.00,'00003','2023-09-02 05:34:02','2023-09-02 11:04:02','2023-10-04 22:46:28','2023-10-04 17:16:28',NULL,NULL,NULL),
(22,4,'prodct04',1,'00004',12.00,1,11.00,'00003','2023-09-04 12:47:48','2023-09-04 18:17:48','2023-10-04 22:49:35','2023-10-04 17:19:35',NULL,NULL,NULL),
(23,4,'prodct04',1,'00004',12.00,1,11.00,'00003','2023-09-04 12:47:48','2023-09-04 18:17:48','2023-10-04 23:15:17','2023-10-04 17:45:17',NULL,NULL,NULL),
(24,2,'prodct022',1,'000022',12.00,1,11.00,'00003','2023-08-26 13:59:35','2023-08-26 19:29:35','2023-10-04 23:16:24','2023-10-04 17:46:24',NULL,NULL,NULL),
(25,13,'TT0024 product from tenance-01',1,'00001',12.00,1,10.00,'00024','2023-10-19 13:22:22','2023-10-19 18:52:22',NULL,NULL,NULL,NULL,NULL),
(26,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,NULL,NULL,NULL),
(27,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,NULL,NULL,NULL),
(28,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,NULL,NULL,NULL),
(29,14,'Ice Cream 1L',2,'FRZ020',4.00,1,10.00,'1234567890322','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,NULL,NULL,NULL),
(30,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 19:18:49','2023-12-29 13:48:49',NULL,NULL,NULL),
(31,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(32,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(33,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(34,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 20:06:25','2023-12-29 14:36:25',2,NULL,NULL),
(35,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 20:06:51','2023-12-29 14:36:51',2,NULL,NULL),
(36,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 20:14:35','2023-12-29 14:44:35',4,NULL,NULL),
(41,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(59,26,'Bananas 1kg',1,'PRD030',1.80,1,25.00,'1234567890332','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(60,23,'Pork Chops 1kg',1,'MEA027',7.00,1,7.00,'1234567890329','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(61,21,'Frozen Berries Mix 500g',1,'FRZ024',4.50,1,8.00,'1234567890326','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(62,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(63,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(65,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(66,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(67,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(68,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(69,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(70,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(71,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(72,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(73,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(76,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(77,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(78,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(79,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(80,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(81,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(82,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(83,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(84,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(88,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(89,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(90,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(91,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(94,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(95,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(96,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(97,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(98,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(99,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(100,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(101,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(102,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(103,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(104,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(105,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(106,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(107,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(108,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(109,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(110,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(111,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(112,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(113,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(114,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(115,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(116,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(117,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(118,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(119,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(120,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(121,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(122,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(123,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(124,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(125,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(126,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(127,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(128,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(129,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(130,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(131,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(132,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(133,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(134,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(135,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(136,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(137,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(138,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(139,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(140,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(141,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(142,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(143,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(144,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(145,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(146,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(147,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(148,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(149,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(150,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(151,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(152,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(153,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(154,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(155,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(156,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(157,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(158,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(159,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(160,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(161,27,'Tomatoes 1kg',1,'PRD031',3.00,1,15.00,'1234567890333','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(162,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(163,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(164,15,'Beef Steak 1kg',1,'MEA030',8.00,1,5.00,'1234567890422','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(165,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(166,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(167,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(168,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(169,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(182,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(183,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(184,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(185,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(186,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(187,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(188,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(189,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(190,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(191,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(192,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(193,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(194,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(195,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(196,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(197,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(198,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(199,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(200,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(201,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(202,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(203,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(204,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(205,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(206,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(207,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(208,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(209,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(210,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(211,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(212,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(213,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(214,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(215,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(216,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(217,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(218,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(219,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(220,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(221,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(222,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(223,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(224,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(225,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(226,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(227,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(228,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(229,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(230,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(231,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(232,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(233,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(234,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(235,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(236,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(237,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(238,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(239,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(240,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(241,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(242,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(243,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(244,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(245,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(246,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(247,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(248,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(249,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(250,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(251,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(252,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(253,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(254,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(255,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(256,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(257,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(258,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(259,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(260,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(261,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(262,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(263,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(264,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(265,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(266,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(267,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(268,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(269,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(270,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(271,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(272,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(273,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(274,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(275,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(276,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(277,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(278,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(279,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(280,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(281,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(282,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(283,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(284,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(285,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(286,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(287,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(288,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(289,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(290,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(291,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(292,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(293,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(294,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(295,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(296,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(297,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(298,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(299,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(300,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(301,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(302,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(303,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(304,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(305,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(306,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(307,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(308,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(309,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(310,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(311,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(312,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(313,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(314,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(315,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(316,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(317,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(318,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(319,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(320,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(321,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(322,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(323,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(324,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(325,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(326,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(327,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(328,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(329,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(330,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(331,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(332,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(333,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(334,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(335,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(336,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(337,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(338,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(339,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(344,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(345,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(346,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(347,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(348,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(349,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(350,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(351,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(352,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(353,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(354,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(355,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(356,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(357,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(358,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(359,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(360,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(361,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(362,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(363,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(364,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(365,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(366,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(367,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(368,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(369,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(370,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(371,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(372,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(373,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(374,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(375,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(376,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(377,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(378,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(379,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(380,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(381,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(382,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(383,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(384,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(385,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(386,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(387,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(388,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(389,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(390,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(391,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(392,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(393,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(394,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(395,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(396,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(397,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(398,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(399,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(400,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(401,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(402,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(403,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(404,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(405,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(406,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(407,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(408,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(409,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(410,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(411,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(412,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(413,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(414,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(415,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(416,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(417,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(418,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(419,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(420,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(421,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(422,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(423,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(424,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(425,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(426,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(427,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(428,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(429,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(430,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(431,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(432,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(433,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(434,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(435,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(436,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(437,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(438,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(439,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(440,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(441,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(442,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(443,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(444,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(445,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(446,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(447,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(448,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(449,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(450,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(451,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(452,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(453,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(454,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(455,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(456,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(457,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(458,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(459,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(460,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(461,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(462,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(463,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(464,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(465,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(466,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(467,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(468,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(469,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(470,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(471,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(472,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(473,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(477,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(478,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(479,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(480,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(481,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(482,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(483,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(484,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(485,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(486,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(487,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(488,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(489,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(490,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(491,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(492,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(493,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(494,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(495,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(496,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(497,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(498,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(499,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(500,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(501,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(502,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(503,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(504,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(505,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(506,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(507,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(510,2,'product 12',1,'000012',2050.50,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40',NULL,NULL,1,NULL,NULL),
(511,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(512,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(513,14,'Ice Cream 1L edd',1,'P142344',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2023-12-29 21:47:13','2023-12-29 16:17:13',4,NULL,NULL),
(514,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(515,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(516,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(517,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(518,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(519,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(520,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(521,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(522,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(523,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(524,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(525,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(526,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(527,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(528,15,'Beef Steak 1kg',1,'MEA030',8.00,1,5.00,'1234567890422','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(529,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(530,17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(531,32,'Dishwashing Liquid 750ml',2,'CLN037',2.50,1,18.00,'1234567890339','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(532,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(533,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(534,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(535,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(536,1,'prodct 10',1,'000010',205.50,1,11.00,'00003','2023-12-21 16:55:56','2023-12-21 22:25:56','2023-12-21 22:30:53','2023-12-21 17:00:53',1,NULL,NULL),
(537,1,'prodct 10',1,'000010',205.50,1,11.00,'00003','2023-12-21 16:55:56','2023-12-21 22:25:56','2023-12-21 22:30:53','2023-12-21 17:00:53',1,NULL,NULL),
(538,1,'prodct 10',1,'000010',205.50,1,11.00,'00003','2023-12-21 16:55:56','2023-12-21 22:25:56','2023-12-21 22:30:53','2023-12-21 17:00:53',1,NULL,NULL),
(539,1,'prodct 10',1,'000010',205.50,1,11.00,'00003','2023-12-21 16:55:56','2023-12-21 22:25:56','2023-12-21 22:30:53','2023-12-21 17:00:53',1,NULL,NULL),
(540,1,'prodct 10',1,'000010',205.50,1,11.00,'00003','2023-12-21 16:55:56','2023-12-21 22:25:56','2023-12-21 22:30:53','2023-12-21 17:00:53',1,NULL,NULL),
(541,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(542,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(543,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(544,15,'Beef Steak 1kg',1,'MEA030',8.00,1,5.00,'1234567890422','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(545,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(546,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(547,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(548,28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(549,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(550,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(551,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(552,1,'prodct 10',1,'000010',205.50,1,11.00,'00003','2023-12-21 16:55:56','2023-12-21 22:25:56','2023-12-21 22:30:53','2023-12-21 17:00:53',1,NULL,NULL),
(553,8,'Energy Drink 250ml',2,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(554,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(555,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(556,26,'Bananas 1kg',1,'PRD030',1.80,1,25.00,'1234567890332','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(557,26,'Bananas 1kg',1,'PRD030',1.80,1,25.00,'1234567890332','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(558,27,'Tomatoes 1kg',1,'PRD031',3.00,1,15.00,'1234567890333','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(559,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(560,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(561,25,'Apples 1kg',1,'PRD029',2.50,1,20.00,'1234567890331','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(562,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,2,NULL,NULL),
(563,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(564,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(565,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(566,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(567,15,'Beef Steak 1kg',1,'MEA030',8.00,1,5.00,'1234567890422','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(568,57,'opopopo',2,'uuu676',10.00,1,1.00,'8768786','2024-02-14 19:17:03','2024-02-15 00:47:03',NULL,NULL,1,NULL,NULL),
(569,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(570,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(571,66,'Duuriyam Drink',3,'00067',667.00,1,10.00,'5466465','2024-02-16 10:14:57','2024-02-16 15:44:57','2024-02-16 15:45:29','2024-02-16 10:15:29',2,NULL,NULL),
(572,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(573,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(574,55,'product tenance-38, terminal-10, session-1455',1,'00001455',150.50,1,10.00,'00024','2024-02-14 18:29:42','2024-02-14 23:59:42',NULL,NULL,2,NULL,NULL),
(575,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(576,18,'Frozen Pizza',3,'FRZ021',5.00,1,15.00,'1234567890323','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(577,22,'Chicken Breast 1kg',1,'MEA026',6.50,1,6.00,'1234567890328','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(578,17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(579,68,'Orange Juice 1Ldd',2,'00069',2.50,1,15.00,'1234567890125','2024-02-17 14:56:08','2024-02-17 20:26:08','2024-02-17 20:26:08','2024-02-17 14:56:08',2,NULL,NULL),
(580,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(581,17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(582,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(583,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(584,31,'Glass Cleaner 500ml',2,'CLN036',2.80,1,20.00,'1234567890338','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(585,25,'Apples 1kg',1,'PRD029',2.50,1,20.00,'1234567890331','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(586,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(587,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(588,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-16 14:31:47','2024-02-16 09:01:47',1,NULL,NULL),
(589,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-17 18:26:10','2024-02-17 12:56:10',2,NULL,NULL),
(590,22,'Chicken Breast 1kg',1,'MEA026',6.50,1,6.00,'1234567890328','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(591,26,'Bananas 1kg',1,'PRD030',1.80,1,25.00,'1234567890332','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(592,23,'Pork Chops 1kg',1,'MEA027',7.00,1,7.00,'1234567890329','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(593,15,'Beef Steak 1kg',1,'MEA030',8.00,1,5.00,'1234567890422','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(594,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(595,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(596,17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(597,18,'Frozen Pizza',3,'FRZ021',5.00,1,15.00,'1234567890323','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(598,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(599,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(600,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(601,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:07','2024-02-18 13:48:07',2,NULL,NULL),
(602,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(603,17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(604,22,'Chicken Breast 1kg',1,'MEA026',6.50,1,6.00,'1234567890328','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(605,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(606,18,'Frozen Pizza',3,'FRZ021',5.00,1,15.00,'1234567890323','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(607,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:07','2024-02-18 13:48:07',2,NULL,NULL),
(608,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(609,26,'Bananas 1kg',1,'PRD030',1.80,1,25.00,'1234567890332','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(610,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(611,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(612,17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(613,24,'Lamb Ribs 1kg',1,'MEA028',9.00,1,4.00,'1234567890330','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(614,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-18 19:17:50','2024-02-18 13:47:50',2,NULL,NULL),
(615,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(616,23,'Pork Chops 1kg',1,'MEA027',7.00,1,7.00,'1234567890329','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(617,16,'Multipurpose Cleaner 1L',2,'CLE040',3.50,1,15.00,'1234567890522','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(618,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(619,17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(620,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(621,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(622,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(623,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(624,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:07','2024-02-18 13:48:07',2,NULL,NULL),
(625,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(626,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(627,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-18 19:17:50','2024-02-18 13:47:50',2,NULL,NULL),
(628,25,'Apples 1kg',1,'PRD029',2.50,1,20.00,'1234567890331','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(629,3,'Cola Drink 1L',2,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 21:32:06','2024-02-18 16:02:06',1,NULL,NULL),
(630,56,'dssd',2,'12224',222.00,1,4.00,'64654','2024-02-14 18:58:56','2024-02-15 00:28:56',NULL,NULL,2,NULL,NULL),
(631,58,'mmmm',2,'212',200.00,1,10.00,'12121212','2024-02-16 09:03:17','2024-02-16 14:33:17','2024-02-16 14:33:56','2024-02-16 09:03:56',8,NULL,NULL),
(632,69,'Orange Juice 1Lqqq',2,'00070',11.00,1,11.00,'2525315','2024-02-18 07:25:36','2024-02-18 12:55:36','2024-02-18 12:55:36','2024-02-18 07:25:36',3,NULL,NULL),
(633,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(634,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(635,11,'Canned Tuna 150g',1,'CAN001',1.75,1,25.00,'1234567890131','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(636,20,'Vegetable Stir Fry Mix',1,'FRZ023',4.00,1,10.00,'1234567890325','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(637,18,'Frozen Pizza',3,'FRZ021',5.00,1,15.00,'1234567890323','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(638,22,'Chicken Breast 1kg',1,'MEA026',6.50,1,6.00,'1234567890328','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(639,17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(640,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(641,17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(642,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(643,26,'Bananas 1kg',1,'PRD030',1.80,1,25.00,'1234567890332','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(644,17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(645,18,'Frozen Pizza',3,'FRZ021',5.00,1,15.00,'1234567890323','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(646,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(647,17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(648,22,'Chicken Breast 1kg',1,'MEA026',6.50,1,6.00,'1234567890328','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(649,23,'Pork Chops 1kg',1,'MEA027',7.00,1,7.00,'1234567890329','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(650,26,'Bananas 1kg',1,'PRD030',1.80,1,25.00,'1234567890332','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(651,27,'Tomatoes 1kg',1,'PRD031',3.00,1,15.00,'1234567890333','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(652,22,'Chicken Breast 1kg',1,'MEA026',6.50,1,6.00,'1234567890328','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(653,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(654,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(655,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(656,20,'Vegetable Stir Fry Mix',1,'FRZ023',4.00,1,10.00,'1234567890325','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(657,17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(658,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(659,26,'Bananas 1kg',1,'PRD030',1.80,1,25.00,'1234567890332','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(660,27,'Tomatoes 1kg',1,'PRD031',3.00,1,15.00,'1234567890333','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(661,23,'Pork Chops 1kg',1,'MEA027',7.00,1,7.00,'1234567890329','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,NULL,NULL),
(662,12,'Tomato Soup Can',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(663,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:07','2024-02-18 13:48:07',2,NULL,NULL),
(664,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(665,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(666,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(667,15,'Beef Steak 1kg',1,'MEA030',8.00,1,5.00,'1234567890422','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(668,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(669,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:07','2024-02-18 13:48:07',2,NULL,NULL),
(670,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(671,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(672,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(673,15,'Beef Steak 1kg',1,'MEA030',8.00,1,5.00,'1234567890422','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(674,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(675,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:07','2024-02-18 13:48:07',2,NULL,NULL),
(676,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(677,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(678,14,'Ice Cream 1L eddll',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(679,15,'Beef Steak 1kg',1,'MEA030',8.00,1,5.00,'1234567890422','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(680,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(681,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-18 19:17:50','2024-02-18 13:47:50',2,NULL,NULL),
(682,2,'Donut',1,'0000124',100.00,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40','2024-03-24 22:11:51','2024-03-24 16:41:51',1,NULL,NULL),
(683,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-18 19:17:50','2024-02-18 13:47:50',2,NULL,NULL),
(684,11,'Canned Tuna 150g',1,'CAN001',1.75,1,25.00,'1234567890131','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(685,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(686,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:07','2024-02-18 13:48:07',2,NULL,NULL),
(687,2,'Donut',1,'0000124',100.00,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40','2024-03-24 22:11:51','2024-03-24 16:41:51',1,NULL,NULL),
(688,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-18 19:17:50','2024-02-18 13:47:50',2,NULL,NULL),
(689,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(690,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(692,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(694,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(695,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(697,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(698,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(699,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(701,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:07','2024-02-18 13:48:07',2,NULL,NULL),
(702,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(703,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:07','2024-02-18 13:48:07',2,NULL,NULL),
(704,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(705,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:07','2024-02-18 13:48:07',2,NULL,NULL),
(706,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(707,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(708,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(709,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(710,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(712,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(713,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(714,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(716,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-18 19:17:50','2024-02-18 13:47:50',2,NULL,NULL),
(717,11,'Canned Tuna 150g',1,'CAN001',1.75,1,25.00,'1234567890131','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(718,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:07','2024-02-18 13:48:07',2,NULL,NULL),
(719,1,'Kimbula Bun',1,'000010',75.00,1,11.00,'00003','2023-12-21 16:55:56','2023-12-21 22:25:56','2024-03-24 22:10:45','2024-03-24 16:40:45',3,NULL,NULL),
(720,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(721,7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-18 19:17:50','2024-02-18 13:47:50',2,NULL,NULL),
(722,11,'Canned Tuna 150g',1,'CAN001',1.75,1,25.00,'1234567890131','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(723,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(724,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:07','2024-02-18 13:48:07',2,NULL,NULL),
(725,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(726,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(731,10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(732,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(733,14,'Ice Cream',1,'P142344ed',205.50,1,11.00,'00003','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-16 15:27:25','2024-02-16 09:57:25',4,NULL,NULL),
(734,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(735,12,'Tomato Soup',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(736,15,'Beef Steak 1kg',1,'MEA030',8.00,1,5.00,'1234567890422','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(737,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(738,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(741,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(742,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(743,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(744,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(745,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-05-12 13:39:54','2024-05-12 08:09:54',2,NULL,NULL),
(746,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(747,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(748,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(749,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(750,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(751,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(752,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(753,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(754,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(755,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(756,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(757,4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,NULL,NULL),
(758,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(759,2,'Donut',1,'0000124',100.00,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40','2024-03-24 22:11:51','2024-03-24 16:41:51',1,NULL,NULL),
(760,3,'Cola Drink',3,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38','2024-05-12 13:40:06','2024-05-12 08:10:06',1,NULL,NULL),
(761,13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,NULL,NULL),
(762,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(763,2,'Donut',1,'0000124',100.00,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40','2024-03-24 22:11:51','2024-03-24 16:41:51',1,NULL,NULL),
(764,3,'Cola Drink',3,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38','2024-05-12 13:40:06','2024-05-12 08:10:06',1,NULL,NULL),
(765,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-05-12 13:39:54','2024-05-12 08:09:54',2,NULL,NULL),
(766,6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,NULL,NULL),
(767,5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-05-12 13:39:54','2024-05-12 08:09:54',2,NULL,NULL),
(768,9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL),
(769,11,'Canned Tuna 150g',1,'CAN001',1.75,1,25.00,'1234567890131','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,NULL,NULL);
/*!40000 ALTER TABLE `dc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_store`
--

DROP TABLE IF EXISTS `dc_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_store` (
  `dc_storeId` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `StoreCode` varchar(50) DEFAULT NULL,
  `StoreName` varchar(50) DEFAULT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  `ModifiedDate_ServerTime` datetime DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `emailAddress` varchar(50) DEFAULT NULL,
  `tel1` varchar(20) DEFAULT NULL,
  `tel2` varchar(20) DEFAULT NULL,
  `ManagerId` int(11) DEFAULT NULL,
  UNIQUE KEY `dc_storeId_UNIQUE` (`dc_storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_store`
--

LOCK TABLES `dc_store` WRITE;
/*!40000 ALTER TABLE `dc_store` DISABLE KEYS */;
INSERT INTO `dc_store` VALUES
(2,1,'001','Br1','2024-01-25 13:43:38','2024-01-25 19:13:38',NULL,NULL,'Br1 address','Br city','br Province','swpmskpererea@gmail.com','0011212','011254',NULL),
(3,1,'001','Br1','2024-01-25 13:43:38','2024-01-25 19:13:38',NULL,NULL,'Br1 address','Br city','br Province','swpmskpererea@gmail.com','0011212','011254',NULL),
(4,1,'001','Br1','2024-01-25 13:43:38','2024-01-25 19:13:38',NULL,NULL,'Br1 address','Br city','br Province','swpmskpererea@gmail.com','0011212','011254',NULL);
/*!40000 ALTER TABLE `dc_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_terminal`
--

DROP TABLE IF EXISTS `dc_terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_terminal` (
  `DC_TerminalId` int(11) NOT NULL AUTO_INCREMENT,
  `TerminalId` int(11) NOT NULL,
  `TerminalName` varchar(50) NOT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedDate_ServerTime` datetime DEFAULT NULL,
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  PRIMARY KEY (`DC_TerminalId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_terminal`
--

LOCK TABLES `dc_terminal` WRITE;
/*!40000 ALTER TABLE `dc_terminal` DISABLE KEYS */;
INSERT INTO `dc_terminal` VALUES
(13,1,'Testing 2','2024-01-25 16:20:51','2024-01-25 21:50:51',NULL,NULL),
(14,1,'Testing Terminal 2','2024-01-25 16:20:51','2024-01-25 21:50:51',NULL,'2024-01-25 22:01:00'),
(15,1,'Testing Terminal 2','2024-01-25 16:20:51','2024-01-25 21:50:51',NULL,'2024-01-25 22:01:14');
/*!40000 ALTER TABLE `dc_terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_user_registration`
--

DROP TABLE IF EXISTS `dc_user_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_user_registration` (
  `dc_userId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `uName` varchar(500) DEFAULT NULL,
  `passwordHash` text DEFAULT NULL,
  `passwordSalt` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayName` varchar(100) DEFAULT NULL,
  `profilePic` varchar(50) DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'1',
  `CreatedDate_UTC` datetime DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime DEFAULT current_timestamp(),
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  `ModifiedDate_ServerTime` datetime DEFAULT NULL,
  PRIMARY KEY (`dc_userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_user_registration`
--

LOCK TABLES `dc_user_registration` WRITE;
/*!40000 ALTER TABLE `dc_user_registration` DISABLE KEYS */;
INSERT INTO `dc_user_registration` VALUES
(2,1,'spmskperera@gmail.com','ab903dce3846459597d741057106b96b11fc3e23','$2b$10$fszGAcRXm1aT6mRLkdRwW.','spmskperera@gmail.com','UserA','hh','','2023-10-08 19:20:02','2023-10-09 00:50:02',NULL,NULL),
(3,1,'spmskperera@gmail.com','ab903dce3846459597d741057106b96b11fc3e23','$2b$10$fszGAcRXm1aT6mRLkdRwW.','spmskperera@gmail.com','UserA SP','hh','','2023-10-08 19:20:02','2023-10-09 00:50:02',NULL,NULL);
/*!40000 ALTER TABLE `dc_user_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `DepartmentId` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) NOT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedDate_ServerTime` datetime DEFAULT NULL,
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  PRIMARY KEY (`DepartmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES
(1,'Grocery','2023-12-29 03:28:46','2023-12-29 08:58:46',NULL,NULL),
(2,'Beverages','2023-12-29 03:28:46','2023-12-29 08:58:46',NULL,NULL),
(3,'Bakery','2023-12-29 03:28:46','2023-12-29 08:58:46',NULL,NULL),
(4,'Household Goods','2023-12-29 03:28:46','2023-12-29 08:58:46',NULL,NULL),
(5,'Personal Care','2023-12-29 03:28:46','2023-12-29 08:58:46',NULL,NULL),
(6,'Electronics','2023-12-29 03:28:46','2023-12-29 08:58:46',NULL,NULL),
(7,'Produce','2023-12-29 03:28:46','2023-12-29 08:58:46',NULL,NULL),
(8,'Meat & Seafood','2023-12-29 03:28:46','2023-12-29 08:58:46',NULL,NULL),
(9,'Frozen Foods','2023-12-29 03:28:46','2023-12-29 08:58:46',NULL,NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_reason`
--

DROP TABLE IF EXISTS `discount_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_reason` (
  `DiscountReasonId` int(11) NOT NULL AUTO_INCREMENT,
  `ReasonName` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DiscountReasonId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_reason`
--

LOCK TABLES `discount_reason` WRITE;
/*!40000 ALTER TABLE `discount_reason` DISABLE KEYS */;
INSERT INTO `discount_reason` VALUES
(1,'Other','Enter your reason.'),
(2,'Promotional Discount','Discount for items on special promotion or seasonal sale.'),
(3,'Volume Discount','Discount applied for bulk or large quantity purchases.'),
(4,'Loyalty Reward','Discount for members of our loyalty program or club.'),
(5,'Employee Discount','Special discount offered to employees of the company.'),
(6,'Damaged Goods','Discount for slightly damaged or imperfect items.'),
(7,'Price Match','Price adjustment to match a competitor\'s price.'),
(8,'Coupon Redemption','Discount applied from a coupon or voucher redemption.'),
(9,'Manager\'s Discretion','Special discount applied at the manager\'s discretion.'),
(10,'Early Payment','Discount for early payment or pre-payment of goods/services.'),
(11,'End of Life Product','Discount for products that are being discontinued or phased out.');
/*!40000 ALTER TABLE `discount_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_reason_scope`
--

DROP TABLE IF EXISTS `discount_reason_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_reason_scope` (
  `DiscountReasonId` int(11) NOT NULL,
  `ScopeId` int(11) NOT NULL,
  PRIMARY KEY (`DiscountReasonId`,`ScopeId`),
  KEY `FK_DRScope_DiscountScope` (`ScopeId`),
  CONSTRAINT `FK_DRScope_DiscountReason` FOREIGN KEY (`DiscountReasonId`) REFERENCES `discount_reason` (`DiscountReasonId`),
  CONSTRAINT `FK_DRScope_DiscountScope` FOREIGN KEY (`ScopeId`) REFERENCES `discount_scope` (`ScopeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_reason_scope`
--

LOCK TABLES `discount_reason_scope` WRITE;
/*!40000 ALTER TABLE `discount_reason_scope` DISABLE KEYS */;
INSERT INTO `discount_reason_scope` VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(1,2),
(2,2),
(4,2),
(8,2);
/*!40000 ALTER TABLE `discount_reason_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_scope`
--

DROP TABLE IF EXISTS `discount_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_scope` (
  `ScopeId` int(11) NOT NULL AUTO_INCREMENT,
  `ScopeName` varchar(255) NOT NULL,
  PRIMARY KEY (`ScopeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_scope`
--

LOCK TABLES `discount_scope` WRITE;
/*!40000 ALTER TABLE `discount_scope` DISABLE KEYS */;
INSERT INTO `discount_scope` VALUES
(1,'product_level'),
(2,'order_level');
/*!40000 ALTER TABLE `discount_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_type`
--

DROP TABLE IF EXISTS `discount_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_type` (
  `DiscountTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DiscountTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_type`
--

LOCK TABLES `discount_type` WRITE;
/*!40000 ALTER TABLE `discount_type` DISABLE KEYS */;
INSERT INTO `discount_type` VALUES
(1,'Percentage'),
(2,'Fixed Amount');
/*!40000 ALTER TABLE `discount_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grn`
--

DROP TABLE IF EXISTS `grn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grn` (
  `GRNId` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedDate` timestamp NULL DEFAULT current_timestamp(),
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`GRNId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grn`
--

LOCK TABLES `grn` WRITE;
/*!40000 ALTER TABLE `grn` DISABLE KEYS */;
/*!40000 ALTER TABLE `grn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grndetails`
--

DROP TABLE IF EXISTS `grndetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grndetails` (
  `GRNDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `GRNId` int(11) NOT NULL,
  PRIMARY KEY (`GRNDetailId`),
  KEY `FK_GRNDetails_GRN` (`GRNId`),
  CONSTRAINT `FK_GRNDetails_GRN` FOREIGN KEY (`GRNId`) REFERENCES `grn` (`GRNId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grndetails`
--

LOCK TABLES `grndetails` WRITE;
/*!40000 ALTER TABLE `grndetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `grndetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `StockQty` int(11) NOT NULL,
  `ReorderLevel` int(11) NOT NULL,
  `StoreID` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `SupplierId` int(11) DEFAULT NULL,
  `GRNDetailId` int(11) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT current_timestamp(),
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `BatchNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `FK_Inventory_Store` (`StoreID`),
  KEY `FK_Inventory_Supplier` (`SupplierId`),
  KEY `FK_Inventory_GRNDetails` (`GRNDetailId`),
  CONSTRAINT `FK_Inventory_GRNDetails` FOREIGN KEY (`GRNDetailId`) REFERENCES `grndetails` (`GRNDetailId`),
  CONSTRAINT `FK_Inventory_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductId`),
  CONSTRAINT `FK_Inventory_Store` FOREIGN KEY (`StoreID`) REFERENCES `store` (`storeId`),
  CONSTRAINT `FK_Inventory_Supplier` FOREIGN KEY (`SupplierId`) REFERENCES `supplier` (`SupplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `LanguageID` int(11) NOT NULL AUTO_INCREMENT,
  `LanguageName` varchar(50) NOT NULL,
  `LanguageShortName` varchar(10) NOT NULL,
  `RowOrderId` int(11) NOT NULL,
  PRIMARY KEY (`LanguageID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES
(1,'Sinhala','SI',1),
(2,'English','EN',2),
(3,'Tamil','TA',3),
(4,'Russian','RU',4),
(5,'French','FR',5),
(6,'Spanish','ES',6),
(7,'Chinese','ZH',7),
(8,'German','DE',8),
(9,'Japanese','JA',9),
(10,'Arabic','AR',10);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurement_unit`
--

DROP TABLE IF EXISTS `measurement_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement_unit` (
  `MeasurementUnitId` int(11) NOT NULL AUTO_INCREMENT,
  `MeasurementUnitName` varchar(50) NOT NULL,
  `CreatedDate_Server` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedDate_Server` datetime DEFAULT NULL,
  PRIMARY KEY (`MeasurementUnitId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurement_unit`
--

LOCK TABLES `measurement_unit` WRITE;
/*!40000 ALTER TABLE `measurement_unit` DISABLE KEYS */;
INSERT INTO `measurement_unit` VALUES
(1,'pcs','2023-05-21 23:41:50',NULL),
(2,'Kilogram','2023-12-21 23:38:18',NULL),
(3,'Liter','2023-12-21 23:38:18',NULL),
(4,'Unit','2023-12-21 23:38:18',NULL),
(5,'Pack','2023-12-21 23:38:18',NULL),
(6,'Box','2023-12-21 23:38:18',NULL);
/*!40000 ALTER TABLE `measurement_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `Qty` decimal(10,4) DEFAULT NULL,
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `ProductId` int(11) NOT NULL,
  `unitPrice` decimal(10,4) DEFAULT NULL,
  `IsReturned` bit(1) NOT NULL DEFAULT b'0',
  `DC_productId` int(11) DEFAULT NULL,
  `GrossAmount` decimal(10,2) DEFAULT NULL,
  `NetAmount` decimal(10,2) DEFAULT NULL,
  `MeasurementUnitId` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderDetailID`),
  UNIQUE KEY `OrderDetailID_UNIQUE` (`OrderDetailID`),
  KEY `FK_OrderDetails_OrderHeader` (`OrderID`),
  KEY `FK_OrderDetails_Product` (`ProductId`),
  CONSTRAINT `FK_OrderDetails_OrderHeader` FOREIGN KEY (`OrderID`) REFERENCES `order_header` (`OrderId`),
  CONSTRAINT `FK_OrderDetails_Product` FOREIGN KEY (`ProductId`) REFERENCES `product` (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES
(204,2,4.0000,'2024-01-25 22:33:57','2024-01-25 17:03:57',2,200.8000,'\0',182,803.20,722.88,1),
(205,2,1.0000,'2024-01-25 22:33:57','2024-01-25 17:03:57',3,1000.0000,'\0',183,1000.00,990.00,1),
(206,2,1.0000,'2024-01-25 22:33:57','2024-01-25 17:03:57',4,950.0000,'\0',184,950.00,950.00,1),
(207,2,1.0000,'2024-01-25 22:33:57','2024-01-25 17:03:57',14,2250.0000,'\0',185,2250.00,2250.00,1),
(208,3,4.0000,'2024-01-25 22:34:01','2024-01-25 17:04:01',2,200.8000,'\0',186,803.20,722.88,1),
(209,3,1.2300,'2024-01-25 22:34:01','2024-01-25 17:04:01',3,1000.0000,'\0',187,1000.00,990.00,1),
(210,3,1.0000,'2024-01-25 22:34:01','2024-01-25 17:04:01',4,950.0000,'\0',188,950.00,950.00,1),
(211,3,1.0000,'2024-01-25 22:34:01','2024-01-25 17:04:01',14,2250.0000,'\0',189,2250.00,2250.00,1),
(212,4,1.0000,'2024-01-28 14:35:56','2024-01-28 09:05:56',7,2.5000,'\0',190,2.50,2.50,2),
(213,4,1.0000,'2024-01-28 14:35:56','2024-01-28 09:05:56',9,5.0000,'\0',191,5.00,5.00,3),
(214,5,4.0000,'2024-01-28 15:12:14','2024-01-28 09:42:14',2,200.8000,'\0',192,803.20,722.88,1),
(215,5,1.0000,'2024-01-28 15:12:14','2024-01-28 09:42:14',3,1000.0000,'\0',193,1000.00,990.00,2),
(216,5,1.0000,'2024-01-28 15:12:14','2024-01-28 09:42:14',4,950.0000,'\0',194,950.00,950.00,2),
(217,5,1.0000,'2024-01-28 15:12:14','2024-01-28 09:42:14',14,2250.0000,'\0',195,2250.00,2250.00,1),
(218,6,4.0000,'2024-01-28 15:13:27','2024-01-28 09:43:27',2,200.8000,'\0',196,803.20,722.88,1),
(219,6,1.0000,'2024-01-28 15:13:27','2024-01-28 09:43:27',3,1000.0000,'\0',197,1000.00,990.00,2),
(220,6,1.0000,'2024-01-28 15:13:27','2024-01-28 09:43:27',4,950.0000,'\0',198,950.00,950.00,2),
(221,6,1.0000,'2024-01-28 15:13:27','2024-01-28 09:43:27',14,2250.0000,'\0',199,2250.00,2250.00,1),
(222,7,4.0000,'2024-01-28 15:30:01','2024-01-28 10:00:01',2,200.8000,'\0',200,803.20,722.88,1),
(223,7,1.0000,'2024-01-28 15:30:01','2024-01-28 10:00:01',3,1000.0000,'\0',201,1000.00,990.00,2),
(224,7,1.0000,'2024-01-28 15:30:01','2024-01-28 10:00:01',4,950.0000,'\0',202,950.00,950.00,2),
(225,7,1.0000,'2024-01-28 15:30:01','2024-01-28 10:00:01',14,2250.0000,'\0',203,2250.00,2250.00,1),
(226,8,4.0000,'2024-01-28 15:34:01','2024-01-28 10:04:01',2,200.8000,'\0',204,803.20,722.88,1),
(227,8,1.0000,'2024-01-28 15:34:01','2024-01-28 10:04:01',3,1000.0000,'\0',205,1000.00,990.00,2),
(228,8,1.0000,'2024-01-28 15:34:01','2024-01-28 10:04:01',4,950.0000,'\0',206,950.00,950.00,2),
(229,8,1.0000,'2024-01-28 15:34:01','2024-01-28 10:04:01',14,2250.0000,'\0',207,2250.00,2250.00,1),
(230,9,4.0000,'2024-01-28 15:34:05','2024-01-28 10:04:05',2,200.8000,'\0',208,803.20,722.88,1),
(231,9,1.0000,'2024-01-28 15:34:05','2024-01-28 10:04:05',3,1000.0000,'\0',209,1000.00,990.00,2),
(232,9,1.0000,'2024-01-28 15:34:05','2024-01-28 10:04:05',4,950.0000,'\0',210,950.00,950.00,2),
(233,9,1.0000,'2024-01-28 15:34:05','2024-01-28 10:04:05',14,2250.0000,'\0',211,2250.00,2250.00,1),
(234,10,4.0000,'2024-01-28 15:47:00','2024-01-28 10:17:00',2,200.8000,'\0',212,803.20,722.88,1),
(235,10,1.0000,'2024-01-28 15:47:00','2024-01-28 10:17:00',3,1000.0000,'\0',213,1000.00,990.00,2),
(236,10,1.0000,'2024-01-28 15:47:00','2024-01-28 10:17:00',4,950.0000,'\0',214,950.00,950.00,2),
(237,10,1.0000,'2024-01-28 15:47:00','2024-01-28 10:17:00',14,2250.0000,'\0',215,2250.00,2250.00,1),
(238,11,4.0000,'2024-01-28 15:49:17','2024-01-28 10:19:17',2,200.8000,'\0',216,803.20,722.88,1),
(239,11,1.0000,'2024-01-28 15:49:17','2024-01-28 10:19:17',3,1000.0000,'\0',217,1000.00,990.00,2),
(240,11,1.0000,'2024-01-28 15:49:17','2024-01-28 10:19:17',4,950.0000,'\0',218,950.00,950.00,2),
(241,11,1.0000,'2024-01-28 15:49:17','2024-01-28 10:19:17',14,2250.0000,'\0',219,2250.00,2250.00,1),
(242,12,4.0000,'2024-01-28 15:49:28','2024-01-28 10:19:28',2,200.8000,'\0',220,803.20,722.88,1),
(243,12,1.0000,'2024-01-28 15:49:28','2024-01-28 10:19:28',3,1000.0000,'\0',221,1000.00,990.00,2),
(244,12,1.0000,'2024-01-28 15:49:28','2024-01-28 10:19:28',4,950.0000,'\0',222,950.00,950.00,2),
(245,12,1.0000,'2024-01-28 15:49:28','2024-01-28 10:19:28',14,2250.0000,'\0',223,2250.00,2250.00,1),
(246,13,4.0000,'2024-01-28 16:21:36','2024-01-28 10:51:36',2,200.8000,'\0',224,803.20,722.88,1),
(247,13,1.0000,'2024-01-28 16:21:36','2024-01-28 10:51:36',3,1000.0000,'\0',225,1000.00,990.00,2),
(248,13,1.0000,'2024-01-28 16:21:36','2024-01-28 10:51:36',4,950.0000,'\0',226,950.00,950.00,2),
(249,13,1.0000,'2024-01-28 16:21:36','2024-01-28 10:51:36',14,2250.0000,'\0',227,2250.00,2250.00,1),
(250,14,4.0000,'2024-01-28 16:55:59','2024-01-28 11:25:59',2,200.8000,'\0',228,803.20,722.88,1),
(251,14,1.0000,'2024-01-28 16:55:59','2024-01-28 11:25:59',3,1000.0000,'\0',229,1000.00,990.00,2),
(252,14,1.0000,'2024-01-28 16:55:59','2024-01-28 11:25:59',4,950.0000,'\0',230,950.00,950.00,2),
(253,14,1.0000,'2024-01-28 16:55:59','2024-01-28 11:25:59',14,2250.0000,'\0',231,2250.00,2250.00,1),
(254,15,2.0000,'2024-01-28 20:09:18','2024-01-28 14:39:18',8,2.0000,'\0',232,4.00,4.00,2),
(255,15,1.0000,'2024-01-28 20:09:18','2024-01-28 14:39:18',6,1.2000,'\0',233,1.20,1.20,3),
(256,15,1.0000,'2024-01-28 20:09:18','2024-01-28 14:39:18',9,5.0000,'\0',234,5.00,5.00,3),
(257,15,1.0000,'2024-01-28 20:09:18','2024-01-28 14:39:18',7,2.5000,'\0',235,2.50,2.50,2),
(258,15,1.0000,'2024-01-28 20:09:18','2024-01-28 14:39:18',4,0.8000,'\0',236,0.80,0.80,2),
(259,16,2.0000,'2024-01-28 20:11:05','2024-01-28 14:41:05',8,2.0000,'\0',252,4.00,4.00,2),
(260,16,1.0000,'2024-01-28 20:11:05','2024-01-28 14:41:05',6,1.2000,'\0',253,1.20,1.20,3),
(261,16,1.0000,'2024-01-28 20:11:05','2024-01-28 14:41:05',9,5.0000,'\0',254,5.00,5.00,3),
(262,16,1.0000,'2024-01-28 20:11:05','2024-01-28 14:41:05',7,2.5000,'\0',255,2.50,2.50,2),
(263,16,1.0000,'2024-01-28 20:11:05','2024-01-28 14:41:05',4,0.8000,'\0',256,0.80,0.80,2),
(264,17,4.0000,'2024-01-29 22:27:20','2024-01-29 16:57:20',2,200.8000,'\0',257,803.20,722.88,1),
(265,17,1.0000,'2024-01-29 22:27:20','2024-01-29 16:57:20',3,1000.0000,'\0',258,1000.00,990.00,2),
(266,17,1.0000,'2024-01-29 22:27:20','2024-01-29 16:57:20',4,950.0000,'\0',259,950.00,950.00,2),
(267,17,1.0000,'2024-01-29 22:27:20','2024-01-29 16:57:20',14,2250.0000,'\0',260,2250.00,2250.00,1),
(268,18,4.0000,'2024-01-29 22:27:24','2024-01-29 16:57:24',2,200.8000,'\0',261,803.20,722.88,1),
(269,18,1.0000,'2024-01-29 22:27:24','2024-01-29 16:57:24',3,1000.0000,'\0',262,1000.00,990.00,2),
(270,18,1.0000,'2024-01-29 22:27:24','2024-01-29 16:57:24',4,950.0000,'\0',263,950.00,950.00,2),
(271,18,1.0000,'2024-01-29 22:27:24','2024-01-29 16:57:24',14,2250.0000,'\0',264,2250.00,2250.00,1),
(272,19,1.0000,'2024-01-30 21:36:25','2024-01-30 16:06:25',28,1.2000,'\0',265,1.20,1.20,3),
(273,19,1.0000,'2024-01-30 21:36:25','2024-01-30 16:06:25',8,2.0000,'\0',266,2.00,2.00,2),
(274,19,1.0000,'2024-01-30 21:36:25','2024-01-30 16:06:25',3,1.5000,'\0',267,1.50,1.50,2),
(275,20,1.0000,'2024-01-30 21:44:27','2024-01-30 16:14:27',3,1.5000,'\0',268,1.50,1.50,2),
(276,20,1.0000,'2024-01-30 21:44:27','2024-01-30 16:14:27',12,1.5000,'\0',269,1.50,1.50,1),
(277,21,1.0000,'2024-01-30 21:45:39','2024-01-30 16:15:39',3,1.5000,'\0',270,1.50,1.50,2),
(278,21,1.0000,'2024-01-30 21:45:39','2024-01-30 16:15:39',12,1.5000,'\0',271,1.50,1.50,1),
(279,22,4.0000,'2024-01-30 22:44:00','2024-01-30 17:14:00',2,200.8000,'\0',280,803.20,722.88,1),
(280,22,1.0000,'2024-01-30 22:44:00','2024-01-30 17:14:00',3,1000.0000,'\0',281,1000.00,990.00,2),
(281,22,1.0000,'2024-01-30 22:44:00','2024-01-30 17:14:00',4,950.0000,'\0',282,950.00,950.00,2),
(282,22,1.0000,'2024-01-30 22:44:00','2024-01-30 17:14:00',14,2250.0000,'\0',283,2250.00,2250.00,1),
(283,23,4.0000,'2024-01-30 23:20:48','2024-01-30 17:50:48',2,200.8000,'\0',336,803.20,722.88,1),
(284,23,1.0000,'2024-01-30 23:20:48','2024-01-30 17:50:48',3,1000.0000,'\0',337,1000.00,990.00,2),
(285,23,1.0000,'2024-01-30 23:20:48','2024-01-30 17:50:48',4,950.0000,'\0',338,950.00,950.00,2),
(286,23,1.0000,'2024-01-30 23:20:48','2024-01-30 17:50:48',14,2250.0000,'\0',339,2250.00,2250.00,1),
(287,24,4.0000,'2024-01-30 23:24:34','2024-01-30 17:54:34',2,200.8000,'\0',344,803.20,722.88,1),
(288,24,1.0000,'2024-01-30 23:24:34','2024-01-30 17:54:34',3,1000.0000,'\0',345,1000.00,990.00,2),
(289,24,1.0000,'2024-01-30 23:24:34','2024-01-30 17:54:34',4,950.0000,'\0',346,950.00,950.00,2),
(290,24,1.0000,'2024-01-30 23:24:34','2024-01-30 17:54:34',14,2250.0000,'\0',347,2250.00,2250.00,1),
(291,25,4.0000,'2024-01-30 23:25:34','2024-01-30 17:55:34',2,200.8000,'\0',348,803.20,722.88,1),
(292,25,1.0000,'2024-01-30 23:25:34','2024-01-30 17:55:34',3,1000.0000,'\0',349,1000.00,990.00,2),
(293,25,1.0000,'2024-01-30 23:25:34','2024-01-30 17:55:34',4,950.0000,'\0',350,950.00,950.00,2),
(294,25,1.0000,'2024-01-30 23:25:34','2024-01-30 17:55:34',14,2250.0000,'\0',351,2250.00,2250.00,1),
(295,26,4.0000,'2024-01-30 23:27:01','2024-01-30 17:57:01',2,200.8000,'\0',352,803.20,722.88,1),
(296,26,1.0000,'2024-01-30 23:27:01','2024-01-30 17:57:01',3,1000.0000,'\0',353,1000.00,990.00,2),
(297,26,1.0000,'2024-01-30 23:27:01','2024-01-30 17:57:01',4,950.0000,'\0',354,950.00,950.00,2),
(298,26,1.0000,'2024-01-30 23:27:01','2024-01-30 17:57:01',14,2250.0000,'\0',355,2250.00,2250.00,1),
(299,27,4.0000,'2024-01-30 23:27:21','2024-01-30 17:57:21',2,200.8000,'\0',356,803.20,722.88,1),
(300,27,1.0000,'2024-01-30 23:27:21','2024-01-30 17:57:21',3,1000.0000,'\0',357,1000.00,990.00,2),
(301,27,1.0000,'2024-01-30 23:27:21','2024-01-30 17:57:21',4,950.0000,'\0',358,950.00,950.00,2),
(302,27,1.0000,'2024-01-30 23:27:21','2024-01-30 17:57:21',14,2250.0000,'\0',359,2250.00,2250.00,1),
(303,28,4.0000,'2024-01-30 23:27:44','2024-01-30 17:57:44',2,200.8000,'\0',364,803.20,722.88,1),
(304,28,1.0000,'2024-01-30 23:27:44','2024-01-30 17:57:44',3,1000.0000,'\0',365,1000.00,990.00,2),
(305,28,1.0000,'2024-01-30 23:27:44','2024-01-30 17:57:44',4,950.0000,'\0',366,950.00,950.00,2),
(306,28,1.0000,'2024-01-30 23:27:44','2024-01-30 17:57:44',14,2250.0000,'\0',367,2250.00,2250.00,1),
(307,29,4.0000,'2024-01-30 23:27:58','2024-01-30 17:57:58',2,200.8000,'\0',368,803.20,722.88,1),
(308,29,1.0000,'2024-01-30 23:27:58','2024-01-30 17:57:58',3,1000.0000,'\0',369,1000.00,990.00,2),
(309,29,1.0000,'2024-01-30 23:27:58','2024-01-30 17:57:58',4,950.0000,'\0',370,950.00,950.00,2),
(310,29,1.0000,'2024-01-30 23:27:58','2024-01-30 17:57:58',14,2250.0000,'\0',371,2250.00,2250.00,1),
(311,30,2.0000,'2024-01-30 23:40:48','2024-01-30 18:10:48',6,1.2000,'\0',372,2.40,2.40,3),
(312,30,1.0000,'2024-01-30 23:40:48','2024-01-30 18:10:48',12,1.5000,'\0',373,1.50,1.50,1),
(313,31,2.0000,'2024-01-30 23:44:28','2024-01-30 18:14:28',6,1.2000,'\0',374,2.40,2.40,3),
(314,31,1.0000,'2024-01-30 23:44:28','2024-01-30 18:14:28',12,1.5000,'\0',375,1.50,1.50,1),
(315,32,2.0000,'2024-01-30 23:46:04','2024-01-30 18:16:04',6,1.2000,'\0',380,2.40,2.40,3),
(316,32,1.0000,'2024-01-30 23:46:04','2024-01-30 18:16:04',12,1.5000,'\0',381,1.50,1.50,1),
(317,33,2.0000,'2024-01-30 23:46:08','2024-01-30 18:16:08',6,1.2000,'\0',382,2.40,2.40,3),
(318,33,1.0000,'2024-01-30 23:46:08','2024-01-30 18:16:08',12,1.5000,'\0',383,1.50,1.50,1),
(319,34,2.0000,'2024-01-30 23:46:09','2024-01-30 18:16:09',6,1.2000,'\0',384,2.40,2.40,3),
(320,34,1.0000,'2024-01-30 23:46:09','2024-01-30 18:16:09',12,1.5000,'\0',385,1.50,1.50,1),
(321,35,4.0000,'2024-01-30 23:52:30','2024-01-30 18:22:30',2,200.8000,'\0',406,803.20,722.88,1),
(322,35,1.0000,'2024-01-30 23:52:30','2024-01-30 18:22:30',3,1000.0000,'\0',407,1000.00,990.00,2),
(323,35,1.0000,'2024-01-30 23:52:30','2024-01-30 18:22:30',4,950.0000,'\0',408,950.00,950.00,2),
(324,35,1.0000,'2024-01-30 23:52:30','2024-01-30 18:22:30',14,2250.0000,'\0',409,2250.00,2250.00,1),
(325,36,2.0000,'2024-01-30 23:55:39','2024-01-30 18:25:39',6,1.2000,'\0',430,2.40,2.40,3),
(326,36,1.0000,'2024-01-30 23:55:39','2024-01-30 18:25:39',12,1.5000,'\0',431,1.50,1.50,1),
(327,37,2.0000,'2024-01-30 23:56:27','2024-01-30 18:26:27',6,1.2000,'\0',436,2.40,2.40,3),
(328,37,1.0000,'2024-01-30 23:56:27','2024-01-30 18:26:27',12,1.5000,'\0',437,1.50,1.50,1),
(329,38,2.0000,'2024-01-30 23:56:28','2024-01-30 18:26:28',6,1.2000,'\0',438,2.40,2.40,3),
(330,38,1.0000,'2024-01-30 23:56:28','2024-01-30 18:26:28',12,1.5000,'\0',439,1.50,1.50,1),
(331,39,2.0000,'2024-01-30 23:56:34','2024-01-30 18:26:34',6,1.2000,'\0',440,2.40,2.40,3),
(332,39,1.0000,'2024-01-30 23:56:34','2024-01-30 18:26:34',12,1.5000,'\0',441,1.50,1.50,1),
(333,40,2.0000,'2024-01-30 23:56:35','2024-01-30 18:26:35',6,1.2000,'\0',442,2.40,2.40,3),
(334,40,1.0000,'2024-01-30 23:56:35','2024-01-30 18:26:35',12,1.5000,'\0',443,1.50,1.50,1),
(335,41,2.0000,'2024-01-30 23:56:35','2024-01-30 18:26:35',6,1.2000,'\0',444,2.40,2.40,3),
(336,41,1.0000,'2024-01-30 23:56:35','2024-01-30 18:26:35',12,1.5000,'\0',445,1.50,1.50,1),
(337,42,2.0000,'2024-01-30 23:56:36','2024-01-30 18:26:36',6,1.2000,'\0',446,2.40,2.40,3),
(338,42,1.0000,'2024-01-30 23:56:36','2024-01-30 18:26:36',12,1.5000,'\0',447,1.50,1.50,1),
(339,43,4.0000,'2024-01-30 23:57:53','2024-01-30 18:27:53',2,200.8000,'\0',452,803.20,722.88,1),
(340,43,1.0000,'2024-01-30 23:57:53','2024-01-30 18:27:53',3,1000.0000,'\0',453,1000.00,990.00,2),
(341,43,1.0000,'2024-01-30 23:57:53','2024-01-30 18:27:53',4,950.0000,'\0',454,950.00,950.00,2),
(342,43,1.0000,'2024-01-30 23:57:53','2024-01-30 18:27:53',14,2250.0000,'\0',455,2250.00,2250.00,1),
(343,44,2.0000,'2024-01-30 23:58:17','2024-01-30 18:28:17',6,1.2000,'\0',456,2.40,2.40,3),
(344,44,1.0000,'2024-01-30 23:58:17','2024-01-30 18:28:17',12,1.5000,'\0',457,1.50,1.50,1),
(345,45,2.0000,'2024-01-30 23:59:37','2024-01-30 18:29:37',6,1.2000,'\0',458,2.40,2.40,3),
(346,45,1.0000,'2024-01-30 23:59:37','2024-01-30 18:29:37',12,1.5000,'\0',459,1.50,1.50,1),
(347,46,1.0000,'2024-01-31 23:59:59','2024-01-31 18:29:59',28,1.2000,'\0',462,1.20,1.20,3),
(348,46,1.0000,'2024-01-31 23:59:59','2024-01-31 18:29:59',8,2.0000,'\0',463,2.00,2.00,2),
(349,47,1.0000,'2024-02-01 00:37:07','2024-01-31 19:07:07',28,1.2000,'\0',468,1.20,1.20,3),
(350,47,1.0000,'2024-02-01 00:37:07','2024-01-31 19:07:07',8,2.0000,'\0',469,2.00,2.00,2),
(351,47,2.0000,'2024-02-01 00:37:07','2024-01-31 19:07:07',6,1.2000,'\0',470,2.40,2.40,3),
(352,48,1.0000,'2024-02-01 00:37:18','2024-01-31 19:07:18',28,1.2000,'\0',471,1.20,1.20,3),
(353,48,1.0000,'2024-02-01 00:37:18','2024-01-31 19:07:18',8,2.0000,'\0',472,2.00,2.00,2),
(354,48,2.0000,'2024-02-01 00:37:18','2024-01-31 19:07:18',6,1.2000,'\0',473,2.40,2.40,3),
(355,49,2.0000,'2024-02-01 21:08:29','2024-02-01 15:38:29',8,2.0000,'\0',477,4.00,4.00,2),
(356,49,1.0000,'2024-02-01 21:08:29','2024-02-01 15:38:29',6,1.2000,'\0',478,1.20,1.20,3),
(357,50,2.0000,'2024-02-01 21:08:52','2024-02-01 15:38:52',8,2.0000,'\0',481,4.00,4.00,2),
(358,50,1.0000,'2024-02-01 21:08:52','2024-02-01 15:38:52',6,1.2000,'\0',482,1.20,1.20,3),
(359,51,2.0000,'2024-02-01 21:09:06','2024-02-01 15:39:06',8,2.0000,'\0',483,4.00,4.00,2),
(360,51,1.0000,'2024-02-01 21:09:06','2024-02-01 15:39:06',6,1.2000,'\0',484,1.20,1.20,3),
(361,52,1.0000,'2024-02-01 21:18:58','2024-02-01 15:48:58',8,2.0000,'\0',485,2.00,2.00,2),
(362,52,1.0000,'2024-02-01 21:18:58','2024-02-01 15:48:58',6,1.2000,'\0',486,1.20,1.20,3),
(363,52,1.0000,'2024-02-01 21:18:58','2024-02-01 15:48:58',28,1.2000,'\0',487,1.20,1.20,3),
(364,53,1.0000,'2024-02-01 21:19:09','2024-02-01 15:49:09',8,2.0000,'\0',488,2.00,2.00,2),
(365,53,1.0000,'2024-02-01 21:19:09','2024-02-01 15:49:09',6,1.2000,'\0',489,1.20,1.20,3),
(366,53,1.0000,'2024-02-01 21:19:09','2024-02-01 15:49:09',28,1.2000,'\0',490,1.20,1.20,3),
(367,54,1.0000,'2024-02-01 21:19:27','2024-02-01 15:49:27',8,2.0000,'\0',491,2.00,2.00,2),
(368,54,1.0000,'2024-02-01 21:19:27','2024-02-01 15:49:27',6,1.2000,'\0',492,1.20,1.20,3),
(369,54,1.0000,'2024-02-01 21:19:27','2024-02-01 15:49:27',28,1.2000,'\0',493,1.20,1.20,3),
(370,55,1.0000,'2024-02-01 21:23:43','2024-02-01 15:53:43',8,2.0000,'\0',497,2.00,2.00,2),
(371,55,1.0000,'2024-02-01 21:23:43','2024-02-01 15:53:43',6,1.2000,'\0',498,1.20,1.20,3),
(372,55,1.0000,'2024-02-01 21:23:43','2024-02-01 15:53:43',28,1.2000,'\0',499,1.20,1.20,3),
(373,56,2.0000,'2024-02-01 21:41:32','2024-02-01 16:11:32',28,1.2000,'\0',500,2.40,2.40,3),
(374,56,1.0000,'2024-02-01 21:41:32','2024-02-01 16:11:32',8,2.0000,'\0',501,2.00,2.00,2),
(375,57,2.0000,'2024-02-01 22:14:45','2024-02-01 16:44:45',28,1.2000,'\0',502,2.40,2.40,3),
(376,57,2.0000,'2024-02-01 22:14:45','2024-02-01 16:44:45',8,2.0000,'\0',503,4.00,4.00,2),
(377,58,4.0000,'2024-02-01 23:05:40','2024-02-01 17:35:40',2,200.8000,'\0',510,803.20,722.88,1),
(378,58,1.0000,'2024-02-01 23:05:40','2024-02-01 17:35:40',3,1000.0000,'\0',511,1000.00,990.00,2),
(379,58,1.0000,'2024-02-01 23:05:40','2024-02-01 17:35:40',4,950.0000,'\0',512,950.00,950.00,2),
(380,58,1.0000,'2024-02-01 23:05:40','2024-02-01 17:35:40',14,2250.0000,'\0',513,2250.00,2250.00,1),
(381,59,3.0000,'2024-02-01 23:17:41','2024-02-01 17:47:41',8,2.0000,'\0',514,6.00,6.00,2),
(382,60,1.0000,'2024-02-01 23:28:57','2024-02-01 17:58:57',28,1.2000,'\0',515,1.20,1.20,3),
(383,60,1.0000,'2024-02-01 23:28:57','2024-02-01 17:58:57',6,1.2000,'\0',516,1.20,1.20,3),
(384,60,1.0000,'2024-02-01 23:28:57','2024-02-01 17:58:57',8,2.0000,'\0',517,2.00,2.00,2),
(385,61,2.0000,'2024-02-02 00:12:38','2024-02-01 18:42:38',8,2.0000,'\0',518,4.00,4.00,2),
(386,61,2.0000,'2024-02-02 00:12:38','2024-02-01 18:42:38',28,1.2000,'\0',519,2.40,2.40,3),
(387,61,1.0000,'2024-02-02 00:12:38','2024-02-01 18:42:38',6,1.2000,'\0',520,1.20,1.20,3),
(388,61,1.0000,'2024-02-02 00:12:38','2024-02-01 18:42:38',12,1.5000,'\0',521,1.50,1.50,1),
(389,62,1.0000,'2024-02-02 00:19:43','2024-02-01 18:49:43',28,1.2000,'\0',522,1.20,1.20,3),
(390,62,1.0000,'2024-02-02 00:19:43','2024-02-01 18:49:43',8,2.0000,'\0',523,2.00,2.00,2),
(391,63,1.0000,'2024-02-02 00:20:15','2024-02-01 18:50:15',7,2.5000,'\0',524,2.50,2.50,2),
(392,63,1.0000,'2024-02-02 00:20:15','2024-02-01 18:50:15',9,5.0000,'\0',525,5.00,5.00,3),
(393,63,2.0000,'2024-02-02 00:20:15','2024-02-01 18:50:15',13,1.1000,'\0',526,2.20,2.09,1),
(394,63,1.0000,'2024-02-02 00:20:15','2024-02-01 18:50:15',10,3.0000,'\0',527,3.00,3.00,3),
(395,63,1.0000,'2024-02-02 00:20:15','2024-02-01 18:50:15',15,8.0000,'\0',528,8.00,8.00,1),
(396,64,1.0000,'2024-02-02 00:28:31','2024-02-01 18:58:31',6,1.2000,'\0',529,1.20,1.20,3),
(397,65,1.0000,'2024-02-02 00:35:05','2024-02-01 19:05:05',17,2.5000,'\0',530,2.50,2.50,4),
(398,65,1.0000,'2024-02-02 00:35:05','2024-02-01 19:05:05',32,2.5000,'\0',531,2.50,2.50,2),
(399,66,1.0000,'2024-02-02 00:56:24','2024-02-01 19:26:24',8,2.0000,'\0',532,2.00,2.00,2),
(400,66,2.0000,'2024-02-02 00:56:24','2024-02-01 19:26:24',3,1.5000,'\0',533,3.00,3.00,2),
(401,67,1.0000,'2024-02-11 15:59:44','2024-02-11 10:29:44',3,1.5000,'\0',541,1.50,1.50,2),
(402,67,1.0000,'2024-02-11 15:59:44','2024-02-11 10:29:44',28,1.2000,'\0',542,1.20,1.20,3),
(403,67,1.0000,'2024-02-11 15:59:44','2024-02-11 10:29:44',6,1.2000,'\0',543,1.20,1.20,3),
(404,68,1.0000,'2024-02-11 21:28:37','2024-02-11 15:58:37',15,8.0000,'\0',544,8.00,8.00,1),
(405,68,2.0000,'2024-02-11 21:28:37','2024-02-11 15:58:37',3,1.5000,'\0',545,3.00,3.00,2),
(406,68,1.0000,'2024-02-11 21:28:37','2024-02-11 15:58:37',28,1.2000,'\0',546,1.20,1.20,3),
(407,68,1.0000,'2024-02-11 21:28:37','2024-02-11 15:58:37',9,5.0000,'\0',547,5.00,5.00,3),
(408,69,1.0000,'2024-02-12 23:25:02','2024-02-12 17:55:02',28,1.2000,'\0',548,1.20,1.20,3),
(409,69,1.0000,'2024-02-12 23:25:02','2024-02-12 17:55:02',3,1.5000,'\0',549,1.50,1.50,2),
(410,69,1.0000,'2024-02-12 23:25:02','2024-02-12 17:55:02',4,0.8000,'\0',550,0.80,0.80,2),
(411,69,1.0000,'2024-02-12 23:25:02','2024-02-12 17:55:02',8,2.0000,'\0',551,2.00,2.00,2),
(412,69,1.0000,'2024-02-12 23:25:02','2024-02-12 17:55:02',1,205.5000,'\0',552,205.50,205.50,1),
(413,70,1.0000,'2024-02-12 23:25:19','2024-02-12 17:55:19',8,2.0000,'\0',553,2.00,2.00,2),
(414,70,1.0000,'2024-02-12 23:25:19','2024-02-12 17:55:19',3,1.5000,'\0',554,1.50,1.50,2),
(415,70,1.0000,'2024-02-12 23:25:19','2024-02-12 17:55:19',7,2.5000,'\0',555,2.50,2.50,2),
(416,70,1.0000,'2024-02-12 23:25:19','2024-02-12 17:55:19',26,1.8000,'\0',556,1.80,1.80,1),
(417,71,2.0000,'2024-02-14 17:49:22','2024-02-14 12:19:22',26,1.8000,'\0',557,3.60,3.60,1),
(418,71,1.0000,'2024-02-14 17:49:22','2024-02-14 12:19:22',27,3.0000,'\0',558,3.00,3.00,1),
(419,71,1.0000,'2024-02-14 17:49:22','2024-02-14 12:19:22',4,0.8000,'\0',559,0.80,0.80,2),
(420,71,1.0000,'2024-02-14 17:49:22','2024-02-14 12:19:22',3,1.5000,'\0',560,1.50,1.50,2),
(421,71,1.0000,'2024-02-14 17:49:22','2024-02-14 12:19:22',25,2.5000,'\0',561,2.50,2.50,1),
(422,72,1.0000,'2024-02-14 17:49:41','2024-02-14 12:19:41',4,0.8000,'\0',562,0.80,0.80,2),
(423,72,1.0000,'2024-02-14 17:49:41','2024-02-14 12:19:41',10,3.0000,'\0',563,3.00,3.00,3),
(424,72,1.0000,'2024-02-14 17:49:41','2024-02-14 12:19:41',6,1.2000,'\0',564,1.20,1.20,3),
(425,73,1.0000,'2024-02-14 17:50:58','2024-02-14 12:20:58',3,1.5000,'\0',565,1.50,1.50,2),
(426,73,1.0000,'2024-02-14 17:50:58','2024-02-14 12:20:58',6,1.2000,'\0',566,1.20,1.20,3),
(427,73,1.0000,'2024-02-14 17:50:58','2024-02-14 12:20:58',15,8.0000,'\0',567,8.00,8.00,1),
(428,74,1.0000,'2024-02-15 00:48:45','2024-02-14 19:18:45',57,10.0000,'\0',568,10.00,10.00,2),
(429,75,1.0000,'2024-02-16 15:45:58','2024-02-16 10:15:58',9,5.0000,'\0',569,5.00,5.00,3),
(430,75,1.0000,'2024-02-16 15:45:58','2024-02-16 10:15:58',10,3.0000,'\0',570,3.00,3.00,3),
(431,75,1.0000,'2024-02-16 15:45:58','2024-02-16 10:15:58',66,667.0000,'\0',571,667.00,667.00,3),
(432,76,1.0000,'2024-02-17 21:46:47','2024-02-17 16:16:47',14,205.5000,'\0',572,205.50,205.50,1),
(433,77,1.0000,'2024-02-17 21:48:44','2024-02-17 16:18:44',13,1.1000,'\0',573,1.10,1.10,1),
(434,77,1.0000,'2024-02-17 21:48:44','2024-02-17 16:18:44',55,150.5000,'\0',574,150.50,150.50,1),
(435,78,1.0000,'2024-02-18 11:40:23','2024-02-18 06:10:23',14,205.5000,'\0',575,205.50,205.50,1),
(436,78,1.0000,'2024-02-18 11:40:23','2024-02-18 06:10:23',18,5.0000,'\0',576,5.00,5.00,3),
(437,78,1.0000,'2024-02-18 11:40:23','2024-02-18 06:10:23',22,6.5000,'\0',577,6.50,6.50,1),
(438,78,1.0000,'2024-02-18 11:40:23','2024-02-18 06:10:23',17,2.5000,'\0',578,2.50,2.50,4),
(439,78,1.0000,'2024-02-18 11:40:23','2024-02-18 06:10:23',68,2.5000,'\0',579,2.50,2.50,2),
(440,79,1.0000,'2024-02-18 11:42:26','2024-02-18 06:12:26',13,1.1000,'\0',580,1.10,1.10,1),
(441,79,1.0000,'2024-02-18 11:42:26','2024-02-18 06:12:26',17,2.5000,'\0',581,2.50,2.50,4),
(442,79,1.0000,'2024-02-18 11:42:26','2024-02-18 06:12:26',14,205.5000,'\0',582,205.50,205.50,1),
(443,79,1.0000,'2024-02-18 11:42:26','2024-02-18 06:12:26',6,1.2000,'\0',583,1.20,1.20,3),
(444,80,1.0000,'2024-02-18 11:58:27','2024-02-18 06:28:27',31,2.8000,'\0',584,2.80,2.80,2),
(445,80,6.0000,'2024-02-18 11:58:27','2024-02-18 06:28:27',25,2.5000,'\0',585,15.00,15.00,1),
(446,80,1.0000,'2024-02-18 11:58:27','2024-02-18 06:28:27',57,10.0000,'\0',568,10.00,10.00,2),
(447,80,1.0000,'2024-02-18 11:58:27','2024-02-18 06:28:27',55,150.5000,'\0',574,150.50,150.50,1),
(448,81,1.0000,'2024-02-18 12:23:59','2024-02-18 06:53:59',9,5.0000,'\0',586,5.00,5.00,3),
(449,81,1.0000,'2024-02-18 12:23:59','2024-02-18 06:53:59',10,3.0000,'\0',587,3.00,3.00,3),
(450,81,1.0000,'2024-02-18 12:23:59','2024-02-18 06:53:59',3,1.5000,'\0',588,1.50,1.50,2),
(451,81,1.0000,'2024-02-18 12:23:59','2024-02-18 06:53:59',7,2.5000,'\0',589,2.50,2.50,2),
(452,81,1.0000,'2024-02-18 12:23:59','2024-02-18 06:53:59',22,6.5000,'\0',590,6.50,6.50,1),
(453,81,1.0000,'2024-02-18 12:23:59','2024-02-18 06:53:59',26,1.8000,'\0',591,1.80,1.80,1),
(454,81,1.0000,'2024-02-18 12:23:59','2024-02-18 06:53:59',23,7.0000,'\0',592,7.00,7.00,1),
(455,82,1.0000,'2024-02-21 22:03:23','2024-02-21 16:33:23',15,8.0000,'\0',593,8.00,8.00,1),
(456,82,1.0000,'2024-02-21 22:03:23','2024-02-21 16:33:23',14,205.5000,'\0',594,205.50,205.50,1),
(457,82,1.0000,'2024-02-21 22:03:23','2024-02-21 16:33:23',9,5.0000,'\0',595,5.00,5.00,3),
(458,82,1.0000,'2024-02-21 22:03:23','2024-02-21 16:33:23',17,2.5000,'\0',596,2.50,2.50,4),
(459,82,1.0000,'2024-02-21 22:03:23','2024-02-21 16:33:23',18,5.0000,'\0',597,5.00,5.00,3),
(460,82,1.0000,'2024-02-21 22:03:23','2024-02-21 16:33:23',10,3.0000,'\0',598,3.00,3.00,3),
(461,83,2.0000,'2024-02-23 19:11:25','2024-02-23 13:41:25',10,3.0000,'\0',599,6.00,6.00,3),
(462,83,1.0000,'2024-02-23 19:11:25','2024-02-23 13:41:25',13,1.1000,'\0',600,1.10,1.10,1),
(463,83,1.0000,'2024-02-23 19:11:25','2024-02-23 13:41:25',5,2.0000,'\0',601,2.00,2.00,3),
(464,83,2.0000,'2024-02-23 19:11:25','2024-02-23 13:41:25',9,5.0000,'\0',602,10.00,10.00,3),
(465,84,1.0000,'2024-02-23 19:39:21','2024-02-23 14:09:21',17,2.5000,'\0',603,2.50,2.50,4),
(466,84,1.0000,'2024-02-23 19:39:21','2024-02-23 14:09:21',22,6.5000,'\0',604,6.50,6.50,1),
(467,85,1.0000,'2024-02-23 19:39:41','2024-02-23 14:09:41',14,205.5000,'\0',605,205.50,205.50,1),
(468,85,1.0000,'2024-02-23 19:39:41','2024-02-23 14:09:41',18,5.0000,'\0',606,5.00,5.00,3),
(469,86,1.0000,'2024-02-23 19:40:03','2024-02-23 14:10:03',5,2.0000,'\0',607,2.00,2.00,3),
(470,86,1.0000,'2024-02-23 19:40:03','2024-02-23 14:10:03',13,1.1000,'\0',608,1.10,1.10,1),
(471,86,4.0000,'2024-02-23 19:40:03','2024-02-23 14:10:03',26,1.8000,'\0',609,7.20,7.20,1),
(472,87,1.0000,'2024-02-23 20:02:11','2024-02-23 14:32:11',14,205.5000,'\0',610,205.50,205.50,1),
(473,87,3.0000,'2024-02-23 20:02:11','2024-02-23 14:32:11',13,1.1000,'\0',611,3.30,3.30,1),
(474,88,1.0000,'2024-02-23 20:34:57','2024-02-23 15:04:57',17,2.5000,'\0',612,2.50,2.50,4),
(475,88,1.0000,'2024-02-23 20:34:57','2024-02-23 15:04:57',24,9.0000,'\0',613,9.00,9.00,1),
(476,89,1.0000,'2024-02-23 20:42:41','2024-02-23 15:12:41',7,2.5000,'\0',614,2.50,2.50,2),
(477,90,1.0000,'2024-02-23 20:42:57','2024-02-23 15:12:57',13,1.1000,'\0',615,1.10,1.10,1),
(478,90,1.0000,'2024-02-23 20:42:57','2024-02-23 15:12:57',23,7.0000,'\0',616,7.00,7.00,1),
(479,90,1.0000,'2024-02-23 20:42:57','2024-02-23 15:12:57',16,3.5000,'\0',617,3.50,3.50,2),
(480,91,1.0000,'2024-02-25 22:00:01','2024-02-25 16:30:01',9,5.0000,'\0',618,5.00,5.00,3),
(481,91,1.0000,'2024-02-25 22:00:01','2024-02-25 16:30:01',17,2.5000,'\0',619,2.50,2.50,4),
(482,91,3.0000,'2024-02-25 22:00:01','2024-02-25 16:30:01',12,1.5000,'\0',620,4.50,4.50,1),
(483,92,1.0000,'2024-02-25 22:49:02','2024-02-25 17:19:02',13,1.1000,'\0',621,1.10,1.10,1),
(484,92,1.0000,'2024-02-25 22:49:02','2024-02-25 17:19:02',9,5.0000,'\0',622,5.00,5.00,3),
(485,92,1.0000,'2024-02-25 22:49:02','2024-02-25 17:19:02',14,205.5000,'\0',623,205.50,205.50,1),
(486,93,2.0000,'2024-02-25 22:51:51','2024-02-25 17:21:51',5,2.0000,'\0',624,4.00,4.00,3),
(487,93,3.0000,'2024-02-25 22:51:51','2024-02-25 17:21:51',10,3.0000,'\0',625,9.00,9.00,3),
(488,93,4.0000,'2024-02-25 22:51:51','2024-02-25 17:21:51',6,1.2000,'\0',626,4.80,4.80,3),
(489,93,2.0000,'2024-02-25 22:51:51','2024-02-25 17:21:51',7,2.5000,'\0',627,5.00,5.00,2),
(490,93,1.0000,'2024-02-25 22:51:51','2024-02-25 17:21:51',25,2.5000,'\0',628,2.50,2.50,1),
(491,93,1.0000,'2024-02-25 22:51:51','2024-02-25 17:21:51',57,10.0000,'\0',568,10.00,10.00,2),
(492,93,2.0000,'2024-02-25 22:51:51','2024-02-25 17:21:51',3,1.5000,'\0',629,3.00,3.00,2),
(493,93,1.0000,'2024-02-25 22:51:51','2024-02-25 17:21:51',56,222.0000,'\0',630,222.00,222.00,2),
(494,93,1.0000,'2024-02-25 22:51:51','2024-02-25 17:21:51',58,200.0000,'\0',631,200.00,200.00,2),
(495,93,2.0000,'2024-02-25 22:51:51','2024-02-25 17:21:51',68,2.5000,'\0',579,5.00,5.00,2),
(496,93,1.0000,'2024-02-25 22:51:51','2024-02-25 17:21:51',69,11.0000,'\0',632,11.00,11.00,2),
(497,94,2.0000,'2024-02-25 23:08:51','2024-02-25 17:38:51',14,205.5000,'\0',633,411.00,411.00,1),
(498,94,1.0000,'2024-02-25 23:08:51','2024-02-25 17:38:51',10,3.0000,'\0',634,3.00,3.00,3),
(499,94,1.0000,'2024-02-25 23:08:51','2024-02-25 17:38:51',11,1.7500,'\0',635,1.75,1.75,1),
(500,94,1.0000,'2024-02-25 23:08:51','2024-02-25 17:38:51',20,4.0000,'\0',636,4.00,4.00,1),
(501,94,1.0000,'2024-02-25 23:08:51','2024-02-25 17:38:51',18,5.0000,'\0',637,5.00,5.00,3),
(502,94,2.0000,'2024-02-25 23:08:51','2024-02-25 17:38:51',22,6.5000,'\0',638,13.00,13.00,1),
(503,94,1.0000,'2024-02-25 23:08:51','2024-02-25 17:38:51',17,2.5000,'\0',639,2.50,2.50,4),
(504,95,2.0000,'2024-03-01 20:54:53','2024-03-01 15:24:53',13,1.1000,'\0',640,2.20,2.20,1),
(505,95,1.0000,'2024-03-01 20:54:53','2024-03-01 15:24:53',17,2.5000,'\0',641,2.50,2.50,4),
(506,95,1.0000,'2024-03-01 20:54:53','2024-03-01 15:24:53',14,205.5000,'\0',642,205.50,205.50,1),
(507,95,1.0000,'2024-03-01 20:54:53','2024-03-01 15:24:53',56,222.0000,'\0',630,222.00,222.00,2),
(508,95,1.0000,'2024-03-01 20:54:53','2024-03-01 15:24:53',69,11.0000,'\0',632,11.00,11.00,2),
(509,96,1.0000,'2024-03-02 22:35:28','2024-03-02 17:05:28',26,1.8000,'\0',643,1.80,1.80,1),
(510,96,1.0000,'2024-03-02 22:35:28','2024-03-02 17:05:28',17,2.5000,'\0',644,2.50,2.50,4),
(511,96,1.0000,'2024-03-02 22:35:28','2024-03-02 17:05:28',18,5.0000,'\0',645,5.00,5.00,3),
(512,97,1.0000,'2024-03-03 12:22:28','2024-03-03 06:52:28',13,1.1000,'\0',646,1.10,1.10,1),
(513,97,1.0000,'2024-03-03 12:22:28','2024-03-03 06:52:28',17,2.5000,'\0',647,2.50,2.50,4),
(514,97,1.0000,'2024-03-03 12:22:28','2024-03-03 06:52:28',22,6.5000,'\0',648,6.50,6.50,1),
(515,97,2.0000,'2024-03-03 12:22:28','2024-03-03 06:52:28',23,7.0000,'\0',649,14.00,14.00,1),
(516,97,1.0000,'2024-03-03 12:22:28','2024-03-03 06:52:28',26,1.8000,'\0',650,1.80,1.80,1),
(517,97,1.0000,'2024-03-03 12:22:28','2024-03-03 06:52:28',27,3.0000,'\0',651,3.00,3.00,1),
(518,98,1.0000,'2024-03-22 21:56:22','2024-03-22 16:26:22',22,6.5000,'\0',652,6.50,6.50,1),
(519,98,1.0000,'2024-03-22 21:56:22','2024-03-22 16:26:22',9,5.0000,'\0',653,5.00,5.00,3),
(520,98,1.0000,'2024-03-22 21:56:22','2024-03-22 16:26:22',13,1.1000,'\0',654,1.10,1.10,1),
(521,99,1.0000,'2024-03-22 22:01:13','2024-03-22 16:31:13',14,205.5000,'\0',655,205.50,205.50,1),
(522,99,1.0000,'2024-03-22 22:01:13','2024-03-22 16:31:13',20,4.0000,'\0',656,4.00,4.00,1),
(523,99,1.0000,'2024-03-22 22:01:13','2024-03-22 16:31:13',69,11.0000,'\0',632,11.00,11.00,2),
(524,100,2.0000,'2024-03-22 22:16:55','2024-03-22 16:46:55',17,2.5000,'\0',657,5.00,5.00,4),
(525,100,1.0000,'2024-03-22 22:16:55','2024-03-22 16:46:55',13,1.1000,'\0',658,1.10,1.10,1),
(526,100,1.0000,'2024-03-22 22:16:55','2024-03-22 16:46:55',26,1.8000,'\0',659,1.80,1.80,1),
(527,100,1.0000,'2024-03-22 22:16:55','2024-03-22 16:46:55',27,3.0000,'\0',660,3.00,3.00,1),
(528,100,1.0000,'2024-03-22 22:16:55','2024-03-22 16:46:55',23,7.0000,'\0',661,7.00,7.00,1),
(529,100,1.0000,'2024-03-22 22:16:55','2024-03-22 16:46:55',12,1.5000,'\0',662,1.50,1.50,1),
(530,101,1.0000,'2024-03-24 11:49:11','2024-03-24 06:19:11',5,2.0000,'\0',675,2.00,2.00,3),
(531,101,1.0000,'2024-03-24 11:49:11','2024-03-24 06:19:11',13,1.1000,'\0',676,1.10,1.10,1),
(532,101,1.0000,'2024-03-24 11:49:11','2024-03-24 06:19:11',10,3.0000,'\0',677,3.00,3.00,3),
(533,101,5.0000,'2024-03-24 11:49:11','2024-03-24 06:19:11',14,205.5000,'\0',678,1027.50,1027.50,1),
(534,101,1.0000,'2024-03-24 11:49:11','2024-03-24 06:19:11',15,8.0000,'\0',679,8.00,8.00,1),
(535,101,1.0000,'2024-03-24 11:49:11','2024-03-24 06:19:11',6,1.2000,'\0',680,1.20,1.20,3),
(536,102,1.0000,'2024-03-24 11:50:49','2024-03-24 06:20:49',7,2.5000,'\0',681,2.50,2.10,2),
(537,103,1.0000,'2024-03-25 23:23:35','2024-03-25 17:53:35',2,100.0000,'\0',682,100.00,82.00,1),
(538,103,1.0000,'2024-03-25 23:23:35','2024-03-25 17:53:35',7,2.5000,'\0',683,2.50,2.50,2),
(539,103,1.0000,'2024-03-25 23:23:35','2024-03-25 17:53:35',11,1.7500,'\0',684,1.75,1.75,1),
(540,104,1.0000,'2024-03-25 23:23:42','2024-03-25 17:53:42',9,5.0000,'\0',685,5.00,5.00,3),
(541,105,4.0000,'2024-04-12 13:34:28','2024-04-12 08:04:28',5,2.0000,'\0',686,8.00,8.00,3),
(542,105,1.0000,'2024-04-12 13:34:28','2024-04-12 08:04:28',2,100.0000,'\0',687,100.00,100.00,1),
(543,106,2.0000,'2024-04-12 13:35:19','2024-04-12 08:05:19',7,2.5000,'\0',688,5.00,5.00,2),
(544,106,1.0000,'2024-04-12 13:35:19','2024-04-12 08:05:19',10,3.0000,'\0',689,3.00,3.00,3),
(545,106,3.0000,'2024-04-12 13:35:19','2024-04-12 08:05:19',9,5.0000,'\0',690,15.00,15.00,3),
(546,107,1.0000,'2024-04-12 14:19:49','2024-04-12 08:49:49',4,950.0000,'\0',697,950.00,950.00,2),
(547,107,-1.0000,'2024-04-12 14:19:49','2024-04-12 08:49:49',5,2.0000,'',686,-2.00,-2.00,3),
(548,107,-1.0000,'2024-04-12 14:19:49','2024-04-12 08:49:49',9,5.0000,'',690,-5.00,-5.00,3),
(549,108,1.0000,'2024-04-12 14:19:52','2024-04-12 08:49:52',4,950.0000,'\0',698,950.00,950.00,2),
(550,108,-1.0000,'2024-04-12 14:19:52','2024-04-12 08:49:52',5,2.0000,'',686,-2.00,-2.00,3),
(551,108,-1.0000,'2024-04-12 14:19:52','2024-04-12 08:49:52',9,5.0000,'',690,-5.00,-5.00,3),
(552,109,1.0000,'2024-04-12 14:25:29','2024-04-12 08:55:29',4,950.0000,'\0',699,950.00,950.00,2),
(553,109,-1.0000,'2024-04-12 14:25:29','2024-04-12 08:55:29',5,2.0000,'',686,-2.00,-2.00,3),
(554,109,-1.0000,'2024-04-12 14:25:29','2024-04-12 08:55:29',9,5.0000,'',690,-5.00,-5.00,3),
(555,110,1.0000,'2024-04-12 14:27:19','2024-04-12 08:57:19',5,2.0000,'\0',701,2.00,2.00,3),
(556,110,3.0000,'2024-04-12 14:27:19','2024-04-12 08:57:19',9,5.0000,'\0',702,15.00,15.00,3),
(557,111,1.0000,'2024-04-12 14:27:20','2024-04-12 08:57:20',5,2.0000,'\0',703,2.00,2.00,3),
(558,111,3.0000,'2024-04-12 14:27:20','2024-04-12 08:57:20',9,5.0000,'\0',704,15.00,15.00,3),
(559,112,1.0000,'2024-04-12 14:27:40','2024-04-12 08:57:40',5,2.0000,'\0',705,2.00,2.00,3),
(560,112,2.0000,'2024-04-12 14:27:40','2024-04-12 08:57:40',6,1.2000,'\0',706,2.40,2.40,3),
(561,113,1.0000,'2024-04-13 19:55:18','2024-04-13 14:25:18',7,2.5000,'\0',716,2.50,2.50,2),
(562,113,4.0000,'2024-04-13 19:55:18','2024-04-13 14:25:18',11,1.7500,'\0',717,7.00,7.00,1),
(563,114,2.0000,'2024-05-08 20:14:10','2024-05-08 14:44:10',5,2.0000,'\0',718,4.00,4.00,3),
(564,114,1.0000,'2024-05-08 20:14:10','2024-05-08 14:44:10',1,75.0000,'\0',719,75.00,75.00,1),
(565,114,1.0000,'2024-05-08 20:14:10','2024-05-08 14:44:10',9,5.0000,'\0',720,5.00,4.80,3),
(566,114,1.0000,'2024-05-08 20:14:10','2024-05-08 14:44:10',7,2.5000,'\0',721,2.50,2.50,2),
(567,114,1.0000,'2024-05-08 20:14:10','2024-05-08 14:44:10',11,1.7500,'\0',722,1.75,1.75,1),
(568,115,1.0000,'2024-05-11 22:46:48','2024-05-11 17:16:48',10,3.0000,'\0',723,3.00,3.00,3),
(569,115,2.0000,'2024-05-11 22:46:48','2024-05-11 17:16:48',5,2.0000,'\0',724,4.00,4.00,3),
(570,115,1.0000,'2024-05-11 22:46:48','2024-05-11 17:16:48',9,5.0000,'\0',725,5.00,5.00,3),
(571,115,1.0000,'2024-05-11 22:46:48','2024-05-11 17:16:48',6,1.2000,'\0',726,1.20,1.20,3),
(572,116,4.0000,'2024-05-12 00:10:25','2024-05-11 18:40:25',10,3.0000,'\0',731,12.00,12.00,3),
(573,116,2.0000,'2024-05-12 00:10:25','2024-05-11 18:40:25',9,5.0000,'\0',732,10.00,10.00,3),
(574,116,3.0000,'2024-05-12 00:10:25','2024-05-11 18:40:25',14,205.5000,'\0',733,616.50,616.50,1),
(575,116,1.0000,'2024-05-12 00:10:25','2024-05-11 18:40:25',13,1.1000,'\0',734,1.10,1.10,1),
(576,116,1.0000,'2024-05-12 00:10:25','2024-05-11 18:40:25',12,1.5000,'\0',735,1.50,1.50,1),
(577,116,1.0000,'2024-05-12 00:10:25','2024-05-11 18:40:25',15,8.0000,'\0',736,8.00,8.00,1),
(578,117,1.0000,'2024-05-18 21:38:38','2024-05-18 16:08:38',4,950.0000,'\0',741,950.00,950.00,2),
(579,117,1.0000,'2024-05-18 21:38:38','2024-05-18 16:08:38',9,2.0000,'\0',742,2.00,2.00,3),
(580,118,1.0000,'2024-05-18 21:38:41','2024-05-18 16:08:41',4,950.0000,'\0',743,950.00,950.00,2),
(581,118,1.0000,'2024-05-18 21:38:41','2024-05-18 16:08:41',9,2.0000,'\0',744,2.00,2.00,3),
(582,119,1.0000,'2024-05-18 21:39:05','2024-05-18 16:09:05',5,2.0000,'\0',745,2.00,2.00,3),
(583,119,1.0000,'2024-05-18 21:39:05','2024-05-18 16:09:05',9,5.0000,'\0',746,5.00,5.00,3),
(584,120,1.0000,'2024-05-18 22:23:41','2024-05-18 16:53:41',4,950.0000,'\0',747,950.00,950.00,2),
(585,120,1.0000,'2024-05-18 22:23:41','2024-05-18 16:53:41',9,2.0000,'\0',748,2.00,2.00,3),
(586,121,1.0000,'2024-05-18 22:23:43','2024-05-18 16:53:43',4,950.0000,'\0',749,950.00,950.00,2),
(587,121,1.0000,'2024-05-18 22:23:43','2024-05-18 16:53:43',9,2.0000,'\0',750,2.00,2.00,3),
(588,122,1.0000,'2024-05-18 22:24:07','2024-05-18 16:54:07',4,950.0000,'\0',751,950.00,950.00,2),
(589,122,1.0000,'2024-05-18 22:24:07','2024-05-18 16:54:07',9,2.0000,'\0',752,2.00,2.00,3),
(590,123,1.0000,'2024-05-18 22:27:00','2024-05-18 16:57:00',4,950.0000,'\0',753,950.00,950.00,2),
(591,123,1.0000,'2024-05-18 22:27:00','2024-05-18 16:57:00',9,2.0000,'\0',754,2.00,2.00,3),
(592,124,1.0000,'2024-05-18 22:27:02','2024-05-18 16:57:02',4,950.0000,'\0',755,950.00,950.00,2),
(593,124,1.0000,'2024-05-18 22:27:02','2024-05-18 16:57:02',9,2.0000,'\0',756,2.00,2.00,3),
(594,125,1.0000,'2024-05-18 22:27:27','2024-05-18 16:57:27',4,950.0000,'\0',757,950.00,950.00,2),
(595,125,1.0000,'2024-05-18 22:27:27','2024-05-18 16:57:27',9,2.0000,'\0',758,2.00,2.00,3),
(596,126,1.0000,'2024-05-18 22:43:56','2024-05-18 17:13:56',2,100.0000,'\0',759,100.00,100.00,1),
(597,126,2.0000,'2024-05-18 22:43:56','2024-05-18 17:13:56',3,1.5000,'\0',760,3.00,3.00,3),
(598,127,1.0000,'2024-05-18 22:47:08','2024-05-18 17:17:08',13,1.1000,'\0',761,1.10,1.10,1),
(599,127,1.0000,'2024-05-18 22:47:08','2024-05-18 17:17:08',9,5.0000,'\0',762,5.00,5.00,3),
(600,128,1.0000,'2024-05-18 22:53:15','2024-05-18 17:23:15',2,100.0000,'\0',763,100.00,100.00,1),
(601,128,1.0000,'2024-05-18 22:53:15','2024-05-18 17:23:15',3,1.5000,'\0',764,1.50,1.50,3),
(602,129,1.0000,'2024-05-19 02:05:36','2024-05-18 20:35:36',5,2.0000,'\0',765,2.00,2.00,3),
(603,129,1.0000,'2024-05-19 02:05:36','2024-05-18 20:35:36',6,1.2000,'\0',766,1.20,1.20,3),
(604,130,1.0000,'2024-05-19 15:02:43','2024-05-19 09:32:43',5,2.0000,'\0',767,2.00,2.00,3),
(605,130,1.0000,'2024-05-19 15:02:43','2024-05-19 09:32:43',9,5.0000,'\0',768,5.00,5.00,3),
(606,130,1.0000,'2024-05-19 15:02:43','2024-05-19 09:32:43',11,1.7500,'\0',769,1.75,1.75,1);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_header`
--

DROP TABLE IF EXISTS `order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_header` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNo` varchar(50) DEFAULT NULL,
  `isVoided` bit(1) NOT NULL DEFAULT b'0',
  `userLogId` int(11) NOT NULL,
  `DC_CustomerId` int(11) DEFAULT NULL,
  `SessionId` int(11) NOT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `terminalId` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `DC_TerminalId` int(11) NOT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `CountryId` int(11) NOT NULL,
  `CurrencyId` int(11) NOT NULL,
  `PrimaryLanguageId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `dc_userId` int(11) DEFAULT NULL,
  `dc_StoreId` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderId`),
  UNIQUE KEY `OrderId_UNIQUE` (`OrderId`),
  UNIQUE KEY `OrderNo_UNIQUE` (`OrderNo`),
  KEY `FK_OrderHeader_Terminal` (`terminalId`),
  KEY `FK_OrderHeader_DC_Terminal` (`DC_TerminalId`),
  KEY `FK_OrderHeader_Branch` (`StoreId`),
  KEY `FK_OrderHeader_SessionDetails` (`SessionId`),
  KEY `FK_OrderHeader_DC_Customer` (`DC_CustomerId`),
  KEY `FK_OrderHeader_Customer` (`customerId`),
  KEY `FK_OrderHeader_Country` (`CountryId`),
  KEY `FK_OrderHeader_Currency` (`CurrencyId`),
  KEY `FK_OrderHeader_PrimaryLanguage` (`PrimaryLanguageId`),
  CONSTRAINT `FK_OrderHeader_Branch` FOREIGN KEY (`StoreId`) REFERENCES `store` (`storeId`),
  CONSTRAINT `FK_OrderHeader_Country` FOREIGN KEY (`CountryId`) REFERENCES `country` (`CountryId`),
  CONSTRAINT `FK_OrderHeader_Currency` FOREIGN KEY (`CurrencyId`) REFERENCES `currency` (`CurrencyID`),
  CONSTRAINT `FK_OrderHeader_Customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `FK_OrderHeader_DC_Customer` FOREIGN KEY (`DC_CustomerId`) REFERENCES `dc_customer` (`DC_CustomerID`),
  CONSTRAINT `FK_OrderHeader_DC_Terminal` FOREIGN KEY (`DC_TerminalId`) REFERENCES `dc_terminal` (`DC_TerminalId`),
  CONSTRAINT `FK_OrderHeader_PrimaryLanguage` FOREIGN KEY (`PrimaryLanguageId`) REFERENCES `languages` (`LanguageID`),
  CONSTRAINT `FK_OrderHeader_SessionDetails` FOREIGN KEY (`SessionId`) REFERENCES `session_start_details` (`sessionId`),
  CONSTRAINT `FK_OrderHeader_Terminal` FOREIGN KEY (`terminalId`) REFERENCES `terminal` (`TerminalId`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_header`
--

LOCK TABLES `order_header` WRITE;
/*!40000 ALTER TABLE `order_header` DISABLE KEYS */;
INSERT INTO `order_header` VALUES
(2,'00002','\0',1,17,1,'2024-01-25 17:03:57','2024-01-25 22:33:57',1,14,15,1,1,1,1,1,2,NULL),
(3,'00003','\0',1,17,1,'2024-01-25 17:04:01','2024-01-25 22:34:01',1,14,15,1,1,1,1,1,2,NULL),
(4,'00004','\0',1,17,1,'2024-01-28 09:05:56','2024-01-28 14:35:56',1,14,15,1,1,1,1,1,2,NULL),
(5,'00005','\0',1,17,1,'2024-01-28 09:42:14','2024-01-28 15:12:14',1,14,15,1,1,1,1,1,2,NULL),
(6,'00006','\0',1,17,1,'2024-01-28 09:43:27','2024-01-28 15:13:27',1,14,15,1,1,1,1,1,2,NULL),
(7,'00007','\0',1,17,1,'2024-01-28 10:00:01','2024-01-28 15:30:01',1,14,15,1,1,1,1,1,2,NULL),
(8,'00008','\0',1,17,1,'2024-01-28 10:04:01','2024-01-28 15:34:01',1,14,15,1,1,1,1,1,2,NULL),
(9,'00009','',1,17,1,'2024-01-28 10:04:05','2024-01-28 15:34:05',1,14,15,1,1,1,1,1,2,NULL),
(10,'00010','\0',1,17,1,'2024-01-28 10:17:00','2024-01-28 15:47:00',1,14,15,1,1,1,1,1,2,NULL),
(11,'00011','\0',1,17,1,'2024-01-28 10:19:17','2024-01-28 15:49:17',1,14,15,1,1,1,1,1,2,NULL),
(12,'00012','\0',1,17,1,'2024-01-28 10:19:28','2024-01-28 15:49:28',1,14,15,1,1,1,1,1,2,NULL),
(13,'00013','\0',1,17,1,'2024-01-28 10:51:36','2024-01-28 16:21:36',1,14,15,1,1,1,1,1,3,NULL),
(14,'00014','\0',1,17,1,'2024-01-28 11:25:59','2024-01-28 16:55:59',1,14,15,1,1,1,1,1,3,NULL),
(15,'00015','',1,17,1,'2024-01-28 14:39:18','2024-01-28 20:09:18',1,14,15,1,1,1,1,1,3,NULL),
(16,'00016','\0',1,17,1,'2024-01-28 14:41:05','2024-01-28 20:11:05',1,14,15,1,1,1,1,1,3,NULL),
(17,'00017','\0',1,17,1,'2024-01-29 16:57:20','2024-01-29 22:27:20',1,14,15,1,1,1,1,1,3,NULL),
(18,'00018','\0',1,17,1,'2024-01-29 16:57:24','2024-01-29 22:27:24',1,14,15,1,1,1,1,1,3,NULL),
(19,'00019','\0',1,17,1,'2024-01-30 16:06:25','2024-01-30 21:36:25',1,14,15,1,1,1,1,1,3,NULL),
(20,'00020','\0',1,17,1,'2024-01-30 16:14:27','2024-01-30 21:44:27',1,14,15,1,1,1,1,1,3,NULL),
(21,'00021','\0',1,17,1,'2024-01-30 16:15:39','2024-01-30 21:45:39',1,14,15,1,1,1,1,1,3,NULL),
(22,'00022','\0',1,17,1,'2024-01-30 17:14:00','2024-01-30 22:44:00',1,14,15,1,1,1,1,1,3,NULL),
(23,'00023','\0',1,17,1,'2024-01-30 17:50:48','2024-01-30 23:20:48',1,14,15,1,1,1,1,1,3,NULL),
(24,'00024','\0',1,17,1,'2024-01-30 17:54:34','2024-01-30 23:24:34',1,14,15,1,1,1,1,1,3,NULL),
(25,'00025','\0',1,17,1,'2024-01-30 17:55:34','2024-01-30 23:25:34',1,14,15,1,1,1,1,1,3,NULL),
(26,'00026','\0',1,17,1,'2024-01-30 17:57:01','2024-01-30 23:27:01',1,14,15,1,1,1,1,1,3,NULL),
(27,'00027','\0',1,17,1,'2024-01-30 17:57:21','2024-01-30 23:27:21',1,14,15,1,1,1,1,1,3,NULL),
(28,'00028','\0',1,17,1,'2024-01-30 17:57:44','2024-01-30 23:27:44',1,14,15,1,1,1,1,1,3,NULL),
(29,'00029','\0',1,17,1,'2024-01-30 17:57:58','2024-01-30 23:27:58',1,14,15,1,1,1,1,1,3,NULL),
(30,'00030','\0',1,17,1,'2024-01-30 18:10:48','2024-01-30 23:40:48',1,14,15,1,1,1,1,1,3,NULL),
(31,'00031','\0',1,17,1,'2024-01-30 18:14:28','2024-01-30 23:44:28',1,14,15,1,1,1,1,1,3,NULL),
(32,'00032','\0',1,17,1,'2024-01-30 18:16:04','2024-01-30 23:46:04',1,14,15,1,1,1,1,1,3,NULL),
(33,'00033','\0',1,17,1,'2024-01-30 18:16:08','2024-01-30 23:46:08',1,14,15,1,1,1,1,1,3,NULL),
(34,'00034','\0',1,17,1,'2024-01-30 18:16:09','2024-01-30 23:46:09',1,14,15,1,1,1,1,1,3,NULL),
(35,'00035','\0',1,17,1,'2024-01-30 18:22:30','2024-01-30 23:52:30',1,14,15,1,1,1,1,1,3,NULL),
(36,'00036','\0',1,17,1,'2024-01-30 18:25:39','2024-01-30 23:55:39',1,14,15,1,1,1,1,1,3,NULL),
(37,'00037','\0',1,17,1,'2024-01-30 18:26:27','2024-01-30 23:56:27',1,14,15,1,1,1,1,1,3,NULL),
(38,'00038','\0',1,17,1,'2024-01-30 18:26:28','2024-01-30 23:56:28',1,14,15,1,1,1,1,1,3,NULL),
(39,'00039','\0',1,17,1,'2024-01-30 18:26:34','2024-01-30 23:56:34',1,14,15,1,1,1,1,1,3,NULL),
(40,'00040','\0',1,17,1,'2024-01-30 18:26:35','2024-01-30 23:56:35',1,14,15,1,1,1,1,1,3,NULL),
(41,'00041','\0',1,17,1,'2024-01-30 18:26:35','2024-01-30 23:56:35',1,14,15,1,1,1,1,1,3,NULL),
(42,'00042','\0',1,17,1,'2024-01-30 18:26:36','2024-01-30 23:56:36',1,14,15,1,1,1,1,1,3,NULL),
(43,'00043','\0',1,17,1,'2024-01-30 18:27:53','2024-01-30 23:57:53',1,14,15,1,1,1,1,1,3,NULL),
(44,'00044','\0',1,17,1,'2024-01-30 18:28:17','2024-01-30 23:58:17',1,14,15,1,1,1,1,1,3,NULL),
(45,'00045','\0',1,17,1,'2024-01-30 18:29:37','2024-01-30 23:59:37',1,14,15,1,1,1,1,1,3,NULL),
(46,'00046','\0',1,17,1,'2024-01-31 18:29:59','2024-01-31 23:59:59',1,14,15,1,1,1,1,1,3,NULL),
(47,'00047','\0',1,17,1,'2024-01-31 19:07:07','2024-02-01 00:37:07',1,14,15,1,1,1,1,1,3,NULL),
(48,'00048','\0',1,17,1,'2024-01-31 19:07:18','2024-02-01 00:37:18',1,14,15,1,1,1,1,1,3,NULL),
(49,'00049','\0',1,17,1,'2024-02-01 15:38:29','2024-02-01 21:08:29',1,14,15,1,1,1,1,1,3,NULL),
(50,'00050','\0',1,17,1,'2024-02-01 15:38:52','2024-02-01 21:08:52',1,14,15,1,1,1,1,1,3,NULL),
(51,'00051','\0',1,17,1,'2024-02-01 15:39:06','2024-02-01 21:09:06',1,14,15,1,1,1,1,1,3,NULL),
(52,'00052','\0',1,17,1,'2024-02-01 15:48:58','2024-02-01 21:18:58',1,14,15,1,1,1,1,1,3,NULL),
(53,'00053','\0',1,17,1,'2024-02-01 15:49:09','2024-02-01 21:19:09',1,14,15,1,1,1,1,1,3,NULL),
(54,'00054','\0',1,17,1,'2024-02-01 15:49:27','2024-02-01 21:19:27',1,14,15,1,1,1,1,1,3,NULL),
(55,'00055','\0',1,17,1,'2024-02-01 15:53:43','2024-02-01 21:23:43',1,14,15,1,1,1,1,1,3,NULL),
(56,'00056','\0',1,17,1,'2024-02-01 16:11:32','2024-02-01 21:41:32',1,14,15,1,1,1,1,1,3,NULL),
(57,'00057','\0',1,17,1,'2024-02-01 16:44:45','2024-02-01 22:14:45',1,14,15,1,1,1,1,1,3,NULL),
(58,'00058','\0',1,17,1,'2024-02-01 17:35:40','2024-02-01 23:05:40',1,14,15,1,1,1,1,1,3,NULL),
(59,'00059','\0',1,17,1,'2024-02-01 17:47:41','2024-02-01 23:17:41',1,14,15,1,1,1,1,1,3,NULL),
(60,'00060','\0',1,17,1,'2024-02-01 17:58:57','2024-02-01 23:28:57',1,14,15,1,1,1,1,1,3,NULL),
(61,'00061','\0',1,17,1,'2024-02-01 18:42:38','2024-02-02 00:12:38',1,14,15,1,1,1,1,1,3,NULL),
(62,'00062','\0',1,17,1,'2024-02-01 18:49:43','2024-02-02 00:19:43',1,14,15,1,1,1,1,1,3,NULL),
(63,'00063','\0',1,17,1,'2024-02-01 18:50:15','2024-02-02 00:20:15',1,14,15,1,1,1,1,1,3,NULL),
(64,'00064','\0',1,17,1,'2024-02-01 18:58:31','2024-02-02 00:28:31',1,14,15,1,1,1,1,1,3,NULL),
(65,'00065','\0',1,17,1,'2024-02-01 19:05:05','2024-02-02 00:35:05',1,14,15,1,1,1,1,1,3,NULL),
(66,'00066','\0',1,17,1,'2024-02-01 19:26:24','2024-02-02 00:56:24',1,14,15,1,1,1,1,1,3,NULL),
(67,'00067','\0',1,17,1,'2024-02-11 10:29:44','2024-02-11 15:59:44',1,14,15,1,1,1,1,1,3,NULL),
(68,'00068','\0',1,17,1,'2024-02-11 15:58:37','2024-02-11 21:28:37',1,14,15,1,1,1,1,1,3,NULL),
(69,'00069','\0',1,17,1,'2024-02-12 17:55:02','2024-02-12 23:25:02',1,14,15,1,1,1,1,1,3,NULL),
(70,'00070','\0',1,17,1,'2024-02-12 17:55:19','2024-02-12 23:25:19',1,14,15,1,1,1,1,1,3,NULL),
(71,'00071','\0',1,17,1,'2024-02-14 12:19:22','2024-02-14 17:49:22',1,14,15,1,1,1,1,1,3,NULL),
(72,'00072','\0',1,17,1,'2024-02-14 12:19:41','2024-02-14 17:49:41',1,14,15,1,1,1,1,1,3,NULL),
(73,'00073','\0',1,17,1,'2024-02-14 12:20:58','2024-02-14 17:50:58',1,14,15,1,1,1,1,1,3,NULL),
(74,'00074','\0',1,17,1,'2024-02-14 19:18:45','2024-02-15 00:48:45',1,14,15,1,1,1,1,1,3,NULL),
(75,'00075','\0',1,17,1,'2024-02-16 10:15:58','2024-02-16 15:45:58',1,14,15,1,1,1,1,1,3,NULL),
(76,'00076','\0',1,17,1,'2024-02-17 16:16:47','2024-02-17 21:46:47',1,14,15,1,1,1,1,1,3,NULL),
(77,'00077','\0',1,17,1,'2024-02-17 16:18:44','2024-02-17 21:48:44',1,14,15,1,1,1,1,1,3,NULL),
(78,'00078','\0',1,17,1,'2024-02-18 06:10:23','2024-02-18 11:40:23',1,14,15,1,1,1,1,1,3,NULL),
(79,'00079','\0',1,17,1,'2024-02-18 06:12:26','2024-02-18 11:42:26',1,14,15,1,1,1,1,1,3,NULL),
(80,'00080','\0',1,17,1,'2024-02-18 06:28:27','2024-02-18 11:58:27',1,14,15,1,1,1,1,1,3,NULL),
(81,'00081','\0',1,17,1,'2024-02-18 06:53:59','2024-02-18 12:23:59',1,14,15,1,1,1,1,1,3,NULL),
(82,'00082','\0',1,18,1,'2024-02-21 16:33:23','2024-02-21 22:03:23',1,14,15,1,1,1,1,1,3,NULL),
(83,'00083','\0',1,18,1,'2024-02-23 13:41:25','2024-02-23 19:11:25',1,14,15,1,1,1,1,1,3,NULL),
(84,'00084','\0',1,18,1,'2024-02-23 14:09:21','2024-02-23 19:39:21',1,14,15,1,1,1,1,1,3,NULL),
(85,'00085','\0',1,18,1,'2024-02-23 14:09:41','2024-02-23 19:39:41',1,14,15,1,1,1,1,1,3,NULL),
(86,'00086','',1,18,1,'2024-02-23 14:10:03','2024-02-23 19:40:03',1,14,15,1,1,1,1,1,3,NULL),
(87,'00087','\0',1,19,1,'2024-02-23 14:32:11','2024-02-23 20:02:11',1,33,15,1,1,1,1,1,3,NULL),
(88,'00088','\0',1,20,1,'2024-02-23 15:04:57','2024-02-23 20:34:57',1,23,15,1,1,1,1,1,3,NULL),
(89,'00089','\0',1,21,1,'2024-02-23 15:12:41','2024-02-23 20:42:41',1,32,15,1,1,1,1,1,3,NULL),
(90,'00090','\0',1,22,1,'2024-02-23 15:12:57','2024-02-23 20:42:57',1,41,15,1,1,1,1,1,3,NULL),
(91,'00091','\0',1,20,1,'2024-02-25 16:30:01','2024-02-25 22:00:01',1,23,15,1,1,1,1,1,3,NULL),
(92,'00092','\0',1,9,1,'2024-02-25 17:19:02','2024-02-25 22:49:02',1,17,15,1,1,1,1,1,3,NULL),
(93,'00093','\0',1,9,1,'2024-02-25 17:21:51','2024-02-25 22:51:51',1,17,15,1,1,1,1,1,3,NULL),
(94,'00094','\0',1,9,1,'2024-02-25 17:38:51','2024-02-25 23:08:51',1,17,15,1,1,1,1,1,3,NULL),
(95,'00095','\0',1,23,1,'2024-03-01 15:24:53','2024-03-01 20:54:53',1,22,15,1,1,1,1,1,3,NULL),
(96,'00096','\0',1,24,1,'2024-03-02 17:05:28','2024-03-02 22:35:28',1,33,15,1,1,1,1,1,3,NULL),
(97,'00097','\0',1,25,1,'2024-03-03 06:52:28','2024-03-03 12:22:28',1,22,15,1,1,1,1,1,3,NULL),
(98,'00098','\0',1,25,1,'2024-03-22 16:26:22','2024-03-22 21:56:22',1,22,15,1,1,1,1,1,3,NULL),
(99,'00099','\0',1,25,1,'2024-03-22 16:31:13','2024-03-22 22:01:13',1,22,15,1,1,1,1,1,3,NULL),
(100,'00100','',1,26,1,'2024-03-22 16:46:55','2024-03-22 22:16:55',1,14,15,1,1,1,1,1,3,NULL),
(101,'00101','\0',1,9,1,'2024-03-24 06:19:11','2024-03-24 11:49:11',1,17,15,1,1,1,1,1,3,NULL),
(102,'00102','\0',1,27,1,'2024-03-24 06:20:49','2024-03-24 11:50:49',1,21,15,1,1,1,1,1,3,NULL),
(103,'00103','',1,9,1,'2024-03-25 17:53:35','2024-03-25 23:23:35',1,17,15,1,1,1,1,1,3,NULL),
(104,'00104','',1,9,1,'2024-03-25 17:53:42','2024-03-25 23:23:42',1,17,15,1,1,1,1,1,3,NULL),
(105,'00105','\0',1,9,1,'2024-04-12 08:04:28','2024-04-12 13:34:28',1,17,15,1,1,1,1,1,3,NULL),
(106,'00106','\0',1,9,1,'2024-04-12 08:05:19','2024-04-12 13:35:19',1,17,15,1,1,1,1,1,3,NULL),
(107,'00107','',1,9,1,'2024-04-12 08:49:49','2024-04-12 14:19:49',1,17,15,1,1,1,1,1,3,NULL),
(108,'00108','\0',1,9,1,'2024-04-12 08:49:52','2024-04-12 14:19:52',1,17,15,1,1,1,1,1,3,NULL),
(109,'00109','',1,9,1,'2024-04-12 08:55:29','2024-04-12 14:25:29',1,17,15,1,1,1,1,1,3,NULL),
(110,'00110','',1,8,1,'2024-04-12 08:57:19','2024-04-12 14:27:19',1,13,15,1,1,1,1,1,3,NULL),
(111,'00111','',1,8,1,'2024-04-12 08:57:20','2024-04-12 14:27:20',1,13,15,1,1,1,1,1,3,NULL),
(112,'00112','',1,29,1,'2024-04-12 08:57:40','2024-04-12 14:27:40',1,14,15,1,1,1,1,1,3,NULL),
(113,'00113','\0',1,30,1,'2024-04-13 14:25:18','2024-04-13 19:55:18',1,32,15,1,1,1,1,1,3,NULL),
(114,'00114','\0',1,27,1,'2024-05-08 14:44:10','2024-05-08 20:14:10',1,21,15,1,1,1,1,1,3,NULL),
(115,'00115','\0',1,31,1,'2024-05-11 17:16:48','2024-05-11 22:46:48',1,23,15,1,1,1,1,1,3,NULL),
(116,'00116','\0',1,32,1,'2024-05-11 18:40:25','2024-05-12 00:10:25',1,17,15,1,1,1,1,1,3,NULL),
(117,'00117','\0',1,8,1,'2024-05-18 16:08:38','2024-05-18 21:38:38',1,13,15,1,1,1,1,1,3,NULL),
(118,'00118','\0',1,8,1,'2024-05-18 16:08:41','2024-05-18 21:38:41',1,13,15,1,1,1,1,1,3,NULL),
(119,'00119','\0',1,27,1,'2024-05-18 16:09:05','2024-05-18 21:39:05',1,21,15,1,1,1,1,1,3,NULL),
(120,'00120','\0',1,8,1,'2024-05-18 16:53:41','2024-05-18 22:23:41',1,13,15,1,1,1,1,1,3,2),
(121,'00121','\0',1,8,1,'2024-05-18 16:53:43','2024-05-18 22:23:43',1,13,15,1,1,1,1,1,3,3),
(122,'00122','',1,8,1,'2024-05-18 16:54:07','2024-05-18 22:24:07',1,13,15,1,1,1,1,1,3,4),
(123,'00123','\0',1,8,1,'2024-05-18 16:57:00','2024-05-18 22:27:00',1,13,15,1,1,1,1,1,3,4),
(124,'00124','\0',1,8,1,'2024-05-18 16:57:02','2024-05-18 22:27:02',1,13,15,1,1,1,1,1,3,4),
(125,'00125','\0',1,8,1,'2024-05-18 16:57:27','2024-05-18 22:27:27',1,13,15,1,1,1,1,1,3,4),
(126,'00126','\0',1,29,1,'2024-05-18 17:13:56','2024-05-18 22:43:56',1,14,15,1,1,1,1,1,3,4),
(127,'00127','\0',1,29,1,'2024-05-18 17:17:08','2024-05-18 22:47:08',1,14,15,1,1,1,1,1,3,4),
(128,'00128','\0',1,27,1,'2024-05-18 17:23:15','2024-05-18 22:53:15',1,21,15,1,1,1,1,1,3,4),
(129,'00129','\0',1,29,1,'2024-05-18 20:35:36','2024-05-19 02:05:36',1,14,15,1,1,1,1,1,3,4),
(130,'00130','\0',1,33,1,'2024-05-19 09:32:43','2024-05-19 15:02:43',1,14,15,1,1,1,1,1,3,4);
/*!40000 ALTER TABLE `order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line_discount`
--

DROP TABLE IF EXISTS `order_line_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line_discount` (
  `Order_line_discountId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderDetailId` int(11) NOT NULL,
  `DiscountTypeId` int(11) DEFAULT NULL,
  `DiscountValue` decimal(10,2) DEFAULT NULL,
  `DiscountReasonId` int(11) DEFAULT NULL,
  `Remark` varchar(500) DEFAULT NULL,
  `DiscountAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Order_line_discountId`),
  KEY `FK_LineDiscount_OrderDetails` (`OrderDetailId`),
  KEY `FK_LineDiscount_DiscountType` (`DiscountTypeId`),
  KEY `FK_LineDiscount_DiscountReason` (`DiscountReasonId`),
  CONSTRAINT `FK_LineDiscount_DiscountReason` FOREIGN KEY (`DiscountReasonId`) REFERENCES `discount_reason` (`DiscountReasonId`),
  CONSTRAINT `FK_LineDiscount_DiscountType` FOREIGN KEY (`DiscountTypeId`) REFERENCES `discount_type` (`DiscountTypeId`),
  CONSTRAINT `FK_LineDiscount_OrderDetails` FOREIGN KEY (`OrderDetailId`) REFERENCES `order_details` (`OrderDetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_discount`
--

LOCK TABLES `order_line_discount` WRITE;
/*!40000 ALTER TABLE `order_line_discount` DISABLE KEYS */;
INSERT INTO `order_line_discount` VALUES
(55,204,1,10.00,1,'rr',80.32),
(56,205,2,10.00,1,'rr2',10.00),
(57,208,1,10.00,1,'rr',80.32),
(58,209,2,10.00,1,'rr2',10.00),
(59,214,1,10.00,1,'rr',80.32),
(60,215,2,10.00,1,'rr2',10.00),
(61,218,1,10.00,1,'rr',80.32),
(62,219,2,10.00,1,'rr2',10.00),
(63,222,1,10.00,1,'rr',80.32),
(64,223,2,10.00,1,'rr2',10.00),
(65,226,1,10.00,1,'rr',80.32),
(66,227,2,10.00,1,'rr2',10.00),
(67,230,1,10.00,1,'rr',80.32),
(68,231,2,10.00,1,'rr2',10.00),
(69,234,1,10.00,1,'rr',80.32),
(70,235,2,10.00,1,'rr2',10.00),
(71,238,1,10.00,1,'rr',80.32),
(72,239,2,10.00,1,'rr2',10.00),
(73,242,1,10.00,1,'rr',80.32),
(74,243,2,10.00,1,'rr2',10.00),
(75,246,1,10.00,1,'rr',80.32),
(76,247,2,10.00,1,'rr2',10.00),
(77,250,1,10.00,1,'rr',80.32),
(78,251,2,10.00,1,'rr2',10.00),
(79,264,1,10.00,1,'rr',80.32),
(80,265,2,10.00,1,'rr2',10.00),
(81,268,1,10.00,1,'rr',80.32),
(82,269,2,10.00,1,'rr2',10.00),
(83,279,1,10.00,1,'rr',80.32),
(84,280,2,10.00,1,'rr2',10.00),
(85,283,1,10.00,1,'rr',80.32),
(86,284,2,10.00,1,'rr2',10.00),
(87,287,1,10.00,1,'rr',80.32),
(88,288,2,10.00,1,'rr2',10.00),
(89,291,1,10.00,1,'rr',80.32),
(90,292,2,10.00,1,'rr2',10.00),
(91,295,1,10.00,1,'rr',80.32),
(92,296,2,10.00,1,'rr2',10.00),
(93,299,1,10.00,1,'rr',80.32),
(94,300,2,10.00,1,'rr2',10.00),
(95,303,1,10.00,1,'rr',80.32),
(96,304,2,10.00,1,'rr2',10.00),
(97,307,1,10.00,1,'rr',80.32),
(98,308,2,10.00,1,'rr2',10.00),
(99,321,1,10.00,1,'rr',80.32),
(100,322,2,10.00,1,'rr2',10.00),
(101,339,1,10.00,1,'rr',80.32),
(102,340,2,10.00,1,'rr2',10.00),
(103,377,1,10.00,1,'rr',80.32),
(104,378,2,10.00,1,'rr2',10.00),
(105,393,1,5.00,2,'jj',0.11),
(106,536,1,16.00,2,'l',0.40),
(107,537,1,18.00,2,'',18.00),
(108,565,1,4.00,2,'kj',0.20);
/*!40000 ALTER TABLE `order_line_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line_tax`
--

DROP TABLE IF EXISTS `order_line_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line_tax` (
  `order_line_taxId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderDetailId` int(11) DEFAULT NULL,
  `TaxRate` decimal(10,2) DEFAULT NULL,
  `TaxAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_line_taxId`),
  KEY `FK_order_line_tax_OrderDetails` (`OrderDetailId`),
  CONSTRAINT `FK_order_line_tax_OrderDetails` FOREIGN KEY (`OrderDetailId`) REFERENCES `order_details` (`OrderDetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_tax`
--

LOCK TABLES `order_line_tax` WRITE;
/*!40000 ALTER TABLE `order_line_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_line_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_overall_discount`
--

DROP TABLE IF EXISTS `order_overall_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_overall_discount` (
  `Order_OverallDiscountId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) NOT NULL,
  `DiscountTypeId` int(11) DEFAULT NULL,
  `DiscountValue` decimal(10,2) DEFAULT NULL,
  `DiscountReasonId` int(11) DEFAULT NULL,
  `Remark` varchar(500) DEFAULT NULL,
  `DiscountAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Order_OverallDiscountId`),
  KEY `FK_OverallDiscount_Orderheader` (`OrderId`),
  KEY `FK_OverallDiscount_DiscountType` (`DiscountTypeId`),
  KEY `FK_OverallDiscount_DiscountReason` (`DiscountReasonId`),
  CONSTRAINT `FK_OverallDiscount_DiscountReason` FOREIGN KEY (`DiscountReasonId`) REFERENCES `discount_reason` (`DiscountReasonId`),
  CONSTRAINT `FK_OverallDiscount_DiscountType` FOREIGN KEY (`DiscountTypeId`) REFERENCES `discount_type` (`DiscountTypeId`),
  CONSTRAINT `FK_OverallDiscount_Orderheader` FOREIGN KEY (`OrderId`) REFERENCES `order_header` (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_overall_discount`
--

LOCK TABLES `order_overall_discount` WRITE;
/*!40000 ALTER TABLE `order_overall_discount` DISABLE KEYS */;
INSERT INTO `order_overall_discount` VALUES
(28,2,2,500.00,1,'FGJKLJJKJ',500.00),
(29,3,2,500.00,1,'FGJKLJJKJ',500.00),
(30,5,2,500.00,1,'FGJKLJJKJ',500.00),
(31,6,2,500.00,1,'FGJKLJJKJ',500.00),
(32,7,2,500.00,1,'FGJKLJJKJ',500.00),
(33,8,2,500.00,1,'FGJKLJJKJ',500.00),
(34,9,2,500.00,1,'FGJKLJJKJ',500.00),
(35,10,2,500.00,1,'FGJKLJJKJ',500.00),
(36,11,2,500.00,1,'FGJKLJJKJ',500.00),
(37,12,2,500.00,1,'FGJKLJJKJ',500.00),
(38,13,2,500.00,1,'FGJKLJJKJ',500.00),
(39,14,2,500.00,1,'FGJKLJJKJ',500.00),
(40,17,2,500.00,1,'FGJKLJJKJ',500.00),
(41,18,2,500.00,1,'FGJKLJJKJ',500.00),
(42,22,2,500.00,1,'FGJKLJJKJ',500.00),
(43,23,2,500.00,1,'FGJKLJJKJ',500.00),
(44,24,2,500.00,1,'FGJKLJJKJ',500.00),
(45,25,2,500.00,1,'FGJKLJJKJ',500.00),
(46,26,2,500.00,1,'FGJKLJJKJ',500.00),
(47,27,2,500.00,1,'FGJKLJJKJ',500.00),
(48,28,2,500.00,1,'FGJKLJJKJ',500.00),
(49,29,2,500.00,1,'FGJKLJJKJ',500.00),
(50,35,2,500.00,1,'FGJKLJJKJ',500.00),
(51,43,2,500.00,1,'FGJKLJJKJ',500.00),
(52,58,2,500.00,1,'FGJKLJJKJ',500.00),
(53,93,1,4.00,2,'',19.05),
(54,107,2,500.00,1,'FGJKLJJKJ',500.00),
(55,108,2,500.00,1,'FGJKLJJKJ',500.00),
(56,109,2,500.00,1,'FGJKLJJKJ',500.00),
(57,117,2,500.00,1,'FGJKLJJKJ',500.00),
(58,118,2,500.00,1,'FGJKLJJKJ',500.00),
(59,120,2,500.00,1,'FGJKLJJKJ',500.00),
(60,121,2,500.00,1,'FGJKLJJKJ',500.00),
(61,122,2,500.00,1,'FGJKLJJKJ',500.00),
(62,123,2,500.00,1,'FGJKLJJKJ',500.00),
(63,124,2,500.00,1,'FGJKLJJKJ',500.00),
(64,125,2,500.00,1,'FGJKLJJKJ',500.00);
/*!40000 ALTER TABLE `order_overall_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_overall_tax`
--

DROP TABLE IF EXISTS `order_overall_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_overall_tax` (
  `order_overall_TaxId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) DEFAULT NULL,
  `TaxRate` decimal(10,2) DEFAULT NULL,
  `TaxAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_overall_TaxId`),
  KEY `FK_order_overall_tax_OrderHeader` (`OrderId`),
  CONSTRAINT `FK_order_overall_tax_OrderHeader` FOREIGN KEY (`OrderId`) REFERENCES `order_header` (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_overall_tax`
--

LOCK TABLES `order_overall_tax` WRITE;
/*!40000 ALTER TABLE `order_overall_tax` DISABLE KEYS */;
INSERT INTO `order_overall_tax` VALUES
(69,2,8.00,353.03),
(70,3,8.00,353.03),
(71,4,8.00,0.60),
(72,5,8.00,353.03),
(73,6,8.00,353.03),
(74,7,8.00,353.03),
(75,8,8.00,353.03),
(76,9,8.00,353.03),
(77,10,8.00,353.03),
(78,11,8.00,353.03),
(79,12,8.00,353.03),
(80,13,8.00,353.03),
(81,14,8.00,353.03),
(82,15,8.00,1.08),
(83,16,8.00,1.08),
(84,17,8.00,353.03),
(85,18,8.00,353.03),
(86,19,8.00,0.38),
(87,20,8.00,0.24),
(88,21,8.00,0.24),
(89,22,8.00,353.03),
(90,23,8.00,353.03),
(91,24,8.00,353.03),
(92,25,8.00,353.03),
(93,26,8.00,353.03),
(94,27,8.00,353.03),
(95,28,8.00,353.03),
(96,29,8.00,353.03),
(97,30,8.00,0.31),
(98,31,8.00,0.31),
(99,32,8.00,0.31),
(100,33,8.00,0.31),
(101,34,8.00,0.31),
(102,35,8.00,353.03),
(103,36,8.00,0.31),
(104,37,8.00,0.31),
(105,38,8.00,0.31),
(106,39,8.00,0.31),
(107,40,8.00,0.31),
(108,41,8.00,0.31),
(109,42,8.00,0.31),
(110,43,8.00,353.03),
(111,44,8.00,0.31),
(112,45,8.00,0.31),
(113,46,8.00,0.26),
(114,47,8.00,0.45),
(115,48,8.00,0.45),
(116,49,8.00,0.42),
(117,50,8.00,0.42),
(118,51,8.00,0.42),
(119,52,8.00,0.35),
(120,53,8.00,0.35),
(121,54,8.00,0.35),
(122,55,8.00,0.35),
(123,56,8.00,0.35),
(124,57,8.00,0.51),
(125,58,8.00,353.03),
(126,59,8.00,0.48),
(127,60,8.00,0.35),
(128,61,8.00,0.73),
(129,62,8.00,0.26),
(130,63,8.00,1.65),
(131,64,8.00,0.10),
(132,65,8.00,0.40),
(133,66,8.00,0.40),
(134,67,8.00,0.31),
(135,68,8.00,1.38),
(136,69,8.00,16.88),
(137,70,8.00,0.62),
(138,71,8.00,0.91),
(139,72,8.00,0.40),
(140,73,8.00,0.86),
(141,74,8.00,0.80),
(142,75,8.00,54.00),
(143,76,8.00,16.44),
(144,77,8.00,12.13),
(145,78,8.00,17.76),
(146,79,8.00,16.82),
(147,80,8.00,14.26),
(148,81,8.00,2.18),
(149,82,8.00,18.32),
(150,83,8.00,1.53),
(151,84,8.00,0.72),
(152,85,8.00,16.84),
(153,86,8.00,0.82),
(154,87,8.00,16.70),
(155,88,8.00,0.92),
(156,89,8.00,0.20),
(157,90,8.00,0.93),
(158,91,8.00,0.96),
(159,92,8.00,16.93),
(160,93,8.00,36.58),
(161,94,8.00,35.22),
(162,95,8.00,35.46),
(163,96,8.00,0.74),
(164,97,8.00,2.31),
(165,98,8.00,1.01),
(166,99,8.00,17.64),
(167,100,8.00,1.55),
(168,101,8.00,83.42),
(169,102,8.00,0.17),
(170,103,8.00,6.90),
(171,104,8.00,0.40),
(172,105,8.00,8.64),
(173,106,8.00,1.84),
(174,107,8.00,35.44),
(175,108,8.00,35.44),
(176,109,8.00,35.44),
(177,110,8.00,1.36),
(178,111,8.00,1.36),
(179,112,8.00,0.35),
(180,113,8.00,0.76),
(181,114,8.00,7.04),
(182,115,8.00,1.06),
(183,116,8.00,51.93),
(184,117,8.00,36.16),
(185,118,8.00,36.16),
(186,119,8.00,0.56),
(187,120,8.00,36.16),
(188,121,8.00,36.16),
(189,122,8.00,36.16),
(190,123,8.00,36.16),
(191,124,8.00,36.16),
(192,125,8.00,36.16),
(193,126,8.00,8.24),
(194,127,8.00,0.49),
(195,128,8.00,8.12),
(196,129,8.00,0.26),
(197,130,8.00,0.70);
/*!40000 ALTER TABLE `order_overall_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payments`
--

DROP TABLE IF EXISTS `order_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_payments` (
  `PaymentId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) NOT NULL,
  `MethodId` int(11) NOT NULL,
  `AmountPaid` decimal(10,4) DEFAULT NULL,
  `PaymentDate_UTC` timestamp NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`PaymentId`),
  KEY `FK_OrderPayments_OrderHeader` (`OrderId`),
  KEY `FK_OrderPayments_Methods` (`MethodId`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payments`
--

LOCK TABLES `order_payments` WRITE;
/*!40000 ALTER TABLE `order_payments` DISABLE KEYS */;
INSERT INTO `order_payments` VALUES
(92,2,1,4000.0000,'2024-01-25 11:33:57'),
(93,2,2,765.9100,'2024-01-25 11:33:57'),
(94,3,1,4000.0000,'2024-01-25 11:34:01'),
(95,3,2,765.9100,'2024-01-25 11:34:01'),
(96,4,1,8.1000,'2024-01-28 03:35:56'),
(97,5,1,4000.0000,'2024-01-28 04:12:14'),
(98,5,2,765.9100,'2024-01-28 04:12:14'),
(99,6,1,4000.0000,'2024-01-28 04:13:27'),
(100,6,2,765.9100,'2024-01-28 04:13:27'),
(101,7,1,4000.0000,'2024-01-28 04:30:01'),
(102,7,2,765.9100,'2024-01-28 04:30:01'),
(103,8,1,4000.0000,'2024-01-28 04:34:01'),
(104,8,2,765.9100,'2024-01-28 04:34:01'),
(105,9,1,4000.0000,'2024-01-28 04:34:05'),
(106,9,2,765.9100,'2024-01-28 04:34:05'),
(107,10,1,4000.0000,'2024-01-28 04:47:00'),
(108,10,2,765.9100,'2024-01-28 04:47:00'),
(109,11,1,4000.0000,'2024-01-28 04:49:17'),
(110,11,2,765.9100,'2024-01-28 04:49:17'),
(111,12,1,4000.0000,'2024-01-28 04:49:28'),
(112,12,2,765.9100,'2024-01-28 04:49:28'),
(113,13,1,4000.0000,'2024-01-28 05:21:36'),
(114,13,2,765.9100,'2024-01-28 05:21:36'),
(115,14,1,4000.0000,'2024-01-28 05:55:59'),
(116,14,2,765.9100,'2024-01-28 05:55:59'),
(117,15,1,14.5800,'2024-01-28 09:09:18'),
(118,16,2,10.0000,'2024-01-28 09:11:05'),
(119,16,1,4.5800,'2024-01-28 09:11:05'),
(120,17,1,4000.0000,'2024-01-29 11:27:20'),
(121,17,2,765.9100,'2024-01-29 11:27:20'),
(122,18,1,4000.0000,'2024-01-29 11:27:24'),
(123,18,2,765.9100,'2024-01-29 11:27:24'),
(124,19,2,5.0800,'2024-01-30 10:36:25'),
(125,20,2,3.2400,'2024-01-30 10:44:27'),
(126,21,2,3.2400,'2024-01-30 10:45:39'),
(127,22,1,4000.0000,'2024-01-30 11:44:00'),
(128,22,2,765.9100,'2024-01-30 11:44:00'),
(129,23,1,10000.0000,'2024-01-30 12:20:48'),
(130,23,2,115.0000,'2024-01-30 12:20:48'),
(131,24,1,10000.0000,'2024-01-30 12:24:34'),
(132,24,2,115.0000,'2024-01-30 12:24:34'),
(133,25,1,10000.0000,'2024-01-30 12:25:34'),
(134,25,2,115.0000,'2024-01-30 12:25:34'),
(135,26,1,10000.0000,'2024-01-30 12:27:01'),
(136,26,2,115.0000,'2024-01-30 12:27:01'),
(137,27,1,10000.0000,'2024-01-30 12:27:21'),
(138,27,2,1105.0000,'2024-01-30 12:27:21'),
(139,28,1,10000.0000,'2024-01-30 12:27:44'),
(140,28,2,1105.0000,'2024-01-30 12:27:44'),
(141,29,1,10000.0000,'2024-01-30 12:27:58'),
(142,29,2,1104.0000,'2024-01-30 12:27:58'),
(143,30,1,4.2100,'2024-01-30 12:40:48'),
(144,31,1,4.2100,'2024-01-30 12:44:28'),
(145,32,1,4.2100,'2024-01-30 12:46:04'),
(146,33,1,4.2100,'2024-01-30 12:46:08'),
(147,34,1,4.2100,'2024-01-30 12:46:09'),
(148,35,1,100.0000,'2024-01-30 12:52:30'),
(149,36,1,4.2100,'2024-01-30 12:55:39'),
(150,37,1,4.2100,'2024-01-30 12:56:27'),
(151,38,1,4.2100,'2024-01-30 12:56:28'),
(152,39,1,4.2100,'2024-01-30 12:56:34'),
(153,40,1,4.2100,'2024-01-30 12:56:35'),
(154,41,1,4.2100,'2024-01-30 12:56:35'),
(155,42,1,4.2100,'2024-01-30 12:56:36'),
(156,43,1,10000.0000,'2024-01-30 12:57:53'),
(157,44,1,4.2100,'2024-01-30 12:58:17'),
(158,45,1,4.2100,'2024-01-30 12:59:37'),
(159,46,1,20.0000,'2024-01-31 12:59:59'),
(160,47,2,6.0500,'2024-01-31 13:37:07'),
(161,48,2,6.0500,'2024-01-31 13:37:18'),
(162,49,1,20.0000,'2024-02-01 10:08:29'),
(163,50,2,5.6200,'2024-02-01 10:08:52'),
(164,51,1,5.6200,'2024-02-01 10:09:06'),
(165,52,1,4.7500,'2024-02-01 10:18:58'),
(166,53,1,4.7500,'2024-02-01 10:19:09'),
(167,54,2,4.7500,'2024-02-01 10:19:27'),
(168,55,1,NULL,'2024-02-01 10:23:43'),
(169,55,2,3.7500,'2024-02-01 10:23:43'),
(170,56,1,20.0000,'2024-02-01 10:41:32'),
(171,57,1,10.0000,'2024-02-01 11:14:45'),
(172,58,1,10000.0000,'2024-02-01 12:05:40'),
(173,59,1,10.0000,'2024-02-01 12:17:41'),
(174,60,1,10.0000,'2024-02-01 12:28:57'),
(175,61,1,20.0000,'2024-02-01 13:12:38'),
(176,62,1,50.0000,'2024-02-01 13:19:43'),
(177,63,1,50.0000,'2024-02-01 13:20:15'),
(178,64,1,50.0000,'2024-02-01 13:28:31'),
(179,65,1,50.0000,'2024-02-01 13:35:05'),
(180,66,1,100.0000,'2024-02-01 13:56:24'),
(181,67,1,20.0000,'2024-02-11 04:59:44'),
(182,68,1,50.0000,'2024-02-11 10:28:37'),
(183,69,1,500.0000,'2024-02-12 12:25:02'),
(184,70,1,50.0000,'2024-02-12 12:25:19'),
(185,71,1,50.0000,'2024-02-14 06:49:22'),
(186,72,1,500.0000,'2024-02-14 06:49:41'),
(187,73,1,20.0000,'2024-02-14 06:50:58'),
(188,74,1,20.0000,'2024-02-14 13:48:45'),
(189,75,1,1000.0000,'2024-02-16 04:45:58'),
(190,76,1,1000.0000,'2024-02-17 10:46:47'),
(191,77,1,500.0000,'2024-02-17 10:48:44'),
(192,78,1,500.0000,'2024-02-18 00:40:23'),
(193,79,1,500.0000,'2024-02-18 00:42:26'),
(194,80,1,500.0000,'2024-02-18 00:58:27'),
(195,81,1,100.0000,'2024-02-18 01:23:59'),
(196,82,1,500.0000,'2024-02-21 11:03:23'),
(197,83,1,500.0000,'2024-02-23 08:11:25'),
(198,84,1,50.0000,'2024-02-23 08:39:21'),
(199,85,1,500.0000,'2024-02-23 08:39:41'),
(200,86,1,500.0000,'2024-02-23 08:40:03'),
(201,87,1,500.0000,'2024-02-23 09:02:11'),
(202,88,1,50.0000,'2024-02-23 09:34:57'),
(203,89,1,50.0000,'2024-02-23 09:42:41'),
(204,90,1,500.0000,'2024-02-23 09:42:57'),
(205,91,1,100.0000,'2024-02-25 11:00:01'),
(206,92,1,500.0000,'2024-02-25 11:49:02'),
(207,93,1,500.0000,'2024-02-25 11:51:51'),
(208,94,1,500.0000,'2024-02-25 12:08:51'),
(209,95,1,500.0000,'2024-03-01 09:54:53'),
(210,96,1,100.0000,'2024-03-02 11:35:28'),
(211,97,1,500.0000,'2024-03-03 01:22:28'),
(212,98,1,100.0000,'2024-03-22 10:56:22'),
(213,99,1,500.0000,'2024-03-22 11:01:13'),
(214,100,1,500.0000,'2024-03-22 11:16:55'),
(215,101,1,5000.0000,'2024-03-24 00:49:11'),
(216,102,1,50.0000,'2024-03-24 00:50:49'),
(217,103,1,500.0000,'2024-03-25 12:23:35'),
(218,104,1,100.0000,'2024-03-25 12:23:42'),
(219,105,1,500.0000,'2024-04-12 02:34:28'),
(220,106,1,100.0000,'2024-04-12 02:35:19'),
(221,107,1,10000.0000,'2024-04-12 03:19:49'),
(222,108,1,10000.0000,'2024-04-12 03:19:52'),
(223,109,1,10000.0000,'2024-04-12 03:25:29'),
(224,110,1,50.0000,'2024-04-12 03:27:19'),
(225,111,1,50.0000,'2024-04-12 03:27:20'),
(226,112,1,50.0000,'2024-04-12 03:27:40'),
(227,113,1,50.0000,'2024-04-13 08:55:18'),
(228,114,1,100.0000,'2024-05-08 09:14:10'),
(229,115,1,500.0000,'2024-05-11 11:46:48'),
(230,116,1,1000.0000,'2024-05-11 13:10:25'),
(231,117,1,10000.0000,'2024-05-18 10:38:38'),
(232,118,1,10000.0000,'2024-05-18 10:38:41'),
(233,119,1,100.0000,'2024-05-18 10:39:05'),
(234,120,1,10000.0000,'2024-05-18 11:23:41'),
(235,121,1,10000.0000,'2024-05-18 11:23:43'),
(236,122,1,10000.0000,'2024-05-18 11:24:07'),
(237,123,1,10000.0000,'2024-05-18 11:27:00'),
(238,124,1,10000.0000,'2024-05-18 11:27:02'),
(239,125,1,10000.0000,'2024-05-18 11:27:27'),
(240,126,1,500.0000,'2024-05-18 11:43:56'),
(241,127,1,500.0000,'2024-05-18 11:47:08'),
(242,128,1,500.0000,'2024-05-18 11:53:15'),
(243,129,1,100.0000,'2024-05-18 15:05:36'),
(244,130,1,500.0000,'2024-05-19 04:02:43');
/*!40000 ALTER TABLE `order_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_return`
--

DROP TABLE IF EXISTS `order_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_return` (
  `order_return_id` int(11) NOT NULL AUTO_INCREMENT,
  `orderDetailId` int(11) DEFAULT NULL,
  `pre_orderDetailId_return` int(11) DEFAULT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `Qty` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_return_id`),
  KEY `FK_Order_return_OrderDetail_return` (`pre_orderDetailId_return`),
  KEY `FK_Order_return_OrderDetail` (`orderDetailId`),
  CONSTRAINT `FK_Order_return_OrderDetail` FOREIGN KEY (`orderDetailId`) REFERENCES `order_details` (`OrderDetailID`),
  CONSTRAINT `FK_Order_return_OrderDetail_return` FOREIGN KEY (`pre_orderDetailId_return`) REFERENCES `order_details` (`OrderDetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_return`
--

LOCK TABLES `order_return` WRITE;
/*!40000 ALTER TABLE `order_return` DISABLE KEYS */;
INSERT INTO `order_return` VALUES
(9,547,541,'2024-04-12 08:49:49','2024-04-12 14:19:49',-1.00),
(10,548,545,'2024-04-12 08:49:49','2024-04-12 14:19:49',-1.00),
(11,550,541,'2024-04-12 08:49:52','2024-04-12 14:19:52',-1.00),
(12,551,545,'2024-04-12 08:49:52','2024-04-12 14:19:52',-1.00),
(13,553,541,'2024-04-12 08:55:29','2024-04-12 14:25:29',-1.00),
(14,554,545,'2024-04-12 08:55:29','2024-04-12 14:25:29',-1.00);
/*!40000 ALTER TABLE `order_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_summary_processed`
--

DROP TABLE IF EXISTS `order_summary_processed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_summary_processed` (
  `order_summary_processedId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) DEFAULT NULL,
  `GrossAmount_total` decimal(10,2) DEFAULT NULL,
  `LineDiscountAmount_total` decimal(10,2) DEFAULT NULL,
  `OverallDiscountAmount` decimal(10,2) DEFAULT NULL,
  `All_DiscountAmount_total` decimal(10,2) DEFAULT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  `Adjusted_subtotal` decimal(10,2) DEFAULT NULL,
  `GrandTotal` decimal(10,2) DEFAULT NULL,
  `LineTaxAmount_total` decimal(10,2) DEFAULT NULL,
  `Overall_TaxAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_summary_processedId`),
  KEY `FK_order_summary_processed_OrderHeader` (`OrderId`),
  CONSTRAINT `FK_order_summary_processed_OrderHeader` FOREIGN KEY (`OrderId`) REFERENCES `order_header` (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_summary_processed`
--

LOCK TABLES `order_summary_processed` WRITE;
/*!40000 ALTER TABLE `order_summary_processed` DISABLE KEYS */;
INSERT INTO `order_summary_processed` VALUES
(69,2,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(70,3,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(71,4,7.50,0.00,0.00,0.00,7.50,7.50,8.10,0.00,0.60),
(72,5,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(73,6,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(74,7,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(75,8,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(76,9,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(77,10,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(78,11,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(79,12,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(80,13,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(81,14,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(82,15,13.50,0.00,0.00,0.00,13.50,13.50,14.58,0.00,1.08),
(83,16,13.50,0.00,0.00,0.00,13.50,13.50,14.58,0.00,1.08),
(84,17,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(85,18,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(86,19,4.70,0.00,0.00,0.00,4.70,4.70,5.08,0.00,0.38),
(87,20,3.00,0.00,0.00,0.00,3.00,3.00,3.24,0.00,0.24),
(88,21,3.00,0.00,0.00,0.00,3.00,3.00,3.24,0.00,0.24),
(89,22,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(90,23,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(91,24,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(92,25,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(93,26,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(94,27,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(95,28,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(96,29,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(97,30,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(98,31,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(99,32,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(100,33,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(101,34,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(102,35,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(103,36,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(104,37,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(105,38,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(106,39,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(107,40,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(108,41,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(109,42,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(110,43,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(111,44,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(112,45,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(113,46,3.20,0.00,0.00,0.00,3.20,3.20,3.46,0.00,0.26),
(114,47,5.60,0.00,0.00,0.00,5.60,5.60,6.05,0.00,0.45),
(115,48,5.60,0.00,0.00,0.00,5.60,5.60,6.05,0.00,0.45),
(116,49,5.20,0.00,0.00,0.00,5.20,5.20,5.62,0.00,0.42),
(117,50,5.20,0.00,0.00,0.00,5.20,5.20,5.62,0.00,0.42),
(118,51,5.20,0.00,0.00,0.00,5.20,5.20,5.62,0.00,0.42),
(119,52,4.40,0.00,0.00,0.00,4.40,4.40,4.75,0.00,0.35),
(120,53,4.40,0.00,0.00,0.00,4.40,4.40,4.75,0.00,0.35),
(121,54,4.40,0.00,0.00,0.00,4.40,4.40,4.75,0.00,0.35),
(122,55,4.40,0.00,0.00,0.00,4.40,4.40,4.75,0.00,0.35),
(123,56,4.40,0.00,0.00,0.00,4.40,4.40,4.75,0.00,0.35),
(124,57,6.40,0.00,0.00,0.00,6.40,6.40,6.91,0.00,0.51),
(125,58,5003.20,90.32,500.00,590.32,4912.88,4412.88,4765.91,0.00,353.03),
(126,59,6.00,0.00,0.00,0.00,6.00,6.00,6.48,0.00,0.48),
(127,60,4.40,0.00,0.00,0.00,4.40,4.40,4.75,0.00,0.35),
(128,61,9.10,0.00,0.00,0.00,9.10,9.10,9.83,0.00,0.73),
(129,62,3.20,0.00,0.00,0.00,3.20,3.20,3.46,0.00,0.26),
(130,63,20.70,0.11,0.00,0.11,20.59,20.59,22.24,0.00,1.65),
(131,64,1.20,0.00,0.00,0.00,1.20,1.20,1.30,0.00,0.10),
(132,65,5.00,0.00,0.00,0.00,5.00,5.00,5.40,0.00,0.40),
(133,66,5.00,0.00,0.00,0.00,5.00,5.00,5.40,0.00,0.40),
(134,67,3.90,0.00,0.00,0.00,3.90,3.90,4.21,0.00,0.31),
(135,68,17.20,0.00,0.00,0.00,17.20,17.20,18.58,0.00,1.38),
(136,69,211.00,0.00,0.00,0.00,211.00,211.00,227.88,0.00,16.88),
(137,70,7.80,0.00,0.00,0.00,7.80,7.80,8.42,0.00,0.62),
(138,71,11.40,0.00,0.00,0.00,11.40,11.40,12.31,0.00,0.91),
(139,72,5.00,0.00,0.00,0.00,5.00,5.00,5.40,0.00,0.40),
(140,73,10.70,0.00,0.00,0.00,10.70,10.70,11.56,0.00,0.86),
(141,74,10.00,0.00,0.00,0.00,10.00,10.00,10.80,0.00,0.80),
(142,75,675.00,0.00,0.00,0.00,675.00,675.00,729.00,0.00,54.00),
(143,76,205.50,0.00,0.00,0.00,205.50,205.50,221.94,0.00,16.44),
(144,77,151.60,0.00,0.00,0.00,151.60,151.60,163.73,0.00,12.13),
(145,78,222.00,0.00,0.00,0.00,222.00,222.00,239.76,0.00,17.76),
(146,79,210.30,0.00,0.00,0.00,210.30,210.30,227.12,0.00,16.82),
(147,80,178.30,0.00,0.00,0.00,178.30,178.30,192.56,0.00,14.26),
(148,81,27.30,0.00,0.00,0.00,27.30,27.30,29.48,0.00,2.18),
(149,82,229.00,0.00,0.00,0.00,229.00,229.00,247.32,0.00,18.32),
(150,83,19.10,0.00,0.00,0.00,19.10,19.10,20.63,0.00,1.53),
(151,84,9.00,0.00,0.00,0.00,9.00,9.00,9.72,0.00,0.72),
(152,85,210.50,0.00,0.00,0.00,210.50,210.50,227.34,0.00,16.84),
(153,86,10.30,0.00,0.00,0.00,10.30,10.30,11.12,0.00,0.82),
(154,87,208.80,0.00,0.00,0.00,208.80,208.80,225.50,0.00,16.70),
(155,88,11.50,0.00,0.00,0.00,11.50,11.50,12.42,0.00,0.92),
(156,89,2.50,0.00,0.00,0.00,2.50,2.50,2.70,0.00,0.20),
(157,90,11.60,0.00,0.00,0.00,11.60,11.60,12.53,0.00,0.93),
(158,91,12.00,0.00,0.00,0.00,12.00,12.00,12.96,0.00,0.96),
(159,92,211.60,0.00,0.00,0.00,211.60,211.60,228.53,0.00,16.93),
(160,93,476.30,0.00,19.05,19.05,476.30,457.25,493.83,0.00,36.58),
(161,94,440.25,0.00,0.00,0.00,440.25,440.25,475.47,0.00,35.22),
(162,95,443.20,0.00,0.00,0.00,443.20,443.20,478.66,0.00,35.46),
(163,96,9.30,0.00,0.00,0.00,9.30,9.30,10.04,0.00,0.74),
(164,97,28.90,0.00,0.00,0.00,28.90,28.90,31.21,0.00,2.31),
(165,98,12.60,0.00,0.00,0.00,12.60,12.60,13.61,0.00,1.01),
(166,99,220.50,0.00,0.00,0.00,220.50,220.50,238.14,0.00,17.64),
(167,100,19.40,0.00,0.00,0.00,19.40,19.40,20.95,0.00,1.55),
(168,101,1042.80,0.00,0.00,0.00,1042.80,1042.80,1126.22,0.00,83.42),
(169,102,2.50,0.40,0.00,0.40,2.10,2.10,2.27,0.00,0.17),
(170,103,104.25,18.00,0.00,18.00,86.25,86.25,93.15,0.00,6.90),
(171,104,5.00,0.00,0.00,0.00,5.00,5.00,5.40,0.00,0.40),
(172,105,108.00,0.00,0.00,0.00,108.00,108.00,116.64,0.00,8.64),
(173,106,23.00,0.00,0.00,0.00,23.00,23.00,24.84,0.00,1.84),
(174,107,943.00,0.00,500.00,500.00,943.00,443.00,478.44,0.00,35.44),
(175,108,943.00,0.00,500.00,500.00,943.00,443.00,478.44,0.00,35.44),
(176,109,943.00,0.00,500.00,500.00,943.00,443.00,478.44,0.00,35.44),
(177,110,17.00,0.00,0.00,0.00,17.00,17.00,18.36,0.00,1.36),
(178,111,17.00,0.00,0.00,0.00,17.00,17.00,18.36,0.00,1.36),
(179,112,4.40,0.00,0.00,0.00,4.40,4.40,4.75,0.00,0.35),
(180,113,9.50,0.00,0.00,0.00,9.50,9.50,10.26,0.00,0.76),
(181,114,88.25,0.20,0.00,0.20,88.05,88.05,95.09,0.00,7.04),
(182,115,13.20,0.00,0.00,0.00,13.20,13.20,14.26,0.00,1.06),
(183,116,649.10,0.00,0.00,0.00,649.10,649.10,701.03,0.00,51.93),
(184,117,952.00,0.00,500.00,500.00,952.00,452.00,488.16,0.00,36.16),
(185,118,952.00,0.00,500.00,500.00,952.00,452.00,488.16,0.00,36.16),
(186,119,7.00,0.00,0.00,0.00,7.00,7.00,7.56,0.00,0.56),
(187,120,952.00,0.00,500.00,500.00,952.00,452.00,488.16,0.00,36.16),
(188,121,952.00,0.00,500.00,500.00,952.00,452.00,488.16,0.00,36.16),
(189,122,952.00,0.00,500.00,500.00,952.00,452.00,488.16,0.00,36.16),
(190,123,952.00,0.00,500.00,500.00,952.00,452.00,488.16,0.00,36.16),
(191,124,952.00,0.00,500.00,500.00,952.00,452.00,488.16,0.00,36.16),
(192,125,952.00,0.00,500.00,500.00,952.00,452.00,488.16,0.00,36.16),
(193,126,103.00,0.00,0.00,0.00,103.00,103.00,111.24,0.00,8.24),
(194,127,6.10,0.00,0.00,0.00,6.10,6.10,6.59,0.00,0.49),
(195,128,101.50,0.00,0.00,0.00,101.50,101.50,109.62,0.00,8.12),
(196,129,3.20,0.00,0.00,0.00,3.20,3.20,3.46,0.00,0.26),
(197,130,8.75,0.00,0.00,0.00,8.75,8.75,9.45,0.00,0.70);
/*!40000 ALTER TABLE `order_summary_processed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_voided`
--

DROP TABLE IF EXISTS `order_voided`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_voided` (
  `order_voided_id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `order_voiding_reason_id` int(11) DEFAULT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`order_voided_id`),
  KEY `FK_OrderVoided_OrderHeader` (`orderId`),
  KEY `FK_OrderVoided_orderVoidingReason` (`order_voiding_reason_id`),
  CONSTRAINT `FK_OrderVoided_OrderHeader` FOREIGN KEY (`orderId`) REFERENCES `order_header` (`OrderId`),
  CONSTRAINT `FK_OrderVoided_orderVoidingReason` FOREIGN KEY (`order_voiding_reason_id`) REFERENCES `order_voiding_reason` (`order_voiding_reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_voided`
--

LOCK TABLES `order_voided` WRITE;
/*!40000 ALTER TABLE `order_voided` DISABLE KEYS */;
INSERT INTO `order_voided` VALUES
(15,111,2,'2024-04-13 20:37:07','2024-04-14 02:07:07'),
(16,109,6,'2024-04-14 09:55:27','2024-04-14 15:25:27'),
(17,110,6,'2024-04-14 10:32:46','2024-04-14 16:02:46'),
(18,107,2,'2024-04-14 10:41:39','2024-04-14 16:11:39'),
(19,104,2,'2024-04-14 10:41:49','2024-04-14 16:11:49'),
(20,103,2,'2024-04-14 10:43:50','2024-04-14 16:13:50'),
(21,100,2,'2024-04-14 10:44:04','2024-04-14 16:14:04'),
(22,86,2,'2024-04-14 10:44:12','2024-04-14 16:14:12'),
(23,9,2,'2024-04-14 10:44:51','2024-04-14 16:14:51'),
(24,122,2,'2024-05-19 07:42:35','2024-05-19 13:12:35');
/*!40000 ALTER TABLE `order_voided` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_voiding_reason`
--

DROP TABLE IF EXISTS `order_voiding_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_voiding_reason` (
  `order_voiding_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `ReasonName` varchar(100) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`order_voiding_reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_voiding_reason`
--

LOCK TABLES `order_voiding_reason` WRITE;
/*!40000 ALTER TABLE `order_voiding_reason` DISABLE KEYS */;
INSERT INTO `order_voiding_reason` VALUES
(1,'Customer Requested Change','Sometimes, customers change their mind after placing an order or want to modify items.'),
(2,'Product Unavailability','If certain items are out of stock or unavailable at the time of order fulfillment'),
(3,'Price Discrepancy','Cases where the price charged doesn\'t match the advertised or expected price, leading to a voided order due to a \"Price Discrepancy.'),
(4,'Employee Error','Errors made by the staff during order entry, payment processing, or inventory management'),
(5,'Customer Dissatisfaction','If a customer expresses dissatisfaction with a product or service after placing an order'),
(6,'Technical Issues','Issues related to the POS system, payment processing, or technical glitches leading to order cancellation'),
(7,'Other','Any other reaon');
/*!40000 ALTER TABLE `order_voiding_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `MethodId` int(11) NOT NULL,
  `MethodName` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`MethodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES
(1,'Cash','made in cash',''),
(2,'Card','made in card',''),
(3,'Check','made in check','\0'),
(4,'Credit','give for credits','\0');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProductId` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(50) NOT NULL,
  `MeasurementUnitId` int(11) NOT NULL,
  `ProductNo` varchar(100) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `UserLogId` int(11) NOT NULL,
  `ReorderLevel` decimal(10,2) DEFAULT NULL,
  `Barcode` varchar(100) DEFAULT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedDate_ServerTime` datetime DEFAULT NULL,
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  `DepartmentId` int(11) NOT NULL,
  `TaxRate_perc` decimal(10,2) DEFAULT NULL,
  `imageUrl` text DEFAULT NULL,
  PRIMARY KEY (`ProductId`),
  KEY `FK_Product_MeasurementUnit` (`MeasurementUnitId`),
  CONSTRAINT `FK_Product_MeasurementUnit` FOREIGN KEY (`MeasurementUnitId`) REFERENCES `measurement_unit` (`MeasurementUnitId`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES
(1,'Kimbula Bun',1,'000010',75.00,1,11.00,'00003','2023-12-21 16:55:56','2023-12-21 22:25:56','2024-03-24 22:10:45','2024-03-24 16:40:45',3,0.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy42eNh84OfqpFAK2Gce21d2PubBFe1y8vvQQuUk1sHus7R4moGWmht8wD8cxm1RCQlZY&usqp=CAU'),
(2,'Donut',1,'0000124',100.00,1,10.00,'00024','2023-12-21 16:56:40','2023-12-21 22:26:40','2024-03-24 22:11:51','2024-03-24 16:41:51',1,0.00,'data:image/jpeg;base64,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'),
(3,'Cola Drink',3,'BEV001',1.50,1,10.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38','2024-05-19 14:19:57','2024-05-19 08:49:57',1,0.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgX2MXnSxTvw9RLn3ruANTY27fiz7h2ujIQw&usqp=CAU'),
(4,'Bottled Water 500ml',2,'BEV002',0.80,1,20.00,'22222','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-02-18 19:18:19','2024-02-18 13:48:19',2,0.00,'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYVFRgVFhYYGBgZGhoZGhwYFhohHhodHBoZGhkcHBwfIS8lHB4sHxkZJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHxISHz0nJSs9NDQ9PTY0PjQ0NDY0NDQ0NDQ0NT06NDQ2ND02NDY0MTQ1NjY0NjQ0PTQ0NDQ0NDQ9NP/AABEIARMAuAMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABgEDBAUHAgj/xAA/EAACAQIEAwYEAgkDAwUAAAABAgADEQQSITEFBkETIlFhcYEHMpGhQrEUI2JygpLB0fBSouEzQ8IVFySy0v/EABkBAQEBAQEBAAAAAAAAAAAAAAAEAgMBBf/EACkRAAIDAAEDBAEEAwEAAAAAAAABAgMRIRIxQQRRYXEiE5GhwYGx8BT/2gAMAwEAAhEDEQA/AOzREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQCkh/E+f8NRd6Rz50YqSUYrcGx1UE7+UmE+eOc66jGYhMwuKr39zca+8p9LTG2TTOdknFajpn/uAh1BUD9qjW99SBPDfEOkDY1KQt4o997bX8ZzhkfIe63yt+E9Tp0mgxws7X6sDv+2T+Rln/jh4OSuZ2Q/E3DL81RD+6lU/kpmx4L8QcFiayYem7Go97dxgtwpYi7AdFPSfPzOLbj5T1m/+GS5uK4e3Rqh9hSqSeyiMU2dYzbPpKIiRHQREQBERAEREAREQBERAEREAREQBESkATi/NHJdepjatTs1Ic5+5U3uSAWzjQ93UD2M7K7gAk6AamQ7H8ZZqpZFUrlsM1xfLmPzX038JV6SU4zbicPUNdON4aEcs1iuqN/Cb/wDjItxPkSu9V2AqAEj/ALZPQdbzplLmsgIDh3YsNMhDbaG97W18Z4fj1ZiWGGcD9tlB+iq0pV9ik9SJ8WbFv9jly/Dyv4P/ACgfm0knIPKNahjVqlBampvmcXAcMpKhQbnfQ23myx3PvZ91qPeHQl7/AO5Flzl3npHxAWqmTtLIpBuLgZtT7xbOcoPUhCX5r8tOlRKCVnzC8REQBERAEREAREQBERAEREAREQCkRNFzfx5cFhnrHVvlpr/qc/KPTqfIT1LXiDeGs5m46narhQxBOrZfspP9PL64TYQOwpre27H9kXsD6jScw4XimrV0NRszvUUsQLbkG1/Ww8vy7bgsMBrbUn7X0EueVQWf8yFbbN72/o94bDKqqMo+m0vtSmcqaWngpJerSrpwjfG+DJXQqwF/wtbVT0IM5diuGulUUyuquBp1BBF/obzuLpITz5hVRUrqvfFRFJ/ZuW19x/uMposx9L8k3qK9XUu6/wBGx5B5jFdGw7k9tRABzCxZfHXcjY/8yZTh+O4utDEpiUBUH5XUXva2elUXow8QdiDY7zsfCeIJiKKVqZujqGB/MHwINxbynD1FajLV5O1E3KOPwZ8RE4HcREQBERAEREAREQBERAEREApOWc94SpjawN7UKQIU30J/E1up0sPL1k25u4uMNhne/ePcT95gdfYXPtOQ4/GVMT+rR1pUAO9mY3I8ztbyvrKfT1Sf5JE91sV+LZhcPekmJpIl2HaLdvHWyhR171j9POd6pJr7n85APh1yfTRUxbkO7XNPTuotyAwFzdj49BOk0l6xfNPheBVDFvuerTw4l6UIk+nfDHImn5gwna0KiW1ykr5MveX7gTf2lmogmoyx6jMo6sZwrGZGTIbXdQSvmBof3lvoRqLkajSSz4R44p2uFY6X7SmD06Pb6A+t/GePiFyhTW+MpDL3h2iqOrEAOttmuRced9NZouCYsUagqo4zoBYMGOfo17AWB/oJe8vg2u5Am6JpN8HcImJw7GLWppVXZ1BHlfceoNx7TLnzWseH0U9WorERB6IiIAiIgCIiAIiIAiIgHMPiljwGCMTlRCbDQl3uAdjpZTtrrpOf8Lr4d6yqypRRiFZ3u2Rdma7E6+Z0BPhJp8UsD/8AIDvcIyKFPQspNxrYX1Gl5zurwNspZSMl7As6DfYEXJBn0Yaq10+38nz5Z+o+r3/g+h+CPhxTSnh6iOiKFXK4bQDS5B3m2E5n8OMZh8JT7BsRSZ2bNZaTqwY7qzEd7bSdETHUzs6/WQzi0y2LTRkxLa1QdmB9CJH+O8vnEG64ipTI6KxtuCbgEHpMpJvng9baXHJJLzwxE0nAeE/oisr4mpUub/rG0XyW50HvNkmPpMSFqIxG4DqSPUAxnPA3jkscWwVPEUnosSFdbEg6ixBBHoQDOeYTCOxekE7UU2YZzTRwMrWzBmFzdADYXvoNJ0DG4sLdtDYg2U3JA108Df7SO4fFGgrtTAq52AOpBQtfQqFOY+mlh4SirqS4OFqi+5m8j1ny1qbDuo90NgNGFyABoLEX/ikrkP5EpNatUbMc7gAsyn5bggZVAAG1t9PKTCc71ljOlL2CKxETkdRERAEREAREQBERAEREAg/xB4kuT9Fy5mdc5GUEFQG7ovpc5T9POcuw/DdnQdw7gORl8cxVbJ4/STX4iVsmJYsr5eyQZkS9mJqBbm49hfeRDCYhMyFkqlmdCXACBhnGe4W4YEHpr5z6NMYxhvwQWtuWfJ03gGFwVRVaiyqVtcU66ko1vxMCGJ33JvrJdSUgfMT62P3mho8Do0dUd6Obcjui9uotkvp+JSZvadCwHezeZAuf5bD7SKTT8lcE14LpW+4B9RMWvw6m5u1Omx/apqfzmUAf8P8AxLdWqRsjN+6U/qwmEbZbGAp2y9mlvDItvpaY68NRDdVVb72pqPuoH3vMkOx/Bb95h/TNMVq65gjPTVzqFzAtb0NifpNLTLwwOOYvD0lzVnUG1luVufIWBaRCliXS1Za3aEIciF0AAfTMVRbKbG4LAaDa8lHMfDqbJevUYoDstOnb6lS30N5Fnp0ijU6Zp5L2VGABI6ZmcadTt1ErpSaJbZNPglPIXHhiqFiLPSsreDXF1cDpex08QZKpBfh3RqK2IFSkKZHZAFdmUBwpBGh06gA63O8nQktySm0imptwTZWIiczoIiIAiIgCIiAIiIAiIgEM5+4UHRaqqGcELlIJDLcm9gQbi5185ztFas5GcvUZha7PckC+ikklRboBtuZLfiOxNUC4NkBCs2m5uQo1J228pzWvhGu1rqR0yE/fXfzN59CiL6CG5rrO54TjjBR26GmbakrUyfzlMo9yJuFcOvde19iuU2/MTE4LRC0KShStqaAqQdO6Lgg63v4z0OGqrZqYyHqF0VvYbHzHveRPPoqWr5L1Gm4+ZyT42Wx+2n+byzi6NdiDSronk9HOD9HU/eZisdj/AJ/eVax3H2nhrDWHDYu2uIojzGGb+tYylLCVNQ+JLm/4VVbeVlP53my06KPoJZqVcuuUD3AnqbMtI1GM4Nh7l3RncA2Lh2ANtNPlkEoYN2qMzVDkDO6oCxFi18xAuAeg3km5px2L0XDtSykWaysz/WxUD1kXrhTSIqhcx1IzbMNc10CrfyZjrbUbyymMmtb0ltkk8SOk8vYGnTpBkv8ArLOSQQSSL/KdV328SZt5DeQmt+kL+kCuAyHMGzalNb95gCbA2BP9JMpHYmpPSuD2KwrERMGxERAEREAREQBERAEREA5x8QuHVGqq4bKjKFLZ2UAgm97Hz95BcRQCOFNINpmFS9Q5iO8DcOBppqJ0rnnHuf1CUWcAKxYOi2Y3y2zb+P0nNKld0qEVELWbvBW7406NlIUa+Gs+lQ260mfOuSU21v8AR1PgPBaihXGPxFdDZgC62sRscysW/mWSF8UVIBRz4EZdfuPpI9y/w0hEq06r5XQMEqZCBmsfmCAg+xkiSoflYf2Pp0P+aSKXf3LIdvY9fpJP/bf3Cf8A6mFicflaxo4jbdVzDr0Vj+U2anwP1lbnw+lpjcOjWmn/APUltpRxLeRpv/5ECYtGq5fOMNVXwDuigW65UJ387yRX8vylt2PkPeaUsOco75I1xhcU63JSki6sSzFtPC3d+siWD4gz1ewzFluzXqFADlI2uulxfY6/aTTmPjNKmjI7AlhbKELA+OawNhaQRa+VWdEHe72YjLe51yufmbfpYfaV0qTj2wmtcU83WTXknhxpiu5pin2jiwGzBQQHA6XufW19LyVyNcoca/SFqJ2dRBRKKO1JzsCgIZri97g69RY9ZJZHY25PSutJRWFYiJg2IiIAiIgCIiAIiIAiIgHLPiHjKi4hkVit0U3BtobgkG1xsdpCamHF1ZmBBK3VGcWF9blVIUmx3udes6zz3RpFFZlRql7AMyglRqw1+b0HjObLRTEVQKSKhN1CotzbX8NwD9j5T6lEk6lxnufMvjJWbv0dS4JxbMqqMNVVbABi9Mj1uzhj9JIgQfAiR/h2MNkp1lBcra5pMoNrdGF7+QFvCZ44TQJzdmh9VBt6Hp6SCSWlsG89zZdnLVSrY273sjH7gWlKWFRRlCgDwtLdbhtNzdlFxpoSPyMx9nR74Lge+wb3BH52mNVYA2bKP4hf6bz1/wClUtsv+5v7zzS4ZRp3yIq31Nha/r4z1NGXpDebK6OVSoFdVa+UO6nbckp9gZphVRuzVC1Niw7PKaba2sCENvTvA76GT3mGkn6PVUZVLLva19RuZBeGt2bLWGRGRSo72a+YWtckLmJ9bby2qWx4XYjtjkuX3JJ8PlfPimeoauZqdn2zBVK2y/hIAAI9JNppuWcPSSgEpqEK27RMwJVyqsysRpexX2tNzIrHsm0W1rIpFYiJg2IiIAiIgCIiAIiIAiIgHP8AntE7Qs65gqL8zWXd9NdB46Anac7d0ap3ez7zBV72QC5sNL7ebH6TpfPXAzUYVw6ooVUbMDp3jYi3jmt7TnePwbI2UkVgP9LMQNdRY6fSfUpcXWsfOHy7lJTerjTtPDVHZIl1ayKDZgwJAF/XWZfYW1XTy/t4SK8F4TQKI+HFC5AYg0aea9tQSBcMJv6Zr6f9PzFmH0sbGfPks8l8X8GcpPXWDbznhc53C+xP9pj4rthfswjHSwZyo89QjflMo22ZV/X3MsVmtrYD1/wTCAxR3Sl713IHstJb+5nn9DxBNzUprtolHXzuzMfymkl7mG37Ec55q1ci5ahVWYLrYKD0/AST/GLeE1K4NhSXNnrMdD3s9uvdUtYa20Kj32kh5s4YBQqV2eozKBZc5yAlgPkv5+MinL75qiqztkUFiBT1LW0W4vcE+wldcl0ceCacX1c+fkknwwUKmIQI6ZaoBD/MTkFyQdRr09JO5oeVeG1KNNjVYM7vm8bLYBQW3Y2G5Jm+kdjTk2iutZFJlYiJg2IiIAiIgCIiAIiIAiIgEG5/4jUUCmoQpZWbNqSSWAGXcjS+hB9gZAcNihScrVRKh0OUVKiHxFip036gyYfE0vdFXKAy2zMCdi1xva+o/Cd9xIRwSqtOupLsSpuoykjOt8umoa5IFraXn0asVXY+dam7OWdfw3CiMrI9RTlAyM2ZRsbaWJPTMbzY02Yd1h/Y+h6/YzRYPmJ10r0aiG4F8gA18e9p6WBm6HEUbQrUHrSqfnlt95HJS88lkenxwZqODsZ6v5TETEi9hmP8LA/lYytbEIvzOF9WtvtOeG9Mm/lLNRvQe/8ASYlTiNNTa5Y2vorH72t95r63GNbLTqHW3yN+QG3nebjBszKSRh84caSlT7Nr3fQXQFdNSbNvI3gUU02swRWW4Nu61zqoCCwJ0/EW6W1m05hzumdqXdTvF3RFCDqbOC1/Q29ZoMJj1rWo9k2IJbNl7I2AAtmJDC7WJ8Bra8rrSjEksbcvP7E45HxtSrQY1MoyuUVUAAVQqWWwJta506XtJNItyJQCUauVOzVq7lRe4IAVbjy7pHsfWSmR2Z1vCyvelaViImDYiIgCIiAIiIAiIgCIiARXnjjAw9EDTOxBBsDlHUm+wPy38+k5jRf9KqKAGZ3JVQmUZtCxGY936+km3xINvO6ABdLXBfW5IA338hoZzBFJdGenUy3GY0mAIQHvEEgDNbYk2n0KElXq7nz7m5Tx9jrnCeO10K0cXQdNABUZkZWIsLZlVVDH1kpoZfw6fsnb2HT20mu4FxWnWRQi1AuUAdoAdLdWBIJ95sDQy/KNOoHT93w9JJJ6+2FcFi76ZYgiWkJtpqPvKs9uk54b0rkHhPFQgeEdp5CY9So3kPaaSPGzXcz0hUw1WmSyh1y3C3sbi3dJBbXpIDwvhAoU3xDI7AC1xoCCQtsitcrc6300m45o5dxOIfOuJY0joUKsQvoFFn+nvMMVWpIcOMQ+cpkRKjrmYtYaKpuNNBcsANhKqlkeH9/BNY25cr6+SecvcTp4ilemQQh7NrKVAZQpNgdh3gR6zbSI/DtSMO4OW3atbLb/AEoDmA2bMDe/22EuktiyTRTW9imViImDYiIgCIiAIiIAiIgCIiARfnPh9J6YrVGZcml0FyQxtbbQanXzM5Fj1UsHTtnS9kdqLWJvsGyANfy1nSfiO1TsqmViqrRzKQTfNmbNt+yBrbScKGIqO2YszW0zMzE+WpN5bTJqGMktgnJs7bwnlbBYhKdekHUmzWdWIJ6g7HxF7yVUOE0xpkK+lRyvsb6fQSvBsKFo0gUFMiml0U3CHKLqD1ses2QBG2o+/wDzJ5WSfk6xrUeyLWGwSoSVLa+Ls3/2JmSwnlT4fQz2Zz17ydM4LPZ+dvSYdXALmLEuSf23+wvYe02FpaqD/AJpNhoiXPtEJgnZEJcFLFblhdxc332vIHyzRelVGJeldEVj39LG1g1iCTa972950rnDEVVwtVqGbOq3uCL2B7xF/K59pAeF1KGKpJg3aqmJqm5qh1YMVuwRgWuqbHIvVQd53hL8WmTzj+SaOocv8Mp4eiqU9QbsWvcszalib63m1kX5ArhsIqBg4pE0gwJIIWxB120a1vACSiTzTUnpRBpxWFYiJk0IiIAiIgCIiAIiIAiIgES50w5KOx+Xs9zsCpYm/sw+k4ZxAZWuFGU6iw0M+gec8E9bB10p/wDUyMVH+o2N19wSPUifPfDKquppOe7a6E/hPl5ajT1lvp5bHpI74ZLrPpfB1AyIw2ZFYe4B/rMgTS8oVs+Cwza37Gmpv4qoVvupm5WSNZwUp7ye5RhMTG8Qp0QC7WB8ifyExjx6jpYsb+CmFCT5SDlFcNmV+gpfMQSf2nYj+Umw+kyHXSY+Cxy1blc2m9wQPY7GZTbQ9T5PVjWo0XNtTJgsSdv1TgerDKPuZyLlCkEro+7olVx0FxScgeZvOj/E7FhMAy3s1SolNfPvBz7ZVP2nM+XmetiadFCR2memW62amyuw9AbyyjpVcpMju6pWRjH7Oq/DbC5MBTOv6wvU18GY5fYqAfeSyWcPRWmioosqKFUDoALAfQS9IpPW2WRjiwrERPDQiIgCIiAIiIAiIgCIiAUnF+euTVw9RsRSVxTYljlFwpYksunyrqbXv4eU7RLNU9DtOlU3CWmLIdcc3DmHIPMVVUFIUc1FQTmLEMCSS2UZe8L9LaG/e8NpxnniylaYs1/lJswHo3WSYcDoAlkQIx3yd0bk/L8u53tNDxTlN3culUA+Yy/UgG+npK650OXVNElkLYxyLIKvNOIZiWrOvkQSLepv+U2Q5qfKoL0DbUE09f8An6TKrct4xC16ZdD/AKGQ+ujNp47SvD+WWbWtQqAjUWQWPk2h8ftLv1aGuyI/07t8ow15yr5we0Zh4ILKPQEASYcM5wDhVZbud1U3I8M1hYaegmJw7lywB7Ahrk3bIMvkOpt6f2m+wfByt8z6N0Xp46mTX2enksSRRTXcnuv/ACQznKlUxNWiK2VEBZUCtcAsLktmUXYgCw8ja83PI/KooN27JZguVMws+vzMQNFuNLb+klCYOmjZsoLAWDHVgPAE/KPSZVI6yOVux6YrEVxqyXVJ6zIiIk53EREAREQBERAEREAREQBERAPDmwmM7S5iDMdT1mkZZfpoRKlLzwKs9qxnp6OzgJPWaeSxngK5ZW0855VWnoLVVesUjqBLt5aICtAMyJ4U/nPcweiIiAIiIAiIgCIiAIiIAiIgGJit/aWYibXYyy5Rl5pSJ4zw9LKmIg0UtBERPAVCyroPCIgFUnuInh6IiIAiIgCIiAf/2Q=='),
(5,'Whole Wheat Bread',3,'BAK001',2.00,1,15.00,'123456789012501','2023-12-21 18:09:38','2023-12-21 23:39:38','2024-05-12 13:39:54','2024-05-12 08:09:54',2,0.00,'data:image/jpeg;base64,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'),
(6,'Croissant',3,'BAK002',1.20,1,20.00,NULL,'2023-12-21 18:09:38','2023-12-21 23:39:38',NULL,NULL,1,0.00,'data:image/jpeg;base64,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'),
(7,'Orange Juice 1L',2,'BEV003',2.50,1,15.00,'1234567890125','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-18 19:17:50','2024-02-18 13:47:50',2,0.00,'data:image/jpeg;base64,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'),
(8,'Energy Drink 250ml',3,'BEV004',2.00,1,10.00,'1234567890126','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-18 21:10:47','2024-02-18 15:40:47',1,0.00,'data:image/jpeg;base64,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'),
(9,'Chocolate Cake',3,'BAK003',5.00,1,10.00,'1234567890129','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,0.00,'data:image/jpeg;base64,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'),
(10,'Blueberry Muffins',3,'BAK004',3.00,1,12.00,'1234567890130','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,0.00,'data:image/jpeg;base64,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'),
(11,'Canned Tuna 150g',1,'CAN001',1.75,1,25.00,'1234567890131','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,2,0.00,'data:image/jpeg;base64,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'),
(12,'Tomato Soup',1,'CAN002',1.50,1,30.00,'1234567890132','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,0.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi3Loq6RgxoA4eycE73loNxHI6iZbT1ONAzw&usqp=CAU'),
(13,'Granulated Sugar 1kg',1,'DRY010',1.10,1,20.00,'1234567890222','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,0.00,'data:image/jpeg;base64,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'),
(14,'product tenance-38, terminal-10, session-1455446l6',1,'0000149',150.50,1,10.00,'00024','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-05-19 13:02:01','2024-05-19 07:32:01',2,0.00,'data:image/jpeg;base64,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'),
(15,'Beef Steak 1kg',1,'MEA030',8.00,1,5.00,'1234567890422','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,0.00,NULL),
(16,'Multipurpose Cleaner 1L',2,'CLE040',3.50,1,15.00,'1234567890522','2023-12-21 18:11:53','2023-12-21 23:41:53','2024-02-25 22:57:40','2024-02-25 17:27:40',1,0.00,NULL),
(17,'Kitchen Towels (pack)',4,'PAP050',2.50,1,20.00,'1234567890622','2023-12-21 18:11:53','2023-12-21 23:41:53',NULL,NULL,1,0.00,NULL),
(18,'Frozen Pizza',3,'FRZ021',5.00,1,15.00,'1234567890323','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(20,'Vegetable Stir Fry Mix',1,'FRZ023',4.00,1,10.00,'1234567890325','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(21,'Frozen Berries Mix 500g',1,'FRZ024',4.50,1,8.00,'1234567890326','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(22,'Chicken Breast 1kg',1,'MEA026',6.50,1,6.00,'1234567890328','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(23,'Pork Chops 1kg',1,'MEA027',7.00,1,7.00,'1234567890329','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(24,'Lamb Ribs 1kg',1,'MEA028',9.00,1,4.00,'1234567890330','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(25,'Apples 1kg',1,'PRD029',2.50,1,20.00,'1234567890331','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(26,'Bananas 1kg',1,'PRD030',1.80,1,25.00,'1234567890332','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(27,'Tomatoes 1kg',1,'PRD031',3.00,1,15.00,'1234567890333','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(28,'Lettuce Head',3,'PRD032',1.20,1,30.00,'1234567890334','2023-12-21 18:16:28','2023-12-21 23:46:28','2024-02-17 20:21:14','2024-02-17 14:51:14',1,0.00,NULL),
(29,'Carrots 1kg',1,'PRD033',2.00,1,20.00,'1234567890335','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(30,'Onions 1kg',1,'PRD034',1.50,1,25.00,'1234567890336','2023-12-21 18:16:28','2023-12-21 23:46:28','2024-02-18 21:32:18','2024-02-18 16:02:18',1,0.00,NULL),
(31,'Glass Cleaner 500ml',2,'CLN036',2.80,1,20.00,'1234567890338','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(32,'Dishwashing Liquid 750ml',2,'CLN037',2.50,1,18.00,'1234567890339','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(33,'Disinfectant Wipes (pack)',4,'CLN038',4.00,1,10.00,'1234567890340','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(34,'Toilet Cleaner 500ml',2,'CLN039',3.00,1,15.00,'1234567890341','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(35,'Laundry Detergent 2L',2,'CLN040',5.50,1,12.00,'1234567890342','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(36,'Toilet Paper (pack)',4,'PPG041',2.50,1,20.00,'1234567890343','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(37,'Kitchen Towels (pack)',4,'PPG042',3.00,1,15.00,'1234567890344','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(38,'Facial Tissues (box)',5,'PPG043',1.50,1,30.00,'1234567890345','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(39,'Disposable Plates (pack)',4,'PPG044',3.50,1,10.00,'1234567890346','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(40,'Paper Cups (pack)',4,'PPG045',2.00,1,20.00,'1234567890347','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(41,'Garbage Bags (pack)',4,'PPG046',4.00,1,15.00,'1234567890348','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(42,'Aluminum Foil (roll)',3,'PPG047',2.80,1,20.00,'1234567890349','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(43,'Plastic Wrap (roll)',3,'PPG048',2.50,1,25.00,'1234567890350','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(44,'Napkins (pack)',4,'PPG049',1.80,1,30.00,'1234567890351','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(45,'Wax Paper (roll)',3,'PPG050',2.00,1,20.00,'1234567890352','2023-12-21 18:16:28','2023-12-21 23:46:28',NULL,NULL,1,0.00,NULL),
(46,'product tenance-38, terminal-10, session-11',1,'000011',150.50,1,10.00,'00024','2023-12-29 08:05:14','2023-12-29 13:35:14',NULL,NULL,1,0.00,NULL),
(49,'Example Product ed',1,'P123',10.50,123,5.00,'123456789','2023-12-29 08:36:34','2023-12-29 14:06:34',NULL,NULL,1,0.00,NULL),
(50,'Exam4ple Product ed',1,'P1234',10.50,123,5.00,'123456789','2023-12-29 08:37:14','2023-12-29 14:07:14',NULL,NULL,1,0.00,NULL),
(51,'Exam4ple P4roduct edk',1,'P14234',205.50,1,11.00,'00003','2023-12-29 08:37:56','2023-12-29 14:07:56','2023-12-29 19:08:25','2023-12-29 13:38:25',1,0.00,NULL),
(52,'product tenance-38, terminal-10, session-14',1,'000014',150.50,1,10.00,'00024','2023-12-29 16:18:37','2023-12-29 21:48:37',NULL,NULL,2,0.00,NULL),
(53,'product tenance-38, terminal-10, session-144',1,'0000144',150.50,1,10.00,'00024','2024-02-11 10:51:52','2024-02-11 16:21:52',NULL,NULL,2,NULL,NULL),
(54,'product tenance-38, terminal-10, session-145',1,'0000145',150.50,1,10.00,'00024','2024-02-14 18:20:06','2024-02-14 23:50:06',NULL,NULL,2,NULL,NULL),
(55,'product tenance-38, terminal-10, session-1455',1,'00001455',150.50,1,10.00,'00024','2024-02-14 18:29:42','2024-02-14 23:59:42',NULL,NULL,2,NULL,NULL),
(56,'dssd',2,'12224',222.00,1,4.00,'64654','2024-02-14 18:58:56','2024-02-15 00:28:56',NULL,NULL,2,NULL,NULL),
(57,'opopopo',2,'uuu676',10.00,1,1.00,'8768786','2024-02-14 19:17:03','2024-02-15 00:47:03',NULL,NULL,1,NULL,NULL),
(58,'mmmm',2,'212',200.00,1,10.00,'12121212','2024-02-16 09:03:17','2024-02-16 14:33:17','2024-02-16 14:33:56','2024-02-16 09:03:56',8,NULL,NULL),
(60,'product tenance-38, terminal-10, session-14554',1,'00001445',150.50,1,10.00,'00024','2024-02-16 09:45:56','2024-02-16 15:15:56','2024-02-18 12:56:05','2024-02-18 07:26:05',2,NULL,NULL),
(61,'product tenance-38, terminal-10, session-145544',1,'0000062',150.50,1,10.00,'00024','2024-02-16 09:53:14','2024-02-16 15:23:14',NULL,NULL,2,NULL,NULL),
(62,'product tenance-38, terminal-10, session-14554466',1,'000014466',150.50,1,10.00,'00024','2024-02-16 09:54:03','2024-02-16 15:24:03','2024-02-18 12:55:54','2024-02-18 07:25:54',2,NULL,NULL),
(66,'Duuriyam Drink',3,'00067',667.00,1,10.00,'5466465','2024-02-16 10:14:57','2024-02-16 15:44:57','2024-02-16 15:45:29','2024-02-16 10:15:29',2,NULL,NULL),
(67,'ddd',2,'00068',1222.00,1,1.00,'2343244','2024-02-17 12:34:39','2024-02-17 18:04:39','2024-02-17 18:13:22','2024-02-17 12:43:22',2,NULL,NULL),
(68,'Orange Juice 1Ldd',2,'00069',2.50,1,15.00,'1234567890125','2024-02-17 14:56:08','2024-02-17 20:26:08','2024-02-17 20:26:08','2024-02-17 14:56:08',2,NULL,NULL),
(69,'Orange Juice 1Lqqq',2,'00070',11.00,1,11.00,'2525315','2024-02-18 07:25:36','2024-02-18 12:55:36','2024-02-18 12:55:36','2024-02-18 07:25:36',3,NULL,NULL),
(70,'Orange Juice 1L4',2,'BEV0034',2.50,1,15.00,'1234567890125','2024-05-18 14:35:47','2024-05-18 20:05:47','2024-05-18 20:05:47','2024-05-18 14:35:47',2,NULL,NULL),
(71,'product 0006466',1,'0006466',150.50,1,10.00,'00024','2024-05-19 07:32:38','2024-05-19 13:02:38','2024-05-19 13:02:38','2024-05-19 07:32:38',2,NULL,NULL),
(72,'Orankkk',2,'BEV77',2.50,1,15.00,'1234567890125','2024-05-19 07:41:59','2024-05-19 13:11:59','2024-05-19 13:11:59','2024-05-19 07:41:59',2,NULL,NULL),
(73,'Orange Juice k',2,'00074',2.50,1,15.00,'','2024-05-19 09:38:06','2024-05-19 15:08:06','2024-05-19 15:08:06','2024-05-19 09:38:06',3,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `ProductId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductId`,`CategoryId`),
  KEY `FK_ProductCategory_Category` (`CategoryId`),
  CONSTRAINT `FK_ProductCategory_Category` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`),
  CONSTRAINT `FK_ProductCategory_Product` FOREIGN KEY (`ProductId`) REFERENCES `product` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES
(1,4,'2024-03-24 16:40:45','2024-03-24 22:10:45'),
(1,6,'2024-03-24 16:40:45','2024-03-24 22:10:45'),
(2,6,'2024-03-24 16:41:35','2024-03-24 22:11:35'),
(3,3,'2024-02-16 09:01:47','2024-02-16 14:31:47'),
(3,4,'2024-02-16 09:01:39','2024-02-16 14:31:39'),
(4,3,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(5,6,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(6,6,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(7,3,'2023-12-28 20:48:42','2023-12-29 02:18:42'),
(7,6,'2024-02-17 12:52:38','2024-02-17 18:22:38'),
(8,3,'2023-12-28 20:48:42','2023-12-29 02:18:42'),
(8,5,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(9,6,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(10,6,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(11,1,'2023-12-28 20:48:42','2023-12-29 02:18:42'),
(11,7,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(12,1,'2023-12-28 20:48:42','2023-12-29 02:18:42'),
(12,7,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(13,9,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(14,1,'2024-02-16 08:52:09','2024-02-16 14:22:09'),
(14,2,'2024-05-19 07:32:01','2024-05-19 13:02:01'),
(15,1,'2023-12-28 20:48:42','2023-12-29 02:18:42'),
(15,11,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(16,13,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(17,14,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(18,10,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(20,10,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(21,10,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(22,11,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(23,11,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(24,11,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(25,2,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(25,12,'2023-12-28 20:48:42','2023-12-29 02:18:42'),
(26,2,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(26,12,'2023-12-28 20:48:42','2023-12-29 02:18:42'),
(27,2,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(27,12,'2023-12-28 20:48:42','2023-12-29 02:18:42'),
(28,2,'2023-12-28 20:48:42','2023-12-29 02:18:42'),
(28,12,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(29,12,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(30,9,'2024-02-18 16:02:18','2024-02-18 21:32:18'),
(30,12,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(31,13,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(32,13,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(33,13,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(34,13,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(35,13,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(36,14,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(37,14,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(38,14,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(39,14,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(40,14,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(41,14,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(42,14,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(43,14,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(44,14,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(45,14,'2023-12-28 20:48:29','2023-12-29 02:18:29'),
(55,1,'2024-02-14 18:29:42','2024-02-14 23:59:42'),
(55,2,'2024-02-14 18:29:42','2024-02-14 23:59:42'),
(56,3,'2024-02-14 18:58:56','2024-02-15 00:28:56'),
(56,4,'2024-02-14 18:58:56','2024-02-15 00:28:56'),
(56,5,'2024-02-14 18:58:56','2024-02-15 00:28:56'),
(56,7,'2024-02-14 18:58:56','2024-02-15 00:28:56'),
(56,8,'2024-02-14 18:58:56','2024-02-15 00:28:56'),
(57,2,'2024-02-14 19:17:03','2024-02-15 00:47:03'),
(57,3,'2024-02-14 19:17:03','2024-02-15 00:47:03'),
(57,11,'2024-02-14 19:17:03','2024-02-15 00:47:03'),
(58,4,'2024-02-16 09:03:17','2024-02-16 14:33:17'),
(58,11,'2024-02-16 09:03:17','2024-02-16 14:33:17'),
(60,1,'2024-02-16 09:45:56','2024-02-16 15:15:56'),
(60,2,'2024-02-16 09:45:56','2024-02-16 15:15:56'),
(61,1,'2024-02-16 09:53:14','2024-02-16 15:23:14'),
(61,2,'2024-02-16 09:53:14','2024-02-16 15:23:14'),
(62,1,'2024-02-16 09:54:03','2024-02-16 15:24:03'),
(62,2,'2024-02-16 09:54:03','2024-02-16 15:24:03'),
(66,5,'2024-02-16 10:14:57','2024-02-16 15:44:57'),
(67,3,'2024-02-17 12:43:22','2024-02-17 18:13:22'),
(67,4,'2024-02-17 12:34:39','2024-02-17 18:04:39'),
(67,5,'2024-02-17 12:34:39','2024-02-17 18:04:39'),
(68,3,'2024-02-17 14:56:08','2024-02-17 20:26:08'),
(68,4,'2024-02-17 14:56:08','2024-02-17 20:26:08'),
(69,3,'2024-02-18 07:25:36','2024-02-18 12:55:36'),
(69,4,'2024-02-18 07:25:36','2024-02-18 12:55:36'),
(69,5,'2024-02-18 07:25:36','2024-02-18 12:55:36'),
(70,2,'2024-05-18 14:35:47','2024-05-18 20:05:47'),
(71,1,'2024-05-19 07:32:38','2024-05-19 13:02:38'),
(71,2,'2024-05-19 07:32:38','2024-05-19 13:02:38'),
(72,1,'2024-05-19 07:41:59','2024-05-19 13:11:59'),
(73,3,'2024-05-19 09:38:06','2024-05-19 15:08:06');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_store`
--

DROP TABLE IF EXISTS `product_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_store` (
  `product_store_id` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  UNIQUE KEY `product_store_id_UNIQUE` (`product_store_id`),
  KEY `FK_product_store_store` (`storeId`),
  KEY `FK_product_store_product` (`productId`),
  CONSTRAINT `FK_product_store_product` FOREIGN KEY (`productId`) REFERENCES `product` (`ProductId`),
  CONSTRAINT `FK_product_store_store` FOREIGN KEY (`storeId`) REFERENCES `store` (`storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_store`
--

LOCK TABLES `product_store` WRITE;
/*!40000 ALTER TABLE `product_store` DISABLE KEYS */;
INSERT INTO `product_store` VALUES
(1,1,71),
(2,NULL,72),
(3,NULL,73);
/*!40000 ALTER TABLE `product_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returneditems_notinuse`
--

DROP TABLE IF EXISTS `returneditems_notinuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returneditems_notinuse` (
  `ReturnID` int(11) NOT NULL AUTO_INCREMENT,
  `StoreCreditID` int(11) NOT NULL,
  `OrderId` int(11) DEFAULT NULL,
  `ProductID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  PRIMARY KEY (`ReturnID`),
  KEY `StoreCreditID` (`StoreCreditID`),
  CONSTRAINT `returneditems_notinuse_ibfk_1` FOREIGN KEY (`StoreCreditID`) REFERENCES `storecredit` (`StoreCreditID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returneditems_notinuse`
--

LOCK TABLES `returneditems_notinuse` WRITE;
/*!40000 ALTER TABLE `returneditems_notinuse` DISABLE KEYS */;
/*!40000 ALTER TABLE `returneditems_notinuse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_end_details`
--

DROP TABLE IF EXISTS `session_end_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_end_details` (
  `sessionId` int(11) NOT NULL,
  `sessionEndDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `totalCostOfGoodsSold` decimal(10,4) DEFAULT NULL,
  `noOfCustomers` int(11) NOT NULL,
  `grossSales` decimal(10,4) DEFAULT NULL,
  `netSales` decimal(10,4) DEFAULT NULL,
  `totalDiscount` decimal(10,4) DEFAULT NULL,
  `numberOfTransactions` decimal(10,4) DEFAULT NULL,
  `noOfSoldItems` decimal(10,4) DEFAULT NULL,
  `noOfReturnedItems` decimal(10,4) DEFAULT NULL,
  `totalSold` decimal(10,4) DEFAULT NULL,
  `totalReturnsAndRefunds` decimal(10,4) DEFAULT NULL,
  `averageTransactionValue` decimal(10,4) DEFAULT NULL,
  `cashSales` decimal(10,4) DEFAULT NULL,
  `cardSales` decimal(10,4) DEFAULT NULL,
  `total_tax` decimal(10,4) DEFAULT NULL,
  `total_profit` decimal(10,4) DEFAULT NULL,
  `userLogId` int(11) NOT NULL,
  `DC_systemInfoId` int(11) NOT NULL,
  `terminalId` int(11) NOT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `closingCash` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`sessionId`),
  UNIQUE KEY `SessionId_UNIQUE` (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_end_details`
--

LOCK TABLES `session_end_details` WRITE;
/*!40000 ALTER TABLE `session_end_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_end_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_start_details`
--

DROP TABLE IF EXISTS `session_start_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_start_details` (
  `sessionId` int(11) NOT NULL AUTO_INCREMENT,
  `sessionName` varchar(50) NOT NULL,
  `openingCash` decimal(10,4) DEFAULT NULL,
  `sessionStartDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `isSessionEnded` bit(1) NOT NULL DEFAULT b'0',
  `userLogId` int(11) NOT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `DC_systemInfoId` int(11) NOT NULL,
  `terminalId` int(11) NOT NULL,
  PRIMARY KEY (`sessionId`),
  UNIQUE KEY `SessionId_UNIQUE` (`sessionId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_start_details`
--

LOCK TABLES `session_start_details` WRITE;
/*!40000 ALTER TABLE `session_start_details` DISABLE KEYS */;
INSERT INTO `session_start_details` VALUES
(1,'2023-09-27',1000.0000,'2023-12-22 17:55:33','\0',1,'2023-12-22 17:55:33','2023-12-22 23:25:33',20,1);
/*!40000 ALTER TABLE `session_start_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `storeId` int(11) NOT NULL AUTO_INCREMENT,
  `StoreCode` varchar(50) DEFAULT NULL,
  `StoreName` varchar(50) DEFAULT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  `ModifiedDate_ServerTime` datetime DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `emailAddress` varchar(50) DEFAULT NULL,
  `tel1` varchar(20) DEFAULT NULL,
  `tel2` varchar(20) DEFAULT NULL,
  `ManagerId` int(11) DEFAULT NULL,
  UNIQUE KEY `branchId_UNIQUE` (`storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES
(1,'001','Br1','2024-01-25 13:43:38','2024-01-25 19:13:38',NULL,NULL,'Br1 address','Br city','br Province','swpmskpererea@gmail.com','0011212','011254',NULL);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storecredit`
--

DROP TABLE IF EXISTS `storecredit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storecredit` (
  `StoreCreditID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `Amount` decimal(10,4) DEFAULT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1,
  `userLogId` int(11) NOT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `UTC_Offset` varchar(6) NOT NULL,
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`StoreCreditID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storecredit`
--

LOCK TABLES `storecredit` WRITE;
/*!40000 ALTER TABLE `storecredit` DISABLE KEYS */;
/*!40000 ALTER TABLE `storecredit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `SupplierId` int(11) NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Mobile` varchar(15) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `UserLogId` int(11) NOT NULL,
  `Tel` varchar(50) DEFAULT NULL,
  `ModifiedDate_Server` datetime DEFAULT NULL,
  `CreatedDate_Server` datetime NOT NULL DEFAULT current_timestamp(),
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  `SupplierCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SupplierId`),
  UNIQUE KEY `SupplierCode_UNIQUE` (`SupplierCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES
(1,'sup1','-','-','-',1,'1',NULL,'2023-09-05 21:57:33','2023-09-05 16:27:33',NULL,NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_info`
--

DROP TABLE IF EXISTS `system_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_info` (
  `systemInfoId` int(11) NOT NULL AUTO_INCREMENT,
  `StoreId` int(11) DEFAULT NULL,
  `TerminalId` int(11) DEFAULT NULL,
  `UTC_offset` varchar(45) NOT NULL,
  `CountryId` int(11) NOT NULL,
  `CurrencyId` int(11) NOT NULL,
  `PrimaryLanguageId` int(11) NOT NULL,
  `UserLogId` int(11) NOT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  `ModifiedDate_ServerTime` datetime DEFAULT NULL,
  `TaxRate` decimal(10,2) DEFAULT NULL,
  `CompanyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`systemInfoId`),
  KEY `FK_system_info_Country` (`CountryId`),
  KEY `FK_system_info_Currency` (`CurrencyId`),
  KEY `FK_system_info_Language` (`PrimaryLanguageId`),
  KEY `FK_system_info_Branch` (`StoreId`),
  KEY `FK_system_info_Terminal` (`TerminalId`),
  CONSTRAINT `FK_Geo_Info_Branch` FOREIGN KEY (`StoreId`) REFERENCES `store` (`storeId`),
  CONSTRAINT `FK_Geo_Info_Country` FOREIGN KEY (`CountryId`) REFERENCES `country` (`CountryId`),
  CONSTRAINT `FK_Geo_Info_Currency` FOREIGN KEY (`CurrencyId`) REFERENCES `currency` (`CurrencyID`),
  CONSTRAINT `FK_Geo_Info_Language` FOREIGN KEY (`PrimaryLanguageId`) REFERENCES `languages` (`LanguageID`),
  CONSTRAINT `FK_system_info_Terminal` FOREIGN KEY (`TerminalId`) REFERENCES `terminal` (`TerminalId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_info`
--

LOCK TABLES `system_info` WRITE;
/*!40000 ALTER TABLE `system_info` DISABLE KEYS */;
INSERT INTO `system_info` VALUES
(1,1,1,'5:30',1,1,1,1,'2024-01-25 13:48:14','2024-01-25 19:18:14',NULL,NULL,8.00,1);
/*!40000 ALTER TABLE `system_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terminal` (
  `TerminalId` int(11) NOT NULL AUTO_INCREMENT,
  `TerminalName` varchar(50) NOT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedDate_ServerTime` datetime DEFAULT NULL,
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  PRIMARY KEY (`TerminalId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal`
--

LOCK TABLES `terminal` WRITE;
/*!40000 ALTER TABLE `terminal` DISABLE KEYS */;
INSERT INTO `terminal` VALUES
(1,'Testing Terminal 2','2024-01-25 16:20:51','2024-01-25 21:50:51',NULL,'2024-01-25 22:01:14'),
(2,'test 2','2024-01-25 16:20:51','2024-01-25 21:50:51',NULL,'2024-01-25 21:59:51'),
(10,'Store A','2024-01-25 16:20:51','2024-01-25 21:50:51',NULL,'2024-01-25 21:59:51'),
(11,'Store B','2024-01-25 16:20:51','2024-01-25 21:50:51',NULL,'2024-01-25 21:59:51'),
(12,'Store C','2024-01-25 16:20:51','2024-01-25 21:50:51',NULL,'2024-01-25 21:59:51');
/*!40000 ALTER TABLE `terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_assign_to_terminal`
--

DROP TABLE IF EXISTS `user_assign_to_terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_assign_to_terminal` (
  `userAssignToTerminal_Id` int(11) NOT NULL AUTO_INCREMENT,
  `TerminalId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`userAssignToTerminal_Id`),
  KEY `FK_Terminal_UserAssignToTerminal` (`TerminalId`),
  KEY `FK_UserRegistration_UserAssignToTerminal` (`userId`),
  CONSTRAINT `FK_Terminal_UserAssignToTerminal` FOREIGN KEY (`TerminalId`) REFERENCES `terminal` (`TerminalId`),
  CONSTRAINT `FK_UserRegistration_UserAssignToTerminal` FOREIGN KEY (`userId`) REFERENCES `user_registration` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_assign_to_terminal`
--

LOCK TABLES `user_assign_to_terminal` WRITE;
/*!40000 ALTER TABLE `user_assign_to_terminal` DISABLE KEYS */;
INSERT INTO `user_assign_to_terminal` VALUES
(3,1,1);
/*!40000 ALTER TABLE `user_assign_to_terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_registration`
--

DROP TABLE IF EXISTS `user_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_registration` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(500) DEFAULT NULL,
  `passwordHash` text DEFAULT NULL,
  `passwordSalt` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayName` varchar(100) DEFAULT NULL,
  `profilePic` varchar(50) DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'1',
  `CreatedDate_UTC` datetime DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime DEFAULT current_timestamp(),
  `ModifiedDate_UTC` datetime DEFAULT NULL,
  `ModifiedDate_ServerTime` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_registration`
--

LOCK TABLES `user_registration` WRITE;
/*!40000 ALTER TABLE `user_registration` DISABLE KEYS */;
INSERT INTO `user_registration` VALUES
(1,'spmskperera@gmail.com','ab903dce3846459597d741057106b96b11fc3e23','$2b$10$fszGAcRXm1aT6mRLkdRwW.','spmskperera@gmail.com','UserA SP','hh','','2023-10-08 19:20:02','2023-10-09 00:50:02',NULL,NULL);
/*!40000 ALTER TABLE `user_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlog` (
  `LogId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `LoginTime_UTC` datetime NOT NULL,
  `LoginStatus` varchar(10) NOT NULL,
  `IpAddress` varchar(45) NOT NULL,
  `UserAgent` varchar(255) DEFAULT NULL,
  `SessionId` varchar(255) DEFAULT NULL,
  `AdditionalInfo` text DEFAULT NULL,
  `CreatedDate_UTC` datetime NOT NULL DEFAULT utc_timestamp(),
  `CreatedDate_ServerTime` datetime NOT NULL DEFAULT current_timestamp(),
  `GMT_Offset` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`LogId`),
  CONSTRAINT `userlog_chk_1` CHECK (`LoginStatus` = _utf8mb4'FAILED' or `LoginStatus` = _utf8mb4'SUCCESS')
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlog`
--

LOCK TABLES `userlog` WRITE;
/*!40000 ALTER TABLE `userlog` DISABLE KEYS */;
INSERT INTO `userlog` VALUES
(1,1,'2024-01-28 16:44:12','SUCCESS','192.168.1.1','Mozilla/5.0','session123','Some additional info','2024-01-28 11:14:12','2024-01-28 16:44:12','+00:00');
/*!40000 ALTER TABLE `userlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lbposc_light'
--

--
-- Dumping routines for database 'lbposc_light'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `IsDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `IsDate`(input VARCHAR(255)
) RETURNS int(11)
    DETERMINISTIC
if STR_TO_DATE(input, '%Y-%m-%d') IS NOT NULL then
return true;
else
return false;
end if ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `isNumeric` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isNumeric`(input VARCHAR(255)
) RETURNS int(11)
    DETERMINISTIC
RETURN input REGEXP '^-?[0-9]+\\.?[0-9]*$' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculation_CalculateLineTotals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculation_CalculateLineTotals`(
    IN p_unitPrice DECIMAL(10, 2),
    IN p_qty INT,
    IN p_lineTaxRate DECIMAL(5, 2),
    IN p_lineDiscountAmount DECIMAL(10, 2),  -- Assuming this is provided as input for discount on the line item
    OUT p_grossAmount DECIMAL(10, 2),
    OUT p_netAmount DECIMAL(10, 2),
    OUT p_lineTaxAmount DECIMAL(10, 2)
)
BEGIN
    -- Calculate gross amount
    SET p_grossAmount = p_unitPrice * p_qty;

    -- Calculate net amount after discount
    SET p_netAmount = p_grossAmount - p_lineDiscountAmount;

    -- Calculate line tax on the net amount
 SET p_lineTaxAmount = p_netAmount * (p_lineTaxRate/100);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculation_CalculateOrderTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculation_CalculateOrderTotal`(
    IN p_subTotal DECIMAL(10, 2),
    IN p_orderDiscountAmount DECIMAL(10, 2),
    IN p_overallTaxRate DECIMAL(5, 2),
    IN p_servicechargeRate DECIMAL(5, 2),
   IN p_totalLineTax DECIMAL(10, 2),
    OUT p_adjusted_subtotal DECIMAL(10, 2),
    OUT p_overall_TaxAmount DECIMAL(10, 2),
    OUT p_servicecharge DECIMAL(10, 2),
    OUT p_grandTotal DECIMAL(10, 2)
)
BEGIN

    -- Calculate adjusted subtotal after applying order discount
    SET p_adjusted_subtotal = p_subTotal - p_orderDiscountAmount;
    
    -- Calculate overall tax based on the adjusted subtotal
    SET p_overall_TaxAmount = (p_overallTaxRate/100) * p_adjusted_subtotal;
    
    -- Calculate service charge based on the adjusted subtotal
    SET p_servicecharge = p_servicechargeRate * p_adjusted_subtotal;
    
    -- Calculate grand total by adding all components
    SET p_grandTotal = p_adjusted_subtotal + p_totalLineTax + p_overall_TaxAmount + p_servicecharge;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `category_dropdown_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `category_dropdown_select`(
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),

    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN

SELECT categoryId as id,categoryName as displayName FROM category;


set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `category_register_menu_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `category_register_menu_select`(
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),

    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN



select  -1 as categoryId,'All' as categoryName
union
SELECT categoryId,categoryName FROM category ;




set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `category_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `category_select`(
	IN p_Skip INT,
    IN p_Limit INT,
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),

    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
	OUT p_TotalRows INT
)
sp: BEGIN

-- DECLARE _query varchar(10000);
DECLARE _PagingQuery VARCHAR(1000);
DECLARE _filter varchar(1000);

SET _filter = ' WHERE 1=1 ';

set _PagingQuery='';
IF p_Skip IS NOT NULL AND p_Limit IS NOT NULL THEN
    SET _PagingQuery = CONCAT(' LIMIT ', p_Skip, ', ', p_Limit);
    
ELSEIF p_Skip IS NOT NULL AND p_Limit IS NULL THEN
    SET p_ResponseStatus = 'invalid';
    SET p_OutputMessage = 'The _Limit parameter is not passed or set _Skip parameter to null for unlimited data.';
	leave sp;
    
ELSEIF p_Skip IS NULL AND p_Limit IS NOT NULL THEN
    SET p_ResponseStatus = 'invalid';
    SET p_OutputMessage = 'The _Skip parameter is not passed or set _Limit parameter to null for unlimited data.';
	leave sp;
END IF;



SET @_query = CONCAT('SELECT categoryId,categoryName FROM category as i ',_filter,_PagingQuery);

	-- Execute the query
	PREPARE stmt FROM @_query;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;


    SET @queryTotal = CONCAT('SELECT COUNT(categoryId) INTO @totalRows FROM category as i ', _filter);
        
    PREPARE stmt FROM @queryTotal;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    SET p_TotalRows = @totalRows;

set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CLEAN_ALL_TRANSACTIONAL_DATA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CLEAN_ALL_TRANSACTIONAL_DATA`(
)
sp: BEGIN
  
   delete from cash_payments;
    ALTER TABLE cash_payments AUTO_INCREMENT = 1;
    
    delete from card_payments;
    ALTER TABLE card_payments AUTO_INCREMENT = 1;
    
	delete from order_payments;
    ALTER TABLE order_payments AUTO_INCREMENT = 1;

	delete from order_return;
    ALTER TABLE order_return AUTO_INCREMENT = 1;
    
    
    	delete from order_line_discount;
    ALTER TABLE order_line_discount AUTO_INCREMENT = 1;
    
        	delete from order_line_tax;
    ALTER TABLE order_line_tax AUTO_INCREMENT = 1;
    
	delete from order_details;
    ALTER TABLE order_details AUTO_INCREMENT = 1;
    
    delete from order_overall_discount;
    ALTER TABLE order_overall_discount AUTO_INCREMENT = 1;
    
        delete from order_overall_tax;
    ALTER TABLE order_overall_tax AUTO_INCREMENT = 1;
    
         delete from order_summary_processed;
    ALTER TABLE order_summary_processed AUTO_INCREMENT = 1;
    
    
	delete from order_header;
    ALTER TABLE order_header AUTO_INCREMENT = 1;
    
	delete from sessionenddetails;
    ALTER TABLE sessionenddetails AUTO_INCREMENT = 1;
    
	delete from sessionstartdetails;
    ALTER TABLE sessionstartdetails AUTO_INCREMENT = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CompareTables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CompareTables`(
    IN p_PrimaryTableName VARCHAR(255),
    IN p_DCTableName VARCHAR(255),
    IN p_PrimaryKeyColumnName VARCHAR(255),
    IN p_ExcludingColumnName VARCHAR(255)
)
BEGIN
    SET @sql = CONCAT('SELECT * FROM ', p_PrimaryTableName, ' AS p');
    SET @sql = CONCAT(@sql, ' INNER JOIN ', p_DCTableName, ' AS dc ON p.', p_PrimaryKeyColumnName, ' = dc.', p_PrimaryKeyColumnName);
    SET @sql = CONCAT(@sql, ' WHERE p.', p_PrimaryKeyColumnName, ' = p_TerminalId');
    SET @sql = CONCAT(@sql, ' AND (');
    
    -- Loop through columns except the excluding column
    SELECT GROUP_CONCAT(
        '(', 'p.', COLUMN_NAME, ' IS NULL AND dc.', COLUMN_NAME, ' IS NULL) OR (p.', COLUMN_NAME, ' = dc.', COLUMN_NAME, ')'
    )
    INTO @conditions
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = p_PrimaryTableName AND COLUMN_NAME != p_ExcludingColumnName;
    
    SET @sql = CONCAT(@sql, @conditions);
    SET @sql = CONCAT(@sql, ')');
    
    -- Execute the dynamically generated SQL
    PREPARE final_sql FROM @sql;
    EXECUTE final_sql;
    DEALLOCATE PREPARE final_sql;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Customer_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Customer_Delete`(
    IN p_CustomerId INT,
    
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),
    IN p_IsConfirm bit,
    
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN
  
    START TRANSACTION;
    
    SET p_OutputMessage = 'null';
    -- SET p_IsConfirm = 0;
    
    
     if not exists (select * from customer where CustomerId=p_CustomerId) then
		set p_OutputMessage='CustomerId is not exists';
        set p_ResponseStatus='failed';
        leave sp;
	end if;
    
    IF p_IsConfirm is null or p_IsConfirm=0 THEN
        SET p_ResponseStatus = 'confirm';
        SET p_OutputMessage = 'Are you sure you want to delete this customer?.';
        leave sp;
      END IF;
      
	
        DELETE FROM customer WHERE CustomerId = p_CustomerId;
        SET p_ResponseStatus = 'success';
        SET p_OutputMessage = 'Deleted Successfully.';


    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Customer_Insert_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Customer_Insert_Update`(
    IN p_tableID INT,-- p_CustomerID
    IN p_CustomerName VARCHAR(100),
    IN p_Email VARCHAR(50),
    IN p_Mobile VARCHAR(15),
    IN p_Tel  VARCHAR(15),
	IN p_WhatsappNumber  VARCHAR(15),
	IN p_Remark  VARCHAR(200),
    
    IN p_SaveType VARCHAR(1),
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),
    
    IN p_IsConfirm BIT,
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
    OUT p_customerCode VARCHAR(10),
    OUT p_customerId int
)
sp: BEGIN

    START TRANSACTION;
        
	if (p_tableID<1) then
		set p_OutputMessage='Invalid tableId';
        set p_ResponseStatus='failed';
        leave sp;
	end if;
        
    IF p_SaveType = 'I' THEN

 if exists (select * from customer where CustomerName=p_CustomerName) then
		set p_OutputMessage='Customer Name already exists';
        set p_ResponseStatus='failed';
        leave sp;
end if;

    INSERT INTO customer
    (CustomerId,`CustomerName`,`Email`,`Mobile`,`Tel`,`WhatsappNumber`,`Remark`,UserLogID)
VALUES (p_tableID,p_CustomerName, p_Email, p_Mobile, p_Tel, p_WhatsappNumber,p_Remark, p_UserLogID );

SET @_customerId = LAST_INSERT_ID();
set p_customerId=@_customerId;
SET @customerCode = LPAD(@_customerId, 5, '0');

UPDATE customer SET `CustomerCode` =@customerCode WHERE CustomerID=@_customerId;
set p_customerCode=@customerCode;

        SET p_ResponseStatus = 'success';
        SET p_OutputMessage = 'Added Successfully.';
        
    ELSEIF p_SaveType = 'U' THEN
    
	if not exists (select * from customer where CustomerID=p_tableID) then
		set p_OutputMessage='Invalid Customer id';
        set p_ResponseStatus='failed';
        leave sp;
	end if;
    

	if exists (select * from customer where CustomerName=p_CustomerName
    and CustomerID!=p_tableID) then
		set p_OutputMessage='CustomerName already exists u';
        set p_ResponseStatus='failed';
        leave sp;
        end if;
        
SET p_customerCode =(select CustomerCode from customer where CustomerID=p_tableID);
         
  UPDATE `customer` SET
`CustomerName` = p_CustomerName,
`Email` =p_Email,`Mobile` =p_Mobile,`Tel` =p_Tel,`WhatsappNumber` =p_WhatsappNumber,
`Remark` =p_Remark,
ModifiedDate_ServerTime = CURRENT_TIME(),ModifiedDate_UTC = UTC_TIMESTAMP(),UserLogID  =p_UserLogID
WHERE `CustomerID` =p_tableID;

	SET p_ResponseStatus = 'success';
	SET p_OutputMessage = 'Updated Successfully.';

    END IF;
    
      if(p_tableID is not null) then  SET p_customerId=p_tableID; end if;
      
    COMMIT;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Customer_Select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Customer_Select`(
    IN p_CustomerId INT,
	IN p_CustomerCode VARCHAR(50),
	IN p_CustomerName VARCHAR(100),
    IN p_Email VARCHAR(50),
    IN p_Mobile VARCHAR(15),
	IN p_Tel VARCHAR(15),
	IN p_WhatsappNumber VARCHAR(15),
    
	IN p_SearchByKeyword BIT,
	IN p_Skip INT,
    IN p_Limit INT,
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),

    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
	OUT p_TotalRows INT
)
sp: BEGIN

-- DECLARE _query varchar(10000);
DECLARE _PagingQuery VARCHAR(1000);
DECLARE _filter varchar(1000);

SET _filter = ' WHERE 1=1 ';

set _PagingQuery='';
IF p_Skip IS NOT NULL AND p_Limit IS NOT NULL THEN
    SET _PagingQuery = CONCAT(' LIMIT ', p_Skip, ', ', p_Limit);
    
ELSEIF p_Skip IS NOT NULL AND p_Limit IS NULL THEN
    SET p_ResponseStatus = 'invalid';
    SET p_OutputMessage = 'The _Limit parameter is not passed or set _Skip parameter to null for unlimited data.';
	leave sp;
    
ELSEIF p_Skip IS NULL AND p_Limit IS NOT NULL THEN
    SET p_ResponseStatus = 'invalid';
    SET p_OutputMessage = 'The _Skip parameter is not passed or set _Limit parameter to null for unlimited data.';
	leave sp;
END IF;



IF p_SearchByKeyword = 0 THEN
        IF p_CustomerId IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND i.CustomerID = ', p_CustomerId);
        END IF;
        
         IF p_CustomerName IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND i.CustomerName LIKE ''%', p_CustomerName, '%''');
        END IF;
        
        IF p_CustomerCode IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND i.CustomerCode LIKE ''%', p_CustomerCode, '%''');
        END IF;
        
        IF p_Email IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND i.Email LIKE ''%', p_Email, '%''');
        END IF;
        
		IF p_Mobile IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND i.Mobile LIKE ''%', p_Mobile, '%''');
        END IF;
        
    ELSE
        IF p_CustomerId IS NOT NULL THEN
            SET p_ResponseStatus = 'invalid';
            SET p_OutputMessage = 'CustomerId is not supported for keyword search.';
			leave sp;
        END IF;
        
        IF p_CustomerName IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND i.CustomerName LIKE ''%', p_CustomerName, '%''');
        END IF;
        
        IF p_CustomerCode IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND i.CustomerCode LIKE ''%', p_CustomerCode, '%''');
        END IF;
        
        IF p_Email IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND i.Email LIKE ''%', p_Email, '%''');
        END IF;
        
		IF p_Mobile IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND i.Mobile LIKE ''%', p_Mobile, '%''');
        END IF;
        
    END IF;

SET @_query = CONCAT('SELECT customerId,customerCode,
    customerName,email,mobile,tel,whatsappNumber,remark,createdDate_UTC,
   modifiedDate_UTC,userLogID FROM customer as i ',_filter,_PagingQuery);

	-- Execute the query
	PREPARE stmt FROM @_query;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;


    SET @queryTotal = CONCAT('SELECT COUNT(CustomerID) INTO @totalRows FROM customer as i ', _filter);
        
    PREPARE stmt FROM @queryTotal;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    SET p_TotalRows = @totalRows;

set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `drp_department_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `drp_department_select`(
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),

    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN

SELECT Departmentid as id ,DepartmentName as displayName FROM department;


set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `drp_order_voiding_reason_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `drp_order_voiding_reason_select`(
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),

    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN

SELECT order_voiding_reason_id as id ,ReasonName as displayName,Description as description FROM order_voiding_reason;


set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `drp_session_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `drp_session_select`(
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),

    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN

SELECT sessionId as id ,sessionName as displayName FROM session_start_details;


set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserLogDetailsByUserLogId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserLogDetailsByUserLogId`(
    IN p_userLogId INT,
    OUT p_UserId INT,
    OUT p_LoginTime_UTC DATETIME,
    OUT p_LoginStatus VARCHAR(10),
    OUT p_IpAddress VARCHAR(45),
    OUT p_UserAgent VARCHAR(255),
    OUT p_SessionId VARCHAR(255),
    OUT p_AdditionalInfo TEXT,
    OUT p_GMT_Offset VARCHAR(10),
    OUT p_CreatedDate_UTC DATETIME,
    OUT p_CreatedDate_ServerTime DATETIME
)
BEGIN
    SELECT 
        UserId, 
        LoginTime_UTC, 
        LoginStatus, 
        IpAddress, 
        UserAgent, 
        SessionId, 
        AdditionalInfo, 
        GMT_Offset, 
        CreatedDate_UTC, 
        CreatedDate_ServerTime 
    INTO 
        p_UserId, 
        p_LoginTime_UTC, 
        p_LoginStatus, 
        p_IpAddress, 
        p_UserAgent, 
        p_SessionId, 
        p_AdditionalInfo, 
        p_GMT_Offset, 
        p_CreatedDate_UTC, 
        p_CreatedDate_ServerTime
    FROM userlog
    WHERE LogId = p_userLogId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_DC_CustomerIdByCustomerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_DC_CustomerIdByCustomerId`(
   IN p_CustomerId int,
    OUT p_DC_CustomerId int
)
sp: BEGIN


if not exists(SELECT * FROM customer AS s WHERE s.customerid = p_CustomerId) then
    SET p_DC_CustomerId=null;
    leave sp;
    end if;
    
if not exists(
	SELECT * FROM customer AS s INNER JOIN DC_customer AS dcs ON s.customerid = dcs.customerid 
    WHERE s.customerid = p_CustomerId
AND (
    -- Check for NULL values in all columns and treat NULLs as equal
    ((s.customerid IS NULL AND dcs.customerid IS NULL) OR (s.customerid = dcs.customerid))
    AND
   ( (s.CustomerName IS NULL AND dcs.CustomerName IS NULL) OR (s.CustomerName = dcs.CustomerName))
    AND
  (  (s.Email IS NULL AND dcs.Email IS NULL) OR (s.Email = dcs.Email))
    AND
  (  (s.Mobile IS NULL AND dcs.Mobile IS NULL) OR (s.Mobile = dcs.Mobile))
    AND
    ( (s.Tel IS NULL AND dcs.Tel IS NULL) OR (s.Tel = dcs.Tel))
    AND
   ( (s.WhatsappNumber IS NULL AND dcs.WhatsappNumber IS NULL) OR (s.WhatsappNumber = dcs.WhatsappNumber))
    AND
   ( (s.Remark IS NULL AND dcs.Remark IS NULL) OR (s.Remark = dcs.Remark))
    AND
   ( (s.CreatedDate_UTC IS NULL AND dcs.CreatedDate_UTC IS NULL) OR (s.CreatedDate_UTC = dcs.CreatedDate_UTC))
    AND
   ( (s.CreatedDate_ServerTime IS NULL AND dcs.CreatedDate_ServerTime IS NULL) OR (s.CreatedDate_ServerTime = dcs.CreatedDate_ServerTime))
    AND
   ( (s.ModifiedDate_ServerTime IS NULL AND dcs.ModifiedDate_ServerTime IS NULL) OR (s.ModifiedDate_ServerTime = dcs.ModifiedDate_ServerTime))
    AND
   ( (s.ModifiedDate_UTC IS NULL AND dcs.ModifiedDate_UTC IS NULL) OR (s.ModifiedDate_UTC = dcs.ModifiedDate_UTC))
    AND
   ( (s.CustomerCode IS NULL AND dcs.CustomerCode IS NULL) OR (s.CustomerCode = dcs.CustomerCode))
    AND
   ( (s.UserLogID IS NULL AND dcs.UserLogID IS NULL) OR (s.UserLogID = dcs.UserLogID))

)

) then
 -- select 'dc_customer has not latest updated value of customer';
 
INSERT INTO  dc_customer(`CustomerID`,`CustomerName`,`Email`,`Mobile`,`Tel`,`WhatsappNumber`,
`Remark`,`CreatedDate_UTC`,`CreatedDate_ServerTime`,`ModifiedDate_ServerTime`,`ModifiedDate_UTC`,`CustomerCode`,`UserLogID`)
select `CustomerID`,`CustomerName`,`Email`,`Mobile`,`Tel`,`WhatsappNumber`,
`Remark`,`CreatedDate_UTC`,`CreatedDate_ServerTime`,`ModifiedDate_ServerTime`,`ModifiedDate_UTC`,`CustomerCode`,`UserLogID`
from customer where customerid=p_CustomerId;

SET p_DC_CustomerId= LAST_INSERT_ID();

else
-- select 'dc_customer has latest updated value of customer';
set p_DC_CustomerId=(select max(DC_CustomerID) from dc_customer where customerid=p_CustomerId);
end if;

   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_DC_ProductIdByProductId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_DC_ProductIdByProductId`(
   IN p_ProductId INT,
   OUT p_DC_ProductId INT
)
sp:BEGIN
   IF NOT EXISTS (SELECT * FROM product AS p WHERE p.ProductId = p_ProductId) THEN
      SET p_DC_ProductId = NULL;
      LEAVE sp;
   END IF;
   
   IF NOT EXISTS (
      SELECT * FROM product AS p
      INNER JOIN dc_product AS dp ON p.ProductId = dp.ProductId
      WHERE p.ProductId = p_ProductId
      AND (
         -- Check for NULL values in all columns and treat NULLs as equal
         ((p.ProductId IS NULL AND dp.ProductId IS NULL) OR (p.ProductId = dp.ProductId))
         AND
         ((p.ProductName IS NULL AND dp.ProductName IS NULL) OR (p.ProductName = dp.ProductName))
         AND
         ((p.MeasurementUnitId IS NULL AND dp.MeasurementUnitId IS NULL) OR (p.MeasurementUnitId = dp.MeasurementUnitId))
         AND
         ((p.ProductNo IS NULL AND dp.ProductNo IS NULL) OR (p.ProductNo = dp.ProductNo))
         AND
         ((p.UnitPrice IS NULL AND dp.UnitPrice IS NULL) OR (p.UnitPrice = dp.UnitPrice))
         AND
             ((p.DepartmentId IS NULL AND dp.DepartmentId IS NULL) OR (p.DepartmentId = dp.DepartmentId))
             

         AND
         ((p.UserLogId IS NULL AND dp.UserLogId IS NULL) OR (p.UserLogId = dp.UserLogId))
         AND
         ((p.ReorderLevel IS NULL AND dp.ReorderLevel IS NULL) OR (p.ReorderLevel = dp.ReorderLevel))
         AND
         ((p.Barcode IS NULL AND dp.Barcode IS NULL) OR (p.Barcode = dp.Barcode))
           AND
         ((p.TaxRate_perc IS NULL AND dp.TaxRate_perc IS NULL) OR (p.TaxRate_perc = dp.TaxRate_perc))
         AND
         ((p.CreatedDate_UTC IS NULL AND dp.CreatedDate_UTC IS NULL) OR (p.CreatedDate_UTC = dp.CreatedDate_UTC))
         AND
         ((p.CreatedDate_ServerTime IS NULL AND dp.CreatedDate_ServerTime IS NULL) OR (p.CreatedDate_ServerTime = dp.CreatedDate_ServerTime))
         AND
         ((p.ModifiedDate_ServerTime IS NULL AND dp.ModifiedDate_ServerTime IS NULL) OR (p.ModifiedDate_ServerTime = dp.ModifiedDate_ServerTime))
         AND
         ((p.ModifiedDate_UTC IS NULL AND dp.ModifiedDate_UTC IS NULL) OR (p.ModifiedDate_UTC = dp.ModifiedDate_UTC))
         
      )
   ) THEN
      INSERT INTO dc_product (`ProductId`, `ProductName`, `MeasurementUnitId`, `ProductNo`, `UnitPrice`,DepartmentId, `UserLogId`, `ReorderLevel`, `Barcode`, `CreatedDate_UTC`, `CreatedDate_ServerTime`, `ModifiedDate_ServerTime`, `ModifiedDate_UTC`)
      SELECT `ProductId`, `ProductName`, `MeasurementUnitId`, `ProductNo`, `UnitPrice`,DepartmentId, `UserLogId`, `ReorderLevel`, `Barcode`, `CreatedDate_UTC`, `CreatedDate_ServerTime`, `ModifiedDate_ServerTime`, `ModifiedDate_UTC`
      FROM product
      WHERE ProductId = p_ProductId;
      
      SET p_DC_ProductId = LAST_INSERT_ID();
   ELSE
      SET p_DC_ProductId = (SELECT MAX(DC_ProductId) FROM dc_product WHERE ProductId = p_ProductId);
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_DC_StoreIdByStoreId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_DC_StoreIdByStoreId`(
   IN p_StoreId int,
   OUT p_DC_StoreId int
)
sp: BEGIN

    -- Check if the store exists in the store table
    IF NOT EXISTS (SELECT * FROM store AS s WHERE s.storeId = p_StoreId) THEN
        SET p_DC_StoreId = NULL;
        LEAVE sp;
    END IF;

    -- Check if the dc_store has the latest updated values of the store
    IF NOT EXISTS (
        SELECT * 
        FROM store AS s 
        INNER JOIN dc_store AS dcs ON s.storeId = dcs.storeId 
        WHERE s.storeId = p_StoreId
        AND (
            ((s.storeId IS NULL AND dcs.storeId IS NULL) OR (s.storeId = dcs.storeId))
            AND ((s.StoreCode IS NULL AND dcs.StoreCode IS NULL) OR (s.StoreCode = dcs.StoreCode))
            AND ((s.StoreName IS NULL AND dcs.StoreName IS NULL) OR (s.StoreName = dcs.StoreName))
            AND ((s.CreatedDate_UTC IS NULL AND dcs.CreatedDate_UTC IS NULL) OR (s.CreatedDate_UTC = dcs.CreatedDate_UTC))
            AND ((s.CreatedDate_ServerTime IS NULL AND dcs.CreatedDate_ServerTime IS NULL) OR (s.CreatedDate_ServerTime = dcs.CreatedDate_ServerTime))
            AND ((s.ModifiedDate_UTC IS NULL AND dcs.ModifiedDate_UTC IS NULL) OR (s.ModifiedDate_UTC = dcs.ModifiedDate_UTC))
            AND ((s.ModifiedDate_ServerTime IS NULL AND dcs.ModifiedDate_ServerTime IS NULL) OR (s.ModifiedDate_ServerTime = dcs.ModifiedDate_ServerTime))
            AND ((s.Address IS NULL AND dcs.Address IS NULL) OR (s.Address = dcs.Address))
            AND ((s.City IS NULL AND dcs.City IS NULL) OR (s.City = dcs.City))
            AND ((s.Province IS NULL AND dcs.Province IS NULL) OR (s.Province = dcs.Province))
            AND ((s.emailAddress IS NULL AND dcs.emailAddress IS NULL) OR (s.emailAddress = dcs.emailAddress))
            AND ((s.tel1 IS NULL AND dcs.tel1 IS NULL) OR (s.tel1 = dcs.tel1))
            AND ((s.tel2 IS NULL AND dcs.tel2 IS NULL) OR (s.tel2 = dcs.tel2))
            AND ((s.ManagerId IS NULL AND dcs.ManagerId IS NULL) OR (s.ManagerId = dcs.ManagerId))
        )
    ) THEN
        -- Insert the latest values from store to dc_store
        INSERT INTO dc_store(`storeId`, `StoreCode`, `StoreName`, `CreatedDate_UTC`, `CreatedDate_ServerTime`, 
                             `ModifiedDate_UTC`, `ModifiedDate_ServerTime`, `Address`, `City`, `Province`, 
                             `emailAddress`, `tel1`, `tel2`, `ManagerId`)
        SELECT `storeId`, `StoreCode`, `StoreName`, `CreatedDate_UTC`, `CreatedDate_ServerTime`, 
               `ModifiedDate_UTC`, `ModifiedDate_ServerTime`, `Address`, `City`, `Province`, 
               `emailAddress`, `tel1`, `tel2`, `ManagerId`
        FROM store
        WHERE storeId = p_StoreId;

        SET p_DC_StoreId = LAST_INSERT_ID();
    ELSE
        -- Set the latest DC_StoreId if the dc_store already has the latest values
        SET p_DC_StoreId = (SELECT MAX(dc_storeId) FROM dc_store WHERE storeId = p_StoreId);
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_DC_TerminalIdByTerminalId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_DC_TerminalIdByTerminalId`(
   IN p_terminalId INT,
   OUT p_DC_TerminalId INT
)
sp:BEGIN
   IF NOT EXISTS (SELECT * FROM terminal AS p WHERE p.terminalId = p_terminalId) THEN
      SET p_DC_TerminalId = NULL;
      LEAVE sp;
   END IF;
   
   IF NOT EXISTS (
      SELECT * FROM terminal AS p
      INNER JOIN dc_terminal AS dp ON p.TerminalId = dp.TerminalId
      WHERE p.terminalId = p_terminalId
      AND (
        
         ((p.CreatedDate_UTC IS NULL AND dp.CreatedDate_UTC IS NULL) OR (p.CreatedDate_UTC = dp.CreatedDate_UTC))
         AND
         ((p.CreatedDate_ServerTime IS NULL AND dp.CreatedDate_ServerTime IS NULL) OR (p.CreatedDate_ServerTime = dp.CreatedDate_ServerTime))
         AND
         ((p.ModifiedDate_ServerTime IS NULL AND dp.ModifiedDate_ServerTime IS NULL) OR (p.ModifiedDate_ServerTime = dp.ModifiedDate_ServerTime))
         AND
         ((p.ModifiedDate_UTC IS NULL AND dp.ModifiedDate_UTC IS NULL) OR (p.ModifiedDate_UTC = dp.ModifiedDate_UTC))
         
      )
   ) THEN
      INSERT INTO dc_terminal (`TerminalId`, `TerminalName`, `CreatedDate_UTC`, `CreatedDate_ServerTime`, `ModifiedDate_ServerTime`, `ModifiedDate_UTC`)
      SELECT `TerminalId`, `TerminalName`,`CreatedDate_UTC`, `CreatedDate_ServerTime`, `ModifiedDate_ServerTime`, `ModifiedDate_UTC`
      FROM terminal
      WHERE TerminalId = p_terminalId;
      
      SET p_DC_TerminalId = LAST_INSERT_ID();
   ELSE
      SET p_DC_TerminalId = (SELECT MAX(DC_TerminalId) FROM dc_terminal WHERE TerminalId = p_terminalId);
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_SystemInfoIdByTerminalId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_SystemInfoIdByTerminalId`(
   IN p_TerminalId INT,
   OUT p_systemInfoId INT,
   OUT p_StoreId INT,
   OUT p_UTC_offset varchar(50),
   OUT p_CountryId INT,
   OUT p_CurrencyId INT,
   OUT p_PrimaryLanguageId INT,
   OUT p_TaxRate DECIMAL(10, 2)
)
BEGIN
   IF NOT EXISTS (SELECT * FROM system_info AS s WHERE s.terminalid = p_TerminalId) THEN
      SET p_systemInfoId = NULL;
      SET p_StoreId = NULL;
      SET p_UTC_offset = NULL;
      SET p_CountryId = NULL;
      SET p_CurrencyId = NULL;
      SET p_PrimaryLanguageId = NULL;
      SET p_TaxRate = NULL;
   ELSE
      SELECT systemInfoId INTO p_systemInfoId FROM system_info AS s WHERE s.terminalid = p_TerminalId;
      SELECT StoreId INTO p_StoreId FROM system_info AS s WHERE s.terminalid = p_TerminalId;
      SELECT UTC_offset INTO p_UTC_offset FROM system_info AS s WHERE s.terminalid = p_TerminalId;
      SELECT CountryId INTO p_CountryId FROM system_info AS s WHERE s.terminalid = p_TerminalId;
      SELECT CurrencyId INTO p_CurrencyId FROM system_info AS s WHERE s.terminalid = p_TerminalId;
      SELECT PrimaryLanguageId INTO p_PrimaryLanguageId FROM system_info AS s WHERE s.terminalid = p_TerminalId;
      SELECT TaxRate INTO p_TaxRate FROM system_info AS s WHERE s.terminalid = p_TerminalId;
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_UserRegistrationByUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_UserRegistrationByUserId`(
 IN p_userId INT,
   OUT p_DC_UserId INT
)
sp:BEGIN
  -- Check if the user exists in the user_registration table
   IF NOT EXISTS (SELECT * FROM user_registration WHERE userId = p_userId) THEN
      SET p_DC_UserId = NULL;
      LEAVE sp;
   END IF;
   
   IF NOT EXISTS (
      SELECT * FROM user_registration AS ur
      LEFT JOIN dc_user_registration AS dur ON ur.userId = dur.userId
      WHERE ur.userId = p_userId
      AND (
         ((ur.uName IS NULL AND dur.uName IS NULL) OR (ur.uName = dur.uName))
         AND
         ((ur.passwordHash IS NULL AND dur.passwordHash IS NULL) OR (ur.passwordHash = dur.passwordHash))
         AND
         ((ur.passwordSalt IS NULL AND dur.passwordSalt IS NULL) OR (ur.passwordSalt = dur.passwordSalt))
         AND
         ((ur.email IS NULL AND dur.email IS NULL) OR (ur.email = dur.email))
         AND
         ((ur.displayName IS NULL AND dur.displayName IS NULL) OR (ur.displayName = dur.displayName))
         AND
         ((ur.profilePic IS NULL AND dur.profilePic IS NULL) OR (ur.profilePic = dur.profilePic))
         AND
         ((ur.isActive IS NULL AND dur.isActive IS NULL) OR (ur.isActive = dur.isActive))
         AND
         ((ur.CreatedDate_UTC IS NULL AND dur.CreatedDate_UTC IS NULL) OR (ur.CreatedDate_UTC = dur.CreatedDate_UTC))
         AND
         ((ur.CreatedDate_ServerTime IS NULL AND dur.CreatedDate_ServerTime IS NULL) OR (ur.CreatedDate_ServerTime = dur.CreatedDate_ServerTime))
         AND
         ((ur.ModifiedDate_ServerTime IS NULL AND dur.ModifiedDate_ServerTime IS NULL) OR (ur.ModifiedDate_ServerTime = dur.ModifiedDate_ServerTime))
         AND
         ((ur.ModifiedDate_UTC IS NULL AND dur.ModifiedDate_UTC IS NULL) OR (ur.ModifiedDate_UTC = dur.ModifiedDate_UTC))
      )
   ) THEN
      -- Insert logic for user_registration changes
      INSERT INTO dc_user_registration (userId, uName, passwordHash, passwordSalt, email, displayName, profilePic, isActive, CreatedDate_UTC, CreatedDate_ServerTime, ModifiedDate_UTC, ModifiedDate_ServerTime)
      SELECT userId, uName, passwordHash, passwordSalt, email, displayName, profilePic, isActive, CreatedDate_UTC, CreatedDate_ServerTime, ModifiedDate_UTC, ModifiedDate_ServerTime
      FROM user_registration
      WHERE userId = p_userId;

      SET p_DC_UserId = LAST_INSERT_ID();
   ELSE
      -- Handle if the user registration data already exists in dc_user_registration
      SET p_DC_UserId = (SELECT MAX(dc_userId) FROM dc_user_registration WHERE userId = p_userId);
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ImportDataWithDatabaseCreation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ImportDataWithDatabaseCreation`()
BEGIN
    DECLARE db_name VARCHAR(255);
    SET db_name = 'mytest';

    -- Create the database if it doesn't exist
    SET @create_db_query = CONCAT('CREATE DATABASE IF NOT EXISTS ', db_name);
    PREPARE create_db_stmt FROM @create_db_query;
    EXECUTE create_db_stmt;
    DEALLOCATE PREPARE create_db_stmt;

    -- Import data from SQL file
    SET @import_data_query = CONCAT('mysql -u root -p --comments ', db_name, ' < F:\\lbposc_light2_full_backup_latest.sql');
    PREPARE import_data_stmt FROM @import_data_query;
    EXECUTE import_data_stmt;
    DEALLOCATE PREPARE import_data_stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IsCustomerDepends` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IsCustomerDepends`(
    IN p_CustomerId INT,

    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
	OUT p_IsDepend Bit
)
sp: BEGIN

set p_IsDepend=0;
if exists(select * from orderheader where customerId=p_CustomerId) then
set p_IsDepend=1;
end if;


set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IsProductDepends` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IsProductDepends`(
    IN p_ProductId INT,

    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
	OUT p_IsDepend Bit
)
sp: BEGIN

set p_IsDepend=0;
if exists(select * from orderdetails where productId=p_ProductId) then
set p_IsDepend=1;
end if;


set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `measurementUnit_dropdown_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `measurementUnit_dropdown_select`(
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),

    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN

SELECT MeasurementUnitId as id ,MeasurementUnitName as displayName FROM measurement_unit;


set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrderFull_Select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrderFull_Select`(
  IN p_OrderId INT,
   IN p_OrderNo VARCHAR(50),
    IN p_UserLogID INT,
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN
DECLARE _filter varchar(1000);
DECLARE _orderId int;


SET _filter = ' WHERE 1 = 1 ';

   if p_OrderId IS NULL AND p_OrderNo IS NULL THEN
          SET p_ResponseStatus = 'invalid';
		SET p_OutputMessage = 'You have to supply either p_OrderId or p_OrderNo';
		leave sp;
       END IF;
       
          if p_OrderId IS NOT NULL AND p_OrderNo IS NOT NULL THEN
          SET p_ResponseStatus = 'invalid';
		SET p_OutputMessage = 'You can not supply both p_OrderId and p_OrderNo';
		leave sp;
       END IF;
       

    IF p_OrderId IS NOT NULL THEN
            SET _orderId =  p_OrderId;
        END IF;
        
               IF p_orderNo IS NOT NULL THEN
               set _orderId=(select orderId from order_Header where orderNo=p_orderNo);
        END IF;
        
SELECT oh.orderId,orderNo,terminalId,sessionId,
oh.createdDate_UTC,currencyId,oh.customerId,oh.countryId,c.customerName,
c.customerCode,osp.grossAmount_total,osp.lineDiscountAmount_total,
osp.overallDiscountAmount,osp.all_DiscountAmount_total,osp.subTotal,osp.adjusted_subtotal,
osp.grandTotal,osp.lineTaxAmount_total,osp.overall_TaxAmount,
CAST(oh.isVoided AS UNSIGNED) as isVoided from order_header as oh 
inner join order_summary_processed as osp ON oh.OrderId=osp.OrderId
inner join dc_customer as c on oh.dc_customerid=c.dc_customerid 
 where oh.orderId=_orderId;
 


    
    
  SELECT o.orderDetailId,orderID,qty,o.createdDate_UTC,o.productId,
o.unitPrice,isReturned,o.dc_productId,grossAmount,netAmount, o.measurementUnitId,
p.productNo,p.productName,mu.measurementUnitName,d.discountAmount,d.remark,
d.discountValue,dt.typeName,dr.reasonName
 FROM order_details as o 
inner join dc_product as p ON o.dc_productId=p.dc_productId
inner join measurement_unit as mu on o.measurementUnitId=mu.measurementUnitId
left outer join order_line_discount as d ON o.orderDetailId=d.orderDetailId
left outer join discount_type as dt ON d.discountTypeId=dt.discountTypeId
left outer join discount_reason dr ON d.discountReasonId=dr.discountReasonId
  where o.orderId=_orderId;
-- order_line_discount

    
    
set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrderReceipt_SelectByOrderId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrderReceipt_SelectByOrderId`(
  IN p_OrderId INT,

    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN

SELECT oh.`orderId`,`orderNo`,`oh`.`isVoided`,`oh`.`userLogId`,`oh`.`dc_CustomerId`,
    `oh`.`sessionId`,`oh`.`createdDate_UTC`,`oh`.`createdDate_ServerTime`,`oh`.`terminalId`,
    `oh`.`customerId`,`oh`.`dc_TerminalId`,`oh`.`storeId`,`oh`.`dc_StoreId`,`oh`.`countryId`,
    `oh`.`currencyId`,`oh`.`primaryLanguageId`,u.displayName as displayUserName,c.customerName,c.customerCode,
    curr.currencyName,curr.currencyCode,curr.symbol,
br.storeName,br.storeCode,br.address,br.city,br.province,br.emailAddress,br.tel1,br.tel2,
osp.grossAmount_total,osp.lineDiscountAmount_total,osp.OverallDiscountAmount,all_DiscountAmount_total,subTotal,adjusted_subtotal,grandTotal,
lineTaxAmount_total,overall_taxAmount,lineTaxAmount_total+overall_taxAmount as totalTaxAmount,
CAST(oh.isVoided AS UNSIGNED) as isVoided,dt.terminalName,du.displayName,ssd.sessionName
FROM `order_header` as oh inner join session_start_details as sed ON oh.sessionId=sed.sessionId
inner join dc_customer as c on oh.dc_customerid=c.dc_customerid
 inner join dc_user_registration as u ON oh.dc_userId=u.dc_userId
 inner join currency as curr ON oh.currencyId=curr.currencyId
 inner join dc_store as br ON oh.dc_storeId=br.dc_storeId
 inner join order_summary_processed as osp ON oh.orderId=osp.orderId
 inner join dc_terminal as dt ON oh.dc_terminalId=dt.dc_terminalId
 inner join dc_user_registration as du ON oh.dc_userId=du.dc_userId
 inner join session_start_details as ssd ON oh.sessionId=ssd.sessionId
where oh.OrderId=p_OrderId;


SELECT `od`.`orderDetailId`,`od`.`orderID`,`od`.`qty`,`od`.`createdDate_ServerTime`,`od`.`createdDate_UTC`,`od`.`productId`,p.productName,p.productNo,`od`.`unitPrice`,
`od`.`isReturned`,`od`.`dc_productId`,`od`.`grossAmount`,`od`.`netAmount`,mu.measurementUnitName,
ld.discountValue,dt.typeName,ld.discountAmount
FROM `order_details` as od inner join measurement_unit as mu on od.MeasurementUnitId=mu.MeasurementUnitId
inner join dc_product as p ON od.dc_productId=p.dc_productId
left outer join order_line_discount as ld ON od.orderDetailId=ld.orderDetailId
left outer join discount_type as dt ON ld.discountTypeId=dt.discountTypeId
where od.OrderId=p_OrderId;

SELECT `op`.`paymentId`,`op`.`orderId`,`op`.`methodId`,`op`.`amountPaid`,`op`.`paymentDate_UTC`,
cp.cardHolderName,cp.cardLastFourDigits,cp.cardExpirationMonth,cp.cardExpirationYear,cahp.balanceAmount,cahp.receivedAmount,pm.MethodName,crdtpe.CardTypeName,
cahp.receivedAmount
FROM `order_payments` as op
inner join payment_methods as pm on op.MethodId=pm.MethodId
 left outer join cash_payments as cahp ON op.paymentId=cahp.paymentId
left outer join card_payments as cp ON op.paymentId=cp.paymentId
left outer join card_types as crdtpe on cp.CardTypeId=crdtpe.CardTypeId
 where op.orderId=p_OrderId;


set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Order_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Order_Insert`(
  
   IN p_CustomerID INT,
    IN p_TerminalId INT,
    IN p_SessionID INT,
    
	-- IN p_isOrderDiscount BIT,
	-- IN p_orderDiscountTypeId int,
	-- IN p_orderDiscountValue DECIMAL(10, 2),
	-- IN p_orderDiscountReasonId int,
	-- IN p_orderDiscountRemark varchar(500),
    
    IN p_orderLevelDiscount_json JSON,
     
    IN p_orderList_json JSON,
    IN p_paymentList_json text,
    IN p_IsStockSupported BIT,
    IN p_UserLogID INT,
    IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),
    IN p_IsConfirm BIT,
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
    OUT p_OrderNo VARCHAR(50),
    OUT p_balanceAmount decimal(10,2)
)
sp: BEGIN

DECLARE v_systemInfoId INT;
  DECLARE v_DC_CustomerId INT;
    DECLARE v_DC_StoreId INT;
   
   DECLARE v_orderDiscount JSON; 
    DECLARE v_orderId INT;
    DECLARE v_orderNo VARCHAR(50);

 DECLARE noOfItemsInOrderList int;
DECLARE i_orderList int default 0;

 DECLARE noOfItemsInPaymentList int;
DECLARE i_paymentList int default 0;

 DECLARE _totalPaid decimal(10,2) default 0;

	
declare v_productId varchar(11);
declare v_unitPrice varchar(11);
declare v_qty varchar(11);
declare v_discount json;
declare v_returnItem json;


declare v_isDiscountExists bit;
declare v_discountTypeId int;
declare v_discountValue decimal(10,2);
declare v_discountReasonId int;
declare v_discountRemark varchar(500);
declare v_lineDiscountAmount decimal(10,2);

declare v_lineTaxRate decimal(10,2);

declare o_grossAmount decimal(10,2);
declare o_netAmount decimal(10,2);
declare o_lineTaxAmount decimal(10,2);
  
  -- return items params
  declare v_isReturned bit;
   declare v_pre_orderDetailId_return int;
   
   declare v_pre_OrderDetail_Qty decimal(10,2);
      declare v_pre_OrderDetail_customer int;
declare v_remainingQtyForReturn decimal(10,2);


    declare v_dc_productId int;
    declare v_DC_productId_forOrderList int;
	declare o_DC_ProductId int;
    
	declare v_pre_OrderDetail_productId int;
    
    
	declare v_servicechargeRate DECIMAL(10, 2);
	declare v_overall_TaxRate DECIMAL(10, 2);
    
    declare v_grossAmount_total DECIMAL(10, 2) DEFAULT 0;
	declare v_lineDiscountAmount_total DECIMAL(10, 2) DEFAULT 0;
 declare v_subTotal DECIMAL(10, 2) DEFAULT 0;
 declare v_lineTaxAmount_total DECIMAL(10, 2) DEFAULT 0;
  declare v_grandTotal DECIMAL(10, 2) DEFAULT 0;
  
declare ov_grandTotal DECIMAL(10, 2);

declare o_adjusted_subtotal DECIMAL(10, 2);
declare o_overall_TaxAmount DECIMAL(10, 2);
declare o_servicecharge DECIMAL(10, 2);

	declare v_totalItems_tblPaymentList int;

  -- At the beginning of your stored procedure
DECLARE v_methodId INT;
DECLARE v_cashPayment json DEFAULT NULL;
DECLARE v_cardPayment json DEFAULT NULL;

DECLARE v_amountPaid DECIMAL(10, 2);


DECLARE v_cardHolderName VARCHAR(50) DEFAULT NULL;
DECLARE v_bankId VARCHAR(11) DEFAULT NULL;
DECLARE v_cardTypeId varchar(11);
DECLARE v_cardLastFourDigits VARCHAR(4) DEFAULT NULL;
DECLARE v_cardExpirationMonth VARCHAR(4) DEFAULT NULL;
DECLARE v_cardExpirationYear VARCHAR(4) DEFAULT NULL;
  
  DECLARE v_paymentId INT;


declare v_amountPaid_card decimal(10,2) default 0;
declare v_amountPaid_cash decimal(10,2) default 0;

  DECLARE v_shortfall decimal(10,2) default 0;
 DECLARE v_balanceAmount DECIMAL(10, 2) DEFAULT 0;
 
DECLARE v_totalItems_tblOrderList INT;

 -- set v_grossAmount_total=0;
  -- set v_lineDiscountAmount_total=0;
  --  set v_subTotal=0;
  --  set @_lineTaxAmount_total=0;
  -- set @_grandTotal=0;

   DECLARE _order_DiscountAmount DECIMAL(10, 2) DEFAULT 0;
   
   	 DECLARE isOrderDiscountExists BIT default false;
	 DECLARE orderDiscountTypeId int;
	 DECLARE orderDiscountValue DECIMAL(10, 2);
	 DECLARE orderDiscountReasonId int;
	 DECLARE orderDiscountRemark varchar(500);
   
    DECLARE v_orderDetailId int;


declare v_DC_TerminalId int;

declare v_DC_CompanyId int;
declare v_CompanyId int;

declare v_StoreId int;

declare v_UserId int;
declare v_DC_UserId int;

declare v_UTC_offset varchar(50);
declare v_CountryId int;
declare v_CurrencyId int;
declare v_PrimaryLanguageId int;
declare v_TaxRate DECIMAL(10, 2);


declare  v_measurementUnitId int;

    DECLARE inputUserLogId INT;
    DECLARE outputUserId INT;
    DECLARE outputLoginTime_UTC DATETIME;
    DECLARE outputLoginStatus VARCHAR(10);
    DECLARE outputIpAddress VARCHAR(45);
    DECLARE outputUserAgent VARCHAR(255);
    DECLARE outputSessionId VARCHAR(255);
    DECLARE outputAdditionalInfo TEXT;
    DECLARE outputGMT_Offset VARCHAR(10);
    DECLARE outputCreatedDate_UTC DATETIME;
    DECLARE outputCreatedDate_ServerTime DATETIME;
    
    
    
-- DECLARE _orderId INT;
-- DECLARE _orderNo VARCHAR(50);

      DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    
     DECLARE custom_error_low CONDITION FOR SQLSTATE '45001';  -- Custom error with a low severity SQLSTATE code
    DECLARE custom_error_high CONDITION FOR SQLSTATE '45002'; -- Custom error with a high severity SQLSTATE code
    
        SHOW ERRORS;  -- this is the only one which you need
        ROLLBACK;   
    END;
 	
    START TRANSACTION;
    
    
 
    SET inputUserLogId = p_UserLogID;

    -- Call the stored procedure
    CALL getUserLogDetailsByUserLogId(inputUserLogId, outputUserId, outputLoginTime_UTC, outputLoginStatus, outputIpAddress, outputUserAgent, outputSessionId,
        outputAdditionalInfo, outputGMT_Offset, outputCreatedDate_UTC, outputCreatedDate_ServerTime);
        
       set v_UserId=outputUserId;
    
     -- session validation
	if not exists (select * from session_start_details where sessionId=p_sessionId and terminalId=p_terminalId) then
		set p_OutputMessage=concat('The session :',p_sessionId,' is not exists for the termial:',p_terminalId);
        set p_ResponseStatus='failed';
        set p_sessionId=p_sessionId;
        leave sp;
	end if; 
    
	if exists (select * from session_start_details where isSessionEnded=1 and sessionId=p_sessionId and terminalId=p_terminalId) then
		set p_OutputMessage=concat('The session :',p_sessionId,' is already closed');
        set p_ResponseStatus='failed';
        set p_sessionId=p_sessionId;
        leave sp;
	end if; 
    

       -- IF p_IsConfirm is null or p_IsConfirm=0 THEN
      --  SET p_ResponseStatus = 'confirm';
      --  SET p_OutputMessage = 'Are you sure you want to continue?.';
       -- leave sp;
      -- END IF;
      
      CALL get_SystemInfoIdByTerminalId(p_TerminalId, v_systemInfoId,
   v_StoreId, v_UTC_offset,v_CountryId, 
   v_CurrencyId, v_PrimaryLanguageId, v_TaxRate);
   
	IF v_systemInfoId is null THEN
        SET p_ResponseStatus = 'failed';
        SET p_OutputMessage = concat('Systeminfo details are not exists for Terminal:',p_TerminalId);
        leave sp;
	END IF; 


	
CALL get_DC_StoreIdByStoreId(v_StoreId, v_DC_StoreId);
IF v_DC_StoreId is null THEN
        SET p_ResponseStatus = 'failed';
        SET p_OutputMessage = concat('Store:',v_StoreId,' is not exists:');
        leave sp;
	END if;

	
	
  
  CALL get_DC_CustomerIdByCustomerId(p_CustomerID, v_DC_CustomerId);
 
	IF v_DC_CustomerId is null THEN
        SET p_ResponseStatus = 'failed';
        SET p_OutputMessage = concat('Customer:',p_CustomerID,' is not exists:');
        leave sp;
	END IF; 
   
     CALL get_DC_TerminalIdByTerminalId(p_TerminalId, v_DC_TerminalId);
	IF v_DC_TerminalId is null THEN
        SET p_ResponseStatus = 'failed';
        SET p_OutputMessage = concat('Terminal:',p_TerminalId,' is not exists:');
        leave sp;
	END IF; 
    

    
        CALL get_UserRegistrationByUserId(v_UserId, v_DC_UserId );
	IF v_DC_UserId  is null THEN
        SET p_ResponseStatus = 'failed';
        SET p_OutputMessage = concat('Company:',v_UserId ,' is not exists:');
        leave sp;
	END IF; 
    


	set v_orderDiscount=JSON_UNQUOTE(JSON_EXTRACT(p_orderLevelDiscount_json, CONCAT('$[', 0, ']')));
    if (v_orderDiscount='null' or v_orderDiscount=null) then set v_orderDiscount=null;  end if;
    if(v_orderDiscount is not null) then
		set isOrderDiscountExists=true;
		set orderDiscountTypeId=JSON_UNQUOTE(JSON_EXTRACT(p_orderLevelDiscount_json, CONCAT('$[', 0, '].overallDiscountTypeId')));
		set orderDiscountValue=JSON_UNQUOTE(JSON_EXTRACT(p_orderLevelDiscount_json, CONCAT('$[', 0, '].overallDiscountValue')));
		set orderDiscountReasonId=JSON_UNQUOTE(JSON_EXTRACT(p_orderLevelDiscount_json, CONCAT('$[', 0, '].overallDiscountReasonId')));
        set orderDiscountRemark=JSON_UNQUOTE(JSON_EXTRACT(p_orderLevelDiscount_json, CONCAT('$[', 0, '].overallDiscountRemark')));
        
	  -- Convert to integer and check if values are valid integers and greater than zero
		if (CAST(orderDiscountTypeId AS SIGNED) <= 0 OR 
			CAST(orderDiscountValue AS SIGNED) <= 0 OR 
			CAST(orderDiscountReasonId AS SIGNED) <= 0) then
			SET p_ResponseStatus = 'failed';
			SET p_OutputMessage = concat('Invalid overall discount details');
		end if;
    
      end if;
      
  
-- START order list json to table
    SET noOfItemsInOrderList = JSON_LENGTH(p_orderList_json);

   DROP TEMPORARY TABLE IF EXISTS tblOrderList;
   create temporary table tblOrderList(productId int,dc_productId int,unitPrice decimal(10,2),qty decimal(10,2),isDiscountExists bit,
  discountTypeId int, discountValue decimal(10,2),discountReasonId int,discountRemark varchar(500),lineDiscountAmount decimal(10,2),
  lineTaxAmount decimal(10,2),lineTaxRate decimal(10,2),grossAmount decimal(10,2),netAmount decimal(10,2),
  isReturned BIT(1),pre_orderDetailId_return int);


	 

while i_orderList < noOfItemsInOrderList do
set v_productId=JSON_UNQUOTE(JSON_EXTRACT(p_orderList_json, CONCAT('$[', i_orderList, '].productId')));

set v_unitPrice=JSON_UNQUOTE(JSON_EXTRACT(p_orderList_json, CONCAT('$[', i_orderList, '].unitPrice')));
set v_qty=JSON_UNQUOTE(JSON_EXTRACT(p_orderList_json, CONCAT('$[', i_orderList, '].qty')));

set v_discount=JSON_UNQUOTE(JSON_EXTRACT(p_orderList_json, CONCAT('$[', i_orderList, '].discount')));
if (v_discount='null' or v_discount=null) then set v_discount=null;  end if;


set v_isDiscountExists=false;
set v_discountTypeId=null;
set v_discountValue=null;
set v_discountReasonId=null;
set v_discountRemark=null;
set v_lineDiscountAmount=0;

if v_discount is not null then
	set v_isDiscountExists=true;
	set v_discountTypeId=JSON_UNQUOTE(JSON_EXTRACT(p_orderList_json, CONCAT('$[', i_orderList, '].discount.discountTypeId')));
	set v_discountValue=JSON_UNQUOTE(JSON_EXTRACT(p_orderList_json, CONCAT('$[', i_orderList, '].discount.discountValue')));
	set v_discountReasonId=JSON_UNQUOTE(JSON_EXTRACT(p_orderList_json, CONCAT('$[', i_orderList, '].discount.reasonId')));
	set v_discountRemark=JSON_UNQUOTE(JSON_EXTRACT(p_orderList_json, CONCAT('$[', i_orderList, '].discount.reasonRemark')));
	
    IF not exists(select * from discount_reason_scope where DiscountReasonId=v_discountReasonId and ScopeId=1) THEN
        SET p_ResponseStatus = 'failed';
        SET p_OutputMessage = concat('Invalid discount reason Id for line discount.');
        leave sp;
	END IF; 

	IF v_discountTypeId = 1 THEN -- Assuming 1 is for percentage discounts
		SET v_lineDiscountAmount = (v_discountValue / 100) * v_unitPrice * v_qty;
	ELSEIF v_discountTypeId = 2 THEN -- Assuming 2 is for amount discounts
		SET v_lineDiscountAmount = v_discountValue; -- Assuming discountValue is the total discount amount for the entire quantity
	END IF;

end if;

-- calcuate for line 
set v_lineTaxRate= (select TaxRate_perc from product where productId=v_productId);
if(v_lineTaxRate is null) then set v_lineTaxRate=0; end if;
-- SET @_grossAmount = (@_unitPrice * v_qty);
-- set @_netAmount=@_grossAmount-@_totalDiscount;
-- set @_lineTax=@_netAmount *v_lineTaxRate;

-- Example values: unit price = 100, quantity = 2, line tax rate = 8%, total discount = 10
CALL calculation_CalculateLineTotals(v_unitPrice, v_qty, v_lineTaxRate, v_lineDiscountAmount, o_grossAmount, o_netAmount, o_lineTaxAmount);

-- SELECT @_grossAmount, @_netAmount, @_lineTax;
set v_grossAmount_total=v_grossAmount_total+o_grossAmount;
set v_lineDiscountAmount_total=v_lineDiscountAmount_total+v_lineDiscountAmount;
set v_subTotal=v_subTotal+o_netAmount;
set v_lineTaxAmount_total=v_lineTaxAmount_total+o_lineTaxAmount;



set v_returnItem=JSON_UNQUOTE(JSON_EXTRACT(p_orderList_json, CONCAT('$[', i_orderList, '].returnItem')));
if (v_returnItem='null' or v_returnItem=null) then set v_returnItem=null;  end if;


set v_isReturned=false;

if v_returnItem is not null then
	set v_isReturned=true;
	set v_pre_orderDetailId_return=JSON_UNQUOTE(JSON_EXTRACT(p_orderList_json, CONCAT('$[', i_orderList, '].returnItem.orderDetailId')));
end if;
-- set @_totalDisount=(@_lineDiscount_perc/100) * @_unitPrice * v_qty;
-- set @_lineTotal=(@_unitPrice * v_qty)-@_totalDisount;
-- set @_grandTotal=@_grandTotal+@_lineTotal;
-- Calculate discount and line total based on discount type

 if not exists (select * from product where productId=v_productId) then
	set p_ResponseStatus='failed';
	set p_OutputMessage=concat('Invalid productId : ',v_productId);
	leave sp;
end if;

 if not isNumeric(v_unitPrice) then
	set p_ResponseStatus='failed';
    set p_OutputMessage=concat('Invalid unitPrice : ',v_unitPrice);
    leave sp;
end if;

 if v_unitPrice<=0 then
	set p_ResponseStatus='failed';
    set p_OutputMessage=concat('UnitPrice can not be zero or less than zero: ');
    leave sp;
end if;

 if not isNumeric(v_qty) then
	set p_ResponseStatus='failed';
    set p_OutputMessage=concat('Invalid qty : ',v_qty);
    leave sp;
end if;

	if v_qty=0 then
		set p_ResponseStatus='failed';
		set p_OutputMessage=concat('Qty can not be zero : ',v_qty);
		leave sp;
	end if;



if (v_isReturned=false) then
	if v_qty<0 then
			set p_ResponseStatus='failed';
			set p_OutputMessage=concat('Issuing items should have positive qty: ');
			leave sp;
	end if;
   
CALL get_DC_ProductIdByProductId(v_productId, o_DC_ProductId);
	IF o_DC_ProductId is null THEN
        SET p_ResponseStatus = 'failed';
        SET p_OutputMessage = concat('Product:',v_productId,' is not exists:');
        leave sp;
	END IF; 

   
 set v_DC_productId_forOrderList=o_DC_ProductId;
    
end if;

if (v_isReturned=true) then
	if not exists (select * from order_details where orderDetailId=v_pre_orderDetailId_return) then
		set p_ResponseStatus='failed';
		set p_OutputMessage=concat('Invalid orderDetailId : ',v_pre_orderDetailId_return);
		leave sp;
	end if;
        
	if v_qty>0 then
			set p_ResponseStatus='failed';
			set p_OutputMessage=concat('Return items should have negetive qty: ',v_qty);
			leave sp;
	end if;

	if v_discount is not null then
			set p_ResponseStatus='failed';
			set p_OutputMessage=concat('Discount can not applied for the return products.');
			leave sp;
	end if;
   
     set v_pre_OrderDetail_productId=(select productId from order_details where orderDetailId=v_pre_orderDetailId_return);
	 if(v_pre_OrderDetail_productId!= v_productId) then
			set p_ResponseStatus='failed';
			set p_OutputMessage=concat('Returning product id should be equal to previous order product id.');
		leave sp;
	end if;
    
 set v_pre_OrderDetail_Qty=(select qty from order_details where orderDetailId=v_pre_orderDetailId_return);
	 if(v_pre_OrderDetail_Qty<(-1 * v_qty)) then
			set p_ResponseStatus='failed';
			set p_OutputMessage=concat('Return qty should not greater than previous order qty');
		leave sp;
	end if;
    

     set v_pre_OrderDetail_customer=(select oh.customerId from order_header as oh 
 inner join order_details as od ON oh.orderId=od.orderId where od.orderDetailId=v_pre_orderDetailId_return);
	 if(v_pre_OrderDetail_customer!=p_CustomerId) then
			set p_ResponseStatus='failed';
			set p_OutputMessage=concat('The current customer should be the same as the previous order when returning the item.');
		leave sp;
	end if;
    
set v_remainingQtyForReturn=(
     SELECT od.Qty-(-sum(orn.Qty)) as remainingQty FROM order_return as orn 
		inner join order_details as od ON orn.pre_orderDetailId_return=od.orderDetailid
		where od.OrderDetailID=v_pre_orderDetailId_return group by od.Qty);
        
		if(v_remainingQtyForReturn is not null and v_remainingQtyForReturn<(-1 * v_qty)) then
			set p_ResponseStatus='failed';
			set p_OutputMessage=concat('There are no enough remaining items for return in order detail.',v_pre_orderDetailId_return);
			leave sp;
        end if;
    

if(v_remainingQtyForReturn is not null) then
	IF p_IsConfirm is null or p_IsConfirm=0 THEN
        SET p_ResponseStatus = 'confirm';
        SET p_OutputMessage = 'Early returnd item details detected. Do you want to continue?.';
        
		SELECT oh.orderNo,od.Qty,sum(orn.Qty) as returnedQty,od.Qty-(-sum(orn.Qty)) as remainingQty,od.productid FROM order_return as orn 
		inner join order_details as od ON orn.pre_orderDetailId_return=od.orderDetailid
		inner join order_header oh on od.orderId=oh.orderId
		where od.OrderDetailID=v_pre_orderDetailId_return 
        group by oh.orderNo,od.Qty,od.productid;
    
        leave sp;
	END IF;
end if;
        
   set v_DC_productId_forOrderList=(SELECT DC_productId FROM order_details where orderDetailId=v_pre_orderDetailId_return);
   
  
end if;
    

 insert into tblOrderList(productId,dc_productId,unitPrice,qty,isDiscountExists,discountTypeId,discountValue,discountReasonId,discountRemark,lineDiscountAmount,
 lineTaxAmount,lineTaxRate,grossAmount,netAmount,
 isReturned,pre_orderDetailId_return)
values (v_productId,v_DC_productId_forOrderList,v_unitPrice,v_qty,v_isDiscountExists,
v_discountTypeId,v_discountValue,v_discountReasonId,v_discountRemark,v_lineDiscountAmount,
o_lineTaxAmount,v_lineTaxRate,o_grossAmount, o_netAmount,
v_isReturned,v_pre_orderDetailId_return);
 
        SET i_orderList = i_orderList + 1;
end while;
-- END order list json to table

 set v_servicechargeRate=0.00;
   set v_overall_TaxRate=8;
 
    -- Calculate Order Discount if applicable
    IF isOrderDiscountExists THEN
        CASE orderDiscountTypeId
            WHEN 1 THEN -- Assuming 1 is for a percentage discount
                SET _order_DiscountAmount = (orderDiscountValue / 100) * v_subTotal; 
            WHEN 2 THEN -- Assuming 2 is for a fixed amount discount
                SET _order_DiscountAmount = orderDiscountValue;
            -- ... [Handle other discount types if applicable]
        END CASE;
    END IF;
    
  --  set @_adjusted_subtotal=@_subTotal-_orderDiscountAmount;
   -- set @_overallTax=(@_overallTaxRate/100) * @_adjusted_subtotal;
	-- set @_servicecharge=(@_servicechargeRate/100) * @_adjusted_subtotal;
   
-- SET @_grandTotal = @_adjusted_subtotal + @_lineTax_total+@_overallTax+ @_servicecharge;
 
-- Example call with hypothetical values
CALL calculation_CalculateOrderTotal(
    v_subTotal,_order_DiscountAmount,v_overall_TaxRate,v_servicechargeRate,v_lineTaxAmount_total,
    o_adjusted_subtotal, o_overall_TaxAmount, o_servicecharge, ov_grandTotal);
    
    
SET v_grandTotal=ov_grandTotal;

-- select @_grossAmount_total,v_lineDiscountAmount_total, @_subTotal,
-- _order_DiscountAmount,@p_adjusted_subtotal,
-- @_overall_TaxRate,@p_overall_TaxAmount,@_servicechargeRate,@p_servicecharge,
-- @_lineTaxAmount_total,@p_grandTotal;
-- SELECT   @p_adjusted_subtotal AS AdjustedSubtotal, @p_overallTax AS OverallTax, @p_servicecharge AS ServiceCharge, @p_grandTotal AS GrandTotal;

-- leave sp;

-- START payment list json to table
    SET noOfItemsInPaymentList = JSON_LENGTH(p_paymentList_json);
    
    DROP TEMPORARY TABLE IF EXISTS tblPaymentList;
   create temporary table tblPaymentList(methodId int,amountPaid decimal(10,2),
 cardHolderName varchar(50),bankId int,cardTypeId int,cardLastFourDigits varchar(4),cardExpirationMonth varchar(2),cardExpirationYear varchar(4));
   

 
while i_paymentList < noOfItemsInPaymentList do
   
      SET v_methodId = JSON_UNQUOTE(JSON_EXTRACT(p_paymentList_json, CONCAT('$[', i_paymentList, '].methodId')));
SET v_amountPaid = JSON_UNQUOTE(JSON_EXTRACT(p_paymentList_json, CONCAT('$[', i_paymentList, '].amountPaid')));

set v_cashPayment= JSON_UNQUOTE(JSON_EXTRACT(p_paymentList_json, CONCAT('$[', i_paymentList, '].cashPayment')));


set v_cardPayment= JSON_UNQUOTE(JSON_EXTRACT(p_paymentList_json, CONCAT('$[', i_paymentList, '].cardPayment')));
if v_cardPayment is not null then
	SET v_cardHolderName = JSON_UNQUOTE(JSON_EXTRACT(p_paymentList_json, CONCAT('$[', i_paymentList, '].cardPayment.cardHolderName')));
	IF v_cardHolderName = 'null' THEN SET v_cardHolderName = NULL; END IF;

	SET v_bankId = JSON_UNQUOTE(JSON_EXTRACT(p_paymentList_json, CONCAT('$[', i_paymentList, '].cardPayment.bankId')));
	IF v_bankId = 'null' THEN SET v_bankId = NULL; END IF;

	SET v_cardTypeId = JSON_UNQUOTE(JSON_EXTRACT(p_paymentList_json, CONCAT('$[', i_paymentList, '].cardPayment.cardTypeId')));
	IF v_cardTypeId = 'null' THEN SET v_cardTypeId = NULL; END IF;

	SET v_cardLastFourDigits = JSON_UNQUOTE(JSON_EXTRACT(p_paymentList_json, CONCAT('$[', i_paymentList, '].cardPayment.cardLastFourDigits')));
	IF v_cardLastFourDigits = 'null' THEN SET v_cardLastFourDigits = NULL; END IF;

	SET v_cardExpirationMonth = JSON_UNQUOTE(JSON_EXTRACT(p_paymentList_json, CONCAT('$[', i_paymentList, '].cardPayment.cardExpirationMonth')));
	IF v_cardExpirationMonth = 'null' THEN SET v_cardExpirationMonth = NULL; END IF;

	SET v_cardExpirationYear = JSON_UNQUOTE(JSON_EXTRACT(p_paymentList_json, CONCAT('$[', i_paymentList, '].cardPayment.cardExpirationYear')));
	IF v_cardExpirationYear = 'null' THEN SET v_cardExpirationYear = NULL; END IF;
end if;
     
 if not isNumeric(v_methodId) then
	set p_ResponseStatus='failed';
    set p_OutputMessage=concat('Invalid methodId : ',v_methodId);
    leave sp;
end if;

 if not isNumeric(v_amountPaid) then
	set p_ResponseStatus='failed';
    set p_OutputMessage=concat('Invalid amountPaid : ',v_amountPaid);
    leave sp;
end if;


 if not isNumeric(v_cardTypeId) then
	set p_ResponseStatus='failed';
    set p_OutputMessage=concat('Invalid cardTypeId : ',v_cardTypeId);
    leave sp;
end if;

 if not isNumeric(v_cardLastFourDigits) then
	set p_ResponseStatus='failed';
    set p_OutputMessage=concat('Invalid cardLastFourDigits : ',v_cardLastFourDigits);
    leave sp;
end if;

 if not isNumeric(v_cardExpirationMonth) then
	set p_ResponseStatus='failed';
    set p_OutputMessage=concat('Invalid cardExpirationMonth : ',v_cardExpirationMonth);
    leave sp;
end if;

 if not isNumeric(v_cardExpirationYear) then
	set p_ResponseStatus='failed';
    set p_OutputMessage=concat('Invalid cardExpirationYear : ',v_cardExpirationYear);
    leave sp;
end if;
         
 if not exists (select * from payment_methods where MethodId=v_methodId) then
	set p_ResponseStatus='failed';
    set p_OutputMessage=concat('Invalid MethodId : ',v_methodId);
    leave sp;
end if;
         
 if v_cardTypeId is not null and not exists (select * from card_types where CardTypeId=v_cardTypeId) then
	set p_ResponseStatus='failed';
    set p_OutputMessage=concat('Invalid CardTypeId : ',v_cardTypeId);
    leave sp;
end if;

-- check card payments
if v_methodId=2 then
	set v_amountPaid_card=v_amountPaid_card+v_amountPaid;
end if;

-- check cash payments
if v_methodId=1 then
	set v_amountPaid_cash=v_amountPaid_cash+v_amountPaid;
end if;


        
insert into tblPaymentList(methodId,amountPaid,cardHolderName,bankId,cardTypeId,cardLastFourDigits,cardExpirationMonth,cardExpirationYear)
values( v_methodId,v_amountPaid,v_cardHolderName,v_bankId,v_cardTypeId,
v_cardLastFourDigits,v_cardExpirationMonth,v_cardExpirationYear);  
    
    SET i_paymentList = i_paymentList + 1;
end while;
-- END payment list json to table
-- when grond total=0;

  set _totalPaid=v_amountPaid_card+v_amountPaid_cash;
  
             
if(v_grandTotal>0) then
	if v_amountPaid_card + v_amountPaid_cash < v_grandTotal then
		set v_shortfall =v_grandTotal-(v_amountPaid_card + v_amountPaid_cash);
		set p_ResponseStatus='failed';
			set p_OutputMessage=concat('Insufficient payment. An additional [currency]',v_shortfall,' is needed');
			leave sp;
	end if;
	if v_amountPaid_card > v_grandTotal then
		set p_ResponseStatus='failed';
			set p_OutputMessage=concat('Overpayment. Card payment exceeds the total amount.');
			leave sp;
	end if;
	if v_amountPaid_cash > (v_grandTotal-v_amountPaid_card) then
		set v_balanceAmount =v_grandTotal-(v_amountPaid_card + v_amountPaid_cash);
        -- turn negative value to positive value
       set v_balanceAmount= -1 * v_balanceAmount;
        set p_balanceAmount=v_balanceAmount;
	-- set p_ResponseStatus='failed';
			-- set p_OutputMessage=concat('v_balanceAmount',v_balanceAmount);
			-- leave sp;
	end if;
end if;



 -- select @_grandTotal as _grandTotal,@_totalPaid as totalPaid;
-- leave sp;
-- when grand total <0
if(v_grandTotal<0) then
	if(v_grandTotal!=_totalPaid) then
	set p_ResponseStatus='failed';
		set p_OutputMessage=concat('The refund amount does not match the order amount.',v_grandTotal);
		leave sp;
	end if;
end if;


-- when grand total >0
-- if(v_grandTotal>0) then
-- if(v_grandTotal>_totalPaid) then
-- set p_ResponseStatus='failed';
	-- set p_OutputMessage=concat('Paid amount is not sufficient for the order amount.',v_grandTotal);
	-- leave sp;
	-- end if;
    
   -- if(v_grandTotal<_totalPaid) then
-- set p_ResponseStatus='failed';
	-- set p_OutputMessage=concat('The paid amount exceeds the order amount. grand total:',v_grandTotal,'| totalPaied:',_totalPaid);
	-- leave sp;
-- end if;
    
-- end if;

-- get customer details
 if not exists (select * from customer where customerId=p_CustomerID) then
	set p_ResponseStatus='failed';
set p_OutputMessage=concat('Invalid customerId : ',p_CustomerID);
leave sp;
end if;


   
INSERT INTO `order_header`(`SessionId`,`userLogId`,DC_CustomerId,dc_StoreId,terminalId,customerId,DC_TerminalId,CountryId,CurrencyId,PrimaryLanguageId,
StoreId,userId,dc_userId)
VALUES (p_SessionID,p_UserLogID,v_DC_CustomerId,v_DC_StoreId,p_TerminalId,p_CustomerID,v_DC_TerminalId,v_CountryId,v_CurrencyId,v_PrimaryLanguageId,
v_StoreId,v_UserId,v_DC_UserId);

SET v_orderId = LAST_INSERT_ID();
SET v_orderNo = LPAD(v_orderId, 5, '0');

UPDATE `order_header` SET `OrderNo` =v_orderNo WHERE `OrderId`=v_orderId;
  
  IF isOrderDiscountExists THEN
		INSERT INTO `order_overall_discount`(`OrderId`,`DiscountTypeId`,`DiscountValue`,`DiscountReasonId`,`Remark`,DiscountAmount)
		VALUES(v_orderId,orderDiscountTypeId,orderDiscountValue,orderDiscountReasonId,orderDiscountRemark,_order_DiscountAmount);
	END IF;

IF v_overall_TaxRate>0 then
	INSERT INTO `order_overall_tax`(`OrderId`,`TaxRate`,TaxAmount)
	VALUES(v_orderId,v_overall_TaxRate,o_overall_TaxAmount);
end if;


-- START insert order details
set v_totalItems_tblOrderList=(select count(*) from tblOrderList);
while (0< v_totalItems_tblOrderList) do

set v_productId=(select productId from tblOrderList  limit 1);
set v_dc_productId=(select dc_productId from tblOrderList  limit 1);

set v_unitPrice=(select unitPrice from tblOrderList  limit 1);
set v_qty=(select qty from tblOrderList  limit 1);

set v_lineTaxRate=(select lineTaxRate from tblOrderList  limit 1);
set o_lineTaxAmount=(select lineTaxAmount from tblOrderList  limit 1);

set o_grossAmount=(select grossAmount from tblOrderList  limit 1);
set o_netAmount=(select netAmount from tblOrderList  limit 1);
set v_lineDiscountAmount=(select lineDiscountAmount from tblOrderList  limit 1);

set v_isReturned=(select isReturned from tblOrderList  limit 1);
set v_pre_orderDetailId_return=(select pre_orderDetailId_return from tblOrderList  limit 1);

-- set @_totalLineDisount=@_unitPrice * v_qty * (@_lineDiscount_perc/100);
set v_isDiscountExists=(select isDiscountExists from tblOrderList  limit 1);

	set v_discountTypeId=(select discountTypeId from tblOrderList  limit 1);
	set v_discountValue=(select discountValue from tblOrderList  limit 1);
	set v_discountReasonId=(select discountReasonId from tblOrderList  limit 1);
	set v_discountRemark=(select discountRemark from tblOrderList  limit 1);

-- IF v_discountTypeId = 1 THEN -- Assuming 1 is for percentage discounts
-- SET @_totalDiscount = (v_discountValue / 100) * @_unitPrice * v_qty;
-- ELSEIF v_discountTypeId = 2 THEN -- Assuming 2 is for amount discounts
	-- 	SET @_totalDiscount = v_discountValue * v_qty; -- Assuming discountValue is the total discount amount for the entire quantity
	-- END IF;
--

set v_measurementUnitId=(select MeasurementUnitId from product where ProductId=v_productId);

INSERT INTO `order_details`(`OrderID`,`Qty`,`ProductId`,DC_productId,unitPrice,isReturned,GrossAmount,NetAmount,MeasurementUnitId)
 values (v_orderId,v_qty,v_productId,v_dc_productId,v_unitPrice,v_isReturned,o_grossAmount,o_netAmount,v_measurementUnitId);
 
 SET v_orderDetailId = LAST_INSERT_ID();
 
 if v_isDiscountExists=true then
	 INSERT INTO `order_line_discount`(`OrderDetailId`,`DiscountTypeId`,`DiscountValue`,`DiscountReasonId`,`Remark`,DiscountAmount)
	VALUES(v_orderDetailId,v_discountTypeId,v_discountValue,v_discountReasonId,v_discountRemark,v_lineDiscountAmount);
 end if;

if v_lineTaxRate>0 then
	INSERT INTO `order_line_tax`(`OrderDetailId`,`TaxRate`,TaxAmount) VALUES (v_orderDetailId,v_lineTaxRate,o_lineTaxAmount);
end if;

if(v_isReturned=true) then
insert into order_return(`orderDetailId`,`pre_orderDetailId_return`,Qty)
values(v_orderDetailId,v_pre_orderDetailId_return,v_qty);
end if;


 
delete  from tblOrderList limit 1;
set v_totalItems_tblOrderList=(select count(*) from tblOrderList);
end while;
-- END insert order details

if(v_grandTotal!=0) then
-- START insert payement details
set v_totalItems_tblPaymentList=(select count(*) from tblPaymentList);
while (0< v_totalItems_tblPaymentList) do

set v_methodId=(select methodId from tblPaymentList  limit 1);
set v_amountPaid=(select amountPaid from tblPaymentList  limit 1);
set v_cardHolderName=(select  cardHolderName from tblPaymentList  limit 1);
set v_bankId=(select  bankId from tblPaymentList  limit 1);
set v_cardTypeId= (select cardTypeId  from tblPaymentList  limit 1);
set v_cardLastFourDigits=(select cardLastFourDigits from tblPaymentList  limit 1);
set v_cardExpirationMonth=(select cardExpirationMonth from tblPaymentList  limit 1);
set v_cardExpirationYear=(select cardExpirationYear from tblPaymentList  limit 1);

-- insert payments
INSERT INTO `order_payments`(`OrderId`,`MethodId`,`AmountPaid`)
select v_orderId,v_methodId,v_amountPaid;

SET v_paymentId = LAST_INSERT_ID();

-- insert cash payments
if v_methodId=1 then
INSERT INTO cash_payments(`PaymentId`,receivedAmount,balanceAmount)
VALUES (v_paymentId,_totalPaid,v_balanceAmount);
end if;

-- insert card payments
if v_methodId=2 then
INSERT INTO card_payments(`PaymentId`,`CardHolderName`,bankId,`CardTypeId`,`CardLastFourDigits`,
`CardExpirationMonth`,`CardExpirationYear`)
VALUES (v_paymentId,v_cardHolderName,v_bankId,v_cardTypeId,v_cardLastFourDigits,
v_cardExpirationMonth,v_cardExpirationYear);
end if;

delete  from tblPaymentList limit 1;
set v_totalItems_tblPaymentList=(select count(*) from tblPaymentList);
end while;
-- END insert payement details
end if;


INSERT INTO `order_summary_processed`(`OrderId`,`GrossAmount_total`,`LineDiscountAmount_total`,`OverallDiscountAmount`,
`All_DiscountAmount_total`,`SubTotal`,`Adjusted_subtotal`,`GrandTotal`,Overall_TaxAmount,LineTaxAmount_total)
VALUES(v_orderId,v_grossAmount_total,v_lineDiscountAmount_total,_order_DiscountAmount,
v_lineDiscountAmount_total+_order_DiscountAmount,v_subTotal,o_adjusted_subtotal,v_grandTotal,o_overall_TaxAmount,v_lineTaxAmount_total);


    set p_OrderNo=v_orderNo;
	SET p_ResponseStatus = 'success';
	SET p_OutputMessage = 'Added Successfully.';
    
     DROP TEMPORARY TABLE IF EXISTS tblOrderList;
     DROP TEMPORARY TABLE IF EXISTS tblPaymentList;
    COMMIT;
    

     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Order_Select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Order_Select`(
  IN p_OrderId INT,
  IN p_orderNo VARCHAR(50),
  
  IN p_OrderFromDate date,
   IN p_OrderToDate date,
    IN p_CustomerId INT,
     IN p_CustomerCode VARCHAR(50),
       IN p_CustomerName VARCHAR(100),
    
    IN p_TerminalId INT,
     IN p_SessionId INT,
     
	IN p_Skip INT,
    IN p_Limit INT,
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
	OUT p_TotalRows INT
)
sp: BEGIN

-- DECLARE _query varchar(10000);
DECLARE _PagingQuery VARCHAR(1000);
DECLARE _filter varchar(1000);

SET _filter = ' WHERE 1 = 1 ';

set _PagingQuery='';
IF p_Skip IS NOT NULL AND p_Limit IS NOT NULL THEN
    SET _PagingQuery = CONCAT(' LIMIT ', p_Skip, ', ', p_Limit);
    
ELSEIF p_Skip IS NOT NULL AND p_Limit IS NULL THEN
    SET p_ResponseStatus = 'invalid';
    SET p_OutputMessage = 'The _Limit parameter is not passed or set _Skip parameter to null for unlimited data.';
	leave sp;
    
ELSEIF p_Skip IS NULL AND p_Limit IS NOT NULL THEN
    SET p_ResponseStatus = 'invalid';
    SET p_OutputMessage = 'The _Skip parameter is not passed or set _Limit parameter to null for unlimited data.';
	leave sp;
END IF;


        IF p_OrderId IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND oh.OrderId = ', p_OrderId);
        END IF;
        
        IF p_OrderFromDate IS NOT NULL and p_OrderToDate IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND oh.CreatedDate_UTC between ''', p_OrderFromDate, ''' and ''',p_OrderToDate, '''');
       elseif p_OrderFromDate IS NOT NULL AND p_OrderToDate IS  NULL OR 
       p_OrderFromDate IS NULL AND p_OrderToDate IS NOT NULL THEN
          SET p_ResponseStatus = 'invalid';
		SET p_OutputMessage = 'You have to supply both fromDate and toDate';
		leave sp;
       END IF;
        
        
               IF p_orderNo IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND oh.orderNo = ''', p_orderNo, '''');
        END IF;
        
        
        IF p_CustomerId IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND oh.CustomerId = ''', p_CustomerId, '''');
        END IF;
        
          IF p_CustomerCode IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND c.customerCode = ''', p_CustomerCode, '''');
        END IF;
        
            IF p_CustomerName IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND c.customerName  LIKE ''%', p_CustomerName, '%''');
        END IF;
        
        IF p_TerminalId IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND oh.TerminalId = ''', p_TerminalId, '''');
        END IF;
        
        IF p_SessionId IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND oh.SessionId = ', p_SessionId);
        END IF;
 

SET @_query = CONCAT('SELECT oh.orderId,orderNo,isVoided,terminalId,sessionId,
oh.createdDate_UTC,currencyId,oh.customerId,oh.countryId,c.customerName,
c.customerCode,osp.grossAmount_total,osp.lineDiscountAmount_total,
osp.overallDiscountAmount,osp.all_DiscountAmount_total,osp.subTotal,osp.adjusted_subtotal,
osp.grandTotal,osp.lineTaxAmount_total,osp.overall_TaxAmount, 
CAST(oh.isVoided AS UNSIGNED) as isVoided
  from order_header as oh 
inner join order_summary_processed as osp ON oh.OrderId=osp.OrderId
inner join customer as c on oh.customerid=c.customerid  ',_filter,' order by oh.createdDate_UTC desc ',_PagingQuery);

	-- Execute the query
	PREPARE stmt FROM @_query;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;


    SET @queryTotal = CONCAT('SELECT COUNT(OrderId) INTO @totalRows from order_header as oh 
inner join customer as c on oh.customerid=c.customerid ', _filter);
        
    PREPARE stmt FROM @queryTotal;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    SET p_TotalRows = @totalRows;

set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Product_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Product_Delete`(
    IN p_ProductId INT,
    
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),
    -- IN p_PromptBeforeContinue BIT,
    IN p_IsConfirm bit,
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN
  
DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    
     DECLARE custom_error_low CONDITION FOR SQLSTATE '45001';  -- Custom error with a low severity SQLSTATE code
    DECLARE custom_error_high CONDITION FOR SQLSTATE '45002'; -- Custom error with a high severity SQLSTATE code
    
        SHOW ERRORS;  -- this is the only one which you need
        ROLLBACK;   
    END;
    
    START TRANSACTION;
    
    SET p_OutputMessage = 'null';
    -- SET p_IsConfirm = 0;
    
     if not exists (select * from product where ProductId=p_ProductId) then
		set p_OutputMessage='Product is not exists';
        set p_ResponseStatus='failed';
        leave sp;
	end if;
    
    IF p_IsConfirm is null or p_IsConfirm=0 THEN
        SET p_ResponseStatus = 'confirm';
        SET p_OutputMessage = 'Are you sure you want to delete this product?.';
        leave sp;
      END IF;
      
       
       if  exists (select * from order_details where ProductId=p_ProductId) then
		set p_OutputMessage='Product is already in use';
        set p_ResponseStatus='failed';
        leave sp;
	end if;

		delete from product_category where productId=p_ProductId;
         DELETE FROM Product WHERE ProductId = p_ProductId;
        SET p_ResponseStatus = 'success';
        SET p_OutputMessage = 'Deleted Successfully.';

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Product_Insert_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Product_Insert_Update`(
    IN p_tableID INT,
    IN p_StoreId INT,
    IN p_ProductNo VARCHAR(100),
	IN p_isProductNoAutoGenerate VARCHAR(100),
    IN p_ProductName VARCHAR(500),
    IN p_CategoryIdList_json json,
    IN p_MeasurementUnitId int,
    IN p_UnitPrice DECIMAL(10, 2),
	IN p_DepartmentId int,
    IN p_Barcode VARCHAR(100),
    IN p_ReorderLevel DECIMAL(10, 2),
    
    IN p_SaveType VARCHAR(1),
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),
    
    IN p_IsConfirm BIT,
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
    OUT p_productId int
)
sp: BEGIN

		DECLARE noOfItemsInCategoryList int;
        DECLARE i_categoryList int default 0;
        
        declare v_generatedProductNo varchar(50);
        
      DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    
     DECLARE custom_error_low CONDITION FOR SQLSTATE '45001';  -- Custom error with a low severity SQLSTATE code
    DECLARE custom_error_high CONDITION FOR SQLSTATE '45002'; -- Custom error with a high severity SQLSTATE code
    
        SHOW ERRORS;  -- this is the only one which you need
        ROLLBACK;   
    END;
    
    START TRANSACTION;
    
	if (p_tableID<1) then
		set p_OutputMessage='Invalid tableId';
        set p_ResponseStatus='failed';
        leave sp;
	end if;
    
    
	set noOfItemsInCategoryList=JSON_LENGTH(p_CategoryIdList_json);
  
	if JSON_LENGTH(p_CategoryIdList_json)=0 or p_CategoryIdList_json is null then
		set p_ResponseStatus='failed';
		set p_OutputMessage=concat('At least one category is required.');
		leave sp;
	end if;
    
	if JSON_LENGTH(p_CategoryIdList_json)>3 then
		set p_ResponseStatus='failed';
		set p_OutputMessage=concat('More than 3 categories selected. Please select a maximum of 3 categories.');
		leave sp;
	end if;

 DROP TEMPORARY TABLE IF EXISTS tblcategory;
   create temporary table tblcategory(categoryId int);
   
        WHILE i_categoryList < noOfItemsInCategoryList DO
           set @_categoryId = JSON_EXTRACT(p_CategoryIdList_json, CONCAT('$[', i_categoryList, ']'));
			if not isNumeric(@_categoryId) then
				set p_ResponseStatus='failed';
				set p_OutputMessage=concat('Invalid categoryId : ',@_categoryId);
				leave sp;
			end if;
            
            if not exists(select * from category where categoryId=@_categoryId) then
				set p_ResponseStatus='failed';
				set p_OutputMessage=concat('Un registerd categoryId : ',@_categoryId);
				leave sp;
			end if;

            INSERT INTO tblcategory(categoryId) VALUES (@_categoryId);
            
            SET i_categoryList = i_categoryList + 1;
            
		END WHILE;
        


    IF p_SaveType = 'I' THEN
    
      if (p_isProductNoAutoGenerate=false) then
      
      if(p_ProductNo is null or trim(p_ProductNo)='') then
			set p_OutputMessage=concat('Product No is required or check auto generate productNo','');
			set p_ResponseStatus='failed';
			leave sp;
        end if;
        
          if exists (select * from product where  ProductNo=p_ProductNo) then
				set p_OutputMessage='Product No already exists I';
				set p_ResponseStatus='failed';
				leave sp;
			end if;
        
        end if;
     
            
		 if exists (select * from product where ProductName=p_ProductName) then
				set p_OutputMessage='Product Name already exists';
				set p_ResponseStatus='failed';
				leave sp;
			end if;



        INSERT INTO Product (
        productId,
            ProductName,
            MeasurementUnitId,
            Barcode,
            UnitPrice,
            DepartmentId,
          --  CategoryId,
            UserLogId,
            ReorderLevel,
            ModifiedDate_UTC,
            ModifiedDate_ServerTime
        )
        VALUES (
			p_tableId,
            p_ProductName,
            p_MeasurementUnitId,
            p_Barcode,
            p_UnitPrice,
            p_DepartmentId,
           -- p_CategoryId,
            p_UserLogID,
            p_ReorderLevel,
            utc_timestamp(),
            current_timestamp()
        );

      set  @_productId=LAST_INSERT_ID();
 
 
 if (p_isProductNoAutoGenerate=true) then
	set v_generatedProductNo= LPAD((@_productId + 1), 5, '0');
	update Product set ProductNo=v_generatedProductNo where ProductId=@_productId;
else 
	update Product set ProductNo=p_ProductNo where ProductId=@_productId;
end if;



      insert into product_category(productId,categoryId) select @_productId,categoryId from tblcategory;
     
     -- add to the store
     insert into product_store(productId,storeId) values(@_productId,p_StoreId);
    
      -- select * from tblcategory
        SET p_ResponseStatus = 'success';
        SET p_OutputMessage = 'Added Successfully';
        set p_productId=@_productId;
        
    ELSEIF p_SaveType = 'U' THEN
    
	if not exists (select * from product where ProductId=p_tableID) then
		set p_OutputMessage='Invalid product id';
        set p_ResponseStatus='failed';
        leave sp;
	end if;
    
	if exists (select * from product where ProductNo=p_ProductNo and ProductId!=p_tableID) then
		set p_OutputMessage='Product No already exists';
        set p_ResponseStatus='failed';
        leave sp;
	end if;

	if exists (select * from product where ProductName=p_ProductName and ProductId!=p_tableID) then
		set p_OutputMessage='Product Name already exists';
        set p_ResponseStatus='failed';
        leave sp;
	end if;

-- CALL IsProductDepends(p_tableID, @p_ResponseStatus, @p_OutputMessage,@p_IsDepend);
-- if (@p_IsDepend=1) then
	-- set p_OutputMessage='Updation denied. Some transactional data are depend on this product';
   --     set p_ResponseStatus='failed';
    --     leave sp;
-- end if;

-- Temporary table for current categories
DROP TEMPORARY TABLE IF EXISTS currentCategories;
CREATE TEMPORARY TABLE currentCategories(categoryId INT);

INSERT INTO currentCategories(categoryId)
SELECT categoryId FROM product_category WHERE productId = p_tableID;


-- Temporary table for categories to be added
DROP TEMPORARY TABLE IF EXISTS categoriesToAdd;
CREATE TEMPORARY TABLE categoriesToAdd(categoryId INT);

-- Temporary table for categories to be removed
DROP TEMPORARY TABLE IF EXISTS categoriesToRemove;
CREATE TEMPORARY TABLE categoriesToRemove(categoryId INT);

-- Find categories to add (in new but not in current)
INSERT INTO categoriesToAdd(categoryId)
SELECT t.categoryId FROM tblcategory t
WHERE NOT EXISTS (SELECT 1 FROM currentCategories c WHERE t.categoryId = c.categoryId);

-- Find categories to remove (in current but not in new)
INSERT INTO categoriesToRemove(categoryId)
SELECT c.categoryId FROM currentCategories c
WHERE NOT EXISTS (SELECT 1 FROM tblcategory t WHERE t.categoryId = c.categoryId);

-- Remove the old categories
DELETE FROM product_category
WHERE productId = p_tableID AND categoryId IN (SELECT categoryId FROM categoriesToRemove);

-- Add the new categories
INSERT INTO product_category(productId, categoryId)
SELECT p_tableID, categoryId FROM categoriesToAdd;



        UPDATE Product
        SET ProductName = p_ProductName,
            MeasurementUnitId = p_MeasurementUnitId,
            ProductNo = p_ProductNo,
            Barcode = p_Barcode,
            UnitPrice = p_UnitPrice,
            DepartmentId=p_DepartmentId,
          --  CategoryId = p_CategoryId,
            UserLogId = p_UserLogID,
            ModifiedDate_ServerTime = CURRENT_TIME(),
            ModifiedDate_UTC = UTC_TIMESTAMP(),
            ReorderLevel = p_ReorderLevel
        WHERE ProductId = p_tableID;
                
		SET p_ResponseStatus = 'success';
        SET p_OutputMessage = 'Updated Successfully.';

    END IF;
    
    if(p_tableID is not null) then  SET p_productId=p_tableID; end if;
    
    COMMIT;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Product_Select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Product_Select`(
  IN p_ProductId INT,
	IN p_ProductNo VARCHAR(100),
    IN p_ProductName VARCHAR(500),
    IN p_Barcode VARCHAR(100),
    IN p_CategoryId INT,
	IN p_MeasurementUnitId INT,
   
	IN p_SearchByKeyword BIT,
	IN p_Skip INT,
    IN p_Limit INT,
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),

    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
	OUT p_TotalRows INT
)
sp: BEGIN

-- DECLARE _query varchar(10000);
DECLARE _PagingQuery VARCHAR(1000);
DECLARE _filter varchar(1000);

SET _filter = ' WHERE 1=1 ';

set _PagingQuery='';
IF p_Skip IS NOT NULL AND p_Limit IS NOT NULL THEN
    SET _PagingQuery = CONCAT(' LIMIT ', p_Skip, ', ', p_Limit);
    
ELSEIF p_Skip IS NOT NULL AND p_Limit IS NULL THEN
    SET p_ResponseStatus = 'invalid';
    SET p_OutputMessage = 'The _Limit parameter is not passed or set _Skip parameter to null for unlimited data.';
	leave sp;
    
ELSEIF p_Skip IS NULL AND p_Limit IS NOT NULL THEN
    SET p_ResponseStatus = 'invalid';
    SET p_OutputMessage = 'The _Skip parameter is not passed or set _Limit parameter to null for unlimited data.';
	leave sp;
END IF;



IF p_SearchByKeyword = 0 THEN
        IF p_ProductId IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND p.ProductID = ', p_ProductId);
        END IF;
        
        IF p_ProductName IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND p.ProductName LIKE ''%', p_ProductName, '%''');
        END IF;
        
        IF p_ProductNo IS NOT NULL THEN
               SET _filter = CONCAT(_filter, ' AND p.ProductNo LIKE ''%', p_ProductNo, '%''');
        END IF;
        
        IF p_Barcode IS NOT NULL THEN
                      SET _filter = CONCAT(_filter, ' AND p.Barcode LIKE ''%', p_Barcode, '%''');
        END IF;
        
        IF p_CategoryId IS NOT NULL THEN
			IF p_CategoryId=-1 THEN
              SET _filter = CONCAT(_filter, ' ');
            else
            SET _filter = CONCAT(_filter, ' AND pc.CategoryId = ', p_CategoryId);
            end if;
        END IF;
        
        
		IF p_MeasurementUnitId IS NOT NULL THEN
			IF p_MeasurementUnitId=-1 THEN
              SET _filter = CONCAT(_filter, ' ');
            else
            SET _filter = CONCAT(_filter, ' AND p.MeasurementUnitId = ', p_MeasurementUnitId);
            end if;
        END IF;
        
        
        
    ELSE
        IF p_ProductId IS NOT NULL THEN
            SET p_ResponseStatus = 'invalid';
            SET p_OutputMessage = 'ProductID is not supported for keyword search.';
			leave sp;
        END IF;
        
        IF p_ProductName IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND i.ProductName LIKE ''%', p_ProductName, '%''');
        END IF;
        
        IF p_ProductNo IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND i.ProductNo LIKE ''%', p_ProductNo, '%''');
        END IF;
        
        IF p_Barcode IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND i.Barcode LIKE ''%', p_Barcode, '%''');
        END IF;
        
        IF p_CategoryId IS NOT NULL THEN
            SET p_ResponseStatus = 'invalid';
            SET p_OutputMessage = 'CategoryId is not supported for keyword search.';
			leave sp;
        END IF;
    END IF;

SET @_query = CONCAT('SELECT p.productId,
                             p.productName,
                             p.measurementUnitId,
                             mu.measurementUnitName,
                             p.productNo,
                             p.unitPrice,
                             p.barcode,
                             JSON_ARRAYAGG(JSON_OBJECT("id", c.CategoryId, "displayName", c.CategoryName)) AS categories,
                             p.reorderLevel,
                             p.createdDate_UTC,
                             p.modifiedDate_UTC,
                             p.userLogId,
                             p.taxRate_perc,
                             d.departmentName,
                             p.departmentId,
                             p.imageUrl
                      FROM Product AS p
                      INNER JOIN product_category AS pc ON p.ProductId = pc.ProductId 
                      INNER JOIN Category AS c ON pc.CategoryId = c.CategoryId
                      INNER JOIN Department as d ON p.departmentId=d.departmentId
                      INNER JOIN measurement_unit AS mu ON p.measurementUnitId = mu.measurementUnitId',
                      _filter,
                      ' GROUP BY p.productId, p.productName, p.measurementUnitId, mu.measurementUnitName, p.productNo, p.unitPrice, p.barcode, p.reorderLevel, p.createdDate_UTC, p.modifiedDate_UTC, p.userLogId, p.taxRate_perc',
                      _PagingQuery);

-- Execute the main query
PREPARE stmt FROM @_query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Updated counting query to account for the joins and group by
SET @queryTotal = CONCAT('SELECT COUNT(DISTINCT p.ProductID) INTO @totalRows FROM Product AS p
                          INNER JOIN product_category AS pc ON p.ProductId = pc.ProductId
                          INNER JOIN Category AS c ON pc.CategoryId = c.CategoryId ', _filter);
    
PREPARE stmt FROM @queryTotal;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET p_TotalRows = @totalRows;

SET p_ResponseStatus='success';
SET p_OutputMessage='loaded successfully';


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Session_End` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Session_End`(
     IN p_sessionId INT,
	IN p_terminalId INT,
	IN p_closingCash DECIMAL(10, 2),
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),
    IN p_IsConfirm BIT,
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN

   DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING
    BEGIN
        ROLLBACK; -- Rollback the transaction on error
        GET DIAGNOSTICS CONDITION 1
            @p_sql_state = RETURNED_SQLSTATE,
            @p_mysql_code = MYSQL_ERRNO,
            @p_message_text = MESSAGE_TEXT;
        SET p_ResponseStatus = 'failed';
        SET p_OutputMessage = CONCAT('Error: [', @p_sql_state, '] - ', @p_mysql_code, ': ', @p_message_text);
        RESIGNAL; -- Re-raise the original exception
    END;
    
    START TRANSACTION;
    
    if not exists (select * from terminal where terminalId=p_terminalId) then
		set p_OutputMessage=concat('Invalid terminal id :',p_terminalId);
        set p_ResponseStatus='failed';
        set p_sessionId=p_sessionId;
        leave sp;
	end if;

    CALL get_DC_SystemInfoIdByTerminalId(p_terminalId, @p_DC_systemInfoId);
	IF @p_DC_systemInfoId is null THEN
        SET p_ResponseStatus = 'failed';
        SET p_OutputMessage = concat('Systeminfo details are not exists for Terminal:',p_terminalId);
        leave sp;
	END IF; 
    
      if not exists (select * from sessionstartdetails where sessionId=p_sessionId and terminalId=p_terminalId) then
		set p_OutputMessage=concat('There is no session :',p_sessionId,' for terminal:',p_terminalId);
        set p_ResponseStatus='failed';
        set p_sessionId=p_sessionId;
        leave sp;
end if;
   
   if exists (select * from sessionenddetails where sessionId=p_sessionId and terminalId=p_terminalId) then
		set p_OutputMessage=concat('The session :',p_sessionId,' is already closed');
        set p_ResponseStatus='failed';
        set p_sessionId=p_sessionId;
        leave sp;
end if;

    DROP TEMPORARY TABLE IF EXISTS tblorders_day_end;
   create temporary table tblorders_day_end(orderId int,orderNo varchar(50),productId int,unitPrice decimal(10,2),
   qty decimal(10,2),lineDiscount_prec decimal(10,2),isVoided bit,customerId int);
   
insert into tblorders_day_end(orderId,orderNo,productId,unitPrice,qty,lineDiscount_prec,isVoided,customerId)
    select oh.orderId,oh.OrderNo,od.ProductId,od.unitPrice,od.qty,od.LineDiscount_Perc,oh.isVoided,oh.customerId 
    from orderdetails as od  inner join orderheader as oh ON od.orderId=oh.orderId
    where terminalId=p_terminalId and sessionId=p_sessionId;
    
-- @gross_sales= Term: Total Sales or Gross Sales -- Formula:Total Sales = Sum of all sales transactions (including tax)
	set @gross_sales=(select sum(unitPrice * qty) from tblorders_day_end where isVoided=0 and qty>0);
     
     	-- select sum(unitPrice * qty*(lineDiscount_prec/100))  from tblorders_day_end where isVoided=0 and qty>0;
	set @total_Discount=(select sum(unitPrice * qty*(lineDiscount_prec/100)) from tblorders_day_end 
    where isVoided=0 and qty>0);
    
    set @noOfSoldItems=(select sum(qty) from tblorders_day_end where isVoided=0 and qty>0);
	set @noOfReturnedItems=(select sum(qty) from tblorders_day_end where isVoided=0 and qty<0);
	
	set @totalSold= (select sum(unitPrice * qty) from tblorders_day_end where isVoided=0 and qty>0);

    -- Term: Returns and Refunds Formula: Total Returns and Refunds = Sum of all returned items' values
   set @totalReturnsAndRefunds= (select sum(unitPrice * qty) from tblorders_day_end where isVoided=0 and qty<0);
   
    -- Term: Net Sales Formula: Net Sales = Gross Sales - Returns and Refunds
	set @net_sales=@gross_sales-@total_Discount-(-@totalReturnsAndRefunds); 
 
     -- Term: Number of Transactions Formula: Number of Transactions = Count of all completed sales transactions Inventory Value:
    set @numberOfTransactions=(select count(distinct orderId) from tblorders_day_end where isVoided=0);
   
   -- Term: ATV Formula: ATV = Total Sales(Net Sales) / Number of Transactions
    set @averageTransactionValue= @net_sales/@numberOfTransactions;
	 set @averageTransactionValue= round(@averageTransactionValue,4);

	set @total_tax=0;-- Term: Total Taxes Collected Formula: Total Taxes Collected = Sum of all taxes collected on sales
	set @total_profit=0; -- Term: Total Profit Formula: Total Profit = Total Sales - Total Cost of Goods Sold (COGS)
	set @totalCostOfGoodsSold=0; -- Total Cost of Goods Sold (COGS)  Term: COGS Formula: COGS = Sum of the cost of all products sold
	
-- Term: Cash Sales Formula: Cash Sales = Total cash Sales - Credit Sales - Refunds and returns;
set @cash_sales=(select sum(AmountPaid) from orderpayments as op inner join orderheader oh on op.orderId=oh.orderId 
where oh.terminalId=p_terminalId and oh.sessionId=p_sessionId and op.methodId=1);
  
-- Term: Debit/Credit Card Sales Formula: Debit/Credit Card Sales = Total card Sales - Credit Sales - Refunds and returns;
set @card_sales=(select sum(AmountPaid) from orderpayments as op inner join orderheader oh on op.orderId=oh.orderId 
where oh.terminalId=p_terminalId and oh.sessionId=p_sessionId and op.methodId=2);

set @noOfCustomers=(select count(distinct customerId) from tblorders_day_end);

if(@gross_sales is null) then set @gross_sales=0; end if;
if(@net_sales is null) then set @net_sales=0; end if;
if(@total_Discount is null) then set @total_Discount=0; end if;
if(@noOfSoldItems is null) then set @noOfSoldItems=0; end if;
if(@noOfReturnedItems is null) then set @noOfReturnedItems=0; end if;
if(@totalSold is null) then set @totalSold=0; end if;
if(@totalReturnsAndRefunds is null) then set @totalReturnsAndRefunds=0; end if;
if(@averageTransactionValue is null) then set @averageTransactionValue=0; end if;
if(@cash_sales is null) then set @cash_sales=0; end if;
if(@card_sales is null) then set @card_sales=0; end if;


 -- leave sp;
  INSERT INTO sessionenddetails(sessionId,grossSales,netSales,totalDiscount,numberOfTransactions,
  noOfSoldItems,noOfReturnedItems,totalSold,totalReturnsAndRefunds,
  averageTransactionValue,
cashSales,cardSales,noOfCustomers,total_tax,totalCostOfGoodsSold,total_profit,closingCash,
userLogId,DC_systemInfoId,terminalId)
values (p_sessionId,@gross_sales,@net_sales,@total_Discount,@numberOfTransactions,
@noOfSoldItems,@noOfReturnedItems,@totalSold,@totalReturnsAndRefunds
,@averageTransactionValue,
@cash_sales,@card_sales,@noOfCustomers,@total_tax,@totalCostOfGoodsSold,@total_profit,p_closingCash,
p_userLogId,@p_DC_systemInfoId,p_terminalId);

 UPDATE sessionstartdetails SET isSessionEnded =1 WHERE sessionId=p_sessionId and terminalId=p_terminalId;
    
select p_sessionId,@gross_sales,@net_sales,@total_Discount,
@numberOfTransactions,
@noOfSoldItems,@noOfReturnedItems,@totalSold,@totalReturnsAndRefunds,
@averageTransactionValue,
@cash_sales,@card_sales,@noOfCustomers,@total_tax,@totalCostOfGoodsSold,@total_profit,
p_userLogId,@p_DC_systemInfoId,p_terminalId,p_closingCash;
-- Term: Inventory Value Formula: Inventory Value = Sum of the cost of all remaining items in inventory Cash in Drawer:
-- Term: Profit Margin Formula: Profit Margin = (Total Profit / Total Sales) x 100 Sales by Product Category:
-- Term: Sales by Product Category Formula: Calculate the sales for each product category by summing the sales of products within that category. Sales by Time Period:
-- Term: Cash in Drawer Formula: Cash in Drawer = Total Cash Received - Total Cash Paid Out Total Credit Card Sales:


   -- @gross_sales,@net_sales,@total_Discount,@numberOfTransactions,@totalReturnsAndRefunds,@averageTransactionValue,
   --  @cash_sales, @card_sales,@total_customers
   -- ,@total_tax,@total_profit,@totalCostOfGoodsSold
  --  
  
	SET p_ResponseStatus = 'success';
	SET p_OutputMessage = concat('Session:',p_sessionId,' ended successfully.');

    COMMIT;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Session_Select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Session_Select`(
    IN p_TerminalId INT,
	IN p_SessionId INT,
    
	IN p_Skip INT,
    IN p_Limit INT,
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
	OUT p_TotalRows INT
)
sp: BEGIN

-- DECLARE _query varchar(10000);
DECLARE _PagingQuery VARCHAR(1000);
DECLARE _filter varchar(1000);

SET _filter = ' WHERE 1 = 1 ';

set _PagingQuery='';
IF p_Skip IS NOT NULL AND p_Limit IS NOT NULL THEN
    SET _PagingQuery = CONCAT(' LIMIT ', p_Skip, ', ', p_Limit);
    
ELSEIF p_Skip IS NOT NULL AND p_Limit IS NULL THEN
    SET p_ResponseStatus = 'invalid';
    SET p_OutputMessage = 'The _Limit parameter is not passed or set _Skip parameter to null for unlimited data.';
	leave sp;
    
ELSEIF p_Skip IS NULL AND p_Limit IS NOT NULL THEN
    SET p_ResponseStatus = 'invalid';
    SET p_OutputMessage = 'The _Skip parameter is not passed or set _Limit parameter to null for unlimited data.';
	leave sp;
END IF;

     
        IF p_TerminalId IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND terminalId = ', p_TerminalId);
        END IF;
        
		IF p_SessionId IS NOT NULL THEN
            SET _filter = CONCAT(_filter, ' AND sessionId = ', p_SessionId);
        END IF;
        
        

SET @_query = CONCAT('SELECT grossSales,netSales,totalDiscount,numberOfTransactions,
  noOfSoldItems,noOfReturnedItems,totalSold,totalReturnsAndRefunds,
  averageTransactionValue,
cashSales,cardSales,noOfCustomers,total_tax,totalCostOfGoodsSold,total_profit,
userLogId,DC_systemInfoId from sessionenddetails ',_filter,_PagingQuery);

	-- Execute the query
	PREPARE stmt FROM @_query;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;


    SET @queryTotal = CONCAT('SELECT COUNT(OrderId) INTO @totalRows from orderheader as oh 
inner join customer as c on oh.customerid=c.customerid ', _filter);
        
    PREPARE stmt FROM @queryTotal;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    SET p_TotalRows = @totalRows;

set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Session_Start` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Session_Start`(
    IN p_sessionName VARCHAR(100),
    IN p_terminalId INT,
    IN p_openingCash DECIMAL(10, 2),
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),
    IN p_IsConfirm BIT,
    
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
    OUT p_sessionId int
)
sp: BEGIN

    START TRANSACTION;
    
	if not exists (select * from terminal where terminalId=p_terminalId) then
		set p_OutputMessage=concat('Invalid terminal id :',p_terminalId);
        set p_ResponseStatus='failed';
        set p_sessionId=p_sessionId;
        leave sp;
end if;
   
    
set @_maxSessionIdOfTerminalId=(select max(sessionId) from sessionstartdetails where terminalId=p_terminalId);
   
   if exists (select * from sessionstartdetails where isSessionEnded=0 and sessionId=@_maxSessionIdOfTerminalId) then
		set p_OutputMessage=concat('The current session is already open for terminal :',p_terminalId);
        set p_ResponseStatus='failed';
        set p_sessionId=@_maxSessionIdOfTerminalId;
        leave sp;
end if;

CALL get_DC_SystemInfoIdByTerminalId(p_terminalId, @p_DC_systemInfoId);
	IF @p_DC_systemInfoId is null THEN
        SET p_ResponseStatus = 'failed';
        SET p_OutputMessage = concat('Systeminfo details are not exists for Terminal:',p_terminalId);
        leave sp;
	END IF; 
    
INSERT INTO sessionstartdetails(`sessionName`,`openingCash`,`userLogId`,DC_systemInfoId,terminalId)
values (p_sessionName,p_openingCash,p_userLogId,@p_DC_systemInfoId,p_terminalId);

SET p_sessionId = LAST_INSERT_ID();

	SET p_ResponseStatus = 'success';
	SET p_OutputMessage = 'Session created successfully.';
    COMMIT;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `system_info_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `system_info_save`(
   IN p_tableId int,
   IN p_TerminalId int,
   	IN p_UTC_Offset VARCHAR(50),
    IN p_CountryId int,
    IN p_CurrencyId int,
	IN p_LanguageId int,
    IN p_UserLogID INT,
    IN p_PageName VARCHAR(50),
    IN p_IsConfirm BIT,
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
    OUT p_systemInfoId int
)
sp: BEGIN

    START TRANSACTION;
   if not exists(select * from system_info where terminalId=p_TerminalId) then
INSERT INTO `system_info`(systemInfoId,`TerminalId`,`UTC_offset`,`CountryId`,`CurrencyId`,`LanguageId`,`UserLogId`)
values (p_tableId,p_TerminalId,p_UTC_Offset,p_CountryId,p_CurrencyId,p_LanguageId,p_UserLogID);
set p_systemInfoId=LAST_INSERT_ID();
else
update system_info set UTC_offset=p_UTC_Offset,CountryId=p_CountryId,CurrencyId=p_CurrencyId,
LanguageId=p_LanguageId,UserLogID=p_UserLogID,
ModifiedDate_UTC=utc_timestamp(),ModifiedDate_ServerTime=CURRENT_TIMESTAMP where TerminalId=p_TerminalId;
set p_systemInfoId=(select systemInfoId from system_info where terminalId=p_TerminalId);
end if;
		SET p_ResponseStatus = 'success';
        SET p_OutputMessage = 'Saved Successfully.';
        
    COMMIT;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UserLog_Insert_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UserLog_Insert_Update`(
    IN p_UserId INT,
    IN p_LoginTime_UTC DATETIME,
    IN p_LoginStatus VARCHAR(10),
    IN p_IpAddress VARCHAR(45),
    IN p_UserAgent VARCHAR(255),
    IN p_SessionId VARCHAR(255),
    IN p_AdditionalInfo TEXT,
    IN p_GMT_Offset VARCHAR(10),

    IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),
    IN p_IsConfirm BIT,
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000),
    OUT p_userLogId int
)
sp: BEGIN
        
      DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    
     DECLARE custom_error_low CONDITION FOR SQLSTATE '45001';  -- Custom error with a low severity SQLSTATE code
    DECLARE custom_error_high CONDITION FOR SQLSTATE '45002'; -- Custom error with a high severity SQLSTATE code
    
        SHOW ERRORS;  -- this is the only one which you need
        ROLLBACK;   
    END;
    
    START TRANSACTION;
    

        INSERT INTO userlog (
            UserId,
            LoginTime_UTC,
            LoginStatus,
            IpAddress,
            UserAgent,
            SessionId,
            AdditionalInfo,
            GMT_Offset
        )
        VALUES (
            p_UserId,
            p_LoginTime_UTC,
            p_LoginStatus,
            p_IpAddress,
            p_UserAgent,
            p_SessionId,
            p_AdditionalInfo,
            p_GMT_Offset
        );

      set  p_userLogId=LAST_INSERT_ID();
 
        SET p_ResponseStatus = 'success';
        SET p_OutputMessage = 'Added Successfully';
        

    COMMIT;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userPassword_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userPassword_update`(
	IN p_userName VARCHAR(50),
    IN p_passwordHash VARCHAR(1000),
	IN p_passwordSalt VARCHAR(1000),
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN

if not exists(select * from userregistration where uName=p_userName) then
	set p_ResponseStatus='failed';
	set p_OutputMessage='Invalid username ';
	leave sp;
end if;

update userregistration set passwordHash=p_passwordHash,passwordSalt=p_passwordSalt where uName=p_userName;

set p_ResponseStatus='success';
set p_OutputMessage='Password updated successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userRegistration_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userRegistration_insert`(
	IN p_userName VARCHAR(50),
    IN p_passwordHash VARCHAR(1000),
	IN p_passwordSalt VARCHAR(1000),
	IN p_email VARCHAR(50),
	IN p_displayName VARCHAR(50),
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN

if exists(select * from user_registration where uName=p_userName or email=p_email) then
	set p_ResponseStatus='failed';
	set p_OutputMessage='username or password already exists';
	leave sp;
end if;

INSERT INTO `user_registration` (`uName`,`passwordHash`,`passwordSalt`,`email`,`displayName`)
values(p_userName,p_passwordHash,p_passwordSalt,p_email,p_displayName);

set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userRegistration_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userRegistration_select`(
	IN p_userName VARCHAR(50),
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN

SELECT userId,uName,passwordHash,passwordSalt,email,displayName,profilePic,isActive,CreatedDate_UTC,CreatedDate_ServerTime,
ModifiedDate_UTC,ModifiedDate_ServerTime FROM user_registration where uName=p_userName;

set p_ResponseStatus='success';
set p_OutputMessage='loaded successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VoidOrderByOrderId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VoidOrderByOrderId`(
  IN p_OrderId INT,
IN p_reason_id int,
    IN p_UserLogID INT,
	IN p_UTC_Offset VARCHAR(50),
    IN p_PageName VARCHAR(50),
        IN p_IsConfirm bit,
    OUT p_ResponseStatus VARCHAR(50),
    OUT p_OutputMessage VARCHAR(1000)
)
sp: BEGIN

select p_reason_id;
  if not exists( select * from  order_header  where  OrderId=p_OrderId) then
          SET p_ResponseStatus = 'failed';
        SET p_OutputMessage = 'Order is not found.';
        leave sp;
      END IF;

    IF p_IsConfirm is null or p_IsConfirm=0 THEN
        SET p_ResponseStatus = 'confirm';
        SET p_OutputMessage = 'Are you sure you want to void this order?.';
        leave sp;
      END IF;
      
    if exists( select * from  order_header  where isVoided=1 and OrderId=p_OrderId) then
          SET p_ResponseStatus = 'failed';
        SET p_OutputMessage = 'Order was already voided.';
        leave sp;
      END IF;
      
update order_header set isVoided=1 where OrderId=p_OrderId;

INSERT INTO `order_voided`(`orderId`,`order_voiding_reason_id`)
VALUES(p_OrderId,p_reason_id);


set p_ResponseStatus='success';
set p_OutputMessage='Voided successfully';

END ;;
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

-- Dump completed on 2024-05-19 16:25:06
