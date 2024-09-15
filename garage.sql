-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: garage
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `categories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
INSERT INTO `categories` VALUES (7,'Alimentation'),(8,'Electroniques'),(10,'TV'),(11,'Laptops'),(12,'Cuisines');
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsrv16ica2c1csub334bxjjb59` (`email`),
  UNIQUE KEY `UKeagc35dijcuqi9husm86d1r31` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
INSERT INTO `clients` VALUES (2,'Dolor perspiciatis ','wygimafe@mailinator.com','Holmes Hendricks','+1 (546) 672-6025'),(3,'Dicta est nobis sed ','donog@mailinator.com','Yoshio Barber','+1 (944) 379-7472'),(4,'Dolor laboris cillum','tibapaj@mailinator.com','Fulton Oneil','+1 (148) 878-9579'),(5,'Adipisicing in nisi ','nuwug@mailinator.com','Ross Nichols','+1 (429) 457-6344');
UNLOCK TABLES;

--
-- Table structure for table `devis`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cout_total` decimal(10,2) DEFAULT NULL,
  `date_devis` date DEFAULT NULL,
  `etat` bit(1) DEFAULT NULL,
  `numero_devis` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `vehicule_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkyc0n3il2tw2kbexjkb3rq8hm` (`numero_devis`),
  KEY `FK9wcodei5pytn05ksoi1i2p8uo` (`user_id`),
  KEY `FKkinui50qxivc2xomva99k3sj4` (`vehicule_id`),
  CONSTRAINT `FK9wcodei5pytn05ksoi1i2p8uo` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKkinui50qxivc2xomva99k3sj4` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devis`
--

LOCK TABLES `devis` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `factures`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factures` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_facture` date DEFAULT NULL,
  `etat` bit(1) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKf1oxn7ho2bjwo0bhah53y55ok` (`numero`),
  KEY `FKakoqi8cpfxab6j16clvdjuldi` (`client_id`),
  KEY `FK5hmnfmcpdnpu0sbwjpoihexpa` (`user_id`),
  CONSTRAINT `FK5hmnfmcpdnpu0sbwjpoihexpa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKakoqi8cpfxab6j16clvdjuldi` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factures`
--

LOCK TABLES `factures` WRITE;
INSERT INTO `factures` VALUES (2,'2024-09-13',_binary '','dfgh',0.00,2,2);
UNLOCK TABLES;

--
-- Table structure for table `fournisseurs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fournisseurs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseurs`
--

LOCK TABLES `fournisseurs` WRITE;
INSERT INTO `fournisseurs` VALUES (2,NULL,'Kirsten Cash','+1 (443) 981-8135'),(3,NULL,'Blair Mayer','+1 (972) 297-4631');
UNLOCK TABLES;

--
-- Table structure for table `ligne_factures`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ligne_factures` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantite` int DEFAULT NULL,
  `sous_total` decimal(10,2) DEFAULT NULL,
  `facture_id` bigint DEFAULT NULL,
  `piece_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3cmiecnb7o94fugvua53o0655` (`facture_id`),
  KEY `FKg3hwts5l9idwor708tjf90cep` (`piece_id`),
  CONSTRAINT `FK3cmiecnb7o94fugvua53o0655` FOREIGN KEY (`facture_id`) REFERENCES `factures` (`id`),
  CONSTRAINT `FKg3hwts5l9idwor708tjf90cep` FOREIGN KEY (`piece_id`) REFERENCES `pieces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne_factures`
--

LOCK TABLES `ligne_factures` WRITE;
INSERT INTO `ligne_factures` VALUES (5,1,77.00,2,11);
UNLOCK TABLES;

--
-- Table structure for table `ligne_reparations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ligne_reparations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantite` int DEFAULT NULL,
  `piece_id` bigint DEFAULT NULL,
  `reparation_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKquux11b7kir7wef5sokakgrij` (`piece_id`),
  KEY `FKoccbdyt7s8dr2o1ag4okdx3it` (`reparation_id`),
  CONSTRAINT `FKoccbdyt7s8dr2o1ag4okdx3it` FOREIGN KEY (`reparation_id`) REFERENCES `reparations` (`id`),
  CONSTRAINT `FKquux11b7kir7wef5sokakgrij` FOREIGN KEY (`piece_id`) REFERENCES `pieces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne_reparations`
--

LOCK TABLES `ligne_reparations` WRITE;
INSERT INTO `ligne_reparations` VALUES (7,1,11,7);
UNLOCK TABLES;

--
-- Table structure for table `magasins`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magasins` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magasins`
--

LOCK TABLES `magasins` WRITE;
INSERT INTO `magasins` VALUES (2,'Store237');
UNLOCK TABLES;

--
-- Table structure for table `pieces`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pieces` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_ajout` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pu_achat` decimal(10,2) DEFAULT NULL,
  `pu_vente` decimal(10,2) DEFAULT NULL,
  `quantite` int DEFAULT NULL,
  `seuil_alerte` int DEFAULT NULL,
  `categorie_id` bigint DEFAULT NULL,
  `fournisseur_id` bigint DEFAULT NULL,
  `magasin_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf5w4s4y0af7es6lyc877v2n5m` (`categorie_id`),
  KEY `FKbiwijm622qje91us3tfgond65` (`fournisseur_id`),
  KEY `FKo8h6k5jp1ygrclirspiimcb52` (`magasin_id`),
  CONSTRAINT `FKbiwijm622qje91us3tfgond65` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`),
  CONSTRAINT `FKf5w4s4y0af7es6lyc877v2n5m` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FKo8h6k5jp1ygrclirspiimcb52` FOREIGN KEY (`magasin_id`) REFERENCES `magasins` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pieces`
--

LOCK TABLES `pieces` WRITE;
INSERT INTO `pieces` VALUES (11,'2024-09-08','Dolore qui sint anim','Pneu',31.00,77.00,35,12,8,2,2),(12,'2024-09-08','Voluptas sunt quibu','Tana Cross',56.00,80.00,26,1,8,3,2),(13,'2024-09-14','Accusamus duis et ip','Tucker Petersen',26.00,30.00,95,82,11,2,2);
UNLOCK TABLES;

--
-- Table structure for table `reparations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reparations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_reparation` date DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `vehicule_id` bigint DEFAULT NULL,
  `numero` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKd6c3cxonuq5srgeyou5gi7jfg` (`numero`),
  KEY `FKnlhed5d4ofni05oi0r6dp9244` (`user_id`),
  KEY `FK2ep9kbse7qw81sk4aclwahtve` (`vehicule_id`),
  CONSTRAINT `FK2ep9kbse7qw81sk4aclwahtve` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`),
  CONSTRAINT `FKnlhed5d4ofni05oi0r6dp9244` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparations`
