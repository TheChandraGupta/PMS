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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-19 20:06:49
