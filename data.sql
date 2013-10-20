-- MySQL dump 10.13  Distrib 5.5.31, for Linux (i686)
--
-- Host: localhost    Database: standard_labihua
-- ------------------------------------------------------
-- Server version	5.5.31-log

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
-- Table structure for table `a_timeline`
--

DROP TABLE IF EXISTS `a_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_bucket` varchar(100) DEFAULT NULL,
  `section` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_timeline`
--

LOCK TABLES `a_timeline` WRITE;
/*!40000 ALTER TABLE `a_timeline` DISABLE KEYS */;
INSERT INTO `a_timeline` VALUES (1,'备孕阶段',NULL),(2,'孕1周',2),(3,'孕2周',2),(4,'孕3周',2),(5,'孕4周',2),(6,'孕5周',2),(7,'孕6周',2),(8,'孕7周',2),(9,'孕8周',2),(10,'孕9周',2),(11,'孕10周',2),(12,'孕11周',2),(13,'孕12周',2),(14,'孕13周',2),(15,'孕14周',2),(16,'孕15周',3),(17,'孕16周',3),(18,'孕17周',3),(19,'孕18周',3),(20,'孕19周',3),(21,'孕20周',3),(22,'孕21周',3),(23,'孕22周',3),(24,'孕23周',3),(25,'孕24周',3),(26,'孕25周',3),(27,'孕26周',3),(28,'孕27周',3),(29,'孕28周',3),(30,'孕29周',3),(31,'孕30周',3),(32,'孕31周',4),(33,'孕32周',4),(34,'孕33周',4),(35,'孕34周',4),(36,'孕35周',4),(37,'孕36周',4),(38,'孕37周',4),(39,'孕38周',4),(40,'孕39周',4),(41,'孕40周',4),(42,'1个月',5),(43,'2个月',5),(44,'3个月',5),(45,'4个月',5),(46,'5个月',5),(47,'6个月',5),(48,'7个月',5),(49,'8个月',5),(50,'9个月',5),(51,'10个月',5),(52,'11个月',5),(53,'12个月',5),(54,'1岁',6),(55,'2岁',6),(56,'3岁',6);
/*!40000 ALTER TABLE `a_timeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_section`
--

DROP TABLE IF EXISTS `a_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_section`
--

LOCK TABLES `a_section` WRITE;
/*!40000 ALTER TABLE `a_section` DISABLE KEYS */;
INSERT INTO `a_section` VALUES (1,'备孕期'),(2,'孕前期'),(3,'孕中期'),(4,'孕后期'),(5,'0至1岁'),(6,'1至3岁');
/*!40000 ALTER TABLE `a_section` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-20 16:31:02
