-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)

--

-- Host: localhost    Database: shop

-- ------------------------------------------------------

-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */

;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */

;

/*!40101 SET NAMES utf8mb4 */

;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */

;

/*!40103 SET TIME_ZONE='+00:00' */

;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */

;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */

;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */

;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */

;

--

-- Table structure for table `order_details`

--

DROP TABLE IF EXISTS `order_details`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

use shop;

CREATE TABLE
    `order_details` (
        `order_det_id` varchar(100) NOT NULL,
        `order_id` int(11) NOT NULL,
        `product_id` int(11) NOT NULL,
        `quantity` int(11) NOT NULL,
        PRIMARY KEY (`order_det_id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `order_details`

--

LOCK TABLES `order_details` WRITE;

/*!40000 ALTER TABLE `order_details` DISABLE KEYS */

;

/*!40000 ALTER TABLE `order_details` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `orders`

--

DROP TABLE IF EXISTS `orders`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `orders` (
        `order_id` int(11) NOT NULL,
        `user_id` varchar(100) DEFAULT NULL,
        `total` int(11) NOT NULL,
        `created_date` date NOT NULL,
        PRIMARY KEY (`order_id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `orders`

--

LOCK TABLES `orders` WRITE;

/*!40000 ALTER TABLE `orders` DISABLE KEYS */

;

/*!40000 ALTER TABLE `orders` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `product`

--

DROP TABLE IF EXISTS `product`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `product` (
        `product_id` int(11) NOT NULL,
        `product_name` varchar(100) NOT NULL,
        `price` int(11) NOT NULL,
        `stock` int(11) NOT NULL DEFAULT 0,
        `pro_desc` text NOT NULL,
        `category_id` varchar(100) NOT NULL,
        `img_id` int(11) NOT NULL,
        PRIMARY KEY (`product_id`),
        KEY `img_id` (`img_id`),
        CONSTRAINT `product_ibfk_1` FOREIGN KEY (`img_id`) REFERENCES `product_img` (`img_id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `product`

--

LOCK TABLES `product` WRITE;

/*!40000 ALTER TABLE `product` DISABLE KEYS */

;

/*!40000 ALTER TABLE `product` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `product_img`

--

DROP TABLE IF EXISTS `product_img`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `product_img` (
        `img_id` int(11) NOT NULL,
        `product_id` int(11) NOT NULL,
        `cover_img` varchar(500) NOT NULL,
        `thumb_img` varchar(500) NOT NULL,
        PRIMARY KEY (`img_id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `product_img`

--

LOCK TABLES `product_img` WRITE;

/*!40000 ALTER TABLE `product_img` DISABLE KEYS */

;

/*!40000 ALTER TABLE `product_img` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `user`

--

DROP TABLE IF EXISTS `user`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `user` (
        `user_id` varchar(100) NOT NULL,
        `user_name` varchar(50) NOT NULL,
        `first_name` varchar(50) NOT NULL,
        `last_name` varchar(50) NOT NULL,
        `user_pass` varchar(80) NOT NULL,
        `gender` enum('M', 'F') NOT NULL,
        `address` text NOT NULL,
        `birth_date` date NOT NULL,
        `user_img` varchar(500) NOT NULL,
        `is_admin` tinyint(1) NOT NULL,
        PRIMARY KEY (`user_id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `user`

--

LOCK TABLES `user` WRITE;

/*!40000 ALTER TABLE `user` DISABLE KEYS */

;

INSERT INTO `user`
VALUES (
        '1',
        'bataa',
        'boldoo',
        'bataa',
        '1234Abc',
        'M',
        'bzd 15-khoroo',
        '2000-01-01',
        'dasddsa',
        0
    ), (
        '2',
        'bataa',
        'boldoo',
        'bataa',
        '1234Abc',
        'M',
        'bzd 15-khoroo',
        '1999-12-31',
        'dasddsa',
        0
    );

/*!40000 ALTER TABLE `user` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `user_fav`

--

DROP TABLE IF EXISTS `user_fav`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `user_fav` (
        `user_fav_id` varchar(100) NOT NULL,
        `user_id` varchar(100) NOT NULL,
        `product_id` int(11) NOT NULL,
        PRIMARY KEY (`user_fav_id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `user_fav`

--

LOCK TABLES `user_fav` WRITE;

/*!40000 ALTER TABLE `user_fav` DISABLE KEYS */

;

/*!40000 ALTER TABLE `user_fav` ENABLE KEYS */

;

UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */

;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */

;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */

;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */

;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */

;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */

;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */

;

-- Dump completed on 2023-03-10  9:32:14