-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: swebok
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

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
-- Table structure for table `Evidence`
--

DROP TABLE IF EXISTS `Evidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Evidence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Authors` blob,
  `Abstract` blob,
  `KeyWords` varchar(200) DEFAULT NULL,
  `DOINnumber` varchar(100) DEFAULT NULL,
  `Link` varchar(200) DEFAULT NULL,
  `File` blob,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evidence`
--

LOCK TABLES `Evidence` WRITE;
/*!40000 ALTER TABLE `Evidence` DISABLE KEYS */;
INSERT INTO `Evidence` VALUES (1,'Teste 01','Teste 01',_binary 'Teste 01',_binary 'Teste 01','Teste 01','Teste 01','Teste 01',_binary 'Teste 01','2023-07-10 19:35:31','2023-07-10 19:42:28');
/*!40000 ALTER TABLE `Evidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Industry_Issues`
--

DROP TABLE IF EXISTS `Industry_Issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Industry_Issues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  `Question` varchar(300) NOT NULL,
  `Description` blob,
  `File` blob,
  `Claiment` varchar(200) NOT NULL,
  `SwebokChapterId` int DEFAULT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  `SwebokTopicId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SwebokChapterId` (`SwebokChapterId`),
  KEY `SwebokTopicId` (`SwebokTopicId`),
  CONSTRAINT `Industry_Issues_ibfk_1` FOREIGN KEY (`SwebokChapterId`) REFERENCES `Swebok_Chapters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Industry_Issues_ibfk_2` FOREIGN KEY (`SwebokTopicId`) REFERENCES `Swebok_Topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Industry_Issues`
--

