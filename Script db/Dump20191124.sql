CREATE DATABASE  IF NOT EXISTS `bd_proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_proyecto`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_proyecto
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `IdCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) NOT NULL,
  `Estado` bit(1) NOT NULL,
  PRIMARY KEY (`IdCategoria`),
  UNIQUE KEY `UK_g6s0und01rtncrvtkdbln5jq` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Memorias',_binary ''),(2,'Almacenamiento',_binary '\0'),(3,'MicroProcesadores',_binary ''),(4,'Motherboards',_binary '');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles`
--

DROP TABLE IF EXISTS `detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles` (
  `IdProducto` int(11) NOT NULL,
  `NumVenta` int(11) NOT NULL,
  `Cantidad` smallint(6) DEFAULT NULL,
  `PrecioVenta` double DEFAULT NULL,
  PRIMARY KEY (`IdProducto`,`NumVenta`),
  KEY `FK1sfjynemjep2ra6m8yn3i4u13` (`NumVenta`),
  CONSTRAINT `FK1sfjynemjep2ra6m8yn3i4u13` FOREIGN KEY (`NumVenta`) REFERENCES `ventas` (`NumVenta`),
  CONSTRAINT `FK5q97i3yjtp6wpocynil16ra6j` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles`
--

LOCK TABLES `detalles` WRITE;
/*!40000 ALTER TABLE `detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ACTUALIZAR_STOCK` AFTER INSERT ON `detalles` FOR EACH ROW update productos set stock = (stock - new.Cantidad) where IdProducto = new.IdProducto */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (27);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `IdLocalidad` int(11) NOT NULL,
  `IdProvincia` int(11) NOT NULL,
  `NombreLocalidad` varchar(80) NOT NULL,
  PRIMARY KEY (`IdLocalidad`,`IdProvincia`),
  KEY `FKrqs0wf397yjtp2as5y71ohf01` (`IdProvincia`),
  CONSTRAINT `FKrqs0wf397yjtp2as5y71ohf01` FOREIGN KEY (`IdProvincia`) REFERENCES `provincias` (`IdProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,1,'Pacheco'),(2,1,'San Fernando'),(3,1,'Tigre'),(4,1,'San Isidro'),(5,1,'Don Torcuato'),(6,1,'Virreyes'),(7,21,'Rafaela'),(8,21,'Rosario'),(9,6,'Río Cuarto'),(10,6,'Río Seco'),(11,6,'Villa Carlos Paz'),(12,2,'Caballito'),(13,2,'Congreso'),(14,2,'Retiro'),(15,2,'Palermo'),(16,2,'Recoleta'),(17,13,'Guaymallén'),(18,13,'Las Heras'),(19,13,'Godoy Cruz'),(20,8,'Paraná'),(21,8,'Concordia'),(22,8,'Gualeguaychú'),(23,17,'Orán'),(24,17,'Anta'),(25,17,'Metán'),(26,17,'Rosario de la Frontera');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodosdepago`
--

DROP TABLE IF EXISTS `metodosdepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodosdepago` (
  `IdMetodo` char(1) NOT NULL,
  `Descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`IdMetodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodosdepago`
--

