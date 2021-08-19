CREATE DATABASE  IF NOT EXISTS `Flight_Reservations2020Ph3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Flight_Reservations2020Ph3`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Flight_Reservations2020Ph3
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `AIRCRAFT`
--

DROP TABLE IF EXISTS `AIRCRAFT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AIRCRAFT` (
  `ARCID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `ARLID` char(2) NOT NULL,
  PRIMARY KEY (`ARCID`),
  KEY `ARC_ARLID_FK_idx` (`ARLID`),
  CONSTRAINT `ARC_ARLID_FK` FOREIGN KEY (`ARLID`) REFERENCES `AIRLINE` (`ARLID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AIRCRAFT`
--

LOCK TABLES `AIRCRAFT` WRITE;
/*!40000 ALTER TABLE `AIRCRAFT` DISABLE KEYS */;
INSERT INTO `AIRCRAFT` VALUES (1,'Airbus A321','AA'),(2,'Boeing 737','AA'),(3,'Airbus A320','UA');
/*!40000 ALTER TABLE `AIRCRAFT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AIRLINE`
--

DROP TABLE IF EXISTS `AIRLINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AIRLINE` (
  `ARLID` char(2) NOT NULL,
  `Name` varchar(60) NOT NULL,
  PRIMARY KEY (`ARLID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AIRLINE`
--

LOCK TABLES `AIRLINE` WRITE;
/*!40000 ALTER TABLE `AIRLINE` DISABLE KEYS */;
INSERT INTO `AIRLINE` VALUES ('AA','American Airlines'),('AC','Air Canada'),('DL','Delta Air Lines'),('EK','Emirates'),('LX','SWISS International Air Lines'),('OA','Olympic Air'),('UA','United Airlines');
/*!40000 ALTER TABLE `AIRLINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AIRPORT`
--

DROP TABLE IF EXISTS `AIRPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AIRPORT` (
  `ARPID` char(3) NOT NULL,
  `Name` varchar(60) NOT NULL,
  PRIMARY KEY (`ARPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AIRPORT`
--

LOCK TABLES `AIRPORT` WRITE;
/*!40000 ALTER TABLE `AIRPORT` DISABLE KEYS */;
INSERT INTO `AIRPORT` VALUES ('AIA','Athens International Airport'),('ATL','Hartsfield–Jackson Atlanta International Airport'),('DFW','Dallas/Fort Worth International Airport'),('LAX','Los Angeles International Airport'),('ORD','O\'Hare International Airport'),('SFO','San Francisco International Airport'),('YYZ','Toronto Pearson International Airport');
/*!40000 ALTER TABLE `AIRPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARCCLASS`
--

DROP TABLE IF EXISTS `ARCCLASS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ARCCLASS` (
  `ARCID` int NOT NULL,
  `CLASS` varchar(15) NOT NULL,
  `ChangeFee` decimal(5,2) NOT NULL,
  `NumofSeats` int NOT NULL,
  PRIMARY KEY (`ARCID`,`CLASS`),
  CONSTRAINT `CLS_ARCID_FK` FOREIGN KEY (`ARCID`) REFERENCES `AIRCRAFT` (`ARCID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARCCLASS`
--

LOCK TABLES `ARCCLASS` WRITE;
/*!40000 ALTER TABLE `ARCCLASS` DISABLE KEYS */;
INSERT INTO `ARCCLASS` VALUES (1,'Economy',50.00,171),(1,'First',0.00,16),(2,'Economy',50.00,114),(2,'Extra',50.00,30),(2,'First',0.00,16),(3,'Economy',50.00,96),(3,'First',0.00,12),(3,'Plus',50.00,42);
/*!40000 ALTER TABLE `ARCCLASS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARLARP`
--

DROP TABLE IF EXISTS `ARLARP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ARLARP` (
  `ARLID` char(2) NOT NULL,
  `ARPID` char(3) NOT NULL,
  PRIMARY KEY (`ARLID`,`ARPID`),
  KEY `ALP_ARPID_FK_idx` (`ARPID`),
  CONSTRAINT `ALP_ARLID_FK` FOREIGN KEY (`ARLID`) REFERENCES `AIRLINE` (`ARLID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ALP_ARPID_FK` FOREIGN KEY (`ARPID`) REFERENCES `AIRPORT` (`ARPID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARLARP`
--

LOCK TABLES `ARLARP` WRITE;
/*!40000 ALTER TABLE `ARLARP` DISABLE KEYS */;
INSERT INTO `ARLARP` VALUES ('AA','AIA'),('OA','AIA'),('AA','ATL'),('AA','DFW'),('AA','LAX'),('DL','ORD'),('EK','ORD'),('AC','YYZ');
/*!40000 ALTER TABLE `ARLARP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLGCLASS`
--

DROP TABLE IF EXISTS `FLGCLASS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLGCLASS` (
  `ARLID` char(2) NOT NULL,
  `FLGID` int NOT NULL,
  `CLASS` varchar(45) NOT NULL,
  `Fare` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ARLID`,`FLGID`,`CLASS`),
  CONSTRAINT `FCL_ ARLID _FLGID_FK` FOREIGN KEY (`ARLID`, `FLGID`) REFERENCES `FLIGHT` (`ARLID`, `FLGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLGCLASS`
--

LOCK TABLES `FLGCLASS` WRITE;
/*!40000 ALTER TABLE `FLGCLASS` DISABLE KEYS */;
INSERT INTO `FLGCLASS` VALUES ('AA',242,'Economy',63.00),('AA',242,'Extra',75.00),('AA',242,'First',500.00),('AA',2403,'Economy',63.00),('AA',2403,'Extra',80.00),('AA',2403,'First',450.00),('AA',2459,'Economy',60.00),('AA',2459,'First',300.00),('AA',2733,'Economy',57.00),('AA',2733,'First',300.00),('AA',2737,'Economy',60.00),('AA',2737,'Extra',75.00),('AA',2737,'First',300.00),('UA',589,'Economy',90.00),('UA',589,'First',600.00),('UA',589,'Plus',110.00),('UA',775,'Economy',45.00),('UA',775,'First',250.00),('UA',775,'Plus',50.00);
/*!40000 ALTER TABLE `FLGCLASS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLGDAYS`
--

DROP TABLE IF EXISTS `FLGDAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLGDAYS` (
  `ARLID` char(2) NOT NULL,
  `FLGID` int NOT NULL,
  `DAY` char(3) NOT NULL,
  PRIMARY KEY (`ARLID`,`FLGID`,`DAY`),
  CONSTRAINT `DAY_ARLID_FLGID_FK` FOREIGN KEY (`ARLID`, `FLGID`) REFERENCES `FLIGHT` (`ARLID`, `FLGID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLGDAYS`
--

LOCK TABLES `FLGDAYS` WRITE;
/*!40000 ALTER TABLE `FLGDAYS` DISABLE KEYS */;
INSERT INTO `FLGDAYS` VALUES ('AA',242,'Sat'),('AA',242,'Sun'),('AA',2403,'Mon'),('AA',2403,'Tue'),('AA',2459,'Fri'),('AA',2459,'Thu'),('AA',2733,'Fri'),('AA',2733,'Thu'),('AA',2737,'Wed'),('UA',589,'Fri'),('UA',775,'Fri'),('UA',775,'Sat');
/*!40000 ALTER TABLE `FLGDAYS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLIGHT`
--

DROP TABLE IF EXISTS `FLIGHT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLIGHT` (
  `ARLID` char(2) NOT NULL,
  `FLGID` int NOT NULL,
  `Type` char(1) NOT NULL,
  `DepARPID` char(3) NOT NULL,
  `DepTime` time NOT NULL,
  `DesARPID` char(3) NOT NULL,
  `DesTime` time NOT NULL,
  `ARCID` int NOT NULL,
  PRIMARY KEY (`ARLID`,`FLGID`),
  KEY `FLG_ARLID_ARCID_FK_idx` (`ARLID`,`ARCID`),
  CONSTRAINT `FLG_ARLID_ARCID_FK` FOREIGN KEY (`ARLID`, `ARCID`) REFERENCES `AIRCRAFT` (`ARLID`, `ARCID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLIGHT`
--

LOCK TABLES `FLIGHT` WRITE;
/*!40000 ALTER TABLE `FLIGHT` DISABLE KEYS */;
INSERT INTO `FLIGHT` VALUES ('AA',242,'1','ATL','18:21:00','DFW','20:50:00',2),('AA',2403,'1','DFW','14:30:00','ATL','17:37:00',2),('AA',2459,'1','DFW','14:35:00','LAX','16:02:00',1),('AA',2733,'1','LAX','16:40:00','DFW','21:43:00',1),('AA',2737,'1','DFW','07:09:00','ATL','10:19:00',2),('UA',589,'1','DFW','17:56:00','ORD','20:23:00',3),('UA',775,'1','ORD','12:50:00','DFW','15:28:00',3);
/*!40000 ALTER TABLE `FLIGHT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQUENCE`
--

DROP TABLE IF EXISTS `SEQUENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SEQUENCE` (
  `TCKID` int NOT NULL,
  `ARLID` char(2) NOT NULL,
  `FLGID` int NOT NULL,
  `CLASS` varchar(15) NOT NULL,
  `TravelDate` date NOT NULL,
  PRIMARY KEY (`TCKID`,`ARLID`,`FLGID`),
  KEY `SQC_ARLID_FLGID_idx` (`ARLID`,`FLGID`),
  KEY `SQC_CLASS_FK_idx` (`ARLID`,`FLGID`,`CLASS`),
  CONSTRAINT `SQC_ARLID_FLGID_FK` FOREIGN KEY (`ARLID`, `FLGID`) REFERENCES `FLIGHT` (`ARLID`, `FLGID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `SQC_CLASS_FK` FOREIGN KEY (`ARLID`, `FLGID`, `CLASS`) REFERENCES `FLGCLASS` (`ARLID`, `FLGID`, `CLASS`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `SQC_TCKID_FK` FOREIGN KEY (`TCKID`) REFERENCES `TICKET` (`TCKID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQUENCE`
--

LOCK TABLES `SEQUENCE` WRITE;
/*!40000 ALTER TABLE `SEQUENCE` DISABLE KEYS */;
INSERT INTO `SEQUENCE` VALUES (1,'UA',589,'Economy','2020-04-24'),(1,'UA',775,'Plus','2020-05-02'),(2,'AA',242,'Economy','2020-03-15'),(2,'AA',2403,'Extra','2020-03-13'),(3,'AA',2459,'Economy','2020-05-29'),(4,'UA',589,'Plus','2020-04-24'),(5,'UA',775,'Economy','2020-05-02'),(6,'UA',589,'Plus','2020-04-24'),(6,'UA',775,'Economy','2020-05-02'),(7,'UA',589,'Economy','2020-04-24'),(7,'UA',775,'Economy','2020-05-02'),(8,'UA',775,'Economy','2020-05-02');
/*!40000 ALTER TABLE `SEQUENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKET`
--

DROP TABLE IF EXISTS `TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TICKET` (
  `TCKID` int NOT NULL AUTO_INCREMENT,
  `USRID` int NOT NULL,
  `Type` char(1) NOT NULL,
  `TotalFare` decimal(8,2) NOT NULL,
  `PurchaseDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TCKID`),
  KEY `TCK_USRID_FK _idx` (`USRID`),
  CONSTRAINT `TCK_USRID_FK ` FOREIGN KEY (`USRID`) REFERENCES `USERS` (`USRID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKET`
--

LOCK TABLES `TICKET` WRITE;
/*!40000 ALTER TABLE `TICKET` DISABLE KEYS */;
INSERT INTO `TICKET` VALUES (1,1,'1',140.00,'2020-04-02 01:39:43'),(2,2,'1',143.00,'2020-01-23 11:18:16'),(3,7,'1',60.00,'2020-04-14 00:18:43'),(4,14,'1',110.00,'2020-01-18 09:19:16'),(5,14,'1',45.00,'2020-01-18 10:23:09'),(6,6,'1',155.00,'2019-12-28 08:45:30'),(7,3,'1',135.00,'2019-11-18 08:31:06'),(8,9,'1',45.00,'2020-04-18 01:34:26');
/*!40000 ALTER TABLE `TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERS` (
  `USRID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `email` varchar(60) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Type` char(1) NOT NULL,
  PRIMARY KEY (`USRID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (1,'Lula Wiley','wiley@gmail.com','+1-202-555-0177','1'),(2,'Isabell Horn','horn@gmail.com','+1-202-555-0136','1'),(3,'Usman Hook','hook@hotmail.com','+1-219-555-0126','1'),(4,'Abdullah Singleton','singleton@outlook.com','+1-404-555-0199','1'),(5,'Sumaiya Dean','dean@yahoo.com','+1-512-555-0161','1'),(6,'August Phillips','phillips@gmail.com','+1-213-555-0128','1'),(7,'Student Test','test@mavs.uta.edu','+1-837-721-8965','1'),(8,'Alexander S. Smith','AlexanderSSmith@airline.com','+1-818-617-5676','2'),(9,'Dorothy J. Gregory','DorothyJGregory@airline.com','+1-360-302-4081','1'),(10,'Theresa G. Hathaway','TheresaGHathaway@airline.com','+1-301-609-7990','2'),(11,'Brandon A. Garcia','BrandonAGarcia@airline.us','+1-763-477-7105','3'),(12,'Helen D. Cole','HelenDCole@airline.com','+1-407-685-8024','3'),(13,'Iliana J. Manley','IlianaJManley@airline.com','+1-774-453-9545','2'),(14,'Christal H. Rodriquez','CRodriquez@teleworm.us','+1-215-627-8663','1');
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Flight_Reservations2020Ph3'
--

--
-- Dumping routines for database 'Flight_Reservations2020Ph3'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-12 10:26:57
