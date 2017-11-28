-- MySQL dump 10.13  Distrib 5.7.13, for osx10.11 (x86_64)
--
-- Host: localhost    Database: hrms_db
-- ------------------------------------------------------
-- Server version	5.7.13

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
-- Table structure for table `admin_tb`
--

DROP TABLE IF EXISTS `admin_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_tb` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role_name` varchar(20) NOT NULL DEFAULT 'normaladmin',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_tb`
--

LOCK TABLES `admin_tb` WRITE;
/*!40000 ALTER TABLE `admin_tb` DISABLE KEYS */;
INSERT INTO `admin_tb` VALUES (1,'superadmin','123456','superadmin'),(2,'admin1','123456','normaladmin');
/*!40000 ALTER TABLE `admin_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_tb`
--

DROP TABLE IF EXISTS `dept_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept_tb` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) NOT NULL,
  `dept_description` varchar(200) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_tb`
--

LOCK TABLES `dept_tb` WRITE;
/*!40000 ALTER TABLE `dept_tb` DISABLE KEYS */;
INSERT INTO `dept_tb` VALUES (1,'course','make courses'),(2,'development','Software development');
/*!40000 ALTER TABLE `dept_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_tb`
--

DROP TABLE IF EXISTS `employee_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_tb` (
  `emp_id` varchar(20) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `education` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `dept_id` int(11) NOT NULL,
  `pos_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `dept_id` (`dept_id`),
  KEY `pos_id` (`pos_id`),
  CONSTRAINT `employee_tb_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept_tb` (`dept_id`),
  CONSTRAINT `employee_tb_ibfk_2` FOREIGN KEY (`pos_id`) REFERENCES `position_tb` (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tb`
--

LOCK TABLES `employee_tb` WRITE;
/*!40000 ALTER TABLE `employee_tb` DISABLE KEYS */;
INSERT INTO `employee_tb` VALUES ('10001','Tom','male','18211234567','524123456@qq.com','chengdu','Bachelor','1990-04-30',1,1),('10002','Jack','male','18211234568','524123457@qq.com','chongqing','Master','1986-09-02',1,1),('10011','Rose','female','18211234580','524198757@qq.com','chengdu','Bachelor','1991-11-21',2,2),('10012','Anny','female','18211237580','594168757@qq.com','chengdu','Master','1987-05-11',2,2);
/*!40000 ALTER TABLE `employee_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_tb`
--

DROP TABLE IF EXISTS `position_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_tb` (
  `pos_id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(50) NOT NULL,
  `pos_description` varchar(200) NOT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_tb`
--

LOCK TABLES `position_tb` WRITE;
/*!40000 ALTER TABLE `position_tb` DISABLE KEYS */;
INSERT INTO `position_tb` VALUES (1,'Java course staff','make Java courses'),(2,'front-end engineers','responsible for front-end development');
/*!40000 ALTER TABLE `position_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tb`
--

DROP TABLE IF EXISTS `post_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tb` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `admin_id` int(11) NOT NULL,
  `create_date` date NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `post_tb_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin_tb` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tb`
--

LOCK TABLES `post_tb` WRITE;
/*!40000 ALTER TABLE `post_tb` DISABLE KEYS */;
INSERT INTO `post_tb` VALUES (1,'Leave notice','Please pay attention to holiday safety!',1,'2017-04-30');
/*!40000 ALTER TABLE `post_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-28 16:37:39
