-- MySQL dump 10.13  Distrib 8.0.12, for Linux (x86_64)
--
-- Host: localhost    Database: odsdevelopment
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2018-08-30 20:08:08','2018-08-30 20:08:08');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `group_cities_id` bigint(20) DEFAULT NULL,
  `is_capital` tinyint(1) DEFAULT NULL,
  `goal_group_id` bigint(20) DEFAULT NULL,
  `rccv_program` varchar(255) DEFAULT NULL,
  `total_population` int(11) DEFAULT NULL,
  `metropolitan_area` varchar(255) DEFAULT NULL,
  `city_system_dnp` varchar(255) DEFAULT NULL,
  `dnp_category` varchar(255) DEFAULT NULL,
  `ddt_typology` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `description` text,
  `delete_at` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `urban_population` float DEFAULT NULL,
  `rural_population` float DEFAULT NULL,
  `total_area` varchar(255) DEFAULT NULL,
  `foundation_year` year(4) DEFAULT NULL,
  `folder_avatar` varchar(255) DEFAULT 'logos/cities/',
  PRIMARY KEY (`id`),
  KEY `index_cities_on_group_cities_id` (`group_cities_id`),
  KEY `index_cities_on_goal_group_id` (`goal_group_id`),
  KEY `index_cities_on_department_id` (`department_id`),
  CONSTRAINT `fk_rails_1064bf2ba1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_38e8f12aa2` FOREIGN KEY (`goal_group_id`) REFERENCES `goal_groups` (`id`),
  CONSTRAINT `fk_rails_b1bd521206` FOREIGN KEY (`group_cities_id`) REFERENCES `group_cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Bogota','2018-08-30 20:08:18','2018-10-19 20:36:49',1,1,NULL,'',9000000,'','','','',12,'Bogotá es la extensa capital en altura de Colombia. La Candelaria, su centro con adoquines, cuenta con sitios coloniales como el Teatro Colón neoclásico y la Iglesia de San Francisco del siglo XVII. También alberga museos populares, incluido el Museo Botero, que exhibe arte de Fernando Botero, y el Museo del Oro, con piezas de oro precolombinas.',NULL,'fvyxgulxxd7oaj1qpxjm.png',7000000,3000000,'8000',1959,'logos/cities/'),(2,'Medellín','2018-08-30 20:08:18','2018-10-16 19:17:11',1,1,NULL,'',3000000,'','','','',6,'',NULL,'jsqeccxx7nnhzckd6tyi.png',NULL,NULL,NULL,NULL,'logos/cities/'),(3,'Cali','2018-08-30 20:08:18','2018-10-16 19:17:20',1,1,NULL,'',2500000,'','','','',5,'',NULL,'xpo8djehc1hkkmmfot9a.png',NULL,NULL,NULL,NULL,'logos/cities/'),(4,'Barranquilla','2018-08-30 20:08:19','2018-10-06 21:11:55',1,1,NULL,'',1500000,'','','','',17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(5,'Soledad','2018-08-30 20:08:19','2018-10-06 21:03:26',1,0,NULL,NULL,1000000,NULL,NULL,NULL,NULL,17,NULL,'2018-10-06 21:03:26',NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(6,'Cúcuta','2018-08-30 20:08:19','2018-10-06 21:07:51',2,1,NULL,'',900000,'','','','',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(7,'Riohacha','2018-08-30 20:08:19','2018-10-06 21:05:28',3,0,NULL,'',800000,'','','','',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(8,'Ibagué','2018-08-30 20:08:19','2018-10-06 21:11:30',2,1,NULL,'',500000,'','','','',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(9,'Bucaramanga','2018-08-30 20:08:19','2018-10-06 21:11:38',1,1,NULL,'',860000,'','','','',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(10,'Cartagena','2018-08-30 20:08:19','2018-10-06 21:11:47',1,1,NULL,'',700000,'','','','',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(11,'Neiva','2018-08-30 20:08:19','2018-10-06 21:08:47',2,1,NULL,'',900000,'','','','',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(12,'Santa Marta','2018-08-30 20:08:20','2018-10-06 21:08:58',2,1,NULL,'',1200000,'','','','',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(13,'Pereira','2018-08-30 20:08:20','2018-10-06 21:10:33',2,1,NULL,'',1500000,'','','','',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(14,'Manizales','2018-08-30 20:08:20','2018-10-06 21:10:20',2,1,NULL,'',2000000,'','','','',16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(18,'Popayán','2018-08-30 20:08:20','2018-08-30 20:08:20',3,1,NULL,NULL,350000,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(19,'Pasto','2018-08-30 20:08:20','2018-10-06 21:09:08',2,1,NULL,'',500000,'','','','',15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(20,'Armenia','2018-08-30 20:08:20','2018-10-06 21:10:08',2,1,NULL,'',100000,'','','','',21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(21,'Buenaventura','2018-10-06 21:06:34','2018-10-06 21:06:34',3,0,NULL,'',NULL,'','','','',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/'),(22,'Quibdo','2018-10-06 21:07:30','2018-10-06 21:07:30',3,1,NULL,'',NULL,'','','','',19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'logos/cities/');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `delete_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Colombia','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_departments_on_country_id` (`country_id`),
  CONSTRAINT `fk_rails_1cbf437e14` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (5,'Valle del cauca','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(6,'Antioquia','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(7,'Magdalena','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(8,'Bolivar','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(9,'Santander','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(10,'Norte de santander','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(11,'Risarlda','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(12,'Cundinamarca','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(13,'Cauca','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(14,'Tolima','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(15,'Nariño','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(16,'Caldas','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(17,'Atlántico','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL),(18,'La Guajira','2018-10-06 16:04:34','2018-10-06 16:04:32',1,NULL),(19,'Chocó','2018-10-06 16:06:55','2018-10-06 16:06:56',1,NULL),(20,'Huila','2018-10-06 16:07:59','2018-10-06 16:08:00',1,NULL),(21,'Quindío','2018-10-06 16:09:24','2018-10-06 16:09:26',1,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_cities`
--

DROP TABLE IF EXISTS `goal_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goal_cities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `score` float DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `goal` float DEFAULT NULL,
  `goal_id` bigint(20) DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_goal_cities_on_city_id` (`city_id`),
  KEY `index_goal_cities_on_goal_id` (`goal_id`),
  CONSTRAINT `fk_rails_298fe77407` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `fk_rails_6908602606` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4028 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_cities`
--

LOCK TABLES `goal_cities` WRITE;
/*!40000 ALTER TABLE `goal_cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_groups`
--

DROP TABLE IF EXISTS `goal_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goal_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `delete_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_groups`
--

