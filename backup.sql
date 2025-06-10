-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: codersql
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `auditoria_turnos`
--

DROP TABLE IF EXISTS `auditoria_turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_turnos` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `id_turno` int NOT NULL,
  `accion` varchar(20) NOT NULL,
  `fecha_accion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_turnos`
--

LOCK TABLES `auditoria_turnos` WRITE;
/*!40000 ALTER TABLE `auditoria_turnos` DISABLE KEYS */;
INSERT INTO `auditoria_turnos` VALUES (1,1,'INSERT','2025-06-09 23:22:27'),(2,2,'INSERT','2025-06-09 23:22:27'),(3,3,'INSERT','2025-06-09 23:22:27'),(4,4,'INSERT','2025-06-09 23:22:27'),(5,5,'INSERT','2025-06-09 23:22:27'),(6,6,'INSERT','2025-06-09 23:22:27'),(7,7,'INSERT','2025-06-09 23:22:27'),(8,8,'INSERT','2025-06-09 23:22:27'),(9,9,'INSERT','2025-06-09 23:22:27'),(10,10,'INSERT','2025-06-09 23:22:27'),(11,11,'INSERT','2025-06-09 23:22:27'),(12,12,'INSERT','2025-06-09 23:22:27'),(13,13,'INSERT','2025-06-09 23:22:27'),(14,14,'INSERT','2025-06-09 23:22:27'),(15,15,'INSERT','2025-06-09 23:22:27'),(16,16,'INSERT','2025-06-09 23:22:27'),(17,17,'INSERT','2025-06-09 23:22:27'),(18,18,'INSERT','2025-06-09 23:22:27'),(19,19,'INSERT','2025-06-09 23:22:27'),(20,20,'INSERT','2025-06-09 23:22:27'),(21,21,'INSERT','2025-06-09 23:22:27'),(22,22,'INSERT','2025-06-09 23:22:27'),(23,1,'UPDATE','2025-06-09 23:22:27'),(24,2,'UPDATE','2025-06-09 23:22:27'),(25,3,'UPDATE','2025-06-09 23:22:27'),(26,4,'UPDATE','2025-06-09 23:22:27'),(27,6,'UPDATE','2025-06-09 23:22:27'),(28,7,'UPDATE','2025-06-09 23:22:27'),(29,8,'UPDATE','2025-06-09 23:22:27'),(30,19,'UPDATE','2025-06-09 23:22:27'),(31,20,'UPDATE','2025-06-09 23:22:27'),(32,21,'UPDATE','2025-06-09 23:22:27'),(33,5,'DELETE','2025-06-09 23:22:27');
/*!40000 ALTER TABLE `auditoria_turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contador_turnos`
--

DROP TABLE IF EXISTS `contador_turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contador_turnos` (
  `id_doctor` int NOT NULL,
  `cantidad_turnos_atendidos` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_doctor`),
  CONSTRAINT `contador_turnos_ibfk_1` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id_doctor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contador_turnos`
--

LOCK TABLES `contador_turnos` WRITE;
/*!40000 ALTER TABLE `contador_turnos` DISABLE KEYS */;
INSERT INTO `contador_turnos` VALUES (1,1),(2,2),(3,2),(4,1),(5,1),(6,1);
/*!40000 ALTER TABLE `contador_turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosticos`
--

DROP TABLE IF EXISTS `diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosticos` (
  `id_diagnostico` int NOT NULL AUTO_INCREMENT,
  `diagnostico` text NOT NULL,
  `id_turno` int NOT NULL,
  `tratamiento` text NOT NULL,
  `receta` varchar(100) DEFAULT NULL,
  `fecha_creada` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_modif` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_diagnostico`),
  KEY `id_turno` (`id_turno`),
  CONSTRAINT `diagnosticos_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id_turno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosticos`
--

LOCK TABLES `diagnosticos` WRITE;
/*!40000 ALTER TABLE `diagnosticos` DISABLE KEYS */;
INSERT INTO `diagnosticos` VALUES (1,'El paciente presenta severos colicos renales debido a la ingesta de bebidas alcoholicas',2,'Se le dice al peciente que deje el alcohol, haga deporte y coma sano. Se le receta un remedio','Tetraxona 200mg','2025-06-09 23:22:27','2025-06-09 23:22:27'),(2,'El paciente presenta migrañas',3,'Se le dice al peciente que use antimigral cuando comiencen los dolores','Antimigralon 100mg','2025-06-09 23:22:27','2025-06-09 23:22:27'),(3,'El paciente presenta vomitos severos',4,'Se le dice al peciente que repose e ingiera mucha agua',NULL,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(4,'Control general pediátrico. Niño sano.',6,'Se indica continuar con controles anuales y alimentación saludable.',NULL,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(5,'Consulta por molestias leves en el pecho. Examen clínico sin hallazgos patológicos.',7,'Se recomienda realizar un ECG de control y seguimiento con cardiólogo.','ECG reposo, Betaloc 25mg si persisten síntomas','2025-06-09 23:22:27','2025-06-09 23:22:27'),(6,'Consulta dermatológica por acné leve en rostro.',19,'Se indica higiene facial con jabón neutro y evitar tocarse la cara.','Crema tópica con peróxido de benzoilo','2025-06-09 23:22:27','2025-06-09 23:22:27'),(7,'Dolor muscular en espalda baja, probablemente por mala postura.',20,'Recomendada actividad física moderada y ejercicios de estiramiento.','Ibuprofeno 400mg cada 8hs si hay dolor','2025-06-09 23:22:27','2025-06-09 23:22:27'),(8,'Control odontológico de rutina sin presencia de caries.',21,'Higiene bucal adecuada. Se sugiere continuar con controles semestrales.',NULL,'2025-06-09 23:22:27','2025-06-09 23:22:27');
/*!40000 ALTER TABLE `diagnosticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctores`
--

DROP TABLE IF EXISTS `doctores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctores` (
  `id_doctor` int NOT NULL AUTO_INCREMENT,
  `dni` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `id_establecimiento` int NOT NULL,
  `id_especialidad` int NOT NULL,
  `fecha_creada` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_modif` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_doctor`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_doctores_especialidad` (`id_especialidad`),
  KEY `fk_doctores_establecimiento` (`id_establecimiento`),
  CONSTRAINT `fk_doctores_especialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_doctores_establecimiento` FOREIGN KEY (`id_establecimiento`) REFERENCES `establecimientos` (`id_establecimiento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctores`
--

LOCK TABLES `doctores` WRITE;
/*!40000 ALTER TABLE `doctores` DISABLE KEYS */;
INSERT INTO `doctores` VALUES (1,25466234,'Carlos','Palermo','1982-02-22','1189034520','titan@hotmail.com','Alvear 3224, Mar del Plata',2,1,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(2,30665791,'Melina','Delgado','1985-12-09','1147899211','melu23@gmail.com','Matheu 892, Mar del Plata',2,2,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(3,28444100,'Flavia','Schelotto','1984-11-01','22389112','chapita@yahoo.com','San Lorenzo 1147, Mar del Plata',1,3,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(4,33649027,'Marcelo','Riquelme','1988-11-04','227909809','roman10@gmail.com','Cisneros 8911, Mar del Plata',1,1,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(5,29800123,'Sandra','Corvalán','1980-07-14','1150002233','sandra.corvalan@gmail.com','Paso 1441, Mar del Plata',1,4,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(6,31234567,'Ricardo','Perdomo','1975-03-29','1144005566','ricardo.perdomo@gmail.com','San Juan 2031, Mar del Plata',2,5,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(7,28765432,'Julieta','Miranda','1990-09-17','1166443322','julieta.miranda@hotmail.com','Gascon 910, Mar del Plata',1,6,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(8,32567890,'Fernando','Sánchez','1982-01-05','1133887766','fernando.sanchez@med.com','Guemes 1200, Mar del Plata',2,2,'2025-06-09 23:22:27','2025-06-09 23:22:27');
/*!40000 ALTER TABLE `doctores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctores_obras_sociales`
--

DROP TABLE IF EXISTS `doctores_obras_sociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctores_obras_sociales` (
  `id_doctor` int NOT NULL,
  `id_obra_social` int NOT NULL,
  `fecha_modif` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_doctor`,`id_obra_social`),
  KEY `id_obra_social` (`id_obra_social`),
  CONSTRAINT `doctores_obras_sociales_ibfk_1` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id_doctor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doctores_obras_sociales_ibfk_2` FOREIGN KEY (`id_obra_social`) REFERENCES `obras_sociales` (`id_obra_social`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctores_obras_sociales`
--

LOCK TABLES `doctores_obras_sociales` WRITE;
/*!40000 ALTER TABLE `doctores_obras_sociales` DISABLE KEYS */;
INSERT INTO `doctores_obras_sociales` VALUES (1,2,'2025-06-09 23:22:27'),(1,4,'2025-06-09 23:22:27'),(2,3,'2025-06-09 23:22:27'),(3,4,'2025-06-09 23:22:27'),(4,2,'2025-06-09 23:22:27'),(4,4,'2025-06-09 23:22:27'),(5,2,'2025-06-09 23:22:27'),(5,3,'2025-06-09 23:22:27'),(6,3,'2025-06-09 23:22:27'),(6,4,'2025-06-09 23:22:27'),(7,2,'2025-06-09 23:22:27'),(7,4,'2025-06-09 23:22:27'),(8,3,'2025-06-09 23:22:27'),(8,4,'2025-06-09 23:22:27');
/*!40000 ALTER TABLE `doctores_obras_sociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades` (
  `id_especialidad` int NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(40) NOT NULL,
  `fecha_modif` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_especialidad`),
  UNIQUE KEY `especialidad` (`especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'Otorrinolaringología','2025-06-09 23:22:27'),(2,'Traumatología','2025-06-09 23:22:27'),(3,'Odontología','2025-06-09 23:22:27'),(4,'Cardiología','2025-06-09 23:22:27'),(5,'Dermatología','2025-06-09 23:22:27'),(6,'Pediatría','2025-06-09 23:22:27');
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimientos`
--

DROP TABLE IF EXISTS `establecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establecimientos` (
  `id_establecimiento` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha_modif` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_establecimiento`),
  UNIQUE KEY `telefono` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimientos`
--

LOCK TABLES `establecimientos` WRITE;
/*!40000 ALTER TABLE `establecimientos` DISABLE KEYS */;
INSERT INTO `establecimientos` VALUES (1,'La Rioja 4231, Mar del Plata','223527391','2025-06-09 23:22:27'),(2,'25 de Mayo 3291, Mar del Plata','223527390','2025-06-09 23:22:27');
/*!40000 ALTER TABLE `establecimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obras_sociales`
--

DROP TABLE IF EXISTS `obras_sociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obras_sociales` (
  `id_obra_social` int NOT NULL AUTO_INCREMENT,
  `obra_social` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_modif` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_obra_social`),
  UNIQUE KEY `telefono` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obras_sociales`
--

LOCK TABLES `obras_sociales` WRITE;
/*!40000 ALTER TABLE `obras_sociales` DISABLE KEYS */;
INSERT INTO `obras_sociales` VALUES (1,'No tiene',NULL,'2025-06-09 23:22:27'),(2,'SWISS Medical','49990042','2025-06-09 23:22:27'),(3,'OSDE','48001111','2025-06-09 23:22:27'),(4,'IOMA','45321234','2025-06-09 23:22:27');
/*!40000 ALTER TABLE `obras_sociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `dni` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `sexo` enum('M','F') NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `id_obra_social` int NOT NULL,
  `fecha_creada` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_modif` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `email` (`email`),
  KEY `id_obra_social` (`id_obra_social`),
  CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_obra_social`) REFERENCES `obras_sociales` (`id_obra_social`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (1,21456789,'Laura','Perez','1980-05-12','F','1123456789','laurip@hotmail.com','Peña 3211, Chivilicoy',2,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(2,31908775,'Martin','Esquivel','1988-02-19','M','1134567890','martinga@gmail.com','Uriburu 831, Mar del Plata',2,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(3,13789989,'Jose Luis','Zielinski','1976-11-09','M','1145678901',NULL,'Independencia 4311, Mar del Plata',1,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(4,33665720,'Esteban','Martinez Iraola','1986-10-22','M','1156789012','estebanmi@gmail.com','Irala 891, Miramar',3,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(5,9453789,'Maria Esther','Perez','1949-01-01','F','1167890123',NULL,'Arenales 6891, Batan',2,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(6,43567990,'Mariano','Godofredo','2010-07-30','M','1178901234','marianito@gmail.com','Cordoba 3456, Mar del Plata',4,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(7,40222333,'Lucía','Gómez','1990-04-15','F','1165478231','lucia.gomez@gmail.com','Av. Colón 1234',1,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(8,39511222,'Matías','Fernández','1985-11-03','M','1165984320','matias.fernandez@hotmail.com','Calle Rivadavia 554',2,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(9,42888321,'Sofía','Pérez','1998-06-21','F','1165987211','sofia.perez@yahoo.com','España 888',3,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(10,41422555,'Diego','Ramírez','1992-08-30','M','1154352178','diego.ramirez@gmail.com','Belgrano 455',1,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(11,41990123,'Camila','Torres','2000-02-14','F','1167894322','camila.torres@hotmail.com','La Rioja 2201',2,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(12,40771444,'Julián','Molina','1987-07-12','M','1177774444','julian.molina@gmail.com','San Martín 301',3,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(13,43001234,'Valentina','Acosta','1996-12-05','F','1166009990','valentina.acosta@outlook.com','Mitre 1020',1,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(14,41778899,'Tomás','Sosa','1991-05-27','M','1188881122','tomas.sosa@gmail.com','Dorrego 1550',2,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(15,42334567,'Martina','López','1994-10-19','F','1161234567','martina.lopez@hotmail.com','Independencia 789',3,'2025-06-09 23:22:27','2025-06-09 23:22:27'),(16,40993333,'Ignacio','Herrera','1989-03-10','M','1167002211','ignacio.herrera@gmail.com','Salta 431',1,'2025-06-09 23:22:27','2025-06-09 23:22:27');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos` (
  `id_turno` int NOT NULL AUTO_INCREMENT,
  `id_doctor` int NOT NULL,
  `id_paciente` int NOT NULL,
  `estado` enum('confirmado','ausente','atendido') DEFAULT 'confirmado',
  `fecha_turno` datetime NOT NULL,
  `fecha_creada` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_modif` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_turno`),
  UNIQUE KEY `unq_turno_unico` (`id_doctor`,`fecha_turno`),
  KEY `fk_turnos_paciente` (`id_paciente`),
  CONSTRAINT `fk_turnos_doctor` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id_doctor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_turnos_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES (1,1,1,'ausente','2025-05-23 14:30:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(2,2,2,'atendido','2025-05-24 14:00:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(3,2,3,'atendido','2025-05-24 14:30:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(4,3,4,'atendido','2025-05-25 16:30:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(6,5,7,'atendido','2025-05-22 09:00:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(7,6,8,'atendido','2025-05-11 10:30:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(8,7,9,'ausente','2025-05-12 14:00:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(9,8,10,'confirmado','2025-06-13 11:45:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(10,1,11,'confirmado','2025-06-14 15:15:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(11,2,12,'confirmado','2025-06-15 13:00:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(12,3,13,'confirmado','2025-06-16 09:45:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(13,4,14,'confirmado','2025-06-17 16:00:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(14,5,15,'confirmado','2025-06-18 10:15:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(15,6,6,'confirmado','2025-06-19 08:30:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(16,7,3,'confirmado','2025-06-20 12:30:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(17,8,2,'confirmado','2025-06-21 14:30:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(18,2,1,'confirmado','2025-06-22 11:00:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(19,4,16,'atendido','2025-06-22 13:00:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(20,1,6,'atendido','2025-05-26 15:30:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(21,3,1,'atendido','2023-05-23 14:30:00','2025-06-09 23:22:27','2025-06-09 23:22:27'),(22,1,3,'confirmado','2023-05-23 15:30:00','2025-06-09 23:22:27','2025-06-09 23:22:27');
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_turno` BEFORE INSERT ON `turnos` FOR EACH ROW BEGIN
   DECLARE existe INT;
   SELECT COUNT(*) INTO existe
   FROM turnos
   WHERE NEW.id_doctor=id_doctor AND NEW.fecha_turno=fecha_turno;
   
   IF existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El doctor ya tiene asignado un turno a esa misma hora';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_turno` AFTER INSERT ON `turnos` FOR EACH ROW BEGIN
INSERT INTO auditoria_turnos (id_turno, accion, fecha_accion)
    VALUES (NEW.id_turno, 'INSERT', NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_turno` AFTER UPDATE ON `turnos` FOR EACH ROW BEGIN
INSERT INTO auditoria_turnos (id_turno, accion, fecha_accion)
    VALUES (NEW.id_turno, 'UPDATE', NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sumar_turno_atendido` AFTER UPDATE ON `turnos` FOR EACH ROW BEGIN
     DECLARE turnos_count INT;
     SELECT cantidad_turnos_atendidos INTO turnos_count
     FROM contador_turnos
     WHERE id_doctor = NEW.id_doctor;
     
     IF turnos_count IS NULL AND OLD.estado <> 'atendido' AND NEW.estado = 'atendido' THEN
       INSERT INTO contador_turnos (id_doctor,cantidad_turnos_atendidos)
       VALUES (NEW.id_doctor,1);
     ELSE  
       UPDATE contador_turnos
        SET cantidad_turnos_atendidos = cantidad_turnos_atendidos + 1
        WHERE id_doctor = NEW.id_doctor;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_turno` BEFORE DELETE ON `turnos` FOR EACH ROW BEGIN
  IF OLD.fecha_turno < NOW() THEN
  SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se pueden eliminar turnos anteriores a la fecha actual.';
  ELSE
  INSERT INTO auditoria_turnos (id_turno, accion, fecha_accion)
  VALUES (OLD.id_turno, 'DELETE', NOW());
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `v_doctores`
--

DROP TABLE IF EXISTS `v_doctores`;
/*!50001 DROP VIEW IF EXISTS `v_doctores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_doctores` AS SELECT 
 1 AS `id_doctor`,
 1 AS `dni`,
 1 AS `nombre_completo`,
 1 AS `fecha_de_nacimiento`,
 1 AS `telefono`,
 1 AS `email`,
 1 AS `direccion`,
 1 AS `direccion_establecimiento`,
 1 AS `especialidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_info_pacientes`
--

DROP TABLE IF EXISTS `v_info_pacientes`;
/*!50001 DROP VIEW IF EXISTS `v_info_pacientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_info_pacientes` AS SELECT 
 1 AS `id_paciente`,
 1 AS `dni`,
 1 AS `nombre_completo`,
 1 AS `fecha_de_nacimiento`,
 1 AS `sexo`,
 1 AS `telefono`,
 1 AS `email`,
 1 AS `direccion`,
 1 AS `obra_social`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_trigger_contador_turnos`
--

DROP TABLE IF EXISTS `v_trigger_contador_turnos`;
/*!50001 DROP VIEW IF EXISTS `v_trigger_contador_turnos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_trigger_contador_turnos` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `cantidad_turnos_atendidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_turnos`
--

DROP TABLE IF EXISTS `v_turnos`;
/*!50001 DROP VIEW IF EXISTS `v_turnos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_turnos` AS SELECT 
 1 AS `id_turno`,
 1 AS `fecha_turno`,
 1 AS `estado`,
 1 AS `direccion_establecimiento`,
 1 AS `nombre_paciente`,
 1 AS `dni`,
 1 AS `nombre_doctor`,
 1 AS `especialidad`,
 1 AS `obra_social`,
 1 AS `fecha_creada`,
 1 AS `fecha_modif`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_doctores_convenios`
--

DROP TABLE IF EXISTS `vista_doctores_convenios`;
/*!50001 DROP VIEW IF EXISTS `vista_doctores_convenios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_doctores_convenios` AS SELECT 
 1 AS `nombre_doctor`,
 1 AS `obras_sociales`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_especialidades_doctores`
--

DROP TABLE IF EXISTS `vista_especialidades_doctores`;
/*!50001 DROP VIEW IF EXISTS `vista_especialidades_doctores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_especialidades_doctores` AS SELECT 
 1 AS `especialidad`,
 1 AS `doctores`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_turnos_confirmados_por_doctor`
--

DROP TABLE IF EXISTS `vista_turnos_confirmados_por_doctor`;
/*!50001 DROP VIEW IF EXISTS `vista_turnos_confirmados_por_doctor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_turnos_confirmados_por_doctor` AS SELECT 
 1 AS `apellido`,
 1 AS `nombre`,
 1 AS `cantidad_turnos_confirmados`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_doctores`
--

/*!50001 DROP VIEW IF EXISTS `v_doctores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_doctores` AS select `doc`.`id_doctor` AS `id_doctor`,`doc`.`dni` AS `dni`,concat(`doc`.`apellido`,', ',`doc`.`nombre`) AS `nombre_completo`,`doc`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`doc`.`telefono` AS `telefono`,`doc`.`email` AS `email`,`doc`.`direccion` AS `direccion`,`es`.`direccion` AS `direccion_establecimiento`,`e`.`especialidad` AS `especialidad` from ((`doctores` `doc` join `establecimientos` `es` on((`es`.`id_establecimiento` = `doc`.`id_establecimiento`))) join `especialidades` `e` on((`doc`.`id_especialidad` = `e`.`id_especialidad`))) order by `doc`.`apellido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_info_pacientes`
--

/*!50001 DROP VIEW IF EXISTS `v_info_pacientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_info_pacientes` AS select `p`.`id_paciente` AS `id_paciente`,`p`.`dni` AS `dni`,concat(`p`.`apellido`,', ',`p`.`nombre`) AS `nombre_completo`,`p`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`p`.`sexo` AS `sexo`,`p`.`telefono` AS `telefono`,`p`.`email` AS `email`,`p`.`direccion` AS `direccion`,`os`.`obra_social` AS `obra_social` from (`pacientes` `p` join `obras_sociales` `os` on((`p`.`id_obra_social` = `os`.`id_obra_social`))) order by `p`.`apellido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_trigger_contador_turnos`
--

/*!50001 DROP VIEW IF EXISTS `v_trigger_contador_turnos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_trigger_contador_turnos` AS select `d`.`nombre` AS `nombre`,`d`.`apellido` AS `apellido`,`c`.`cantidad_turnos_atendidos` AS `cantidad_turnos_atendidos` from (`contador_turnos` `c` join `doctores` `d` on((`c`.`id_doctor` = `d`.`id_doctor`))) order by `c`.`cantidad_turnos_atendidos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_turnos`
--

/*!50001 DROP VIEW IF EXISTS `v_turnos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_turnos` AS select `t`.`id_turno` AS `id_turno`,`t`.`fecha_turno` AS `fecha_turno`,`t`.`estado` AS `estado`,`es`.`direccion` AS `direccion_establecimiento`,concat(`p`.`nombre`,' ',`p`.`apellido`) AS `nombre_paciente`,`p`.`dni` AS `dni`,concat(`doc`.`nombre`,' ',`doc`.`apellido`) AS `nombre_doctor`,`e`.`especialidad` AS `especialidad`,`os`.`obra_social` AS `obra_social`,`t`.`fecha_creada` AS `fecha_creada`,`t`.`fecha_modif` AS `fecha_modif` from (((((`turnos` `t` join `pacientes` `p` on((`t`.`id_paciente` = `p`.`id_paciente`))) join `doctores` `doc` on((`t`.`id_doctor` = `doc`.`id_doctor`))) join `especialidades` `e` on((`doc`.`id_especialidad` = `e`.`id_especialidad`))) join `obras_sociales` `os` on((`p`.`id_obra_social` = `os`.`id_obra_social`))) join `establecimientos` `es` on((`es`.`id_establecimiento` = `doc`.`id_establecimiento`))) order by `t`.`fecha_turno` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_doctores_convenios`
--

/*!50001 DROP VIEW IF EXISTS `vista_doctores_convenios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_doctores_convenios` AS select concat(`doc`.`nombre`,' ',`doc`.`apellido`) AS `nombre_doctor`,group_concat(`os`.`obra_social` separator ',') AS `obras_sociales` from ((`doctores_obras_sociales` `dos` join `doctores` `doc` on((`dos`.`id_doctor` = `doc`.`id_doctor`))) join `obras_sociales` `os` on((`dos`.`id_obra_social` = `os`.`id_obra_social`))) group by `doc`.`id_doctor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_especialidades_doctores`
--

/*!50001 DROP VIEW IF EXISTS `vista_especialidades_doctores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_especialidades_doctores` AS select `e`.`especialidad` AS `especialidad`,group_concat(concat(`doc`.`nombre`,' ',`doc`.`apellido`) separator ',') AS `doctores` from (`especialidades` `e` left join `doctores` `doc` on((`e`.`id_especialidad` = `doc`.`id_especialidad`))) group by `e`.`especialidad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_turnos_confirmados_por_doctor`
--

/*!50001 DROP VIEW IF EXISTS `vista_turnos_confirmados_por_doctor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_turnos_confirmados_por_doctor` AS select `doc`.`apellido` AS `apellido`,`doc`.`nombre` AS `nombre`,count(0) AS `cantidad_turnos_confirmados` from (`turnos` `t` join `doctores` `doc` on((`t`.`id_doctor` = `doc`.`id_doctor`))) where (`t`.`estado` = 'confirmado') group by `doc`.`apellido`,`doc`.`nombre` order by `doc`.`apellido` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-09 23:41:58
