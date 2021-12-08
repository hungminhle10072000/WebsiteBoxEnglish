-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: dbboxenglish
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
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_practice` date NOT NULL,
  `isDelete` int NOT NULL,
  `user_id` bigint NOT NULL,
  `vocabulary_id` bigint NOT NULL,
  `level` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc634j2fciat0gow1yl0j9u35r` (`user_id`),
  KEY `FK45h7bffc149vrbedslrj5ss1h` (`vocabulary_id`),
  CONSTRAINT `FK45h7bffc149vrbedslrj5ss1h` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`),
  CONSTRAINT `FKc634j2fciat0gow1yl0j9u35r` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (5,'2021-11-08',0,1,162,1,2),(6,'2021-12-08',0,1,163,1,2),(7,'2021-12-08',0,1,165,1,0),(8,'2021-12-08',0,1,167,1,2),(9,'2021-12-08',0,1,168,1,2),(10,'2021-12-08',0,1,169,1,2),(11,'2021-12-08',0,1,177,1,2);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-08 17:34:48
