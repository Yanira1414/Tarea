CREATE DATABASE  IF NOT EXISTS `music_ly` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `music_ly`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: music_ly
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `albumes`
--

DROP TABLE IF EXISTS `albumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albumes` (
  `idALBUM` int NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(45) DEFAULT NULL,
  `IDARTISTA` int NOT NULL,
  PRIMARY KEY (`idALBUM`,`IDARTISTA`),
  KEY `fk_ALBUMES_ARTISTA_idx` (`IDARTISTA`),
  CONSTRAINT `fk_ALBUMES_ARTISTA` FOREIGN KEY (`IDARTISTA`) REFERENCES `artista` (`IDARTISTA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albumes`
--

LOCK TABLES `albumes` WRITE;
/*!40000 ALTER TABLE `albumes` DISABLE KEYS */;
INSERT INTO `albumes` VALUES (1,'LUCERS',1),(2,'GRACIAS',2);
/*!40000 ALTER TABLE `albumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `IDARTISTA` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) DEFAULT NULL,
  `GENERO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDARTISTA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'FG','TRAP'),(2,'RY','REGUETON');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canciones` (
  `idCANCION` int NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(45) DEFAULT NULL,
  `DURACION` time DEFAULT NULL,
  `idALBUM` int NOT NULL,
  `IDARTISTA` int NOT NULL,
  PRIMARY KEY (`idCANCION`,`idALBUM`,`IDARTISTA`),
  KEY `fk_CANCIONES_ALBUMES1_idx` (`idALBUM`,`IDARTISTA`),
  CONSTRAINT `fk_CANCIONES_ALBUMES1` FOREIGN KEY (`idALBUM`, `IDARTISTA`) REFERENCES `albumes` (`idALBUM`, `IDARTISTA`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
INSERT INTO `canciones` VALUES (41,'TOP TEN','02:45:25',1,1),(42,'QUERIDO','03:00:00',2,2);
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCLIENTE` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (98,'SHEIN LUIS','luis@gmail.com'),(99,'LITA JIBA','muys@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idVENTA` int NOT NULL,
  `FECHA` date DEFAULT NULL,
  `idCANCION` int NOT NULL,
  `idALBUM` int NOT NULL,
  `IDARTISTA` int NOT NULL,
  `idCLIENTE` int NOT NULL,
  PRIMARY KEY (`idVENTA`,`idCANCION`,`idALBUM`,`IDARTISTA`,`idCLIENTE`),
  KEY `fk_VENTAS_CANCIONES1_idx` (`idCANCION`,`idALBUM`,`IDARTISTA`),
  KEY `fk_VENTAS_CLIENTES1_idx` (`idCLIENTE`),
  CONSTRAINT `fk_VENTAS_CANCIONES1` FOREIGN KEY (`idCANCION`, `idALBUM`, `IDARTISTA`) REFERENCES `canciones` (`idCANCION`, `idALBUM`, `IDARTISTA`),
  CONSTRAINT `fk_VENTAS_CLIENTES1` FOREIGN KEY (`idCLIENTE`) REFERENCES `clientes` (`idCLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (555,'2024-02-15',41,1,1,98),(556,'2024-12-08',42,2,2,99);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'music_ly'
--

--
-- Dumping routines for database 'music_ly'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-14 10:44:51
