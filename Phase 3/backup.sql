-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: flight_reservations2020ph3
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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `ARCID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `ARLID` char(2) NOT NULL,
  PRIMARY KEY (`ARCID`),
  KEY `ARC_ARLID_FK_idx` (`ARLID`),
  CONSTRAINT `ARC_ARLID_FK` FOREIGN KEY (`ARLID`) REFERENCES `airline` (`ARLID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'Airbus A321','AA'),(2,'Boeing 737','AA'),(3,'Airbus A320','UA');
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `ARLID` char(2) NOT NULL,
  `Name` varchar(60) NOT NULL,
  PRIMARY KEY (`ARLID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES ('AA','American Airlines'),('AC','Air Canada'),('DL','Delta Air Lines'),('EK','Emirates'),('LX','SWISS International Air Lines'),('OA','Olympic Air'),('UA','United Airlines');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `ARPID` char(3) NOT NULL,
  `Name` varchar(60) NOT NULL,
  PRIMARY KEY (`ARPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('AIA','Athens International Airport'),('ATL','Hartsfield–Jackson Atlanta International Airport'),('DFW','Dallas/Fort Worth International Airport'),('LAX','Los Angeles International Airport'),('ORD','O\'Hare International Airport'),('SFO','San Francisco International Airport'),('YYZ','Toronto Pearson International Airport');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arcclass`
--

DROP TABLE IF EXISTS `arcclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arcclass` (
  `ARCID` int NOT NULL,
  `CLASS` varchar(15) NOT NULL,
  `ChangeFee` decimal(5,2) NOT NULL,
  `NumofSeats` int NOT NULL,
  PRIMARY KEY (`ARCID`,`CLASS`),
  CONSTRAINT `CLS_ARCID_FK` FOREIGN KEY (`ARCID`) REFERENCES `aircraft` (`ARCID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arcclass`
--

LOCK TABLES `arcclass` WRITE;
/*!40000 ALTER TABLE `arcclass` DISABLE KEYS */;
INSERT INTO `arcclass` VALUES (1,'Economy',50.00,171),(1,'First',0.00,16),(2,'Economy',50.00,114),(2,'Extra',50.00,30),(2,'First',0.00,16),(3,'Economy',50.00,96),(3,'First',0.00,12),(3,'Plus',50.00,42);
/*!40000 ALTER TABLE `arcclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arlarp`
--

DROP TABLE IF EXISTS `arlarp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arlarp` (
  `ARLID` char(2) NOT NULL,
  `ARPID` char(3) NOT NULL,
  PRIMARY KEY (`ARLID`,`ARPID`),
  KEY `ALP_ARPID_FK_idx` (`ARPID`),
  CONSTRAINT `ALP_ARLID_FK` FOREIGN KEY (`ARLID`) REFERENCES `airline` (`ARLID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ALP_ARPID_FK` FOREIGN KEY (`ARPID`) REFERENCES `airport` (`ARPID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arlarp`
--

LOCK TABLES `arlarp` WRITE;
/*!40000 ALTER TABLE `arlarp` DISABLE KEYS */;
INSERT INTO `arlarp` VALUES ('AA','AIA'),('OA','AIA'),('AA','ATL'),('AA','DFW'),('UA','DFW'),('AA','LAX'),('DL','ORD'),('EK','ORD'),('UA','ORD'),('AC','YYZ');
/*!40000 ALTER TABLE `arlarp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flgclass`
--

DROP TABLE IF EXISTS `flgclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flgclass` (
  `ARLID` char(2) NOT NULL,
  `FLGID` int NOT NULL,
  `CLASS` varchar(45) NOT NULL,
  `Fare` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ARLID`,`FLGID`,`CLASS`),
  CONSTRAINT `FCL_ ARLID _FLGID_FK` FOREIGN KEY (`ARLID`, `FLGID`) REFERENCES `flight` (`ARLID`, `FLGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flgclass`
--

LOCK TABLES `flgclass` WRITE;
/*!40000 ALTER TABLE `flgclass` DISABLE KEYS */;
INSERT INTO `flgclass` VALUES ('AA',242,'Economy',69.00),('AA',242,'Extra',83.00),('AA',242,'First',183.00),('AA',2403,'Economy',69.00),('AA',2403,'Extra',83.00),('AA',2403,'First',183.00),('AA',2459,'Economy',66.00),('AA',2459,'First',174.00),('AA',2733,'Economy',63.00),('AA',2733,'First',167.00),('AA',2737,'Economy',66.00),('AA',2737,'Extra',79.00),('AA',2737,'First',174.00),('UA',589,'Economy',90.00),('UA',589,'First',600.00),('UA',589,'Plus',110.00),('UA',775,'Economy',45.00),('UA',775,'First',250.00),('UA',775,'Plus',50.00);
/*!40000 ALTER TABLE `flgclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flgdays`
--

DROP TABLE IF EXISTS `flgdays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flgdays` (
  `ARLID` char(2) NOT NULL,
  `FLGID` int NOT NULL,
  `DAY` char(3) NOT NULL,
  PRIMARY KEY (`ARLID`,`FLGID`,`DAY`),
  CONSTRAINT `DAY_ARLID_FLGID_FK` FOREIGN KEY (`ARLID`, `FLGID`) REFERENCES `flight` (`ARLID`, `FLGID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flgdays`
--

LOCK TABLES `flgdays` WRITE;
/*!40000 ALTER TABLE `flgdays` DISABLE KEYS */;
INSERT INTO `flgdays` VALUES ('AA',242,'Sat'),('AA',242,'Sun'),('AA',2403,'Mon'),('AA',2403,'Tue'),('AA',2459,'Fri'),('AA',2459,'Thu'),('AA',2733,'Fri'),('AA',2733,'Thu'),('AA',2737,'Wed'),('UA',589,'Fri'),('UA',775,'Fri'),('UA',775,'Sat');
/*!40000 ALTER TABLE `flgdays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
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
  CONSTRAINT `FLG_ARLID_ARCID_FK` FOREIGN KEY (`ARLID`, `ARCID`) REFERENCES `aircraft` (`ARLID`, `ARCID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES ('AA',242,'1','ATL','18:21:00','DFW','20:50:00',2),('AA',2403,'1','DFW','14:30:00','ATL','17:37:00',2),('AA',2459,'1','DFW','14:35:00','LAX','16:02:00',1),('AA',2733,'1','LAX','16:40:00','DFW','21:43:00',1),('AA',2737,'1','DFW','07:09:00','ATL','10:19:00',2),('UA',589,'1','DFW','17:56:00','ORD','20:23:00',3),('UA',775,'1','ORD','12:50:00','DFW','15:28:00',3);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequence` (
  `TCKID` int NOT NULL,
  `ARLID` char(2) NOT NULL,
  `FLGID` int NOT NULL,
  `CLASS` varchar(15) NOT NULL,
  `TravelDate` date NOT NULL,
  PRIMARY KEY (`TCKID`,`ARLID`,`FLGID`),
  KEY `SQC_ARLID_FLGID_idx` (`ARLID`,`FLGID`),
  KEY `SQC_CLASS_FK_idx` (`ARLID`,`FLGID`,`CLASS`),
  CONSTRAINT `SQC_ARLID_FLGID_FK` FOREIGN KEY (`ARLID`, `FLGID`) REFERENCES `flight` (`ARLID`, `FLGID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `SQC_CLASS_FK` FOREIGN KEY (`ARLID`, `FLGID`, `CLASS`) REFERENCES `flgclass` (`ARLID`, `FLGID`, `CLASS`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `SQC_TCKID_FK` FOREIGN KEY (`TCKID`) REFERENCES `ticket` (`TCKID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
INSERT INTO `sequence` VALUES (1,'UA',589,'Economy','2020-04-24'),(1,'UA',775,'Plus','2020-05-02'),(2,'AA',242,'Economy','2020-03-15'),(2,'AA',2403,'Extra','2020-03-13'),(3,'AA',2459,'Economy','2020-05-29'),(4,'UA',589,'Plus','2020-04-24'),(5,'UA',775,'Economy','2020-05-02'),(6,'UA',589,'Plus','2020-04-24'),(6,'UA',775,'Economy','2020-05-02'),(7,'UA',589,'Economy','2020-04-24'),(7,'UA',775,'Economy','2020-05-02'),(8,'UA',775,'Economy','2020-05-02');
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TCKID` int NOT NULL AUTO_INCREMENT,
  `USRID` int NOT NULL,
  `Type` char(1) NOT NULL,
  `TotalFare` decimal(8,2) NOT NULL,
  `PurchaseDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TCKID`),
  KEY `TCK_USRID_FK _idx` (`USRID`),
  CONSTRAINT `TCK_USRID_FK ` FOREIGN KEY (`USRID`) REFERENCES `users` (`USRID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,'2',119.00,'2020-04-02 01:39:43'),(2,2,'2',143.00,'2020-01-23 11:18:16'),(3,7,'1',60.00,'2020-04-14 00:18:43'),(4,14,'1',110.00,'2020-01-18 09:19:16'),(5,14,'1',45.00,'2020-01-18 10:23:09'),(6,6,'2',131.75,'2019-12-28 08:45:30'),(7,3,'2',114.75,'2019-11-18 08:31:06'),(8,9,'1',45.00,'2020-04-18 01:34:26');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `USRID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `email` varchar(60) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Type` char(1) NOT NULL,
  `Active` smallint DEFAULT NULL,
  PRIMARY KEY (`USRID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Lula Wiley','wiley@gmail.com','+1-202-555-0177','1',1),(2,'Isabell Horn','horn@gmail.com','+1-202-555-0136','1',1),(3,'Usman Hook','hook@hotmail.com','+1-219-555-0126','1',1),(4,'Abdullah Singleton','singleton@outlook.com','+1-404-555-0199','1',0),(5,'Sumaiya Dean','dean@yahoo.com','+1-512-555-0161','1',0),(6,'August Phillips','phillips@gmail.com','+1-213-555-0128','1',1),(7,'Student Test','test@mavs.uta.edu','+1-837-721-8965','1',1),(8,'Alexander S. Smith','AlexanderSSmith@airline.com','+1-818-617-5676','2',NULL),(9,'Dorothy J. Gregory','DorothyJGregory@airline.com','+1-360-302-4081','1',1),(10,'Theresa G. Hathaway','TheresaGHathaway@airline.com','+1-301-609-7990','2',NULL),(11,'Brandon A. Garcia','BrandonAGarcia@airline.us','+1-763-477-7105','3',NULL),(12,'Helen D. Cole','HelenDCole@airline.com','+1-407-685-8024','3',NULL),(13,'Iliana J. Manley','IlianaJManley@airline.com','+1-774-453-9545','2',NULL),(14,'Christal H. Rodriquez','CRodriquez@teleworm.us','+1-215-627-8663','1',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `viewticketinfo`
--

DROP TABLE IF EXISTS `viewticketinfo`;
/*!50001 DROP VIEW IF EXISTS `viewticketinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewticketinfo` AS SELECT 
 1 AS `ticketPurchaseDate`,
 1 AS `ticketID`,
 1 AS `ticketType`,
 1 AS `custName`,
 1 AS `custPhone`,
 1 AS `flightID`,
 1 AS `travelDate`,
 1 AS `flightClass`,
 1 AS `flightFare`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `viewticketinfo`
--

/*!50001 DROP VIEW IF EXISTS `viewticketinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewticketinfo` (`ticketPurchaseDate`,`ticketID`,`ticketType`,`custName`,`custPhone`,`flightID`,`travelDate`,`flightClass`,`flightFare`) AS select cast(`t`.`PurchaseDateTime` as date) AS `date(T.PurchaseDateTime)`,`t`.`TCKID` AS `TCKID`,if((`t`.`Type` = 1),'Round-Trip','One-Way') AS `IF(T.Type=1,'Round-Trip','One-Way')`,`u`.`Name` AS `Name`,`u`.`Phone` AS `Phone`,concat(`s`.`ARLID`,`s`.`FLGID`) AS `concat(S.ARLID,S.FLGID)`,`s`.`TravelDate` AS `TravelDate`,`s`.`CLASS` AS `CLASS`,concat('$',`t`.`TotalFare`) AS `concat('$',T.TotalFare)` from ((`ticket` `t` join `users` `u`) join `sequence` `s`) where ((`u`.`USRID` = `t`.`USRID`) and (`s`.`TCKID` = `t`.`TCKID`)) order by `t`.`PurchaseDateTime` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-04 12:56:04