--

LOCK TABLES `reparations` WRITE;
INSERT INTO `reparations` VALUES (7,'2024-09-12',1,1,'k');
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_mouvement` date NOT NULL,
  `quantite` int DEFAULT NULL,
  `type_mouvement` varchar(255) NOT NULL,
  `piece_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdd73k9m1w0pqwl8swtx0mx962` (`piece_id`),
  CONSTRAINT `FKdd73k9m1w0pqwl8swtx0mx962` FOREIGN KEY (`piece_id`) REFERENCES `pieces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
INSERT INTO `stocks` VALUES (8,'2024-09-14',95,'ENTREE',13);
UNLOCK TABLES;

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `token_expiry` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'arielnana913@gmail.com','ariel','$2a$10$1ThSmx0LbTjHbhQCWpIxXewqrbIRzTBoKIc9Wa3tQg0rS9KWcmvRW','ADMIN',NULL,NULL),(2,'bevysiv@mailinator.com','Yeo Meyer','$2a$10$SMeLnG9ISJX0DzOAeLtKIuro3qQ4hUT9XVSE9dPO0UVYxjcs/dLvy','ADMIN',NULL,NULL),(3,'sohuw@mailinator.com','Quail Cooke','$2a$10$t7u56x2d1PRW3AwSXEV.7uwLr9h2ZoIAl4YqZWkHZo3N1hKUYkKFK','GESTIONNAIRE',NULL,NULL);
UNLOCK TABLES;

--
-- Table structure for table `vehicules`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `num_chassis` varchar(255) DEFAULT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKaqwypd84e1jbcsq6rt2nrpjfi` (`client_id`),
  CONSTRAINT `FKaqwypd84e1jbcsq6rt2nrpjfi` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicules`
--

LOCK TABLES `vehicules` WRITE;
INSERT INTO `vehicules` VALUES (1,'Officia consequat B','Ut sunt asperiores e','Dolorum minima moles','Id repudiandae nisi ','Aliquam quis sint si','2019',2);
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-15 10:47:03
