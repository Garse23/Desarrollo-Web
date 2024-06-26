CREATE DATABASE  IF NOT EXISTS `campoverde` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `campoverde`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: campoverde
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `idactividades` int NOT NULL AUTO_INCREMENT,
  `actividadAgricola` varchar(45) NOT NULL,
  `fechaProgramada` date NOT NULL,
  `horaProgramada` time NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idactividades`),
  KEY `fk_idUsuarioActividades_idx` (`idUsuario`),
  CONSTRAINT `fk_idUsuarioActividades` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `nomCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Agricola'),(2,'Ganaderia'),(3,'Artesania');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nomCliente` varchar(45) NOT NULL,
  `telCliente` varchar(9) NOT NULL,
  `dniCliente` varchar(8) NOT NULL,
  `idrol` int NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `fk_idUsuarioCliente_idx` (`idusuario`),
  KEY `fk_idRolCliente_idx` (`idrol`),
  CONSTRAINT `fk_idRolCliente` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`),
  CONSTRAINT `fk_idUsuarioCliente` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (7,'Jose','123123123','12312312',3,13);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `idcomentarios` int NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `fechaComentario` date NOT NULL,
  `horaComentario` time NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idcomentarios`),
  KEY `fk_idUsuarioComentarios_idx` (`idusuario`),
  CONSTRAINT `fk_idUsuarioComentarios` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallesuministro`
--

DROP TABLE IF EXISTS `detallesuministro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallesuministro` (
  `iddetallesuministro` int NOT NULL AUTO_INCREMENT,
  `cantidad` smallint NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `idsuministro` int NOT NULL,
  `idproducto` int NOT NULL,
  PRIMARY KEY (`iddetallesuministro`),
  KEY `fk_idSuministroDetalleSuministro_idx` (`idsuministro`),
  KEY `fk_idProductoDetalleSuministro_idx` (`idproducto`),
  CONSTRAINT `fk_idProductoDetalleSuministro` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `fk_idSuministroDetalleSuministro` FOREIGN KEY (`idsuministro`) REFERENCES `suministro` (`idsuministro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesuministro`
--

LOCK TABLES `detallesuministro` WRITE;
/*!40000 ALTER TABLE `detallesuministro` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallesuministro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleventa` (
  `iddetalleventa` int NOT NULL AUTO_INCREMENT,
  `cantidad` smallint NOT NULL,
  `precioTotal` decimal(6,2) NOT NULL,
  `idProducto` int NOT NULL,
  `idVenta` int NOT NULL,
  PRIMARY KEY (`iddetalleventa`),
  KEY `fk_idProductoDetalleVenta_idx` (`idProducto`),
  KEY `fk_idVentaDetalleVenta_idx` (`idVenta`),
  CONSTRAINT `fk_idProductoDetalleVenta` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `fk_idVentaDetalleVenta` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idempleado` int NOT NULL AUTO_INCREMENT,
  `nomEmpleado` varchar(45) NOT NULL,
  `apellEmpleado` varchar(45) NOT NULL,
  `telEmpleado` varchar(9) NOT NULL,
  `dniEmpleado` varchar(8) NOT NULL,
  `inicioContrato` date NOT NULL,
  `finalContrato` date NOT NULL,
  `idrol` int NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `fk_idUsuarioEmpleado_idx` (`idusuario`),
  KEY `fk_idRolEmpleaddo_idx` (`idrol`),
  CONSTRAINT `fk_idRolEmpleaddo` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`),
  CONSTRAINT `fk_idUsuarioEmpleado` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Jose','Garayar','993221063','78721912','2024-10-10','2034-10-10',4,1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadopedido`
--

