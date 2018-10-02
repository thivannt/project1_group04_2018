-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: doan1
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `idAccount` varchar(30) NOT NULL,
  `passWord` varchar(20) NOT NULL,
  `nameAccount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`idAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_has_exam`
--

DROP TABLE IF EXISTS `account_has_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_has_exam` (
  `account_idAccount` varchar(30) NOT NULL,
  `exam_idExam` int(11) NOT NULL,
  `result` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_idAccount`,`exam_idExam`),
  KEY `fk_account_has_exam_exam1_idx` (`exam_idExam`),
  KEY `fk_account_has_exam_account1_idx` (`account_idAccount`),
  CONSTRAINT `fk_account_has_exam_account1` FOREIGN KEY (`account_idAccount`) REFERENCES `account` (`idaccount`),
  CONSTRAINT `fk_account_has_exam_exam1` FOREIGN KEY (`exam_idExam`) REFERENCES `exam` (`idexam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_has_exam`
--

LOCK TABLES `account_has_exam` WRITE;
/*!40000 ALTER TABLE `account_has_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_has_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exam` (
  `idExam` int(11) NOT NULL,
  `nameExam` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `subject_idSubject` int(11) NOT NULL,
  PRIMARY KEY (`idExam`),
  KEY `fk_exam_subject1_idx` (`subject_idSubject`),
  CONSTRAINT `fk_exam_subject1` FOREIGN KEY (`subject_idSubject`) REFERENCES `subject` (`idsubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_has_quiz`
--

DROP TABLE IF EXISTS `exam_has_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exam_has_quiz` (
  `exam_idExam` int(11) NOT NULL,
  `quiz_idQuiz` int(11) NOT NULL,
  PRIMARY KEY (`exam_idExam`,`quiz_idQuiz`),
  KEY `fk_exam_has_quiz_quiz1_idx` (`quiz_idQuiz`),
  KEY `fk_exam_has_quiz_exam1_idx` (`exam_idExam`),
  CONSTRAINT `fk_exam_has_quiz_exam1` FOREIGN KEY (`exam_idExam`) REFERENCES `exam` (`idexam`),
  CONSTRAINT `fk_exam_has_quiz_quiz1` FOREIGN KEY (`quiz_idQuiz`) REFERENCES `quiz` (`idquiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_has_quiz`
--

LOCK TABLES `exam_has_quiz` WRITE;
/*!40000 ALTER TABLE `exam_has_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_has_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `quiz` (
  `idQuiz` int(11) NOT NULL,
  `quiz` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answ1` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answ2` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answ3` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answ4` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correctAnsw` varchar(5) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `subject_idSubject` int(11) NOT NULL,
  PRIMARY KEY (`idQuiz`),
  KEY `fk_quiz_subject1_idx` (`subject_idSubject`),
  CONSTRAINT `fk_quiz_subject1` FOREIGN KEY (`subject_idSubject`) REFERENCES `subject` (`idsubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subject` (
  `idSubject` int(11) NOT NULL,
  `nameSubject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`idSubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_has_account`
--

DROP TABLE IF EXISTS `subject_has_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subject_has_account` (
  `subject_idSubject` int(11) NOT NULL,
  `account_idAccount` varchar(30) NOT NULL,
  PRIMARY KEY (`subject_idSubject`,`account_idAccount`),
  KEY `fk_subject_has_account_account1_idx` (`account_idAccount`),
  KEY `fk_subject_has_account_subject1_idx` (`subject_idSubject`),
  CONSTRAINT `fk_subject_has_account_account1` FOREIGN KEY (`account_idAccount`) REFERENCES `account` (`idaccount`),
  CONSTRAINT `fk_subject_has_account_subject1` FOREIGN KEY (`subject_idSubject`) REFERENCES `subject` (`idsubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_has_account`
--

LOCK TABLES `subject_has_account` WRITE;
/*!40000 ALTER TABLE `subject_has_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_has_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-30 22:08:52
