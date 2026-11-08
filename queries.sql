-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: amusementpark
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL,
  `Emp_Name` varchar(100) NOT NULL,
  `Age` int DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `Roles` varchar(20) NOT NULL,
  `Position` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (101,'Ali',30,'Male','0555123456','Manager','Admin',5000.00),(102,'Nourah',25,'Female','0555123457','Cashier','Sales',3000.00),(103,'Khalid',36,'Male','0555689876','Supervisor','Operations Manager',75000.00),(104,'Ahmed',28,'Male','0555123459','Technician','Maintenance',3500.00);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `GameID` int NOT NULL,
  `GameName` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `Duration` int DEFAULT NULL,
  `Emp_ID` int DEFAULT NULL,
  `AgeRestriction` int DEFAULT NULL,
  `ScheduleTime` time DEFAULT NULL,
  PRIMARY KEY (`GameID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `games_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employees` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Laser Tag',20.00,60,101,10,'14:00:00'),(2,'Bowling',15.00,90,101,5,'16:00:00'),(3,'Escape Room',25.00,120,102,12,'18:00:00');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `FoodName` varchar(20) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Emp_ID` int DEFAULT NULL,
  `Rest_ID` int DEFAULT NULL,
  `Visit_ID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `Rest_ID` (`Rest_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Visit_ID` (`Visit_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Rest_ID`) REFERENCES `restaurants` (`RestaurantID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`Visit_ID`) REFERENCES `visitors` (`VisitorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (4,'Tacos',10.00,4,103,4,4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `RestaurantID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `CuisineType` varchar(50) DEFAULT NULL,
  `Emp_ID` int DEFAULT NULL,
  PRIMARY KEY (`RestaurantID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employees` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Pizza Palace','Italian',101),(2,'Sushi World','Japanese',104),(3,'Grill Master','American',102),(4,'Taco Fiesta','Mexican',102);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `TicketID` int NOT NULL,
  `TicketType` varchar(50) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Emp_ID` int DEFAULT NULL,
  `ValidFrom` date DEFAULT NULL,
  `ValidTo` date DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employees` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'Adult',50.00,101,'2024-01-01','2024-12-31'),(2,'Child',25.00,102,'2024-01-01','2024-12-31'),(3,'FamiluPackage',250.00,103,'2024-01-01','2024-12-31'),(4,'Student',35.00,104,'2024-01-01','2024-12-31');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors` (
  `VisitorID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Age` int DEFAULT NULL,
  `HealthConditions` varchar(50) DEFAULT NULL,
  `TicketID` int DEFAULT NULL,
  `VisitDate` date DEFAULT NULL,
  PRIMARY KEY (`VisitorID`),
  KEY `TicketID` (`TicketID`),
  CONSTRAINT `visitors_ibfk_1` FOREIGN KEY (`TicketID`) REFERENCES `tickets` (`TicketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,'Ali',22,'None',1,'2024-10-01'),(2,'Mona',30,'Asthma',2,'2024-10-02'),(3,'Yousef',18,'Diabetes',3,'2024-10-03'),(4,'Laila',25,'None',4,'2024-10-04');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitorsgame`
--

DROP TABLE IF EXISTS `visitorsgame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitorsgame` (
  `VisitorID` int NOT NULL,
  `GameID` int NOT NULL,
  PRIMARY KEY (`VisitorID`,`GameID`),
  KEY `GameID` (`GameID`),
  CONSTRAINT `visitorsgame_ibfk_1` FOREIGN KEY (`VisitorID`) REFERENCES `visitors` (`VisitorID`),
  CONSTRAINT `visitorsgame_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `games` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitorsgame`
--

LOCK TABLES `visitorsgame` WRITE;
/*!40000 ALTER TABLE `visitorsgame` DISABLE KEYS */;
INSERT INTO `visitorsgame` VALUES (2,1),(4,1),(3,2),(1,3);
/*!40000 ALTER TABLE `visitorsgame` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-08 22:17:49