LOCK TABLES `Industry_Issues` WRITE;
/*!40000 ALTER TABLE `Industry_Issues` DISABLE KEYS */;
INSERT INTO `Industry_Issues` VALUES (1,'Teste 01','Teste 01',_binary 'Teste 01',_binary 'Teste 01','Teste 01',1,'2023-07-10','2023-07-10',2);
/*!40000 ALTER TABLE `Industry_Issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Issue_Evidences`
--

DROP TABLE IF EXISTS `Issue_Evidences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Issue_Evidences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Annotation` blob,
  `File` blob,
  `createdAt` date NOT NULL,
  `updatedAt` datetime NOT NULL,
  `IndustryIssueId` int DEFAULT NULL,
  `EvidenceId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IndustryIssueId` (`IndustryIssueId`),
  KEY `EvidenceId` (`EvidenceId`),
  CONSTRAINT `Issue_Evidences_ibfk_1` FOREIGN KEY (`IndustryIssueId`) REFERENCES `Industry_Issues` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Issue_Evidences_ibfk_2` FOREIGN KEY (`EvidenceId`) REFERENCES `Evidence` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Issue_Evidences`
--

LOCK TABLES `Issue_Evidences` WRITE;
/*!40000 ALTER TABLE `Issue_Evidences` DISABLE KEYS */;
INSERT INTO `Issue_Evidences` VALUES (1,_binary 'Teste 01',_binary 'Teste 01','2023-07-10','2023-07-10 19:36:14',1,1);
/*!40000 ALTER TABLE `Issue_Evidences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Swebok_Chapters`
--

DROP TABLE IF EXISTS `Swebok_Chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Swebok_Chapters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Swebok_Chapters`
--

LOCK TABLES `Swebok_Chapters` WRITE;
/*!40000 ALTER TABLE `Swebok_Chapters` DISABLE KEYS */;
INSERT INTO `Swebok_Chapters` VALUES (1,'1.Software Requirements','2023-06-19 01:21:36','2023-06-19 01:21:36'),(2,'2.Software Design','2023-06-19 01:22:29','2023-06-19 01:22:29'),(3,'3.Software Construction','2023-06-19 01:23:04','2023-06-19 01:23:04'),(4,'4.Software Testing','2023-06-19 01:23:24','2023-06-19 01:23:24'),(5,'5.Software Maintenance','2023-06-19 11:41:24','2023-06-19 11:41:24'),(6,'6.Software Configuration Management','2023-06-19 01:23:24','2023-06-19 01:23:24'),(7,'7.Software Engineering Management','2023-06-19 13:15:39','2023-06-19 13:15:39'),(8,'8.Software Engineering Process','2023-06-19 13:15:52','2023-06-19 13:15:52'),(9,'9.Software Engineering Models and Methods','2023-06-19 13:16:05','2023-06-19 13:16:05'),(10,'10.Software Quality','2023-06-19 17:29:18','2023-06-19 17:29:18'),(11,'11.Software Engineering Professional Practice','2023-06-19 17:29:18','2023-06-19 17:29:18'),(12,'12.Software Engineering Economics','2023-06-19 17:29:18','2023-06-19 17:29:18'),(13,'13.Computing Foundations','2023-06-19 17:29:18','2023-06-19 17:29:18');
/*!40000 ALTER TABLE `Swebok_Chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Swebok_Topics`
--

DROP TABLE IF EXISTS `Swebok_Topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Swebok_Topics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `SwebokChapterId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SwebokChapterId` (`SwebokChapterId`),
  CONSTRAINT `Swebok_Topics_ibfk_1` FOREIGN KEY (`SwebokChapterId`) REFERENCES `Swebok_Chapters` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Swebok_Topics`
--

LOCK TABLES `Swebok_Topics` WRITE;
/*!40000 ALTER TABLE `Swebok_Topics` DISABLE KEYS */;
INSERT INTO `Swebok_Topics` VALUES (1,'1.1. Software Requirements Fundamentals','2023-06-19 01:21:36','2023-06-19 01:21:36',1),(2,'1.2. Requirements Process','2023-06-19 01:21:36','2023-06-19 01:21:36',1),(3,'1.3. Requirements Elicitation','2023-06-19 01:21:36','2023-06-19 01:21:36',1),(4,'1.4. Requirements Analysis','2023-06-19 01:21:36','2023-06-19 01:21:36',1),(5,'1.5. Requirements Specification','2023-06-19 01:21:36','2023-06-19 01:21:36',1),(6,'1.6. Requirements Validation','2023-06-19 01:21:36','2023-06-19 01:21:36',1),(7,'1.7. Practical Considerations','2023-06-19 01:21:36','2023-06-19 01:21:36',1),(8,'1.8. Software Requirements Tools','2023-06-19 01:21:36','2023-06-19 01:21:36',1),(9,'2.1. Software Design Fundamentals','2023-06-19 01:21:36','2023-06-19 01:21:36',2),(10,'2.2. Key Issues in Software Design','2023-06-19 01:21:36','2023-06-19 01:21:36',2),(11,'2.3. Software Structure and Architecture','2023-06-19 01:21:36','2023-06-19 01:21:36',2),(12,'2.4. User Interface Design','2023-06-19 01:21:36','2023-06-19 01:21:36',2),(13,'2.5. Software Design Quality Analysis and Evaluation','2023-06-19 01:21:36','2023-06-19 01:21:36',2),(14,'2.6. Software Design Notations','2023-06-19 01:21:36','2023-06-19 01:21:36',2),(15,'2.7. Software Design Strategies and Methods','2023-06-19 01:21:36','2023-06-19 01:21:36',2),(16,'2.8. Software Design Tools','2023-06-19 01:21:36','2023-06-19 01:21:36',2),(17,'3.1. Software Construction Fundamentals','2023-06-19 01:21:36','2023-06-19 01:21:36',3),(18,'3.2. Managing Construction','2023-06-19 01:21:36','2023-06-19 01:21:36',3),(19,'3.3. Practical Considerations','2023-06-19 01:21:36','2023-06-19 01:21:36',3),(20,'3.4. Construction Technologies','2023-06-19 01:21:36','2023-06-19 01:21:36',3),(21,'3.5. Software Construction Tools','2023-06-19 01:21:36','2023-06-19 01:21:36',3),(22,'4.1. Software Testing Fundamentals','2023-06-19 01:21:36','2023-06-19 01:21:36',4),(23,'4.2. Test Levels','2023-06-19 01:21:36','2023-06-19 01:21:36',4),(24,'4.3. Test Techniques','2023-06-19 01:21:36','2023-06-19 01:21:36',4),(25,'4.4. Test-Related Measures','2023-06-19 01:21:36','2023-06-19 01:21:36',4),(26,'4.5. Test Process','2023-06-19 01:21:36','2023-06-19 01:21:36',4),(27,'4.6. Software Testing Tools','2023-06-19 01:21:36','2023-06-19 01:21:36',4),(28,'5.1. Software Maintenance Fundamentals','2023-06-19 01:21:36','2023-06-19 01:21:36',5),(29,'5.2. Key Issues in Software Maintenance','2023-06-19 01:21:36','2023-06-19 01:21:36',5),(30,'5.3. Maintenance Process','2023-06-19 01:21:36','2023-06-19 01:21:36',5),(31,'5.4. Techniques for Maintenance','2023-06-19 01:21:36','2023-06-19 01:21:36',5),(32,'5.5. Software Maintenance Tools','2023-06-19 01:21:36','2023-06-19 01:21:36',5),(33,'6.1. Management of the SCM Process','2023-06-19 01:21:36','2023-06-19 01:21:36',6),(34,'6.2. Software Configuration Identification','2023-06-19 01:21:36','2023-06-19 01:21:36',6),(35,'6.3. Software Configuration Control','2023-06-19 01:21:36','2023-06-19 01:21:36',6),(36,'6.4. Software Configuration Status Accounting','2023-06-19 01:21:36','2023-06-19 01:21:36',6),(37,'6.5. Software Configuration Auditing','2023-06-19 01:21:36','2023-06-19 01:21:36',6),(38,'6.6. Software Release Management and Delivery','2023-06-19 01:21:36','2023-06-19 01:21:36',6),(39,'6.7. Software Configuration Management Tools','2023-06-19 01:21:36','2023-06-19 01:21:36',6),(40,'7.1. Initiation and Scope Definition','2023-06-19 01:21:36','2023-06-19 01:21:36',7),(41,'7.2. Software Project Planning','2023-06-19 01:21:36','2023-06-19 01:21:36',7),(42,'7.3. Software Project Enactment','2023-06-19 01:21:36','2023-06-19 01:21:36',7),(43,'7.4. Review and Evaluation','2023-06-19 01:21:36','2023-06-19 01:21:36',7),(44,'7.5. Closure','2023-06-19 01:21:36','2023-06-19 01:21:36',7),(45,'7.6. Software Engineering Measurement','2023-06-19 01:21:36','2023-06-19 01:21:36',7),(46,'7.7. Software Engineering Management Tools','2023-06-19 01:21:36','2023-06-19 01:21:36',7),(47,'8.1. Software Process Definition','2023-06-19 01:21:36','2023-06-19 01:21:36',8),(48,'8.2. Software Life Cycles','2023-06-19 01:21:36','2023-06-19 01:21:36',8),(49,'8.3. Software Process Assessment and Improvement','2023-06-19 01:21:36','2023-06-19 01:21:36',8),(50,'8.4. Software Measurement','2023-06-19 01:21:36','2023-06-19 01:21:36',8),(51,'8.5. Software Engineering Process Tools','2023-06-19 01:21:36','2023-06-19 01:21:36',8),(52,'9.1. Modeling','2023-06-19 01:21:36','2023-06-19 01:21:36',9),(53,'9.2. Types of Models','2023-06-19 01:21:36','2023-06-19 01:21:36',9),(54,'9.3. Analysis of Models','2023-06-19 01:21:36','2023-06-19 01:21:36',9),(55,'9.4. Software Engineering Methods','2023-06-19 01:21:36','2023-06-19 01:21:36',9),(56,'10.1. Software Quality Fundamentals','2023-06-19 01:21:36','2023-06-19 01:21:36',10),(57,'10.2. Software Quality Management Processes','2023-06-19 01:21:36','2023-06-19 01:21:36',10),(58,'10.3. Practical Considerations','2023-06-19 01:21:36','2023-06-19 01:21:36',10),(59,'10.4. Software Quality Tools','2023-06-19 01:21:36','2023-06-19 01:21:36',10),(60,'11.1. Professionalism','2023-06-19 01:21:36','2023-06-19 01:21:36',11),(61,'11.2. Group Dynamics and Psychology','2023-06-19 01:21:36','2023-06-19 01:21:36',11),(62,'11.3. Communication Skills','2023-06-19 01:21:36','2023-06-19 01:21:36',11),(63,'12.1. Software Engineering Economics Fundamentals','2023-06-19 01:21:36','2023-06-19 01:21:36',12),(64,'12.2. Life Cycle Economics','2023-06-19 01:21:36','2023-06-19 01:21:36',12),(65,'12.3. Risk and Uncertainty','2023-06-19 01:21:36','2023-06-19 01:21:36',12),(66,'12.4. Economic Analysis Methods','2023-06-19 01:21:36','2023-06-19 01:21:36',12),(67,'12.5. Practical Considerations','2023-06-19 01:21:36','2023-06-19 01:21:36',12),(68,'13.1. Problem Solving Techniques','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(69,'13.2. Abstraction','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(70,'13.3. Programming Fundamentals','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(71,'13.4. Programming Language Basics','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(72,'13.5. Debugging Tools and Techniques','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(73,'13.6. Data Structure and Representation','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(74,'13.7. Algorithms and Complexity','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(75,'13.8. Basic Concept of a System','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(76,'13.9. Computer Organization','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(77,'13.10. Compiler Basics','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(78,'13.11. Operating Systems Basics','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(79,'13.12. Database Basics and Data Management','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(80,'13.13. Network Communication Basics','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(81,'13.14. Parallel and Distributed Computing','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(82,'13.15. Basic User Human Factors','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(83,'13.16. Basic Developer Human Factors','2023-06-19 01:21:36','2023-06-19 01:21:36',13),(84,'13.17. Secure Software Development and Maintenance','2023-06-19 01:21:36','2023-06-19 01:21:36',13);
/*!40000 ALTER TABLE `Swebok_Topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'swebok'
--

--
-- Dumping routines for database 'swebok'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-10 16:43:59