LOCK TABLES `goal_groups` WRITE;
/*!40000 ALTER TABLE `goal_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `delete_at` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `folder_avatar` varchar(255) DEFAULT 'logos/goals/',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
INSERT INTO `goals` VALUES (1,'01','PONER FIN A LA POBREZA EN TODAS SUS FORMAS EN TODO EL MUNDOODS1- .','Este objetivo consiste en aumentar los ingresos de las personas más\r\npobres y en garantizar un acceso a los servicios básicos y proteger a todo\r\nel mundo de los desastres naturales y de los desastres de origen humano','2018-08-30 20:08:21','2018-10-16 20:58:58',NULL,'ods1.jpg','logos/goals/'),(2,'02','PONER FINAL HAMBRE, LOGRAR LA SEGURIDADALIMENTARIA Y LA MEJORA DELA NUTRICIÓNY PROMOVER LAAGRICULTURA SOSTENIBLE.','Este objetivo consiste en garantizar que todo el mundo pueda\r\nbeneficiarse de una dieta saludable y nutritiva durante todo el año','2018-08-30 20:08:22','2018-10-16 20:59:04',NULL,'ods2.jpg','logos/goals/'),(3,'03','GARANTIZARUNA VIDA SANAY PROMOIVER EL BIENESTAR PARATODOS EN TODAS LAS EDADES.','Este objetivo consiste en ayudar a las personas\r\na vivir más tiempo y en mejores condiciones','2018-08-30 20:08:23','2018-10-16 20:59:10',NULL,'ods3.jpg','logos/goals/'),(4,'04','GARANTIZAR UNAEDUCACIÓN INCLUSIVA, EQUITATIVAY DE CALIDAD Y PROMOVEROPORTUNIDADES DE APRENDIZAJEDURANTE TODA LA VIDA PARA TODOS.','Este objetivo consiste en proporcionar a todas las personas el acceso\r\nala educación, a la formación y al pleno desarrollo de su potencial','2018-08-30 20:08:23','2018-10-16 20:59:17',NULL,'ods4.jpg','logos/goals/'),(5,'05','LOGRAR LA IGUALDADENTRE LOS GÉNEROSY EMPODERAR A TODASLAS MUJERES Y NIÑAS.','Este objetivo consiste en acabar con la violencia y la discriminación\r\ncontra las mujeres y las chicas y asegurar que tengan las mismas\r\noportunidades en todos los ámbitos de la vida','2018-08-30 20:08:23','2018-10-16 20:59:24',NULL,'ods5.jpg','logos/goals/'),(6,'06','GARANTIZAR LA DISPONIBILIDADY LA GESTIÓN SOSTENIBLEDE AGUA Y SANEAMIENTOPARA TODOS.','Este objetivo consiste en garantizar que todo el mundo tenga\r\nacceso a agua potable limpia y a instalaciones sanitarias','2018-08-30 20:08:24','2018-10-16 20:59:31',NULL,'ods6.jpg','logos/goals/'),(7,'07','GARANTIZAR EL ACCESO A UNAENERGÍA ASEQUIBLE, SEGURA,SOSTENIBLE Y MODERNA PARA TODOS.','Este objetivo consiste en garantizar que todo el mundo tenga\r\nacceso a energía verde','2018-08-30 20:08:24','2018-10-16 20:59:39',NULL,'ods7.jpg','logos/goals/'),(8,'08','PROMOVER UNCRECIMIENTOECONÓMICO SOSTENIDO INCLUSIVOY SOSTENIBLE EL EMPLEO PLENOY PRODUCTIVO Y ELTRABAJO DECENTE PARA TODOS.','Este objetivo consiste en crear puestos de trabajo dignos\r\nyoportunidades económicas para todos','2018-08-30 20:08:24','2018-10-16 20:59:45',NULL,'ods8.jpg','logos/goals/'),(9,'09','CONSTRUIRINFRAESTRUCTURASRESILIENTES, PROMOVER UNAINDUSTRIALIZACIÓN INCLUSIVA YSOSTENIBLE Y FOMENTARLA INNOVACIÓN.','Este objetivo consiste en garantizar que todo el mundo\r\ndisponga de las infraestructuras necesarias para conectarse\r\ncon el resto del mundo','2018-08-30 20:08:24','2018-10-16 20:59:52',NULL,'ods9.jpg','logos/goals/'),(10,'10','REDUCIR LADESIGUALDADEN Y ENTRE TODOS LOS PAÍSES.','Este objetivo consiste en reducir la distancia entre\r\nlos más ricos y los más pobres','2018-08-30 20:08:24','2018-10-16 20:59:59',NULL,'ods10.jpg','logos/goals/'),(11,'11','LOGRAR QUELAS CIUDADESY LOS ASENTAMIENTOSHUMANOS SEAN INCLUSIVOS,SEGUROS,RESILIENTES Y SOSTENIBLES.','Este objetivo consiste en situar a las ciudades en el centro\r\ndeldesarrollo sostenible en un mundo cada vez más urbanizado','2018-08-30 20:08:24','2018-10-16 21:00:08',NULL,'ods11.jpg','logos/goals/'),(12,'12','GARANTIZAR MODALIDADES DECONSUMO Y PRODUCCIÓNSOSTENIBLES.','Este objetivo consiste en reducir nuestro impacto en el planeta\r\nproduciendo y consumiendo solamente lo que necesitamos','2018-08-30 20:08:24','2018-10-16 21:00:17',NULL,'ods12.jpg','logos/goals/'),(13,'13','ADOPTAR MEDIDAS URGENTESPARA COMBATIR ELCAMBIO CLIMÁTICOY SUS EFECTOS.','Este objetivo consiste en gestionar los efectos del\r\ncalentamiento global','2018-08-30 20:08:24','2018-10-16 21:00:27',NULL,'ods13.jpg','logos/goals/'),(14,'14','CONSERVAR Y UTILIZAR DE FORMASOSTENIBLE LOS OCÉANOS ,LOS MARES Y LOS RECURSOS MARINOSPARA EL DESARROLLO SOSTENIBLE.','Este objetivo consiste en proteger las costas y los océanos','2018-08-30 20:08:24','2018-10-16 21:00:36',NULL,'ods14.jpg','logos/goals/'),(15,'15','PROMOVER EL USOSOSTENIBLE DELOS ECOSISTEMASTERRESTRES, LUCHAR CONTRALA DESERTIFICACIÓN, DETENER EINVERTIR LA DEGRADACIÓN DELAS TIERRAS Y FRENAR LA PÉRDIDADE LA DIVERSIDAD BIOLÓGICA.','Este objetivo consiste en proteger la fauna\r\ny los recursos naturales','2018-08-30 20:08:24','2018-10-16 21:00:45',NULL,'ods15.jpg','logos/goals/'),(16,'16','PROMOVER SOCIEDADES PACÍFICAS E INCLUSIVASPARA EL DESARROLLO SOSTENIBLE,FACILITAR EL ACCESO A LA JUSTICIAPARA TODOS Y CREAR INSTITUCIONESINSTITUCIONESEFICACES, RESPONSABLES EINCLUSIVAS A TODOS LOS NIVELES.','Este objetivo consiste en acabar con la violencia y la discriminación\r\ncontra las mujeres y las chicas y asegurar que tengan las mismas\r\noportunidades en todos los ámbitos de la vida','2018-08-30 20:08:24','2018-10-16 21:00:56',NULL,'ods16.jpg','logos/goals/'),(17,'17','FORTALECER LOS MEDIOS DEEJECUCIÓN Y REVITALIZAR LAALIANZA MUNDIAL GLOBALPARA EL DESARROLLO SOSTENIBLE.','Este objetivo consiste en colaborar a nivel global para alcanzar los\r\nObjetivos de Desarrollo Sostenible y hacer realidad la Agenda Post-2015','2018-08-30 20:08:24','2018-10-16 21:01:04',NULL,'ods17.jpg','logos/goals/');
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_cities`
--

DROP TABLE IF EXISTS `group_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `group_cities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` text,
  `delete_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_cities`
--

LOCK TABLES `group_cities` WRITE;
/*!40000 ALTER TABLE `group_cities` DISABLE KEYS */;
INSERT INTO `group_cities` VALUES (1,'C1','0000-00-00 00:00:00','2018-10-06 21:02:12','',NULL),(2,'C2','0000-00-00 00:00:00','2018-10-06 21:02:17','',NULL),(3,'C3','0000-00-00 00:00:00','2018-10-06 21:02:21','',NULL);
/*!40000 ALTER TABLE `group_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicator_values`
--

DROP TABLE IF EXISTS `indicator_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `indicator_values` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `score` float DEFAULT NULL,
  `date_from` year(4) DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `indicator_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_indicator_values_on_indicator_id` (`indicator_id`),
  KEY `index_indicator_values_on_city_id` (`city_id`),
  CONSTRAINT `fk_rails_8a32010806` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`),
  CONSTRAINT `fk_rails_a2c6e85263` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicator_values`
--

LOCK TABLES `indicator_values` WRITE;
/*!40000 ALTER TABLE `indicator_values` DISABLE KEYS */;
INSERT INTO `indicator_values` VALUES (7057,NULL,2015,NULL,'2018-10-08 21:30:41','2018-10-08 21:30:41',1,20),(7058,2.4,2015,NULL,'2018-10-08 21:30:41','2018-10-08 21:30:41',1,4),(7059,2,2015,NULL,'2018-10-08 21:30:41','2018-10-08 21:30:41',1,1),(7060,NULL,2015,NULL,'2018-10-08 21:30:41','2018-10-08 21:30:41',1,9),(7061,NULL,2015,NULL,'2018-10-08 21:30:41','2018-10-08 21:30:41',1,21),(7062,3.4,2015,NULL,'2018-10-08 21:30:41','2018-10-08 21:30:41',1,3),(7063,5.5,2015,NULL,'2018-10-08 21:30:41','2018-10-08 21:30:41',1,10),(7064,6.9,2015,NULL,'2018-10-08 21:30:41','2018-10-08 21:32:45',1,6),(7065,2.6,2015,NULL,'2018-10-08 21:30:41','2018-10-08 21:30:41',1,8),(7066,1.7,2015,NULL,'2018-10-08 21:30:41','2018-10-08 21:32:45',1,14),(7067,NULL,2015,NULL,'2018-10-08 21:32:52','2018-10-08 21:32:52',1,2),(7068,NULL,2015,NULL,'2018-10-08 21:32:52','2018-10-08 21:32:52',1,11),(7069,NULL,2015,NULL,'2018-10-08 21:32:52','2018-10-08 21:32:52',1,19),(7070,2.1,2015,NULL,'2018-10-08 21:32:52','2018-10-08 21:32:52',1,13),(7071,NULL,2015,NULL,'2018-10-08 21:32:52','2018-10-08 21:32:52',1,18),(7072,NULL,2015,NULL,'2018-10-08 21:32:52','2018-10-08 21:32:52',1,22),(7073,NULL,2015,NULL,'2018-10-08 21:32:52','2018-10-08 21:32:52',1,7),(7074,NULL,2015,NULL,'2018-10-08 21:32:52','2018-10-08 21:32:52',1,12),(7075,NULL,2016,NULL,'2018-10-08 22:04:14','2018-10-08 22:04:14',1,20),(7076,2.8,2016,NULL,'2018-10-08 22:04:14','2018-10-08 22:04:14',1,4),(7077,2.3,2016,NULL,'2018-10-08 22:04:14','2018-10-08 22:04:14',1,1),(7078,1.2,2016,NULL,'2018-10-08 22:04:14','2018-10-08 22:04:14',1,9),(7079,NULL,2016,NULL,'2018-10-08 22:04:14','2018-10-08 22:04:14',1,21),(7080,3.2,2016,NULL,'2018-10-08 22:04:14','2018-10-08 22:04:14',1,3),(7081,NULL,2016,NULL,'2018-10-08 22:04:14','2018-10-08 22:04:14',1,10),(7082,NULL,2016,NULL,'2018-10-08 22:04:14','2018-10-08 22:04:14',1,6),(7083,NULL,2016,NULL,'2018-10-08 22:04:14','2018-10-08 22:04:14',1,8),(7084,NULL,2016,NULL,'2018-10-08 22:04:14','2018-10-08 22:04:14',1,14),(7085,NULL,2015,NULL,'2018-10-08 22:27:43','2018-10-08 22:27:43',4,20),(7086,4.1,2015,NULL,'2018-10-08 22:27:43','2018-10-08 22:27:43',4,4),(7087,0.8,2015,NULL,'2018-10-08 22:27:43','2018-10-08 22:27:43',4,1),(7088,NULL,2015,NULL,'2018-10-08 22:27:43','2018-10-08 22:27:43',4,9),(7089,NULL,2015,NULL,'2018-10-08 22:27:43','2018-10-08 22:27:43',4,21),(7090,2.1,2015,NULL,'2018-10-08 22:27:43','2018-10-08 22:27:43',4,3),(7091,NULL,2015,NULL,'2018-10-08 22:27:43','2018-10-08 22:27:43',4,10),(7092,NULL,2015,NULL,'2018-10-08 22:27:43','2018-10-08 22:27:43',4,6),(7093,NULL,2015,NULL,'2018-10-08 22:27:43','2018-10-08 22:27:43',4,8),(7094,NULL,2015,NULL,'2018-10-08 22:27:43','2018-10-08 22:27:43',4,14),(7095,NULL,2015,NULL,'2018-10-08 22:30:00','2018-10-08 22:30:00',7,20),(7096,0.75,2015,NULL,'2018-10-08 22:30:00','2018-10-08 22:30:00',7,4),(7097,0.47,2015,NULL,'2018-10-08 22:30:00','2018-10-08 22:30:00',7,1),(7098,NULL,2015,NULL,'2018-10-08 22:30:01','2018-10-08 22:30:01',7,9),(7099,NULL,2015,NULL,'2018-10-08 22:30:01','2018-10-08 22:30:01',7,21),(7100,0.4,2015,NULL,'2018-10-08 22:30:01','2018-10-08 22:30:01',7,3),(7101,0.52,2015,NULL,'2018-10-08 22:30:01','2018-10-08 22:30:01',7,10),(7102,0.57,2015,NULL,'2018-10-08 22:30:01','2018-10-08 22:30:01',7,6),(7103,0.52,2015,NULL,'2018-10-08 22:30:01','2018-10-08 22:30:01',7,8),(7104,0.55,2015,NULL,'2018-10-08 22:30:01','2018-10-08 22:30:01',7,14);
/*!40000 ALTER TABLE `indicator_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicators`
--

DROP TABLE IF EXISTS `indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `indicators` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `national_base_line` varchar(255) DEFAULT NULL,
  `year_national_base_line` varchar(255) DEFAULT NULL,
  `national_goal` varchar(255) DEFAULT NULL,
  `year_national_goal` varchar(255) DEFAULT NULL,
  `reference_value_low` varchar(255) DEFAULT NULL,
  `reference_value_mid` varchar(255) DEFAULT NULL,
  `reference_value_high` varchar(255) DEFAULT NULL,
  `trazador_conpes` varchar(255) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `institutional_inf` varchar(255) DEFAULT NULL,
  `methodological_proposal` varchar(255) DEFAULT NULL,
  `comment` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `target_id` bigint(20) DEFAULT NULL,
  `measure_id` bigint(20) DEFAULT NULL,
  `target_type` enum('INCREMENT','DECREMENT') DEFAULT NULL,
  `trazador_goal` tinyint(1) DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_indicators_on_target_id` (`target_id`),
  KEY `index_indicators_on_measure_id` (`measure_id`),
  CONSTRAINT `fk_rails_215de16073` FOREIGN KEY (`target_id`) REFERENCES `targets` (`id`),
  CONSTRAINT `fk_rails_f69ece9898` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicators`
--

LOCK TABLES `indicators` WRITE;
/*!40000 ALTER TABLE `indicators` DISABLE KEYS */;
INSERT INTO `indicators` VALUES (1,'1.1.1','Incidencia de pobreza monetaria extrema','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','7.9',NULL,'4.8','2030','<4','4-8','>8','',1,'','Proy. datos historicos','Propuesta RCCV','2018-08-30 20:08:21','2018-10-06 22:07:27',1,1,NULL,1,NULL),(2,'1.2.1','Incidencia de la Pobreza Monetaria','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','27.8',NULL,'18.7','2030','<12','12-25','>25','',1,'','Proy. datos historicos','BID','2018-08-30 20:08:21','2018-10-06 22:07:18',2,1,NULL,1,NULL),(3,'1.3.1','Porcentaje de población afiliada al sistema de salud','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','7.9',NULL,'4.8','2030','<4','4-8','>8',NULL,1,'','Proy. datos historicos','BID','2018-08-30 20:08:21','2018-08-30 20:08:21',3,NULL,NULL,NULL,NULL),(4,'2.1.1','Proporción de población con Inseguridad alimentaria moderada o severa','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','',NULL,'','2030','','','','',1,'','Referente internacional','','2018-08-30 20:08:22','2018-10-06 22:07:09',5,1,NULL,1,NULL),(5,'2.2.1','Prevalencia de desnutrición global en menores de 5 años','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','6.8',NULL,'5.0','2030','<4','4-7','>7',NULL,1,'','Proy. datos historicos','Propuesta RCCV','2018-08-30 20:08:22','2018-08-30 20:08:22',6,NULL,NULL,NULL,NULL),(6,'2.2.2','Tasa de mortalidad por desnutrición en menores de 5 años','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','6.8',NULL,'5.0','2030','<4','4-7','>7','',1,'','Proy. datos historicos','Propuesta RCCV','2018-08-30 20:08:22','2018-10-06 22:10:38',6,4,NULL,1,NULL),(7,'3.1.1','Razón de mortalidad materna a 42 días','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','53.7',NULL,'32.0','2030','<30','30-55','>55','',1,'','Referente internacional','Propuesta RCCV','2018-08-30 20:08:23','2018-10-07 14:46:02',7,5,NULL,1,NULL),(8,'3.2.1','Tasa de mortalidad en menores de 5 años (ajustada)','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','17.1',NULL,'14.0','2030','<14','14-17','>17','',1,'','Referente internacional','Propuesta RCCV','2018-08-30 20:08:23','2018-10-07 14:46:30',8,5,NULL,1,NULL),(9,'3.2.2','Tasa de mortalidad infantil en menores de 1 año (ajustada)','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','53.7',NULL,'32.0','2030','<30','30-55','>55','',1,'','Referente internacional','Propuesta RCCV','2018-08-30 20:08:23','2018-10-07 14:47:07',8,5,NULL,1,NULL),(10,'4.1.1','Tasa de cobertura bruta en educación media','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','77.8',NULL,'50','2030','>70','51-70','<51','',1,'','Pendiente','BID (Ojo, meta cobertura neta)','2018-08-30 20:08:23','2018-10-08 14:46:22',9,1,NULL,1,NULL),(11,'4.2.1','Indice sintético de calidad en media','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','',NULL,'','2030','','','','',1,'','Pendiente','','2018-08-30 20:08:23','2018-10-06 21:40:04',38,1,NULL,1,NULL),(12,'4.1.2','Índice sintético de calidad en media','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','',NULL,'','2030','','','',NULL,1,'','Pendiente','','2018-08-30 20:08:23','2018-10-06 21:40:22',9,NULL,NULL,NULL,'2018-10-06 21:40:22'),(13,'4.5.1','Brecha entre zona rural y urbana de la cobertura bruta en educación preescolar, básica y media','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','',NULL,'','2030','','','','',1,'','Pendiente','','2018-08-30 20:08:23','2018-10-08 14:49:22',40,9,NULL,1,NULL),(14,'5.2.3','Porcentaje de mujeres, alguna vez unidas, que han experimentado alguna violencia física por parte del esposo o compañero','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','',NULL,'14','2030','<14','14-25','>25','',1,'','Proy. datos historicos','BID (Porcentaje de mujeres que han sufrido violencia física de parte de una pareja o ex pareja alguna\nvez en la vida)','2018-08-30 20:08:23','2018-10-08 14:50:19',11,3,NULL,1,NULL),(15,'6.2.1','Porcentaje de la población con acceso a métodos de abastecimiento de agua adecuados','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','91.8',NULL,'100','2030','95-100','85-95','<85','',1,'','','','0000-00-00 00:00:00','2018-10-08 14:52:12',13,1,NULL,1,NULL),(16,'6.4.1','Eficiencia en el consumo residencial de agua potable por habitante','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','',NULL,'','2030','','','','',1,'','','','0000-00-00 00:00:00','2018-10-08 14:54:06',33,6,NULL,1,NULL),(17,'7.1.1','consumo de electricidad per capita ','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','',NULL,'5000','2030','<5000','5000-25000','>25000','',1,'','','','0000-00-00 00:00:00','2018-10-08 14:55:18',15,6,NULL,1,NULL),(18,'8.3.1','Tasa de formalidad laboral','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','',NULL,'30','2030','<30','30-55','>55','',1,'','','','0000-00-00 00:00:00','2018-10-08 14:56:08',18,1,NULL,1,NULL),(19,'9.5.1','Inversión en investigación y desarrollo como porcentaje del PIB','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ','',NULL,'','2030','','','','',1,'','','','0000-00-00 00:00:00','2018-10-08 15:20:34',45,1,NULL,1,NULL),(20,'10.1.1','Coeficiente de GINI\r\n','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,'2030',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',22,NULL,NULL,NULL,NULL),(21,'11.1.2','Porcentaje de hogares urbanos en condiciones de déficit de vivienda cuantitativo','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,'2030','<10','10-25','>25',NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',25,NULL,NULL,NULL,NULL),(22,'11.2.1','Promedio diario en el número de pasajeros movilizados por el transporte público colectivo','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',26,NULL,NULL,NULL,NULL),(23,'11.5.1','Tasa de afectación por desastres naturales','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',34,NULL,NULL,NULL,NULL),(24,'12.5.1','Tasa de reciclaje y nueva utilización de residuos sólidos generados','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',35,NULL,NULL,NULL,NULL),(25,'13.1.1','Ciudades con inventarios de GEI','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',28,NULL,NULL,NULL,NULL),(26,'14.1.1','Indicador de calidad del agua marina','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',29,NULL,NULL,NULL,NULL),(27,'15.1.1','Áreas verdes por 100.000 habitantes','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',30,NULL,NULL,NULL,NULL),(28,'15.1.2','Porcentaje de area protegidas urbanas incluidas en el POT con plan de manejo ambiental en ejecución ','orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',30,NULL,NULL,NULL,NULL),(29,'16.1.1','Tasa de homicidio','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',31,NULL,NULL,NULL,NULL),(30,'17.1.1','Ingresos propios como porcentaje de ingresos totales','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',32,NULL,NULL,NULL,NULL),(31,'17.1.2','Alineación del presupuesto con el plan','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',32,NULL,NULL,NULL,NULL),(32,'17.1.3','Recaudo tributario per cápita','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',32,NULL,NULL,NULL,NULL),(33,'3.6.1','Tasa General de Mortalidad por Accidentes de Tránsito terrestre (TGMA)','','',NULL,'',NULL,'','','','',1,'','','','2018-10-06 21:34:34','2018-10-06 21:34:34',36,3,NULL,1,NULL),(34,'3.8.1','Porcentaje de niños y niñas de un año con vacunación de triple viral','','',NULL,'',NULL,'','','','',1,'','','','2018-10-06 21:35:36','2018-10-06 21:35:36',37,1,NULL,1,NULL),(35,'4.3.1','Tasa de cobertura bruta en educación superior','','',NULL,'',NULL,'','','','',1,'','','','2018-10-08 14:47:08','2018-10-08 14:47:08',39,1,NULL,1,NULL),(36,'5.2.4','Examen medico legal por presunto delito sexual en mujeres','','',NULL,'',NULL,'','','','',1,'','','','2018-10-08 14:50:51','2018-10-08 14:50:51',11,3,NULL,1,NULL),(37,'5.5.1','Proporción de mujeres que conforman el Concejo municipal o distrital (Estado colombiano CONPES)','','',NULL,'',NULL,'','','','',1,'','','','2018-10-08 14:51:23','2018-10-08 14:51:23',41,1,NULL,1,NULL),(38,'5.a','Brecha de ingreso mensual promedio entre hombres y mujeres','','',NULL,'',NULL,'','','','',1,'','','','2018-10-08 14:51:44','2018-10-08 14:51:44',42,1,NULL,1,NULL),(39,'6.3.1','Porcentaje de aguas residuales urbanas domésticas tratadas','','',NULL,'',NULL,'','','','',1,'','','','2018-10-08 14:52:42','2018-10-08 14:52:42',14,1,NULL,1,NULL),(40,'6.3.2','Porcentaje de puntos de monitoreo con categoría buena o aceptable del Índice de Calidad de Agua (ICA)','','',NULL,'',NULL,'','','','',1,'','','','2018-10-08 14:53:20','2018-10-08 14:53:20',14,1,NULL,1,NULL),(41,'7.3.2','Intensidad energetica','','',NULL,'',NULL,'','','','',1,'','','','2018-10-08 14:55:44','2018-10-08 14:55:44',17,7,NULL,1,NULL),(42,'8.5.1','Tasa de desempleo','','',NULL,'',NULL,'','','','',1,'','','','2018-10-08 14:56:51','2018-10-08 14:56:51',19,1,NULL,1,NULL),(43,'8.6.1','Porcentaje de jóvenes que no estudian y no tienen empleo','','',NULL,'',NULL,'','','','',1,'','','','2018-10-08 14:57:24','2018-10-08 14:57:24',43,1,NULL,1,NULL),(44,'8.7.1','Tasa de trabajo infantil','','',NULL,'',NULL,'','','','',1,'','','','2018-10-08 14:57:56','2018-10-08 14:57:56',44,1,NULL,1,NULL),(45,'9.c','Número de suscriptores de Internet fijo por cada 1000 habitantes','','',NULL,'',NULL,'','','','',1,'','','','2018-10-08 15:22:01','2018-10-08 15:22:01',46,3,NULL,1,NULL);
/*!40000 ALTER TABLE `indicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measures`
--

DROP TABLE IF EXISTS `measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `measures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `delete_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measures`
--

LOCK TABLES `measures` WRITE;
/*!40000 ALTER TABLE `measures` DISABLE KEYS */;
INSERT INTO `measures` VALUES (1,'PERCENT','2018-08-30 20:08:20','2018-08-30 20:08:20',NULL),(2,'NUMBER','2018-08-30 20:08:20','2018-10-06 22:07:57','2018-10-06 22:07:56'),(3,'Tasa por cada 100.000 habitantes','2018-10-06 21:33:33','2018-10-06 21:33:58',NULL),(4,'Tasa por cada 100.000 niños y niñas menores de 5 años','2018-10-06 22:08:01','2018-10-06 22:08:01',NULL),(5,'Tasa por cada 1000 nacidos vivos','2018-10-06 22:08:08','2018-10-06 22:08:08',NULL),(6,'Tasa por hab.','2018-10-06 22:08:24','2018-10-06 22:08:24',NULL),(7,'kWh/miles de millones de pesos','2018-10-06 22:08:31','2018-10-06 22:08:31',NULL),(8,'PM','2018-10-06 22:08:42','2018-10-06 22:08:42',NULL),(9,'Puntos porcentuales','2018-10-06 22:08:53','2018-10-06 22:08:53',NULL),(10,'km2/hab','2018-10-06 22:09:02','2018-10-06 22:09:02',NULL),(11,'Hectareas','2018-10-06 22:09:09','2018-10-06 22:09:09',NULL),(12,'Tasa','2018-10-06 22:09:42','2018-10-06 22:09:42',NULL),(13,'Pesos corriente','2018-10-06 22:10:08','2018-10-06 22:10:08',NULL);
/*!40000 ALTER TABLE `measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `delete_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'test',NULL,'2018-09-27 20:05:51','2018-09-27 20:05:51',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20180815143945'),('20180815145324'),('20180815150352'),('20180815151210'),('20180815151818'),('20180815152009'),('20180815152117'),('20180815152805'),('20180815153040'),('20180815153418'),('20180815153627'),('20180815160112'),('20180815160949'),('20180815161112'),('20180820171100'),('20180820171923'),('20180820172641'),('20180820173130'),('20180820173602'),('20180821175039'),('20180821180412'),('20180821183239'),('20180821183512'),('20180821184011'),('20180822154332'),('20180822154528'),('20180822161029'),('20180823190612'),('20180823191941'),('20180823192143'),('20180823220753'),('20180824205324'),('20180830210740'),('20180905170747'),('20180907151203'),('20180907153243'),('20180910190628'),('20180919170211'),('20181004222451'),('20181005174840'),('20181005190503'),('20181009155832'),('20181011162048'),('20181015210843'),('20181015224215'),('20181016220700');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targets`
--

DROP TABLE IF EXISTS `targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `targets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text,
  `number` varchar(255) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `goal_id` bigint(20) DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `index_targets_on_goal_id` (`goal_id`),
  CONSTRAINT `fk_rails_808bb8fbf7` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targets`
--

LOCK TABLES `targets` WRITE;
/*!40000 ALTER TABLE `targets` DISABLE KEYS */;
INSERT INTO `targets` VALUES (1,'Para 2030, ERRADICAR LA POBREZA EXTREMA para todas las personas en el mundo. Actualmente, se considera que viven en la pobreza extrema a las personas que subsisten con menos de 1,25 $ al día','1.1',1,'2018-08-30 20:08:21','2018-08-30 20:08:21',1,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(2,'Para 2030 reducir al menos a la mitad la proporción de hombres, mujeres y niños de todas las edades que viven en la POBREZA EN TODAS SUS DIMENSIONES con arreglo a las definiciones nacionales','1.2',1,'2018-08-30 20:08:21','2018-08-30 20:08:21',1,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(3,'Para 2030, garantizar que todos los hombres y mujeres, en particularlos pobres y los vulnerables, tengan los mismos derechos sobre los recursos económicos, así como ACCESSO A LOS SERVICIOS BÁSICOS, la propiedad y el control de las tierraS(y otros bienes, la herencia, los recursos naturales, las nuevas tecnologías apropiadas y servicios financieros, incluida las microfinanciación','1.3',1,'2018-08-30 20:08:21','2018-08-30 20:08:21',1,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(4,'Para 2030, FOMENTAR LA RESILIENCIA DE LOS POBRES y las personas que se encuentran en situaciones vulnerables y reducir su exposición y vulnerabilidad a los fenómenos extremos relacionados con el clima y otras crisis y desastres económicos, sociales y ambientales','1.5',1,'2018-08-30 20:08:22','2018-08-30 20:08:22',1,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(5,'Para 2030, PONER FIN AL HAMBRE y asegurar el acceso de todas las personas, en particular los pobres y las personas en situaciones vulnerables, incluidos los lactantes, a una alimentación sana, nutritiva y suficiente durante todo el año','2.1',1,'2018-08-30 20:08:22','2018-08-30 20:08:22',2,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(6,'Para 2030, PONER FIN AL HAMBRE y asegurar el acceso de todas las personas, en particular los pobres y las personas en situaciones vulnerables, incluidos los lactantes, a una alimentación sana, nutritiva y suficiente durante todo el año','2.2',1,'2018-08-30 20:08:22','2018-08-30 20:08:22',2,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(7,'Para 2030, reducir la tasa mundial de MORTALIDAD MATERNA a menos de 70 por cada 100.000 nacidos vivos','3.1',1,'2018-08-30 20:08:23','2018-08-30 20:08:23',3,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(8,'Para 2030, poner fin a las muertes evitables de recién nacidos y de niños menores de 5 años','3.2',1,'2018-08-30 20:08:23','2018-08-30 20:08:23',3,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(9,'De aquí a 2030, asegurar que todas las niñas y todos los niños terminen la enseñanza primaria y secundaria, que ha de ser gratuita, equitativa y de calidad y producir resultados de aprendizaje pertinentes y efectivos.','4.1',1,'2018-08-30 20:08:23','2018-10-06 21:38:35',4,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(10,'Poner fin a TODAS LAS FORMAS DE DISCRIMINACIÓN contra todas las mujeres y niñas en todo el mundo','5.1',1,'2018-08-30 20:08:23','2018-08-30 20:08:23',5,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(11,'Eliminar todas las formas de VIOLENCIA CONTRA TODAS LAS MUJERES y niñas en los ámbitos público y privado, incluidas la trata y la explotación sexual y otros tipos de explotación','5.2',1,'2018-08-30 20:08:23','2018-08-30 20:08:23',5,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(12,'Para 2030, lograr el acceso universal y equitativo al AGUA POTABLE, A UN PRECIO ASEQUIBLE para todos','6.1',1,'0000-00-00 00:00:00','0000-00-00 00:00:00',6,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(13,'De aquí a 2030, lograr el acceso universal y equitativo al agua potable a un precio asequible para todos','6.2',1,'0000-00-00 00:00:00','2018-10-06 21:42:47',6,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(14,'De aquí a 2030, mejorar la calidad del agua reduciendo la contaminación, eliminando el vertimiento y minimizando la emisión de productos químicos y materiales peligrosos, reduciendo a la mitad el porcentaje de aguas residuales sin tratar y aumentando considerablemente el reciclado y la reutilización sin riesgos a nivel mundial','6.3',1,'0000-00-00 00:00:00','2018-10-06 21:42:59',6,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(15,' Para 2030, garantizar el ACCESO UNIVERSAL a servicios de energía asequibles, confiables y modernos','7.1',1,'0000-00-00 00:00:00','2018-10-06 21:47:34',7,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(16,'Para 2030, aumentar sustancialmente el porcentaje de la ENERGÍA RENOVABLE en el conjunto de fuentes de energía','7.2',1,'0000-00-00 00:00:00','0000-00-00 00:00:00',7,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(17,'Doblar la tasa mundial de mejora de la eficiencia energética de aquí a 2030.','7.3',1,'0000-00-00 00:00:00','2018-10-06 21:47:55',7,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(18,'Promover políticas orientadas al desarrollo que apoyen las actividades productivas, la creación de puestos de trabajo decentes, el emprendimiento, la creatividad y la innovación, y fomentar la formalización y el crecimiento de las microempresas y las pequeñas y medianas empresas, incluso mediante el acceso a servicios financieros','8.3',1,'0000-00-00 00:00:00','2018-10-06 21:48:12',8,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(19,'De aquí a 2030, lograr el empleo pleno y productivo y el trabajo decente para todas las mujeres y los hombres, incluidos los jóvenes y las personas con discapacidad, así como la igualdad de remuneración por trabajo de igual valor','8.5',1,'0000-00-00 00:00:00','2018-10-06 21:48:29',8,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(20,'Desarrollar INFRAESTRUCTURAS fiables, sostenibles, resilientes y de calidad, incluidas infraestructuras regionales y transfronterizas, para apoyar el desarrollo económico y el bienestar humano, con especial hincapié en el ACCESO EQUITATIVO Y ASEQUIBLE PARA TODOS','9.1',1,'0000-00-00 00:00:00','0000-00-00 00:00:00',9,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(21,'Aumentar el acceso de las pequeñas empresas industriales y otras empresas, en particular en los países en desarrollo, a los servicios financieros, incluido el acceso a créditos asequibles, y su INTEGRACIÓN EN LAS CADENAS DE VALOR Y LOS MERCADOS','9.3',1,'0000-00-00 00:00:00','0000-00-00 00:00:00',9,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(22,'De aquí a 2030, lograr progresivamente y mantener el crecimiento de los ingresos del 40% más pobre de la población a una tasa superior a la media nacional','10.1',1,'0000-00-00 00:00:00','2018-10-06 21:50:21',10,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(23,'De aquí a 2030, potenciar y promover la inclusión social, económica y política de todas las personas, independientemente de su edad, sexo, discapacidad, raza, etnia, origen, religión o situación económica u otra condición','10.2',1,'0000-00-00 00:00:00','2018-10-06 21:50:41',10,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(24,'Garantizar la igualdad de oportunidades y reducir la desigualdad de los resultados, en particular mediante la ELIMINACIÓN DE LAS LEYES, POLÍTICAS Y PRÁCTICAS DISCRIMINATORIAS y la promoción de leyes, políticas y medidas adecuadas a ese respecto','10.3',1,'0000-00-00 00:00:00','0000-00-00 00:00:00',10,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(25,'De aquí a 2030, asegurar el acceso de todas las personas a viviendas y servicios básicos adecuados, seguros y asequibles y mejorar los barrios marginales','11.1',1,'0000-00-00 00:00:00','2018-10-06 21:50:51',11,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(26,'Para 2030, proporcionar acceso a sistemas de transportes seguros, económicos y sostenibles para todos, mejorar la seguridad vial, en particular mediante la ampliación del transporte público, con especial atención a las necesidades de las personas en situación de vulnerabilidad, mujeres, niños, personas con discapacidad y personas mayor','11.2',1,'0000-00-00 00:00:00','2018-10-06 21:51:11',11,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(27,'Para 2030, lograr la\r\ngestión sostenible y el\r\nUSO EFICIENTE DE LOS RECURSOS\r\nNATURALES','12.2',1,'0000-00-00 00:00:00','0000-00-00 00:00:00',12,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(28,'Fortalecer la resiliencia y capacidad de adaptación a los peligros relacionados con el clima y los desastres naturales en todos los países','13.1',1,'0000-00-00 00:00:00','2018-10-06 21:56:06',13,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(29,'De aquí a 2025, prevenir y reducir significativamente la contaminación marina de todo tipo, en particular la producida por actividades realizadas en tierra, incluidos los detritos marinos y la polución por nutrientes','14.1',1,'0000-00-00 00:00:00','2018-10-06 21:56:56',14,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(30,'De aquí a 2020, asegurar la conservación, el restablecimiento y el uso sostenible de los ecosistemas terrestres y los ecosistemas interiores de agua dulce y sus servicios, en particular los bosques, los humedales, las montañas y las zonas áridas, en consonancia con las obligaciones contraídas en virtud de acuerdos internacionales','15.1',1,'0000-00-00 00:00:00','2018-10-06 21:57:09',15,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(31,'Reducir significativamente todas las formas de violencia y las correspondientes tasas de mortalidad en todo el mundo','16.1',1,'0000-00-00 00:00:00','2018-10-06 21:57:27',16,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(32,'Fortalecer la movilización de recursos internos, incluso mediante la prestación de apoyo internacional a los países en desarrollo, con el fin de mejorar la capacidad nacional para recaudar ingresos fiscales y de otra índole','17.1',1,'0000-00-00 00:00:00','2018-10-06 22:02:59',17,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(33,'De aquí a 2030, aumentar considerablemente el uso eficiente de los recursos hídricos en todos los sectores y asegurar la sostenibilidad de la extracción y el abastecimiento de agua dulce para hacer frente a la escasez de agua y reducir considerablemente el número de personas que sufren falta de agua','6.4',1,'0000-00-00 00:00:00','2018-10-06 21:47:13',6,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(34,'De aquí a 2030, reducir significativamente el número de muertes causadas por los desastres, incluidos los relacionados con el agua, y de personas afectadas por ellos, y reducir considerablemente las pérdidas económicas directas provocadas por los desastres en comparación con el producto interno bruto mundial, haciendo especial hincapié en la protección de los pobres y las personas en situaciones de vulnerabilidad','11.5',1,'0000-00-00 00:00:00','2018-10-06 21:54:13',11,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(35,'De aquí a 2030, reducir considerablemente la generación de desechos mediante actividades de prevención, reducción, reciclado y reutilización','12.5',1,'0000-00-00 00:00:00','2018-10-06 21:55:04',12,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(36,' Para 2020, reducir a la mitad el número de muertes y lesiones causadas por ACCIDENTES DE TRÁFICO en el mundo','3.6',1,'2018-10-06 21:32:20','2018-10-06 21:32:20',3,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(37,'Lograr la cobertura sanitaria universal, incluida la protección contra los riesgos financieros, el acceso a servicios de salud esenciales de calidad y el acceso a medicamentos y vacunas inocuos, eficaces, asequibles y de calidad para todos','3.8',1,'2018-10-06 21:35:12','2018-10-06 21:35:12',3,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(38,' Para 2030, asegurar que todos los niños y niñas completen la educación primaria y secundaria gratuita, equitativa y de calidad que lleve a resultados relevantes y eficaces del aprendizaje.','4.2',1,'2018-10-06 21:38:53','2018-10-06 21:38:53',4,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(39,'De aquí a 2030, asegurar el acceso igualitario de todos los hombres y las mujeres a una formación técnica, profesional y superior de calidad, incluida la enseñanza universitaria.','4.3',1,'2018-10-06 21:41:02','2018-10-06 21:41:02',4,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(40,'De aquí a 2030, eliminar las disparidades de género en la educación y asegurar el acceso igualitario a todos los niveles de la enseñanza y la formación profesional para las personas vulnerables, incluidas las personas con discapacidad, los pueblos indígenas y los niños en situaciones de vulnerabilidad.','4.5',1,'2018-10-06 21:41:17','2018-10-06 21:41:17',4,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(41,'Garantizar la participación plena y efectiva de las mujeres y la igualdad de oportunidades para el liderazgo en todos los niveles de toma de decisiones en la vida política, económica y pública.','5.5',1,'2018-10-06 21:41:52','2018-10-06 21:41:52',5,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(42,'Emprender reformas que otorguen a las mujeres igualdad de derechos a los recursos económicos, así como acceso a la propiedad y al control de la tierra y otros tipos de bienes, los servicios financieros, la herencia y los recursos naturales, de conformidad con las leyes nacionales','5.a',1,'2018-10-06 21:42:27','2018-10-06 21:42:27',5,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(43,'De aquí a 2020, reducir considerablemente la proporción de jóvenes que no están empleados y no cursan estudios ni reciben capacitación','8.6',1,'2018-10-06 21:48:50','2018-10-06 21:48:50',8,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(44,'Adoptar medidas inmediatas y eficaces para erradicar el trabajo forzoso, poner fin a las formas contemporáneas de esclavitud y la trata de personas y asegurar la prohibición y eliminación de las peores formas de trabajo infantil,  incluidos el reclutamiento y la utilización de niños soldados, y, de aquí a 2025, poner fin al trabajo infantil en todas sus formas','8.7',1,'2018-10-06 21:49:10','2018-10-06 21:49:10',8,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(45,'Aumentar la investigación científica y mejorar la capacidad tecnológica de los sectores industriales de todos los países, en particular los países en desarrollo, entre otras cosas fomentando la innovación y aumentando considerablemente, de aquí a 2030, el número de personas que trabajan en investigación y desarrollo por millón de habitantes y los gastos de los sectores público y privado en investigación y desarrollo','9.5',1,'2018-10-06 21:49:51','2018-10-06 21:49:51',9,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(46,'Para 2020 Aumentar significativamente el acceso a las TIC y luchar por ofrecer acceso universal y asequible a Internet en los países menos desarrollados','9.c',1,'2018-10-06 21:50:06','2018-10-06 21:50:06',9,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(47,'De aquí a 2030, reducir el impacto ambiental negativo per cápita de las ciudades, incluso prestando especial atención a la calidad del aire y la gestión de los desechos municipales y de otro tipo','11.6',1,'2018-10-06 21:53:19','2018-10-06 21:53:19',11,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(48,'Para 2030, Proveer acceso universal a espacios verdes y públicos seguros, incluyentes y accesibles, en particular para las mujeres y los niños, los ancianos y las personas con discapacidad.','11.7',1,'2018-10-06 21:53:51','2018-10-06 21:53:51',11,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(49,'Incorporar medidas relativas al cambio climático en las políticas, estrategias y planes nacionales','13.2',1,'2018-10-06 21:56:38','2018-10-06 21:56:38',13,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(50,'Terminar con el abuso, la explotación, la trata y todas las formas de violencia y tortura contra los niños.','16.2',1,'2018-10-06 21:57:48','2018-10-06 21:57:48',16,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(51,'Garantizar el acceso público a la información y proteger las libertades fundamentales, de conformidad con las leyes nacionales y los acuerdos internacionales','16.10',1,'2018-10-06 21:58:18','2018-10-06 21:58:18',16,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),(52,' Para 2030, aprovechar las iniciativas existentes para elaborar indicadores que permitan medir progresos logrados en materia de desarrollo sostenible y que complementen los utilizados para medir el producto interno bruto, y apoyar el fomento de la CAPACIDAD ESTADÍSTICA en los países en desarrollo','17.19',1,'2018-10-06 22:03:14','2018-10-06 22:05:09',17,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s');
/*!40000 ALTER TABLE `targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `towns`
--

DROP TABLE IF EXISTS `towns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `towns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towns`
--

LOCK TABLES `towns` WRITE;
/*!40000 ALTER TABLE `towns` DISABLE KEYS */;
/*!40000 ALTER TABLE `towns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `identification_type` varchar(255) DEFAULT NULL,
  `identification` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_role_id` (`role_id`),
  KEY `index_users_on_city_id` (`city_id`),
  CONSTRAINT `fk_rails_642f17018b` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_rails_9c7442481a` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@gmail.com','$2a$11$g4vVMbJ7uDlvVsdJQVrgyeWpRJJu51tYuYPM4ReCduILA4rnuLrZK',NULL,NULL,NULL,14,'2018-10-22 18:37:19','2018-10-21 14:52:01','191.89.42.54','191.89.42.54',NULL,NULL,NULL,NULL,'2018-10-04 18:19:06','2018-10-22 18:37:19',NULL,NULL,NULL),(2,'milevisj@gmail.com','$2a$11$jNXQBvOPiZfGI480ED1.cuq5icNxRR3l4viM09jR6uYrdOfJ8Pvn.',NULL,NULL,NULL,5,'2018-10-19 20:36:31','2018-10-15 19:28:16','181.53.133.185','181.53.133.185',NULL,NULL,NULL,NULL,'2018-10-04 21:55:54','2018-10-19 20:36:31',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-01 17:16:36
