-- MySQL dump 10.16  Distrib 10.1.43-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: yoaprendo
-- ------------------------------------------------------
-- Server version	10.1.43-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Humanidades'),(2,'Ciencias aplicadas y de la salud'),(3,'Ciencias puras'),(4,'Entretenimiento');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionario`
--

DROP TABLE IF EXISTS `cuestionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionario`
--

LOCK TABLES `cuestionario` WRITE;
/*!40000 ALTER TABLE `cuestionario` DISABLE KEYS */;
INSERT INTO `cuestionario` VALUES (1,1,'Historia','INICIAL'),(2,1,'Variadas','DIARIO'),(3,1,'Cuestionario Adicional','ADICIONAL'),(4,1,'Diego','TRES'),(5,1,'RICK','TRES'),(6,1,'ANCCCAS','cuatro'),(7,1,'PECADOR','TRES'),(8,1,'AYALA','TRES'),(9,1,'TODO','TRES'),(10,1,'TRISTE','NO DICEN USTEDES'),(11,1,'LAGRIMAS235','BLANCOS'),(12,1,'MODELOS','TRES'),(13,5,'preguntas del dia jueves','29'),(14,9,'Demo',NULL),(15,15,'Clase1 Prueba',NULL),(16,19,'ok',NULL),(17,19,'EXAMEN YUCA',NULL);
/*!40000 ALTER TABLE `cuestionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionario_pregunta`
--

DROP TABLE IF EXISTS `cuestionario_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionario_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuestionario_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `puntaje` decimal(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cuestionario_pregunta_unicos` (`cuestionario_id`,`pregunta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionario_pregunta`
--

LOCK TABLES `cuestionario_pregunta` WRITE;
/*!40000 ALTER TABLE `cuestionario_pregunta` DISABLE KEYS */;
INSERT INTO `cuestionario_pregunta` VALUES (1,1,2,0,5.00),(2,1,3,0,5.00),(3,1,4,0,5.00),(4,2,5,0,5.00),(5,2,6,0,5.00),(6,14,7,0,5.00),(7,14,8,0,5.00),(8,14,9,0,5.00),(9,16,10,0,5.00),(10,17,11,0,5.00),(11,17,12,0,5.00);
/*!40000 ALTER TABLE `cuestionario_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dificultad`
--

DROP TABLE IF EXISTS `dificultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dificultad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `color` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dificultad`
--

LOCK TABLES `dificultad` WRITE;
/*!40000 ALTER TABLE `dificultad` DISABLE KEYS */;
INSERT INTO `dificultad` VALUES (1,'FÁCIL','#27d21c'),(2,'NORMAL','#325482'),(4,'DIFÍCIL','#ec6d00'),(5,'RETO','#7a00ff');
/*!40000 ALTER TABLE `dificultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llamada`
--

DROP TABLE IF EXISTS `llamada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llamada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) NOT NULL,
  `numero` varchar(30) NOT NULL,
  `desde` datetime DEFAULT NULL,
  `hasta` datetime DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llamada`
--

LOCK TABLES `llamada` WRITE;
/*!40000 ALTER TABLE `llamada` DISABLE KEYS */;
/*!40000 ALTER TABLE `llamada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `texto` text NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion`
--

DROP TABLE IF EXISTS `opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta_id` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `texto` varchar(100) DEFAULT NULL,
  `correcto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `opcion_unicos` (`pregunta_id`,`orden`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion`
--

LOCK TABLES `opcion` WRITE;
/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
INSERT INTO `opcion` VALUES (1,2,1,'Adolf Hitler',0),(2,2,2,'Cristóbal Colón',1),(3,2,3,'Ten Shin Han',0),(4,3,1,'1492',1),(5,3,2,'1482',0),(6,3,3,'1420',0),(7,3,4,'1385',0),(8,4,1,'Quito',0),(9,4,2,'Londres',0),(10,4,3,'Cuzco',1),(11,4,4,'Lima',0),(12,5,1,'Si',0),(13,5,2,'No',0),(14,5,3,'Eso creo',0),(15,6,1,'No sé dímelo tú',1),(16,6,2,'No',0),(17,6,3,'Si',0),(18,7,1,'aaa',1),(19,7,2,'bbb',0),(20,7,3,'ccc',0),(24,8,1,'boby',0),(25,8,2,'bobo',0),(26,8,3,'bubu',1),(27,9,1,'0',0),(28,9,2,'3',0),(29,9,3,'100',1),(33,10,1,'NEGRO',0),(34,10,2,'BLANCO',0),(35,10,3,'NOSE',0),(36,11,1,'AJA',0),(37,11,2,'AJA2',0),(38,11,3,'2',1),(39,12,1,'AS',0),(40,12,2,'AS',0),(41,12,3,'ASS',1);
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento_tipo` varchar(20) NOT NULL,
  `documento_numero` varchar(25) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `telefono1` varchar(20) DEFAULT NULL,
  `fecha_atencion` datetime DEFAULT NULL,
  `edad` int(3) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `pais_infeccion` varchar(100) DEFAULT NULL,
  `provincia_actual` varchar(100) DEFAULT NULL,
  `distrito_actual` varchar(100) DEFAULT NULL,
  `direccion_actual` varchar(100) DEFAULT NULL,
  `inicio_sintomas` datetime DEFAULT NULL,
  `clasificacion` varchar(100) DEFAULT NULL,
  `destino` varchar(100) DEFAULT NULL,
  `destino_lugar` varchar(200) DEFAULT NULL,
  `notas` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'DNI','41350089','Webb Camminati Camille',NULL,NULL,'952388777','2020-04-20 00:00:00',59,'F','na','na','na','na','2020-04-09 00:00:00','CONFIRMADO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\r\nP. rapida =&gt; Negativo\r\nMUESTRA 2 (20/04/2020)\r\nHISOPADO NASOFARINGEO Y OROFARINGEO =&gt; Negativo\r\nMUESTRA 3 (16/04/2020)\r\nP. rapida =&gt; REACTIVO\r\nEVOLUCION 1: sin factores de riesgo, solo tos y dolor de garganta'),(2,'DNI','35784465','La Rosa Ubillas, Mauricio',NULL,NULL,'941055623','2020-04-20 19:00:00',54,'M','na','na','na','na','2020-04-14 19:00:00','CONFIRMADO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\nP. rapida => REACTIVO\nMUESTRA 2 (20/04/2020)\n => \nEVOLUCION 1: sin factores de riesgo, con falta de aire'),(3,'DNI','11008823','Otero Vegas, Larissa',NULL,NULL,'940709888','2020-04-20 19:00:00',38,'F','na','na','na','na','2020-04-04 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\nP. rapida => Negativo\nMUESTRA 2 (20/04/2020)\n => \nEVOLUCION 1: Trabajador de salud con sintomas sin factores de riesgo'),(4,'DNI','39847626','Gonzalez Lagos, Elsa',NULL,NULL,'993404379','2020-04-20 19:00:00',81,'F','na','na','na','na','2020-04-08 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\nP. rapida => Negativo\nMUESTRA 2 (20/04/2020)\nHISOPADO NASOFARINGEO Y OROFARINGEO => PENDIENTE\nEVOLUCION 1: Diabetico, hipertenso, con sintomas, sin disnea'),(5,'DNI','32870098','Menacho Alvirio, Luis',NULL,NULL,'991671979','2020-04-20 19:00:00',74,'M','na','na','na','na','2020-04-13 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\np rapida => negativo\nMUESTRA 2 (20/04/2020)\nhisOPADO NASOFARINGEO Y OROFARINGEO => PENDIENTE\nEVOLUCION 1: Asma '),(6,'DNI','37886543','Krapp López Carlos',NULL,NULL,'959610014','2020-04-20 19:00:00',65,'M','na','na','na','na','2020-04-16 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\np rapida => positivo\nMUESTRA 2 (20/04/2020)\nHISOPADO NASOFARINGEO Y OROFARINGEO => pendienTE\nEVOLUCION 1: Hipertensión'),(7,'DNI','27885409','Cornejo Cisneros Enrique',NULL,NULL,'922221151','2020-04-20 19:00:00',58,'M','na','na','na','na','2020-04-09 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\nP. rapida => REACTIVO\nMUESTRA 2 (20/04/2020)\n => \n'),(8,'DNI','32224765','Ugarte Gil, Cesar',NULL,NULL,'997157333','2020-04-20 19:00:00',29,'M','na','na','na','na','2020-04-14 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\nP. rapida => REACTIVO\nMUESTRA 2 (20/04/2020)\n => \n'),(9,'DNI','28447765','Krapp López Fiorella',NULL,NULL,'922221127','2020-04-20 19:00:00',72,'F','na','na','na','na','2020-04-04 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\nP. rapida => Negativo\nMUESTRA 2 (20/04/2020)\nHISOPADO NASOFARINGEO Y OROFARINGEO => PENDIENTE\n'),(10,'DNI','44657839','Medina Collado, Carlos',NULL,NULL,'994311626','2020-04-20 19:00:00',80,'M','na','na','na','na','2020-04-08 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\nP. rapida => Negativo\nMUESTRA 2 (20/04/2020)\nHISOPADO NASOFARINGEO Y OROFARINGEO => pendIENTE\n'),(11,'DNI','26754609','Ferrari Gabilondo, Monica',NULL,NULL,'952388777','2020-04-21 19:00:00',51,'F','na','na','na','na','2020-04-13 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (21/04/2020)\np rapida => Negativo\nMUESTRA 2 (21/04/2020)\nHISOPADO NASOFARINGEO Y OROFARINGEO => pendienTE\n'),(12,'DNI','35276972','Arauco Dextre, Renzo',NULL,NULL,'941055623','2020-04-21 19:00:00',34,'M','na','na','na','na','2020-04-16 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (21/04/2020)\np rapida => Negativo\nMUESTRA 2 (21/04/2020)\n => \n'),(13,'DNI','45102988','Lopez Marcovic, Carolina',NULL,NULL,'940709888','2020-04-21 19:00:00',57,'F','na','na','na','na','2020-04-09 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (21/04/2020)\nP. rapida => REACTIVO\nMUESTRA 2 (21/04/2020)\n => \n'),(14,'DNI','23675678','Canalle Alzamora, Donna',NULL,NULL,'993404379','2020-04-21 19:00:00',49,'F','na','na','na','na','2020-04-14 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (21/04/2020)\nP. rapida => Negativo\nMUESTRA 2 (21/04/2020)\n => \n'),(15,'DNI','31776984','Coronado Agurto, Alvaro',NULL,NULL,'991671979','2020-04-21 19:00:00',32,'M','na','na','na','na','2020-04-04 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (21/04/2020)\nP. rapida => Negativo\nMUESTRA 2 (21/04/2020)\n => \n'),(16,'DNI','39871652','Veliz Rosas, Jose Carlos',NULL,NULL,'959610014','2020-04-21 19:00:00',55,'M','na','na','na','na','2020-04-08 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (21/04/2020)\nP. rapida => REACTIVO\nMUESTRA 2 (21/04/2020)\nHISOPADO NASOFARINGEO Y OROFARINGEO => PENDIENTE\n'),(17,'DNI','38564680','Lopez Aranda, Arturo',NULL,NULL,'922221151','2020-04-21 19:00:00',83,'M','na','na','na','na','2020-04-13 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (21/04/2020)\np rapida => Negativo\nMUESTRA 2 (21/04/2020)\n => \n'),(18,'DNI','34337865','Bueno Salas, Juan',NULL,NULL,'997157333','2020-04-21 19:00:00',91,'M','na','na','na','na','2020-04-16 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (21/04/2020)\np rapida => Negativo\nMUESTRA 2 (21/04/2020)\nHISOPADO NASOFARINGEO Y OROFARINGEO => pendienTE\n'),(19,'DNI','29777651','Araoz Contreras, Talia',NULL,NULL,'922221127','2020-04-21 19:00:00',27,'F','na','na','na','na','2020-04-09 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (21/04/2020)\nP. rapida => REACTIVO\nMUESTRA 2 (21/04/2020)\n => \n'),(20,'DNI','37659000','Amaro Diaz, Carlos',NULL,NULL,'994311626','2020-04-21 19:00:00',18,'M','na','na','na','na','2020-04-14 19:00:00','SOSPECHOSO','ALTA','SU CASA','MUESTRA 1 (21/04/2020)\nP. rapida => REACTIVO\nMUESTRA 2 (21/04/2020)\n => \n'),(21,'DNI','41350089','Webb','Camminati','Camille','952225612','2020-04-20 00:00:00',59,'F','na','na','na','na','2020-04-09 00:00:00','CONFIRMADO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\r\nP. rapida =&gt; Negativo\r\nMUESTRA 2 (20/04/2020)\r\nHISOPADO NASOFARINGEO Y OROFARINGEO =&gt; Negativo\r\nMUESTRA 3 (16/04/2020)\r\nP. rapida =&gt; REACTIVO\r\nEVOLUCION 1: sin factores de riesgo, solo tos y dolor de garganta'),(22,'DNI','41350089','Webb','Camminati','Camille','952225612','2020-04-20 00:00:00',59,'F','na','na','na','na','2020-04-09 00:00:00','CONFIRMADO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\r\nP. rapida =&gt; Negativo\r\nMUESTRA 2 (20/04/2020)\r\nHISOPADO NASOFARINGEO Y OROFARINGEO =&gt; Negativo\r\nMUESTRA 3 (16/04/2020)\r\nP. rapida =&gt; REACTIVO\r\nEVOLUCION 1: sin factores de riesgo, solo tos y dolor de garganta'),(23,'DNI','41350089','Webb Camminati Camille',NULL,NULL,'952388','2020-04-20 00:00:00',59,'F','na','na','na','na','2020-04-09 00:00:00','CONFIRMADO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\r\nP. rapida =&gt; Negativo\r\nMUESTRA 2 (20/04/2020)\r\nHISOPADO NASOFARINGEO Y OROFARINGEO =&gt; Negativo\r\nMUESTRA 3 (16/04/2020)\r\nP. rapida =&gt; REACTIVO\r\nEVOLUCION 1: sin factores de riesgo, solo tos y dolor de garganta'),(24,'DNI','41350089','Webb Camminati Camille',NULL,NULL,'952388777 000','2020-04-20 00:00:00',59,'F','na','na','na','na','2020-04-09 00:00:00','CONFIRMADO','ALTA','SU CASA','MUESTRA 1 (20/04/2020)\r\nP. rapida =&gt; Negativo\r\nMUESTRA 2 (20/04/2020)\r\nHISOPADO NASOFARINGEO Y OROFARINGEO =&gt; Negativo\r\nMUESTRA 3 (16/04/2020)\r\nP. rapida =&gt; REACTIVO\r\nEVOLUCION 1: sin factores de riesgo, solo tos y dolor de garganta');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_formulario`
--

DROP TABLE IF EXISTS `paciente_formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente_formulario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) NOT NULL,
  `formulario_id` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_formulario`
--

LOCK TABLES `paciente_formulario` WRITE;
/*!40000 ALTER TABLE `paciente_formulario` DISABLE KEYS */;
INSERT INTO `paciente_formulario` VALUES (1,1,1,'2020-04-23 04:26:40',NULL),(2,3,2,'2020-04-23 04:28:09',NULL),(3,3,1,'2020-04-23 04:28:12',NULL),(4,2,1,'2020-04-23 04:28:44',NULL),(5,2,3,'2020-04-23 04:28:57',NULL),(6,2,2,'2020-04-23 04:29:02',NULL),(7,1,2,'2020-04-23 20:33:27',1);
/*!40000 ALTER TABLE `paciente_formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_respuesta`
--

DROP TABLE IF EXISTS `paciente_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente_respuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_formulario_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  `respuesta` varchar(100) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_paciente_respuesta` (`paciente_formulario_id`,`pregunta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_respuesta`
--

LOCK TABLES `paciente_respuesta` WRITE;
/*!40000 ALTER TABLE `paciente_respuesta` DISABLE KEYS */;
INSERT INTO `paciente_respuesta` VALUES (1,1,1,'NO','2020-04-23 04:27:28',1),(2,1,2,'NO','2020-04-23 04:27:34',NULL),(3,1,3,'NO','2020-04-23 04:27:35',NULL),(4,7,8,'SI','2020-04-23 20:33:28',NULL),(5,7,9,'SI','2020-04-23 20:33:29',NULL),(6,7,10,'SI','2020-04-23 20:33:30',NULL),(7,7,11,'SI','2020-04-23 20:33:30',NULL);
/*!40000 ALTER TABLE `paciente_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(300) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `dificultad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (2,'¿Quién describió América?',NULL,2),(3,'¿En que año descubrió Colón América?',NULL,2),(4,'¿Cuál era la capital del Imperio Inca?',NULL,1),(5,'¿Has ido a una manifestación?',NULL,2),(6,'¿Has asistido a clases el viernes pasado?',NULL,2),(7,'esta es la pregunta',NULL,2),(8,'como se llama el perro',NULL,2),(9,'a que edad naciste?',NULL,2),(10,'DE COLOR ES EL CABALLO BLANC DE SAN MARTIN?',NULL,2),(11,'1 + 1',NULL,1),(12,'ASASAS',NULL,2);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `fecha_programada` datetime NOT NULL,
  `fecha_desde` datetime DEFAULT NULL,
  `fecha_hasta` datetime DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `privacidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
INSERT INTO `sesion` VALUES (1,'gcu8taaa',1,'Sesión #1',4,'2020-05-06 10:00:00','2020-05-22 01:48:36','2020-05-22 01:59:33','00:10:57',1),(2,'56fnr38x',1,'Sesión #2',4,'2020-05-07 08:00:00','2020-05-22 01:53:08','2020-05-22 01:59:19','00:06:11',1),(3,'b1s3czku',1,'Sesión #3',4,'2020-05-14 10:00:00',NULL,NULL,NULL,1),(4,'nkza8cm9',5,'Sesión #1',4,'2020-10-29 12:00:00',NULL,NULL,NULL,1),(5,'qp353byv',9,'Sesión #1',2,'2020-05-17 18:57:00',NULL,NULL,NULL,1),(6,'vm1ubzh1',10,'Sesión #1',3,'2020-05-18 08:30:00',NULL,NULL,NULL,1),(7,'g-ypv24z',9,'Sesión #2',4,'2020-05-17 20:23:00',NULL,NULL,NULL,1),(8,'vte3k148',9,'Sesión #3',2,'2020-05-21 12:24:00',NULL,NULL,NULL,1),(9,'hefwh-fy',15,'Sesión #1',2,'1997-05-21 18:00:00',NULL,NULL,NULL,2),(10,'8buvha76',16,'Sesion de enseñanza',2,'2020-05-21 19:00:00',NULL,NULL,NULL,1),(11,'rphkkr7g',16,'Sesion De Trigonometria',2,'2020-05-21 19:00:00',NULL,NULL,NULL,1),(12,'4ufurusf',10,'Sesion de Trigo',2,'2020-05-21 19:00:00',NULL,NULL,NULL,1),(13,'rmj72q6y',19,'Sesión #1',2,'0000-00-00 00:00:00','2020-05-24 12:59:48','2020-05-24 13:07:18','00:07:30',1),(14,'89pad53q',19,'Sesión #2',2,'0000-00-00 00:00:00','2020-05-24 13:08:22','2020-05-24 13:14:43','00:06:21',1),(15,'7kswjtm7',19,'Sesión #3',2,'0000-00-00 00:00:00','2020-05-24 13:18:50','2020-05-24 13:22:29','00:03:39',1);
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Sesion_Calculate_Duration
BEFORE UPDATE
ON sesion
FOR EACH ROW
SET new.duracion = IF(new.fecha_hasta IS NOT NULL, TIMEDIFF(new.fecha_hasta, new.fecha_desde), NULL) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sesion_cuestionario`
--

DROP TABLE IF EXISTS `sesion_cuestionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion_cuestionario` (
  `sesion_id` int(11) NOT NULL,
  `cuestionario_id` int(11) NOT NULL,
  PRIMARY KEY (`sesion_id`,`cuestionario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion_cuestionario`
--

LOCK TABLES `sesion_cuestionario` WRITE;
/*!40000 ALTER TABLE `sesion_cuestionario` DISABLE KEYS */;
INSERT INTO `sesion_cuestionario` VALUES (1,1),(1,2),(1,6),(2,1),(3,1),(5,14),(7,14),(8,14),(13,16),(14,16),(14,17),(15,16),(15,17);
/*!40000 ALTER TABLE `sesion_cuestionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion_espectador`
--

DROP TABLE IF EXISTS `sesion_espectador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion_espectador` (
  `sesion_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_desde` datetime DEFAULT NULL,
  `fecha_hasta` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion_espectador`
--

LOCK TABLES `sesion_espectador` WRITE;
/*!40000 ALTER TABLE `sesion_espectador` DISABLE KEYS */;
INSERT INTO `sesion_espectador` VALUES (3,1,'2020-05-21 15:03:37',NULL),(3,1,'2020-05-21 16:07:50',NULL),(3,1,'2020-05-21 16:08:15',NULL),(3,1,'2020-05-21 16:11:07',NULL),(3,1,'2020-05-21 16:11:31',NULL),(3,1,'2020-05-21 16:23:13',NULL),(3,1,'2020-05-21 16:28:33',NULL),(3,1,'2020-05-21 17:01:54',NULL),(3,15,'2020-05-21 17:48:51',NULL),(9,15,'2020-05-21 17:57:41',NULL),(9,15,'2020-05-21 17:58:20',NULL),(10,16,'2020-05-21 18:02:29',NULL),(10,16,'2020-05-21 18:03:44',NULL),(10,16,'2020-05-21 18:04:02',NULL),(3,16,'2020-05-21 18:07:32',NULL),(3,17,'2020-05-21 18:07:50',NULL),(3,17,'2020-05-21 18:10:09',NULL),(11,16,'2020-05-21 18:11:51',NULL),(11,1,'2020-05-21 18:12:01',NULL),(11,17,'2020-05-21 18:12:31',NULL),(3,17,'2020-05-21 18:13:00',NULL),(11,16,'2020-05-21 18:13:35',NULL),(3,17,'2020-05-21 18:13:56',NULL),(11,17,'2020-05-21 18:14:19',NULL),(11,1,'2020-05-21 18:14:23',NULL),(11,17,'2020-05-21 18:14:57',NULL),(11,10,'2020-05-21 18:16:11',NULL),(11,17,'2020-05-21 18:17:59',NULL),(11,1,'2020-05-21 18:20:25',NULL),(12,1,'2020-05-21 18:20:37',NULL),(3,1,'2020-05-21 18:21:19',NULL),(12,17,'2020-05-21 18:23:08',NULL),(12,1,'2020-05-21 18:23:10',NULL),(12,16,'2020-05-21 18:32:30',NULL),(12,16,'2020-05-21 18:33:22',NULL),(12,16,'2020-05-21 18:33:29',NULL),(12,16,'2020-05-21 18:33:35',NULL),(12,1,'2020-05-21 19:02:53',NULL),(12,16,'2020-05-21 19:03:08',NULL),(12,1,'2020-05-21 19:04:51',NULL),(3,1,'2020-05-21 19:25:33',NULL),(3,1,'2020-05-21 20:00:17',NULL),(3,1,'2020-05-21 20:01:03',NULL),(3,1,'2020-05-21 20:07:25',NULL),(3,1,'2020-05-21 20:07:48',NULL),(3,1,'2020-05-21 20:12:37',NULL),(3,1,'2020-05-21 20:14:09',NULL),(3,1,'2020-05-21 20:15:39',NULL),(3,1,'2020-05-21 20:16:33',NULL),(3,1,'2020-05-21 20:21:06',NULL),(3,1,'2020-05-21 20:21:51',NULL),(3,1,'2020-05-21 20:22:29',NULL),(3,1,'2020-05-21 20:24:36',NULL),(3,1,'2020-05-21 20:32:59',NULL),(3,1,'2020-05-21 20:33:04',NULL),(3,1,'2020-05-21 20:33:56',NULL),(3,1,'2020-05-21 20:34:04',NULL),(3,1,'2020-05-21 20:34:17',NULL),(3,1,'2020-05-21 20:34:20',NULL),(3,1,'2020-05-21 20:34:20',NULL),(3,1,'2020-05-21 20:34:21',NULL),(3,1,'2020-05-21 20:34:22',NULL),(3,1,'2020-05-21 20:34:22',NULL),(3,1,'2020-05-21 20:35:00',NULL),(3,1,'2020-05-21 20:35:01',NULL),(3,1,'2020-05-21 20:35:01',NULL),(3,1,'2020-05-21 20:36:15',NULL),(3,1,'2020-05-21 20:36:16',NULL),(3,1,'2020-05-21 20:36:17',NULL),(3,1,'2020-05-21 20:36:18',NULL),(3,1,'2020-05-21 20:36:32',NULL),(3,1,'2020-05-21 20:37:05',NULL),(3,1,'2020-05-21 20:37:06',NULL),(3,1,'2020-05-21 20:37:07',NULL),(3,1,'2020-05-21 20:37:22',NULL),(3,1,'2020-05-21 20:37:23',NULL),(3,1,'2020-05-21 20:37:23',NULL),(3,1,'2020-05-21 20:37:24',NULL),(3,1,'2020-05-21 20:51:03',NULL),(3,1,'2020-05-21 20:51:03',NULL),(3,1,'2020-05-21 20:51:04',NULL),(3,1,'2020-05-21 20:51:05',NULL),(3,1,'2020-05-21 20:51:06',NULL),(3,1,'2020-05-21 20:51:07',NULL),(3,1,'2020-05-21 20:51:11',NULL),(3,1,'2020-05-21 20:51:30',NULL),(3,1,'2020-05-21 20:51:31',NULL),(3,1,'2020-05-21 20:51:32',NULL),(3,1,'2020-05-21 20:51:32',NULL),(3,1,'2020-05-21 20:51:46',NULL),(3,1,'2020-05-21 20:51:50',NULL),(3,1,'2020-05-21 20:51:51',NULL),(3,1,'2020-05-21 20:51:52',NULL),(3,1,'2020-05-21 20:51:57',NULL),(3,1,'2020-05-21 20:51:59',NULL),(3,1,'2020-05-21 20:51:59',NULL),(3,1,'2020-05-21 20:52:00',NULL),(3,1,'2020-05-21 20:52:01',NULL),(3,1,'2020-05-21 20:53:17',NULL),(3,1,'2020-05-21 20:53:27',NULL),(3,1,'2020-05-21 20:53:50',NULL),(3,1,'2020-05-21 20:54:02',NULL),(3,1,'2020-05-21 20:54:07',NULL),(3,1,'2020-05-21 20:54:38',NULL),(3,1,'2020-05-21 20:54:47',NULL),(3,1,'2020-05-21 20:54:49',NULL),(3,1,'2020-05-21 20:54:50',NULL),(3,1,'2020-05-21 20:54:52',NULL),(3,1,'2020-05-21 20:54:53',NULL),(3,1,'2020-05-21 20:54:54',NULL),(3,1,'2020-05-21 20:54:55',NULL),(3,1,'2020-05-21 20:54:56',NULL),(3,1,'2020-05-21 20:55:52',NULL),(3,1,'2020-05-21 20:56:01',NULL),(3,1,'2020-05-21 20:56:07',NULL),(3,1,'2020-05-21 20:56:55',NULL),(3,1,'2020-05-21 20:56:58',NULL),(3,1,'2020-05-21 20:57:01',NULL),(3,1,'2020-05-21 20:57:03',NULL),(3,1,'2020-05-21 20:57:05',NULL),(3,1,'2020-05-21 21:14:35',NULL),(3,1,'2020-05-21 21:15:45',NULL),(3,1,'2020-05-21 21:16:21',NULL),(3,1,'2020-05-21 21:16:29',NULL),(3,1,'2020-05-21 21:16:31',NULL),(3,1,'2020-05-21 21:42:34',NULL),(3,1,'2020-05-21 21:44:29',NULL),(3,1,'2020-05-21 21:44:42',NULL),(3,1,'2020-05-21 21:44:52',NULL),(3,1,'2020-05-21 21:45:02',NULL),(3,1,'2020-05-21 21:45:12',NULL),(3,1,'2020-05-21 21:45:21',NULL),(3,1,'2020-05-21 21:45:31',NULL),(3,1,'2020-05-21 21:45:41',NULL),(3,1,'2020-05-21 21:45:51',NULL),(3,1,'2020-05-21 21:46:02',NULL),(3,1,'2020-05-21 21:46:11',NULL),(3,1,'2020-05-21 21:46:21',NULL),(3,1,'2020-05-21 21:46:31',NULL),(3,1,'2020-05-21 21:46:41',NULL),(3,1,'2020-05-21 21:46:52',NULL),(3,1,'2020-05-21 21:47:02',NULL),(3,1,'2020-05-21 21:47:12',NULL),(3,1,'2020-05-21 21:47:22',NULL),(3,1,'2020-05-21 21:47:32',NULL),(3,1,'2020-05-21 21:47:40',NULL),(3,1,'2020-05-21 21:47:41',NULL),(3,1,'2020-05-21 21:47:45',NULL),(3,1,'2020-05-21 21:47:47',NULL),(3,1,'2020-05-21 21:47:49',NULL),(3,1,'2020-05-21 21:47:51',NULL),(3,1,'2020-05-21 21:48:02',NULL),(3,1,'2020-05-21 21:48:11',NULL),(3,1,'2020-05-21 21:48:21',NULL),(3,1,'2020-05-21 21:48:32',NULL),(3,1,'2020-05-21 21:48:41',NULL),(3,1,'2020-05-21 21:48:48',NULL),(3,1,'2020-05-21 21:49:00',NULL),(3,1,'2020-05-21 21:49:10',NULL),(3,1,'2020-05-21 21:49:20',NULL),(3,1,'2020-05-21 21:49:30',NULL),(3,1,'2020-05-21 21:49:39',NULL),(3,1,'2020-05-21 21:49:51',NULL),(3,1,'2020-05-21 21:50:01',NULL),(3,1,'2020-05-21 21:50:11',NULL),(3,1,'2020-05-21 21:50:21',NULL),(3,1,'2020-05-21 21:50:31',NULL),(3,1,'2020-05-21 21:50:41',NULL),(3,1,'2020-05-21 21:50:51',NULL),(3,1,'2020-05-21 21:51:01',NULL),(3,1,'2020-05-21 21:51:11',NULL),(3,1,'2020-05-21 21:51:21',NULL),(3,1,'2020-05-21 21:51:31',NULL),(3,1,'2020-05-21 21:51:42',NULL),(3,1,'2020-05-21 21:51:51',NULL),(3,1,'2020-05-21 21:52:01',NULL),(3,1,'2020-05-21 21:52:11',NULL),(3,1,'2020-05-21 21:52:21',NULL),(3,1,'2020-05-21 21:52:30',NULL),(3,1,'2020-05-21 21:52:41',NULL),(3,1,'2020-05-21 21:52:51',NULL),(3,1,'2020-05-21 21:53:01',NULL),(3,1,'2020-05-21 21:53:11',NULL),(3,1,'2020-05-21 21:53:14',NULL),(3,1,'2020-05-21 21:53:16',NULL),(3,1,'2020-05-21 21:53:20',NULL),(3,1,'2020-05-21 21:53:30',NULL),(3,1,'2020-05-21 21:53:40',NULL),(3,1,'2020-05-21 21:53:50',NULL),(3,1,'2020-05-21 21:54:01',NULL),(3,1,'2020-05-21 21:54:11',NULL),(3,1,'2020-05-21 21:54:21',NULL),(3,1,'2020-05-21 21:54:31',NULL),(3,1,'2020-05-21 21:54:41',NULL),(3,1,'2020-05-21 21:54:51',NULL),(3,1,'2020-05-21 21:55:01',NULL),(3,1,'2020-05-21 21:55:11',NULL),(3,1,'2020-05-21 21:55:21',NULL),(3,1,'2020-05-21 21:55:31',NULL),(3,1,'2020-05-21 21:55:41',NULL),(3,1,'2020-05-21 21:55:51',NULL),(3,1,'2020-05-21 21:56:01',NULL),(3,1,'2020-05-21 21:56:11',NULL),(3,1,'2020-05-21 21:56:21',NULL),(3,1,'2020-05-21 21:56:31',NULL),(3,1,'2020-05-21 21:56:41',NULL),(3,1,'2020-05-21 21:56:50',NULL),(3,1,'2020-05-21 21:57:01',NULL),(3,1,'2020-05-21 21:57:11',NULL),(3,1,'2020-05-21 21:57:21',NULL),(3,1,'2020-05-21 21:57:31',NULL),(3,1,'2020-05-21 21:57:41',NULL),(3,1,'2020-05-21 21:57:51',NULL),(3,1,'2020-05-21 21:58:00',NULL),(3,1,'2020-05-21 21:58:11',NULL),(3,1,'2020-05-21 21:58:21',NULL),(3,1,'2020-05-21 21:58:31',NULL),(3,1,'2020-05-21 21:58:41',NULL),(3,1,'2020-05-21 21:58:50',NULL),(3,1,'2020-05-21 21:59:00',NULL),(3,1,'2020-05-21 21:59:10',NULL),(3,1,'2020-05-21 21:59:21',NULL),(3,1,'2020-05-21 21:59:31',NULL),(3,1,'2020-05-21 21:59:41',NULL),(3,1,'2020-05-21 21:59:51',NULL),(3,1,'2020-05-21 22:00:01',NULL),(3,1,'2020-05-21 22:00:11',NULL),(3,1,'2020-05-21 22:00:21',NULL),(3,1,'2020-05-21 22:00:31',NULL),(3,1,'2020-05-21 22:00:41',NULL),(3,1,'2020-05-21 22:00:50',NULL),(3,1,'2020-05-21 22:01:00',NULL),(3,1,'2020-05-21 22:01:11',NULL),(3,1,'2020-05-21 22:01:21',NULL),(3,1,'2020-05-21 22:01:31',NULL),(3,1,'2020-05-21 22:01:40',NULL),(3,1,'2020-05-21 22:01:51',NULL),(3,1,'2020-05-21 22:02:01',NULL),(3,1,'2020-05-21 22:02:10',NULL),(3,1,'2020-05-21 22:02:20',NULL),(3,1,'2020-05-21 22:02:31',NULL),(3,1,'2020-05-21 22:02:41',NULL),(3,1,'2020-05-21 22:02:51',NULL),(3,1,'2020-05-21 22:03:01',NULL),(3,1,'2020-05-21 22:03:10',NULL),(3,14,'2020-05-21 22:03:17',NULL),(3,1,'2020-05-21 22:03:20',NULL),(3,14,'2020-05-21 22:03:28',NULL),(3,1,'2020-05-21 22:03:30',NULL),(3,14,'2020-05-21 22:03:38',NULL),(3,1,'2020-05-21 22:03:40',NULL),(3,14,'2020-05-21 22:03:48',NULL),(3,1,'2020-05-21 22:03:50',NULL),(3,14,'2020-05-21 22:03:56',NULL),(3,1,'2020-05-21 22:04:00',NULL),(3,14,'2020-05-21 22:04:06',NULL),(3,1,'2020-05-21 22:04:10',NULL),(3,14,'2020-05-21 22:04:16',NULL),(3,1,'2020-05-21 22:04:20',NULL),(3,14,'2020-05-21 22:04:26',NULL),(3,1,'2020-05-21 22:04:30',NULL),(3,14,'2020-05-21 22:04:36',NULL),(3,1,'2020-05-21 22:04:40',NULL),(3,14,'2020-05-21 22:04:46',NULL),(3,1,'2020-05-21 22:04:51',NULL),(3,14,'2020-05-21 22:04:56',NULL),(3,14,'2020-05-21 22:05:06',NULL),(3,14,'2020-05-21 22:05:16',NULL),(3,14,'2020-05-21 22:05:26',NULL),(3,14,'2020-05-21 22:05:36',NULL),(3,14,'2020-05-21 22:05:46',NULL),(3,14,'2020-05-21 22:05:56',NULL),(3,14,'2020-05-21 22:06:06',NULL),(3,14,'2020-05-21 22:06:16',NULL),(3,14,'2020-05-21 22:06:26',NULL),(3,14,'2020-05-21 22:06:36',NULL),(3,14,'2020-05-21 22:06:46',NULL),(3,14,'2020-05-21 22:06:56',NULL),(3,14,'2020-05-21 22:07:06',NULL),(3,1,'2020-05-21 22:07:18',NULL),(3,1,'2020-05-21 22:07:29',NULL),(3,1,'2020-05-21 22:07:39',NULL),(3,1,'2020-05-21 22:07:49',NULL),(3,1,'2020-05-21 22:07:59',NULL),(3,1,'2020-05-21 22:08:09',NULL),(3,1,'2020-05-21 22:08:19',NULL),(3,1,'2020-05-21 22:08:29',NULL),(3,1,'2020-05-21 22:08:39',NULL),(3,1,'2020-05-21 22:08:49',NULL),(3,1,'2020-05-21 22:08:59',NULL),(3,1,'2020-05-21 22:09:09',NULL),(3,1,'2020-05-21 22:09:19',NULL),(3,1,'2020-05-21 22:09:29',NULL),(3,1,'2020-05-21 22:09:39',NULL),(3,1,'2020-05-21 22:09:49',NULL),(3,1,'2020-05-21 22:09:59',NULL),(3,1,'2020-05-21 22:10:09',NULL),(3,1,'2020-05-21 22:10:19',NULL),(3,1,'2020-05-21 22:10:29',NULL),(3,1,'2020-05-21 22:10:39',NULL),(3,1,'2020-05-21 22:10:49',NULL),(3,1,'2020-05-21 22:10:59',NULL),(3,1,'2020-05-21 22:11:09',NULL),(3,1,'2020-05-21 22:11:18',NULL),(3,1,'2020-05-21 22:11:29',NULL),(3,1,'2020-05-21 22:11:38',NULL),(3,1,'2020-05-21 22:11:48',NULL),(3,1,'2020-05-21 22:11:58',NULL),(3,1,'2020-05-21 22:12:09',NULL),(3,1,'2020-05-21 22:12:19',NULL),(3,1,'2020-05-21 22:12:29',NULL),(3,1,'2020-05-21 22:12:39',NULL),(3,1,'2020-05-21 22:12:49',NULL),(3,1,'2020-05-21 22:12:59',NULL),(3,1,'2020-05-21 22:13:09',NULL),(3,1,'2020-05-21 22:13:19',NULL),(3,1,'2020-05-21 22:13:21',NULL),(3,1,'2020-05-21 22:13:31',NULL),(3,1,'2020-05-21 22:13:33',NULL),(3,1,'2020-05-21 22:13:34',NULL),(3,1,'2020-05-21 22:13:43',NULL),(3,1,'2020-05-21 22:13:46',NULL),(3,1,'2020-05-21 22:13:56',NULL),(3,1,'2020-05-21 22:14:06',NULL),(3,1,'2020-05-21 22:14:17',NULL),(3,1,'2020-05-21 22:14:27',NULL),(3,1,'2020-05-21 22:14:37',NULL),(3,1,'2020-05-21 22:14:47',NULL),(3,1,'2020-05-21 22:14:57',NULL),(3,1,'2020-05-21 22:15:07',NULL),(3,1,'2020-05-21 22:15:17',NULL),(3,1,'2020-05-21 22:15:26',NULL),(3,1,'2020-05-21 22:15:36',NULL),(3,1,'2020-05-21 22:15:47',NULL),(3,1,'2020-05-21 22:15:57',NULL),(3,1,'2020-05-21 22:16:07',NULL),(3,1,'2020-05-21 22:16:17',NULL),(3,1,'2020-05-21 22:16:27',NULL),(3,1,'2020-05-21 22:16:37',NULL),(3,1,'2020-05-21 22:16:46',NULL),(3,1,'2020-05-21 22:16:56',NULL),(3,1,'2020-05-21 22:17:07',NULL),(3,1,'2020-05-21 22:17:17',NULL),(3,1,'2020-05-21 22:17:27',NULL),(3,1,'2020-05-21 22:17:37',NULL),(3,1,'2020-05-21 22:17:47',NULL),(3,16,'2020-05-21 22:17:55',NULL),(3,1,'2020-05-21 22:17:57',NULL),(3,1,'2020-05-21 22:18:07',NULL),(3,16,'2020-05-21 22:18:15',NULL),(3,1,'2020-05-21 22:18:17',NULL),(3,1,'2020-05-21 22:18:27',NULL),(3,16,'2020-05-21 22:18:32',NULL),(3,1,'2020-05-21 22:18:37',NULL),(3,16,'2020-05-21 22:18:39',NULL),(3,16,'2020-05-21 22:18:44',NULL),(3,1,'2020-05-21 22:18:47',NULL),(3,16,'2020-05-21 22:18:47',NULL),(3,1,'2020-05-21 22:18:57',NULL),(3,16,'2020-05-21 22:18:58',NULL),(3,1,'2020-05-21 22:19:07',NULL),(3,16,'2020-05-21 22:19:10',NULL),(3,16,'2020-05-21 22:19:12',NULL),(3,1,'2020-05-21 22:19:17',NULL),(3,16,'2020-05-21 22:19:22',NULL),(3,16,'2020-05-21 22:19:23',NULL),(3,1,'2020-05-21 22:19:27',NULL),(3,16,'2020-05-21 22:19:34',NULL),(3,1,'2020-05-21 22:19:37',NULL),(3,16,'2020-05-21 22:19:44',NULL),(3,1,'2020-05-21 22:19:47',NULL),(3,16,'2020-05-21 22:19:54',NULL),(3,1,'2020-05-21 22:19:57',NULL),(3,16,'2020-05-21 22:20:04',NULL),(3,1,'2020-05-21 22:20:07',NULL),(3,16,'2020-05-21 22:20:15',NULL),(3,1,'2020-05-21 22:20:17',NULL),(3,1,'2020-05-21 22:20:27',NULL),(3,16,'2020-05-21 22:20:28',NULL),(3,1,'2020-05-21 22:20:37',NULL),(3,16,'2020-05-21 22:20:38',NULL),(3,16,'2020-05-21 22:20:41',NULL),(3,16,'2020-05-21 22:20:45',NULL),(3,1,'2020-05-21 22:20:47',NULL),(3,16,'2020-05-21 22:20:54',NULL),(3,1,'2020-05-21 22:20:57',NULL),(3,16,'2020-05-21 22:21:05',NULL),(3,1,'2020-05-21 22:21:07',NULL),(3,16,'2020-05-21 22:21:15',NULL),(3,1,'2020-05-21 22:21:16',NULL),(3,16,'2020-05-21 22:21:25',NULL),(3,1,'2020-05-21 22:21:26',NULL),(3,16,'2020-05-21 22:21:35',NULL),(3,1,'2020-05-21 22:21:36',NULL),(3,16,'2020-05-21 22:21:40',NULL),(3,1,'2020-05-21 22:21:46',NULL),(3,16,'2020-05-21 22:21:48',NULL),(3,1,'2020-05-21 22:21:57',NULL),(3,16,'2020-05-21 22:21:58',NULL),(3,1,'2020-05-21 22:22:07',NULL),(3,16,'2020-05-21 22:22:08',NULL),(3,1,'2020-05-21 22:22:17',NULL),(3,16,'2020-05-21 22:22:22',NULL),(3,1,'2020-05-21 22:22:27',NULL),(3,1,'2020-05-21 22:22:37',NULL),(3,1,'2020-05-21 22:22:47',NULL),(3,1,'2020-05-21 22:22:57',NULL),(3,16,'2020-05-21 22:23:03',NULL),(3,1,'2020-05-21 22:23:07',NULL),(3,1,'2020-05-21 22:23:17',NULL),(3,1,'2020-05-21 22:23:27',NULL),(3,16,'2020-05-21 22:23:36',NULL),(3,1,'2020-05-21 22:23:37',NULL),(3,1,'2020-05-21 22:23:47',NULL),(3,16,'2020-05-21 22:23:55',NULL),(3,1,'2020-05-21 22:23:57',NULL),(3,1,'2020-05-21 22:24:07',NULL),(3,1,'2020-05-21 22:24:17',NULL),(3,16,'2020-05-21 22:24:20',NULL),(3,1,'2020-05-21 22:24:27',NULL),(3,1,'2020-05-21 22:24:37',NULL),(3,16,'2020-05-21 22:24:40',NULL),(3,1,'2020-05-21 22:24:47',NULL),(3,1,'2020-05-21 22:24:57',NULL),(3,16,'2020-05-21 22:25:02',NULL),(3,1,'2020-05-21 22:25:07',NULL),(3,16,'2020-05-21 22:25:07',NULL),(3,1,'2020-05-21 22:25:17',NULL),(3,16,'2020-05-21 22:25:18',NULL),(3,1,'2020-05-21 22:25:27',NULL),(3,16,'2020-05-21 22:25:28',NULL),(3,1,'2020-05-21 22:25:37',NULL),(3,16,'2020-05-21 22:25:38',NULL),(3,1,'2020-05-21 22:25:47',NULL),(3,16,'2020-05-21 22:25:48',NULL),(3,1,'2020-05-21 22:25:57',NULL),(3,16,'2020-05-21 22:25:58',NULL),(3,1,'2020-05-21 22:26:07',NULL),(3,16,'2020-05-21 22:26:08',NULL),(3,1,'2020-05-21 22:26:17',NULL),(3,16,'2020-05-21 22:26:18',NULL),(3,1,'2020-05-21 22:26:27',NULL),(3,16,'2020-05-21 22:26:28',NULL),(3,1,'2020-05-21 22:26:37',NULL),(3,16,'2020-05-21 22:26:38',NULL),(3,1,'2020-05-21 22:26:47',NULL),(3,16,'2020-05-21 22:26:48',NULL),(3,1,'2020-05-21 22:26:57',NULL),(3,16,'2020-05-21 22:26:58',NULL),(3,1,'2020-05-21 22:27:07',NULL),(3,16,'2020-05-21 22:27:07',NULL),(3,1,'2020-05-21 22:27:17',NULL),(3,16,'2020-05-21 22:27:18',NULL),(3,1,'2020-05-21 22:27:27',NULL),(3,16,'2020-05-21 22:27:28',NULL),(3,1,'2020-05-21 22:27:37',NULL),(3,16,'2020-05-21 22:27:38',NULL),(3,1,'2020-05-21 22:27:47',NULL),(3,16,'2020-05-21 22:27:48',NULL),(3,1,'2020-05-21 22:27:57',NULL),(3,16,'2020-05-21 22:27:58',NULL),(3,1,'2020-05-21 22:28:07',NULL),(3,16,'2020-05-21 22:28:08',NULL),(3,1,'2020-05-21 22:28:17',NULL),(3,16,'2020-05-21 22:28:18',NULL),(3,1,'2020-05-21 22:28:27',NULL),(3,16,'2020-05-21 22:28:28',NULL),(3,1,'2020-05-21 22:28:37',NULL),(3,16,'2020-05-21 22:28:38',NULL),(3,1,'2020-05-21 22:28:47',NULL),(3,16,'2020-05-21 22:28:48',NULL),(3,1,'2020-05-21 22:28:57',NULL),(3,16,'2020-05-21 22:28:57',NULL),(3,1,'2020-05-21 22:29:07',NULL),(3,16,'2020-05-21 22:29:08',NULL),(3,1,'2020-05-21 22:29:17',NULL),(3,16,'2020-05-21 22:29:18',NULL),(3,1,'2020-05-21 22:29:27',NULL),(3,16,'2020-05-21 22:29:28',NULL),(3,1,'2020-05-21 22:29:37',NULL),(3,16,'2020-05-21 22:29:38',NULL),(3,1,'2020-05-21 22:29:47',NULL),(3,16,'2020-05-21 22:29:48',NULL),(3,1,'2020-05-21 22:29:57',NULL),(3,16,'2020-05-21 22:29:58',NULL),(3,1,'2020-05-21 22:30:07',NULL),(3,16,'2020-05-21 22:30:08',NULL),(3,1,'2020-05-21 22:30:17',NULL),(3,1,'2020-05-21 22:30:27',NULL),(3,1,'2020-05-21 22:30:37',NULL),(3,1,'2020-05-21 22:30:47',NULL),(3,1,'2020-05-21 22:30:57',NULL),(3,1,'2020-05-21 22:31:07',NULL),(3,1,'2020-05-21 22:31:17',NULL),(3,1,'2020-05-21 22:31:27',NULL),(3,1,'2020-05-21 22:31:37',NULL),(3,1,'2020-05-21 22:31:47',NULL),(3,1,'2020-05-21 22:31:57',NULL),(3,1,'2020-05-21 22:32:07',NULL),(3,1,'2020-05-21 22:32:17',NULL),(3,1,'2020-05-21 22:32:27',NULL),(3,1,'2020-05-21 22:32:37',NULL),(3,1,'2020-05-21 22:32:47',NULL),(3,1,'2020-05-21 22:32:57',NULL),(3,1,'2020-05-21 22:33:07',NULL),(3,1,'2020-05-21 22:33:17',NULL),(3,1,'2020-05-21 22:33:27',NULL),(3,1,'2020-05-21 22:33:37',NULL),(3,1,'2020-05-21 22:33:47',NULL),(3,1,'2020-05-21 22:33:57',NULL),(3,1,'2020-05-21 22:34:07',NULL),(3,1,'2020-05-21 22:34:17',NULL),(3,1,'2020-05-21 22:34:27',NULL),(3,1,'2020-05-21 22:34:37',NULL),(3,1,'2020-05-21 22:34:47',NULL),(3,1,'2020-05-21 22:34:57',NULL),(3,1,'2020-05-21 22:35:07',NULL),(3,1,'2020-05-21 22:35:17',NULL),(3,1,'2020-05-21 22:35:27',NULL),(3,1,'2020-05-21 22:35:37',NULL),(3,1,'2020-05-21 22:35:47',NULL),(3,1,'2020-05-21 22:35:57',NULL),(3,1,'2020-05-21 22:36:07',NULL),(3,1,'2020-05-21 22:36:17',NULL),(3,1,'2020-05-21 22:36:27',NULL),(3,1,'2020-05-21 22:36:37',NULL),(3,1,'2020-05-21 22:36:47',NULL),(3,1,'2020-05-21 22:36:57',NULL),(3,1,'2020-05-21 22:37:07',NULL),(3,1,'2020-05-21 22:37:17',NULL),(3,1,'2020-05-21 22:37:27',NULL),(3,1,'2020-05-21 22:37:37',NULL),(3,1,'2020-05-21 22:37:47',NULL),(3,1,'2020-05-21 22:37:57',NULL),(3,1,'2020-05-21 22:38:07',NULL),(3,1,'2020-05-21 22:38:17',NULL),(3,1,'2020-05-21 22:38:27',NULL),(3,1,'2020-05-21 22:38:37',NULL),(3,1,'2020-05-21 22:38:47',NULL),(3,1,'2020-05-21 22:38:57',NULL),(3,1,'2020-05-21 22:39:07',NULL),(3,1,'2020-05-21 22:39:17',NULL),(3,1,'2020-05-21 22:39:27',NULL),(3,1,'2020-05-21 22:39:37',NULL),(3,1,'2020-05-21 22:39:47',NULL),(3,1,'2020-05-21 22:39:57',NULL),(3,1,'2020-05-21 22:40:07',NULL),(3,1,'2020-05-21 22:40:17',NULL),(3,1,'2020-05-21 22:40:27',NULL),(3,1,'2020-05-21 22:40:37',NULL),(3,1,'2020-05-21 22:40:47',NULL),(3,1,'2020-05-21 22:40:57',NULL),(3,1,'2020-05-21 22:41:07',NULL),(3,1,'2020-05-21 22:41:17',NULL),(3,1,'2020-05-21 22:41:27',NULL),(3,1,'2020-05-21 22:41:37',NULL),(3,1,'2020-05-21 22:41:47',NULL),(3,1,'2020-05-21 22:41:57',NULL),(3,1,'2020-05-21 22:42:07',NULL),(3,1,'2020-05-21 22:42:17',NULL),(3,1,'2020-05-21 22:42:27',NULL),(3,1,'2020-05-21 22:42:35',NULL),(3,1,'2020-05-21 22:42:45',NULL),(3,1,'2020-05-21 22:42:56',NULL),(3,1,'2020-05-21 22:43:06',NULL),(3,1,'2020-05-21 22:43:12',NULL),(3,1,'2020-05-21 22:43:17',NULL),(3,1,'2020-05-21 22:43:28',NULL),(3,1,'2020-05-21 22:43:38',NULL),(3,1,'2020-05-21 22:43:47',NULL),(3,1,'2020-05-21 22:43:51',NULL),(3,1,'2020-05-21 22:43:57',NULL),(3,1,'2020-05-21 22:44:03',NULL),(3,1,'2020-05-21 22:44:07',NULL),(3,1,'2020-05-21 22:44:18',NULL),(3,1,'2020-05-21 22:44:28',NULL),(3,1,'2020-05-21 22:44:38',NULL),(3,1,'2020-05-21 22:44:48',NULL),(3,1,'2020-05-21 22:44:58',NULL),(3,1,'2020-05-21 22:45:08',NULL),(3,1,'2020-05-21 22:45:18',NULL),(3,1,'2020-05-21 22:45:28',NULL),(3,1,'2020-05-21 22:45:38',NULL),(3,1,'2020-05-21 22:45:48',NULL),(3,1,'2020-05-21 22:45:58',NULL),(3,1,'2020-05-21 22:46:08',NULL),(3,1,'2020-05-21 22:46:18',NULL),(3,1,'2020-05-21 22:46:28',NULL),(3,1,'2020-05-21 22:46:38',NULL),(3,1,'2020-05-21 22:46:48',NULL),(3,1,'2020-05-21 22:46:58',NULL),(3,1,'2020-05-21 22:47:08',NULL),(3,1,'2020-05-21 22:47:18',NULL),(3,1,'2020-05-21 22:47:28',NULL),(3,1,'2020-05-21 22:47:37',NULL),(3,1,'2020-05-21 22:47:47',NULL),(3,1,'2020-05-21 22:47:57',NULL),(3,1,'2020-05-21 22:48:07',NULL),(3,1,'2020-05-21 22:48:18',NULL),(3,1,'2020-05-21 22:48:28',NULL),(3,1,'2020-05-21 22:48:38',NULL),(3,1,'2020-05-21 22:48:48',NULL),(3,1,'2020-05-21 22:48:53',NULL),(3,1,'2020-05-21 22:49:03',NULL),(3,1,'2020-05-21 22:49:10',NULL),(3,1,'2020-05-21 22:49:17',NULL),(3,1,'2020-05-21 22:49:28',NULL),(3,1,'2020-05-21 22:49:39',NULL),(3,1,'2020-05-21 22:49:49',NULL),(3,1,'2020-05-21 22:49:59',NULL),(3,1,'2020-05-21 22:50:09',NULL),(3,1,'2020-05-21 22:50:19',NULL),(3,1,'2020-05-21 22:50:29',NULL),(3,1,'2020-05-21 22:50:39',NULL),(3,1,'2020-05-21 22:50:49',NULL),(3,1,'2020-05-21 22:50:59',NULL),(3,1,'2020-05-21 22:51:09',NULL),(3,1,'2020-05-21 22:51:19',NULL),(3,1,'2020-05-21 22:51:29',NULL),(3,1,'2020-05-21 22:51:38',NULL),(3,1,'2020-05-21 22:51:49',NULL),(3,1,'2020-05-21 22:51:59',NULL),(3,1,'2020-05-21 22:52:09',NULL),(3,1,'2020-05-21 22:52:19',NULL),(3,1,'2020-05-21 22:52:29',NULL),(3,1,'2020-05-21 22:52:39',NULL),(3,1,'2020-05-21 22:52:49',NULL),(3,1,'2020-05-21 22:52:59',NULL),(3,1,'2020-05-21 22:53:09',NULL),(3,1,'2020-05-21 22:53:19',NULL),(3,1,'2020-05-21 22:53:29',NULL),(3,1,'2020-05-21 22:53:39',NULL),(3,1,'2020-05-21 22:53:49',NULL),(3,1,'2020-05-21 22:53:59',NULL),(3,1,'2020-05-21 22:54:09',NULL),(3,1,'2020-05-21 22:54:19',NULL),(3,1,'2020-05-21 22:54:29',NULL),(3,1,'2020-05-21 22:54:39',NULL),(3,1,'2020-05-21 22:54:49',NULL),(3,1,'2020-05-21 22:54:59',NULL),(3,1,'2020-05-21 22:55:09',NULL),(3,1,'2020-05-21 22:55:19',NULL),(3,1,'2020-05-21 22:55:29',NULL),(3,1,'2020-05-21 22:55:39',NULL),(3,1,'2020-05-21 22:55:49',NULL),(3,1,'2020-05-21 22:55:59',NULL),(3,1,'2020-05-21 22:56:09',NULL),(3,1,'2020-05-21 22:56:19',NULL),(3,1,'2020-05-21 22:56:29',NULL),(3,1,'2020-05-21 22:56:39',NULL),(3,1,'2020-05-21 22:56:49',NULL),(3,1,'2020-05-21 22:56:59',NULL),(3,1,'2020-05-21 22:57:09',NULL),(3,1,'2020-05-21 22:57:18',NULL),(3,1,'2020-05-21 22:57:28',NULL),(3,1,'2020-05-21 22:57:39',NULL),(3,1,'2020-05-21 22:57:48',NULL),(3,1,'2020-05-21 22:57:58',NULL),(3,1,'2020-05-21 22:58:08',NULL),(3,1,'2020-05-21 22:58:18',NULL),(3,1,'2020-05-21 22:58:29',NULL),(3,1,'2020-05-21 22:58:39',NULL),(3,1,'2020-05-21 22:58:49',NULL),(3,1,'2020-05-21 22:58:59',NULL),(3,1,'2020-05-21 22:59:09',NULL),(3,1,'2020-05-21 22:59:19',NULL),(3,1,'2020-05-21 22:59:29',NULL),(3,1,'2020-05-21 22:59:39',NULL),(3,1,'2020-05-21 22:59:49',NULL),(3,1,'2020-05-21 22:59:59',NULL),(3,1,'2020-05-21 23:00:09',NULL),(3,1,'2020-05-21 23:00:19',NULL),(3,1,'2020-05-21 23:00:29',NULL),(3,1,'2020-05-21 23:00:39',NULL),(3,1,'2020-05-21 23:00:49',NULL),(3,1,'2020-05-21 23:00:59',NULL),(3,1,'2020-05-21 23:01:08',NULL),(3,1,'2020-05-21 23:01:18',NULL),(3,1,'2020-05-21 23:01:28',NULL),(3,1,'2020-05-21 23:01:38',NULL),(3,1,'2020-05-21 23:01:48',NULL),(3,1,'2020-05-21 23:01:58',NULL),(3,1,'2020-05-21 23:02:09',NULL),(3,1,'2020-05-21 23:02:19',NULL),(3,1,'2020-05-21 23:02:29',NULL),(3,1,'2020-05-21 23:02:39',NULL),(3,1,'2020-05-21 23:02:48',NULL),(3,1,'2020-05-21 23:02:58',NULL),(3,1,'2020-05-21 23:03:08',NULL),(3,1,'2020-05-21 23:03:18',NULL),(3,1,'2020-05-21 23:03:28',NULL),(3,1,'2020-05-21 23:03:38',NULL),(3,1,'2020-05-21 23:03:48',NULL),(3,1,'2020-05-21 23:03:58',NULL),(3,1,'2020-05-21 23:04:08',NULL),(3,1,'2020-05-21 23:04:18',NULL),(3,1,'2020-05-21 23:04:28',NULL),(3,1,'2020-05-21 23:04:38',NULL),(3,1,'2020-05-21 23:04:49',NULL),(3,1,'2020-05-21 23:04:49',NULL),(3,1,'2020-05-21 23:04:52',NULL),(3,1,'2020-05-21 23:04:58',NULL),(3,1,'2020-05-21 23:05:08',NULL),(3,1,'2020-05-21 23:05:18',NULL),(3,1,'2020-05-21 23:05:28',NULL),(3,1,'2020-05-21 23:05:38',NULL),(3,1,'2020-05-21 23:05:48',NULL),(3,1,'2020-05-21 23:05:59',NULL),(3,1,'2020-05-21 23:06:09',NULL),(3,1,'2020-05-21 23:06:18',NULL),(3,1,'2020-05-21 23:06:28',NULL),(3,1,'2020-05-21 23:06:38',NULL),(3,1,'2020-05-21 23:06:48',NULL),(3,1,'2020-05-21 23:06:58',NULL),(3,1,'2020-05-21 23:07:08',NULL),(3,1,'2020-05-21 23:07:18',NULL),(3,1,'2020-05-21 23:07:28',NULL),(3,1,'2020-05-21 23:07:38',NULL),(3,1,'2020-05-21 23:07:48',NULL),(3,1,'2020-05-21 23:07:58',NULL),(3,1,'2020-05-21 23:08:08',NULL),(3,1,'2020-05-21 23:08:18',NULL),(3,1,'2020-05-21 23:08:28',NULL),(3,1,'2020-05-21 23:08:38',NULL),(3,1,'2020-05-21 23:08:48',NULL),(3,1,'2020-05-21 23:08:58',NULL),(3,1,'2020-05-21 23:09:08',NULL),(3,1,'2020-05-21 23:09:18',NULL),(3,1,'2020-05-21 23:09:28',NULL),(3,1,'2020-05-21 23:09:38',NULL),(3,1,'2020-05-21 23:09:48',NULL),(3,1,'2020-05-21 23:09:58',NULL),(3,1,'2020-05-21 23:10:08',NULL),(3,1,'2020-05-21 23:10:18',NULL),(3,1,'2020-05-21 23:10:28',NULL),(3,1,'2020-05-21 23:10:34',NULL),(3,1,'2020-05-21 23:10:45',NULL),(3,1,'2020-05-21 23:10:47',NULL),(3,1,'2020-05-21 23:10:48',NULL),(3,1,'2020-05-21 23:10:57',NULL),(3,1,'2020-05-21 23:11:07',NULL),(3,1,'2020-05-21 23:11:17',NULL),(3,1,'2020-05-21 23:11:27',NULL),(3,1,'2020-05-21 23:11:37',NULL),(3,1,'2020-05-21 23:11:47',NULL),(3,1,'2020-05-21 23:11:57',NULL),(3,1,'2020-05-21 23:12:07',NULL),(3,1,'2020-05-21 23:12:17',NULL),(3,1,'2020-05-21 23:12:27',NULL),(3,1,'2020-05-21 23:12:37',NULL),(3,1,'2020-05-21 23:12:47',NULL),(3,1,'2020-05-21 23:12:57',NULL),(3,1,'2020-05-21 23:13:07',NULL),(3,1,'2020-05-21 23:13:17',NULL),(3,1,'2020-05-21 23:13:27',NULL),(3,1,'2020-05-21 23:13:37',NULL),(3,1,'2020-05-21 23:13:47',NULL),(3,1,'2020-05-21 23:19:43',NULL),(3,1,'2020-05-21 23:19:48',NULL),(3,1,'2020-05-21 23:19:50',NULL),(3,1,'2020-05-21 23:19:55',NULL),(3,1,'2020-05-21 23:20:04',NULL),(3,1,'2020-05-21 23:20:15',NULL),(3,1,'2020-05-21 23:20:24',NULL),(3,1,'2020-05-21 23:20:35',NULL),(3,1,'2020-05-21 23:20:45',NULL),(3,1,'2020-05-21 23:20:55',NULL),(3,1,'2020-05-21 23:21:05',NULL),(3,1,'2020-05-21 23:21:15',NULL),(3,1,'2020-05-21 23:21:25',NULL),(3,1,'2020-05-21 23:21:35',NULL),(3,1,'2020-05-21 23:21:47',NULL),(3,1,'2020-05-21 23:21:55',NULL),(3,1,'2020-05-21 23:22:05',NULL),(3,1,'2020-05-21 23:22:15',NULL),(3,1,'2020-05-21 23:22:25',NULL),(3,1,'2020-05-21 23:22:35',NULL),(3,1,'2020-05-21 23:22:45',NULL),(3,1,'2020-05-21 23:22:55',NULL),(3,1,'2020-05-21 23:23:05',NULL),(3,1,'2020-05-21 23:23:15',NULL),(3,1,'2020-05-21 23:23:24',NULL),(3,1,'2020-05-21 23:23:35',NULL),(3,1,'2020-05-21 23:23:45',NULL),(3,1,'2020-05-21 23:23:55',NULL),(3,1,'2020-05-21 23:24:05',NULL),(3,1,'2020-05-21 23:24:15',NULL),(3,1,'2020-05-21 23:24:25',NULL),(3,1,'2020-05-21 23:24:35',NULL),(3,1,'2020-05-21 23:24:45',NULL),(3,1,'2020-05-21 23:24:55',NULL),(3,1,'2020-05-21 23:25:05',NULL),(3,1,'2020-05-21 23:25:15',NULL),(3,1,'2020-05-21 23:25:25',NULL),(3,1,'2020-05-21 23:25:35',NULL),(3,1,'2020-05-21 23:25:45',NULL),(3,1,'2020-05-21 23:25:55',NULL),(3,1,'2020-05-21 23:26:05',NULL),(3,1,'2020-05-21 23:26:15',NULL),(3,1,'2020-05-21 23:26:25',NULL),(3,1,'2020-05-21 23:26:35',NULL),(3,1,'2020-05-21 23:26:45',NULL),(3,1,'2020-05-21 23:26:55',NULL),(3,1,'2020-05-21 23:27:05',NULL),(3,1,'2020-05-21 23:27:15',NULL),(3,1,'2020-05-21 23:27:25',NULL),(3,1,'2020-05-21 23:27:35',NULL),(3,1,'2020-05-21 23:27:45',NULL),(3,1,'2020-05-21 23:27:55',NULL),(3,1,'2020-05-21 23:28:05',NULL),(3,1,'2020-05-21 23:28:15',NULL),(3,1,'2020-05-21 23:28:25',NULL),(3,1,'2020-05-21 23:28:35',NULL),(3,1,'2020-05-21 23:28:45',NULL),(3,1,'2020-05-21 23:28:55',NULL),(3,1,'2020-05-21 23:29:05',NULL),(3,1,'2020-05-21 23:29:15',NULL),(3,1,'2020-05-21 23:29:25',NULL),(3,1,'2020-05-21 23:29:35',NULL),(3,1,'2020-05-21 23:29:45',NULL),(3,1,'2020-05-21 23:29:55',NULL),(3,1,'2020-05-21 23:30:05',NULL),(3,1,'2020-05-21 23:30:15',NULL),(3,1,'2020-05-21 23:30:25',NULL),(3,1,'2020-05-21 23:30:35',NULL),(3,1,'2020-05-21 23:30:44',NULL),(3,1,'2020-05-21 23:30:54',NULL),(3,1,'2020-05-21 23:31:04',NULL),(3,1,'2020-05-21 23:31:15',NULL),(3,1,'2020-05-21 23:31:25',NULL),(3,1,'2020-05-21 23:31:35',NULL),(3,1,'2020-05-21 23:31:45',NULL),(3,1,'2020-05-21 23:31:45',NULL),(3,1,'2020-05-21 23:31:55',NULL),(3,1,'2020-05-21 23:32:05',NULL),(3,1,'2020-05-21 23:32:15',NULL),(3,1,'2020-05-21 23:32:25',NULL),(3,1,'2020-05-21 23:32:35',NULL),(3,1,'2020-05-21 23:32:37',NULL),(3,1,'2020-05-21 23:32:45',NULL),(3,1,'2020-05-21 23:32:55',NULL),(3,1,'2020-05-21 23:33:05',NULL),(3,1,'2020-05-21 23:33:14',NULL),(3,1,'2020-05-21 23:33:25',NULL),(3,1,'2020-05-21 23:33:35',NULL),(3,1,'2020-05-21 23:33:45',NULL),(3,1,'2020-05-21 23:33:55',NULL),(3,1,'2020-05-21 23:34:05',NULL),(3,1,'2020-05-21 23:34:15',NULL),(3,1,'2020-05-21 23:34:25',NULL),(3,1,'2020-05-21 23:34:35',NULL),(3,1,'2020-05-21 23:34:45',NULL),(3,1,'2020-05-21 23:34:55',NULL),(3,1,'2020-05-21 23:35:05',NULL),(3,1,'2020-05-21 23:35:15',NULL),(3,1,'2020-05-21 23:35:25',NULL),(3,1,'2020-05-21 23:35:35',NULL),(3,1,'2020-05-21 23:35:45',NULL),(3,1,'2020-05-21 23:35:55',NULL),(3,1,'2020-05-21 23:36:05',NULL),(3,1,'2020-05-21 23:36:15',NULL),(3,1,'2020-05-21 23:36:25',NULL),(3,1,'2020-05-21 23:36:35',NULL),(3,1,'2020-05-21 23:36:45',NULL),(3,1,'2020-05-21 23:36:55',NULL),(3,1,'2020-05-21 23:37:05',NULL),(3,1,'2020-05-21 23:37:15',NULL),(3,1,'2020-05-21 23:37:25',NULL),(3,1,'2020-05-21 23:37:35',NULL),(3,1,'2020-05-21 23:37:45',NULL),(3,1,'2020-05-21 23:37:55',NULL),(3,1,'2020-05-21 23:38:05',NULL),(3,1,'2020-05-21 23:38:15',NULL),(3,1,'2020-05-21 23:38:25',NULL),(3,1,'2020-05-21 23:38:35',NULL),(3,1,'2020-05-21 23:38:45',NULL),(3,1,'2020-05-21 23:38:55',NULL),(3,1,'2020-05-21 23:39:05',NULL),(3,1,'2020-05-21 23:39:15',NULL),(3,1,'2020-05-21 23:39:25',NULL),(3,1,'2020-05-21 23:39:35',NULL),(3,1,'2020-05-21 23:39:45',NULL),(3,1,'2020-05-21 23:39:55',NULL),(3,1,'2020-05-21 23:40:05',NULL),(3,1,'2020-05-21 23:40:15',NULL),(3,1,'2020-05-21 23:40:25',NULL),(3,1,'2020-05-21 23:40:35',NULL),(3,1,'2020-05-21 23:40:45',NULL),(3,1,'2020-05-21 23:40:55',NULL),(3,1,'2020-05-21 23:41:05',NULL),(3,1,'2020-05-21 23:41:15',NULL),(3,1,'2020-05-21 23:41:25',NULL),(3,1,'2020-05-21 23:41:35',NULL),(3,1,'2020-05-21 23:41:45',NULL),(3,1,'2020-05-21 23:41:55',NULL),(3,1,'2020-05-21 23:42:05',NULL),(3,1,'2020-05-21 23:42:15',NULL),(3,1,'2020-05-21 23:42:25',NULL),(3,1,'2020-05-21 23:42:35',NULL),(3,1,'2020-05-21 23:42:45',NULL),(3,1,'2020-05-21 23:42:55',NULL),(3,1,'2020-05-21 23:43:05',NULL),(3,1,'2020-05-21 23:43:15',NULL),(3,1,'2020-05-21 23:43:25',NULL),(3,1,'2020-05-21 23:43:35',NULL),(3,1,'2020-05-21 23:43:45',NULL),(3,1,'2020-05-21 23:43:55',NULL),(3,1,'2020-05-21 23:44:05',NULL),(3,1,'2020-05-21 23:44:15',NULL),(3,1,'2020-05-21 23:44:25',NULL),(3,1,'2020-05-21 23:44:35',NULL),(3,1,'2020-05-21 23:44:45',NULL),(3,1,'2020-05-21 23:44:55',NULL),(3,1,'2020-05-21 23:45:05',NULL),(3,1,'2020-05-21 23:45:14',NULL),(3,1,'2020-05-21 23:45:25',NULL),(3,1,'2020-05-21 23:45:35',NULL),(3,1,'2020-05-21 23:45:45',NULL),(3,1,'2020-05-21 23:45:55',NULL),(3,1,'2020-05-21 23:46:05',NULL),(3,1,'2020-05-21 23:46:15',NULL),(3,1,'2020-05-21 23:46:25',NULL),(3,1,'2020-05-21 23:46:35',NULL),(3,1,'2020-05-21 23:46:45',NULL),(3,1,'2020-05-21 23:46:55',NULL),(3,1,'2020-05-21 23:47:05',NULL),(3,1,'2020-05-21 23:47:15',NULL),(3,1,'2020-05-21 23:47:25',NULL),(3,1,'2020-05-21 23:47:34',NULL),(3,1,'2020-05-21 23:47:45',NULL),(3,1,'2020-05-21 23:47:51',NULL),(3,1,'2020-05-21 23:47:53',NULL),(3,1,'2020-05-21 23:47:54',NULL),(3,1,'2020-05-21 23:48:05',NULL),(3,1,'2020-05-21 23:48:15',NULL),(3,1,'2020-05-21 23:48:25',NULL),(3,1,'2020-05-21 23:48:29',NULL),(3,1,'2020-05-21 23:48:35',NULL),(3,1,'2020-05-21 23:48:36',NULL),(3,1,'2020-05-21 23:48:45',NULL),(3,1,'2020-05-21 23:48:55',NULL),(3,1,'2020-05-21 23:49:05',NULL),(3,1,'2020-05-21 23:49:15',NULL),(3,1,'2020-05-21 23:49:25',NULL),(3,1,'2020-05-21 23:49:35',NULL),(3,1,'2020-05-21 23:49:45',NULL),(3,1,'2020-05-21 23:49:55',NULL),(3,1,'2020-05-21 23:50:05',NULL),(3,1,'2020-05-21 23:50:15',NULL),(3,1,'2020-05-21 23:50:25',NULL),(3,1,'2020-05-21 23:50:35',NULL),(3,1,'2020-05-21 23:50:45',NULL),(3,1,'2020-05-21 23:50:55',NULL),(3,1,'2020-05-21 23:51:05',NULL),(3,1,'2020-05-21 23:51:15',NULL),(3,1,'2020-05-21 23:51:25',NULL),(3,1,'2020-05-21 23:51:35',NULL),(3,1,'2020-05-21 23:51:45',NULL),(3,1,'2020-05-21 23:51:55',NULL),(3,1,'2020-05-21 23:52:05',NULL),(3,1,'2020-05-21 23:52:15',NULL),(3,1,'2020-05-21 23:52:25',NULL),(3,1,'2020-05-21 23:52:35',NULL),(3,1,'2020-05-21 23:52:45',NULL),(3,1,'2020-05-21 23:52:55',NULL),(3,1,'2020-05-21 23:53:05',NULL),(3,1,'2020-05-21 23:53:15',NULL),(3,1,'2020-05-21 23:53:25',NULL),(3,1,'2020-05-21 23:53:35',NULL),(3,1,'2020-05-21 23:53:45',NULL),(3,1,'2020-05-21 23:53:55',NULL),(3,1,'2020-05-21 23:54:05',NULL),(3,1,'2020-05-21 23:54:15',NULL),(3,1,'2020-05-21 23:54:25',NULL),(3,1,'2020-05-21 23:54:35',NULL),(3,1,'2020-05-21 23:54:45',NULL),(3,1,'2020-05-21 23:54:55',NULL),(3,1,'2020-05-21 23:55:05',NULL),(3,1,'2020-05-21 23:55:15',NULL),(3,1,'2020-05-21 23:55:25',NULL),(3,1,'2020-05-21 23:55:35',NULL),(3,1,'2020-05-21 23:55:45',NULL),(3,1,'2020-05-21 23:55:55',NULL),(3,1,'2020-05-21 23:56:05',NULL),(3,1,'2020-05-21 23:56:15',NULL),(3,1,'2020-05-21 23:56:25',NULL),(3,1,'2020-05-21 23:56:35',NULL),(3,1,'2020-05-21 23:56:44',NULL),(3,1,'2020-05-21 23:56:54',NULL),(3,1,'2020-05-21 23:57:04',NULL),(3,1,'2020-05-21 23:57:14',NULL),(3,1,'2020-05-21 23:57:24',NULL),(3,1,'2020-05-21 23:57:34',NULL),(3,1,'2020-05-21 23:57:44',NULL),(3,1,'2020-05-21 23:57:54',NULL),(3,1,'2020-05-21 23:58:04',NULL),(3,1,'2020-05-21 23:58:14',NULL),(3,1,'2020-05-21 23:58:25',NULL),(3,1,'2020-05-21 23:58:35',NULL),(3,1,'2020-05-21 23:58:45',NULL),(3,1,'2020-05-21 23:58:55',NULL),(3,1,'2020-05-21 23:59:05',NULL),(3,1,'2020-05-21 23:59:15',NULL),(3,1,'2020-05-21 23:59:25',NULL),(3,1,'2020-05-21 23:59:34',NULL),(3,1,'2020-05-21 23:59:40',NULL),(3,1,'2020-05-21 23:59:45',NULL),(3,1,'2020-05-21 23:59:47',NULL),(3,1,'2020-05-21 23:59:54',NULL),(3,1,'2020-05-22 00:00:04',NULL),(3,1,'2020-05-22 00:00:14',NULL),(3,1,'2020-05-22 00:00:22',NULL),(3,1,'2020-05-22 00:00:24',NULL),(3,1,'2020-05-22 00:00:34',NULL),(3,1,'2020-05-22 00:00:45',NULL),(3,1,'2020-05-22 00:00:54',NULL),(3,1,'2020-05-22 00:01:04',NULL),(3,1,'2020-05-22 00:01:12',NULL),(3,1,'2020-05-22 00:01:24',NULL),(3,1,'2020-05-22 00:01:25',NULL),(3,1,'2020-05-22 00:01:35',NULL),(3,1,'2020-05-22 00:01:45',NULL),(3,1,'2020-05-22 00:01:51',NULL),(3,1,'2020-05-22 00:01:54',NULL),(3,1,'2020-05-22 00:02:05',NULL),(3,1,'2020-05-22 00:02:15',NULL),(3,1,'2020-05-22 00:02:25',NULL),(3,1,'2020-05-22 00:02:34',NULL),(3,1,'2020-05-22 00:02:44',NULL),(3,1,'2020-05-22 00:02:52',NULL),(3,1,'2020-05-22 00:02:54',NULL),(3,1,'2020-05-22 00:02:55',NULL),(3,1,'2020-05-22 00:03:05',NULL),(3,1,'2020-05-22 00:03:06',NULL),(3,1,'2020-05-22 00:03:09',NULL),(3,1,'2020-05-22 00:03:15',NULL),(3,1,'2020-05-22 00:03:25',NULL),(3,1,'2020-05-22 00:03:35',NULL),(3,1,'2020-05-22 00:03:44',NULL),(3,1,'2020-05-22 00:03:54',NULL),(3,1,'2020-05-22 00:04:05',NULL),(3,1,'2020-05-22 00:04:15',NULL),(3,1,'2020-05-22 00:04:24',NULL),(3,1,'2020-05-22 00:04:35',NULL),(3,1,'2020-05-22 00:04:45',NULL),(3,1,'2020-05-22 00:04:55',NULL),(3,1,'2020-05-22 00:05:05',NULL),(3,1,'2020-05-22 00:05:15',NULL),(3,1,'2020-05-22 00:05:25',NULL),(3,1,'2020-05-22 00:05:35',NULL),(3,1,'2020-05-22 00:05:45',NULL),(3,1,'2020-05-22 00:05:55',NULL),(3,1,'2020-05-22 00:06:05',NULL),(3,1,'2020-05-22 00:06:15',NULL),(3,1,'2020-05-22 00:06:25',NULL),(3,1,'2020-05-22 00:06:35',NULL),(3,1,'2020-05-22 00:06:45',NULL),(3,1,'2020-05-22 00:06:55',NULL),(3,1,'2020-05-22 00:07:05',NULL),(3,1,'2020-05-22 00:07:15',NULL),(3,1,'2020-05-22 00:07:25',NULL),(3,1,'2020-05-22 00:07:35',NULL),(3,1,'2020-05-22 00:07:45',NULL),(3,1,'2020-05-22 00:07:55',NULL),(3,1,'2020-05-22 00:08:05',NULL),(3,1,'2020-05-22 00:08:15',NULL),(3,1,'2020-05-22 00:08:25',NULL),(3,1,'2020-05-22 00:08:35',NULL),(3,1,'2020-05-22 00:08:45',NULL),(3,1,'2020-05-22 00:08:55',NULL),(3,1,'2020-05-22 00:09:05',NULL),(3,1,'2020-05-22 00:09:15',NULL),(3,1,'2020-05-22 00:09:25',NULL),(3,1,'2020-05-22 00:09:35',NULL),(3,1,'2020-05-22 00:09:45',NULL),(3,1,'2020-05-22 00:09:55',NULL),(3,1,'2020-05-22 00:10:05',NULL),(3,1,'2020-05-22 00:10:15',NULL),(3,1,'2020-05-22 00:10:25',NULL),(3,1,'2020-05-22 00:10:35',NULL),(3,1,'2020-05-22 00:10:45',NULL),(3,1,'2020-05-22 00:10:55',NULL),(3,1,'2020-05-22 00:11:05',NULL),(3,1,'2020-05-22 00:11:15',NULL),(3,1,'2020-05-22 00:11:25',NULL),(3,1,'2020-05-22 00:11:35',NULL),(3,1,'2020-05-22 00:11:45',NULL),(3,1,'2020-05-22 00:11:54',NULL),(3,1,'2020-05-22 00:12:05',NULL),(3,1,'2020-05-22 00:12:07',NULL),(3,1,'2020-05-22 00:12:09',NULL),(3,1,'2020-05-22 00:12:15',NULL),(3,1,'2020-05-22 00:12:25',NULL),(3,1,'2020-05-22 00:12:35',NULL),(3,1,'2020-05-22 00:12:45',NULL),(3,1,'2020-05-22 00:12:55',NULL),(3,1,'2020-05-22 00:13:05',NULL),(3,1,'2020-05-22 00:13:15',NULL),(3,1,'2020-05-22 00:13:25',NULL),(3,1,'2020-05-22 00:13:35',NULL),(3,1,'2020-05-22 00:13:45',NULL),(3,1,'2020-05-22 00:13:55',NULL),(3,1,'2020-05-22 00:14:05',NULL),(3,1,'2020-05-22 00:14:15',NULL),(3,1,'2020-05-22 00:14:25',NULL),(3,1,'2020-05-22 00:14:35',NULL),(3,1,'2020-05-22 00:14:45',NULL),(3,1,'2020-05-22 00:14:55',NULL),(3,1,'2020-05-22 00:15:05',NULL),(3,1,'2020-05-22 00:15:15',NULL),(3,1,'2020-05-22 00:15:25',NULL),(3,1,'2020-05-22 00:15:35',NULL),(3,1,'2020-05-22 00:15:45',NULL),(3,1,'2020-05-22 00:15:55',NULL),(3,1,'2020-05-22 00:16:05',NULL),(3,1,'2020-05-22 00:16:15',NULL),(3,1,'2020-05-22 00:16:25',NULL),(3,1,'2020-05-22 00:16:35',NULL),(3,1,'2020-05-22 00:16:45',NULL),(3,1,'2020-05-22 00:16:55',NULL),(3,1,'2020-05-22 00:17:05',NULL),(3,1,'2020-05-22 00:17:15',NULL),(3,1,'2020-05-22 00:17:25',NULL),(3,1,'2020-05-22 00:17:35',NULL),(3,1,'2020-05-22 00:17:45',NULL),(3,1,'2020-05-22 00:17:55',NULL),(3,1,'2020-05-22 00:18:05',NULL),(3,1,'2020-05-22 00:18:15',NULL),(3,1,'2020-05-22 00:18:25',NULL),(3,1,'2020-05-22 00:18:35',NULL),(3,1,'2020-05-22 00:18:45',NULL),(3,1,'2020-05-22 00:18:55',NULL),(3,1,'2020-05-22 00:19:05',NULL),(3,1,'2020-05-22 00:19:15',NULL),(3,1,'2020-05-22 00:19:25',NULL),(3,1,'2020-05-22 00:19:35',NULL),(3,1,'2020-05-22 00:19:45',NULL),(3,1,'2020-05-22 00:19:55',NULL),(3,1,'2020-05-22 00:20:05',NULL),(3,1,'2020-05-22 00:20:15',NULL),(3,1,'2020-05-22 00:20:25',NULL),(3,1,'2020-05-22 00:20:35',NULL),(3,1,'2020-05-22 00:20:45',NULL),(3,1,'2020-05-22 00:20:55',NULL),(3,1,'2020-05-22 00:21:05',NULL),(3,1,'2020-05-22 00:21:15',NULL),(3,1,'2020-05-22 00:21:25',NULL),(3,1,'2020-05-22 00:21:35',NULL),(3,1,'2020-05-22 00:21:45',NULL),(3,1,'2020-05-22 00:21:55',NULL),(3,1,'2020-05-22 00:22:05',NULL),(3,1,'2020-05-22 00:22:15',NULL),(3,1,'2020-05-22 00:22:25',NULL),(3,1,'2020-05-22 00:22:35',NULL),(3,1,'2020-05-22 00:22:45',NULL),(3,1,'2020-05-22 00:22:55',NULL),(3,1,'2020-05-22 00:23:05',NULL),(3,1,'2020-05-22 00:23:15',NULL),(3,1,'2020-05-22 00:23:25',NULL),(3,1,'2020-05-22 00:23:35',NULL),(3,1,'2020-05-22 00:23:45',NULL),(3,1,'2020-05-22 00:23:55',NULL),(3,1,'2020-05-22 00:24:05',NULL),(3,1,'2020-05-22 00:24:15',NULL),(3,1,'2020-05-22 00:24:25',NULL),(3,1,'2020-05-22 00:24:35',NULL),(3,1,'2020-05-22 00:24:45',NULL),(3,1,'2020-05-22 00:24:55',NULL),(3,1,'2020-05-22 00:25:05',NULL),(3,1,'2020-05-22 00:25:15',NULL),(3,1,'2020-05-22 00:25:25',NULL),(3,1,'2020-05-22 00:25:35',NULL),(3,1,'2020-05-22 00:25:45',NULL),(3,1,'2020-05-22 00:25:55',NULL),(3,1,'2020-05-22 00:26:05',NULL),(3,1,'2020-05-22 00:26:15',NULL),(3,1,'2020-05-22 00:26:24',NULL),(3,1,'2020-05-22 00:26:35',NULL),(3,1,'2020-05-22 00:26:45',NULL),(3,1,'2020-05-22 00:26:55',NULL),(3,1,'2020-05-22 00:27:05',NULL),(3,1,'2020-05-22 00:27:15',NULL),(3,1,'2020-05-22 00:27:25',NULL),(3,1,'2020-05-22 00:27:35',NULL),(3,1,'2020-05-22 00:27:45',NULL),(3,1,'2020-05-22 00:27:55',NULL),(3,1,'2020-05-22 00:28:05',NULL),(3,1,'2020-05-22 00:28:15',NULL),(3,1,'2020-05-22 00:28:25',NULL),(3,1,'2020-05-22 00:28:35',NULL),(3,1,'2020-05-22 00:28:45',NULL),(3,1,'2020-05-22 00:28:55',NULL),(3,1,'2020-05-22 00:29:05',NULL),(3,1,'2020-05-22 00:29:15',NULL),(3,1,'2020-05-22 00:29:25',NULL),(3,1,'2020-05-22 00:29:35',NULL),(3,1,'2020-05-22 00:29:45',NULL),(3,1,'2020-05-22 00:29:55',NULL),(3,1,'2020-05-22 00:30:05',NULL),(3,1,'2020-05-22 00:30:15',NULL),(3,1,'2020-05-22 00:30:25',NULL),(3,1,'2020-05-22 00:30:35',NULL),(3,1,'2020-05-22 00:30:45',NULL),(3,1,'2020-05-22 00:30:55',NULL),(3,1,'2020-05-22 00:31:05',NULL),(3,1,'2020-05-22 00:31:15',NULL),(3,1,'2020-05-22 00:31:25',NULL),(3,1,'2020-05-22 00:31:35',NULL),(3,1,'2020-05-22 00:31:45',NULL),(3,1,'2020-05-22 00:31:55',NULL),(3,1,'2020-05-22 00:32:05',NULL),(3,1,'2020-05-22 00:32:15',NULL),(3,1,'2020-05-22 00:32:25',NULL),(3,1,'2020-05-22 00:32:35',NULL),(3,1,'2020-05-22 00:32:45',NULL),(3,1,'2020-05-22 00:32:55',NULL),(3,1,'2020-05-22 00:33:05',NULL),(3,1,'2020-05-22 00:33:15',NULL),(3,1,'2020-05-22 00:33:25',NULL),(3,1,'2020-05-22 00:33:35',NULL),(3,1,'2020-05-22 00:33:45',NULL),(3,1,'2020-05-22 00:33:55',NULL),(3,1,'2020-05-22 00:34:05',NULL),(3,1,'2020-05-22 00:34:15',NULL),(3,1,'2020-05-22 00:34:25',NULL),(3,1,'2020-05-22 00:34:35',NULL),(3,1,'2020-05-22 00:34:45',NULL),(3,1,'2020-05-22 00:34:55',NULL),(3,1,'2020-05-22 00:35:05',NULL),(3,1,'2020-05-22 00:35:15',NULL),(3,1,'2020-05-22 00:35:25',NULL),(3,1,'2020-05-22 00:35:35',NULL),(3,1,'2020-05-22 00:35:45',NULL),(3,1,'2020-05-22 00:35:55',NULL),(3,1,'2020-05-22 00:36:05',NULL),(3,1,'2020-05-22 00:36:15',NULL),(3,1,'2020-05-22 00:36:24',NULL),(3,1,'2020-05-22 00:36:34',NULL),(3,1,'2020-05-22 00:36:34',NULL),(3,1,'2020-05-22 00:36:38',NULL),(3,1,'2020-05-22 00:36:45',NULL),(3,1,'2020-05-22 00:36:54',NULL),(3,1,'2020-05-22 00:36:55',NULL),(3,1,'2020-05-22 00:36:56',NULL),(3,1,'2020-05-22 00:37:02',NULL),(3,1,'2020-05-22 00:37:04',NULL),(3,1,'2020-05-22 00:37:05',NULL),(3,1,'2020-05-22 00:37:15',NULL),(3,1,'2020-05-22 00:37:24',NULL),(3,1,'2020-05-22 00:37:34',NULL),(3,1,'2020-05-22 00:37:44',NULL),(3,1,'2020-05-22 00:37:54',NULL),(3,1,'2020-05-22 00:38:05',NULL),(3,1,'2020-05-22 00:38:15',NULL),(3,1,'2020-05-22 00:38:25',NULL),(3,1,'2020-05-22 00:38:35',NULL),(3,1,'2020-05-22 00:38:45',NULL),(3,1,'2020-05-22 00:38:55',NULL),(3,1,'2020-05-22 00:39:05',NULL),(3,1,'2020-05-22 00:39:15',NULL),(3,1,'2020-05-22 00:39:24',NULL),(3,1,'2020-05-22 00:39:34',NULL),(3,1,'2020-05-22 00:39:35',NULL),(3,1,'2020-05-22 00:39:37',NULL),(3,1,'2020-05-22 00:39:45',NULL),(3,1,'2020-05-22 00:39:55',NULL),(3,1,'2020-05-22 00:40:05',NULL),(3,1,'2020-05-22 00:40:15',NULL),(3,1,'2020-05-22 00:40:25',NULL),(3,1,'2020-05-22 00:40:35',NULL),(3,1,'2020-05-22 00:40:45',NULL),(3,1,'2020-05-22 00:40:55',NULL),(3,1,'2020-05-22 00:41:05',NULL),(3,1,'2020-05-22 00:41:16',NULL),(3,1,'2020-05-22 00:41:25',NULL),(3,1,'2020-05-22 00:41:35',NULL),(3,1,'2020-05-22 00:41:45',NULL),(3,1,'2020-05-22 00:41:55',NULL),(3,1,'2020-05-22 00:42:05',NULL),(3,1,'2020-05-22 00:42:15',NULL),(3,1,'2020-05-22 00:42:25',NULL),(3,1,'2020-05-22 00:42:35',NULL),(3,1,'2020-05-22 00:42:45',NULL),(3,1,'2020-05-22 00:42:55',NULL),(3,1,'2020-05-22 00:43:05',NULL),(3,1,'2020-05-22 00:43:15',NULL),(3,1,'2020-05-22 00:43:25',NULL),(3,1,'2020-05-22 00:43:35',NULL),(3,1,'2020-05-22 00:43:45',NULL),(3,1,'2020-05-22 00:43:55',NULL),(3,1,'2020-05-22 00:44:05',NULL),(3,1,'2020-05-22 00:44:15',NULL),(3,1,'2020-05-22 00:44:25',NULL),(3,1,'2020-05-22 00:44:35',NULL),(3,1,'2020-05-22 00:44:45',NULL),(3,1,'2020-05-22 00:44:55',NULL),(3,1,'2020-05-22 00:45:05',NULL),(3,1,'2020-05-22 00:45:09',NULL),(3,1,'2020-05-22 00:45:10',NULL),(3,1,'2020-05-22 00:45:15',NULL),(3,1,'2020-05-22 00:45:24',NULL),(3,1,'2020-05-22 00:45:34',NULL),(3,1,'2020-05-22 00:45:44',NULL),(3,1,'2020-05-22 00:45:55',NULL),(3,1,'2020-05-22 00:46:05',NULL),(3,1,'2020-05-22 00:46:15',NULL),(3,1,'2020-05-22 00:46:25',NULL),(3,1,'2020-05-22 00:46:34',NULL),(3,1,'2020-05-22 00:46:45',NULL),(3,1,'2020-05-22 00:46:55',NULL),(3,1,'2020-05-22 00:47:05',NULL),(3,1,'2020-05-22 00:47:15',NULL),(3,1,'2020-05-22 00:47:25',NULL),(3,1,'2020-05-22 00:47:35',NULL),(3,1,'2020-05-22 00:47:45',NULL),(3,1,'2020-05-22 00:47:55',NULL),(3,1,'2020-05-22 00:48:05',NULL),(3,1,'2020-05-22 00:48:15',NULL),(3,1,'2020-05-22 00:48:25',NULL),(3,1,'2020-05-22 00:48:35',NULL),(3,1,'2020-05-22 00:48:45',NULL),(3,1,'2020-05-22 00:48:55',NULL),(3,1,'2020-05-22 00:49:05',NULL),(3,1,'2020-05-22 00:49:15',NULL),(3,1,'2020-05-22 00:49:21',NULL),(3,1,'2020-05-22 00:49:24',NULL),(3,1,'2020-05-22 00:49:24',NULL),(3,1,'2020-05-22 00:49:34',NULL),(3,1,'2020-05-22 00:49:45',NULL),(3,1,'2020-05-22 00:49:55',NULL),(3,1,'2020-05-22 00:50:05',NULL),(3,1,'2020-05-22 00:50:15',NULL),(3,1,'2020-05-22 00:50:25',NULL),(3,1,'2020-05-22 00:50:35',NULL),(3,1,'2020-05-22 00:50:45',NULL),(3,1,'2020-05-22 00:50:55',NULL),(3,1,'2020-05-22 00:51:05',NULL),(3,1,'2020-05-22 00:51:15',NULL),(3,1,'2020-05-22 00:51:25',NULL),(3,1,'2020-05-22 00:51:35',NULL),(3,1,'2020-05-22 00:51:45',NULL),(3,1,'2020-05-22 00:51:55',NULL),(3,1,'2020-05-22 00:52:05',NULL),(3,1,'2020-05-22 00:52:15',NULL),(3,1,'2020-05-22 00:52:25',NULL),(3,1,'2020-05-22 00:52:35',NULL),(3,1,'2020-05-22 00:52:45',NULL),(3,1,'2020-05-22 00:52:55',NULL),(3,1,'2020-05-22 00:53:05',NULL),(3,1,'2020-05-22 00:53:15',NULL),(3,1,'2020-05-22 00:53:25',NULL),(3,1,'2020-05-22 00:53:35',NULL),(3,1,'2020-05-22 00:53:45',NULL),(3,1,'2020-05-22 00:53:55',NULL),(3,1,'2020-05-22 00:54:05',NULL),(3,1,'2020-05-22 00:54:15',NULL),(3,1,'2020-05-22 00:54:25',NULL),(3,1,'2020-05-22 00:54:35',NULL),(3,1,'2020-05-22 00:54:45',NULL),(3,1,'2020-05-22 00:54:55',NULL),(3,1,'2020-05-22 00:55:05',NULL),(3,1,'2020-05-22 00:55:15',NULL),(3,1,'2020-05-22 00:55:25',NULL),(3,1,'2020-05-22 00:55:35',NULL),(3,1,'2020-05-22 00:55:45',NULL),(3,1,'2020-05-22 00:55:55',NULL),(3,1,'2020-05-22 00:56:05',NULL),(3,1,'2020-05-22 00:56:15',NULL),(3,1,'2020-05-22 00:56:25',NULL),(3,1,'2020-05-22 00:56:35',NULL),(3,1,'2020-05-22 00:56:45',NULL),(3,1,'2020-05-22 00:56:55',NULL),(3,1,'2020-05-22 00:57:05',NULL),(3,1,'2020-05-22 00:57:15',NULL),(3,1,'2020-05-22 00:57:25',NULL),(3,1,'2020-05-22 00:57:35',NULL),(3,1,'2020-05-22 00:57:45',NULL),(3,1,'2020-05-22 00:57:55',NULL),(3,1,'2020-05-22 00:58:05',NULL),(3,1,'2020-05-22 00:58:15',NULL),(3,1,'2020-05-22 00:58:25',NULL),(3,1,'2020-05-22 00:58:35',NULL),(3,1,'2020-05-22 00:58:45',NULL),(3,1,'2020-05-22 00:58:55',NULL),(3,1,'2020-05-22 00:59:05',NULL),(3,1,'2020-05-22 00:59:15',NULL),(3,1,'2020-05-22 00:59:25',NULL),(3,1,'2020-05-22 00:59:35',NULL),(3,1,'2020-05-22 00:59:45',NULL),(3,1,'2020-05-22 00:59:55',NULL),(3,1,'2020-05-22 01:00:05',NULL),(3,1,'2020-05-22 01:00:15',NULL),(3,1,'2020-05-22 01:00:25',NULL),(3,1,'2020-05-22 01:00:35',NULL),(3,1,'2020-05-22 01:00:45',NULL),(3,1,'2020-05-22 01:00:55',NULL),(3,1,'2020-05-22 01:01:05',NULL),(3,1,'2020-05-22 01:01:15',NULL),(3,1,'2020-05-22 01:01:25',NULL),(3,1,'2020-05-22 01:01:35',NULL),(3,1,'2020-05-22 01:01:45',NULL),(3,1,'2020-05-22 01:01:55',NULL),(3,1,'2020-05-22 01:02:05',NULL),(3,1,'2020-05-22 01:02:15',NULL),(3,1,'2020-05-22 01:02:25',NULL),(3,1,'2020-05-22 01:02:35',NULL),(3,1,'2020-05-22 01:02:45',NULL),(3,1,'2020-05-22 01:02:55',NULL),(3,1,'2020-05-22 01:03:05',NULL),(3,1,'2020-05-22 01:03:15',NULL),(3,1,'2020-05-22 01:03:25',NULL),(3,1,'2020-05-22 01:03:35',NULL),(3,1,'2020-05-22 01:03:45',NULL),(3,1,'2020-05-22 01:03:55',NULL),(3,1,'2020-05-22 01:04:05',NULL),(3,1,'2020-05-22 01:04:15',NULL),(3,1,'2020-05-22 01:04:25',NULL),(3,1,'2020-05-22 01:04:35',NULL),(3,1,'2020-05-22 01:04:45',NULL),(3,1,'2020-05-22 01:04:55',NULL),(3,1,'2020-05-22 01:05:05',NULL),(3,1,'2020-05-22 01:05:15',NULL),(3,1,'2020-05-22 01:05:25',NULL),(3,1,'2020-05-22 01:05:35',NULL),(3,1,'2020-05-22 01:05:45',NULL),(3,1,'2020-05-22 01:05:55',NULL),(3,1,'2020-05-22 01:06:05',NULL),(3,1,'2020-05-22 01:06:15',NULL),(3,1,'2020-05-22 01:06:25',NULL),(3,1,'2020-05-22 01:06:35',NULL),(3,1,'2020-05-22 01:06:45',NULL),(3,1,'2020-05-22 01:06:55',NULL),(3,1,'2020-05-22 01:07:05',NULL),(3,1,'2020-05-22 01:07:15',NULL),(3,1,'2020-05-22 01:07:25',NULL),(3,1,'2020-05-22 01:07:35',NULL),(3,1,'2020-05-22 01:07:45',NULL),(3,1,'2020-05-22 01:07:55',NULL),(3,1,'2020-05-22 01:08:05',NULL),(3,1,'2020-05-22 01:08:15',NULL),(3,1,'2020-05-22 01:08:25',NULL),(3,1,'2020-05-22 01:08:35',NULL),(3,1,'2020-05-22 01:08:45',NULL),(3,1,'2020-05-22 01:08:55',NULL),(3,1,'2020-05-22 01:09:05',NULL),(3,1,'2020-05-22 01:09:15',NULL),(3,1,'2020-05-22 01:09:25',NULL),(3,1,'2020-05-22 01:09:35',NULL),(3,1,'2020-05-22 01:09:45',NULL),(3,1,'2020-05-22 01:09:55',NULL),(3,1,'2020-05-22 01:10:05',NULL),(3,1,'2020-05-22 01:10:05',NULL),(3,1,'2020-05-22 01:10:09',NULL),(3,1,'2020-05-22 01:10:15',NULL),(3,1,'2020-05-22 01:10:25',NULL),(3,1,'2020-05-22 01:10:35',NULL),(3,1,'2020-05-22 01:10:38',NULL),(3,1,'2020-05-22 01:10:41',NULL),(3,1,'2020-05-22 01:10:45',NULL),(3,1,'2020-05-22 01:10:55',NULL),(3,1,'2020-05-22 01:11:05',NULL),(3,1,'2020-05-22 01:11:15',NULL),(3,1,'2020-05-22 01:11:25',NULL),(3,1,'2020-05-22 01:11:35',NULL),(3,1,'2020-05-22 01:11:45',NULL),(3,1,'2020-05-22 01:11:55',NULL),(3,1,'2020-05-22 01:12:05',NULL),(3,1,'2020-05-22 01:12:15',NULL),(3,1,'2020-05-22 01:12:25',NULL),(3,1,'2020-05-22 01:12:35',NULL),(3,1,'2020-05-22 01:12:45',NULL),(3,1,'2020-05-22 01:12:55',NULL),(3,1,'2020-05-22 01:13:05',NULL),(3,1,'2020-05-22 01:13:15',NULL),(3,1,'2020-05-22 01:13:25',NULL),(3,1,'2020-05-22 01:13:35',NULL),(3,1,'2020-05-22 01:13:45',NULL),(3,1,'2020-05-22 01:13:55',NULL),(3,1,'2020-05-22 01:14:05',NULL),(3,1,'2020-05-22 01:14:15',NULL),(3,1,'2020-05-22 01:14:25',NULL),(3,1,'2020-05-22 01:14:35',NULL),(3,1,'2020-05-22 01:14:45',NULL),(3,1,'2020-05-22 01:14:55',NULL),(3,1,'2020-05-22 01:15:05',NULL),(3,1,'2020-05-22 01:15:15',NULL),(3,1,'2020-05-22 01:15:24',NULL),(3,1,'2020-05-22 01:15:34',NULL),(3,1,'2020-05-22 01:15:34',NULL),(3,1,'2020-05-22 01:15:37',NULL),(3,1,'2020-05-22 01:15:45',NULL),(3,1,'2020-05-22 01:15:47',NULL),(3,1,'2020-05-22 01:15:49',NULL),(3,1,'2020-05-22 01:15:55',NULL),(3,1,'2020-05-22 01:16:05',NULL),(3,1,'2020-05-22 01:16:15',NULL),(3,1,'2020-05-22 01:16:25',NULL),(3,1,'2020-05-22 01:16:35',NULL),(3,1,'2020-05-22 01:16:45',NULL),(3,1,'2020-05-22 01:16:55',NULL),(3,1,'2020-05-22 01:17:05',NULL),(3,1,'2020-05-22 01:17:08',NULL),(3,1,'2020-05-22 01:17:10',NULL),(3,1,'2020-05-22 01:17:15',NULL),(3,1,'2020-05-22 01:17:25',NULL),(3,1,'2020-05-22 01:17:30',NULL),(3,1,'2020-05-22 01:17:32',NULL),(3,1,'2020-05-22 01:17:35',NULL),(3,1,'2020-05-22 01:17:45',NULL),(3,1,'2020-05-22 01:17:55',NULL),(3,1,'2020-05-22 01:18:05',NULL),(3,1,'2020-05-22 01:18:15',NULL),(3,1,'2020-05-22 01:18:25',NULL),(3,1,'2020-05-22 01:18:35',NULL),(3,1,'2020-05-22 01:18:45',NULL),(3,1,'2020-05-22 01:18:55',NULL),(3,1,'2020-05-22 01:19:05',NULL),(3,1,'2020-05-22 01:19:15',NULL),(3,1,'2020-05-22 01:19:25',NULL),(3,1,'2020-05-22 01:19:34',NULL),(3,1,'2020-05-22 01:19:45',NULL),(3,1,'2020-05-22 01:19:55',NULL),(3,1,'2020-05-22 01:20:05',NULL),(3,1,'2020-05-22 01:20:15',NULL),(3,1,'2020-05-22 01:20:25',NULL),(3,1,'2020-05-22 01:20:34',NULL),(3,1,'2020-05-22 01:20:45',NULL),(3,1,'2020-05-22 01:20:55',NULL),(3,1,'2020-05-22 01:21:04',NULL),(3,1,'2020-05-22 01:21:14',NULL),(3,1,'2020-05-22 01:21:25',NULL),(3,1,'2020-05-22 01:21:35',NULL),(3,1,'2020-05-22 01:21:47',NULL),(3,1,'2020-05-22 01:21:55',NULL),(3,1,'2020-05-22 01:22:05',NULL),(3,1,'2020-05-22 01:22:06',NULL),(3,1,'2020-05-22 01:22:08',NULL),(3,1,'2020-05-22 01:22:15',NULL),(3,1,'2020-05-22 01:22:25',NULL),(3,1,'2020-05-22 01:22:35',NULL),(3,1,'2020-05-22 01:22:45',NULL),(3,1,'2020-05-22 01:22:55',NULL),(3,1,'2020-05-22 01:23:05',NULL),(3,1,'2020-05-22 01:23:15',NULL),(3,1,'2020-05-22 01:23:25',NULL),(3,1,'2020-05-22 01:23:35',NULL),(3,1,'2020-05-22 01:23:45',NULL),(3,1,'2020-05-22 01:23:55',NULL),(3,1,'2020-05-22 01:24:05',NULL),(3,1,'2020-05-22 01:24:15',NULL),(3,1,'2020-05-22 01:24:25',NULL),(3,1,'2020-05-22 01:24:35',NULL),(3,1,'2020-05-22 01:24:37',NULL),(3,1,'2020-05-22 01:24:39',NULL),(3,1,'2020-05-22 01:24:44',NULL),(3,1,'2020-05-22 01:24:49',NULL),(3,1,'2020-05-22 01:24:59',NULL),(3,1,'2020-05-22 01:25:09',NULL),(3,1,'2020-05-22 01:25:20',NULL),(3,1,'2020-05-22 01:25:30',NULL),(3,1,'2020-05-22 01:25:40',NULL),(3,1,'2020-05-22 01:25:50',NULL),(3,1,'2020-05-22 01:26:00',NULL),(3,1,'2020-05-22 01:26:10',NULL),(3,1,'2020-05-22 01:26:20',NULL),(3,1,'2020-05-22 01:26:30',NULL),(3,1,'2020-05-22 01:26:40',NULL),(3,1,'2020-05-22 01:26:50',NULL),(3,1,'2020-05-22 01:27:00',NULL),(3,1,'2020-05-22 01:27:10',NULL),(3,1,'2020-05-22 01:27:20',NULL),(3,1,'2020-05-22 01:27:30',NULL),(3,1,'2020-05-22 01:27:40',NULL),(3,1,'2020-05-22 01:27:40',NULL),(3,1,'2020-05-22 01:27:43',NULL),(3,1,'2020-05-22 01:27:50',NULL),(3,1,'2020-05-22 01:28:00',NULL),(3,1,'2020-05-22 01:28:10',NULL),(3,1,'2020-05-22 01:28:20',NULL),(3,1,'2020-05-22 01:28:30',NULL),(3,1,'2020-05-22 01:28:40',NULL),(3,1,'2020-05-22 01:28:50',NULL),(3,1,'2020-05-22 01:29:00',NULL),(3,1,'2020-05-22 01:29:10',NULL),(3,1,'2020-05-22 01:29:20',NULL),(3,1,'2020-05-22 01:29:30',NULL),(3,1,'2020-05-22 01:29:40',NULL),(3,1,'2020-05-22 01:29:50',NULL),(3,1,'2020-05-22 01:30:00',NULL),(3,1,'2020-05-22 01:30:10',NULL),(3,1,'2020-05-22 01:30:20',NULL),(3,1,'2020-05-22 01:30:30',NULL),(3,1,'2020-05-22 01:30:40',NULL),(3,1,'2020-05-22 01:30:50',NULL),(3,1,'2020-05-22 01:31:00',NULL),(3,1,'2020-05-22 01:31:10',NULL),(3,1,'2020-05-22 01:31:20',NULL),(3,1,'2020-05-22 01:31:30',NULL),(3,1,'2020-05-22 01:31:40',NULL),(3,1,'2020-05-22 01:31:50',NULL),(3,1,'2020-05-22 01:32:00',NULL),(3,1,'2020-05-22 01:32:10',NULL),(3,1,'2020-05-22 01:32:20',NULL),(3,1,'2020-05-22 01:32:30',NULL),(3,1,'2020-05-22 01:32:40',NULL),(3,1,'2020-05-22 01:32:50',NULL),(3,1,'2020-05-22 01:33:00',NULL),(3,1,'2020-05-22 01:33:07',NULL),(3,1,'2020-05-22 01:33:09',NULL),(3,1,'2020-05-22 01:33:12',NULL),(3,1,'2020-05-22 01:33:19',NULL),(3,1,'2020-05-22 01:33:29',NULL),(3,1,'2020-05-22 01:33:39',NULL),(3,1,'2020-05-22 01:33:49',NULL),(3,1,'2020-05-22 01:34:00',NULL),(3,1,'2020-05-22 01:34:10',NULL),(3,1,'2020-05-22 01:34:20',NULL),(3,1,'2020-05-22 01:34:30',NULL),(3,1,'2020-05-22 01:34:40',NULL),(3,1,'2020-05-22 01:34:50',NULL),(3,1,'2020-05-22 01:35:00',NULL),(3,1,'2020-05-22 01:35:10',NULL),(3,1,'2020-05-22 01:35:20',NULL),(3,1,'2020-05-22 01:35:30',NULL),(3,1,'2020-05-22 01:35:40',NULL),(3,1,'2020-05-22 01:35:49',NULL),(3,1,'2020-05-22 01:35:59',NULL),(3,1,'2020-05-22 01:36:03',NULL),(3,1,'2020-05-22 01:36:14',NULL),(3,1,'2020-05-22 01:36:18',NULL),(3,1,'2020-05-22 01:36:19',NULL),(3,1,'2020-05-22 01:36:23',NULL),(3,1,'2020-05-22 01:36:34',NULL),(3,1,'2020-05-22 01:36:44',NULL),(3,1,'2020-05-22 01:36:54',NULL),(3,1,'2020-05-22 01:37:04',NULL),(3,1,'2020-05-22 01:37:14',NULL),(3,1,'2020-05-22 01:37:24',NULL),(3,1,'2020-05-22 01:37:34',NULL),(3,1,'2020-05-22 01:37:44',NULL),(3,1,'2020-05-22 01:37:48',NULL),(3,1,'2020-05-22 01:37:50',NULL),(3,1,'2020-05-22 01:37:54',NULL),(3,1,'2020-05-22 01:38:03',NULL),(3,1,'2020-05-22 01:38:04',NULL),(3,1,'2020-05-22 01:38:05',NULL),(3,1,'2020-05-22 01:38:14',NULL),(3,1,'2020-05-22 01:38:15',NULL),(3,1,'2020-05-22 01:38:17',NULL),(3,1,'2020-05-22 01:38:22',NULL),(3,1,'2020-05-22 01:38:23',NULL),(3,1,'2020-05-22 01:38:24',NULL),(3,1,'2020-05-22 01:38:34',NULL),(3,1,'2020-05-22 01:38:40',NULL),(3,1,'2020-05-22 01:38:44',NULL),(3,1,'2020-05-22 01:38:45',NULL),(3,1,'2020-05-22 01:38:50',NULL),(3,1,'2020-05-22 01:38:52',NULL),(3,1,'2020-05-22 01:38:54',NULL),(3,1,'2020-05-22 01:38:56',NULL),(3,1,'2020-05-22 01:38:58',NULL),(3,1,'2020-05-22 01:39:04',NULL),(3,1,'2020-05-22 01:39:14',NULL),(3,1,'2020-05-22 01:39:24',NULL),(3,1,'2020-05-22 01:39:34',NULL),(3,1,'2020-05-22 01:39:44',NULL),(3,1,'2020-05-22 01:39:54',NULL),(3,1,'2020-05-22 01:40:03',NULL),(3,1,'2020-05-22 01:40:14',NULL),(3,1,'2020-05-22 01:40:24',NULL),(3,1,'2020-05-22 01:40:33',NULL),(3,1,'2020-05-22 01:40:38',NULL),(3,1,'2020-05-22 01:40:54',NULL),(3,1,'2020-05-22 01:41:10',NULL),(1,18,'2020-05-22 01:50:27',NULL),(1,1,'2020-05-22 01:52:47',NULL),(1,1,'2020-05-22 01:53:03',NULL),(2,1,'2020-05-22 01:53:12',NULL),(1,1,'2020-05-22 01:53:18',NULL),(2,1,'2020-05-22 01:53:28',NULL),(1,1,'2020-05-22 01:53:33',NULL),(1,1,'2020-05-22 01:53:48',NULL),(1,1,'2020-05-22 01:54:03',NULL),(1,1,'2020-05-22 01:54:18',NULL),(1,1,'2020-05-22 01:54:33',NULL),(1,1,'2020-05-22 01:54:47',NULL),(1,1,'2020-05-22 01:54:52',NULL),(1,1,'2020-05-22 01:55:09',NULL),(1,1,'2020-05-22 01:55:24',NULL),(1,1,'2020-05-22 01:55:39',NULL),(1,1,'2020-05-22 01:55:54',NULL),(1,1,'2020-05-22 01:56:09',NULL),(1,1,'2020-05-22 01:56:24',NULL),(1,1,'2020-05-22 01:56:39',NULL),(13,19,'2020-05-24 12:57:56',NULL),(13,19,'2020-05-24 12:58:13',NULL),(13,19,'2020-05-24 12:59:30',NULL),(13,19,'2020-05-24 12:59:47',NULL),(13,19,'2020-05-24 12:59:52',NULL),(13,19,'2020-05-24 13:00:11',NULL),(13,19,'2020-05-24 13:00:26',NULL),(13,19,'2020-05-24 13:00:41',NULL),(13,19,'2020-05-24 13:00:56',NULL),(13,19,'2020-05-24 13:01:11',NULL),(13,19,'2020-05-24 13:01:26',NULL),(13,19,'2020-05-24 13:01:41',NULL),(13,19,'2020-05-24 13:01:56',NULL),(13,19,'2020-05-24 13:02:11',NULL),(13,19,'2020-05-24 13:02:26',NULL),(13,19,'2020-05-24 13:02:41',NULL),(13,19,'2020-05-24 13:02:56',NULL),(13,19,'2020-05-24 13:03:12',NULL),(13,19,'2020-05-24 13:03:26',NULL),(13,19,'2020-05-24 13:03:42',NULL),(13,19,'2020-05-24 13:03:57',NULL),(13,19,'2020-05-24 13:04:11',NULL),(13,19,'2020-05-24 13:04:11',NULL),(13,19,'2020-05-24 13:04:15',NULL),(13,19,'2020-05-24 13:04:27',NULL),(13,19,'2020-05-24 13:04:43',NULL),(13,19,'2020-05-24 13:04:57',NULL),(13,19,'2020-05-24 13:05:13',NULL),(13,19,'2020-05-24 13:05:26',NULL),(13,19,'2020-05-24 13:05:27',NULL),(13,19,'2020-05-24 13:05:43',NULL),(13,19,'2020-05-24 13:05:58',NULL),(13,19,'2020-05-24 13:06:13',NULL),(13,19,'2020-05-24 13:06:28',NULL),(13,19,'2020-05-24 13:06:43',NULL),(13,19,'2020-05-24 13:07:00',NULL),(13,19,'2020-05-24 13:07:13',NULL),(14,19,'2020-05-24 13:08:31',NULL),(14,19,'2020-05-24 13:08:49',NULL),(14,19,'2020-05-24 13:08:49',NULL),(14,19,'2020-05-24 13:08:55',NULL),(14,19,'2020-05-24 13:09:02',NULL),(14,19,'2020-05-24 13:09:02',NULL),(14,19,'2020-05-24 13:09:05',NULL),(14,19,'2020-05-24 13:09:08',NULL),(14,19,'2020-05-24 13:09:12',NULL),(14,19,'2020-05-24 13:09:16',NULL),(14,19,'2020-05-24 13:09:20',NULL),(14,19,'2020-05-24 13:09:22',NULL),(14,19,'2020-05-24 13:09:25',NULL),(14,19,'2020-05-24 13:09:36',NULL),(14,19,'2020-05-24 13:09:51',NULL),(14,19,'2020-05-24 13:10:06',NULL),(14,19,'2020-05-24 13:10:21',NULL),(14,19,'2020-05-24 13:10:36',NULL),(14,19,'2020-05-24 13:10:51',NULL),(14,19,'2020-05-24 13:11:06',NULL),(14,19,'2020-05-24 13:11:21',NULL),(14,19,'2020-05-24 13:11:36',NULL),(14,19,'2020-05-24 13:11:51',NULL),(14,19,'2020-05-24 13:12:05',NULL),(14,19,'2020-05-24 13:12:06',NULL),(14,19,'2020-05-24 13:12:07',NULL),(14,19,'2020-05-24 13:12:18',NULL),(14,19,'2020-05-24 13:12:20',NULL),(14,19,'2020-05-24 13:12:21',NULL),(14,19,'2020-05-24 13:12:37',NULL),(14,19,'2020-05-24 13:12:52',NULL),(14,19,'2020-05-24 13:12:54',NULL),(14,19,'2020-05-24 13:12:58',NULL),(14,19,'2020-05-24 13:13:07',NULL),(14,19,'2020-05-24 13:13:22',NULL),(14,19,'2020-05-24 13:13:37',NULL),(14,19,'2020-05-24 13:13:46',NULL),(14,19,'2020-05-24 13:13:50',NULL),(14,19,'2020-05-24 13:13:51',NULL),(14,19,'2020-05-24 13:14:07',NULL),(14,19,'2020-05-24 13:14:22',NULL),(14,19,'2020-05-24 13:14:37',NULL),(15,19,'2020-05-24 13:18:38',NULL),(15,19,'2020-05-24 13:18:53',NULL),(15,19,'2020-05-24 13:18:54',NULL),(15,19,'2020-05-24 13:19:09',NULL),(15,19,'2020-05-24 13:19:25',NULL),(15,19,'2020-05-24 13:19:39',NULL),(15,19,'2020-05-24 13:19:54',NULL),(15,19,'2020-05-24 13:20:09',NULL),(15,19,'2020-05-24 13:20:25',NULL),(15,19,'2020-05-24 13:20:39',NULL),(15,19,'2020-05-24 13:20:54',NULL),(15,19,'2020-05-24 13:21:10',NULL),(15,19,'2020-05-24 13:21:27',NULL),(15,19,'2020-05-24 13:21:39',NULL),(15,19,'2020-05-24 13:21:55',NULL),(15,19,'2020-05-24 13:22:09',NULL),(15,19,'2020-05-24 13:22:24',NULL);
/*!40000 ALTER TABLE `sesion_espectador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion_material`
--

DROP TABLE IF EXISTS `sesion_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `sesion_id` int(11) NOT NULL,
  `fecha_desde` datetime NOT NULL,
  `fecha_hasta` datetime DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion_material`
--

LOCK TABLES `sesion_material` WRITE;
/*!40000 ALTER TABLE `sesion_material` DISABLE KEYS */;
INSERT INTO `sesion_material` VALUES (1,3,1,'2020-05-17 17:38:16','2020-05-17 17:39:14','00:00:58'),(2,3,1,'2020-05-17 17:39:14','2020-05-17 17:39:59','00:00:45'),(3,3,1,'2020-05-17 17:39:59','2020-05-17 17:40:02','00:00:03'),(4,3,1,'2020-05-17 17:40:18','2020-05-17 17:40:28','00:00:10'),(5,3,1,'2020-05-17 17:40:28','2020-05-17 17:40:33','00:00:05'),(6,3,1,'2020-05-17 17:40:33','2020-05-17 17:40:37','00:00:04'),(7,2,1,'2020-05-17 17:40:37','2020-05-17 17:40:41','00:00:04'),(8,2,1,'2020-05-17 17:40:41','2020-05-17 17:40:42','00:00:01'),(9,2,1,'2020-05-17 17:40:42','2020-05-17 17:40:43','00:00:01'),(10,2,1,'2020-05-17 17:40:43','2020-05-17 17:40:43','00:00:00'),(11,2,1,'2020-05-17 17:40:43','2020-05-17 17:40:44','00:00:01'),(12,2,1,'2020-05-17 17:40:44','2020-05-17 17:41:02','00:00:18'),(13,2,1,'2020-05-17 17:41:02','2020-05-17 17:41:05','00:00:03'),(14,2,1,'2020-05-17 17:41:05','2020-05-17 17:41:43','00:00:38'),(15,2,1,'2020-05-17 17:41:46','2020-05-17 17:41:49','00:00:03'),(16,2,1,'2020-05-17 17:41:53','2020-05-17 17:42:24','00:00:31'),(17,2,1,'2020-05-17 17:42:38','2020-05-17 17:42:54','00:00:16'),(18,2,1,'2020-05-17 17:42:58','2020-05-17 17:44:31','00:01:33'),(19,2,1,'2020-05-17 17:44:40','2020-05-17 17:45:13','00:00:33'),(20,2,1,'2020-05-17 17:45:15','2020-05-17 17:45:21','00:00:06'),(21,2,1,'2020-05-17 17:45:23','2020-05-17 17:49:11','00:03:48'),(22,3,1,'2020-05-17 17:49:11','2020-05-17 17:50:04','00:00:53'),(23,3,1,'2020-05-17 17:50:07','2020-05-17 17:50:39','00:00:32'),(24,2,1,'2020-05-17 17:50:39','2020-05-17 18:06:58','00:16:19'),(25,3,1,'2020-05-17 18:06:58','2020-05-17 18:07:23','00:00:25'),(26,2,1,'2020-05-17 18:07:23','2020-05-17 18:07:39','00:00:16'),(27,3,1,'2020-05-17 18:07:39','2020-05-17 18:07:51','00:00:12'),(28,2,1,'2020-05-17 18:07:51','2020-05-17 18:08:25','00:00:34'),(29,3,1,'2020-05-17 18:08:25','2020-05-17 18:18:26','00:10:01'),(30,2,1,'2020-05-17 18:18:26','2020-05-17 18:19:42','00:01:16'),(31,1,1,'2020-05-17 18:19:42','2020-05-17 18:28:31','00:08:49'),(32,2,1,'2020-05-17 18:28:31','2020-05-17 18:35:00','00:06:29'),(33,3,1,'2020-05-17 18:35:00','2020-05-17 18:35:04','00:00:04'),(34,2,1,'2020-05-17 18:35:04','2020-05-17 18:35:16','00:00:12'),(35,2,1,'2020-05-17 18:35:18','2020-05-17 18:35:32','00:00:14'),(36,2,1,'2020-05-17 18:35:36','2020-05-17 18:37:45','00:02:09'),(37,2,1,'2020-05-17 18:37:48','2020-05-17 18:37:58','00:00:10'),(38,1,1,'2020-05-17 18:37:58','2020-05-17 18:38:02','00:00:04'),(39,2,1,'2020-05-17 18:38:02','2020-05-17 18:46:57','00:08:55'),(40,3,1,'2020-05-17 18:46:57','2020-05-17 18:47:12','00:00:15'),(41,2,1,'2020-05-17 18:47:12','2020-05-17 18:47:22','00:00:10'),(42,1,1,'2020-05-17 18:47:22','2020-05-17 18:47:45','00:00:23'),(43,2,1,'2020-05-17 18:47:45','2020-05-17 18:47:47','00:00:02'),(44,3,1,'2020-05-17 18:54:15','2020-05-17 18:54:27','00:00:12'),(45,2,1,'2020-05-17 18:54:27','2020-05-17 18:54:38','00:00:11'),(46,1,1,'2020-05-17 18:54:38','2020-05-17 18:55:00','00:00:22'),(47,6,5,'2020-05-17 18:57:19',NULL,NULL),(48,6,7,'2020-05-17 20:27:31','2020-05-17 20:27:48','00:00:17'),(49,8,7,'2020-05-17 20:27:48','2020-05-17 20:27:54','00:00:06'),(50,7,7,'2020-05-17 20:27:54',NULL,NULL),(51,3,2,'2020-05-21 11:01:24',NULL,NULL),(52,6,8,'2020-05-21 12:25:04','2020-05-21 12:25:14','00:00:10'),(53,8,8,'2020-05-21 12:25:14','2020-05-21 12:25:27','00:00:13'),(54,7,8,'2020-05-21 12:25:27',NULL,NULL),(55,3,3,'2020-05-21 16:23:13','2020-05-21 22:43:45','06:20:32'),(56,3,3,'2020-05-21 22:43:51','2020-05-21 23:04:47','00:20:56'),(57,3,3,'2020-05-21 23:04:49','2020-05-21 23:10:43','00:05:54'),(58,3,3,'2020-05-21 23:10:45','2020-05-21 23:19:47','00:09:02'),(59,2,3,'2020-05-21 23:19:47','2020-05-21 23:31:45','00:11:58'),(60,1,3,'2020-05-21 23:31:45','2020-05-21 23:31:47','00:00:02'),(61,1,3,'2020-05-21 23:32:36','2020-05-21 23:47:47','00:15:11'),(62,1,3,'2020-05-21 23:47:51','2020-05-21 23:48:28','00:00:37'),(63,3,3,'2020-05-21 23:48:28','2020-05-21 23:59:40','00:11:12'),(64,2,3,'2020-05-21 23:59:40','2020-05-22 00:01:17','00:01:37'),(65,1,3,'2020-05-22 00:01:23','2020-05-22 00:02:20','00:00:57'),(66,1,3,'2020-05-22 00:02:25','2020-05-22 00:02:36','00:00:11'),(67,1,3,'2020-05-22 00:02:52','2020-05-22 00:03:03','00:00:11'),(68,1,3,'2020-05-22 00:03:06','2020-05-22 00:12:02','00:08:56'),(69,2,3,'2020-05-22 00:12:07','2020-05-22 00:36:34','00:24:27'),(70,1,3,'2020-05-22 00:36:34','2020-05-22 00:36:54','00:00:20'),(71,3,3,'2020-05-22 00:36:54','2020-05-22 00:37:02','00:00:08'),(72,2,3,'2020-05-22 00:37:02','2020-05-22 00:39:35','00:02:33'),(73,1,3,'2020-05-22 00:39:35','2020-05-22 00:45:09','00:05:34'),(74,2,3,'2020-05-22 00:45:09','2020-05-22 00:49:20','00:04:11'),(75,3,3,'2020-05-22 00:49:20','2020-05-22 01:10:04','00:20:44'),(76,2,3,'2020-05-22 01:10:04','2020-05-22 01:10:38','00:00:34'),(77,1,3,'2020-05-22 01:10:38','2020-05-22 01:15:31','00:04:53'),(78,1,3,'2020-05-22 01:15:33','2020-05-22 01:15:47','00:00:14'),(79,2,3,'2020-05-22 01:15:47','2020-05-22 01:17:08','00:01:21'),(80,3,3,'2020-05-22 01:17:08','2020-05-22 01:17:28','00:00:20'),(81,3,3,'2020-05-22 01:17:29','2020-05-22 01:22:06','00:04:37'),(82,1,3,'2020-05-22 01:22:06','2020-05-22 01:27:40','00:05:34'),(83,2,3,'2020-05-22 01:27:40','2020-05-22 01:33:07','00:05:27'),(84,1,3,'2020-05-22 01:33:07','2020-05-22 01:36:15','00:03:08'),(85,1,3,'2020-05-22 01:36:18','2020-05-22 01:37:47','00:01:29'),(86,3,3,'2020-05-22 01:37:47','2020-05-22 01:38:03','00:00:16'),(87,1,3,'2020-05-22 01:38:03','2020-05-22 01:38:14','00:00:11'),(88,2,3,'2020-05-22 01:38:14','2020-05-22 01:38:22','00:00:08'),(89,1,3,'2020-05-22 01:38:22','2020-05-22 01:38:40','00:00:18'),(90,3,3,'2020-05-22 01:38:40','2020-05-22 01:38:49','00:00:09'),(91,2,3,'2020-05-22 01:38:49','2020-05-22 01:38:56','00:00:07'),(92,1,3,'2020-05-22 01:38:56',NULL,NULL),(93,9,13,'2020-05-24 13:04:10','2020-05-24 13:04:55','00:00:45'),(94,9,13,'2020-05-24 13:05:25',NULL,NULL),(95,9,14,'2020-05-24 13:08:48','2020-05-24 13:09:01','00:00:13'),(96,10,14,'2020-05-24 13:09:01','2020-05-24 13:09:02','00:00:01'),(97,11,14,'2020-05-24 13:09:02','2020-05-24 13:09:12','00:00:10'),(98,10,14,'2020-05-24 13:09:12','2020-05-24 13:09:21','00:00:09'),(99,11,14,'2020-05-24 13:09:22','2020-05-24 13:12:04','00:02:42'),(100,9,14,'2020-05-24 13:12:04','2020-05-24 13:12:17','00:00:13'),(101,11,14,'2020-05-24 13:12:17','2020-05-24 13:12:48','00:00:31'),(102,11,14,'2020-05-24 13:12:54','2020-05-24 13:13:46','00:00:52'),(103,9,14,'2020-05-24 13:13:46',NULL,NULL),(104,9,15,'2020-05-24 13:18:53',NULL,NULL);
/*!40000 ALTER TABLE `sesion_material` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER SesionPregunta_Calculate_Duration
BEFORE UPDATE
ON `sesion_material` FOR EACH ROW
SET new.duracion = IF(new.fecha_hasta IS NOT NULL, TIMEDIFF(new.fecha_hasta, new.fecha_desde), NULL) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sesion_respuesta`
--

DROP TABLE IF EXISTS `sesion_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion_respuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `sesion_id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `opcion_id` int(11) NOT NULL,
  `respuesta` varchar(100) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sesion_respuesta_unicos` (`usuario_id`,`sesion_id`,`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion_respuesta`
--

LOCK TABLES `sesion_respuesta` WRITE;
/*!40000 ALTER TABLE `sesion_respuesta` DISABLE KEYS */;
INSERT INTO `sesion_respuesta` VALUES (1,1,3,1,2,NULL,'2020-05-22 06:15:37',NULL),(2,1,3,2,5,NULL,'2020-05-22 06:15:49',NULL),(3,1,3,3,11,NULL,'2020-05-22 06:17:10',NULL),(16,19,13,9,34,NULL,'2020-05-24 18:04:15',NULL),(17,19,14,9,34,NULL,'2020-05-24 18:08:55',NULL),(18,19,14,11,40,NULL,'2020-05-24 18:09:08',NULL),(19,19,14,10,38,NULL,'2020-05-24 18:09:16',NULL);
/*!40000 ALTER TABLE `sesion_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `bloqueado` datetime DEFAULT NULL,
  `nombres` varchar(200) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(200) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `documento` varchar(200) DEFAULT NULL,
  `numero_colegio` varchar(100) DEFAULT NULL,
  `anho_graduacion` date DEFAULT NULL,
  `centro_laboral` varchar(200) DEFAULT NULL,
  `horario_disponible` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'diego','e10adc3949ba59abbe56e057f20f883e','MEDICO',NULL,'Diego',NULL,NULL,'943517610',NULL,'94351761','9435a3251561','1994-07-01','PANTEL','TODO EL DÍA'),(2,'diego2','e10adc3949ba59abbe56e057f20f883e','Sistemas',NULL,'Diego Ricardo','Anccas Ayala','Av. Proceres de la independencia 4166','943517610',NULL,'49008351','943517610000','1994-07-11','Pantel','9-6pm'),(3,'gf','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'gv',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'diego22','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'Diego Ricardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'ang','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'Angela Doris',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'otro','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'Otros',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'henrryanccas','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'henrry anccas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'rodrigo','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'rodrigo andres santiago anccas ayala',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'nestor','5f0bd8ea4a350a5c8e6fc99183946f7f',NULL,NULL,'Nestor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'Rodsin3009','bb5c28da06c80637f65ae1fd6d780b65',NULL,NULL,'Rodson',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'daniel','688a906d858a73ce35153fb926347e9e',NULL,NULL,'Daniel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'blueblue','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'blu blue',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'Paideia','0709767e1982be2f77fb7154d3f62f97',NULL,NULL,'pavel taboada garcía',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'cruizv','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'César Ruiz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'Rod','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'Rd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'Rodson3163','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'Rodson Vladimir Ayme Tambra',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'Arely','c8eef80abfcf8a4fae6b947e74c68f0c',NULL,NULL,'Aracely',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'mario','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'Mariano',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'seovo','c3b830f9a769b49d3250795223caad4d',NULL,NULL,'jesus_jesus',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'Rodson19','2603fe3350fbe00d3db657357f462d11',NULL,NULL,'Rodson Vla',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'ANAFERNANDEZ','52a2fbae47e4ba21757d4a2a5e178f2c',NULL,NULL,'ANA FERNANDEZ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_auditoria`
--

DROP TABLE IF EXISTS `usuario_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_auditoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `desde` datetime NOT NULL,
  `hasta` datetime DEFAULT NULL,
  `ultima_conexion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_auditoria`
--

LOCK TABLES `usuario_auditoria` WRITE;
/*!40000 ALTER TABLE `usuario_auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_seguidor`
--

DROP TABLE IF EXISTS `usuario_seguidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_seguidor` (
  `usuario_id` int(11) NOT NULL,
  `seguidor_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`usuario_id`,`seguidor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_seguidor`
--

LOCK TABLES `usuario_seguidor` WRITE;
/*!40000 ALTER TABLE `usuario_seguidor` DISABLE KEYS */;
INSERT INTO `usuario_seguidor` VALUES (1,1,'2020-05-22 01:24:39');
/*!40000 ALTER TABLE `usuario_seguidor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-24 20:23:21
