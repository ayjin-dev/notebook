-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: jing_dong
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Current Database: `jing_dong`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jing_dong` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `jing_dong`;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `cate_id` int unsigned NOT NULL,
  `brand_id` int unsigned NOT NULL,
  `price` decimal(10,3) NOT NULL DEFAULT '0.000',
  `is_show` bit(1) NOT NULL DEFAULT b'1',
  `is_saleoff` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `goods_cates` (`id`),
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `goods_brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'r510vc 15.6英寸笔记本',1,1,3399.000,_binary '',_binary '\0'),(2,'y400n 14.0英寸笔记本电脑',1,2,4999.000,_binary '',_binary '\0'),(3,'g150th 15.6英寸笔记本',2,3,8499.000,_binary '',_binary '\0'),(4,'x550cc 15.6英寸笔记本',1,1,2799.000,_binary '',_binary '\0'),(5,'x240 超级本',3,2,4880.000,_binary '',_binary '\0'),(6,'u330p 13.3英寸超级本',3,2,4299.000,_binary '',_binary '\0'),(7,'svp13226scb 触控超级本',3,4,7999.000,_binary '',_binary '\0'),(8,'ipad mini 7.9英寸平板电脑',4,5,1998.000,_binary '',_binary '\0'),(9,'ipad air 9.7英寸平板电脑',4,5,3388.000,_binary '',_binary '\0'),(10,'ipad mini 配备retina显示屏',4,5,2788.000,_binary '',_binary '\0'),(11,'ideacentre c340 20英寸一体电脑',5,2,3499.000,_binary '',_binary '\0'),(12,'vostro 3800-r1206 台式电脑',5,6,2899.000,_binary '',_binary '\0'),(13,'imac me086ch/a 21.5英寸一体电脑',5,5,9188.000,_binary '',_binary '\0'),(14,'at7-7414lp 台式电脑 linux',5,5,3699.000,_binary '',_binary '\0'),(15,'z220sff f4f06pa工作站',6,7,4288.000,_binary '',_binary '\0'),(16,'powereedge ii服务器',6,6,5388.000,_binary '',_binary '\0'),(17,'mac pro专业级台式电脑',6,5,28888.000,_binary '',_binary '\0'),(18,'hmz-t3w 头戴显示设备',7,4,6999.000,_binary '',_binary '\0'),(19,'商务双肩背包',7,4,99.000,_binary '',_binary '\0'),(20,'x3250 m4机架式服务器',6,8,6888.000,_binary '',_binary '\0'),(21,'商务双肩背包',7,4,99.000,_binary '',_binary '\0'),(23,'Lenovo Y7000 GTX1060',8,2,7099.000,_binary '',_binary '\0');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_brands`
--

DROP TABLE IF EXISTS `goods_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_brands`
--

LOCK TABLES `goods_brands` WRITE;
/*!40000 ALTER TABLE `goods_brands` DISABLE KEYS */;
INSERT INTO `goods_brands` VALUES (1,'华硕'),(2,'联想'),(3,'雷神'),(4,'索尼'),(5,'苹果'),(6,'戴尔'),(7,'惠普'),(8,'ibm');
/*!40000 ALTER TABLE `goods_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_cates`
--

DROP TABLE IF EXISTS `goods_cates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_cates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_cates`
--

LOCK TABLES `goods_cates` WRITE;
/*!40000 ALTER TABLE `goods_cates` DISABLE KEYS */;
INSERT INTO `goods_cates` VALUES (1,'笔记本'),(2,'游戏本'),(3,'超级本'),(4,'平板电脑'),(5,'台式机'),(6,'服务器/工作站'),(7,'笔记本配件'),(8,'极客本');
/*!40000 ALTER TABLE `goods_cates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-04 16:24:58
