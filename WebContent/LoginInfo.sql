CREATE DATABASE  IF NOT EXISTS `LoginInfo`;
USE `LoginInfo`;

DROP TABLE IF EXISTS `User`;
#/*!40101 SET @saved_cs_client     = @@character_set_client */;
#/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
); #ENGINE=InnoDB DEFAULT CHARSET=latin1;
#/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `User` WRITE;
#/*!40000 ALTER TABLE `bars` DISABLE KEYS */;
INSERT INTO `User` VALUES ('arjun', 'password'), ('ravi', 'password');
#/*!40000 ALTER TABLE `bars` ENABLE KEYS */;
UNLOCK TABLES;
