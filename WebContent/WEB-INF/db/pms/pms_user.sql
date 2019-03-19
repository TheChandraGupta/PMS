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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-19 20:06:49
