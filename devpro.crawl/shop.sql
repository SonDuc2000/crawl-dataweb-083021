-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: shop14
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_internal_idx` (`parent_id`),
  CONSTRAINT `fk_internal` FOREIGN KEY (`parent_id`) REFERENCES `tbl_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa danh mục sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (21,'văn phòng','van phong',NULL,NULL,NULL,NULL,NULL,1,''),(22,'nội thất','noi that',NULL,NULL,NULL,NULL,NULL,1,''),(23,'Spring Framework','Spring Framework',NULL,NULL,NULL,NULL,21,1,NULL),(24,'Spring MVC','Spring MVC',NULL,NULL,NULL,NULL,23,1,NULL);
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `request_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin liên hệ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contact`
--

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;
INSERT INTO `tbl_contact` VALUES (3,'Son',NULL,'kuborakid@gmail.com','dasda','dấdsad',NULL,NULL,NULL,NULL,1),(4,'Son',NULL,'kuborakid@gmail.com','dasda','vf',NULL,NULL,NULL,NULL,1),(5,'Son',NULL,'kuborakid@gmail.com','dasda','ịo',NULL,NULL,NULL,NULL,1),(6,'Son',NULL,'kuborakid@gmail.com','dasda','sdad',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `price_sale` decimal(13,2) DEFAULT NULL,
  `short_description` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_category_products_idx` (`category_id`),
  CONSTRAINT `fk_category_products` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb3 COMMENT='Bảng dữ liệu chứa danh mục sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products`
--

LOCK TABLES `tbl_products` WRITE;
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` VALUES (114,'VĂN PHÒNG MONKEY JUNIOR',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/photo26-10-202023575410.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(115,'VĂN PHONG BABILALA',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/enscape-2021-06-01-17-54-56.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(116,'VĂN PHÒNG EDUPIA',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/sanh-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(117,'Văn Phòng Kim Liên Travel',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/0b7807d37350890ed041.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(118,'Văn Phòng Phương Nam Travel',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ok-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(119,'Văn Phòng Monkey Junior',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/c94d21724d83b7ddee92-1-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(120,'Rocket Studio',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/3dnoithatvanphongrocket20201bak.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(121,'Ekgis Office',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/noithatvanphongekgis45-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(122,'Vcoating Office',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/1111.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(123,'Base Enterprise',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/thietkevanphongbase1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(124,'Deli Office',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/deli7-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(125,'Hoàng Gia',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/mbhoanggia.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(126,'SCHENKER',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/chinhanhdemos1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(127,'HBI Hưng Yên',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/hbidemo.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(128,'Shinhan Life Office',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/shinhan-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(129,'Onesoft Office 2018',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/z1397009888360-f3001b80c16b2f48a30721a0f8313f22-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(130,'Văn Phòng Phương Nam Travel',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ok-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(131,'Rocket Studio',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/3dnoithatvanphongrocket20201bak.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(132,'Vcoating Office',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/1111.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(133,'Hoàng Gia',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/mbhoanggia.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(134,'Lang Nguyên Lotter',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/matbanglangnguyen1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(135,'ORION VINA',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/matbangorion.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(136,'MFC Duy Tân',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/demologo.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(137,'Charlie One',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/chinhanhdemoc1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(138,'P69',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/chinhanhdemop69.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(139,'HBI Hưng Yên',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/hbidemo.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(140,'Shinhan Life Office',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/shinhan-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(141,'Onesoft Office 2018',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/z1397009888360-f3001b80c16b2f48a30721a0f8313f22-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(142,'Văn Phòng Global Sign',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/pck-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(143,'Văn phòng Zinza',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/zinzachuan02.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(144,'Shimada Shoji',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/shimada-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(145,'Mediaz 2017',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/anhdaidienmediaz.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(146,'VĂN PHÒNG MONKEY JUNIOR',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/photo26-10-202023575410.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(147,'VĂN PHONG BABILALA',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/enscape-2021-06-01-17-54-56.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(148,'VĂN PHÒNG EDUPIA',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/sanh-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(149,'Văn Phòng Kim Liên Travel',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/0b7807d37350890ed041.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(150,'Văn Phòng Monkey Junior',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/c94d21724d83b7ddee92-1-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(151,'Rocket Studio',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/3dnoithatvanphongrocket20201bak.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(152,'Ekgis Office',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/noithatvanphongekgis45-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(153,'Tripi',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/chinhanhdemotripi1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(154,'SCHENKER',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/chinhanhdemos1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(155,'Onesoft Office 2019',1000.00,NULL,' màu sáng tự nhiên của gỗ sồi veneer, lớp phủ MDF và thiết kế trẻ trung, giản đơn','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/thietkevanphongctyonesoft-rocket-1.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0),(156,'tủ file thấp',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/tu-file-6-.png',22,NULL,NULL,NULL,NULL,1,NULL,0),(157,'HCB 08.04.2000',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/tu-file-1-.png',22,NULL,NULL,NULL,NULL,1,NULL,0),(158,'tu file cao 02',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/tu-file-2-.png',22,NULL,NULL,NULL,NULL,1,NULL,0),(159,'HCB - 03',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/tu-file-3-.png',22,NULL,NULL,NULL,NULL,1,NULL,0),(160,'Ghế Note-D 02',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ghenote-d02.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0),(161,'Ghế Control-T 02',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ghecontrol-t02.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0),(162,'Ghế Control-T 03',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ghecontrol-t03.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0),(163,'Ghế Control-T 04',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ghecontrol-t04.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0),(164,'Ghế Control-D 01',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ghecontrol-d01.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0),(165,'Ghế Control-D 02',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ghecontrol-d02.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0),(166,'Ghế Control-D 03',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ghecontrol-d03.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0),(167,'Ghế Control-D 04',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ghecontrol-d04.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0),(168,'Ghế Joey',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ghejoey2.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0),(169,'Ghế JOSE',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ghejose.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0),(170,'Ghế Kute 01',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/image.png',22,NULL,NULL,NULL,NULL,1,NULL,0),(171,'Ghế Kute 02',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/kute02.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0),(172,'Ghế Kute 03',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/kute03.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0),(173,'Ghế Wing',3000.00,NULL,'Mã sản phẩm: VDD 123','Gỗ Oak - MDF veneer Oak - Inox 304','https://viendong.com.vn/Upload/root/ghewing.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0);
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products_images`
--

DROP TABLE IF EXISTS `tbl_products_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `product_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_product_images_idx` (`product_id`),
  CONSTRAINT `fk_product_images` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu danh sách ảnh sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products_images`
--

LOCK TABLES `tbl_products_images` WRITE;
/*!40000 ALTER TABLE `tbl_products_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_products_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_roles`
--

LOCK TABLES `tbl_roles` WRITE;
/*!40000 ALTER TABLE `tbl_roles` DISABLE KEYS */;
INSERT INTO `tbl_roles` VALUES (11,'ADMIN','ADMIN',NULL,NULL,NULL,NULL,1),(12,'GUEST','GUEST',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder`
--

DROP TABLE IF EXISTS `tbl_saleorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `customer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `seo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cutomer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa phiếu mua hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder`
--

LOCK TABLES `tbl_saleorder` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder` DISABLE KEYS */;
INSERT INTO `tbl_saleorder` VALUES (21,'1629981843572',NULL,NULL,NULL,NULL,NULL,NULL,1,'Nguyen Duc Son','Hà Nội',NULL,NULL,'kuborakid@gmail.com'),(22,'1630073006514',NULL,NULL,NULL,NULL,NULL,NULL,1,'Nguyen Duc Son','Hà Nội',NULL,NULL,'kuborakid@gmail.com'),(23,'1630154454747',NULL,NULL,NULL,NULL,NULL,NULL,1,'Nguyen Duc Cuong','Hà Nội',NULL,NULL,'kuborakid@gmail.com'),(24,'1630169336188',NULL,NULL,NULL,NULL,NULL,NULL,1,'Nguyen Duc Cuong','TP.Hồ Chí Minh',NULL,NULL,'kuborakid@gmail.com'),(25,'1630169744517',NULL,NULL,NULL,NULL,NULL,NULL,1,'Nguyen Duc Son','TP.Hồ Chí Minh',NULL,NULL,'kuborakid@gmail.com'),(26,'1630169906143',NULL,NULL,NULL,NULL,NULL,NULL,1,'Nguyen Duc Son','Hải Phòng',NULL,NULL,'kuborakid@gmail.com'),(27,'1630170537363',NULL,NULL,NULL,NULL,NULL,NULL,1,'Nguyen Duc Cuong','Hải Phòng',NULL,NULL,'kuborakid@gmail.com'),(28,'1630171254239',NULL,NULL,NULL,NULL,NULL,NULL,1,'Nguyen Duc Cuong','Hải Phòng',NULL,NULL,'kuborakid@gmail.com'),(29,'1630317205667',NULL,NULL,NULL,NULL,NULL,NULL,1,'Nguyen Duc Son','TP.Hồ Chí Minh',NULL,NULL,'kuborakid@gmail.com');
/*!40000 ALTER TABLE `tbl_saleorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder_products`
--

DROP TABLE IF EXISTS `tbl_saleorder_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleorder_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quality` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_saleorder_products_idx` (`saleorder_id`),
  CONSTRAINT `fk_saleorder_products` FOREIGN KEY (`saleorder_id`) REFERENCES `tbl_saleorder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa phiếu mua hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder_products`
--

LOCK TABLES `tbl_saleorder_products` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder_products` DISABLE KEYS */;
INSERT INTO `tbl_saleorder_products` VALUES (29,21,115,1,NULL,NULL,NULL,NULL,1),(30,22,116,1,NULL,NULL,NULL,NULL,1),(31,22,125,2,NULL,NULL,NULL,NULL,1),(32,22,118,4,NULL,NULL,NULL,NULL,1),(33,23,172,3,NULL,NULL,NULL,NULL,1),(34,23,115,2,NULL,NULL,NULL,NULL,1),(35,23,159,2,NULL,NULL,NULL,NULL,1),(36,24,154,1,NULL,NULL,NULL,NULL,1),(37,24,115,1,NULL,NULL,NULL,NULL,1),(38,25,164,1,NULL,NULL,NULL,NULL,1),(39,26,123,3,NULL,NULL,NULL,NULL,1),(40,27,118,1,NULL,NULL,NULL,NULL,1),(41,28,156,1,NULL,NULL,NULL,NULL,1),(42,29,119,4,NULL,NULL,NULL,NULL,1),(43,29,115,3,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_saleorder_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_info`
--

DROP TABLE IF EXISTS `tbl_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) NOT NULL,
  `user_address` varchar(45) DEFAULT NULL,
  `user_phone` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_info_user_idx` (`user_id`),
  CONSTRAINT `fk_info_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_info`
--

LOCK TABLES `tbl_user_info` WRITE;
/*!40000 ALTER TABLE `tbl_user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (11,'admin','$2a$04$VfMI75Jcf5S/vx2ENFwUu.SjP.EbPjIJhScGMxKsTKTIlrEF9D.e6','admin@example.com',NULL,NULL,NULL,NULL,1),(12,'guest','$2a$04$VfMI75Jcf5S/vx2ENFwUu.SjP.EbPjIJhScGMxKsTKTIlrEF9D.e6','guest@example.com',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users_roles`
--

DROP TABLE IF EXISTS `tbl_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_roles_idx` (`role_id`),
  CONSTRAINT `fk_roles` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id`),
  CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='bảng trung gian thể hiện quan hệ n-n của users và roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users_roles`
--

LOCK TABLES `tbl_users_roles` WRITE;
/*!40000 ALTER TABLE `tbl_users_roles` DISABLE KEYS */;
INSERT INTO `tbl_users_roles` VALUES (11,11),(12,12);
/*!40000 ALTER TABLE `tbl_users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-05 12:48:17