LOCK TABLES `metodosdepago` WRITE;
/*!40000 ALTER TABLE `metodosdepago` DISABLE KEYS */;
INSERT INTO `metodosdepago` VALUES ('C','Crébito'),('D','Débito');
/*!40000 ALTER TABLE `metodosdepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `IdProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(400) DEFAULT NULL,
  `Estado` bit(1) NOT NULL,
  `Imagen` varchar(255) DEFAULT NULL,
  `Nombre` varchar(45) NOT NULL,
  `PrecioUnitario` double NOT NULL,
  `Stock` smallint(6) DEFAULT NULL,
  `IdCategoria` int(11) NOT NULL,
  `IdProveedor` int(11) NOT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `FKc5yk5rn9hcay2slo7yg176236` (`IdCategoria`),
  KEY `FKcas28x8kwwmk7mqlkkb32tmqv` (`IdProveedor`),
  CONSTRAINT `FKc5yk5rn9hcay2slo7yg176236` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`IdCategoria`),
  CONSTRAINT `FKcas28x8kwwmk7mqlkkb32tmqv` FOREIGN KEY (`IdProveedor`) REFERENCES `proveedores` (`IdProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'',_binary '','','WD 2TB',1799.99,16,2,1),(2,'',_binary '','imagenes\\productos\\Ryzen-5-3400g.jpg','Ryzen 5 3400g',10599.99,10,3,2),(3,'',_binary '','imagenes\\productos\\mother-asus-m5a97-le-r20.jpg','ASUS M5A97',5299.99,13,4,1),(4,'',_binary '\0','imagenes\\productos\\i3-8100.jpg','Intel i3 8100',12699.99,8,3,2),(5,'',_binary '','imagenes\\productos\\memoria-ram-kingston-hyperx-fury-4gb-ddr3-1866mhz.jpg','Memoria RAM 4GB',1599.99,22,1,1),(6,'',_binary '','','Memoria RAM 8GB',1999.99,30,1,2);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `IdProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Estado` bit(1) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Telefono` varchar(13) NOT NULL,
  `IdLocalidad` int(11) NOT NULL,
  `IdProvincia` int(11) NOT NULL,
  PRIMARY KEY (`IdProveedor`),
  KEY `FK66t161khv8xxu34a17535lnhg` (`IdLocalidad`,`IdProvincia`),
  CONSTRAINT `FK66t161khv8xxu34a17535lnhg` FOREIGN KEY (`IdLocalidad`, `IdProvincia`) REFERENCES `localidades` (`IdLocalidad`, `IdProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Calle Falsa 123','truchelli@outlook.com',_binary '\0','Truchelli','011-4887-2655',13,2),(2,'Av Siempre Viva','berreti@gmail.com',_binary '','Berreti','4879-5921',10,6);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `IdProvincia` int(11) NOT NULL AUTO_INCREMENT,
  `NombreProvincia` varchar(30) NOT NULL,
  PRIMARY KEY (`IdProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Ciudad de Buenos Aires'),(3,'Catamarca'),(4,'Chaco'),(5,'Chubut'),(6,'Córdoba'),(7,'Corrientes'),(8,'Entre Ríos'),(9,'Formosa'),(10,'Jujuy'),(11,'La Pampa'),(12,'La Rioja'),(13,'Mendoza'),(14,'Misiones'),(15,'Neuquén'),(16,'Río Negro'),(17,'Salta'),(18,'San Juan'),(19,'San Luis'),(20,'Santa Cruz'),(21,'Santa Fe'),(22,'Santiago del Estero'),(23,'Tierra del Fuego'),(24,'Tucumán');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposusuarios`
--

DROP TABLE IF EXISTS `tiposusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposusuarios` (
  `TipoDeUsuario` char(1) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`TipoDeUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposusuarios`
--

LOCK TABLES `tiposusuarios` WRITE;
/*!40000 ALTER TABLE `tiposusuarios` DISABLE KEYS */;
INSERT INTO `tiposusuarios` VALUES ('A','Administrador'),('N','Cliente');
/*!40000 ALTER TABLE `tiposusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `DNI` varchar(8) NOT NULL,
  `TipoDeDNI` varchar(8) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Estado` bit(1) NOT NULL,
  `Nombres` varchar(30) NOT NULL,
  `Contraseña` varchar(30) NOT NULL,
  `Telefono` varchar(13) NOT NULL,
  `IdLocalidad` int(11) NOT NULL,
  `IdProvincia` int(11) NOT NULL,
  `TipoDeUsuario` char(1) NOT NULL,
  PRIMARY KEY (`DNI`,`TipoDeDNI`),
  UNIQUE KEY `UK_37udvlehvp80cbafkc7ho5knj` (`Email`),
  KEY `FK8usw70gpnkkpig5uuvlr69iao` (`IdLocalidad`,`IdProvincia`),
  KEY `FKie5c7txdblhgxub6n1vtdekki` (`TipoDeUsuario`),
  CONSTRAINT `FK8usw70gpnkkpig5uuvlr69iao` FOREIGN KEY (`IdLocalidad`, `IdProvincia`) REFERENCES `localidades` (`IdLocalidad`, `IdProvincia`),
  CONSTRAINT `FKie5c7txdblhgxub6n1vtdekki` FOREIGN KEY (`TipoDeUsuario`) REFERENCES `tiposusuarios` (`TipoDeUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('40060031','DNI','Arroyo','---','leoo.arroyo@gmail.com',_binary '','Leo','1234','47150517',1,1,'A'),('40587795','DNI','Alegre','---','nahue@gmail.com',_binary '\0','Nahuel','1234','0114895623',5,1,'N');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `NumVenta` int(11) NOT NULL AUTO_INCREMENT,
  `FechaVenta` date DEFAULT NULL,
  `ImporteTotal` double DEFAULT NULL,
  `DNICliente` varchar(8) DEFAULT NULL,
  `TipoDNICliente` varchar(8) DEFAULT NULL,
  `IdMetodo` char(1) DEFAULT NULL,
  PRIMARY KEY (`NumVenta`),
  KEY `FKr0s3dcdgyv1fxsiegmerrqfta` (`DNICliente`,`TipoDNICliente`),
  KEY `FK6q8xma7i1qieexf0uwrk42kx4` (`IdMetodo`),
  CONSTRAINT `FK6q8xma7i1qieexf0uwrk42kx4` FOREIGN KEY (`IdMetodo`) REFERENCES `metodosdepago` (`IdMetodo`),
  CONSTRAINT `FKr0s3dcdgyv1fxsiegmerrqfta` FOREIGN KEY (`DNICliente`, `TipoDNICliente`) REFERENCES `usuarios` (`DNI`, `TipoDeDNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bd_proyecto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-24 23:51:26
