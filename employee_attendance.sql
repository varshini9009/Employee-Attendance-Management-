-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: employee_attendance_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `Attendance_Id` int NOT NULL AUTO_INCREMENT,
  `Employee_Id` int DEFAULT NULL,
  `Attendance_Date` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Attendance_Id`),
  KEY `Employee_Id` (`Employee_Id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`Employee_Id`) REFERENCES `employees` (`Employee_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (4,4,'2026-10-11','Present'),(5,1,'2026-10-12','present'),(6,4,'2026-10-12','present'),(7,5,'2026-10-12','present'),(9,7,'2026-10-17','Half Day'),(11,7,'2026-10-29','Absent'),(14,7,'2026-10-30','Present'),(15,8,'2026-10-30','Present'),(18,11,'2026-10-31','Present');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `Employee_Id` int NOT NULL,
  `Employee_Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Designation` varchar(100) DEFAULT NULL,
  `User_Id` int DEFAULT NULL,
  `Manager_Id` int DEFAULT NULL,
  PRIMARY KEY (`Employee_Id`),
  UNIQUE KEY `User_Id` (`User_Id`),
  KEY `fk_employee_manager` (`Manager_Id`),
  CONSTRAINT `fk_employee_manager` FOREIGN KEY (`Manager_Id`) REFERENCES `users` (`User_Id`),
  CONSTRAINT `fk_employee_user` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'varshini','varshini@gmail.com','2345678901','IT','python developer',7,NULL),(2,'leela','leela@gmail.com.com','9988776655','HR','Hr executive',24,3),(3,'sakshi','sakshi@gmail.com','6543789210','IT','java developer',25,17),(4,'susan','arun@example.com','9876543212','Finance','Accountant',10,NULL),(5,'sree','sree@gmail.com','7890123456','IT','python developer',11,NULL),(6,'uma','uma@gmail.com','8901234567','IT','developer',12,NULL),(7,'sita','sita@gmail.com','4567890123','finance','accountant',14,2),(8,'rama','rama@gmail.com','0987654321','IT','python developer',15,3),(11,'lakshman','lakshman@gmail.com','9753124681','HR','Hr executive',18,17);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_requests` (
  `Leave_Id` int NOT NULL AUTO_INCREMENT,
  `Employee_Id` int DEFAULT NULL,
  `From_Date` date DEFAULT NULL,
  `To_Date` date DEFAULT NULL,
  `Leave_Type` varchar(50) DEFAULT NULL,
  `Reason` varchar(500) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Reviewed_By` int DEFAULT NULL,
  `Reviewed_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Leave_Id`),
  KEY `Employee_Id` (`Employee_Id`),
  CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`Employee_Id`) REFERENCES `employees` (`Employee_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
INSERT INTO `leave_requests` VALUES (1,1,'2026-10-12','2026-10-12','sick leave','headache','approved',NULL,NULL),(5,4,'2026-10-15','2026-10-16','Sick Leave','Not feeling well','Pending',NULL,NULL),(7,6,'2026-10-12','2026-10-12','casual leave','personal work','pending',NULL,NULL),(8,7,'2026-10-17','2026-10-17','casual leave','personal work','Approved',NULL,NULL),(9,8,'2026-10-17','2026-10-17','sick leave','headache','Approved',NULL,NULL),(11,7,'2026-10-18','2026-10-18','sick leave','fever','Rejected',2,'2026-10-17 13:11:05'),(12,11,'2026-10-21','2026-10-22','casual leave','personal work','Approved',17,'2026-10-21 13:23:02'),(14,8,'2026-10-28','2026-10-28','sick leave','fever','Approved',3,'2026-10-28 12:19:28'),(15,7,'2026-10-29','2026-10-29','sick','headache','Pending',NULL,NULL),(16,7,'2026-10-30','2026-10-30','casual leave','personal work','Pending',NULL,NULL),(17,8,'2026-10-30','2026-10-30','casual leave','personal work','Approved',3,'2026-10-30 13:42:02'),(19,8,'2026-11-01','2026-11-01','sick leave','fever','Approved',3,'2026-10-30 15:16:40'),(20,2,'2026-10-30','2026-10-30','sick leave','headache','Approved',3,'2026-10-30 15:53:40');
/*!40000 ALTER TABLE `leave_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revoked_tokens`
--

DROP TABLE IF EXISTS `revoked_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revoked_tokens` (
  `RevokedToken_Id` int NOT NULL AUTO_INCREMENT,
  `Token_JTI` varchar(100) DEFAULT NULL,
  `Expires_At` datetime NOT NULL,
  `Session_Id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RevokedToken_Id`),
  UNIQUE KEY `ix_Revoked_Tokens_Token_JTI` (`Token_JTI`),
  KEY `ix_Revoked_Tokens_RevokedToken_Id` (`RevokedToken_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revoked_tokens`
--

LOCK TABLES `revoked_tokens` WRITE;
/*!40000 ALTER TABLE `revoked_tokens` DISABLE KEYS */;
INSERT INTO `revoked_tokens` VALUES (1,NULL,'2026-10-27 06:50:52','fabec698e44c423cad6e46bfc7a49073'),(2,NULL,'2026-10-27 07:27:54','7c7020ef5c774c94809db8ee06c2cc0f'),(3,NULL,'2026-10-27 07:34:02','f9331f0ff7304f76b89e992fa8431a92'),(4,NULL,'2026-10-27 07:53:23','142c4a5213b74527bb94ffd587b5d1b9'),(5,NULL,'2026-10-28 10:04:29','a705df3e6fcd456e8bb28733e54b328f'),(6,NULL,'2026-10-29 07:20:02','9fe174d2f38643bd94a61a8dad733658'),(7,NULL,'2026-10-29 09:46:06','2b2fa8da6b224674a0d8a7ebe0bde04c'),(8,NULL,'2026-10-30 07:24:05','c3b15a8885cd45de99768cfd929e9936'),(9,NULL,'2026-10-30 08:14:06','f5bacea84c60496da2a88bc904d05354'),(10,NULL,'2026-10-30 08:23:31','77789801b4ec43bdb28faf60f23a2d26'),(11,NULL,'2026-10-30 08:42:26','b948d830bbf4431b95bd6b26586b06c9'),(12,NULL,'2026-10-30 09:05:44','e5e2989fcd4648fbbbae7749ea9700f5'),(13,NULL,'2026-10-30 09:36:20','51efe0dc902740bf8afa9ef37ce28d2e'),(14,NULL,'2026-10-30 09:54:29','792419fb028b4a3c86f3074c5a40fddb'),(15,NULL,'2026-10-30 09:59:57','cbb57db8bbae4783bf73904f04f7efee'),(16,NULL,'2026-10-30 10:00:47','abf16978df7c4b24ad30cb64c8ef8096'),(17,NULL,'2026-10-30 10:13:36','612a37947fdb457e8e921a02b55ce8f9'),(18,NULL,'2026-10-30 10:14:43','1cf3ed32b8904978a0740e640ecc96a0'),(19,NULL,'2026-10-30 10:16:31','ae8a30dfdf5449079c82c649c15820e5'),(20,NULL,'2026-11-02 08:07:05','e2b0e6ed1aa44342a8589d4813a2ab67');
/*!40000 ALTER TABLE `revoked_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Role_Id` int NOT NULL AUTO_INCREMENT,
  `Role_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Role_Id`),
  UNIQUE KEY `Role_Name` (`Role_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(3,'employee'),(2,'manager');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_Id` int NOT NULL AUTO_INCREMENT,
  `Full_Name` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Password_hash` varchar(200) NOT NULL,
  `Role_Id` int NOT NULL,
  `Created_At` datetime NOT NULL DEFAULT (now()),
  `Is_Active` tinyint(1) NOT NULL DEFAULT '1',
  `Must_Change_Password` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`User_Id`),
  UNIQUE KEY `Email` (`Email`),
  KEY `Role_Id` (`Role_Id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Role_Id`) REFERENCES `roles` (`Role_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@gmail.com','9441631264','$argon2id$v=19$m=65536,t=3,p=4$PQaSSY2bAZDVlrse7p9rBw$wjjaSLr4IHHv1VWWZ0GWm+EiRvtmDzIyPlYjZ87nUn0',1,'2026-10-14 15:20:33',1,0),(2,'suma','suma@gmail.com','1234567890','$argon2id$v=19$m=65536,t=3,p=4$Mc6A928mlN1jpK0sX9Nlgw$ZjBZUBB6PKfddtb69LtniVQfIiZSfDPYf03H8OMbF0E',2,'2026-10-15 11:14:29',1,0),(3,'varsh','varsh@gmail.com','2345678901','$argon2id$v=19$m=65536,t=3,p=4$TmTKNmHAFPzf+fTxLwY+UQ$zXvasUaNX51CHv68Z7cBywPYQd/Vy4zgJZDfRXBYwGo',2,'2026-10-15 11:28:12',1,0),(4,'neeraja','neeraja@gmail.com','3456789012','$argon2id$v=19$m=65536,t=3,p=4$jyVqfFoB6JRRqj7AlMp2dQ$DKlVUiGCMpzywd1sZ6BW9J3fbyu1B8AKdjSlgfnjz64',2,'2026-10-15 11:30:27',1,0),(5,'sri','sri@gmail.com','4567890123','$argon2id$v=19$m=65536,t=3,p=4$7MmxCIKH+JoeOTyfpP/c/g$jEX4TP2LI75WwcPSartjYuhEJAKuBhkKo7Ag5pdxRZU',2,'2026-10-15 11:32:23',1,0),(7,'varshini','varshini@gmail.com','2345678901','MIGRATED_NO_PASSWORD',3,'2026-10-15 13:32:15',0,0),(8,'Kumar','ravi@example.com','9876543210','MIGRATED_NO_PASSWORD',3,'2026-10-15 13:32:15',1,0),(9,'priya','priya@gmail.com','9988776664','MIGRATED_NO_PASSWORD',3,'2026-10-15 13:32:15',1,0),(10,'susan','arun@example.com','9876543212','MIGRATED_NO_PASSWORD',3,'2026-10-15 13:32:15',1,0),(11,'sree','sree@gmail.com','7890123455','MIGRATED_NO_PASSWORD',3,'2026-10-15 13:32:15',1,0),(12,'uma','uma@gmail.com','8901234567','MIGRATED_NO_PASSWORD',3,'2026-10-15 13:32:15',1,0),(14,'sita','sita@gmail.com','4567890123','$argon2id$v=19$m=65536,t=3,p=4$ItJpquRidmMluUJy0QkLTg$1pKfn6lvWHzKUqv7cgnAYhURegIOFay5Pp9w3cE17hI',3,'2026-10-15 15:22:39',1,0),(15,'rama','rama@gmail.com','0987654321','$argon2id$v=19$m=65536,t=3,p=4$zpxU2dJg2nbW56hqPitWjw$iZBM8n/sfexFrToFTp+OE86U3Wn0KODUCEgz8eBMRfY',3,'2026-10-17 12:37:01',0,0),(16,'prem','prem@gmail.com','5678890123','$argon2id$v=19$m=65536,t=3,p=4$G3ZD6E5AalEv+GOFCsKHIg$Ay0/nNeR+VwTxE1/+7NhpvbIbDSxyAl5Bh6IsVqkQ58',3,'2026-10-17 12:42:15',1,0),(17,'adharsh','adharsh@gmail.com','3579124680','$argon2id$v=19$m=65536,t=3,p=4$B0d5CJT73nsr/ayF92cWbA$N7SanxJ+2wbLfTBpjnG+ZACrzpruOAjbnIncmWz6t5Q',2,'2026-10-21 12:59:08',1,0),(18,'lakshman','lakshman@gmail.com','9753124680','$argon2id$v=19$m=65536,t=3,p=4$8qpTOHawU52w6ProjnL8OA$arx1BbXLa/XNqvirsSIY/2JLyNbNbPPUBaGBzD4PHi4',3,'2026-10-21 13:03:29',1,0),(19,'susmitha','susmitha@gmail.com','1234567890','$argon2id$v=19$m=65536,t=3,p=4$SGq6RuyAsC8iypxqhw4FPA$lzV8Hgm83GJ/Mm3W6oHbwFl6vjW71gUMOcVxrxvyz8o',2,'2026-10-28 14:57:14',1,0),(20,'hema','hema@gmail.com','1234567890','$argon2id$v=19$m=65536,t=3,p=4$70qZP8gH+JgpiOWptojuwg$lVtAZlSb9mU+gXNL3Xrmcj6nbVRau/6k3Btfwi8LQFM',2,'2026-10-30 13:43:09',1,0),(21,'nandu','nandu@gmail.com','4567890123','$argon2id$v=19$m=65536,t=3,p=4$wfBexCd/UEXvN9oIHYLY4g$mhp7IKBJlwjHpMgFqoBs7S+1W3DmDUVLrQFqF3w0ubY',2,'2026-10-30 14:12:35',1,0),(22,'seenu','seenu@gmail.com','1234567890','$argon2id$v=19$m=65536,t=3,p=4$pbzM21k6GbVMeMrpd7HhLw$7OqNxE1m3qhVoO6xyq4zin/I1IP3x139IMHZAlJXCds',3,'2026-10-30 14:35:09',1,0),(23,'mahi','mahi@gmail.com','8897654321','$argon2id$v=19$m=65536,t=3,p=4$R8BudtSQe4WQIRMonUfsDA$YYl6X/YrvBUd/YbC87RIQT7uAqiNSCv42OGc2ewNEto',2,'2026-10-30 15:31:57',1,0),(24,'leela','leela@gmail.com.com','9988776655','$argon2id$v=19$m=65536,t=3,p=4$P4zv8kbPcRmocQMA5rJ/LA$RPXNEgN0fB6l5e/hs9k8hghaeKXzmav5hS+5kZsGBv4',3,'2026-10-30 15:46:50',1,0),(25,'sakshi','sakshi@gmail.com','6543789210','$argon2id$v=19$m=65536,t=3,p=4$nCD67J4asR8aDcwKl94sCw$TRnqWC2Pjk+crq7yqUbLhWilrHWvV4lF8wfzOKtGk7s',3,'2026-11-02 12:46:02',0,0);
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

-- Dump completed on 2026-11-02 15:45:11
