/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `changevalue`
--

DROP TABLE IF EXISTS `changevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changevalue` (
  `hash_value` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hash_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dispense`
--

DROP TABLE IF EXISTS `dispense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispense` (
  `previous_sku` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modify_date` datetime(6) DEFAULT NULL,
  `dispense_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eye`
--

DROP TABLE IF EXISTS `eye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eye` (
  `additional` decimal(38,2) DEFAULT NULL,
  `axis` int(11) DEFAULT NULL CHECK (`axis` <= 180),
  `cylinder` decimal(38,2) DEFAULT NULL,
  `sphere` decimal(38,2) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glasses` (
  `dispensed` bit(1) DEFAULT NULL,
  `sku` int(11) DEFAULT NULL,
  `creation_date` datetime(6) DEFAULT NULL,
  `dispense_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `od_id` bigint(20) DEFAULT NULL,
  `os_id` bigint(20) DEFAULT NULL,
  `appearance` varchar(255) DEFAULT NULL,
  `glasses_size` varchar(255) DEFAULT NULL,
  `glasses_type` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3lcjb01rnq2hn89tl7v1k7yld` (`dispense_id`),
  KEY `FKovw8a7k5pow8in36qh2k3t0ja` (`od_id`),
  KEY `FKnnd7mfxvhrbjwv8p5xiswnai8` (`os_id`),
  KEY `sku` (`sku`),
  CONSTRAINT `FKn7g5jsbuiwnmpeh90i89y4gv0` FOREIGN KEY (`dispense_id`) REFERENCES `dispense` (`id`),
  CONSTRAINT `FKnnd7mfxvhrbjwv8p5xiswnai8` FOREIGN KEY (`os_id`) REFERENCES `eye` (`id`),
  CONSTRAINT `FKovw8a7k5pow8in36qh2k3t0ja` FOREIGN KEY (`od_id`) REFERENCES `eye` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unsuccessful_search`
--

DROP TABLE IF EXISTS `unsuccessful_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unsuccessful_search` (
  `increase_search_tolerance` bit(1) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `od_id` bigint(20) DEFAULT NULL,
  `os_id` bigint(20) DEFAULT NULL,
  `search_date` datetime(6) DEFAULT NULL,
  `bal_lens` varchar(255) DEFAULT NULL,
  `glasses_type` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7t97hwa6fd36m3mobo5bfgxk3` (`od_id`),
  KEY `FK2jxxit8euqbtutk6vmrs1pb6l` (`os_id`),
  CONSTRAINT `FK2jxxit8euqbtutk6vmrs1pb6l` FOREIGN KEY (`os_id`) REFERENCES `eye` (`id`),
  CONSTRAINT `FK7t97hwa6fd36m3mobo5bfgxk3` FOREIGN KEY (`od_id`) REFERENCES `eye` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FKhfh9dx7w3ubf1co1vdev94g3f` (`user_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test','$2a$10$vpFqQIbEm0Zd0eco2hLxgOTiujxoziOGvKgbX6KE1ud8hwdHJXsE2');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES
(1,1),
(1,2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'ROLE_USER'),
(2,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;





-- COPY dump from reims_dbf_extractor below this line ----------------------------------------------------------------------------------------------------------------




DELETE FROM glasses;
ALTER TABLE glasses AUTO_INCREMENT = 1;
DELETE FROM dispense;
ALTER TABLE dispense AUTO_INCREMENT = 1;
DELETE FROM eye;
ALTER TABLE eye AUTO_INCREMENT = 1;

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(1, 1.75,  -0.25, 26, 2.5);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(2, 1.75,  -2.25, 46, 2.5);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (1, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (2, 'multifocal',  'medium', 'neutral', 1,  'sa', 0, '2017-05-12 00:00:00', 2, 1);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(3, 1.75,  -0.5, 95, 3.25);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(4, 2.5,  -0.75, 99, 3.25);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (2, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (3, 'multifocal',  'medium', 'neutral', 2,  'sa', 0, '2017-05-12 00:00:00', 4, 3);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(5, 1.75,  -0.5, 59, 3.0);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(6, 1.25,  -0.5, 148, 3.0);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (3, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (4, 'multifocal',  'small', 'neutral', 3,  'sa', 0, '2017-05-12 00:00:00', 6, 5);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(7, 0.5,  0.0, 0, 2.75);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(8, 1.5,  -0.5, 95, 2.75);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (4, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (5, 'multifocal',  'medium', 'neutral', 4,  'sa', 0, '2013-04-15 00:00:00', 8, 7);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(9, 2.0,  -0.25, 5, 2.0);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(10, 2.25,  -1.0, 142, 2.0);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (5, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (7, 'multifocal',  'medium', 'feminine', 5,  'sa', 0, '2009-11-13 00:00:00', 10, 9);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(11, 2.5,  -0.75, 104, 2.5);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(12, 2.25,  -1.25, 54, 2.5);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (6, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (8, 'multifocal',  'medium', 'neutral', 6,  'sa', 0, '2009-06-07 00:00:00', 12, 11);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(13, 0.0,  0.0, 0, 2.0);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(14, 2.0,  -1.25, 76, 2.0);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (7, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (9, 'multifocal',  'medium', 'neutral', 7,  'sa', 0, '2013-04-15 00:00:00', 14, 13);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(15, 1.5,  -0.5, 101, 2.0);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(16, 2.0,  -0.5, 98, 2.0);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (8, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (10, 'multifocal',  'medium', 'neutral', 8,  'sa', 0, '2018-04-20 00:00:00', 16, 15);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(17, 11.0,  -0.5, 82, 2.0);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(18, 11.0,  -0.25, 13, 2.0);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (9, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (11, 'multifocal',  'small', 'neutral', 9,  'sa', 0, '2010-05-12 00:00:00', 18, 17);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19, -2.0,  -1.0, 3, 0.0);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(20, -1.0,  -2.0, 171, 0.0);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (10, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (12, 'single',  'small', 'neutral', 10,  'sa', 0, '2016-04-01 00:00:00', 20, 19);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19949, 1.25,  -1.0, 95, 2.5);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19950, 1.0,  -1.25, 74, 2.5);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (9975, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (9954, 'multifocal',  'medium', 'feminine', 9975,  'sm', 0, '2021-09-21 00:00:00', 19950, 19949);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19951, 3.25,  -0.5, 38, 2.75);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19952, 2.75,  -0.75, 150, 2.75);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (9976, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (9961, 'multifocal',  'medium', 'neutral', 9976,  'sm', 0, '2021-09-21 00:00:00', 19952, 19951);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19953, 2.5,  -0.5, 100, 2.5);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19954, 2.25,  -0.5, 90, 2.5);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (9977, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (9973, 'multifocal',  'small', 'neutral', 9977,  'sm', 0, '2021-09-21 00:00:00', 19954, 19953);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19955, 2.0,  0.0, 0, 2.5);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19956, 2.0,  0.0, 0, 2.5);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (9978, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (9977, 'multifocal',  'medium', 'feminine', 9978,  'sm', 0, '2021-09-21 00:00:00', 19956, 19955);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19957, 3.5,  -0.5, 90, 3.0);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19958, 2.5,  -0.5, 90, 3.0);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (9979, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (9980, 'multifocal',  'large', 'feminine', 9979,  'sm', 0, '2021-09-21 00:00:00', 19958, 19957);

INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19959, 3.25,  -0.5, 98, 3.0);
INSERT INTO eye (id, sphere, cylinder, axis, additional) VALUES(19960, 4.0,  -1.25, 169, 3.0);
INSERT INTO dispense (id, modify_date, previous_sku) VALUES (9980, null, null);
INSERT INTO glasses (sku, glasses_type, glasses_size, appearance, dispense_id, location, dispensed, creation_date, os_id, od_id) VALUES (9991, 'multifocal',  'medium', 'neutral', 9980,  'sm', 0, '2021-09-21 00:00:00', 19960, 19959);

