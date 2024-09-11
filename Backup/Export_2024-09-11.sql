-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sistema_gestion
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `orden_compra`
--

DROP TABLE IF EXISTS `orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra` (
  `idorden_compra` int NOT NULL AUTO_INCREMENT,
  `idusuario` int DEFAULT NULL,
  `idproducto` int DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `cantitad` int DEFAULT NULL,
  PRIMARY KEY (`idorden_compra`),
  KEY `idproducto` (`idproducto`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `orden_compra_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra`
--

LOCK TABLES `orden_compra` WRITE;
/*!40000 ALTER TABLE `orden_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_compra`
--

DROP TABLE IF EXISTS `pago_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_compra` (
  `idpago_compra` int NOT NULL AUTO_INCREMENT,
  `idorden_compra` int DEFAULT NULL,
  `estado_compra` tinyint(1) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  PRIMARY KEY (`idpago_compra`),
  KEY `idorden_compra` (`idorden_compra`),
  CONSTRAINT `pago_compra_ibfk_1` FOREIGN KEY (`idorden_compra`) REFERENCES `orden_compra` (`idorden_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_compra`
--

LOCK TABLES `pago_compra` WRITE;
/*!40000 ALTER TABLE `pago_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(50) DEFAULT NULL,
  `descripcion_producto` text,
  `idtipo_producto` int DEFAULT NULL,
  `precio` int DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `idtipo_producto` (`idtipo_producto`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idtipo_producto`) REFERENCES `tipo_producto` (`idtipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provedor`
--

DROP TABLE IF EXISTS `provedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provedor` (
  `idprovedor` int NOT NULL AUTO_INCREMENT,
  `nombre_provedor` varchar(50) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `contacto` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idprovedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provedor`
--

LOCK TABLES `provedor` WRITE;
/*!40000 ALTER TABLE `provedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `provedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provedor_producto`
--

DROP TABLE IF EXISTS `provedor_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provedor_producto` (
  `idprovedor_producto` int NOT NULL AUTO_INCREMENT,
  `idprovedor` int DEFAULT NULL,
  `idproducto` int DEFAULT NULL,
  PRIMARY KEY (`idprovedor_producto`),
  KEY `idprovedor` (`idprovedor`),
  KEY `idproducto` (`idproducto`),
  CONSTRAINT `provedor_producto_ibfk_1` FOREIGN KEY (`idprovedor`) REFERENCES `provedor` (`idprovedor`),
  CONSTRAINT `provedor_producto_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provedor_producto`
--

LOCK TABLES `provedor_producto` WRITE;
/*!40000 ALTER TABLE `provedor_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `provedor_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_usuario`
--

DROP TABLE IF EXISTS `rol_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_usuario` (
  `idrol_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) DEFAULT NULL,
  `descripcion_rol` text,
  PRIMARY KEY (`idrol_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_usuario`
--

LOCK TABLES `rol_usuario` WRITE;
/*!40000 ALTER TABLE `rol_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `idtipo_producto` int NOT NULL AUTO_INCREMENT,
  `tipo_producto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idtipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `idrol_usuario` int DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `documento` int DEFAULT NULL,
  `telefono` varchar(13) DEFAULT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `idrol_usuario` (`idrol_usuario`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idrol_usuario`) REFERENCES `rol_usuario` (`idrol_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-11 12:11:44