DROP TABLE IF EXISTS `estadopedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadopedido` (
  `idestadopedido` int NOT NULL AUTO_INCREMENT,
  `estadoPedido` varchar(45) NOT NULL,
  PRIMARY KEY (`idestadopedido`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadopedido`
--

LOCK TABLES `estadopedido` WRITE;
/*!40000 ALTER TABLE `estadopedido` DISABLE KEYS */;
INSERT INTO `estadopedido` VALUES (1,'Pendiente'),(2,'Enviado'),(3,'Recibido');
/*!40000 ALTER TABLE `estadopedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foro`
--

DROP TABLE IF EXISTS `foro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foro` (
  `idforo` int NOT NULL AUTO_INCREMENT,
  `anuncioForo` varchar(400) NOT NULL,
  `fechaForo` date NOT NULL,
  `horaForo` time NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idforo`),
  KEY `fk_idUsuarioForo_idx` (`idUsuario`),
  CONSTRAINT `fk_idUsuarioForo` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foro`
--

LOCK TABLES `foro` WRITE;
/*!40000 ALTER TABLE `foro` DISABLE KEYS */;
/*!40000 ALTER TABLE `foro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilitado`
--

DROP TABLE IF EXISTS `habilitado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilitado` (
  `idhabilitado` int NOT NULL AUTO_INCREMENT,
  `estadoHabilitado` varchar(45) NOT NULL,
  PRIMARY KEY (`idhabilitado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilitado`
--

LOCK TABLES `habilitado` WRITE;
/*!40000 ALTER TABLE `habilitado` DISABLE KEYS */;
INSERT INTO `habilitado` VALUES (1,'Habilitado'),(2,'Deshabilitado');
/*!40000 ALTER TABLE `habilitado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion`
--

DROP TABLE IF EXISTS `informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informacion` (
  `idinformacion` int NOT NULL,
  `informacion` varchar(300) NOT NULL,
  `nomInformacion` varchar(45) NOT NULL,
  PRIMARY KEY (`idinformacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion`
--

LOCK TABLES `informacion` WRITE;
/*!40000 ALTER TABLE `informacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `idmensajes` int NOT NULL,
  `mensaje` varchar(200) NOT NULL,
  `fechaMensaje` date NOT NULL,
  `horaMensaje` time NOT NULL,
  `idusuario1` int NOT NULL,
  `idusuario2` int NOT NULL,
  PRIMARY KEY (`idmensajes`),
  KEY `fk_idUsuario1Mensajes_idx` (`idusuario1`),
  KEY `fk_idUsuario2Mensajes_idx` (`idusuario2`),
  CONSTRAINT `fk_idUsuario1Mensajes` FOREIGN KEY (`idusuario1`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `fk_idUsuario2Mensajes` FOREIGN KEY (`idusuario2`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idpedido` int NOT NULL AUTO_INCREMENT,
  `idproducto` int NOT NULL,
  `idusuario` int NOT NULL,
  `idestadopedido` int NOT NULL,
  `fechapedido` date NOT NULL,
  `horapedido` time NOT NULL,
  `fechaEnvioPedido` date DEFAULT NULL,
  `horaEnvioPedido` time DEFAULT NULL,
  `fechaRecibidoPedido` date DEFAULT NULL,
  `horaRecibidoPedido` time DEFAULT NULL,
  `idhabilitado` int NOT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `fk_idProductoPedido_idx` (`idproducto`),
  KEY `fk_idUsuarioPedido_idx` (`idusuario`),
  KEY `fk_idEstadoPPedido_idx` (`idestadopedido`),
  KEY `fk_idHabilitadoPedido_idx` (`idhabilitado`),
  CONSTRAINT `fk_idEstadoPPedido` FOREIGN KEY (`idestadopedido`) REFERENCES `estadopedido` (`idestadopedido`),
  CONSTRAINT `fk_idHabilitadoPedido` FOREIGN KEY (`idhabilitado`) REFERENCES `habilitado` (`idhabilitado`),
  CONSTRAINT `fk_idProductoPedido` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `fk_idUsuarioPedido` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (4,21,17,1,'2024-06-15','16:28:06',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `nomProducto` varchar(45) NOT NULL,
  `precioProducto` decimal(6,2) NOT NULL,
  `stockProducto` int NOT NULL,
  `idcategoria` int NOT NULL,
  `idhabilitado` int NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_idCategoriaProducto_idx` (`idcategoria`),
  KEY `fk_idHabilitadoProducto_idx` (`idhabilitado`),
  CONSTRAINT `fk_idCategoriaProducto` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`),
  CONSTRAINT `fk_idHabilitadoProducto` FOREIGN KEY (`idhabilitado`) REFERENCES `habilitado` (`idhabilitado`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (18,'ab',10.00,15,1,1),(19,'a',10.00,15,2,1),(20,'departamento',12.00,10,1,2),(21,'ab',15.00,10,1,1),(22,'c',12.00,15,1,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idproveedor` int NOT NULL AUTO_INCREMENT,
  `nomProveedor` varchar(45) NOT NULL,
  `razonsocialProveedor` varchar(45) NOT NULL,
  `telProveedor` varchar(9) NOT NULL,
  `rucProveedor` varchar(11) NOT NULL,
  `idrol` int NOT NULL,
  `idusuario` int NOT NULL,
  `idhabilitado` int NOT NULL,
  PRIMARY KEY (`idproveedor`),
  KEY `fk_idRolProveedor_idx` (`idrol`),
  KEY `fk_idUsuarioProveedor_idx` (`idusuario`),
  KEY `fk_idHabilitadoProveedor_idx` (`idhabilitado`),
  CONSTRAINT `fk_idHabilitadoProveedor` FOREIGN KEY (`idhabilitado`) REFERENCES `habilitado` (`idhabilitado`),
  CONSTRAINT `fk_idRolProveedor` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`),
  CONSTRAINT `fk_idUsuarioProveedor` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (5,'a','123','132','123',2,15,2),(7,'Alonso Suana','Serviperu','993992991','9129123',2,17,1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registroinformacion`
--

DROP TABLE IF EXISTS `registroinformacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registroinformacion` (
  `idregistroinformacion` int NOT NULL AUTO_INCREMENT,
  `fechaRI` date NOT NULL,
  `horaRI` time NOT NULL,
  `cambioRI` varchar(300) NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idregistroinformacion`),
  KEY `fk_idUsuarioRInformacion_idx` (`idusuario`),
  CONSTRAINT `fk_idUsuarioRInformacion` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registroinformacion`
--

LOCK TABLES `registroinformacion` WRITE;
/*!40000 ALTER TABLE `registroinformacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `registroinformacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestaforo`
--

DROP TABLE IF EXISTS `respuestaforo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestaforo` (
  `idrespuestaforo` int NOT NULL AUTO_INCREMENT,
  `respuesta` varchar(200) NOT NULL,
  `fechaRF` date NOT NULL,
  `horaRF` time NOT NULL,
  `idUsuario` int NOT NULL,
  `idforo` int NOT NULL,
  PRIMARY KEY (`idrespuestaforo`),
  KEY `fk_idUsuarioRForo_idx` (`idUsuario`),
  KEY `fk_idForoRForo_idx` (`idforo`),
  CONSTRAINT `fk_idForoRForo` FOREIGN KEY (`idforo`) REFERENCES `foro` (`idforo`),
  CONSTRAINT `fk_idUsuarioRForo` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestaforo`
--

LOCK TABLES `respuestaforo` WRITE;
/*!40000 ALTER TABLE `respuestaforo` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestaforo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `rolUsuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Empleado'),(2,'Proveedor'),(3,'Cliente'),(4,'Administrador');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suministro`
--

DROP TABLE IF EXISTS `suministro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suministro` (
  `idsuministro` int NOT NULL AUTO_INCREMENT,
  `fechaSuministro` date NOT NULL,
  `horaSuministro` time NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idsuministro`),
  KEY `fk_idUsuarioSuministro_idx` (`idUsuario`),
  CONSTRAINT `fk_idUsuarioSuministro` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suministro`
--

LOCK TABLES `suministro` WRITE;
/*!40000 ALTER TABLE `suministro` DISABLE KEYS */;
/*!40000 ALTER TABLE `suministro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `correoUsuario` varchar(45) NOT NULL,
  `passUsuario` varchar(45) NOT NULL,
  `idrol` int NOT NULL,
  `idhabilitado` int NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_idRolUsuario_idx` (`idrol`),
  KEY `fk_idHabilitadoUsuario_idx` (`idhabilitado`),
  CONSTRAINT `fk_idRolUsuario` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'jGarayar@gmail.com','Garayar',4,1),(12,'jose@jose','123',3,1),(13,'wili@wili','123',1,1),(15,'123@123','123',2,1),(17,'AlonsoS@gmail.com','Alonso',2,2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idventa` int NOT NULL AUTO_INCREMENT,
  `fechaVenta` date NOT NULL,
  `horaVenta` time NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_idUsuarioVenta_idx` (`idUsuario`),
  CONSTRAINT `fk_idUsuarioVenta` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-20 12:28:47
