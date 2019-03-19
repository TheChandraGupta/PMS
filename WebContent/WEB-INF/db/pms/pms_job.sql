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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-19 20:06:49
