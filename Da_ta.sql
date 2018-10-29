-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlydethi
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
-- Table structure for table `cauhoi`
--

DROP TABLE IF EXISTS `cauhoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cauhoi` (
  `MaCauHoi` int(11) NOT NULL AUTO_INCREMENT,
  `NoiDung` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DapAn1` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DapAn2` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DapAn3` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DapAn4` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DapAnDung` char(1) DEFAULT NULL,
  `MaMH` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaCauHoi`),
  KEY `MaMH_idx` (`MaMH`),
  CONSTRAINT `MaMH` FOREIGN KEY (`MaMH`) REFERENCES `monhoc` (`mamh`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cauhoi`
--

LOCK TABLES `cauhoi` WRITE;
/*!40000 ALTER TABLE `cauhoi` DISABLE KEYS */;
INSERT INTO `cauhoi` VALUES (1,'Thiết bị nào sau đây dùng để kết nối mạng','Switch','Hub','Router','CPU','C',1,1),(2,'Con mèo có mấy chân','1','2','3','4','D',2,1),(3,'Con gà có mấy chân','1','2','3','4','B',3,1),(4,'Con bò có mấy chân','1','2','3','4','D',2,1),(5,'Con heo có mấy chân','4','3','2','1','A',1,1);
/*!40000 ALTER TABLE `cauhoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ketqua`
--

DROP TABLE IF EXISTS `ketqua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ketqua` (
  `MaKQ` int(11) NOT NULL AUTO_INCREMENT,
  `TenTK` varchar(45) DEFAULT NULL,
  `Diem` varchar(45) DEFAULT NULL,
  `MaKyThi` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaKQ`),
  KEY `TenTK_idx` (`TenTK`),
  KEY `MaKyThi_idx` (`MaKyThi`),
  CONSTRAINT `MaKyThi` FOREIGN KEY (`MaKyThi`) REFERENCES `kythi` (`makythi`),
  CONSTRAINT `TenTK` FOREIGN KEY (`TenTK`) REFERENCES `taikhoan` (`tentk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ketqua`
--

LOCK TABLES `ketqua` WRITE;
/*!40000 ALTER TABLE `ketqua` DISABLE KEYS */;
INSERT INTO `ketqua` VALUES (1,'luan','8',1,1),(2,'luan','7',2,1),(3,'luan','6',3,1);
/*!40000 ALTER TABLE `ketqua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kythi`
--

DROP TABLE IF EXISTS `kythi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kythi` (
  `MaKyThi` int(11) NOT NULL AUTO_INCREMENT,
  `TenKyThi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MaMH` int(11) DEFAULT NULL,
  `ThoiGian` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaKyThi`),
  KEY `FK_KyThi_MH_idx` (`MaMH`),
  CONSTRAINT `FK_KyThi_MH` FOREIGN KEY (`MaMH`) REFERENCES `monhoc` (`mamh`)
) ENGINE=InnoDB AUTO_INCREMENT=6971 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kythi`
--

LOCK TABLES `kythi` WRITE;
/*!40000 ALTER TABLE `kythi` DISABLE KEYS */;
INSERT INTO `kythi` VALUES (1,'Giua ky lan 1',1,45,1),(2,'Giữa kì lần 2',1,45,1),(3,'Cuối kì',1,90,1),(6969,'CC',1,90,1),(6970,'Toán',1,180,1);
/*!40000 ALTER TABLE `kythi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kythi_cauhoi`
--

DROP TABLE IF EXISTS `kythi_cauhoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kythi_cauhoi` (
  `Ma_KT` int(11) NOT NULL,
  `Ma_CH` int(11) NOT NULL,
  PRIMARY KEY (`Ma_KT`,`Ma_CH`),
  KEY `FK_KT_idx` (`Ma_KT`),
  KEY `FK_CH_idx` (`Ma_CH`),
  CONSTRAINT `FK_CH` FOREIGN KEY (`Ma_CH`) REFERENCES `cauhoi` (`macauhoi`),
  CONSTRAINT `FK_KT` FOREIGN KEY (`Ma_KT`) REFERENCES `kythi` (`makythi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kythi_cauhoi`
--

LOCK TABLES `kythi_cauhoi` WRITE;
/*!40000 ALTER TABLE `kythi_cauhoi` DISABLE KEYS */;
INSERT INTO `kythi_cauhoi` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `kythi_cauhoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `monhoc` (
  `MaMH` int(11) NOT NULL AUTO_INCREMENT,
  `TenMH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaMH`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc`
--

LOCK TABLES `monhoc` WRITE;
/*!40000 ALTER TABLE `monhoc` DISABLE KEYS */;
INSERT INTO `monhoc` VALUES (1,'Mạng máy tính',1),(2,'Kiến trúc máy tính ',1),(3,'Hệ điều hành',1);
/*!40000 ALTER TABLE `monhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `taikhoan` (
  `TenTK` varchar(100) NOT NULL,
  `MatKhau` varchar(100) DEFAULT NULL,
  `HoTen` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`TenTK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` VALUES ('daica','123','Tuấn',1,1),('hoa','123','Nguyễn Thái Hòa',1,1),('hung','123','Hùng ',2,1),('long','123','Ngọc Lan',2,1),('luan','123','Trương Minh Luân',2,1),('quang','12345','Trần Huy Phong',3,1),('teo','123','Tèo đz',2,1),('thu','1','Ngọc Anh',3,1),('thuy','123','Thu Thủy',3,1),('van','123','Thúy Vân',3,1);
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-29 23:56:55
