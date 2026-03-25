-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: resume_generation
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Candidate`
--

DROP TABLE IF EXISTS `Candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Candidate` (
  `candidate_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `college_name` varchar(100) DEFAULT NULL,
  `CGPA` decimal(4,2) DEFAULT NULL,
  `year_of_study` int DEFAULT NULL,
  PRIMARY KEY (`candidate_id`),
  CONSTRAINT `Candidate_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Candidate`
--

LOCK TABLES `Candidate` WRITE;
/*!40000 ALTER TABLE `Candidate` DISABLE KEYS */;
INSERT INTO `Candidate` VALUES (1,'nitheesh','chalumuri.nitheesh@gmail.com','2005-11-11','9949846733','Indian Institute of Information Technology',8.34,2);
/*!40000 ALTER TABLE `Candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Certification`
--

DROP TABLE IF EXISTS `Certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Certification` (
  `certification_id` int NOT NULL AUTO_INCREMENT,
  `candidate_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `issuer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`certification_id`),
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `Certification_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `Candidate` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Certification`
--

LOCK TABLES `Certification` WRITE;
/*!40000 ALTER TABLE `Certification` DISABLE KEYS */;
INSERT INTO `Certification` VALUES (1,1,'Think india North-East summit 2025','think india'),(2,1,'mongo db completion','mongodb.org');
/*!40000 ALTER TABLE `Certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Course` (
  `candidate_id` int DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `Candidate` (`candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (1,'octave'),(1,'microcontroller and microprocessor');
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Experience`
--

DROP TABLE IF EXISTS `Experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Experience` (
  `exp_id` int NOT NULL AUTO_INCREMENT,
  `candidate_id` int DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`exp_id`),
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `Experience_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `Candidate` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Experience`
--

LOCK TABLES `Experience` WRITE;
/*!40000 ALTER TABLE `Experience` DISABLE KEYS */;
INSERT INTO `Experience` VALUES (1,1,'intrainz','webdeveloper','1month','I did an internship in intrainz solutions learning web development under a mentor'),(2,1,'google','SDE','2 years','i worked at google for 2 years');
/*!40000 ALTER TABLE `Experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hobby`
--

DROP TABLE IF EXISTS `Hobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hobby` (
  `candidate_id` int DEFAULT NULL,
  `hobby` varchar(100) DEFAULT NULL,
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `Hobby_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `Candidate` (`candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hobby`
--

LOCK TABLES `Hobby` WRITE;
/*!40000 ALTER TABLE `Hobby` DISABLE KEYS */;
INSERT INTO `Hobby` VALUES (1,'music'),(1,'anime');
/*!40000 ALTER TABLE `Hobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Language`
--

DROP TABLE IF EXISTS `Language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Language` (
  `candidate_id` int DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `Language_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `Candidate` (`candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Language`
--

LOCK TABLES `Language` WRITE;
/*!40000 ALTER TABLE `Language` DISABLE KEYS */;
INSERT INTO `Language` VALUES (1,'english'),(1,'hindi'),(1,'telugu');
/*!40000 ALTER TABLE `Language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `candidate_id` int DEFAULT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`project_id`),
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `Project_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `Candidate` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES (1,1,'Face recognition','face recognition attendance system with openCV (an python library)'),(2,1,'Whatsapp Clone','cloned whatsapp to get better understanding of websockets');
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Skill`
--

DROP TABLE IF EXISTS `Skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Skill` (
  `skill_id` int NOT NULL AUTO_INCREMENT,
  `candidate_id` int DEFAULT NULL,
  `skill_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`skill_id`),
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `Skill_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `Candidate` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Skill`
--

LOCK TABLES `Skill` WRITE;
/*!40000 ALTER TABLE `Skill` DISABLE KEYS */;
INSERT INTO `Skill` VALUES (1,1,'Express'),(2,1,'React'),(3,1,'Mongo Db'),(4,1,'PHP'),(5,1,'Node JS'),(6,1,'Python');
/*!40000 ALTER TABLE `Skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Strength`
--

DROP TABLE IF EXISTS `Strength`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Strength` (
  `candidate_id` int DEFAULT NULL,
  `strength` varchar(100) DEFAULT NULL,
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `Strength_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `Candidate` (`candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Strength`
--

LOCK TABLES `Strength` WRITE;
/*!40000 ALTER TABLE `Strength` DISABLE KEYS */;
INSERT INTO `Strength` VALUES (1,'communication skills');
/*!40000 ALTER TABLE `Strength` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TechStack`
--

DROP TABLE IF EXISTS `TechStack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TechStack` (
  `project_id` int DEFAULT NULL,
  `tech_name` varchar(100) DEFAULT NULL,
  KEY `project_id` (`project_id`),
  CONSTRAINT `TechStack_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `Project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TechStack`
--

LOCK TABLES `TechStack` WRITE;
/*!40000 ALTER TABLE `TechStack` DISABLE KEYS */;
INSERT INTO `TechStack` VALUES (1,'python'),(1,'openCV'),(2,'MERN stack'),(2,'socket.io');
/*!40000 ALTER TABLE `TechStack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('Candidate','Admin') DEFAULT 'Candidate',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'nitheesh','$2y$10$6CCvI7blgiRIn5BiCwkgpugokxtLAwSmKlsEyspT3tHUXIcMJjz9.','Candidate');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-15 21:45:51
