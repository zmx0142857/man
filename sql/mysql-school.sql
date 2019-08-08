-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: School
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `School`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `School` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `School`;

--
-- Table structure for table `dbo.Course`
--

DROP TABLE IF EXISTS `dbo.Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.Course` (
  `CourseID` int(11) DEFAULT NULL,
  `Title` varchar(14) DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.Course`
--

LOCK TABLES `dbo.Course` WRITE;
/*!40000 ALTER TABLE `dbo.Course` DISABLE KEYS */;
INSERT INTO `dbo.Course` VALUES (1045,'Calculus',4,7),(1050,'Chemistry',4,1),(1061,'Physics',4,1),(2021,'Composition',3,2),(2030,'Poetry',2,2),(2042,'Literature',4,2),(3141,'Trigonometry',4,7),(4022,'Microeconomics',3,4),(4041,'Macroeconomics',3,4),(4061,'Quantitative',2,4);
/*!40000 ALTER TABLE `dbo.Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.CourseInstructor`
--

DROP TABLE IF EXISTS `dbo.CourseInstructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.CourseInstructor` (
  `CourseID` int(11) DEFAULT NULL,
  `PersonID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.CourseInstructor`
--

LOCK TABLES `dbo.CourseInstructor` WRITE;
/*!40000 ALTER TABLE `dbo.CourseInstructor` DISABLE KEYS */;
INSERT INTO `dbo.CourseInstructor` VALUES (1045,5),(1050,1),(1061,31),(2021,27),(2030,4),(2042,25),(4022,18),(4041,32),(4061,34);
/*!40000 ALTER TABLE `dbo.CourseInstructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.Department`
--

DROP TABLE IF EXISTS `dbo.Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.Department` (
  `DepartmentID` int(11) DEFAULT NULL,
  `Name` varchar(11) DEFAULT NULL,
  `Budget` decimal(10,4) DEFAULT NULL,
  `StartDate` varchar(19) DEFAULT NULL,
  `Administrator` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.Department`
--

LOCK TABLES `dbo.Department` WRITE;
/*!40000 ALTER TABLE `dbo.Department` DISABLE KEYS */;
INSERT INTO `dbo.Department` VALUES (1,'Engineering',350000.0000,'2007-09-01 00:00:00',2),(2,'English',120000.0000,'2007-09-01 00:00:00',6),(4,'Economics',200000.0000,'2007-09-01 00:00:00',4),(7,'Mathematics',250000.0000,'2007-09-01 00:00:00',3);
/*!40000 ALTER TABLE `dbo.Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.OfficeAssignment`
--

DROP TABLE IF EXISTS `dbo.OfficeAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.OfficeAssignment` (
  `InstructorID` int(11) DEFAULT NULL,
  `Location` varchar(12) DEFAULT NULL,
  `Timestamp` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.OfficeAssignment`
--

LOCK TABLES `dbo.OfficeAssignment` WRITE;
/*!40000 ALTER TABLE `dbo.OfficeAssignment` DISABLE KEYS */;
INSERT INTO `dbo.OfficeAssignment` VALUES (1,'17 Smith',''),(4,'29 Adams',''),(5,'37 Williams',''),(18,'143 Smith',''),(25,'57 Adams',''),(27,'271 Williams',''),(31,'131 Smith',''),(32,'203 Williams',''),(34,'213 Smith','');
/*!40000 ALTER TABLE `dbo.OfficeAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.OnlineCourse`
--

DROP TABLE IF EXISTS `dbo.OnlineCourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.OnlineCourse` (
  `CourseID` int(11) DEFAULT NULL,
  `URL` varchar(43) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.OnlineCourse`
--

LOCK TABLES `dbo.OnlineCourse` WRITE;
/*!40000 ALTER TABLE `dbo.OnlineCourse` DISABLE KEYS */;
INSERT INTO `dbo.OnlineCourse` VALUES (2021,'http://www.fineartschool.net/Composition'),(2030,'http://www.fineartschool.net/Poetry'),(3141,'http://www.fineartschool.net/Trigonometry'),(4041,'http://www.fineartschool.net/Macroeconomics');
/*!40000 ALTER TABLE `dbo.OnlineCourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.OnsiteCourse`
--

DROP TABLE IF EXISTS `dbo.OnsiteCourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.OnsiteCourse` (
  `CourseID` int(11) DEFAULT NULL,
  `Location` varchar(11) DEFAULT NULL,
  `Days` varchar(4) DEFAULT NULL,
  `Time` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.OnsiteCourse`
--

LOCK TABLES `dbo.OnsiteCourse` WRITE;
/*!40000 ALTER TABLE `dbo.OnsiteCourse` DISABLE KEYS */;
INSERT INTO `dbo.OnsiteCourse` VALUES (1045,'121 Smith','MWHF','1900-01-01 15:30:00'),(1050,'123 Smith','MTWH','1900-01-01 11:30:00'),(1061,'234 Smith','TWHF','1900-01-01 13:15:00'),(2042,'225 Adams','MTWH','1900-01-01 11:00:00'),(4022,'23 Williams','MWF','1900-01-01 09:00:00'),(4061,'22 Williams','TH','1900-01-01 11:15:00');
/*!40000 ALTER TABLE `dbo.OnsiteCourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.Person`
--

DROP TABLE IF EXISTS `dbo.Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.Person` (
  `PersonID` int(11) DEFAULT NULL,
  `LastName` varchar(11) DEFAULT NULL,
  `FirstName` varchar(9) DEFAULT NULL,
  `HireDate` varchar(19) DEFAULT NULL,
  `EnrollmentDate` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.Person`
--

LOCK TABLES `dbo.Person` WRITE;
/*!40000 ALTER TABLE `dbo.Person` DISABLE KEYS */;
INSERT INTO `dbo.Person` VALUES (1,'Abercrombie','Kim','1995-03-11 00:00:00',''),(2,'Barzdukas','Gytis','','2005-09-01 00:00:00'),(3,'Justice','Peggy','','2001-09-01 00:00:00'),(4,'Fakhouri','Fadi','2002-08-06 00:00:00',''),(5,'Harui','Roger','1998-07-01 00:00:00',''),(6,'Li','Yan','','2002-09-01 00:00:00'),(7,'Norman','Laura','','2003-09-01 00:00:00'),(8,'Olivotto','Nino','','2005-09-01 00:00:00'),(9,'Tang','Wayne','','2005-09-01 00:00:00'),(10,'Alonso','Meredith','','2002-09-01 00:00:00'),(11,'Lopez','Sophia','','2004-09-01 00:00:00'),(12,'Browning','Meredith','','2000-09-01 00:00:00'),(13,'Anand','Arturo','','2003-09-01 00:00:00'),(14,'Walker','Alexandra','','2000-09-01 00:00:00'),(15,'Powell','Carson','','2004-09-01 00:00:00'),(16,'Jai','Damien','','2001-09-01 00:00:00'),(17,'Carlson','Robyn','','2005-09-01 00:00:00'),(18,'Zheng','Roger','2004-02-12 00:00:00',''),(19,'Bryant','Carson','','2001-09-01 00:00:00'),(20,'Suarez','Robyn','','2004-09-01 00:00:00'),(21,'Holt','Roger','','2004-09-01 00:00:00'),(22,'Alexander','Carson','','2005-09-01 00:00:00'),(23,'Morgan','Isaiah','','2001-09-01 00:00:00'),(24,'Martin','Randall','','2005-09-01 00:00:00'),(25,'Kapoor','Candace','2001-01-15 00:00:00',''),(26,'Rogers','Cody','','2002-09-01 00:00:00'),(27,'Serrano','Stacy','1999-06-01 00:00:00',''),(28,'White','Anthony','','2001-09-01 00:00:00'),(29,'Griffin','Rachel','','2004-09-01 00:00:00'),(30,'Shan','Alicia','','2003-09-01 00:00:00'),(31,'Stewart','Jasmine','1997-10-12 00:00:00',''),(32,'Xu','Kristen','2001-07-23 00:00:00',''),(33,'Gao','Erica','','2003-01-30 00:00:00'),(34,'Van Houten','Roger','2000-12-07 00:00:00','');
/*!40000 ALTER TABLE `dbo.Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.StudentGrade`
--

DROP TABLE IF EXISTS `dbo.StudentGrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.StudentGrade` (
  `EnrollmentID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `Grade` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.StudentGrade`
--

LOCK TABLES `dbo.StudentGrade` WRITE;
/*!40000 ALTER TABLE `dbo.StudentGrade` DISABLE KEYS */;
INSERT INTO `dbo.StudentGrade` VALUES (1,2021,2,'4.00'),(2,2030,2,'3.50'),(3,2021,3,'3.00'),(4,2030,3,'4.00'),(5,2021,6,'2.50'),(6,2042,6,'3.50'),(7,2021,7,'3.50'),(8,2042,7,'4.00'),(9,2021,8,'3.00'),(10,2042,8,'3.00'),(11,4041,9,'3.50'),(12,4041,10,''),(13,4041,11,'2.50'),(14,4041,12,''),(15,4061,12,''),(16,4022,14,'3.00'),(17,4022,13,'4.00'),(18,4061,13,'4.00'),(19,4041,14,'3.00'),(20,4022,15,'2.50'),(21,4022,16,'2.00'),(22,4022,17,''),(23,4022,19,'3.50'),(24,4061,20,'4.00'),(25,4061,21,'2.00'),(26,4022,22,'3.00'),(27,4041,22,'3.50'),(28,4061,22,'2.50'),(29,4022,23,'3.00'),(30,1045,23,'1.50'),(31,1061,24,'4.00'),(32,1061,25,'3.00'),(33,1050,26,'3.50'),(34,1061,26,'3.00'),(35,1061,27,'3.00'),(36,1045,28,'2.50'),(37,1050,28,'3.50'),(38,1061,29,'4.00'),(39,1050,30,'3.50'),(40,1061,30,'4.00');
/*!40000 ALTER TABLE `dbo.StudentGrade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-08 22:53:50
