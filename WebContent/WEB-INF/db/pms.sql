CREATE DATABASE  IF NOT EXISTS `pms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pms`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: pms
-- ------------------------------------------------------
-- Server version	5.6.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `jobId` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(100) DEFAULT NULL,
  `jobDetail` varchar(1000) DEFAULT NULL,
  `basicRate` float DEFAULT NULL,
  `dARate` float DEFAULT NULL,
  PRIMARY KEY (`jobId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Salesman','Sale the product',10000,1200),(2,'Clerk','Production check work',12000,1200),(3,'Manager','Manages the assignment of the job to the laborers and their payments',30000,10000),(4,'Maintenance','Maintain the machine working',20000,5000),(5,'Repair Man','Repairs the fault in the machines',20000,1000),(6,'Quality Analyst','Check the quality of the product',20000,1000),(7,'Transporter','Transports the products and goods from one place to another place',10000,5000),(8,'Market Analyzer','Analyze the market and its dmand',10000,5000),(9,'JOINING','JOINED THE APPLICATION',0,0),(10,'Test-1','Test-1',1200,1230),(11,'Test TWO','Test TWO',120.12,120.12),(12,'Test THREE','Test THREE',120.12,120.12),(13,'Test 2','Test 2',1203.12,120.12),(14,'Test.4','Test_4',120.3,210.2),(15,'asd4','asd',123,321);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labourjob`
--

DROP TABLE IF EXISTS `labourjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labourjob` (
  `labourJobId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `jobId` int(11) DEFAULT NULL,
  `jobDate` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `wage` float DEFAULT NULL,
  PRIMARY KEY (`labourJobId`),
  KEY `userId` (`userId`),
  KEY `jobId` (`jobId`),
  CONSTRAINT `labourjob_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `labourjob_ibfk_2` FOREIGN KEY (`jobId`) REFERENCES `job` (`jobId`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labourjob`
--

LOCK TABLES `labourjob` WRITE;
/*!40000 ALTER TABLE `labourjob` DISABLE KEYS */;
INSERT INTO `labourjob` VALUES (23,16,9,'2016-07-26 22:41:43','COMPLETE',0),(24,17,9,'2016-07-26 22:41:43','COMPLETE',0),(25,18,9,'2016-07-26 22:41:43','COMPLETE',0),(26,19,9,'2016-07-26 22:41:43','COMPLETE',0),(27,20,9,'2016-07-26 22:41:43','COMPLETE',0),(28,21,9,'2016-07-26 22:41:43','COMPLETE',0),(29,22,9,'2016-07-26 22:41:43','COMPLETE',0),(30,23,9,'2016-07-26 22:41:43','COMPLETE',0),(31,24,9,'2016-07-26 22:41:43','COMPLETE',0),(32,25,9,'2016-07-26 22:41:43','COMPLETE',0),(33,26,9,'2016-07-26 22:41:43','COMPLETE',0),(34,27,9,'2016-07-26 22:41:43','COMPLETE',0),(35,28,9,'2016-07-26 22:41:43','COMPLETE',0),(36,29,9,'2016-07-26 22:41:43','COMPLETE',0),(37,30,9,'2016-07-26 22:41:43','COMPLETE',0),(38,31,9,'2016-07-26 22:41:43','COMPLETE',0),(39,32,9,'2016-07-26 22:41:43','COMPLETE',0),(40,33,9,'2016-07-26 22:41:43','COMPLETE',0),(41,34,9,'2016-07-26 22:41:43','COMPLETE',0),(43,36,9,'2016-07-26 22:41:43','COMPLETE',0),(44,37,9,'2016-07-26 22:41:43','COMPLETE',0),(45,38,9,'2016-07-26 22:41:43','COMPLETE',0),(47,40,9,'2016-07-26 22:41:43','COMPLETE',0),(48,41,9,'2016-07-26 22:41:43','COMPLETE',0),(49,42,9,'2016-07-26 22:41:43','COMPLETE',0),(50,43,9,'2016-07-26 22:41:43','COMPLETE',0),(51,44,9,'2016-07-26 22:41:43','COMPLETE',0),(52,45,9,'2016-07-26 22:41:43','COMPLETE',0),(53,46,9,'2016-07-26 22:41:43','COMPLETE',0),(54,47,9,'2016-07-26 22:41:43','COMPLETE',0),(55,48,9,'2016-07-26 22:41:43','COMPLETE',0),(56,49,9,'2016-07-26 22:41:43','COMPLETE',0),(57,50,9,'2016-07-26 22:41:43','COMPLETE',0),(59,52,9,'2016-07-26 22:41:43','COMPLETE',0),(60,53,9,'2016-07-26 22:41:43','COMPLETE',0),(62,55,9,'2016-07-26 22:41:43','COMPLETE',0),(63,56,9,'2016-07-26 22:41:43','COMPLETE',0),(64,57,9,'2016-07-26 22:41:43','COMPLETE',0),(65,58,9,'2016-07-26 22:41:43','COMPLETE',0),(67,60,9,'2016-07-26 22:41:43','COMPLETE',0),(68,61,9,'2016-07-26 22:41:43','COMPLETE',0),(69,62,9,'2016-07-26 22:41:43','COMPLETE',0),(70,63,9,'2016-07-26 22:41:43','COMPLETE',0),(71,64,9,'2016-07-26 22:41:43','COMPLETE',0),(72,65,9,'2016-07-26 22:41:43','COMPLETE',0),(73,66,9,'2016-07-26 22:41:43','COMPLETE',0),(74,67,9,'2016-07-26 22:41:43','COMPLETE',0),(75,68,9,'2016-07-26 22:41:43','COMPLETE',0),(77,70,9,'2016-07-26 22:41:43','COMPLETE',0),(78,71,9,'2016-07-26 22:41:43','COMPLETE',0),(79,72,9,'2016-07-26 22:41:43','COMPLETE',0),(80,73,9,'2016-07-26 22:41:43','COMPLETE',0),(81,74,9,'2016-07-26 22:41:43','COMPLETE',0),(82,75,9,'2016-07-26 22:41:43','COMPLETE',0),(83,76,9,'2016-07-26 22:41:43','COMPLETE',0),(84,77,9,'2016-07-26 22:41:43','COMPLETE',0),(85,78,9,'2016-07-26 22:41:43','COMPLETE',0),(87,80,9,'2016-07-26 22:41:43','COMPLETE',0),(88,81,9,'2016-07-26 22:41:43','COMPLETE',0),(89,82,9,'2016-07-26 22:41:43','COMPLETE',0),(90,83,9,'2016-07-26 22:41:43','COMPLETE',0),(91,84,9,'2016-07-26 22:41:43','COMPLETE',0),(92,85,9,'2016-07-26 22:41:43','COMPLETE',0),(93,86,9,'2016-07-26 22:41:43','COMPLETE',0),(94,87,9,'2016-07-26 22:41:43','COMPLETE',0),(95,88,9,'2016-07-26 22:41:43','COMPLETE',0),(96,89,9,'2016-07-26 22:41:43','COMPLETE',0),(98,91,9,'2016-07-26 22:41:43','COMPLETE',0),(99,92,9,'2016-07-26 22:41:43','COMPLETE',0),(100,33,2,'2016-07-27 22:42:38','INCOMPLETE',13200),(101,49,4,'2016-07-27 22:42:51','INCOMPLETE',25000),(102,92,3,'2016-07-27 22:43:04','INCOMPLETE',40000),(103,78,5,'2016-07-27 22:49:39','INCOMPLETE',21000),(104,91,3,'2016-07-28 00:02:28','INCOMPLETE',40000),(105,92,4,'2016-07-28 10:17:33','INCOMPLETE',25000),(106,91,3,'2016-07-29 00:22:31','INCOMPLETE',40000),(107,49,2,'2016-07-30 00:15:36','INCOMPLETE',13200),(108,33,2,'2016-07-30 22:46:14','INCOMPLETE',13200),(109,34,4,'2016-07-30 22:46:22','INCOMPLETE',25000),(110,30,8,'2016-07-30 22:46:50','INCOMPLETE',15000),(111,58,6,'2016-07-30 22:47:01','INCOMPLETE',21000),(112,65,5,'2016-07-30 22:47:10','INCOMPLETE',21000),(113,84,1,'2016-07-30 22:47:35','INCOMPLETE',11200),(114,21,8,'2016-07-30 22:47:50','INCOMPLETE',15000),(115,64,6,'2016-07-30 22:48:05','INCOMPLETE',21000),(116,74,5,'2016-07-30 22:48:16','INCOMPLETE',21000),(117,17,1,'2016-07-30 22:48:29','INCOMPLETE',11200),(118,33,2,'2016-07-31 00:39:49','COMPLETE',13200),(119,49,4,'2016-07-31 00:39:54','INCOMPLETE',25000),(120,30,8,'2016-07-31 00:40:00','INCOMPLETE',15000),(121,91,3,'2016-07-31 00:40:07','COMPLETE',40000),(122,92,3,'2016-07-31 14:44:15','COMPLETE',40000),(123,93,9,'2016-07-30 14:47:38','COMPLETE',0),(124,93,3,'2016-07-31 14:48:20','COMPLETE',40000),(125,33,2,'2016-08-01 09:43:05','INCOMPLETE',13200),(126,93,4,'2016-08-01 09:43:28','INCOMPLETE',25000),(127,91,3,'2016-08-01 10:18:54','INCOMPLETE',40000),(128,33,2,'2016-08-03 15:32:48','COMPLETE',13200),(129,94,9,'2016-08-02 15:59:12','COMPLETE',0),(130,91,3,'2016-08-03 18:25:46','COMPLETE',40000),(131,33,5,'2016-08-04 00:31:02','COMPLETE',21000),(132,33,2,'2016-08-05 15:40:26','INCOMPLETE',13200),(133,33,2,'2016-08-06 20:12:48','INCOMPLETE',13200),(134,33,2,'2016-08-07 15:52:15','INCOMPLETE',13200),(135,49,4,'2016-08-07 18:19:44','INCOMPLETE',25000),(136,33,2,'2016-08-08 09:47:06','INCOMPLETE',13200),(137,49,4,'2016-08-08 09:47:12','INCOMPLETE',25000),(138,46,8,'2016-08-08 09:47:20','INCOMPLETE',15000),(139,92,6,'2016-08-08 09:47:36','INCOMPLETE',21000),(140,91,3,'2016-08-08 09:48:23','COMPLETE',40000),(141,95,9,'2016-08-07 16:27:13','COMPLETE',0),(142,33,2,'2016-08-10 19:50:13','INCOMPLETE',13200),(143,49,4,'2016-08-10 19:50:19','COMPLETE',25000),(144,96,9,'2016-08-10 23:42:53','COMPLETE',0),(145,33,2,'2016-08-11 23:44:46','COMPLETE',13200),(146,49,4,'2016-08-11 23:44:52','INCOMPLETE',25000),(147,46,6,'2016-08-11 23:45:00','INCOMPLETE',21000),(148,92,8,'2016-08-11 23:45:16','COMPLETE',15000),(149,91,3,'2016-08-11 23:45:25','COMPLETE',40000),(150,33,2,'2016-08-12 09:43:14','COMPLETE',13200),(151,49,4,'2016-08-12 09:43:20','INCOMPLETE',25000),(152,91,3,'2016-08-12 09:43:36','COMPLETE',40000);
/*!40000 ALTER TABLE `labourjob` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_labourboj_update
    AFTER UPDATE ON labourjob
    FOR EACH ROW 
BEGIN
UPDATE laboursalary 
SET 
    userId = NEW.userId,
totalSalary = totalSalary + NEW.wage
WHERE
userId = NEW.userId 
AND NEW.remark = 'COMPLETE';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `labourjobview`
--

DROP TABLE IF EXISTS `labourjobview`;
/*!50001 DROP VIEW IF EXISTS `labourjobview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `labourjobview` AS SELECT 
 1 AS `labourJobId`,
 1 AS `userId`,
 1 AS `firstName`,
 1 AS `lastName`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `device`,
 1 AS `type`,
 1 AS `jobId`,
 1 AS `job`,
 1 AS `jobDetail`,
 1 AS `basicRate`,
 1 AS `dARate`,
 1 AS `jobDate`,
 1 AS `remark`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `labourjobview2`
--

DROP TABLE IF EXISTS `labourjobview2`;
/*!50001 DROP VIEW IF EXISTS `labourjobview2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `labourjobview2` AS SELECT 
 1 AS `labourJobId`,
 1 AS `userId`,
 1 AS `firstName`,
 1 AS `lastName`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `device`,
 1 AS `type`,
 1 AS `jobId`,
 1 AS `job`,
 1 AS `jobDetail`,
 1 AS `basicRate`,
 1 AS `dARate`,
 1 AS `jobDate`,
 1 AS `remark`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `labourpayment`
--

DROP TABLE IF EXISTS `labourpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labourpayment` (
  `labourPaymentId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `amountBefore` float DEFAULT NULL,
  `paidAmount` float DEFAULT NULL,
  `paidDate` datetime DEFAULT NULL,
  PRIMARY KEY (`labourPaymentId`),
  KEY `userId` (`userId`),
  CONSTRAINT `labourpayment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labourpayment`
--

LOCK TABLES `labourpayment` WRITE;
/*!40000 ALTER TABLE `labourpayment` DISABLE KEYS */;
INSERT INTO `labourpayment` VALUES (226,33,26400,6400,'2016-08-03 15:42:08'),(227,33,20000,20000,'2016-08-03 15:52:44'),(228,91,40000,0,'2016-08-03 23:50:09'),(229,92,40000,40000,'2016-08-03 15:53:04'),(230,93,40000,40000,'2016-08-03 15:53:08'),(234,91,40000,2000,'2016-08-04 00:25:16'),(235,91,38000,2000,'2016-08-04 00:27:25'),(236,33,21000,2000,'2016-08-04 00:31:59'),(237,91,116000,16000,'2016-08-11 23:46:49'),(238,91,100000,5000,'2016-08-11 23:46:58'),(239,91,95000,35000,'2016-08-11 23:47:07'),(240,33,32200,3200,'2016-08-11 23:47:17'),(241,33,29000,17000,'2016-08-11 23:47:25'),(242,91,60000,1000,'2016-08-11 23:47:41'),(243,91,59000,2000,'2016-08-11 23:47:48'),(244,91,57000,3000,'2016-08-11 23:47:53'),(245,91,54000,4000,'2016-08-11 23:47:59'),(246,91,50000,5000,'2016-08-11 23:48:07'),(247,91,45000,6000,'2016-08-11 23:48:13'),(248,91,39000,7000,'2016-08-11 23:48:20'),(249,91,32000,8000,'2016-08-11 23:48:28');
/*!40000 ALTER TABLE `labourpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboursalary`
--

DROP TABLE IF EXISTS `laboursalary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboursalary` (
  `labourSalaryId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `totalSalary` float DEFAULT NULL,
  PRIMARY KEY (`labourSalaryId`),
  KEY `userId` (`userId`),
  CONSTRAINT `laboursalary_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboursalary`
--

LOCK TABLES `laboursalary` WRITE;
/*!40000 ALTER TABLE `laboursalary` DISABLE KEYS */;
INSERT INTO `laboursalary` VALUES (15,16,0),(16,17,0),(17,18,0),(18,19,0),(19,20,0),(20,21,0),(21,22,0),(22,23,0),(23,24,0),(24,25,0),(25,26,0),(26,27,0),(27,28,0),(28,29,0),(29,30,0),(30,31,0),(31,32,0),(32,33,25200),(33,34,0),(35,36,0),(36,37,0),(37,38,0),(39,40,0),(40,41,0),(41,42,0),(42,43,0),(43,44,0),(44,45,0),(45,46,0),(46,47,0),(47,48,0),(48,49,25000),(49,50,0),(51,52,0),(52,53,0),(54,55,0),(55,56,0),(56,57,0),(57,58,0),(59,60,0),(60,61,0),(61,62,0),(62,63,0),(63,64,0),(64,65,0),(65,66,0),(66,67,0),(67,68,0),(69,70,0),(70,71,0),(71,72,0),(72,73,0),(73,74,0),(74,75,0),(75,76,0),(76,77,0),(77,78,0),(79,80,0),(80,81,0),(81,82,0),(82,83,0),(83,84,0),(84,85,0),(85,86,0),(86,87,0),(87,88,0),(88,89,0),(90,91,64000),(91,92,15000),(92,93,0),(93,94,0),(94,95,0),(95,96,0);
/*!40000 ALTER TABLE `laboursalary` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_laboursalary_payment
    BEFORE UPDATE ON laboursalary
    FOR EACH ROW 
BEGIN
IF OLD.totalSalary > NEW.totalSalary THEN
INSERT INTO labourpayment
SET 
userId = OLD.userId,
amountBefore = OLD.totalSalary,
paidDate = NOW();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_laboursalary_payment
    AFTER UPDATE ON laboursalary
    FOR EACH ROW 
BEGIN
IF OLD.totalSalary > NEW.totalSalary THEN
UPDATE labourpayment
SET 
paidAmount = amountBefore - NEW.totalSalary
WHERE
userId = NEW.userId
AND amountBefore = OLD.totalSalary
AND paidDate = NOW();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `laboursalaryview`
--

DROP TABLE IF EXISTS `laboursalaryview`;
/*!50001 DROP VIEW IF EXISTS `laboursalaryview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `laboursalaryview` AS SELECT 
 1 AS `labourSalaryId`,
 1 AS `userId`,
 1 AS `firstName`,
 1 AS `lastName`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `device`,
 1 AS `type`,
 1 AS `totalSalary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `joinDate` datetime DEFAULT NULL,
  `device` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'Chandra Prakash','Gupta','chandra.prakashg01@gmail.com','9078912030','123456','2016-07-02 17:48:55','ASUS 6.0  ANDROID','ADMIN'),(16,'marta','guerrero','marta.guerrero@example.com','609-067-356','talisman','2016-07-03 16:15:56','39c9238904514857656fa1c9b31e5714a5644042','LABOUR'),(17,'niilo','mattila','niilo.mattila@example.com','047-159-43-51','forever','2016-07-03 16:15:56','8900b02cc8275458d139bcb056652f501136ff95','LABOUR'),(18,'janete','silveira','janete.silveira@example.com','(30) 2864-1719','1230','2016-07-03 16:19:16','6a8498c18dd3bb52b9d8564a426d1f5c0156977c','LABOUR'),(19,'tiago','denis','tiago.denis@example.com','06-01-56-37-70','bing','2016-07-03 16:19:16','2a2e17c7be7b0bef4bb06823383409fd9048f89c','LABOUR'),(20,'encarnacion','cortes','encarnacion.cortes@example.com','659-138-925','zhuan','2016-07-03 16:20:34','21a3a63cdcb922b39ad163719ec9a407f371acdc','LABOUR'),(21,'anton','nurmi','anton.nurmi@example.com','048-272-80-32','gunther','2016-07-03 16:20:34','dc514f24fe150e7d9148ad07dc895daf2fd76840','LABOUR'),(22,'jon','murray','jon.murray@example.com','(096)-915-1116','firefly','2016-07-03 16:21:00','b89cf44538959d774f47e42a9413f2aa3c697963','LABOUR'),(23,'hadrien','martinez','hadrien.martinez@example.com','(393)-240-9803','hookup','2016-07-03 16:21:00','c47c2f02bac55b644bd2e13a16b72f6bc019a929','LABOUR'),(24,'marsha','stevens','marsha.stevens@example.com','0449-243-716','entropy','2016-07-03 16:21:15','0d49664dea6790db43b84a78e779e5acf7da17a1','LABOUR'),(25,'omer','fernandes','omer.fernandes@example.com','(04) 8582-0820','benjamin','2016-07-03 16:21:16','da925bf980129c106d276b0940ef7d09a850ccdd','LABOUR'),(26,'ceylan','poçan','ceylan.poçan@example.com','(974)-033-3269','spikey','2016-07-03 16:22:17','22c6b1c3769778c5bc68532fe83a37e53b3f73f0','LABOUR'),(27,'özkan','tüzün','özkan.tüzün@example.com','(181)-287-2654','tribe','2016-07-03 16:22:17','6f756afb1184be8d517e7199f35c7212d45dc888','LABOUR'),(28,'nora','armstrong','nora.armstrong@example.com','0441-167-980','5wr2i7h8','2016-07-03 16:22:40','77082222d7eda4be2c8aaed4169d51d6cca9e677','LABOUR'),(29,'mia','singh','mia.singh@example.com','(669)-379-9766','ppppp','2016-07-03 16:22:40','64aed89bb7eccfa3052a879195dbcbbdb2d1376c','LABOUR'),(30,'avery','wade','avery.wade@example.com','(215)-846-0859','telephon','2016-07-03 16:23:26','45de0b8e0ff33d500540a55ff57c4e70b6e6e381','LABOUR'),(31,'lee','carter','lee.carter@example.com','0464-842-130','bryan','2016-07-03 16:23:26','47fd05a80f8e1fc1a61da35e80b60c93651ec56c','LABOUR'),(32,'pascal','kolb','pascal.kolb@example.com','0173-2833770','myxworld','2016-07-03 16:24:00','a38e7091127be4ce6468ac7dabebcb2d2f3871c7','LABOUR'),(33,'abigail','green','abigail.green@example.com','(360)-524-4730','123456','2016-07-03 16:24:01','db6f3ec040b90a16a1d25da991708b503466ebba','LABOUR'),(34,'amanda','austin','amanda.austin@example.com','(893)-483-0696','portugal','2016-07-03 16:24:28','c363d5b209fb4acc1673905ecdbc801e7e7ca770','LABOUR'),(36,'stephen','lopez','stephen.lopez@example.com','0403-165-400','cigars','2016-07-03 16:25:11','ade083af5a008c3d84b87e4e743449957137fae6','LABOUR'),(37,'avery','matthews','avery.matthews@example.com','081-775-2883','bonjovi','2016-07-03 16:25:11','5c3ff521d88a79e85055a833e680fd0cca1be31a','LABOUR'),(38,'iiris','nevala','iiris.nevala@example.com','041-918-40-77','fishfish','2016-07-03 16:25:47','cb19048aaacd926e47d8c3b37a96db2f1e239dec','LABOUR'),(40,'ronald','phillips','ronald.phillips@example.com','0728-881-301','spurs1','2016-07-03 16:26:23','daa62f14922e219cd199545108376208ffd81a8e','LABOUR'),(41,'çağlar','verhoeven','çağlar.verhoeven@example.com','(469)-742-2162','pookey','2016-07-03 16:26:24','d1118be1845a5869dcb62267ddf992cddbc6c203','LABOUR'),(42,'george','newman','george.newman@example.com','(369)-515-7093','010101','2016-07-03 16:26:53','e4e54d2982011dc3df88a78730a7f6e6421e5a6d','LABOUR'),(43,'brooke','andrews','brooke.andrews@example.com','0792-084-077','elaine','2016-07-03 16:26:53','0ec9412a1ebe315e0466edc62709595c9897babb','LABOUR'),(44,'lucy','jones','lucy.jones@example.com','(679)-380-8222','kings','2016-07-03 16:27:29','2fdbb60e6523ffc331542a21edd11db60b93173c','LABOUR'),(45,'rasha','straatman','rasha.straatman@example.com','(823)-009-0363','momoney','2016-07-03 16:27:29','799cf1baed87335e8088b9be6488348e4570ad26','LABOUR'),(46,'akseli','peura','akseli.peura@example.com','047-953-65-08','taxman','2016-07-03 16:27:49','a79f7984a93afc0035a2e2140aeb3b8770b5e151','LABOUR'),(47,'koray','polat','koray.polat@example.com','(626)-728-8107','aviation','2016-07-03 16:27:49','b772439b2eeafcef14046e544d36f399dadc5ce5','LABOUR'),(48,'signe','christensen','signe.christensen@example.com','66774434','magic32','2016-07-03 16:28:08','629fda2135e4d3c15aa9fb0d01d275c173807d7a','LABOUR'),(49,'alicia','brun','alicia.brun@example.com','06-61-91-41-18','cigar','2016-07-03 16:28:08','6a7cfeb0b47492f8d4d70a07ed9257732620e39e','LABOUR'),(50,'german','vega','german.vega@example.com','618-778-402','tights','2016-07-03 16:28:50','8d5f867084392116d241a31d3846dabaee582223','LABOUR'),(52,'laurine','gonzalez','laurine.gonzalez@example.com','06-70-18-06-47','peng','2016-07-03 16:29:27','f341788d826377a7752aeb29b930140c596b2109','LABOUR'),(53,'sedef','erginsoy','sedef.erginsoy@example.com','(188)-342-7110','zephyr','2016-07-03 16:29:27','a0745e585c8334b2cd56f4f12863dafe18f62c6d','LABOUR'),(55,'philip','ortiz','philip.ortiz@example.com','(629)-480-2228','1234567890','2016-07-03 16:30:01','ff4b6f4b09f39b3c4aff2f289007ac5b94b333ee','LABOUR'),(56,'ítalo','das neves','ítalo.dasneves@example.com','(07) 0902-3100','hound','2016-07-03 16:30:27','4e64e9d18a71da98264e90b712e3bd5df158a283','LABOUR'),(57,'isaac','li','isaac.li@example.com','(811)-192-9802','touching','2016-07-03 16:30:28','e8c5bf117397278ee362fe1c4adb6a7a03ac1aae','LABOUR'),(58,'ayça','delfos','ayça.delfos@example.com','(786)-825-4650','sancho','2016-07-03 16:31:04','e1f8dfc07fb4484ae3064875dbabd7eaf53f903c','LABOUR'),(60,'rayan','marchand','rayan.marchand@example.com','06-23-48-05-18','black1','2016-07-03 16:31:27','5fbc0c94e22577edfcef0c3e8deefd2f74a51e8a','LABOUR'),(61,'oscar','andersen','oscar.andersen@example.com','57152404','snoop','2016-07-03 16:31:27','52af401e2cd704862f534f9f3de94523c5ed2026','LABOUR'),(62,'silja','heere','silja.heere@example.com','(778)-163-1941','cruiser','2016-07-03 16:32:13','cd55c31f9d3d1e2db85fbc4ebb08e8148172276a','LABOUR'),(63,'priscila','moreira','priscila.moreira@example.com','(20) 3933-8568','callaway','2016-07-03 16:32:13','a329bc9124bdc0629229770fa641c6d7d77b1763','LABOUR'),(64,'ann','elliott','ann.elliott@example.com','(442)-443-2688','achilles','2016-07-03 16:32:51','25430a8fe832c500536c7eecffbda9a02b04d5fc','LABOUR'),(65,'clara','olsen','clara.olsen@example.com','27652264','slappy','2016-07-03 16:32:51','e1ae7319ea4ff913ecaea92f806c85fe3cee24d6','LABOUR'),(66,'yesse','van de wege','yesse.vande wege@example.com','(560)-702-5243','sphinx','2016-07-03 16:34:09','4374d2593881996b2190d849e26c9ea7acd447fa','LABOUR'),(67,'rosemerie','fernandes','rosemerie.fernandes@example.com','(41) 3850-4092','gandalf1','2016-07-03 16:34:09','c6a65c5e77a70fa17e47d4964e2ba2c8850f7177','LABOUR'),(68,'mia','moore','mia.moore@example.com','(865)-265-0482','tacobell','2016-07-03 16:34:29','a36550657463d810ec9cdeadbd9404b41786b6c8','LABOUR'),(70,'sophia','chow','sophia.chow@example.com','369-290-9581','tiffany','2016-07-03 16:35:01','75a434419f1a8013ad32f4aeae820af29cc24443','LABOUR'),(71,'katie','johnson','katie.johnson@example.com','(357)-494-2674','florida','2016-07-03 16:35:01','ef5c15e282dadcac36e5452ff49b3997dac5bfa3','LABOUR'),(72,'babür','gürmen','babür.gürmen@example.com','(272)-181-4811','hattrick','2016-07-03 16:35:14','5c308c42cc52784630b2209110e716fc36b214ca','LABOUR'),(73,'zita','berghout','zita.berghout@example.com','(932)-552-3110','soprano','2016-07-03 16:35:14','3ad63e4571f027fb48e0bf7af39ddd105e2bbc3b','LABOUR'),(74,'elisabeth','nascimento','elisabeth.nascimento@example.com','(27) 7477-6405','lottie','2016-07-03 16:36:06','30feac6e5342671d372113934812ab0404d1a3f3','LABOUR'),(75,'spencer','spel','spencer.spel@example.com','(516)-679-4868','church','2016-07-03 16:36:06','ab93d51172bafa68411d47ab66fe50627da31c12','LABOUR'),(76,'darcy','van woezik','darcy.vanwoezik@example.com','(094)-424-2024','123456','2016-07-03 16:36:23','8a8c15e9cc24c70a3c7f33704b9ac489fc42727f','LABOUR'),(77,'tina','jahn','tina.jahn@example.com','0179-3594600','montag','2016-07-03 16:36:23','4467245d696a5588ea053c9bc234ebc27e6e11bf','LABOUR'),(78,'leo','martin','leo.martin@example.com','180-781-3119','blanche','2016-07-03 16:36:40','453cdfdbaa0618f6623f0a7a8550ecfd33722ee1','LABOUR'),(80,'teresa','bennett','teresa.bennett@example.com','0764-824-262','candy1','2016-07-03 16:36:56','f8fb1bdfc0b40f1fa7a662afdc85b91dd55e045e','LABOUR'),(81,'sofia','vidal','sofia.vidal@example.com','664-470-549','moscow','2016-07-03 16:36:56','434b0bf22c6212e5f61b56319652b024bab40f0f','LABOUR'),(82,'ross','hanson','ross.hanson@example.com','0714-625-118','guido','2016-07-03 16:37:33','006d6a7cda594023eb9582a6414042a8ce92619a','LABOUR'),(83,'tilde','hansen','tilde.hansen@example.com','18152618','1987','2016-07-03 16:37:34','1818ef2f733692ee4121bc7c88af2fdbac03e790','LABOUR'),(84,'edouard','rousseau','edouard.rousseau@example.com','(191)-449-9762','knickerless','2016-07-03 16:37:51','141f670253bef63fe325ee7f6851a3ff92a24dc5','LABOUR'),(85,'victor','wilson','victor.wilson@example.com','561-069-1534','titleist','2016-07-03 16:37:51','740c69269c0507673087268c694e39efdfae7081','LABOUR'),(86,'kiara','duval','kiara.duval@example.com','(274)-175-7364','zzzzzzzz','2016-07-03 16:38:21','b193ba71e7d33ee8b39a33ab1e4b0cb5883fbc3e','LABOUR'),(87,'harper','morin','harper.morin@example.com','154-866-5603','11111','2016-07-03 16:38:21','f9e398e31d92c98e1902aa9533b501ec2025b9f8','LABOUR'),(88,'tom','pierce','tom.pierce@example.com','081-410-4451','elaine','2016-07-03 16:38:35','0d9ecaeeb76e5f1ec88e2955cb54c04ac63e0ccb','LABOUR'),(89,'ruben','payne','ruben.payne@example.com','0723-373-364','harvey','2016-07-03 16:38:35','ea94d0dfea3ed90ffad84b8762597ee4fda922db','LABOUR'),(91,'Prakash','Gupta','130301csr027@cutm.ac.in','7800430330','123456','2016-07-25 22:05:10','Web App','LABOUR'),(92,'Jeevani','Patnaik','130301csr001@cutm.ac.in','8956741235','123456','2016-07-26 14:34:34','Web App 2','LABOUR'),(93,'Chandra','Gupta','chandra.prakashgupta1@ymail.com','7800430330','123456','2016-07-31 14:47:38','Web Application','LABOUR'),(94,'qwerty','qwerty','qwerty@asd.com','9876543210','123456','2016-08-03 15:59:12','Web Application','LABOUR'),(95,'qwertya','qwertya','qwerty1@asd.com','9874152063','123456','2016-08-08 16:27:13','Web Application','LABOUR'),(96,'qwertyb','qwertyb','qwerty2@asd.com','9871230456','123456','2016-08-11 23:42:53','Web Application','LABOUR');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_labour_register
    AFTER INSERT ON user
    FOR EACH ROW 
BEGIN

INSERT INTO laboursalary
SET 
    userId = NEW.userId,
totalSalary = 0;

INSERT INTO labourjob
SET
userId = NEW.userId,
jobId = 9,
jobDate = DATE_SUB(NOW(), INTERVAL 1 DAY),
remark = 'COMPLETE',
wage = 0;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'pms'
--

--
-- Dumping routines for database 'pms'
--
/*!50003 DROP FUNCTION IF EXISTS `checklabourschedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `checklabourschedule`(r_userId INTEGER, r_jobDate INTEGER) RETURNS int(11)
BEGIN

DECLARE s_userId INT(11) DEFAULT 0;

SET s_userId = (SELECT userId FROM labourjobview WHERE jobDate=DATE_FORMAT(DATE_ADD(NOW(), INTERVAL r_jobDate DAY),'%d %b %Y') AND userId=r_userId);

IF s_userId > 0 THEN
RETURN 1;
ELSE
RETURN 0;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `labourcountbetweenmonths` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `labourcountbetweenmonths`(dateFrom VARCHAR(100), dateTo VARCHAR(100)) RETURNS int(11)
BEGIN

DECLARE s_count INT(11) DEFAULT 0;

SET s_count = (SELECT COUNT(*) FROM pms.user WHERE DATE_FORMAT(joinDate, '%Y-%m-%d') BETWEEN dateFrom AND dateTo);

RETURN s_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `labourcountcurrentmonth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `labourcountcurrentmonth`() RETURNS int(11)
BEGIN

DECLARE s_count INT(11) DEFAULT 0;

SET s_count = (SELECT COUNT(*) FROM pms.user WHERE YEAR(joinDate)=YEAR(NOW()) AND MONTH(joinDate)=MONTH(NOW()));

RETURN s_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `labourcounttotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `labourcounttotal`() RETURNS int(11)
BEGIN

DECLARE s_count INT(11) DEFAULT 0;

SET s_count = (SELECT COUNT(*) FROM user);

RETURN s_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addnewjob` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addnewjob`(
in r_job varchar(100),
in r_jobDetail varchar(100),
in r_basicRate float,
in r_dARate float,
out r_jobId int(11)
)
begin

INSERT INTO job(job, jobDetail, basicRate, dARate)
VALUES(r_job, r_jobDetail, r_basicRate, r_dARate);

set r_jobId = (SELECT jobId FROM job WHERE job.job=r_job);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assignedjobdetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assignedjobdetail`(
in r_labourJobId int(11),
out r_userId int(11),
out r_firstName varchar(100),
out r_lastName varchar(100),
out r_email varchar(100),
out r_phone varchar(20),
out r_device varchar(100),
out r_type varchar(20),
out r_jobId int(11),
out r_job varchar(100),
out r_jobDetail varchar(1000),
out r_basicRate FLOAT,
out r_dARate FLOAT,
out r_jobDate varchar(100),
out r_remark varchar(100)
)
begin

(SELECT 
labourJobId, userId, firstName, lastName, email, phone, device, type, jobId, job, jobDetail, basicRate, daRate, jobDate, remark
into r_labourJobId, r_userId, r_firstName, r_lastName, r_email, r_phone, r_device, r_type, r_jobId, r_job, r_jobDetail, r_basicRate, r_dARate, r_jobDate, r_remark
FROM labourjobview
WHERE labourJobId=r_labourJobId);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assignlabourjob` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assignlabourjob`(
in r_userId int(11),
in r_jobId int(11),
in r_jobDate int(11),
out r_labourJobId int(11)
)
begin

declare r_wage float default 0;

set r_wage = (SELECT (basicRate + dARate) as wage FROM job WHERE jobId=r_jobId);

insert into labourjob(userId, jobId, jobDate, remark, wage) 
values(r_userId, r_jobId, DATE_ADD(NOW(),INTERVAL r_jobDate DAY), 'INCOMPLETE', r_wage);

set r_labourJobId = (SELECT labourJobId FROM labourjob WHERE userId=r_userId AND jobId=r_jobId AND jobDate=DATE_ADD(NOW(),INTERVAL r_jobDate DAY));

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findlabour` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findlabour`(
in r_email varchar(100),
out r_userId int(11)
)
begin

set r_userId = 0;

set r_userId = (select userId from user where email=r_email);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `labourjobremark` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `labourjobremark`(
in r_labourJobId int(11),
in r_remark varchar(100)
)
begin

UPDATE labourjob
SET remark=UPPER(r_remark)
WHERE labourJobId=r_labourJobId;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `laboursalarypayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `laboursalarypayment`(
in r_userId int(11),
in r_paidAmount float
)
begin

UPDATE laboursalary
SET totalSalary=totalSalary-r_paidAmount
WHERE userId=r_userId;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(
out r_firstName varchar(100),
out r_lastName varchar(100),
in r_email varchar(100),
in r_password varchar(32),
out r_phone varchar(20),
out r_device varchar(100),
out r_type varchar(20),
out r_userId int(11)
)
begin


select userId, firstName, lastName, phone, device, type into r_userId, r_firstName, r_lastName, r_phone, r_device, r_type from user where email=r_email and password=r_password;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register`(
in r_firstName varchar(100),
in r_lastName varchar(100),
in r_email varchar(100),
in r_password varchar(32),
in r_phone varchar(20),
in r_device varchar(100),
in r_type varchar(20),
out r_userId int(11)
)
begin

set r_type = 'LABOUR';

insert into user (firstName, lastName, email, phone, password, joinDate, device, type)
values (r_firstName, r_lastName, r_email, r_phone, r_password, now(), r_device, r_type);

set r_userId = (select userId from user where email=r_email and password=r_password);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `labourjobview`
--

/*!50001 DROP VIEW IF EXISTS `labourjobview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `labourjobview` AS select `l`.`labourJobId` AS `labourJobId`,`u`.`userId` AS `userId`,`u`.`firstName` AS `firstName`,`u`.`lastName` AS `lastName`,`u`.`email` AS `email`,`u`.`phone` AS `phone`,`u`.`device` AS `device`,`u`.`type` AS `type`,`j`.`jobId` AS `jobId`,`j`.`job` AS `job`,`j`.`jobDetail` AS `jobDetail`,`j`.`basicRate` AS `basicRate`,`j`.`dARate` AS `dARate`,date_format(`l`.`jobDate`,'%d %b %Y') AS `jobDate`,`l`.`remark` AS `remark` from ((`labourjob` `l` join `job` `j`) join `user` `u`) where ((`l`.`userId` = `u`.`userId`) and (`l`.`jobId` = `j`.`jobId`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `labourjobview2`
--

/*!50001 DROP VIEW IF EXISTS `labourjobview2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `labourjobview2` AS select `l`.`labourJobId` AS `labourJobId`,`u`.`userId` AS `userId`,`u`.`firstName` AS `firstName`,`u`.`lastName` AS `lastName`,`u`.`email` AS `email`,`u`.`phone` AS `phone`,`u`.`device` AS `device`,`u`.`type` AS `type`,`j`.`jobId` AS `jobId`,`j`.`job` AS `job`,`j`.`jobDetail` AS `jobDetail`,`j`.`basicRate` AS `basicRate`,`j`.`dARate` AS `dARate`,`l`.`jobDate` AS `jobDate`,`l`.`remark` AS `remark` from ((`labourjob` `l` join `job` `j`) join `user` `u`) where ((`l`.`userId` = `u`.`userId`) and (`l`.`jobId` = `j`.`jobId`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `laboursalaryview`
--

/*!50001 DROP VIEW IF EXISTS `laboursalaryview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `laboursalaryview` AS select `l`.`labourSalaryId` AS `labourSalaryId`,`u`.`userId` AS `userId`,`u`.`firstName` AS `firstName`,`u`.`lastName` AS `lastName`,`u`.`email` AS `email`,`u`.`phone` AS `phone`,`u`.`device` AS `device`,`u`.`type` AS `type`,`l`.`totalSalary` AS `totalSalary` from (`laboursalary` `l` join `user` `u`) where (`l`.`userId` = `u`.`userId`) */;
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

-- Dump completed on 2019-03-19 20:06:05
