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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-19 20:06:49
