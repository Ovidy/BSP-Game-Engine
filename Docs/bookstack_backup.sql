/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.10-MariaDB, for Linux (aarch64)
--
-- Host: localhost    Database: bookstack
-- ------------------------------------------------------
-- Server version	11.4.10-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) NOT NULL,
  `detail` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `loggable_id` bigint(20) unsigned DEFAULT NULL,
  `loggable_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_user_id_index` (`user_id`),
  KEY `activities_entity_id_index` (`loggable_id`),
  KEY `activities_key_index` (`type`),
  KEY `activities_created_at_index` (`created_at`),
  KEY `activities_ip_index` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES
(1,'auth_login','standard; (1) Admin',1,'192.168.65.1',NULL,NULL,'2026-05-04 12:56:20','2026-05-04 12:56:20'),
(2,'bookshelf_create','(1) BSP Game Engine',1,'192.168.65.1',1,'bookshelf','2026-05-04 13:04:49','2026-05-04 13:04:49'),
(3,'book_create','(2) Chapter 1 - Project Setup',1,'192.168.65.1',2,'book','2026-05-04 13:06:58','2026-05-04 13:06:58'),
(4,'bookshelf_update','(1) BSP Game Engine',1,'192.168.65.1',1,'bookshelf','2026-05-04 13:06:58','2026-05-04 13:06:58'),
(5,'bookshelf_create','(3) Engine Fundamentals',1,'192.168.65.1',3,'bookshelf','2026-05-04 13:10:56','2026-05-04 13:10:56'),
(6,'bookshelf_delete','(1) BSP Game Engine',1,'192.168.65.1',1,'bookshelf','2026-05-04 13:11:08','2026-05-04 13:11:08'),
(7,'book_update','(2) Project Setup',1,'192.168.65.1',2,'book','2026-05-04 13:11:26','2026-05-04 13:11:26'),
(8,'book_update','(2) Getting Started',1,'192.168.65.1',2,'book','2026-05-04 13:12:15','2026-05-04 13:12:15'),
(9,'book_update','(2) Getting Started',1,'192.168.65.1',2,'book','2026-05-04 13:13:13','2026-05-04 13:13:13'),
(10,'chapter_create','(4) Chapter 1: Project Structure',1,'192.168.65.1',4,'chapter','2026-05-04 13:58:02','2026-05-04 13:58:02'),
(11,'page_create','(5) Technologies',1,'192.168.65.1',5,'page','2026-05-04 13:58:31','2026-05-04 13:58:31'),
(12,'page_update','(5) Technologies',1,'192.168.65.1',5,'page','2026-05-04 14:01:01','2026-05-04 14:01:01'),
(13,'page_update','(5) Overview',1,'192.168.65.1',5,'page','2026-05-04 14:06:21','2026-05-04 14:06:21'),
(14,'chapter_update','(4) Chapter 1: Engine Structure',1,'192.168.65.1',4,'chapter','2026-05-04 14:06:57','2026-05-04 14:06:57'),
(15,'page_update','(5) Overview',1,'192.168.65.1',5,'page','2026-05-04 14:09:27','2026-05-04 14:09:27'),
(16,'page_create','(6) Directory Structure',1,'192.168.65.1',6,'page','2026-05-04 14:11:48','2026-05-04 14:11:48'),
(17,'page_update','(6) Directory Structure',1,'192.168.65.1',6,'page','2026-05-04 14:15:09','2026-05-04 14:15:09'),
(18,'settings_update','customization',1,'192.168.65.1',NULL,NULL,'2026-05-04 14:18:09','2026-05-04 14:18:09'),
(19,'page_update','(6) Directory Structure',1,'192.168.65.1',6,'page','2026-05-04 14:29:00','2026-05-04 14:29:00'),
(20,'page_create','(7) Setup',1,'192.168.65.1',7,'page','2026-05-04 14:51:38','2026-05-04 14:51:38'),
(21,'page_update','(7) Setup',1,'192.168.65.1',7,'page','2026-05-04 14:57:34','2026-05-04 14:57:34'),
(22,'settings_update','customization',1,'192.168.65.1',NULL,NULL,'2026-05-04 14:58:16','2026-05-04 14:58:16'),
(23,'page_update','(7) Setup',1,'192.168.65.1',7,'page','2026-05-04 14:59:35','2026-05-04 14:59:35'),
(24,'auth_login','standard; (1) Admin',1,'192.168.65.1',NULL,NULL,'2026-05-04 15:05:38','2026-05-04 15:05:38'),
(25,'settings_update','registration',1,'192.168.65.1',NULL,NULL,'2026-05-04 15:16:15','2026-05-04 15:16:15'),
(26,'auth_login','standard; (1) Admin',1,'192.168.65.1',NULL,NULL,'2026-05-04 15:16:34','2026-05-04 15:16:34'),
(27,'auth_login','standard; (1) Admin',1,'192.168.65.1',NULL,NULL,'2026-05-04 15:29:56','2026-05-04 15:29:56'),
(28,'page_update','(7) Setup',1,'192.168.65.1',7,'page','2026-05-04 15:45:09','2026-05-04 15:45:09'),
(29,'chapter_create','(8) Chapter 2: Hello World!',1,'192.168.65.1',8,'chapter','2026-05-04 15:46:34','2026-05-04 15:46:34'),
(30,'page_update','(7) Project Setup',1,'192.168.65.1',7,'page','2026-05-04 15:47:12','2026-05-04 15:47:12'),
(31,'page_move','(7) Project Setup',1,'192.168.65.1',7,'page','2026-05-04 15:47:16','2026-05-04 15:47:16'),
(32,'page_create','(9) Summary',1,'192.168.65.1',9,'page','2026-05-04 15:48:51','2026-05-04 15:48:51'),
(33,'page_update','(7) Project Setup',1,'192.168.65.1',7,'page','2026-05-05 05:49:51','2026-05-05 05:49:51'),
(34,'page_update','(7) Project Setup',1,'192.168.65.1',7,'page','2026-05-05 05:57:14','2026-05-05 05:57:14'),
(35,'page_create','(10) Creating a Simple Game',1,'192.168.65.1',10,'page','2026-05-05 05:58:21','2026-05-05 05:58:21'),
(36,'page_update','(10) Creating a Simple Game',1,'192.168.65.1',10,'page','2026-05-05 06:21:35','2026-05-05 06:21:35'),
(37,'page_update','(10) Creating a Simple Game',1,'192.168.65.1',10,'page','2026-05-05 06:30:26','2026-05-05 06:30:26'),
(38,'page_update','(10) Creating a Simple Game',1,'192.168.65.1',10,'page','2026-05-05 06:33:28','2026-05-05 06:33:28'),
(39,'page_update','(10) Creating a Simple Game',1,'192.168.65.1',10,'page','2026-05-05 06:38:11','2026-05-05 06:38:11'),
(40,'page_update','(10) Creating a Simple Game',1,'192.168.65.1',10,'page','2026-05-05 06:43:39','2026-05-05 06:43:39'),
(41,'page_update','(10) Creating a Simple Game',1,'192.168.65.1',10,'page','2026-05-07 13:32:10','2026-05-07 13:32:10'),
(42,'page_update','(10) Creating a Simple Game',1,'192.168.65.1',10,'page','2026-05-07 13:35:51','2026-05-07 13:35:51'),
(43,'page_update','(10) Creating a Simple Game',1,'192.168.65.1',10,'page','2026-05-07 13:38:21','2026-05-07 13:38:21');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tokens`
--

DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `token_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `expires_at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_tokens_token_id_unique` (`token_id`),
  KEY `api_tokens_user_id_index` (`user_id`),
  KEY `api_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tokens`
--

LOCK TABLES `api_tokens` WRITE;
/*!40000 ALTER TABLE `api_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `path` text NOT NULL,
  `extension` varchar(20) NOT NULL,
  `uploaded_to` bigint(20) unsigned NOT NULL,
  `external` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_uploaded_to_index` (`uploaded_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookshelves_books`
--

DROP TABLE IF EXISTS `bookshelves_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookshelves_books` (
  `bookshelf_id` bigint(20) unsigned NOT NULL,
  `book_id` bigint(20) unsigned NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bookshelf_id`,`book_id`),
  KEY `bookshelves_books_book_id_foreign` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookshelves_books`
--

LOCK TABLES `bookshelves_books` WRITE;
/*!40000 ALTER TABLE `bookshelves_books` DISABLE KEYS */;
INSERT INTO `bookshelves_books` VALUES
(1,2,1),
(3,2,0);
/*!40000 ALTER TABLE `bookshelves_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commentable_id` bigint(20) unsigned NOT NULL,
  `commentable_type` varchar(191) NOT NULL,
  `html` longtext DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `local_id` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content_ref` varchar(191) NOT NULL,
  `archived` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_entity_id_entity_type_index` (`commentable_id`,`commentable_type`),
  KEY `comments_local_id_index` (`local_id`),
  KEY `comments_archived_index` (`archived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletions`
--

DROP TABLE IF EXISTS `deletions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `deletions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `deletable_type` varchar(100) NOT NULL,
  `deletable_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deletions_deleted_by_index` (`deleted_by`),
  KEY `deletions_deletable_type_index` (`deletable_type`),
  KEY `deletions_deletable_id_index` (`deletable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletions`
--

LOCK TABLES `deletions` WRITE;
/*!40000 ALTER TABLE `deletions` DISABLE KEYS */;
INSERT INTO `deletions` VALUES
(1,1,'bookshelf',1,'2026-05-04 13:11:08','2026-05-04 13:11:08');
/*!40000 ALTER TABLE `deletions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_confirmations`
--

DROP TABLE IF EXISTS `email_confirmations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_confirmations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_confirmations_user_id_index` (`user_id`),
  KEY `email_confirmations_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_confirmations`
--

LOCK TABLES `email_confirmations` WRITE;
/*!40000 ALTER TABLE `email_confirmations` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_confirmations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `book_id` bigint(20) unsigned DEFAULT NULL,
  `chapter_id` bigint(20) unsigned DEFAULT NULL,
  `priority` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `owned_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `entities_type_index` (`type`),
  KEY `entities_slug_index` (`slug`),
  KEY `entities_book_id_index` (`book_id`),
  KEY `entities_chapter_id_index` (`chapter_id`),
  KEY `entities_updated_at_index` (`updated_at`),
  KEY `entities_deleted_at_index` (`deleted_at`),
  KEY `entities_owned_by_index` (`owned_by`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES
(1,'bookshelf','BSP Game Engine','bsp-game-engine',NULL,NULL,NULL,'2026-05-04 13:04:49','2026-05-04 13:11:08','2026-05-04 13:11:08',1,1,1),
(2,'book','Getting Started','getting-started',NULL,NULL,NULL,'2026-05-04 13:06:58','2026-05-04 13:13:13',NULL,1,1,1),
(3,'bookshelf','Engine Fundamentals','engine-fundamentals',NULL,NULL,NULL,'2026-05-04 13:10:56','2026-05-04 13:10:56',NULL,1,1,1),
(4,'chapter','Chapter 1: Engine Structure','chapter-1-engine-structure',2,NULL,2,'2026-05-04 13:58:02','2026-05-04 14:06:57',NULL,1,1,1),
(5,'page','Overview','overview',2,4,1,'2026-05-04 13:58:10','2026-05-04 14:09:27',NULL,1,1,1),
(6,'page','Directory Structure','directory-structure',2,4,2,'2026-05-04 14:10:03','2026-05-04 14:29:00',NULL,1,1,1),
(7,'page','Project Setup','project-setup',2,8,3,'2026-05-04 14:39:17','2026-05-05 05:57:14',NULL,1,1,1),
(8,'chapter','Chapter 2: Hello World!','chapter-2-hello-world',2,NULL,3,'2026-05-04 15:46:34','2026-05-04 15:46:34',NULL,1,1,1),
(9,'page','Summary','summary',2,4,3,'2026-05-04 15:47:32','2026-05-04 15:48:51',NULL,1,1,1),
(10,'page','Creating a Simple Game','creating-a-simple-game',2,8,4,'2026-05-05 05:57:55','2026-05-07 13:38:21',NULL,1,1,1);
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_container_data`
--

DROP TABLE IF EXISTS `entity_container_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_container_data` (
  `entity_id` bigint(20) unsigned NOT NULL,
  `entity_type` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `description_html` text NOT NULL,
  `default_template_id` bigint(20) unsigned DEFAULT NULL,
  `image_id` int(10) unsigned DEFAULT NULL,
  `sort_rule_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_container_data`
--

LOCK TABLES `entity_container_data` WRITE;
/*!40000 ALTER TABLE `entity_container_data` DISABLE KEYS */;
INSERT INTO `entity_container_data` VALUES
(1,'bookshelf','This documentation aims to explain the main uses and concepts of the BSP (Binary Space Partitioning) Game Engine.','<p>This documentation aims to explain the main uses and concepts of the BSP (Binary Space Partitioning) Game Engine.<br></p>',NULL,NULL,NULL),
(2,'book','This book describes how to set up a environment setup for the engine.\r\n','<p>This book describes how to set up a environment setup for the engine.</p><p><br></p>',NULL,NULL,NULL),
(3,'bookshelf','This shelf describes the main fundamentals of using the game engine.\r\n','<p>This shelf describes the main fundamentals of using the game engine.</p><p><br></p>',NULL,NULL,NULL),
(4,'chapter','This chapter explains the main project structure of the engine, main technologies, and how they are related to one another.\r\n','<p>This chapter explains the main project structure of the engine, main technologies, and how they are related to one another.</p><p><br></p>',NULL,NULL,NULL),
(8,'chapter','Create a basic project with a prepared world map and objects.\r\n','<p>Create a basic project with a prepared world map and objects.</p><p><br></p>',NULL,NULL,NULL);
/*!40000 ALTER TABLE `entity_container_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_page_data`
--

DROP TABLE IF EXISTS `entity_page_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_page_data` (
  `page_id` bigint(20) unsigned NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `template` tinyint(1) NOT NULL,
  `revision_count` int(10) unsigned NOT NULL,
  `editor` varchar(50) NOT NULL,
  `html` longtext NOT NULL,
  `text` longtext NOT NULL,
  `markdown` longtext NOT NULL,
  PRIMARY KEY (`page_id`),
  KEY `entity_page_data_draft_index` (`draft`),
  KEY `entity_page_data_template_index` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_page_data`
--

LOCK TABLES `entity_page_data` WRITE;
/*!40000 ALTER TABLE `entity_page_data` DISABLE KEYS */;
INSERT INTO `entity_page_data` VALUES
(5,0,0,4,'wysiwyg','<p id=\"bkmrk-the%C2%A0\">The project is a Low Level, Binary Space Partitioning (BSP) based game engine.</p>\r\n<p id=\"bkmrk-there-are-multiple-t\">There are multiple technologies included to implement this technology (development and build wise):</p>\r\n<ul id=\"bkmrk-c%2B%2B---main-programmi\">\r\n<li><strong>C++</strong> - Main programming language for the engine</li>\r\n<li><strong>RayLib</strong> - An open-source, cross-platform, graphics library for creating games/game engines</li>\r\n<li><strong>GLM</strong> - An OpenGL Mathematics library<br></li>\r\n<li><strong>EarCut</strong> - A single-header library that implements Ear Clipping for BSP floor &amp; ceiling calculations<br></li>\r\n<li><strong>PreMake</strong> - A cross-platform, project management tool used for creating the project structure on every environment<br></li>\r\n</ul>\r\n<p id=\"bkmrk-the-engine-is-mainly\">The engine is mainly compiled into a library C++ file that can be used everywhere.</p>\r\n<p id=\"bkmrk-%C2%A0\">&nbsp;</p>','The project is a Low Level, Binary Space Partitioning (BSP) based game engine.\nThere are multiple technologies included to implement this technology (development and build wise):\n\nC++ - Main programming language for the engine\nRayLib - An open-source, cross-platform, graphics library for creating games/game engines\nGLM - An OpenGL Mathematics library\nEarCut - A single-header library that implements Ear Clipping for BSP floor & ceiling calculations\nPreMake - A cross-platform, project management tool used for creating the project structure on every environment\n\nThe engine is mainly compiled into a library C++ file that can be used everywhere.\n ',''),
(6,0,0,3,'wysiwyg','<p id=\"bkmrk-you-can-find-the-sou\">You can find the source code on <a title=\"GitHub - BSP Game Engine\" href=\"https://github.com/Ovidy/BSP-Game-Engine\" target=\"_blank\" rel=\"noopener\">GitHub</a>, feel free. to look it up and play with it.</p>\r\n<p id=\"bkmrk-%C2%A0\"></p>\r\n<h4 id=\"bkmrk-%C2%A0-1\">Main Directory</h4>\r\n<p id=\"bkmrk-there-are-multiple-d\">There are multiple directories that manages the whole project:</p>\r\n<p id=\"bkmrk-\"><a href=\"http://localhost:6875/uploads/images/gallery/2026-05/352image.png\" target=\"_blank\" rel=\"noopener\"><img src=\"http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/352image.png\" alt=\"image.png\" width=\"233\" height=\"368\"></a></p>\r\n<ul id=\"bkmrk-docs---documentation\">\r\n<li><strong>Docs</strong> - Documentation website (the one you\'re reading in right now :) )</li>\r\n<li><strong>Engine</strong> - Game Engine\'s source code</li>\r\n<li><strong>Game&nbsp;</strong>- Game example</li>\r\n<li><strong>build</strong> - build tools for creating the project and using it (premake5 executables)</li>\r\n<li><strong>premake5.lua</strong> - PreMake project configuration</li>\r\n</ul>\r\n<p id=\"bkmrk-%C2%A0-2\"></p>\r\n<h4 id=\"bkmrk-%C2%A0-3\">Engine &amp; Game Example Directories</h4>\r\n<p id=\"bkmrk-the-engine-and-game-\">The engine and game example directories are managed in a similar way:</p>\r\n<p id=\"bkmrk--1\"><a href=\"http://localhost:6875/uploads/images/gallery/2026-05/rFaimage.png\" target=\"_blank\" rel=\"noopener\"><img src=\"http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/rFaimage.png\" alt=\"image.png\" width=\"138\" height=\"103\"></a></p>\r\n<p id=\"bkmrk--2\"><a href=\"http://localhost:6875/uploads/images/gallery/2026-05/JL6image.png\" target=\"_blank\" rel=\"noopener\"><img src=\"http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/JL6image.png\" alt=\"image.png\" width=\"141\" height=\"86\"></a></p>\r\n<ul id=\"bkmrk-include---c%2B%2B-header\">\r\n<li><strong>include</strong> - C++ header files (can be also added to the game and will be explained later on)</li>\r\n<li><strong>src</strong> - C++ source files</li>\r\n<li><strong>resources</strong> - Game resources (such as images, fonts, and sounds)</li>\r\n</ul>\r\n<p id=\"bkmrk-%C2%A0-4\">&nbsp;</p>','You can find the source code on GitHub, feel free. to look it up and play with it.\n\nMain Directory\nThere are multiple directories that manages the whole project:\n\n\nDocs - Documentation website (the one you\'re reading in right now :) )\nEngine - Game Engine\'s source code\nGame - Game example\nbuild - build tools for creating the project and using it (premake5 executables)\npremake5.lua - PreMake project configuration\n\n\nEngine & Game Example Directories\nThe engine and game example directories are managed in a similar way:\n\n\n\ninclude - C++ header files (can be also added to the game and will be explained later on)\nsrc - C++ source files\nresources - Game resources (such as images, fonts, and sounds)\n\n ',''),
(7,0,0,7,'markdown','<p id=\"bkmrk-now-we%27ll-go-through\">Now we\'ll go through the setup process.</p>\n<p id=\"bkmrk-most-of-the-setup-is\">Most of the setup is based on <a href=\"https://github.com/raylib-extras/raylib-quickstart\" title=\"RayLib\'s Quickstart Project\">RayLib\'s Quickstart Project</a></p>\n<h4 id=\"bkmrk-requirements\">Requirements</h4>\n<ul id=\"bkmrk-build-tools-%28such-as\">\n<li>Build Tools (Such as Make, MinGW, VS Builder, etc...)</li>\n<li>Premake5 (Included in <strong>build</strong> directory)</li>\n</ul>\n<h4 id=\"bkmrk-add-project\">Add Project</h4>\n<p id=\"bkmrk-before-building-the-\">Before building the environment we should create a new project.</p>\n<p id=\"bkmrk-clone-the-repository\">Clone the repository to your local machine.</p>\n<p id=\"bkmrk-go-to-premake5.lua-f\">Go to <strong>premake5.lua</strong> file in the repository and add the following lines:</p>\n<pre id=\"bkmrk----%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D\"><code class=\"language-lua\">    -- ========================================================\n    -- PROJECT 3: THE GAME (Executable)\n    -- ========================================================\n    project (workspaceName)\n        kind \"ConsoleApp\"\n        language \"C++\"\n        targetdir \"bin/%{cfg.buildcfg}\"\n        objdir \"obj/%{cfg.buildcfg}/Game\"\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\n            kind \"WindowedApp\"\n            buildoptions { \"-Wl,--subsystem,windows\" }\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\n            kind \"WindowedApp\"\n            entrypoint \"mainCRTStartup\"\n\n        filter \"action:vs*\"\n            debugdir \"$(SolutionDir)\"\n        filter {}\n        \n        vpaths \n        {\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n        }\n\n        -- Grab source code ONLY from the Game folder\n        files {\n            \"Game/src/**.c\",\n            \"Game/src/**.cpp\",\n            \"Game/include/**.h\", \n            \"Game/include/**.hpp\"\n        }\n        \n        filter {\"system:windows\", \"action:vs*\"}\n            files {\"Game/resources/**\"}\n        filter{}\n        \n        -- The Game needs to see the Engine\'s headers!\n        includedirs { \n            \"Engine/include\",\n            \"Game/include\",\n            \"external/glm\", \n            raylib_dir .. \"/src\" \n        }\n\n        -- LINKING: The Game links to the Engine AND Raylib\n        links {\"BSPEngine\", \"raylib\"}\n\n        cdialect \"C17\"\n        cppdialect \"C++17\"\n        platform_defines()\n\n        filter \"action:vs*\"\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\n            characterset (\"Unicode\")\n            buildoptions { \"/Zc:__cplusplus\" }\n\n        -- OS SPECIFIC SYSTEM LINKS\n        filter \"system:windows\"\n            defines{\"_WIN32\"}\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\n            libdirs {\"bin/%{cfg.buildcfg}\"}\n\n        filter \"system:linux\"\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\n        filter {\"system:linux\", \"options:wayland=off\"}\n            links {\"X11\"}\n\n        filter {\"system:linux\", \"options:wayland=on\"}\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\n        filter \"system:macosx\"\n            buildoptions { \"-stdlib=libc++\" }\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\n        filter{}\n\n</code></pre>\n<p id=\"bkmrk-make-sure-that-you-r\">Make sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a <code>src</code> (<code>include</code> and `resources are recommended too).</p>\n<h4 id=\"bkmrk-build-environment\">Build Environment</h4>\n<p id=\"bkmrk-to-build-the-project\">To build the project\'s environment you should use PreMake. To run PreMake for your environment, check out the build section<br>\nin <a href=\"https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files\" title=\"RayLib\'s Build Quickstart Page\">RayLib\'s Quickstart Page</a>.</p>\n<p id=\"bkmrk-example-of-environme\">Example of environment build:</p>\n<pre id=\"bkmrk-premake5-gmake\"><code class=\"language-bash\">premake5 gmake\n</code></pre>\n<p id=\"bkmrk-note%3A-if-you-use-pre\"><strong>Note:</strong> If you use <code>premake5</code> from the <code>build</code> directory you should run the executable from the main directory by moving to this directory and refencing the premake executable as such:</p>\n<pre id=\"bkmrk-.%2Fbuild%2Fpremake5-gma\"><code class=\"language-bash\">./build/premake5 gmake\n</code></pre>\n<p id=\"bkmrk-this-will-build-the-\">This will build the project using the <code>premake5.lua</code> configuration file from the main directory.</p>\n<p id=\"bkmrk-important-note%3A-make\"><strong><strong>Important Note:</strong></strong> Make sure you run environment build everytime you want to add code file to your project.</p>\n<h4 id=\"bkmrk-build-the-project\">Build the Project</h4>\n<p id=\"bkmrk-note%3A-in-this-articl\"><strong>Note</strong>: In this article we assume you have <code>make</code> on your machine. Meaning, it haven\'t been tested on Visual Studio environment and such.</p>\n<p id=\"bkmrk-to-build-the-project-1\">To build the project, just use the following command in the main directory:</p>\n<pre id=\"bkmrk-make\"><code class=\"language-bash\">make\n</code></pre>\n<p id=\"bkmrk-for-now-it-won%27t-do-\">For now it won\'t do much because we haven\'t created any code file, in the next page we\'ll learn how to create and run an example game.</p>\n','Now we\'ll go through the setup process.\nMost of the setup is based on RayLib\'s Quickstart Project\nRequirements\n\nBuild Tools (Such as Make, MinGW, VS Builder, etc...)\nPremake5 (Included in build directory)\n\nAdd Project\nBefore building the environment we should create a new project.\nClone the repository to your local machine.\nGo to premake5.lua file in the repository and add the following lines:\n    -- ========================================================\n    -- PROJECT 3: THE GAME (Executable)\n    -- ========================================================\n    project (workspaceName)\n        kind \"ConsoleApp\"\n        language \"C++\"\n        targetdir \"bin/%{cfg.buildcfg}\"\n        objdir \"obj/%{cfg.buildcfg}/Game\"\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\n            kind \"WindowedApp\"\n            buildoptions { \"-Wl,--subsystem,windows\" }\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\n            kind \"WindowedApp\"\n            entrypoint \"mainCRTStartup\"\n\n        filter \"action:vs*\"\n            debugdir \"$(SolutionDir)\"\n        filter {}\n        \n        vpaths \n        {\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n        }\n\n        -- Grab source code ONLY from the Game folder\n        files {\n            \"Game/src/**.c\",\n            \"Game/src/**.cpp\",\n            \"Game/include/**.h\", \n            \"Game/include/**.hpp\"\n        }\n        \n        filter {\"system:windows\", \"action:vs*\"}\n            files {\"Game/resources/**\"}\n        filter{}\n        \n        -- The Game needs to see the Engine\'s headers!\n        includedirs { \n            \"Engine/include\",\n            \"Game/include\",\n            \"external/glm\", \n            raylib_dir .. \"/src\" \n        }\n\n        -- LINKING: The Game links to the Engine AND Raylib\n        links {\"BSPEngine\", \"raylib\"}\n\n        cdialect \"C17\"\n        cppdialect \"C++17\"\n        platform_defines()\n\n        filter \"action:vs*\"\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\n            characterset (\"Unicode\")\n            buildoptions { \"/Zc:__cplusplus\" }\n\n        -- OS SPECIFIC SYSTEM LINKS\n        filter \"system:windows\"\n            defines{\"_WIN32\"}\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\n            libdirs {\"bin/%{cfg.buildcfg}\"}\n\n        filter \"system:linux\"\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\n        filter {\"system:linux\", \"options:wayland=off\"}\n            links {\"X11\"}\n\n        filter {\"system:linux\", \"options:wayland=on\"}\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\n        filter \"system:macosx\"\n            buildoptions { \"-stdlib=libc++\" }\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\n        filter{}\n\n\nMake sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a src (include and `resources are recommended too).\nBuild Environment\nTo build the project\'s environment you should use PreMake. To run PreMake for your environment, check out the build section\nin RayLib\'s Quickstart Page.\nExample of environment build:\npremake5 gmake\n\nNote: If you use premake5 from the build directory you should run the executable from the main directory by moving to this directory and refencing the premake executable as such:\n./build/premake5 gmake\n\nThis will build the project using the premake5.lua configuration file from the main directory.\nImportant Note: Make sure you run environment build everytime you want to add code file to your project.\nBuild the Project\nNote: In this article we assume you have make on your machine. Meaning, it haven\'t been tested on Visual Studio environment and such.\nTo build the project, just use the following command in the main directory:\nmake\n\nFor now it won\'t do much because we haven\'t created any code file, in the next page we\'ll learn how to create and run an example game.\n','Now we\'ll go through the setup process.\r\n\r\nMost of the setup is based on [RayLib\'s Quickstart Project](https://github.com/raylib-extras/raylib-quickstart \"RayLib\'s Quickstart Project\")\r\n\r\n#### Requirements\r\n\r\n- Build Tools (Such as Make, MinGW, VS Builder, etc...)\r\n- Premake5 (Included in **build** directory)\r\n\r\n#### Add Project\r\n\r\nBefore building the environment we should create a new project.\r\n\r\nClone the repository to your local machine.\r\n\r\nGo to **premake5.lua** file in the repository and add the following lines:\r\n\r\n```lua\r\n    -- ========================================================\r\n    -- PROJECT 3: THE GAME (Executable)\r\n    -- ========================================================\r\n    project (workspaceName)\r\n        kind \"ConsoleApp\"\r\n        language \"C++\"\r\n        targetdir \"bin/%{cfg.buildcfg}\"\r\n        objdir \"obj/%{cfg.buildcfg}/Game\"\r\n\r\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\r\n            kind \"WindowedApp\"\r\n            buildoptions { \"-Wl,--subsystem,windows\" }\r\n\r\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\r\n            kind \"WindowedApp\"\r\n            entrypoint \"mainCRTStartup\"\r\n\r\n        filter \"action:vs*\"\r\n            debugdir \"$(SolutionDir)\"\r\n        filter {}\r\n        \r\n        vpaths \r\n        {\r\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\r\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\r\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\r\n        }\r\n\r\n        -- Grab source code ONLY from the Game folder\r\n        files {\r\n            \"Game/src/**.c\",\r\n            \"Game/src/**.cpp\",\r\n            \"Game/include/**.h\", \r\n            \"Game/include/**.hpp\"\r\n        }\r\n        \r\n        filter {\"system:windows\", \"action:vs*\"}\r\n            files {\"Game/resources/**\"}\r\n        filter{}\r\n        \r\n        -- The Game needs to see the Engine\'s headers!\r\n        includedirs { \r\n            \"Engine/include\",\r\n            \"Game/include\",\r\n            \"external/glm\", \r\n            raylib_dir .. \"/src\" \r\n        }\r\n\r\n        -- LINKING: The Game links to the Engine AND Raylib\r\n        links {\"BSPEngine\", \"raylib\"}\r\n\r\n        cdialect \"C17\"\r\n        cppdialect \"C++17\"\r\n        platform_defines()\r\n\r\n        filter \"action:vs*\"\r\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\r\n            characterset (\"Unicode\")\r\n            buildoptions { \"/Zc:__cplusplus\" }\r\n\r\n        -- OS SPECIFIC SYSTEM LINKS\r\n        filter \"system:windows\"\r\n            defines{\"_WIN32\"}\r\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\r\n            libdirs {\"bin/%{cfg.buildcfg}\"}\r\n\r\n        filter \"system:linux\"\r\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\r\n\r\n        filter {\"system:linux\", \"options:wayland=off\"}\r\n            links {\"X11\"}\r\n\r\n        filter {\"system:linux\", \"options:wayland=on\"}\r\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\r\n\r\n        filter \"system:macosx\"\r\n            buildoptions { \"-stdlib=libc++\" }\r\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\r\n        filter{}\r\n\r\n```\r\n\r\nMake sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a `src` (`include` and `resources are recommended too).\r\n\r\n#### Build Environment\r\n\r\nTo build the project\'s environment you should use PreMake. To run PreMake for your environment, check out the build section  \r\nin [RayLib\'s Quickstart Page](https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files \"RayLib\'s Build Quickstart Page\").\r\n\r\nExample of environment build:\r\n```bash\r\npremake5 gmake\r\n```\r\n**Note:** If you use `premake5` from the `build` directory you should run the executable from the main directory by moving to this directory and refencing the premake executable as such:\r\n```bash\r\n./build/premake5 gmake\r\n```\r\n\r\nThis will build the project using the `premake5.lua` configuration file from the main directory.\r\n\r\n****Important Note:**** Make sure you run environment build everytime you want to add code file to your project.\r\n\r\n#### Build the Project\r\n**Note**: In this article we assume you have `make` on your machine. Meaning, it haven\'t been tested on Visual Studio environment and such.\r\n\r\nTo build the project, just use the following command in the main directory:\r\n```bash\r\nmake\r\n```\r\n\r\nFor now it won\'t do much because we haven\'t created any code file, in the next page we\'ll learn how to create and run an example game.'),
(9,0,0,1,'markdown','<p id=\"bkmrk-in-this-chapter-we-l\">In this chapter we learned the main project directory structure and the main technologies used for building and developing the engine.</p>\n<p id=\"bkmrk-in-the-next-chapter-\">In the next chapter we\'ll learn how to setup and create are first project!</p>\n','In this chapter we learned the main project directory structure and the main technologies used for building and developing the engine.\nIn the next chapter we\'ll learn how to setup and create are first project!\n','In this chapter we learned the main project directory structure and the main technologies used for building and developing the engine.\r\n\r\nIn the next chapter we\'ll learn how to setup and create are first project!'),
(10,0,0,9,'markdown','<h4 id=\"bkmrk-introduction\">Introduction</h4>\n<p id=\"bkmrk-we%27re-going-to-creat\">We\'re going to create a simple game only in our <code>main.cpp</code> file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.</p>\n<p id=\"bkmrk-all-of-the-used-reso\">All of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.</p>\n<p id=\"bkmrk-we%27ll-walk-through-e\">We\'ll walk through each step of creating the engine.</p>\n<h4 id=\"bkmrk-include-headers\">Include Headers</h4>\n<pre id=\"bkmrk-%2F%2F-1.-standard-io-st\"><code class=\"language-c++\">// 1. Standard IO Stream\n#include &lt;iostream&gt;\n\n// 2. Engine Cores\n#include &lt;bsp/handler.h&gt;\n#include &lt;render/handler.h&gt;\n#include &lt;input/handler.h&gt;\n\n// 3. Game Camera\n#include &lt;bsp/camera.h&gt;\n\n// 4. Example Level\n#include &lt;test/level.h&gt;\n\n// 5. RayLib-Related Code\n#include &lt;raylib.h&gt;\n#include &lt;resource_dir.h&gt;\n\n</code></pre>\n<ol id=\"bkmrk-standard-io-stream--\">\n<li>Standard IO Stream - Debugging</li>\n<li>Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters</li>\n<li>Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)</li>\n<li>Example Level - Provided by the engine for testing</li>\n<li>RayLib-Related Code - For basic configurations (such as window and <code>resources</code> folder finding)</li>\n</ol>\n<p id=\"bkmrk-from-now-on-all-of-t\">From now on all of the code will be placed in the main function:</p>\n<pre id=\"bkmrk-int-main-%28%29-%7B-...-yo\"><code class=\"language-c++\">int main () {\n  ... Your code ...\n}\n</code></pre>\n<h4 id=\"bkmrk-raylib-initializatio\">RayLib Initializations</h4>\n<pre id=\"bkmrk-%2F%2F-optional%3A-tell-th\"><code class=\"language-c++\">  // Optional: Tell the window to use vsync and work on high DPI displays\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\n\n  // Must: Create the window and OpenGL context\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\n\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\n  SetTargetFPS(60);\n\n  // Must: Disable cursor for camera lookaround with 3D Camera\n  DisableCursor();\n</code></pre>\n<h4 id=\"bkmrk-engine-initializatio\">Engine Initializations</h4>\n<pre id=\"bkmrk-%2F%2F-set-game-delta-ti\"><code class=\"language-c++\">  // Set Game Delta-Time for fixed camera, world, and objects movement\n  glm::float32_t deltaTime = 0.0f;\n\n  // Create the 3D Camera and locate it in (6, 7) coordinates\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\n\n  // Create Engine Handlers (BSP, rendering, and user input)\n  bsp::Handler bsp_handler;\n  render::Handler render_handler;\n  input::Handler input_handler;\n\n</code></pre>\n<h4 id=\"bkmrk-resources-loading\">Resources Loading</h4>\n<pre id=\"bkmrk-%2F%2F-set-%60game%2Fresourc\"><code class=\"language-c++\">  // Set `Game/resources` as main resources directory for easy load\n  SearchAndSetResourceDir(\"Game/resources\");\n\n  // Load textures using Texture Manager\n  render_handler.load_texture(1, \"Wall1.png\");\n  render_handler.load_texture(2, \"Monster1-north.png\");\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\n\n  // Load Level sectors and segments from example level\n  bsp_handler.load_level(bsp::test_level_sectors);\n\n  // Load calculated sectors and segments by the BSP Handler\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\n\n  // Load sprites for example level\n  render_handler.load_sprites(bsp::test_level_sprites);\n\n</code></pre>\n<h4 id=\"bkmrk-delta-time-clamp-pre\">Delta-Time Clamp Prevention (recommended)</h4>\n<p id=\"bkmrk-first-we%27ll-add-the-\">First we\'ll add the function declaration at the top of the file below the includes:</p>\n<pre id=\"bkmrk-void-prevent_dt_clam\"><code class=\"language-c++\">void prevent_dt_clamp(glm::float32_t&amp; deltaTime);\n</code></pre>\n<p id=\"bkmrk-now-below-the-main-f\">Now below the main function we\'ll add this:</p>\n<pre id=\"bkmrk-void-prevent_dt_clam-1\"><code class=\"language-c++\">void prevent_dt_clamp(glm::float32_t&amp; deltaTime) {\n  if (deltaTime &gt; 0.05f) {\n    deltaTime = 0.0166f; \n  }\n}\n\n</code></pre>\n<p id=\"bkmrk-we%27ll-use-it-soon.\">We\'ll use it soon.</p>\n<h4 id=\"bkmrk-main-game-loop-%26-win\">Main Game Loop &amp; Window Management</h4>\n<pre id=\"bkmrk-%2F%2F-game-loop-%28run-un\"><code class=\"language-c++\">  // Game Loop (run until the window is closed)\n  while (!WindowShouldClose())\n  {\n    // Update and calculate Delta-Time:\n    deltaTime = GetFrameTime();\n    prevent_dt_clamp(deltaTime);\n    camera.pre_update(deltaTime);\n    input_handler.update(camera, render_handler.get_map_renderer());\n    \n    // Ask the BSP tree what is nearby\n    std::vector&lt;bsp::Sector&gt; nearby_sectors = bsp_handler.get_nearby_sectors(\n        camera.get_pos_2d(), \n        camera.get_player_radius()\n    );\n\n    // Update Camera, BSP Tree, and BSP Traverser \n    camera.update(deltaTime, nearby_sectors);\n    bsp_handler.update(camera.get_pos_2d());\n\n    // Render Everything\n    render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());\n  }\n</code></pre>\n<p id=\"bkmrk-at-the-end-of-the-ma\">At the end of the main function add this:</p>\n<pre id=\"bkmrk-%2F%2F-destroy-the-windo\"><code class=\"language-c++\">  // Destroy the window and cleanup the OpenGL context\n  CloseWindow();\n  return 0;\n</code></pre>\n<p id=\"bkmrk-you-should-see-this-\">You should see this resulting game if done right:</p>\n<p id=\"bkmrk-\"><a href=\"http://localhost:6875/uploads/images/gallery/2026-05/image-1778161088033.png\"><img src=\"http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/image-1778161088033.png\" alt=\"\"></a></p>\n','Introduction\nWe\'re going to create a simple game only in our main.cpp file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\nWe\'ll walk through each step of creating the engine.\nInclude Headers\n// 1. Standard IO Stream\n#include <iostream>\n\n// 2. Engine Cores\n#include <bsp/handler.h>\n#include <render/handler.h>\n#include <input/handler.h>\n\n// 3. Game Camera\n#include <bsp/camera.h>\n\n// 4. Example Level\n#include <test/level.h>\n\n// 5. RayLib-Related Code\n#include <raylib.h>\n#include <resource_dir.h>\n\n\n\nStandard IO Stream - Debugging\nEngine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\nGame Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\nExample Level - Provided by the engine for testing\nRayLib-Related Code - For basic configurations (such as window and resources folder finding)\n\nFrom now on all of the code will be placed in the main function:\nint main () {\n  ... Your code ...\n}\n\nRayLib Initializations\n  // Optional: Tell the window to use vsync and work on high DPI displays\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\n\n  // Must: Create the window and OpenGL context\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\n\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\n  SetTargetFPS(60);\n\n  // Must: Disable cursor for camera lookaround with 3D Camera\n  DisableCursor();\n\nEngine Initializations\n  // Set Game Delta-Time for fixed camera, world, and objects movement\n  glm::float32_t deltaTime = 0.0f;\n\n  // Create the 3D Camera and locate it in (6, 7) coordinates\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\n\n  // Create Engine Handlers (BSP, rendering, and user input)\n  bsp::Handler bsp_handler;\n  render::Handler render_handler;\n  input::Handler input_handler;\n\n\nResources Loading\n  // Set `Game/resources` as main resources directory for easy load\n  SearchAndSetResourceDir(\"Game/resources\");\n\n  // Load textures using Texture Manager\n  render_handler.load_texture(1, \"Wall1.png\");\n  render_handler.load_texture(2, \"Monster1-north.png\");\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\n\n  // Load Level sectors and segments from example level\n  bsp_handler.load_level(bsp::test_level_sectors);\n\n  // Load calculated sectors and segments by the BSP Handler\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\n\n  // Load sprites for example level\n  render_handler.load_sprites(bsp::test_level_sprites);\n\n\nDelta-Time Clamp Prevention (recommended)\nFirst we\'ll add the function declaration at the top of the file below the includes:\nvoid prevent_dt_clamp(glm::float32_t& deltaTime);\n\nNow below the main function we\'ll add this:\nvoid prevent_dt_clamp(glm::float32_t& deltaTime) {\n  if (deltaTime > 0.05f) {\n    deltaTime = 0.0166f; \n  }\n}\n\n\nWe\'ll use it soon.\nMain Game Loop & Window Management\n  // Game Loop (run until the window is closed)\n  while (!WindowShouldClose())\n  {\n    // Update and calculate Delta-Time:\n    deltaTime = GetFrameTime();\n    prevent_dt_clamp(deltaTime);\n    camera.pre_update(deltaTime);\n    input_handler.update(camera, render_handler.get_map_renderer());\n    \n    // Ask the BSP tree what is nearby\n    std::vector<bsp::Sector> nearby_sectors = bsp_handler.get_nearby_sectors(\n        camera.get_pos_2d(), \n        camera.get_player_radius()\n    );\n\n    // Update Camera, BSP Tree, and BSP Traverser \n    camera.update(deltaTime, nearby_sectors);\n    bsp_handler.update(camera.get_pos_2d());\n\n    // Render Everything\n    render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());\n  }\n\nAt the end of the main function add this:\n  // Destroy the window and cleanup the OpenGL context\n  CloseWindow();\n  return 0;\n\nYou should see this resulting game if done right:\n\n','#### Introduction\r\nWe\'re going to create a simple game only in our `main.cpp` file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\r\n\r\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\r\n\r\nWe\'ll walk through each step of creating the engine.\r\n\r\n#### Include Headers\r\n```c++\r\n// 1. Standard IO Stream\r\n#include <iostream>\r\n\r\n// 2. Engine Cores\r\n#include <bsp/handler.h>\r\n#include <render/handler.h>\r\n#include <input/handler.h>\r\n\r\n// 3. Game Camera\r\n#include <bsp/camera.h>\r\n\r\n// 4. Example Level\r\n#include <test/level.h>\r\n\r\n// 5. RayLib-Related Code\r\n#include <raylib.h>\r\n#include <resource_dir.h>\r\n\r\n```\r\n1. Standard IO Stream - Debugging\r\n2. Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\r\n3. Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\r\n4. Example Level - Provided by the engine for testing\r\n5. RayLib-Related Code - For basic configurations (such as window and `resources` folder finding)\r\n\r\nFrom now on all of the code will be placed in the main function:\r\n```c++\r\nint main () {\r\n  ... Your code ...\r\n}\r\n```\r\n\r\n#### RayLib Initializations\r\n```c++\r\n  // Optional: Tell the window to use vsync and work on high DPI displays\r\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\r\n\r\n  // Must: Create the window and OpenGL context\r\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\r\n\r\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\r\n  SetTargetFPS(60);\r\n\r\n  // Must: Disable cursor for camera lookaround with 3D Camera\r\n  DisableCursor();\r\n```\r\n\r\n#### Engine Initializations\r\n```c++\r\n  // Set Game Delta-Time for fixed camera, world, and objects movement\r\n  glm::float32_t deltaTime = 0.0f;\r\n\r\n  // Create the 3D Camera and locate it in (6, 7) coordinates\r\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\r\n\r\n  // Create Engine Handlers (BSP, rendering, and user input)\r\n  bsp::Handler bsp_handler;\r\n  render::Handler render_handler;\r\n  input::Handler input_handler;\r\n\r\n```\r\n\r\n#### Resources Loading\r\n```c++\r\n  // Set `Game/resources` as main resources directory for easy load\r\n  SearchAndSetResourceDir(\"Game/resources\");\r\n\r\n  // Load textures using Texture Manager\r\n  render_handler.load_texture(1, \"Wall1.png\");\r\n  render_handler.load_texture(2, \"Monster1-north.png\");\r\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\r\n\r\n  // Load Level sectors and segments from example level\r\n  bsp_handler.load_level(bsp::test_level_sectors);\r\n\r\n  // Load calculated sectors and segments by the BSP Handler\r\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\r\n\r\n  // Load sprites for example level\r\n  render_handler.load_sprites(bsp::test_level_sprites);\r\n\r\n```\r\n\r\n#### Delta-Time Clamp Prevention (recommended)\r\nFirst we\'ll add the function declaration at the top of the file below the includes:\r\n```c++\r\nvoid prevent_dt_clamp(glm::float32_t& deltaTime);\r\n```\r\n\r\nNow below the main function we\'ll add this:\r\n```c++\r\nvoid prevent_dt_clamp(glm::float32_t& deltaTime) {\r\n  if (deltaTime > 0.05f) {\r\n    deltaTime = 0.0166f; \r\n  }\r\n}\r\n\r\n```\r\n\r\nWe\'ll use it soon.\r\n\r\n#### Main Game Loop & Window Management\r\n```c++\r\n  // Game Loop (run until the window is closed)\r\n  while (!WindowShouldClose())\r\n  {\r\n    // Update and calculate Delta-Time:\r\n    deltaTime = GetFrameTime();\r\n    prevent_dt_clamp(deltaTime);\r\n    camera.pre_update(deltaTime);\r\n    input_handler.update(camera, render_handler.get_map_renderer());\r\n    \r\n    // Ask the BSP tree what is nearby\r\n    std::vector<bsp::Sector> nearby_sectors = bsp_handler.get_nearby_sectors(\r\n        camera.get_pos_2d(), \r\n        camera.get_player_radius()\r\n    );\r\n\r\n    // Update Camera, BSP Tree, and BSP Traverser \r\n    camera.update(deltaTime, nearby_sectors);\r\n    bsp_handler.update(camera.get_pos_2d());\r\n\r\n    // Render Everything\r\n    render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());\r\n  }\r\n```\r\n\r\nAt the end of the main function add this:\r\n```c++\r\n  // Destroy the window and cleanup the OpenGL context\r\n  CloseWindow();\r\n  return 0;\r\n```\r\n\r\nYou should see this resulting game if done right:\r\n\r\n[![](http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/image-1778161088033.png)](http://localhost:6875/uploads/images/gallery/2026-05/image-1778161088033.png)');
/*!40000 ALTER TABLE `entity_page_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_permissions`
--

DROP TABLE IF EXISTS `entity_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` bigint(20) unsigned NOT NULL,
  `entity_type` varchar(25) NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `view` tinyint(1) NOT NULL DEFAULT 0,
  `create` tinyint(1) NOT NULL DEFAULT 0,
  `update` tinyint(1) NOT NULL DEFAULT 0,
  `delete` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `new_entity_permissions_entity_id_entity_type_index` (`entity_id`,`entity_type`),
  KEY `new_entity_permissions_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_permissions`
--

LOCK TABLES `entity_permissions` WRITE;
/*!40000 ALTER TABLE `entity_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `favouritable_id` bigint(20) unsigned NOT NULL,
  `favouritable_type` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favouritable_index` (`favouritable_id`,`favouritable_type`),
  KEY `favourites_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `path` varchar(400) NOT NULL,
  `type` varchar(191) NOT NULL,
  `uploaded_to` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_type_index` (`type`),
  KEY `images_uploaded_to_index` (`uploaded_to`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES
(1,'image.png','http://localhost:6875/uploads/images/gallery/2026-05/352image.png','2026-05-04 14:12:52','2026-05-04 14:12:52',1,1,'/uploads/images/gallery/2026-05/352image.png','gallery',6),
(2,'image.png','http://localhost:6875/uploads/images/gallery/2026-05/rFaimage.png','2026-05-04 14:20:18','2026-05-04 14:20:18',1,1,'/uploads/images/gallery/2026-05/rFaimage.png','gallery',6),
(3,'image.png','http://localhost:6875/uploads/images/gallery/2026-05/JL6image.png','2026-05-04 14:20:41','2026-05-04 14:20:41',1,1,'/uploads/images/gallery/2026-05/JL6image.png','gallery',6),
(4,'image-1778160938534.png','http://localhost:6875/uploads/images/gallery/2026-05/image-1778160938534.png','2026-05-07 13:35:38','2026-05-07 13:35:38',1,1,'/uploads/images/gallery/2026-05/image-1778160938534.png','gallery',10),
(5,'image-1778160963486.png','http://localhost:6875/uploads/images/gallery/2026-05/image-1778160963486.png','2026-05-07 13:36:03','2026-05-07 13:36:03',1,1,'/uploads/images/gallery/2026-05/image-1778160963486.png','gallery',10),
(6,'image-1778160972037.png','http://localhost:6875/uploads/images/gallery/2026-05/image-1778160972037.png','2026-05-07 13:36:12','2026-05-07 13:36:12',1,1,'/uploads/images/gallery/2026-05/image-1778160972037.png','gallery',10),
(7,'image-1778161057317.png','http://localhost:6875/uploads/images/gallery/2026-05/image-1778161057317.png','2026-05-07 13:37:37','2026-05-07 13:37:37',1,1,'/uploads/images/gallery/2026-05/image-1778161057317.png','gallery',10),
(8,'image-1778161088033.png','http://localhost:6875/uploads/images/gallery/2026-05/image-1778161088033.png','2026-05-07 13:38:08','2026-05-07 13:38:08',1,1,'/uploads/images/gallery/2026-05/image-1778161088033.png','gallery',10);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `path` varchar(191) NOT NULL,
  `size` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `metadata` longtext NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imports_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joint_permissions`
--

DROP TABLE IF EXISTS `joint_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `joint_permissions` (
  `role_id` int(11) NOT NULL,
  `entity_type` varchar(191) NOT NULL,
  `entity_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `owner_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`role_id`,`entity_type`,`entity_id`),
  KEY `joint_permissions_entity_id_entity_type_index` (`entity_id`,`entity_type`),
  KEY `joint_permissions_role_id_index` (`role_id`),
  KEY `joint_permissions_status_index` (`status`),
  KEY `joint_permissions_owner_id_index` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joint_permissions`
--

LOCK TABLES `joint_permissions` WRITE;
/*!40000 ALTER TABLE `joint_permissions` DISABLE KEYS */;
INSERT INTO `joint_permissions` VALUES
(1,'book',2,3,1),
(1,'bookshelf',1,3,1),
(1,'bookshelf',3,3,1),
(1,'chapter',4,3,1),
(1,'chapter',8,3,1),
(1,'page',5,3,1),
(1,'page',6,3,1),
(1,'page',7,3,1),
(1,'page',9,3,1),
(1,'page',10,3,1),
(2,'book',2,1,1),
(2,'bookshelf',1,1,1),
(2,'bookshelf',3,1,1),
(2,'chapter',4,1,1),
(2,'chapter',8,1,1),
(2,'page',5,1,1),
(2,'page',6,1,1),
(2,'page',7,1,1),
(2,'page',9,1,1),
(2,'page',10,1,1),
(3,'book',2,1,1),
(3,'bookshelf',1,1,1),
(3,'bookshelf',3,1,1),
(3,'chapter',4,1,1),
(3,'chapter',8,1,1),
(3,'page',5,1,1),
(3,'page',6,1,1),
(3,'page',7,1,1),
(3,'page',9,1,1),
(3,'page',10,1,1),
(4,'book',2,1,1),
(4,'bookshelf',1,1,1),
(4,'bookshelf',3,1,1),
(4,'chapter',4,1,1),
(4,'chapter',8,1,1),
(4,'page',5,1,1),
(4,'page',6,1,1),
(4,'page',7,1,1),
(4,'page',9,1,1),
(4,'page',10,1,1);
/*!40000 ALTER TABLE `joint_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mention_history`
--

DROP TABLE IF EXISTS `mention_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mention_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mentionable_type` varchar(50) NOT NULL,
  `mentionable_id` bigint(20) unsigned NOT NULL,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mention_history_mentionable_type_index` (`mentionable_type`),
  KEY `mention_history_mentionable_id_index` (`mentionable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mention_history`
--

LOCK TABLES `mention_history` WRITE;
/*!40000 ALTER TABLE `mention_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mention_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfa_values`
--

DROP TABLE IF EXISTS `mfa_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mfa_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `method` varchar(20) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mfa_values_user_id_index` (`user_id`),
  KEY `mfa_values_method_index` (`method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfa_values`
--

LOCK TABLES `mfa_values` WRITE;
/*!40000 ALTER TABLE `mfa_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfa_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2015_07_12_114933_create_books_table',1),
(4,'2015_07_12_190027_create_pages_table',1),
(5,'2015_07_13_172121_create_images_table',1),
(6,'2015_07_27_172342_create_chapters_table',1),
(7,'2015_08_08_200447_add_users_to_entities',1),
(8,'2015_08_09_093534_create_page_revisions_table',1),
(9,'2015_08_16_142133_create_activities_table',1),
(10,'2015_08_29_105422_add_roles_and_permissions',1),
(11,'2015_08_30_125859_create_settings_table',1),
(12,'2015_08_31_175240_add_search_indexes',1),
(13,'2015_09_04_165821_create_social_accounts_table',1),
(14,'2015_09_05_164707_add_email_confirmation_table',1),
(15,'2015_11_21_145609_create_views_table',1),
(16,'2015_11_26_221857_add_entity_indexes',1),
(17,'2015_12_05_145049_fulltext_weighting',1),
(18,'2015_12_07_195238_add_image_upload_types',1),
(19,'2015_12_09_195748_add_user_avatars',1),
(20,'2016_01_11_210908_add_external_auth_to_users',1),
(21,'2016_02_25_184030_add_slug_to_revisions',1),
(22,'2016_02_27_120329_update_permissions_and_roles',1),
(23,'2016_02_28_084200_add_entity_access_controls',1),
(24,'2016_03_09_203143_add_page_revision_types',1),
(25,'2016_03_13_082138_add_page_drafts',1),
(26,'2016_03_25_123157_add_markdown_support',1),
(27,'2016_04_09_100730_add_view_permissions_to_roles',1),
(28,'2016_04_20_192649_create_joint_permissions_table',1),
(29,'2016_05_06_185215_create_tags_table',1),
(30,'2016_07_07_181521_add_summary_to_page_revisions',1),
(31,'2016_09_29_101449_remove_hidden_roles',1),
(32,'2016_10_09_142037_create_attachments_table',1),
(33,'2017_01_21_163556_create_cache_table',1),
(34,'2017_01_21_163602_create_sessions_table',1),
(35,'2017_03_19_091553_create_search_index_table',1),
(36,'2017_04_20_185112_add_revision_counts',1),
(37,'2017_07_02_152834_update_db_encoding_to_ut8mb4',1),
(38,'2017_08_01_130541_create_comments_table',1),
(39,'2017_08_29_102650_add_cover_image_display',1),
(40,'2018_07_15_173514_add_role_external_auth_id',1),
(41,'2018_08_04_115700_create_bookshelves_table',1),
(42,'2019_07_07_112515_add_template_support',1),
(43,'2019_08_17_140214_add_user_invites_table',1),
(44,'2019_12_29_120917_add_api_auth',1),
(45,'2020_08_04_111754_drop_joint_permissions_id',1),
(46,'2020_08_04_131052_remove_role_name_field',1),
(47,'2020_09_19_094251_add_activity_indexes',1),
(48,'2020_09_27_210059_add_entity_soft_deletes',1),
(49,'2020_09_27_210528_create_deletions_table',1),
(50,'2020_11_07_232321_simplify_activities_table',1),
(51,'2020_12_30_173528_add_owned_by_field_to_entities',1),
(52,'2021_01_30_225441_add_settings_type_column',1),
(53,'2021_03_08_215138_add_user_slug',1),
(54,'2021_05_15_173110_create_favourites_table',1),
(55,'2021_06_30_173111_create_mfa_values_table',1),
(56,'2021_07_03_085038_add_mfa_enforced_to_roles_table',1),
(57,'2021_08_28_161743_add_export_role_permission',1),
(58,'2021_09_26_044614_add_activities_ip_column',1),
(59,'2021_11_26_070438_add_index_for_user_ip',1),
(60,'2021_12_07_111343_create_webhooks_table',1),
(61,'2021_12_13_152024_create_jobs_table',1),
(62,'2021_12_13_152120_create_failed_jobs_table',1),
(63,'2022_01_03_154041_add_webhooks_timeout_error_columns',1),
(64,'2022_04_17_101741_add_editor_change_field_and_permission',1),
(65,'2022_04_25_140741_update_polymorphic_types',1),
(66,'2022_07_16_170051_drop_joint_permission_type',1),
(67,'2022_08_17_092941_create_references_table',1),
(68,'2022_09_02_082910_fix_shelf_cover_image_types',1),
(69,'2022_10_07_091406_flatten_entity_permissions_table',1),
(70,'2022_10_08_104202_drop_entity_restricted_field',1),
(71,'2023_01_24_104625_refactor_joint_permissions_storage',1),
(72,'2023_01_28_141230_copy_color_settings_for_dark_mode',1),
(73,'2023_02_20_093655_increase_attachments_path_length',1),
(74,'2023_02_23_200227_add_updated_at_index_to_pages',1),
(75,'2023_06_10_071823_remove_guest_user_secondary_roles',1),
(76,'2023_06_25_181952_remove_bookshelf_create_entity_permissions',1),
(77,'2023_07_25_124945_add_receive_notifications_role_permissions',1),
(78,'2023_07_31_104430_create_watches_table',1),
(79,'2023_08_21_174248_increase_cache_size',1),
(80,'2023_12_02_104541_add_default_template_to_books',1),
(81,'2023_12_17_140913_add_description_html_to_entities',1),
(82,'2024_01_01_104542_add_default_template_to_chapters',1),
(83,'2024_02_04_141358_add_views_updated_index',1),
(84,'2024_05_04_154409_rename_activity_relation_columns',1),
(85,'2024_09_29_140340_ensure_editor_value_set',1),
(86,'2024_10_29_114420_add_import_role_permission',1),
(87,'2024_11_02_160700_create_imports_table',1),
(88,'2024_11_27_171039_add_instance_id_setting',1),
(89,'2025_01_29_180933_create_sort_rules_table',1),
(90,'2025_02_05_150842_add_sort_rule_id_to_books',1),
(91,'2025_04_18_215145_add_content_refs_and_archived_to_comments',1),
(92,'2025_09_02_111542_remove_unused_columns',1),
(93,'2025_09_15_132850_create_entities_table',1),
(94,'2025_09_15_134701_migrate_entity_data',1),
(95,'2025_09_15_134751_update_entity_relation_columns',1),
(96,'2025_09_15_134813_drop_old_entity_tables',1),
(97,'2025_10_18_163331_clean_user_id_references',1),
(98,'2025_10_22_134507_update_comments_relation_field_names',1),
(99,'2025_11_23_161812_create_slug_history_table',1),
(100,'2025_12_15_140219_create_mention_history_table',1),
(101,'2025_12_19_103417_add_views_viewable_type_index',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_revisions`
--

DROP TABLE IF EXISTS `page_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `html` longtext NOT NULL,
  `text` longtext NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `book_slug` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL DEFAULT 'version',
  `markdown` longtext NOT NULL DEFAULT '',
  `summary` varchar(191) DEFAULT NULL,
  `revision_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_revisions_page_id_index` (`page_id`),
  KEY `page_revisions_slug_index` (`slug`),
  KEY `page_revisions_book_slug_index` (`book_slug`),
  KEY `page_revisions_type_index` (`type`),
  KEY `page_revisions_revision_number_index` (`revision_number`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_revisions`
--

LOCK TABLES `page_revisions` WRITE;
/*!40000 ALTER TABLE `page_revisions` DISABLE KEYS */;
INSERT INTO `page_revisions` VALUES
(1,5,'Technologies','','',1,'2026-05-04 13:58:31','2026-05-04 13:58:31','technologies','getting-started','version','','Initial publish',1),
(2,5,'Technologies','<p id=\"bkmrk-the%C2%A0\">The&nbsp;</p>','The ',1,'2026-05-04 14:01:01','2026-05-04 14:01:01','technologies','getting-started','version','','',2),
(4,5,'Overview','<p id=\"bkmrk-the%C2%A0\">The project is a Low Level, Binary Space Partitioning (BSP) based game engine.</p>\r\n<p id=\"bkmrk-%C2%A0\">&nbsp;</p>\r\n<p id=\"bkmrk-there-are-multiple-t\">There are multiple technologies included to implement this technology:</p>\r\n<ul id=\"bkmrk-c%2B%2B---main-programmi\">\r\n<li><strong>C++</strong> - Main programming language for the engine</li>\r\n<li><strong>RayLib</strong> - An open-source, cross-platform, graphics library for creating games/game engines</li>\r\n<li><strong>GLM</strong> - An OpenGL Mathematics library<br></li>\r\n<li><strong>EarCut</strong> - A single-header library that implements Ear Clipping for BSP floor &amp; ceiling calculations<br></li>\r\n</ul>\r\n<p id=\"bkmrk-%C2%A0-1\">&nbsp;</p>','The project is a Low Level, Binary Space Partitioning (BSP) based game engine.\n \nThere are multiple technologies included to implement this technology:\n\nC++ - Main programming language for the engine\nRayLib - An open-source, cross-platform, graphics library for creating games/game engines\nGLM - An OpenGL Mathematics library\nEarCut - A single-header library that implements Ear Clipping for BSP floor & ceiling calculations\n\n ',1,'2026-05-04 14:06:21','2026-05-04 14:06:21','overview','getting-started','version','','',3),
(6,5,'Overview','<p id=\"bkmrk-the%C2%A0\">The project is a Low Level, Binary Space Partitioning (BSP) based game engine.</p>\r\n<p id=\"bkmrk-there-are-multiple-t\">There are multiple technologies included to implement this technology (development and build wise):</p>\r\n<ul id=\"bkmrk-c%2B%2B---main-programmi\">\r\n<li><strong>C++</strong> - Main programming language for the engine</li>\r\n<li><strong>RayLib</strong> - An open-source, cross-platform, graphics library for creating games/game engines</li>\r\n<li><strong>GLM</strong> - An OpenGL Mathematics library<br></li>\r\n<li><strong>EarCut</strong> - A single-header library that implements Ear Clipping for BSP floor &amp; ceiling calculations<br></li>\r\n<li><strong>PreMake</strong> - A cross-platform, project management tool used for creating the project structure on every environment<br></li>\r\n</ul>\r\n<p id=\"bkmrk-the-engine-is-mainly\">The engine is mainly compiled into a library C++ file that can be used everywhere.</p>\r\n<p id=\"bkmrk-%C2%A0\">&nbsp;</p>','The project is a Low Level, Binary Space Partitioning (BSP) based game engine.\nThere are multiple technologies included to implement this technology (development and build wise):\n\nC++ - Main programming language for the engine\nRayLib - An open-source, cross-platform, graphics library for creating games/game engines\nGLM - An OpenGL Mathematics library\nEarCut - A single-header library that implements Ear Clipping for BSP floor & ceiling calculations\nPreMake - A cross-platform, project management tool used for creating the project structure on every environment\n\nThe engine is mainly compiled into a library C++ file that can be used everywhere.\n ',1,'2026-05-04 14:09:27','2026-05-04 14:09:27','overview','getting-started','version','','',4),
(7,6,'Directory Structure','<p id=\"bkmrk-you-can-find-the-sou\">You can find the source code on <a title=\"GitHub - BSP Game Engine\" href=\"https://github.com/Ovidy/BSP-Game-Engine\" target=\"_blank\" rel=\"noopener\">GitHub</a>, feel free. to look it up and play with it.</p>\r\n<p id=\"bkmrk-%C2%A0\">&nbsp;</p>\r\n<p id=\"bkmrk-%C2%A0-1\">&nbsp;</p>','You can find the source code on GitHub, feel free. to look it up and play with it.\n \n ',1,'2026-05-04 14:11:48','2026-05-04 14:11:48','directory-structure','getting-started','version','','Initial publish',1),
(9,6,'Directory Structure','<p id=\"bkmrk-you-can-find-the-sou\">You can find the source code on <a title=\"GitHub - BSP Game Engine\" href=\"https://github.com/Ovidy/BSP-Game-Engine\" target=\"_blank\" rel=\"noopener\">GitHub</a>, feel free. to look it up and play with it.</p>\r\n<p id=\"bkmrk-%C2%A0\"></p>\r\n<h4 id=\"bkmrk-%C2%A0-1\">Main Directory</h4>\r\n<p id=\"bkmrk-there-are-multiple-d\">There are multiple directories that manages the whole project:</p>\r\n<p id=\"bkmrk-\"><a href=\"http://localhost:6875/uploads/images/gallery/2026-05/352image.png\" target=\"_blank\" rel=\"noopener\"><img src=\"http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/352image.png\" alt=\"image.png\" width=\"233\" height=\"368\"></a></p>\r\n<ul id=\"bkmrk-docs---documentation\">\r\n<li><strong>Docs</strong> - Documentation website (the one you\'re reading in right now :) )</li>\r\n<li><strong>Engine</strong> - Game Engine\'s source code</li>\r\n<li><strong>Game&nbsp;</strong>- Game example</li>\r\n<li><strong>build</strong> - build tools for creating the project and using it (premake5 executables)</li>\r\n<li><strong>premake5.lua</strong> - PreMake project configuration</li>\r\n</ul>\r\n<p id=\"bkmrk-%C2%A0-2\">&nbsp;</p>\r\n<p id=\"bkmrk-%C2%A0-3\">&nbsp;</p>','You can find the source code on GitHub, feel free. to look it up and play with it.\n\nMain Directory\nThere are multiple directories that manages the whole project:\n\n\nDocs - Documentation website (the one you\'re reading in right now :) )\nEngine - Game Engine\'s source code\nGame - Game example\nbuild - build tools for creating the project and using it (premake5 executables)\npremake5.lua - PreMake project configuration\n\n \n ',1,'2026-05-04 14:15:09','2026-05-04 14:15:09','directory-structure','getting-started','version','','',2),
(11,6,'Directory Structure','<p id=\"bkmrk-you-can-find-the-sou\">You can find the source code on <a title=\"GitHub - BSP Game Engine\" href=\"https://github.com/Ovidy/BSP-Game-Engine\" target=\"_blank\" rel=\"noopener\">GitHub</a>, feel free. to look it up and play with it.</p>\r\n<p id=\"bkmrk-%C2%A0\"></p>\r\n<h4 id=\"bkmrk-%C2%A0-1\">Main Directory</h4>\r\n<p id=\"bkmrk-there-are-multiple-d\">There are multiple directories that manages the whole project:</p>\r\n<p id=\"bkmrk-\"><a href=\"http://localhost:6875/uploads/images/gallery/2026-05/352image.png\" target=\"_blank\" rel=\"noopener\"><img src=\"http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/352image.png\" alt=\"image.png\" width=\"233\" height=\"368\"></a></p>\r\n<ul id=\"bkmrk-docs---documentation\">\r\n<li><strong>Docs</strong> - Documentation website (the one you\'re reading in right now :) )</li>\r\n<li><strong>Engine</strong> - Game Engine\'s source code</li>\r\n<li><strong>Game&nbsp;</strong>- Game example</li>\r\n<li><strong>build</strong> - build tools for creating the project and using it (premake5 executables)</li>\r\n<li><strong>premake5.lua</strong> - PreMake project configuration</li>\r\n</ul>\r\n<p id=\"bkmrk-%C2%A0-2\"></p>\r\n<h4 id=\"bkmrk-%C2%A0-3\">Engine &amp; Game Example Directories</h4>\r\n<p id=\"bkmrk-the-engine-and-game-\">The engine and game example directories are managed in a similar way:</p>\r\n<p id=\"bkmrk--1\"><a href=\"http://localhost:6875/uploads/images/gallery/2026-05/rFaimage.png\" target=\"_blank\" rel=\"noopener\"><img src=\"http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/rFaimage.png\" alt=\"image.png\" width=\"138\" height=\"103\"></a></p>\r\n<p id=\"bkmrk--2\"><a href=\"http://localhost:6875/uploads/images/gallery/2026-05/JL6image.png\" target=\"_blank\" rel=\"noopener\"><img src=\"http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/JL6image.png\" alt=\"image.png\" width=\"141\" height=\"86\"></a></p>\r\n<ul id=\"bkmrk-include---c%2B%2B-header\">\r\n<li><strong>include</strong> - C++ header files (can be also added to the game and will be explained later on)</li>\r\n<li><strong>src</strong> - C++ source files</li>\r\n<li><strong>resources</strong> - Game resources (such as images, fonts, and sounds)</li>\r\n</ul>\r\n<p id=\"bkmrk-%C2%A0-4\">&nbsp;</p>','You can find the source code on GitHub, feel free. to look it up and play with it.\n\nMain Directory\nThere are multiple directories that manages the whole project:\n\n\nDocs - Documentation website (the one you\'re reading in right now :) )\nEngine - Game Engine\'s source code\nGame - Game example\nbuild - build tools for creating the project and using it (premake5 executables)\npremake5.lua - PreMake project configuration\n\n\nEngine & Game Example Directories\nThe engine and game example directories are managed in a similar way:\n\n\n\ninclude - C++ header files (can be also added to the game and will be explained later on)\nsrc - C++ source files\nresources - Game resources (such as images, fonts, and sounds)\n\n ',1,'2026-05-04 14:29:00','2026-05-04 14:29:00','directory-structure','getting-started','version','','',3),
(12,7,'Setup','<p id=\"bkmrk-now-we%27ll-go-through\">Now we\'ll go through the setup process.</p>\r\n<p id=\"bkmrk-most-of-the-setup-is\">Most of the setup is based on <a title=\"RayLib\'s Quickstart Project\" href=\"https://github.com/raylib-extras/raylib-quickstart\" target=\"_blank\" rel=\"noopener\">RayLib\'s Quickstart Project</a></p>\r\n<p id=\"bkmrk-%C2%A0\">&nbsp;</p>\r\n<h4 id=\"bkmrk-requirements\">Requirements</h4>\r\n<ul id=\"bkmrk-build-tools-%28such-as\">\r\n<li>Build Tools (Such as Make, MinGW, VS Builder, etc...)</li>\r\n<li>Premake5 (Included in&nbsp;<strong>build</strong> directory)</li>\r\n</ul>\r\n<p id=\"bkmrk-%C2%A0-1\">&nbsp;</p>\r\n<h4 id=\"bkmrk-build-environment\">Build Environment</h4>\r\n<p id=\"bkmrk-to-build-the-project\">To build the project you should use PreMake. To run PreMake for your environment, check out the build section<br>in <a title=\"RayLib\'s Build Quickstart Page\" href=\"https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files\" target=\"_blank\" rel=\"noopener\">RayLib\'s Quickstart Page</a>.</p>\r\n<p id=\"bkmrk-%C2%A0-2\">&nbsp;</p>\r\n<p id=\"bkmrk-%C2%A0-3\">&nbsp;</p>','Now we\'ll go through the setup process.\nMost of the setup is based on RayLib\'s Quickstart Project\n \nRequirements\n\nBuild Tools (Such as Make, MinGW, VS Builder, etc...)\nPremake5 (Included in build directory)\n\n \nBuild Environment\nTo build the project you should use PreMake. To run PreMake for your environment, check out the build sectionin RayLib\'s Quickstart Page.\n \n ',1,'2026-05-04 14:51:38','2026-05-04 14:51:38','setup','getting-started','version','','Initial publish',1),
(14,7,'Setup','<p id=\"bkmrk-now-we%27ll-go-through\">Now we\'ll go through the setup process.</p>\r\n<p id=\"bkmrk-most-of-the-setup-is\">Most of the setup is based on <a title=\"RayLib\'s Quickstart Project\" href=\"https://github.com/raylib-extras/raylib-quickstart\" target=\"_blank\" rel=\"noopener\">RayLib\'s Quickstart Project</a></p>\r\n<p id=\"bkmrk-%C2%A0\"></p>\r\n<h4 id=\"bkmrk-requirements\">Requirements</h4>\r\n<ul id=\"bkmrk-build-tools-%28such-as\">\r\n<li>Build Tools (Such as Make, MinGW, VS Builder, etc...)</li>\r\n<li>Premake5 (Included in&nbsp;<strong>build</strong> directory)</li>\r\n</ul>\r\n<p id=\"bkmrk-%C2%A0-1\"></p>\r\n<h4 id=\"bkmrk-add-project\">Add Project</h4>\r\n<p id=\"bkmrk-before-building-the-\">Before building the environment we should create a new project.</p>\r\n<p id=\"bkmrk-clone-the-repository\">Clone the repository to your local machine.</p>\r\n<p id=\"bkmrk-go-to%C2%A0premake5.lua-f\">Go to&nbsp;<strong>premake5.lua</strong> file in the repository and add the following lines:<br></p>\r\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\" id=\"bkmrk-project-%28workspacena\"><colgroup><col style=\"width: 99.881%;\"></colgroup>\r\n<tbody>\r\n<tr>\r\n<td>\r\n<div>\r\n<div>project (workspaceName)</div>\r\n<div>kind \"ConsoleApp\"</div>\r\n<div>language \"C++\"</div>\r\n<div>targetdir \"bin/%{cfg.buildcfg}\"</div>\r\n<div>objdir \"obj/%{cfg.buildcfg}/Game\"</div>\r\n<br>\r\n<div>filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}</div>\r\n<div>kind \"WindowedApp\"</div>\r\n<div>buildoptions { \"-Wl,--subsystem,windows\" }</div>\r\n<br>\r\n<div>filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}</div>\r\n<div>kind \"WindowedApp\"</div>\r\n<div>entrypoint \"mainCRTStartup\"</div>\r\n<br>\r\n<div>filter \"action:vs*\"</div>\r\n<div>debugdir \"$(SolutionDir)\"</div>\r\n<div>filter {}</div>\r\n<div><br></div>\r\n<div>vpaths</div>\r\n<div>{</div>\r\n<div>[\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },</div>\r\n<div>[\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },</div>\r\n<div>[\"Game Resource Files/*\"] = { \"Game/resources/**\" }</div>\r\n<div>}</div>\r\n<br>\r\n<div>-- Grab source code ONLY from the Game folder</div>\r\n<div>files {</div>\r\n<div>\"Game/src/**.c\",</div>\r\n<div>\"Game/src/**.cpp\",</div>\r\n<div>\"Game/include/**.h\",</div>\r\n<div>\"Game/include/**.hpp\"</div>\r\n<div>}</div>\r\n<div><br></div>\r\n<div>filter {\"system:windows\", \"action:vs*\"}</div>\r\n<div>files {\"Game/resources/**\"}</div>\r\n<div>filter{}</div>\r\n<div><br></div>\r\n<div>-- The Game needs to see the Engine\'s headers!</div>\r\n<div>includedirs {</div>\r\n<div>\"Engine/include\",</div>\r\n<div>\"Game/include\",</div>\r\n<div>\"external/glm\",</div>\r\n<div>raylib_dir .. \"/src\"</div>\r\n<div>}</div>\r\n<br>\r\n<div>-- LINKING: The Game links to the Engine AND Raylib</div>\r\n<div>links {\"BSPEngine\", \"raylib\"}</div>\r\n<br>\r\n<div>cdialect \"C17\"</div>\r\n<div>cppdialect \"C++17\"</div>\r\n<div>platform_defines()</div>\r\n<br>\r\n<div>filter \"action:vs*\"</div>\r\n<div>defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}</div>\r\n<div>characterset (\"Unicode\")</div>\r\n<div>buildoptions { \"/Zc:__cplusplus\" }</div>\r\n<br>\r\n<div>-- OS SPECIFIC SYSTEM LINKS</div>\r\n<div>filter \"system:windows\"</div>\r\n<div>defines{\"_WIN32\"}</div>\r\n<div>links {\"winmm\", \"gdi32\", \"opengl32\"}</div>\r\n<div>libdirs {\"bin/%{cfg.buildcfg}\"}</div>\r\n<br>\r\n<div>filter \"system:linux\"</div>\r\n<div>links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}</div>\r\n<br>\r\n<div>filter {\"system:linux\", \"options:wayland=off\"}</div>\r\n<div>links {\"X11\"}</div>\r\n<br>\r\n<div>filter {\"system:linux\", \"options:wayland=on\"}</div>\r\n<div>links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}</div>\r\n<br>\r\n<div>filter \"system:macosx\"</div>\r\n<div>buildoptions { \"-stdlib=libc++\" }</div>\r\n<div>links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}</div>\r\n<div>filter{}</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p id=\"bkmrk-make-sure-that-you-r\">Make sure that you replace \"Game\" with your project directory name.</p>\r\n<p id=\"bkmrk-%C2%A0-2\">&nbsp;</p>\r\n<h4 id=\"bkmrk-build-environment\">Build Environment</h4>\r\n<p id=\"bkmrk-to-build-the-project\">To build the project you should use PreMake. To run PreMake for your environment, check out the build section<br>in <a title=\"RayLib\'s Build Quickstart Page\" href=\"https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files\" target=\"_blank\" rel=\"noopener\">RayLib\'s Quickstart Page</a>.</p>\r\n<p id=\"bkmrk-%C2%A0-3\"></p>','Now we\'ll go through the setup process.\nMost of the setup is based on RayLib\'s Quickstart Project\n\nRequirements\n\nBuild Tools (Such as Make, MinGW, VS Builder, etc...)\nPremake5 (Included in build directory)\n\n\nAdd Project\nBefore building the environment we should create a new project.\nClone the repository to your local machine.\nGo to premake5.lua file in the repository and add the following lines:\n\n\n\n\n\nproject (workspaceName)\nkind \"ConsoleApp\"\nlanguage \"C++\"\ntargetdir \"bin/%{cfg.buildcfg}\"\nobjdir \"obj/%{cfg.buildcfg}/Game\"\n\nfilter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\nkind \"WindowedApp\"\nbuildoptions { \"-Wl,--subsystem,windows\" }\n\nfilter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\nkind \"WindowedApp\"\nentrypoint \"mainCRTStartup\"\n\nfilter \"action:vs*\"\ndebugdir \"$(SolutionDir)\"\nfilter {}\n\nvpaths\n{\n[\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n[\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n[\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n}\n\n-- Grab source code ONLY from the Game folder\nfiles {\n\"Game/src/**.c\",\n\"Game/src/**.cpp\",\n\"Game/include/**.h\",\n\"Game/include/**.hpp\"\n}\n\nfilter {\"system:windows\", \"action:vs*\"}\nfiles {\"Game/resources/**\"}\nfilter{}\n\n-- The Game needs to see the Engine\'s headers!\nincludedirs {\n\"Engine/include\",\n\"Game/include\",\n\"external/glm\",\nraylib_dir .. \"/src\"\n}\n\n-- LINKING: The Game links to the Engine AND Raylib\nlinks {\"BSPEngine\", \"raylib\"}\n\ncdialect \"C17\"\ncppdialect \"C++17\"\nplatform_defines()\n\nfilter \"action:vs*\"\ndefines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\ncharacterset (\"Unicode\")\nbuildoptions { \"/Zc:__cplusplus\" }\n\n-- OS SPECIFIC SYSTEM LINKS\nfilter \"system:windows\"\ndefines{\"_WIN32\"}\nlinks {\"winmm\", \"gdi32\", \"opengl32\"}\nlibdirs {\"bin/%{cfg.buildcfg}\"}\n\nfilter \"system:linux\"\nlinks {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\nfilter {\"system:linux\", \"options:wayland=off\"}\nlinks {\"X11\"}\n\nfilter {\"system:linux\", \"options:wayland=on\"}\nlinks {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\nfilter \"system:macosx\"\nbuildoptions { \"-stdlib=libc++\" }\nlinks {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\nfilter{}\n\n\n\n\n\nMake sure that you replace \"Game\" with your project directory name.\n \nBuild Environment\nTo build the project you should use PreMake. To run PreMake for your environment, check out the build sectionin RayLib\'s Quickstart Page.\n',1,'2026-05-04 14:57:34','2026-05-04 14:57:34','setup','getting-started','version','','',2),
(16,7,'Setup','<p id=\"bkmrk-now-we%27ll-go-through\">Now we\'ll go through the setup process.</p>\n<p id=\"bkmrk-most-of-the-setup-is\">Most of the setup is based on <a href=\"https://github.com/raylib-extras/raylib-quickstart\" title=\"RayLib\'s Quickstart Project\">RayLib\'s Quickstart Project</a></p>\n<h4 id=\"bkmrk-requirements\">Requirements</h4>\n<ul id=\"bkmrk-build-tools-%28such-as\">\n<li>Build Tools (Such as Make, MinGW, VS Builder, etc...)</li>\n<li>Premake5 (Included in <strong>build</strong> directory)</li>\n</ul>\n<h4 id=\"bkmrk-add-project\">Add Project</h4>\n<p id=\"bkmrk-before-building-the-\">Before building the environment we should create a new project.</p>\n<p id=\"bkmrk-clone-the-repository\">Clone the repository to your local machine.</p>\n<p id=\"bkmrk-go-to-premake5.lua-f\">Go to <strong>premake5.lua</strong> file in the repository and add the following lines:</p>\n<pre id=\"bkmrk----%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D\"><code class=\"language-lua\">    -- ========================================================\n    -- PROJECT 3: THE GAME (Executable)\n    -- ========================================================\n    project (workspaceName)\n        kind \"ConsoleApp\"\n        language \"C++\"\n        targetdir \"bin/%{cfg.buildcfg}\"\n        objdir \"obj/%{cfg.buildcfg}/Game\"\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\n            kind \"WindowedApp\"\n            buildoptions { \"-Wl,--subsystem,windows\" }\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\n            kind \"WindowedApp\"\n            entrypoint \"mainCRTStartup\"\n\n        filter \"action:vs*\"\n            debugdir \"$(SolutionDir)\"\n        filter {}\n        \n        vpaths \n        {\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n        }\n\n        -- Grab source code ONLY from the Game folder\n        files {\n            \"Game/src/**.c\",\n            \"Game/src/**.cpp\",\n            \"Game/include/**.h\", \n            \"Game/include/**.hpp\"\n        }\n        \n        filter {\"system:windows\", \"action:vs*\"}\n            files {\"Game/resources/**\"}\n        filter{}\n        \n        -- The Game needs to see the Engine\'s headers!\n        includedirs { \n            \"Engine/include\",\n            \"Game/include\",\n            \"external/glm\", \n            raylib_dir .. \"/src\" \n        }\n\n        -- LINKING: The Game links to the Engine AND Raylib\n        links {\"BSPEngine\", \"raylib\"}\n\n        cdialect \"C17\"\n        cppdialect \"C++17\"\n        platform_defines()\n\n        filter \"action:vs*\"\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\n            characterset (\"Unicode\")\n            buildoptions { \"/Zc:__cplusplus\" }\n\n        -- OS SPECIFIC SYSTEM LINKS\n        filter \"system:windows\"\n            defines{\"_WIN32\"}\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\n            libdirs {\"bin/%{cfg.buildcfg}\"}\n\n        filter \"system:linux\"\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\n        filter {\"system:linux\", \"options:wayland=off\"}\n            links {\"X11\"}\n\n        filter {\"system:linux\", \"options:wayland=on\"}\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\n        filter \"system:macosx\"\n            buildoptions { \"-stdlib=libc++\" }\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\n        filter{}\n</code></pre>\n<p id=\"bkmrk-make-sure-that-you-r\">Make sure that you replace \"Game\" with your project directory name.</p>\n<h4 id=\"bkmrk-build-environment\">Build Environment</h4>\n<p id=\"bkmrk-to-build-the-project\">To build the project you should use PreMake. To run PreMake for your environment, check out the build section<br>\nin <a href=\"https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files\" title=\"RayLib\'s Build Quickstart Page\">RayLib\'s Quickstart Page</a>.</p>\n','Now we\'ll go through the setup process.\nMost of the setup is based on RayLib\'s Quickstart Project\nRequirements\n\nBuild Tools (Such as Make, MinGW, VS Builder, etc...)\nPremake5 (Included in build directory)\n\nAdd Project\nBefore building the environment we should create a new project.\nClone the repository to your local machine.\nGo to premake5.lua file in the repository and add the following lines:\n    -- ========================================================\n    -- PROJECT 3: THE GAME (Executable)\n    -- ========================================================\n    project (workspaceName)\n        kind \"ConsoleApp\"\n        language \"C++\"\n        targetdir \"bin/%{cfg.buildcfg}\"\n        objdir \"obj/%{cfg.buildcfg}/Game\"\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\n            kind \"WindowedApp\"\n            buildoptions { \"-Wl,--subsystem,windows\" }\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\n            kind \"WindowedApp\"\n            entrypoint \"mainCRTStartup\"\n\n        filter \"action:vs*\"\n            debugdir \"$(SolutionDir)\"\n        filter {}\n        \n        vpaths \n        {\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n        }\n\n        -- Grab source code ONLY from the Game folder\n        files {\n            \"Game/src/**.c\",\n            \"Game/src/**.cpp\",\n            \"Game/include/**.h\", \n            \"Game/include/**.hpp\"\n        }\n        \n        filter {\"system:windows\", \"action:vs*\"}\n            files {\"Game/resources/**\"}\n        filter{}\n        \n        -- The Game needs to see the Engine\'s headers!\n        includedirs { \n            \"Engine/include\",\n            \"Game/include\",\n            \"external/glm\", \n            raylib_dir .. \"/src\" \n        }\n\n        -- LINKING: The Game links to the Engine AND Raylib\n        links {\"BSPEngine\", \"raylib\"}\n\n        cdialect \"C17\"\n        cppdialect \"C++17\"\n        platform_defines()\n\n        filter \"action:vs*\"\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\n            characterset (\"Unicode\")\n            buildoptions { \"/Zc:__cplusplus\" }\n\n        -- OS SPECIFIC SYSTEM LINKS\n        filter \"system:windows\"\n            defines{\"_WIN32\"}\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\n            libdirs {\"bin/%{cfg.buildcfg}\"}\n\n        filter \"system:linux\"\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\n        filter {\"system:linux\", \"options:wayland=off\"}\n            links {\"X11\"}\n\n        filter {\"system:linux\", \"options:wayland=on\"}\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\n        filter \"system:macosx\"\n            buildoptions { \"-stdlib=libc++\" }\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\n        filter{}\n\nMake sure that you replace \"Game\" with your project directory name.\nBuild Environment\nTo build the project you should use PreMake. To run PreMake for your environment, check out the build section\nin RayLib\'s Quickstart Page.\n',1,'2026-05-04 14:59:35','2026-05-04 14:59:35','setup','getting-started','version','Now we\'ll go through the setup process.\r\n\r\nMost of the setup is based on [RayLib\'s Quickstart Project](https://github.com/raylib-extras/raylib-quickstart \"RayLib\'s Quickstart Project\")\r\n\r\n#### Requirements\r\n\r\n- Build Tools (Such as Make, MinGW, VS Builder, etc...)\r\n- Premake5 (Included in **build** directory)\r\n\r\n#### Add Project\r\n\r\nBefore building the environment we should create a new project.\r\n\r\nClone the repository to your local machine.\r\n\r\nGo to **premake5.lua** file in the repository and add the following lines:\r\n\r\n```lua\r\n    -- ========================================================\r\n    -- PROJECT 3: THE GAME (Executable)\r\n    -- ========================================================\r\n    project (workspaceName)\r\n        kind \"ConsoleApp\"\r\n        language \"C++\"\r\n        targetdir \"bin/%{cfg.buildcfg}\"\r\n        objdir \"obj/%{cfg.buildcfg}/Game\"\r\n\r\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\r\n            kind \"WindowedApp\"\r\n            buildoptions { \"-Wl,--subsystem,windows\" }\r\n\r\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\r\n            kind \"WindowedApp\"\r\n            entrypoint \"mainCRTStartup\"\r\n\r\n        filter \"action:vs*\"\r\n            debugdir \"$(SolutionDir)\"\r\n        filter {}\r\n        \r\n        vpaths \r\n        {\r\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\r\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\r\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\r\n        }\r\n\r\n        -- Grab source code ONLY from the Game folder\r\n        files {\r\n            \"Game/src/**.c\",\r\n            \"Game/src/**.cpp\",\r\n            \"Game/include/**.h\", \r\n            \"Game/include/**.hpp\"\r\n        }\r\n        \r\n        filter {\"system:windows\", \"action:vs*\"}\r\n            files {\"Game/resources/**\"}\r\n        filter{}\r\n        \r\n        -- The Game needs to see the Engine\'s headers!\r\n        includedirs { \r\n            \"Engine/include\",\r\n            \"Game/include\",\r\n            \"external/glm\", \r\n            raylib_dir .. \"/src\" \r\n        }\r\n\r\n        -- LINKING: The Game links to the Engine AND Raylib\r\n        links {\"BSPEngine\", \"raylib\"}\r\n\r\n        cdialect \"C17\"\r\n        cppdialect \"C++17\"\r\n        platform_defines()\r\n\r\n        filter \"action:vs*\"\r\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\r\n            characterset (\"Unicode\")\r\n            buildoptions { \"/Zc:__cplusplus\" }\r\n\r\n        -- OS SPECIFIC SYSTEM LINKS\r\n        filter \"system:windows\"\r\n            defines{\"_WIN32\"}\r\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\r\n            libdirs {\"bin/%{cfg.buildcfg}\"}\r\n\r\n        filter \"system:linux\"\r\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\r\n\r\n        filter {\"system:linux\", \"options:wayland=off\"}\r\n            links {\"X11\"}\r\n\r\n        filter {\"system:linux\", \"options:wayland=on\"}\r\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\r\n\r\n        filter \"system:macosx\"\r\n            buildoptions { \"-stdlib=libc++\" }\r\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\r\n        filter{}\r\n```\r\n\r\nMake sure that you replace \"Game\" with your project directory name.\r\n\r\n#### Build Environment\r\n\r\nTo build the project you should use PreMake. To run PreMake for your environment, check out the build section  \r\nin [RayLib\'s Quickstart Page](https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files \"RayLib\'s Build Quickstart Page\").','',3),
(18,7,'Setup','<p id=\"bkmrk-now-we%27ll-go-through\">Now we\'ll go through the setup process.</p>\n<p id=\"bkmrk-most-of-the-setup-is\">Most of the setup is based on <a href=\"https://github.com/raylib-extras/raylib-quickstart\" title=\"RayLib\'s Quickstart Project\">RayLib\'s Quickstart Project</a></p>\n<h4 id=\"bkmrk-requirements\">Requirements</h4>\n<ul id=\"bkmrk-build-tools-%28such-as\">\n<li>Build Tools (Such as Make, MinGW, VS Builder, etc...)</li>\n<li>Premake5 (Included in <strong>build</strong> directory)</li>\n</ul>\n<h4 id=\"bkmrk-add-project\">Add Project</h4>\n<p id=\"bkmrk-before-building-the-\">Before building the environment we should create a new project.</p>\n<p id=\"bkmrk-clone-the-repository\">Clone the repository to your local machine.</p>\n<p id=\"bkmrk-go-to-premake5.lua-f\">Go to <strong>premake5.lua</strong> file in the repository and add the following lines:</p>\n<pre id=\"bkmrk----%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D\"><code class=\"language-lua\">    -- ========================================================\n    -- PROJECT 3: THE GAME (Executable)\n    -- ========================================================\n    project (workspaceName)\n        kind \"ConsoleApp\"\n        language \"C++\"\n        targetdir \"bin/%{cfg.buildcfg}\"\n        objdir \"obj/%{cfg.buildcfg}/Game\"\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\n            kind \"WindowedApp\"\n            buildoptions { \"-Wl,--subsystem,windows\" }\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\n            kind \"WindowedApp\"\n            entrypoint \"mainCRTStartup\"\n\n        filter \"action:vs*\"\n            debugdir \"$(SolutionDir)\"\n        filter {}\n        \n        vpaths \n        {\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n        }\n\n        -- Grab source code ONLY from the Game folder\n        files {\n            \"Game/src/**.c\",\n            \"Game/src/**.cpp\",\n            \"Game/include/**.h\", \n            \"Game/include/**.hpp\"\n        }\n        \n        filter {\"system:windows\", \"action:vs*\"}\n            files {\"Game/resources/**\"}\n        filter{}\n        \n        -- The Game needs to see the Engine\'s headers!\n        includedirs { \n            \"Engine/include\",\n            \"Game/include\",\n            \"external/glm\", \n            raylib_dir .. \"/src\" \n        }\n\n        -- LINKING: The Game links to the Engine AND Raylib\n        links {\"BSPEngine\", \"raylib\"}\n\n        cdialect \"C17\"\n        cppdialect \"C++17\"\n        platform_defines()\n\n        filter \"action:vs*\"\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\n            characterset (\"Unicode\")\n            buildoptions { \"/Zc:__cplusplus\" }\n\n        -- OS SPECIFIC SYSTEM LINKS\n        filter \"system:windows\"\n            defines{\"_WIN32\"}\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\n            libdirs {\"bin/%{cfg.buildcfg}\"}\n\n        filter \"system:linux\"\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\n        filter {\"system:linux\", \"options:wayland=off\"}\n            links {\"X11\"}\n\n        filter {\"system:linux\", \"options:wayland=on\"}\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\n        filter \"system:macosx\"\n            buildoptions { \"-stdlib=libc++\" }\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\n        filter{}\n</code></pre>\n<p id=\"bkmrk-make-sure-that-you-r\">Make sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a <code>src</code> (<code>include</code> and `resources are recommended too).</p>\n<h4 id=\"bkmrk-build-environment\">Build Environment</h4>\n<p id=\"bkmrk-to-build-the-project\">To build the project you should use PreMake. To run PreMake for your environment, check out the build section<br>\nin <a href=\"https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files\" title=\"RayLib\'s Build Quickstart Page\">RayLib\'s Quickstart Page</a>.</p>\n','Now we\'ll go through the setup process.\nMost of the setup is based on RayLib\'s Quickstart Project\nRequirements\n\nBuild Tools (Such as Make, MinGW, VS Builder, etc...)\nPremake5 (Included in build directory)\n\nAdd Project\nBefore building the environment we should create a new project.\nClone the repository to your local machine.\nGo to premake5.lua file in the repository and add the following lines:\n    -- ========================================================\n    -- PROJECT 3: THE GAME (Executable)\n    -- ========================================================\n    project (workspaceName)\n        kind \"ConsoleApp\"\n        language \"C++\"\n        targetdir \"bin/%{cfg.buildcfg}\"\n        objdir \"obj/%{cfg.buildcfg}/Game\"\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\n            kind \"WindowedApp\"\n            buildoptions { \"-Wl,--subsystem,windows\" }\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\n            kind \"WindowedApp\"\n            entrypoint \"mainCRTStartup\"\n\n        filter \"action:vs*\"\n            debugdir \"$(SolutionDir)\"\n        filter {}\n        \n        vpaths \n        {\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n        }\n\n        -- Grab source code ONLY from the Game folder\n        files {\n            \"Game/src/**.c\",\n            \"Game/src/**.cpp\",\n            \"Game/include/**.h\", \n            \"Game/include/**.hpp\"\n        }\n        \n        filter {\"system:windows\", \"action:vs*\"}\n            files {\"Game/resources/**\"}\n        filter{}\n        \n        -- The Game needs to see the Engine\'s headers!\n        includedirs { \n            \"Engine/include\",\n            \"Game/include\",\n            \"external/glm\", \n            raylib_dir .. \"/src\" \n        }\n\n        -- LINKING: The Game links to the Engine AND Raylib\n        links {\"BSPEngine\", \"raylib\"}\n\n        cdialect \"C17\"\n        cppdialect \"C++17\"\n        platform_defines()\n\n        filter \"action:vs*\"\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\n            characterset (\"Unicode\")\n            buildoptions { \"/Zc:__cplusplus\" }\n\n        -- OS SPECIFIC SYSTEM LINKS\n        filter \"system:windows\"\n            defines{\"_WIN32\"}\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\n            libdirs {\"bin/%{cfg.buildcfg}\"}\n\n        filter \"system:linux\"\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\n        filter {\"system:linux\", \"options:wayland=off\"}\n            links {\"X11\"}\n\n        filter {\"system:linux\", \"options:wayland=on\"}\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\n        filter \"system:macosx\"\n            buildoptions { \"-stdlib=libc++\" }\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\n        filter{}\n\nMake sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a src (include and `resources are recommended too).\nBuild Environment\nTo build the project you should use PreMake. To run PreMake for your environment, check out the build section\nin RayLib\'s Quickstart Page.\n',1,'2026-05-04 15:45:09','2026-05-04 15:45:09','setup','getting-started','version','Now we\'ll go through the setup process.\r\n\r\nMost of the setup is based on [RayLib\'s Quickstart Project](https://github.com/raylib-extras/raylib-quickstart \"RayLib\'s Quickstart Project\")\r\n\r\n#### Requirements\r\n\r\n- Build Tools (Such as Make, MinGW, VS Builder, etc...)\r\n- Premake5 (Included in **build** directory)\r\n\r\n#### Add Project\r\n\r\nBefore building the environment we should create a new project.\r\n\r\nClone the repository to your local machine.\r\n\r\nGo to **premake5.lua** file in the repository and add the following lines:\r\n\r\n```lua\r\n    -- ========================================================\r\n    -- PROJECT 3: THE GAME (Executable)\r\n    -- ========================================================\r\n    project (workspaceName)\r\n        kind \"ConsoleApp\"\r\n        language \"C++\"\r\n        targetdir \"bin/%{cfg.buildcfg}\"\r\n        objdir \"obj/%{cfg.buildcfg}/Game\"\r\n\r\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\r\n            kind \"WindowedApp\"\r\n            buildoptions { \"-Wl,--subsystem,windows\" }\r\n\r\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\r\n            kind \"WindowedApp\"\r\n            entrypoint \"mainCRTStartup\"\r\n\r\n        filter \"action:vs*\"\r\n            debugdir \"$(SolutionDir)\"\r\n        filter {}\r\n        \r\n        vpaths \r\n        {\r\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\r\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\r\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\r\n        }\r\n\r\n        -- Grab source code ONLY from the Game folder\r\n        files {\r\n            \"Game/src/**.c\",\r\n            \"Game/src/**.cpp\",\r\n            \"Game/include/**.h\", \r\n            \"Game/include/**.hpp\"\r\n        }\r\n        \r\n        filter {\"system:windows\", \"action:vs*\"}\r\n            files {\"Game/resources/**\"}\r\n        filter{}\r\n        \r\n        -- The Game needs to see the Engine\'s headers!\r\n        includedirs { \r\n            \"Engine/include\",\r\n            \"Game/include\",\r\n            \"external/glm\", \r\n            raylib_dir .. \"/src\" \r\n        }\r\n\r\n        -- LINKING: The Game links to the Engine AND Raylib\r\n        links {\"BSPEngine\", \"raylib\"}\r\n\r\n        cdialect \"C17\"\r\n        cppdialect \"C++17\"\r\n        platform_defines()\r\n\r\n        filter \"action:vs*\"\r\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\r\n            characterset (\"Unicode\")\r\n            buildoptions { \"/Zc:__cplusplus\" }\r\n\r\n        -- OS SPECIFIC SYSTEM LINKS\r\n        filter \"system:windows\"\r\n            defines{\"_WIN32\"}\r\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\r\n            libdirs {\"bin/%{cfg.buildcfg}\"}\r\n\r\n        filter \"system:linux\"\r\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\r\n\r\n        filter {\"system:linux\", \"options:wayland=off\"}\r\n            links {\"X11\"}\r\n\r\n        filter {\"system:linux\", \"options:wayland=on\"}\r\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\r\n\r\n        filter \"system:macosx\"\r\n            buildoptions { \"-stdlib=libc++\" }\r\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\r\n        filter{}\r\n```\r\n\r\nMake sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a `src` (`include` and `resources are recommended too).\r\n\r\n#### Build Environment\r\n\r\nTo build the project you should use PreMake. To run PreMake for your environment, check out the build section  \r\nin [RayLib\'s Quickstart Page](https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files \"RayLib\'s Build Quickstart Page\").','',4),
(19,7,'Project Setup','<p id=\"bkmrk-now-we%27ll-go-through\">Now we\'ll go through the setup process.</p>\n<p id=\"bkmrk-most-of-the-setup-is\">Most of the setup is based on <a href=\"https://github.com/raylib-extras/raylib-quickstart\" title=\"RayLib\'s Quickstart Project\">RayLib\'s Quickstart Project</a></p>\n<h4 id=\"bkmrk-requirements\">Requirements</h4>\n<ul id=\"bkmrk-build-tools-%28such-as\">\n<li>Build Tools (Such as Make, MinGW, VS Builder, etc...)</li>\n<li>Premake5 (Included in <strong>build</strong> directory)</li>\n</ul>\n<h4 id=\"bkmrk-add-project\">Add Project</h4>\n<p id=\"bkmrk-before-building-the-\">Before building the environment we should create a new project.</p>\n<p id=\"bkmrk-clone-the-repository\">Clone the repository to your local machine.</p>\n<p id=\"bkmrk-go-to-premake5.lua-f\">Go to <strong>premake5.lua</strong> file in the repository and add the following lines:</p>\n<pre id=\"bkmrk----%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D\"><code class=\"language-lua\">    -- ========================================================\n    -- PROJECT 3: THE GAME (Executable)\n    -- ========================================================\n    project (workspaceName)\n        kind \"ConsoleApp\"\n        language \"C++\"\n        targetdir \"bin/%{cfg.buildcfg}\"\n        objdir \"obj/%{cfg.buildcfg}/Game\"\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\n            kind \"WindowedApp\"\n            buildoptions { \"-Wl,--subsystem,windows\" }\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\n            kind \"WindowedApp\"\n            entrypoint \"mainCRTStartup\"\n\n        filter \"action:vs*\"\n            debugdir \"$(SolutionDir)\"\n        filter {}\n        \n        vpaths \n        {\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n        }\n\n        -- Grab source code ONLY from the Game folder\n        files {\n            \"Game/src/**.c\",\n            \"Game/src/**.cpp\",\n            \"Game/include/**.h\", \n            \"Game/include/**.hpp\"\n        }\n        \n        filter {\"system:windows\", \"action:vs*\"}\n            files {\"Game/resources/**\"}\n        filter{}\n        \n        -- The Game needs to see the Engine\'s headers!\n        includedirs { \n            \"Engine/include\",\n            \"Game/include\",\n            \"external/glm\", \n            raylib_dir .. \"/src\" \n        }\n\n        -- LINKING: The Game links to the Engine AND Raylib\n        links {\"BSPEngine\", \"raylib\"}\n\n        cdialect \"C17\"\n        cppdialect \"C++17\"\n        platform_defines()\n\n        filter \"action:vs*\"\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\n            characterset (\"Unicode\")\n            buildoptions { \"/Zc:__cplusplus\" }\n\n        -- OS SPECIFIC SYSTEM LINKS\n        filter \"system:windows\"\n            defines{\"_WIN32\"}\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\n            libdirs {\"bin/%{cfg.buildcfg}\"}\n\n        filter \"system:linux\"\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\n        filter {\"system:linux\", \"options:wayland=off\"}\n            links {\"X11\"}\n\n        filter {\"system:linux\", \"options:wayland=on\"}\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\n        filter \"system:macosx\"\n            buildoptions { \"-stdlib=libc++\" }\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\n        filter{}\n</code></pre>\n<p id=\"bkmrk-make-sure-that-you-r\">Make sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a <code>src</code> (<code>include</code> and `resources are recommended too).</p>\n<h4 id=\"bkmrk-build-environment\">Build Environment</h4>\n<p id=\"bkmrk-to-build-the-project\">To build the project you should use PreMake. To run PreMake for your environment, check out the build section<br>\nin <a href=\"https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files\" title=\"RayLib\'s Build Quickstart Page\">RayLib\'s Quickstart Page</a>.</p>\n','Now we\'ll go through the setup process.\nMost of the setup is based on RayLib\'s Quickstart Project\nRequirements\n\nBuild Tools (Such as Make, MinGW, VS Builder, etc...)\nPremake5 (Included in build directory)\n\nAdd Project\nBefore building the environment we should create a new project.\nClone the repository to your local machine.\nGo to premake5.lua file in the repository and add the following lines:\n    -- ========================================================\n    -- PROJECT 3: THE GAME (Executable)\n    -- ========================================================\n    project (workspaceName)\n        kind \"ConsoleApp\"\n        language \"C++\"\n        targetdir \"bin/%{cfg.buildcfg}\"\n        objdir \"obj/%{cfg.buildcfg}/Game\"\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\n            kind \"WindowedApp\"\n            buildoptions { \"-Wl,--subsystem,windows\" }\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\n            kind \"WindowedApp\"\n            entrypoint \"mainCRTStartup\"\n\n        filter \"action:vs*\"\n            debugdir \"$(SolutionDir)\"\n        filter {}\n        \n        vpaths \n        {\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n        }\n\n        -- Grab source code ONLY from the Game folder\n        files {\n            \"Game/src/**.c\",\n            \"Game/src/**.cpp\",\n            \"Game/include/**.h\", \n            \"Game/include/**.hpp\"\n        }\n        \n        filter {\"system:windows\", \"action:vs*\"}\n            files {\"Game/resources/**\"}\n        filter{}\n        \n        -- The Game needs to see the Engine\'s headers!\n        includedirs { \n            \"Engine/include\",\n            \"Game/include\",\n            \"external/glm\", \n            raylib_dir .. \"/src\" \n        }\n\n        -- LINKING: The Game links to the Engine AND Raylib\n        links {\"BSPEngine\", \"raylib\"}\n\n        cdialect \"C17\"\n        cppdialect \"C++17\"\n        platform_defines()\n\n        filter \"action:vs*\"\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\n            characterset (\"Unicode\")\n            buildoptions { \"/Zc:__cplusplus\" }\n\n        -- OS SPECIFIC SYSTEM LINKS\n        filter \"system:windows\"\n            defines{\"_WIN32\"}\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\n            libdirs {\"bin/%{cfg.buildcfg}\"}\n\n        filter \"system:linux\"\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\n        filter {\"system:linux\", \"options:wayland=off\"}\n            links {\"X11\"}\n\n        filter {\"system:linux\", \"options:wayland=on\"}\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\n        filter \"system:macosx\"\n            buildoptions { \"-stdlib=libc++\" }\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\n        filter{}\n\nMake sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a src (include and `resources are recommended too).\nBuild Environment\nTo build the project you should use PreMake. To run PreMake for your environment, check out the build section\nin RayLib\'s Quickstart Page.\n',1,'2026-05-04 15:47:12','2026-05-04 15:47:12','project-setup','getting-started','version','Now we\'ll go through the setup process.\r\n\r\nMost of the setup is based on [RayLib\'s Quickstart Project](https://github.com/raylib-extras/raylib-quickstart \"RayLib\'s Quickstart Project\")\r\n\r\n#### Requirements\r\n\r\n- Build Tools (Such as Make, MinGW, VS Builder, etc...)\r\n- Premake5 (Included in **build** directory)\r\n\r\n#### Add Project\r\n\r\nBefore building the environment we should create a new project.\r\n\r\nClone the repository to your local machine.\r\n\r\nGo to **premake5.lua** file in the repository and add the following lines:\r\n\r\n```lua\r\n    -- ========================================================\r\n    -- PROJECT 3: THE GAME (Executable)\r\n    -- ========================================================\r\n    project (workspaceName)\r\n        kind \"ConsoleApp\"\r\n        language \"C++\"\r\n        targetdir \"bin/%{cfg.buildcfg}\"\r\n        objdir \"obj/%{cfg.buildcfg}/Game\"\r\n\r\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\r\n            kind \"WindowedApp\"\r\n            buildoptions { \"-Wl,--subsystem,windows\" }\r\n\r\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\r\n            kind \"WindowedApp\"\r\n            entrypoint \"mainCRTStartup\"\r\n\r\n        filter \"action:vs*\"\r\n            debugdir \"$(SolutionDir)\"\r\n        filter {}\r\n        \r\n        vpaths \r\n        {\r\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\r\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\r\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\r\n        }\r\n\r\n        -- Grab source code ONLY from the Game folder\r\n        files {\r\n            \"Game/src/**.c\",\r\n            \"Game/src/**.cpp\",\r\n            \"Game/include/**.h\", \r\n            \"Game/include/**.hpp\"\r\n        }\r\n        \r\n        filter {\"system:windows\", \"action:vs*\"}\r\n            files {\"Game/resources/**\"}\r\n        filter{}\r\n        \r\n        -- The Game needs to see the Engine\'s headers!\r\n        includedirs { \r\n            \"Engine/include\",\r\n            \"Game/include\",\r\n            \"external/glm\", \r\n            raylib_dir .. \"/src\" \r\n        }\r\n\r\n        -- LINKING: The Game links to the Engine AND Raylib\r\n        links {\"BSPEngine\", \"raylib\"}\r\n\r\n        cdialect \"C17\"\r\n        cppdialect \"C++17\"\r\n        platform_defines()\r\n\r\n        filter \"action:vs*\"\r\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\r\n            characterset (\"Unicode\")\r\n            buildoptions { \"/Zc:__cplusplus\" }\r\n\r\n        -- OS SPECIFIC SYSTEM LINKS\r\n        filter \"system:windows\"\r\n            defines{\"_WIN32\"}\r\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\r\n            libdirs {\"bin/%{cfg.buildcfg}\"}\r\n\r\n        filter \"system:linux\"\r\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\r\n\r\n        filter {\"system:linux\", \"options:wayland=off\"}\r\n            links {\"X11\"}\r\n\r\n        filter {\"system:linux\", \"options:wayland=on\"}\r\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\r\n\r\n        filter \"system:macosx\"\r\n            buildoptions { \"-stdlib=libc++\" }\r\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\r\n        filter{}\r\n```\r\n\r\nMake sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a `src` (`include` and `resources are recommended too).\r\n\r\n#### Build Environment\r\n\r\nTo build the project you should use PreMake. To run PreMake for your environment, check out the build section  \r\nin [RayLib\'s Quickstart Page](https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files \"RayLib\'s Build Quickstart Page\").','',5),
(20,9,'Summary','<p id=\"bkmrk-in-this-chapter-we-l\">In this chapter we learned the main project directory structure and the main technologies used for building and developing the engine.</p>\n<p id=\"bkmrk-in-the-next-chapter-\">In the next chapter we\'ll learn how to setup and create are first project!</p>\n','In this chapter we learned the main project directory structure and the main technologies used for building and developing the engine.\nIn the next chapter we\'ll learn how to setup and create are first project!\n',1,'2026-05-04 15:48:51','2026-05-04 15:48:51','summary','getting-started','version','In this chapter we learned the main project directory structure and the main technologies used for building and developing the engine.\r\n\r\nIn the next chapter we\'ll learn how to setup and create are first project!','Initial publish',1),
(22,7,'Project Setup','<p id=\"bkmrk-now-we%27ll-go-through\">Now we\'ll go through the setup process.</p>\n<p id=\"bkmrk-most-of-the-setup-is\">Most of the setup is based on <a href=\"https://github.com/raylib-extras/raylib-quickstart\" title=\"RayLib\'s Quickstart Project\">RayLib\'s Quickstart Project</a></p>\n<h4 id=\"bkmrk-requirements\">Requirements</h4>\n<ul id=\"bkmrk-build-tools-%28such-as\">\n<li>Build Tools (Such as Make, MinGW, VS Builder, etc...)</li>\n<li>Premake5 (Included in <strong>build</strong> directory)</li>\n</ul>\n<h4 id=\"bkmrk-add-project\">Add Project</h4>\n<p id=\"bkmrk-before-building-the-\">Before building the environment we should create a new project.</p>\n<p id=\"bkmrk-clone-the-repository\">Clone the repository to your local machine.</p>\n<p id=\"bkmrk-go-to-premake5.lua-f\">Go to <strong>premake5.lua</strong> file in the repository and add the following lines:</p>\n<pre id=\"bkmrk----%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D\"><code class=\"language-lua\">    -- ========================================================\n    -- PROJECT 3: THE GAME (Executable)\n    -- ========================================================\n    project (workspaceName)\n        kind \"ConsoleApp\"\n        language \"C++\"\n        targetdir \"bin/%{cfg.buildcfg}\"\n        objdir \"obj/%{cfg.buildcfg}/Game\"\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\n            kind \"WindowedApp\"\n            buildoptions { \"-Wl,--subsystem,windows\" }\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\n            kind \"WindowedApp\"\n            entrypoint \"mainCRTStartup\"\n\n        filter \"action:vs*\"\n            debugdir \"$(SolutionDir)\"\n        filter {}\n        \n        vpaths \n        {\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n        }\n\n        -- Grab source code ONLY from the Game folder\n        files {\n            \"Game/src/**.c\",\n            \"Game/src/**.cpp\",\n            \"Game/include/**.h\", \n            \"Game/include/**.hpp\"\n        }\n        \n        filter {\"system:windows\", \"action:vs*\"}\n            files {\"Game/resources/**\"}\n        filter{}\n        \n        -- The Game needs to see the Engine\'s headers!\n        includedirs { \n            \"Engine/include\",\n            \"Game/include\",\n            \"external/glm\", \n            raylib_dir .. \"/src\" \n        }\n\n        -- LINKING: The Game links to the Engine AND Raylib\n        links {\"BSPEngine\", \"raylib\"}\n\n        cdialect \"C17\"\n        cppdialect \"C++17\"\n        platform_defines()\n\n        filter \"action:vs*\"\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\n            characterset (\"Unicode\")\n            buildoptions { \"/Zc:__cplusplus\" }\n\n        -- OS SPECIFIC SYSTEM LINKS\n        filter \"system:windows\"\n            defines{\"_WIN32\"}\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\n            libdirs {\"bin/%{cfg.buildcfg}\"}\n\n        filter \"system:linux\"\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\n        filter {\"system:linux\", \"options:wayland=off\"}\n            links {\"X11\"}\n\n        filter {\"system:linux\", \"options:wayland=on\"}\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\n        filter \"system:macosx\"\n            buildoptions { \"-stdlib=libc++\" }\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\n        filter{}\n\n</code></pre>\n<p id=\"bkmrk-make-sure-that-you-r\">Make sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a <code>src</code> (<code>include</code> and `resources are recommended too).</p>\n<h4 id=\"bkmrk-build-environment\">Build Environment</h4>\n<p id=\"bkmrk-to-build-the-project\">To build the project\'s environment you should use PreMake. To run PreMake for your environment, check out the build section<br>\nin <a href=\"https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files\" title=\"RayLib\'s Build Quickstart Page\">RayLib\'s Quickstart Page</a>.</p>\n<p id=\"bkmrk-example-of-environme\">Example of environment build:</p>\n<pre id=\"bkmrk-premake5-gmake\"><code class=\"language-bash\">premake5 gmake\n</code></pre>\n<p id=\"bkmrk-note%3A-if-you-use-pre\">Note: If you use <code>premake5</code> from the <code>build</code> directory you should run the executable from the main directory by moving to this directory and refencing the premake executable as such:</p>\n<pre id=\"bkmrk-.%2Fbuild%2Fpremake5-gma\"><code class=\"language-bash\">./build/premake5 gmake\n</code></pre>\n<p id=\"bkmrk-this-will-build-the-\">This will build the project using the <code>premake5.lua</code> configuration file from the main directory.</p>\n','Now we\'ll go through the setup process.\nMost of the setup is based on RayLib\'s Quickstart Project\nRequirements\n\nBuild Tools (Such as Make, MinGW, VS Builder, etc...)\nPremake5 (Included in build directory)\n\nAdd Project\nBefore building the environment we should create a new project.\nClone the repository to your local machine.\nGo to premake5.lua file in the repository and add the following lines:\n    -- ========================================================\n    -- PROJECT 3: THE GAME (Executable)\n    -- ========================================================\n    project (workspaceName)\n        kind \"ConsoleApp\"\n        language \"C++\"\n        targetdir \"bin/%{cfg.buildcfg}\"\n        objdir \"obj/%{cfg.buildcfg}/Game\"\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\n            kind \"WindowedApp\"\n            buildoptions { \"-Wl,--subsystem,windows\" }\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\n            kind \"WindowedApp\"\n            entrypoint \"mainCRTStartup\"\n\n        filter \"action:vs*\"\n            debugdir \"$(SolutionDir)\"\n        filter {}\n        \n        vpaths \n        {\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n        }\n\n        -- Grab source code ONLY from the Game folder\n        files {\n            \"Game/src/**.c\",\n            \"Game/src/**.cpp\",\n            \"Game/include/**.h\", \n            \"Game/include/**.hpp\"\n        }\n        \n        filter {\"system:windows\", \"action:vs*\"}\n            files {\"Game/resources/**\"}\n        filter{}\n        \n        -- The Game needs to see the Engine\'s headers!\n        includedirs { \n            \"Engine/include\",\n            \"Game/include\",\n            \"external/glm\", \n            raylib_dir .. \"/src\" \n        }\n\n        -- LINKING: The Game links to the Engine AND Raylib\n        links {\"BSPEngine\", \"raylib\"}\n\n        cdialect \"C17\"\n        cppdialect \"C++17\"\n        platform_defines()\n\n        filter \"action:vs*\"\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\n            characterset (\"Unicode\")\n            buildoptions { \"/Zc:__cplusplus\" }\n\n        -- OS SPECIFIC SYSTEM LINKS\n        filter \"system:windows\"\n            defines{\"_WIN32\"}\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\n            libdirs {\"bin/%{cfg.buildcfg}\"}\n\n        filter \"system:linux\"\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\n        filter {\"system:linux\", \"options:wayland=off\"}\n            links {\"X11\"}\n\n        filter {\"system:linux\", \"options:wayland=on\"}\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\n        filter \"system:macosx\"\n            buildoptions { \"-stdlib=libc++\" }\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\n        filter{}\n\n\nMake sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a src (include and `resources are recommended too).\nBuild Environment\nTo build the project\'s environment you should use PreMake. To run PreMake for your environment, check out the build section\nin RayLib\'s Quickstart Page.\nExample of environment build:\npremake5 gmake\n\nNote: If you use premake5 from the build directory you should run the executable from the main directory by moving to this directory and refencing the premake executable as such:\n./build/premake5 gmake\n\nThis will build the project using the premake5.lua configuration file from the main directory.\n',1,'2026-05-05 05:49:51','2026-05-05 05:49:51','project-setup','getting-started','version','Now we\'ll go through the setup process.\r\n\r\nMost of the setup is based on [RayLib\'s Quickstart Project](https://github.com/raylib-extras/raylib-quickstart \"RayLib\'s Quickstart Project\")\r\n\r\n#### Requirements\r\n\r\n- Build Tools (Such as Make, MinGW, VS Builder, etc...)\r\n- Premake5 (Included in **build** directory)\r\n\r\n#### Add Project\r\n\r\nBefore building the environment we should create a new project.\r\n\r\nClone the repository to your local machine.\r\n\r\nGo to **premake5.lua** file in the repository and add the following lines:\r\n\r\n```lua\r\n    -- ========================================================\r\n    -- PROJECT 3: THE GAME (Executable)\r\n    -- ========================================================\r\n    project (workspaceName)\r\n        kind \"ConsoleApp\"\r\n        language \"C++\"\r\n        targetdir \"bin/%{cfg.buildcfg}\"\r\n        objdir \"obj/%{cfg.buildcfg}/Game\"\r\n\r\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\r\n            kind \"WindowedApp\"\r\n            buildoptions { \"-Wl,--subsystem,windows\" }\r\n\r\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\r\n            kind \"WindowedApp\"\r\n            entrypoint \"mainCRTStartup\"\r\n\r\n        filter \"action:vs*\"\r\n            debugdir \"$(SolutionDir)\"\r\n        filter {}\r\n        \r\n        vpaths \r\n        {\r\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\r\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\r\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\r\n        }\r\n\r\n        -- Grab source code ONLY from the Game folder\r\n        files {\r\n            \"Game/src/**.c\",\r\n            \"Game/src/**.cpp\",\r\n            \"Game/include/**.h\", \r\n            \"Game/include/**.hpp\"\r\n        }\r\n        \r\n        filter {\"system:windows\", \"action:vs*\"}\r\n            files {\"Game/resources/**\"}\r\n        filter{}\r\n        \r\n        -- The Game needs to see the Engine\'s headers!\r\n        includedirs { \r\n            \"Engine/include\",\r\n            \"Game/include\",\r\n            \"external/glm\", \r\n            raylib_dir .. \"/src\" \r\n        }\r\n\r\n        -- LINKING: The Game links to the Engine AND Raylib\r\n        links {\"BSPEngine\", \"raylib\"}\r\n\r\n        cdialect \"C17\"\r\n        cppdialect \"C++17\"\r\n        platform_defines()\r\n\r\n        filter \"action:vs*\"\r\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\r\n            characterset (\"Unicode\")\r\n            buildoptions { \"/Zc:__cplusplus\" }\r\n\r\n        -- OS SPECIFIC SYSTEM LINKS\r\n        filter \"system:windows\"\r\n            defines{\"_WIN32\"}\r\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\r\n            libdirs {\"bin/%{cfg.buildcfg}\"}\r\n\r\n        filter \"system:linux\"\r\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\r\n\r\n        filter {\"system:linux\", \"options:wayland=off\"}\r\n            links {\"X11\"}\r\n\r\n        filter {\"system:linux\", \"options:wayland=on\"}\r\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\r\n\r\n        filter \"system:macosx\"\r\n            buildoptions { \"-stdlib=libc++\" }\r\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\r\n        filter{}\r\n\r\n```\r\n\r\nMake sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a `src` (`include` and `resources are recommended too).\r\n\r\n#### Build Environment\r\n\r\nTo build the project\'s environment you should use PreMake. To run PreMake for your environment, check out the build section  \r\nin [RayLib\'s Quickstart Page](https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files \"RayLib\'s Build Quickstart Page\").\r\n\r\nExample of environment build:\r\n```bash\r\npremake5 gmake\r\n```\r\nNote: If you use `premake5` from the `build` directory you should run the executable from the main directory by moving to this directory and refencing the premake executable as such:\r\n```bash\r\n./build/premake5 gmake\r\n```\r\n\r\nThis will build the project using the `premake5.lua` configuration file from the main directory.','',6),
(24,7,'Project Setup','<p id=\"bkmrk-now-we%27ll-go-through\">Now we\'ll go through the setup process.</p>\n<p id=\"bkmrk-most-of-the-setup-is\">Most of the setup is based on <a href=\"https://github.com/raylib-extras/raylib-quickstart\" title=\"RayLib\'s Quickstart Project\">RayLib\'s Quickstart Project</a></p>\n<h4 id=\"bkmrk-requirements\">Requirements</h4>\n<ul id=\"bkmrk-build-tools-%28such-as\">\n<li>Build Tools (Such as Make, MinGW, VS Builder, etc...)</li>\n<li>Premake5 (Included in <strong>build</strong> directory)</li>\n</ul>\n<h4 id=\"bkmrk-add-project\">Add Project</h4>\n<p id=\"bkmrk-before-building-the-\">Before building the environment we should create a new project.</p>\n<p id=\"bkmrk-clone-the-repository\">Clone the repository to your local machine.</p>\n<p id=\"bkmrk-go-to-premake5.lua-f\">Go to <strong>premake5.lua</strong> file in the repository and add the following lines:</p>\n<pre id=\"bkmrk----%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D%3D\"><code class=\"language-lua\">    -- ========================================================\n    -- PROJECT 3: THE GAME (Executable)\n    -- ========================================================\n    project (workspaceName)\n        kind \"ConsoleApp\"\n        language \"C++\"\n        targetdir \"bin/%{cfg.buildcfg}\"\n        objdir \"obj/%{cfg.buildcfg}/Game\"\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\n            kind \"WindowedApp\"\n            buildoptions { \"-Wl,--subsystem,windows\" }\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\n            kind \"WindowedApp\"\n            entrypoint \"mainCRTStartup\"\n\n        filter \"action:vs*\"\n            debugdir \"$(SolutionDir)\"\n        filter {}\n        \n        vpaths \n        {\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n        }\n\n        -- Grab source code ONLY from the Game folder\n        files {\n            \"Game/src/**.c\",\n            \"Game/src/**.cpp\",\n            \"Game/include/**.h\", \n            \"Game/include/**.hpp\"\n        }\n        \n        filter {\"system:windows\", \"action:vs*\"}\n            files {\"Game/resources/**\"}\n        filter{}\n        \n        -- The Game needs to see the Engine\'s headers!\n        includedirs { \n            \"Engine/include\",\n            \"Game/include\",\n            \"external/glm\", \n            raylib_dir .. \"/src\" \n        }\n\n        -- LINKING: The Game links to the Engine AND Raylib\n        links {\"BSPEngine\", \"raylib\"}\n\n        cdialect \"C17\"\n        cppdialect \"C++17\"\n        platform_defines()\n\n        filter \"action:vs*\"\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\n            characterset (\"Unicode\")\n            buildoptions { \"/Zc:__cplusplus\" }\n\n        -- OS SPECIFIC SYSTEM LINKS\n        filter \"system:windows\"\n            defines{\"_WIN32\"}\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\n            libdirs {\"bin/%{cfg.buildcfg}\"}\n\n        filter \"system:linux\"\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\n        filter {\"system:linux\", \"options:wayland=off\"}\n            links {\"X11\"}\n\n        filter {\"system:linux\", \"options:wayland=on\"}\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\n        filter \"system:macosx\"\n            buildoptions { \"-stdlib=libc++\" }\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\n        filter{}\n\n</code></pre>\n<p id=\"bkmrk-make-sure-that-you-r\">Make sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a <code>src</code> (<code>include</code> and `resources are recommended too).</p>\n<h4 id=\"bkmrk-build-environment\">Build Environment</h4>\n<p id=\"bkmrk-to-build-the-project\">To build the project\'s environment you should use PreMake. To run PreMake for your environment, check out the build section<br>\nin <a href=\"https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files\" title=\"RayLib\'s Build Quickstart Page\">RayLib\'s Quickstart Page</a>.</p>\n<p id=\"bkmrk-example-of-environme\">Example of environment build:</p>\n<pre id=\"bkmrk-premake5-gmake\"><code class=\"language-bash\">premake5 gmake\n</code></pre>\n<p id=\"bkmrk-note%3A-if-you-use-pre\"><strong>Note:</strong> If you use <code>premake5</code> from the <code>build</code> directory you should run the executable from the main directory by moving to this directory and refencing the premake executable as such:</p>\n<pre id=\"bkmrk-.%2Fbuild%2Fpremake5-gma\"><code class=\"language-bash\">./build/premake5 gmake\n</code></pre>\n<p id=\"bkmrk-this-will-build-the-\">This will build the project using the <code>premake5.lua</code> configuration file from the main directory.</p>\n<p id=\"bkmrk-important-note%3A-make\"><strong><strong>Important Note:</strong></strong> Make sure you run environment build everytime you want to add code file to your project.</p>\n<h4 id=\"bkmrk-build-the-project\">Build the Project</h4>\n<p id=\"bkmrk-note%3A-in-this-articl\"><strong>Note</strong>: In this article we assume you have <code>make</code> on your machine. Meaning, it haven\'t been tested on Visual Studio environment and such.</p>\n<p id=\"bkmrk-to-build-the-project-1\">To build the project, just use the following command in the main directory:</p>\n<pre id=\"bkmrk-make\"><code class=\"language-bash\">make\n</code></pre>\n<p id=\"bkmrk-for-now-it-won%27t-do-\">For now it won\'t do much because we haven\'t created any code file, in the next page we\'ll learn how to create and run an example game.</p>\n','Now we\'ll go through the setup process.\nMost of the setup is based on RayLib\'s Quickstart Project\nRequirements\n\nBuild Tools (Such as Make, MinGW, VS Builder, etc...)\nPremake5 (Included in build directory)\n\nAdd Project\nBefore building the environment we should create a new project.\nClone the repository to your local machine.\nGo to premake5.lua file in the repository and add the following lines:\n    -- ========================================================\n    -- PROJECT 3: THE GAME (Executable)\n    -- ========================================================\n    project (workspaceName)\n        kind \"ConsoleApp\"\n        language \"C++\"\n        targetdir \"bin/%{cfg.buildcfg}\"\n        objdir \"obj/%{cfg.buildcfg}/Game\"\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\n            kind \"WindowedApp\"\n            buildoptions { \"-Wl,--subsystem,windows\" }\n\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\n            kind \"WindowedApp\"\n            entrypoint \"mainCRTStartup\"\n\n        filter \"action:vs*\"\n            debugdir \"$(SolutionDir)\"\n        filter {}\n        \n        vpaths \n        {\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\n        }\n\n        -- Grab source code ONLY from the Game folder\n        files {\n            \"Game/src/**.c\",\n            \"Game/src/**.cpp\",\n            \"Game/include/**.h\", \n            \"Game/include/**.hpp\"\n        }\n        \n        filter {\"system:windows\", \"action:vs*\"}\n            files {\"Game/resources/**\"}\n        filter{}\n        \n        -- The Game needs to see the Engine\'s headers!\n        includedirs { \n            \"Engine/include\",\n            \"Game/include\",\n            \"external/glm\", \n            raylib_dir .. \"/src\" \n        }\n\n        -- LINKING: The Game links to the Engine AND Raylib\n        links {\"BSPEngine\", \"raylib\"}\n\n        cdialect \"C17\"\n        cppdialect \"C++17\"\n        platform_defines()\n\n        filter \"action:vs*\"\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\n            characterset (\"Unicode\")\n            buildoptions { \"/Zc:__cplusplus\" }\n\n        -- OS SPECIFIC SYSTEM LINKS\n        filter \"system:windows\"\n            defines{\"_WIN32\"}\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\n            libdirs {\"bin/%{cfg.buildcfg}\"}\n\n        filter \"system:linux\"\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\n\n        filter {\"system:linux\", \"options:wayland=off\"}\n            links {\"X11\"}\n\n        filter {\"system:linux\", \"options:wayland=on\"}\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\n\n        filter \"system:macosx\"\n            buildoptions { \"-stdlib=libc++\" }\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\n        filter{}\n\n\nMake sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a src (include and `resources are recommended too).\nBuild Environment\nTo build the project\'s environment you should use PreMake. To run PreMake for your environment, check out the build section\nin RayLib\'s Quickstart Page.\nExample of environment build:\npremake5 gmake\n\nNote: If you use premake5 from the build directory you should run the executable from the main directory by moving to this directory and refencing the premake executable as such:\n./build/premake5 gmake\n\nThis will build the project using the premake5.lua configuration file from the main directory.\nImportant Note: Make sure you run environment build everytime you want to add code file to your project.\nBuild the Project\nNote: In this article we assume you have make on your machine. Meaning, it haven\'t been tested on Visual Studio environment and such.\nTo build the project, just use the following command in the main directory:\nmake\n\nFor now it won\'t do much because we haven\'t created any code file, in the next page we\'ll learn how to create and run an example game.\n',1,'2026-05-05 05:57:14','2026-05-05 05:57:14','project-setup','getting-started','version','Now we\'ll go through the setup process.\r\n\r\nMost of the setup is based on [RayLib\'s Quickstart Project](https://github.com/raylib-extras/raylib-quickstart \"RayLib\'s Quickstart Project\")\r\n\r\n#### Requirements\r\n\r\n- Build Tools (Such as Make, MinGW, VS Builder, etc...)\r\n- Premake5 (Included in **build** directory)\r\n\r\n#### Add Project\r\n\r\nBefore building the environment we should create a new project.\r\n\r\nClone the repository to your local machine.\r\n\r\nGo to **premake5.lua** file in the repository and add the following lines:\r\n\r\n```lua\r\n    -- ========================================================\r\n    -- PROJECT 3: THE GAME (Executable)\r\n    -- ========================================================\r\n    project (workspaceName)\r\n        kind \"ConsoleApp\"\r\n        language \"C++\"\r\n        targetdir \"bin/%{cfg.buildcfg}\"\r\n        objdir \"obj/%{cfg.buildcfg}/Game\"\r\n\r\n        filter {\"system:windows\", \"configurations:Release\", \"action:gmake*\"}\r\n            kind \"WindowedApp\"\r\n            buildoptions { \"-Wl,--subsystem,windows\" }\r\n\r\n        filter {\"system:windows\", \"configurations:Release\", \"action:vs*\"}\r\n            kind \"WindowedApp\"\r\n            entrypoint \"mainCRTStartup\"\r\n\r\n        filter \"action:vs*\"\r\n            debugdir \"$(SolutionDir)\"\r\n        filter {}\r\n        \r\n        vpaths \r\n        {\r\n            [\"Header Files/*\"] = { \"Game/include/**.h\", \"Game/include/**.hpp\" },\r\n            [\"Source Files/*\"] = { \"Game/src/**.c\", \"Game/src/**.cpp\" },\r\n            [\"Game Resource Files/*\"] = { \"Game/resources/**\" }\r\n        }\r\n\r\n        -- Grab source code ONLY from the Game folder\r\n        files {\r\n            \"Game/src/**.c\",\r\n            \"Game/src/**.cpp\",\r\n            \"Game/include/**.h\", \r\n            \"Game/include/**.hpp\"\r\n        }\r\n        \r\n        filter {\"system:windows\", \"action:vs*\"}\r\n            files {\"Game/resources/**\"}\r\n        filter{}\r\n        \r\n        -- The Game needs to see the Engine\'s headers!\r\n        includedirs { \r\n            \"Engine/include\",\r\n            \"Game/include\",\r\n            \"external/glm\", \r\n            raylib_dir .. \"/src\" \r\n        }\r\n\r\n        -- LINKING: The Game links to the Engine AND Raylib\r\n        links {\"BSPEngine\", \"raylib\"}\r\n\r\n        cdialect \"C17\"\r\n        cppdialect \"C++17\"\r\n        platform_defines()\r\n\r\n        filter \"action:vs*\"\r\n            defines{\"_WINSOCK_DEPRECATED_NO_WARNINGS\", \"_CRT_SECURE_NO_WARNINGS\"}\r\n            characterset (\"Unicode\")\r\n            buildoptions { \"/Zc:__cplusplus\" }\r\n\r\n        -- OS SPECIFIC SYSTEM LINKS\r\n        filter \"system:windows\"\r\n            defines{\"_WIN32\"}\r\n            links {\"winmm\", \"gdi32\", \"opengl32\"}\r\n            libdirs {\"bin/%{cfg.buildcfg}\"}\r\n\r\n        filter \"system:linux\"\r\n            links {\"stdc++\", \"pthread\", \"m\", \"dl\", \"rt\"}\r\n\r\n        filter {\"system:linux\", \"options:wayland=off\"}\r\n            links {\"X11\"}\r\n\r\n        filter {\"system:linux\", \"options:wayland=on\"}\r\n            links {\"wayland-client\", \"wayland-cursor\", \"wayland-egl\", \"xkbcommon\"}\r\n\r\n        filter \"system:macosx\"\r\n            buildoptions { \"-stdlib=libc++\" }\r\n            links {\"c++\", \"OpenGL.framework\", \"Cocoa.framework\", \"IOKit.framework\", \"CoreFoundation.framework\", \"CoreAudio.framework\", \"CoreVideo.framework\", \"AudioToolbox.framework\"}\r\n        filter{}\r\n\r\n```\r\n\r\nMake sure that you replace \"Game\" with your project directory name. Also, make sure that the project directory has at list a `src` (`include` and `resources are recommended too).\r\n\r\n#### Build Environment\r\n\r\nTo build the project\'s environment you should use PreMake. To run PreMake for your environment, check out the build section  \r\nin [RayLib\'s Quickstart Page](https://github.com/raylib-extras/raylib-quickstart#:~:text=MacOS-,VSCode%20Users%20(all%20platforms),you%20are%20good%20to%20go,-Output%20files \"RayLib\'s Build Quickstart Page\").\r\n\r\nExample of environment build:\r\n```bash\r\npremake5 gmake\r\n```\r\n**Note:** If you use `premake5` from the `build` directory you should run the executable from the main directory by moving to this directory and refencing the premake executable as such:\r\n```bash\r\n./build/premake5 gmake\r\n```\r\n\r\nThis will build the project using the `premake5.lua` configuration file from the main directory.\r\n\r\n****Important Note:**** Make sure you run environment build everytime you want to add code file to your project.\r\n\r\n#### Build the Project\r\n**Note**: In this article we assume you have `make` on your machine. Meaning, it haven\'t been tested on Visual Studio environment and such.\r\n\r\nTo build the project, just use the following command in the main directory:\r\n```bash\r\nmake\r\n```\r\n\r\nFor now it won\'t do much because we haven\'t created any code file, in the next page we\'ll learn how to create and run an example game.','',7),
(25,10,'Creating a Simple Game','','',1,'2026-05-05 05:58:21','2026-05-05 05:58:21','creating-a-simple-game','getting-started','version','','Initial publish',1),
(27,10,'Creating a Simple Game','<h4 id=\"bkmrk-introduction\">Introduction</h4>\n<p id=\"bkmrk-we%27re-going-to-creat\">We\'re going to create a simple game only in our <code>main.cpp</code> file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.</p>\n<p id=\"bkmrk-all-of-the-used-reso\">All of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.</p>\n<p id=\"bkmrk-we%27ll-walk-through-e\">We\'ll walk through each step of creating the engine.</p>\n<h4 id=\"bkmrk-include-headers\">Include Headers</h4>\n<pre id=\"bkmrk-%2F%2F-standard-printing\"><code class=\"language-c++\">// Standard printing (for debugging)\n#include &lt;iostream&gt;\n\n// Engine Cores\n#include &lt;bsp/handler.h&gt;\n#include &lt;render/handler.h&gt;\n#include &lt;input/handler.h&gt;\n\n// Game Camera\n#include &lt;bsp/camera.h&gt;\n\n// Example level for testing\n#include &lt;test/level.h&gt;\n\n// raylib related code\n#include &lt;raylib.h&gt;\n#include &lt;resource_dir.h&gt;\n\n</code></pre>\n','Introduction\nWe\'re going to create a simple game only in our main.cpp file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\nWe\'ll walk through each step of creating the engine.\nInclude Headers\n// Standard printing (for debugging)\n#include <iostream>\n\n// Engine Cores\n#include <bsp/handler.h>\n#include <render/handler.h>\n#include <input/handler.h>\n\n// Game Camera\n#include <bsp/camera.h>\n\n// Example level for testing\n#include <test/level.h>\n\n// raylib related code\n#include <raylib.h>\n#include <resource_dir.h>\n\n\n',1,'2026-05-05 06:21:35','2026-05-05 06:21:35','creating-a-simple-game','getting-started','version','#### Introduction\r\nWe\'re going to create a simple game only in our `main.cpp` file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\r\n\r\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\r\n\r\nWe\'ll walk through each step of creating the engine.\r\n\r\n#### Include Headers\r\n```c++\r\n// Standard printing (for debugging)\r\n#include <iostream>\r\n\r\n// Engine Cores\r\n#include <bsp/handler.h>\r\n#include <render/handler.h>\r\n#include <input/handler.h>\r\n\r\n// Game Camera\r\n#include <bsp/camera.h>\r\n\r\n// Example level for testing\r\n#include <test/level.h>\r\n\r\n// raylib related code\r\n#include <raylib.h>\r\n#include <resource_dir.h>\r\n\r\n```','',2),
(29,10,'Creating a Simple Game','<h4 id=\"bkmrk-introduction\">Introduction</h4>\n<p id=\"bkmrk-we%27re-going-to-creat\">We\'re going to create a simple game only in our <code>main.cpp</code> file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.</p>\n<p id=\"bkmrk-all-of-the-used-reso\">All of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.</p>\n<p id=\"bkmrk-we%27ll-walk-through-e\">We\'ll walk through each step of creating the engine.</p>\n<h4 id=\"bkmrk-include-headers\">Include Headers</h4>\n<pre id=\"bkmrk-%2F%2F-1.-standard-io-st\"><code class=\"language-c++\">// 1. Standard IO Stream\n#include &lt;iostream&gt;\n\n// 2. Engine Cores\n#include &lt;bsp/handler.h&gt;\n#include &lt;render/handler.h&gt;\n#include &lt;input/handler.h&gt;\n\n// 3. Game Camera\n#include &lt;bsp/camera.h&gt;\n\n// 4. Example Level\n#include &lt;test/level.h&gt;\n\n// 5. RayLib-Related Code\n#include &lt;raylib.h&gt;\n#include &lt;resource_dir.h&gt;\n\n</code></pre>\n<ol id=\"bkmrk-standard-io-stream--\">\n<li>Standard IO Stream - Debugging</li>\n<li>Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters</li>\n<li>Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)</li>\n<li>Example Level - Provided by the engine for testing</li>\n<li>RayLib-Related Code - For basic configurations (such as window and <code>resources</code> folder finding)</li>\n</ol>\n','Introduction\nWe\'re going to create a simple game only in our main.cpp file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\nWe\'ll walk through each step of creating the engine.\nInclude Headers\n// 1. Standard IO Stream\n#include <iostream>\n\n// 2. Engine Cores\n#include <bsp/handler.h>\n#include <render/handler.h>\n#include <input/handler.h>\n\n// 3. Game Camera\n#include <bsp/camera.h>\n\n// 4. Example Level\n#include <test/level.h>\n\n// 5. RayLib-Related Code\n#include <raylib.h>\n#include <resource_dir.h>\n\n\n\nStandard IO Stream - Debugging\nEngine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\nGame Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\nExample Level - Provided by the engine for testing\nRayLib-Related Code - For basic configurations (such as window and resources folder finding)\n\n',1,'2026-05-05 06:30:26','2026-05-05 06:30:26','creating-a-simple-game','getting-started','version','#### Introduction\r\nWe\'re going to create a simple game only in our `main.cpp` file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\r\n\r\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\r\n\r\nWe\'ll walk through each step of creating the engine.\r\n\r\n#### Include Headers\r\n```c++\r\n// 1. Standard IO Stream\r\n#include <iostream>\r\n\r\n// 2. Engine Cores\r\n#include <bsp/handler.h>\r\n#include <render/handler.h>\r\n#include <input/handler.h>\r\n\r\n// 3. Game Camera\r\n#include <bsp/camera.h>\r\n\r\n// 4. Example Level\r\n#include <test/level.h>\r\n\r\n// 5. RayLib-Related Code\r\n#include <raylib.h>\r\n#include <resource_dir.h>\r\n\r\n```\r\n1. Standard IO Stream - Debugging\r\n2. Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\r\n3. Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\r\n4. Example Level - Provided by the engine for testing\r\n5. RayLib-Related Code - For basic configurations (such as window and `resources` folder finding)','',3),
(31,10,'Creating a Simple Game','<h4 id=\"bkmrk-introduction\">Introduction</h4>\n<p id=\"bkmrk-we%27re-going-to-creat\">We\'re going to create a simple game only in our <code>main.cpp</code> file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.</p>\n<p id=\"bkmrk-all-of-the-used-reso\">All of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.</p>\n<p id=\"bkmrk-we%27ll-walk-through-e\">We\'ll walk through each step of creating the engine.</p>\n<h4 id=\"bkmrk-include-headers\">Include Headers</h4>\n<pre id=\"bkmrk-%2F%2F-1.-standard-io-st\"><code class=\"language-c++\">// 1. Standard IO Stream\n#include &lt;iostream&gt;\n\n// 2. Engine Cores\n#include &lt;bsp/handler.h&gt;\n#include &lt;render/handler.h&gt;\n#include &lt;input/handler.h&gt;\n\n// 3. Game Camera\n#include &lt;bsp/camera.h&gt;\n\n// 4. Example Level\n#include &lt;test/level.h&gt;\n\n// 5. RayLib-Related Code\n#include &lt;raylib.h&gt;\n#include &lt;resource_dir.h&gt;\n\n</code></pre>\n<ol id=\"bkmrk-standard-io-stream--\">\n<li>Standard IO Stream - Debugging</li>\n<li>Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters</li>\n<li>Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)</li>\n<li>Example Level - Provided by the engine for testing</li>\n<li>RayLib-Related Code - For basic configurations (such as window and <code>resources</code> folder finding)</li>\n</ol>\n<h4 id=\"bkmrk-raylib-initializatio\">RayLib Initializations</h4>\n<h4 id=\"bkmrk-engine-initializatio\">Engine Initializations</h4>\n<h4 id=\"bkmrk-resources-loading\">Resources Loading</h4>\n<h4 id=\"bkmrk-delta-time-clamp-pre\">Delta-Time Clamp Prevention</h4>\n<h4 id=\"bkmrk-main-game-loop-%26-win\">Main Game Loop &amp; Window Management</h4>\n','Introduction\nWe\'re going to create a simple game only in our main.cpp file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\nWe\'ll walk through each step of creating the engine.\nInclude Headers\n// 1. Standard IO Stream\n#include <iostream>\n\n// 2. Engine Cores\n#include <bsp/handler.h>\n#include <render/handler.h>\n#include <input/handler.h>\n\n// 3. Game Camera\n#include <bsp/camera.h>\n\n// 4. Example Level\n#include <test/level.h>\n\n// 5. RayLib-Related Code\n#include <raylib.h>\n#include <resource_dir.h>\n\n\n\nStandard IO Stream - Debugging\nEngine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\nGame Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\nExample Level - Provided by the engine for testing\nRayLib-Related Code - For basic configurations (such as window and resources folder finding)\n\nRayLib Initializations\nEngine Initializations\nResources Loading\nDelta-Time Clamp Prevention\nMain Game Loop & Window Management\n',1,'2026-05-05 06:33:28','2026-05-05 06:33:28','creating-a-simple-game','getting-started','version','#### Introduction\r\nWe\'re going to create a simple game only in our `main.cpp` file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\r\n\r\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\r\n\r\nWe\'ll walk through each step of creating the engine.\r\n\r\n#### Include Headers\r\n```c++\r\n// 1. Standard IO Stream\r\n#include <iostream>\r\n\r\n// 2. Engine Cores\r\n#include <bsp/handler.h>\r\n#include <render/handler.h>\r\n#include <input/handler.h>\r\n\r\n// 3. Game Camera\r\n#include <bsp/camera.h>\r\n\r\n// 4. Example Level\r\n#include <test/level.h>\r\n\r\n// 5. RayLib-Related Code\r\n#include <raylib.h>\r\n#include <resource_dir.h>\r\n\r\n```\r\n1. Standard IO Stream - Debugging\r\n2. Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\r\n3. Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\r\n4. Example Level - Provided by the engine for testing\r\n5. RayLib-Related Code - For basic configurations (such as window and `resources` folder finding)\r\n\r\n#### RayLib Initializations\r\n\r\n#### Engine Initializations\r\n\r\n#### Resources Loading\r\n\r\n#### Delta-Time Clamp Prevention\r\n\r\n#### Main Game Loop & Window Management','',4),
(33,10,'Creating a Simple Game','<h4 id=\"bkmrk-introduction\">Introduction</h4>\n<p id=\"bkmrk-we%27re-going-to-creat\">We\'re going to create a simple game only in our <code>main.cpp</code> file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.</p>\n<p id=\"bkmrk-all-of-the-used-reso\">All of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.</p>\n<p id=\"bkmrk-we%27ll-walk-through-e\">We\'ll walk through each step of creating the engine.</p>\n<h4 id=\"bkmrk-include-headers\">Include Headers</h4>\n<pre id=\"bkmrk-%2F%2F-1.-standard-io-st\"><code class=\"language-c++\">// 1. Standard IO Stream\n#include &lt;iostream&gt;\n\n// 2. Engine Cores\n#include &lt;bsp/handler.h&gt;\n#include &lt;render/handler.h&gt;\n#include &lt;input/handler.h&gt;\n\n// 3. Game Camera\n#include &lt;bsp/camera.h&gt;\n\n// 4. Example Level\n#include &lt;test/level.h&gt;\n\n// 5. RayLib-Related Code\n#include &lt;raylib.h&gt;\n#include &lt;resource_dir.h&gt;\n\n</code></pre>\n<ol id=\"bkmrk-standard-io-stream--\">\n<li>Standard IO Stream - Debugging</li>\n<li>Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters</li>\n<li>Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)</li>\n<li>Example Level - Provided by the engine for testing</li>\n<li>RayLib-Related Code - For basic configurations (such as window and <code>resources</code> folder finding)</li>\n</ol>\n<p id=\"bkmrk-from-now-on-all-of-t\">From now on all of the code will be placed in the main function:</p>\n<pre id=\"bkmrk-int-main-%28%29-%7B-...-yo\"><code class=\"language-c++\">int main () {\n  ... Your code ...\n}\n</code></pre>\n<h4 id=\"bkmrk-raylib-initializatio\">RayLib Initializations</h4>\n<pre id=\"bkmrk-%2F%2F-optional%3A-tell-th\"><code class=\"language-c++\">  // Optional: Tell the window to use vsync and work on high DPI displays\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\n\n  // Must: Create the window and OpenGL context\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\n\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\n  SetTargetFPS(60);\n\n  // Must: Disable cursor for camera lookaround with 3D Camera\n  DisableCursor();\n</code></pre>\n<h4 id=\"bkmrk-engine-initializatio\">Engine Initializations</h4>\n<pre id=\"bkmrk-%23%23%23%23-resources-loadi\"><code class=\"language-c++\">\n#### Resources Loading\n\n#### Delta-Time Clamp Prevention\n\n#### Main Game Loop &amp; Window Management\n</code></pre>\n','Introduction\nWe\'re going to create a simple game only in our main.cpp file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\nWe\'ll walk through each step of creating the engine.\nInclude Headers\n// 1. Standard IO Stream\n#include <iostream>\n\n// 2. Engine Cores\n#include <bsp/handler.h>\n#include <render/handler.h>\n#include <input/handler.h>\n\n// 3. Game Camera\n#include <bsp/camera.h>\n\n// 4. Example Level\n#include <test/level.h>\n\n// 5. RayLib-Related Code\n#include <raylib.h>\n#include <resource_dir.h>\n\n\n\nStandard IO Stream - Debugging\nEngine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\nGame Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\nExample Level - Provided by the engine for testing\nRayLib-Related Code - For basic configurations (such as window and resources folder finding)\n\nFrom now on all of the code will be placed in the main function:\nint main () {\n  ... Your code ...\n}\n\nRayLib Initializations\n  // Optional: Tell the window to use vsync and work on high DPI displays\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\n\n  // Must: Create the window and OpenGL context\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\n\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\n  SetTargetFPS(60);\n\n  // Must: Disable cursor for camera lookaround with 3D Camera\n  DisableCursor();\n\nEngine Initializations\n\n#### Resources Loading\n\n#### Delta-Time Clamp Prevention\n\n#### Main Game Loop & Window Management\n\n',1,'2026-05-05 06:38:11','2026-05-05 06:38:11','creating-a-simple-game','getting-started','version','#### Introduction\r\nWe\'re going to create a simple game only in our `main.cpp` file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\r\n\r\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\r\n\r\nWe\'ll walk through each step of creating the engine.\r\n\r\n#### Include Headers\r\n```c++\r\n// 1. Standard IO Stream\r\n#include <iostream>\r\n\r\n// 2. Engine Cores\r\n#include <bsp/handler.h>\r\n#include <render/handler.h>\r\n#include <input/handler.h>\r\n\r\n// 3. Game Camera\r\n#include <bsp/camera.h>\r\n\r\n// 4. Example Level\r\n#include <test/level.h>\r\n\r\n// 5. RayLib-Related Code\r\n#include <raylib.h>\r\n#include <resource_dir.h>\r\n\r\n```\r\n1. Standard IO Stream - Debugging\r\n2. Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\r\n3. Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\r\n4. Example Level - Provided by the engine for testing\r\n5. RayLib-Related Code - For basic configurations (such as window and `resources` folder finding)\r\n\r\nFrom now on all of the code will be placed in the main function:\r\n```c++\r\nint main () {\r\n  ... Your code ...\r\n}\r\n```\r\n\r\n#### RayLib Initializations\r\n```c++\r\n  // Optional: Tell the window to use vsync and work on high DPI displays\r\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\r\n\r\n  // Must: Create the window and OpenGL context\r\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\r\n\r\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\r\n  SetTargetFPS(60);\r\n\r\n  // Must: Disable cursor for camera lookaround with 3D Camera\r\n  DisableCursor();\r\n```\r\n\r\n#### Engine Initializations\r\n```c++\r\n\r\n#### Resources Loading\r\n\r\n#### Delta-Time Clamp Prevention\r\n\r\n#### Main Game Loop & Window Management','',5),
(35,10,'Creating a Simple Game','<h4 id=\"bkmrk-introduction\">Introduction</h4>\n<p id=\"bkmrk-we%27re-going-to-creat\">We\'re going to create a simple game only in our <code>main.cpp</code> file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.</p>\n<p id=\"bkmrk-all-of-the-used-reso\">All of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.</p>\n<p id=\"bkmrk-we%27ll-walk-through-e\">We\'ll walk through each step of creating the engine.</p>\n<h4 id=\"bkmrk-include-headers\">Include Headers</h4>\n<pre id=\"bkmrk-%2F%2F-1.-standard-io-st\"><code class=\"language-c++\">// 1. Standard IO Stream\n#include &lt;iostream&gt;\n\n// 2. Engine Cores\n#include &lt;bsp/handler.h&gt;\n#include &lt;render/handler.h&gt;\n#include &lt;input/handler.h&gt;\n\n// 3. Game Camera\n#include &lt;bsp/camera.h&gt;\n\n// 4. Example Level\n#include &lt;test/level.h&gt;\n\n// 5. RayLib-Related Code\n#include &lt;raylib.h&gt;\n#include &lt;resource_dir.h&gt;\n\n</code></pre>\n<ol id=\"bkmrk-standard-io-stream--\">\n<li>Standard IO Stream - Debugging</li>\n<li>Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters</li>\n<li>Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)</li>\n<li>Example Level - Provided by the engine for testing</li>\n<li>RayLib-Related Code - For basic configurations (such as window and <code>resources</code> folder finding)</li>\n</ol>\n<p id=\"bkmrk-from-now-on-all-of-t\">From now on all of the code will be placed in the main function:</p>\n<pre id=\"bkmrk-int-main-%28%29-%7B-...-yo\"><code class=\"language-c++\">int main () {\n  ... Your code ...\n}\n</code></pre>\n<h4 id=\"bkmrk-raylib-initializatio\">RayLib Initializations</h4>\n<pre id=\"bkmrk-%2F%2F-optional%3A-tell-th\"><code class=\"language-c++\">  // Optional: Tell the window to use vsync and work on high DPI displays\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\n\n  // Must: Create the window and OpenGL context\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\n\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\n  SetTargetFPS(60);\n\n  // Must: Disable cursor for camera lookaround with 3D Camera\n  DisableCursor();\n</code></pre>\n<h4 id=\"bkmrk-engine-initializatio\">Engine Initializations</h4>\n<pre id=\"bkmrk-%2F%2F-set-game-delta-ti\"><code class=\"language-c++\">  // Set Game Delta-Time for fixed camera, world, and objects movement\n  glm::float32_t deltaTime = 0.0f;\n\n  // Create the 3D Camera and locate it in (6, 7) coordinates\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\n\n  // Create Engine Handlers (BSP, rendering, and user input)\n  bsp::Handler bsp_handler;\n  render::Handler render_handler;\n  input::Handler input_handler;\n\n</code></pre>\n<h4 id=\"bkmrk-resources-loading\">Resources Loading</h4>\n<pre id=\"bkmrk-%2F%2F-set-%60game%2Fresourc\"><code class=\"language-c++\">  // Set `Game/resources` as main resources directory for easy load\n  SearchAndSetResourceDir(\"Game/resources\");\n\n  // Load textures using Texture Manager\n  render_handler.load_texture(1, \"Wall1.png\");\n  render_handler.load_texture(2, \"Monster1-north.png\");\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\n\n  // Load Level sectors and segments from example level\n  bsp_handler.load_level(bsp::test_level_sectors);\n\n  // Load calculated sectors and segments by the BSP Handler\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\n\n  // Load sprites for example level\n  render_handler.load_sprites(bsp::test_level_sprites);\n\n</code></pre>\n<h4 id=\"bkmrk-delta-time-clamp-pre\">Delta-Time Clamp Prevention</h4>\n<h4 id=\"bkmrk-main-game-loop-%26-win\">Main Game Loop &amp; Window Management</h4>\n','Introduction\nWe\'re going to create a simple game only in our main.cpp file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\nWe\'ll walk through each step of creating the engine.\nInclude Headers\n// 1. Standard IO Stream\n#include <iostream>\n\n// 2. Engine Cores\n#include <bsp/handler.h>\n#include <render/handler.h>\n#include <input/handler.h>\n\n// 3. Game Camera\n#include <bsp/camera.h>\n\n// 4. Example Level\n#include <test/level.h>\n\n// 5. RayLib-Related Code\n#include <raylib.h>\n#include <resource_dir.h>\n\n\n\nStandard IO Stream - Debugging\nEngine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\nGame Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\nExample Level - Provided by the engine for testing\nRayLib-Related Code - For basic configurations (such as window and resources folder finding)\n\nFrom now on all of the code will be placed in the main function:\nint main () {\n  ... Your code ...\n}\n\nRayLib Initializations\n  // Optional: Tell the window to use vsync and work on high DPI displays\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\n\n  // Must: Create the window and OpenGL context\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\n\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\n  SetTargetFPS(60);\n\n  // Must: Disable cursor for camera lookaround with 3D Camera\n  DisableCursor();\n\nEngine Initializations\n  // Set Game Delta-Time for fixed camera, world, and objects movement\n  glm::float32_t deltaTime = 0.0f;\n\n  // Create the 3D Camera and locate it in (6, 7) coordinates\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\n\n  // Create Engine Handlers (BSP, rendering, and user input)\n  bsp::Handler bsp_handler;\n  render::Handler render_handler;\n  input::Handler input_handler;\n\n\nResources Loading\n  // Set `Game/resources` as main resources directory for easy load\n  SearchAndSetResourceDir(\"Game/resources\");\n\n  // Load textures using Texture Manager\n  render_handler.load_texture(1, \"Wall1.png\");\n  render_handler.load_texture(2, \"Monster1-north.png\");\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\n\n  // Load Level sectors and segments from example level\n  bsp_handler.load_level(bsp::test_level_sectors);\n\n  // Load calculated sectors and segments by the BSP Handler\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\n\n  // Load sprites for example level\n  render_handler.load_sprites(bsp::test_level_sprites);\n\n\nDelta-Time Clamp Prevention\nMain Game Loop & Window Management\n',1,'2026-05-05 06:43:39','2026-05-05 06:43:39','creating-a-simple-game','getting-started','version','#### Introduction\r\nWe\'re going to create a simple game only in our `main.cpp` file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\r\n\r\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\r\n\r\nWe\'ll walk through each step of creating the engine.\r\n\r\n#### Include Headers\r\n```c++\r\n// 1. Standard IO Stream\r\n#include <iostream>\r\n\r\n// 2. Engine Cores\r\n#include <bsp/handler.h>\r\n#include <render/handler.h>\r\n#include <input/handler.h>\r\n\r\n// 3. Game Camera\r\n#include <bsp/camera.h>\r\n\r\n// 4. Example Level\r\n#include <test/level.h>\r\n\r\n// 5. RayLib-Related Code\r\n#include <raylib.h>\r\n#include <resource_dir.h>\r\n\r\n```\r\n1. Standard IO Stream - Debugging\r\n2. Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\r\n3. Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\r\n4. Example Level - Provided by the engine for testing\r\n5. RayLib-Related Code - For basic configurations (such as window and `resources` folder finding)\r\n\r\nFrom now on all of the code will be placed in the main function:\r\n```c++\r\nint main () {\r\n  ... Your code ...\r\n}\r\n```\r\n\r\n#### RayLib Initializations\r\n```c++\r\n  // Optional: Tell the window to use vsync and work on high DPI displays\r\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\r\n\r\n  // Must: Create the window and OpenGL context\r\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\r\n\r\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\r\n  SetTargetFPS(60);\r\n\r\n  // Must: Disable cursor for camera lookaround with 3D Camera\r\n  DisableCursor();\r\n```\r\n\r\n#### Engine Initializations\r\n```c++\r\n  // Set Game Delta-Time for fixed camera, world, and objects movement\r\n  glm::float32_t deltaTime = 0.0f;\r\n\r\n  // Create the 3D Camera and locate it in (6, 7) coordinates\r\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\r\n\r\n  // Create Engine Handlers (BSP, rendering, and user input)\r\n  bsp::Handler bsp_handler;\r\n  render::Handler render_handler;\r\n  input::Handler input_handler;\r\n\r\n```\r\n\r\n#### Resources Loading\r\n```c++\r\n  // Set `Game/resources` as main resources directory for easy load\r\n  SearchAndSetResourceDir(\"Game/resources\");\r\n\r\n  // Load textures using Texture Manager\r\n  render_handler.load_texture(1, \"Wall1.png\");\r\n  render_handler.load_texture(2, \"Monster1-north.png\");\r\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\r\n\r\n  // Load Level sectors and segments from example level\r\n  bsp_handler.load_level(bsp::test_level_sectors);\r\n\r\n  // Load calculated sectors and segments by the BSP Handler\r\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\r\n\r\n  // Load sprites for example level\r\n  render_handler.load_sprites(bsp::test_level_sprites);\r\n\r\n```\r\n\r\n#### Delta-Time Clamp Prevention\r\n\r\n#### Main Game Loop & Window Management','',6),
(37,10,'Creating a Simple Game','<h4 id=\"bkmrk-introduction\">Introduction</h4>\n<p id=\"bkmrk-we%27re-going-to-creat\">We\'re going to create a simple game only in our <code>main.cpp</code> file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.</p>\n<p id=\"bkmrk-all-of-the-used-reso\">All of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.</p>\n<p id=\"bkmrk-we%27ll-walk-through-e\">We\'ll walk through each step of creating the engine.</p>\n<h4 id=\"bkmrk-include-headers\">Include Headers</h4>\n<pre id=\"bkmrk-%2F%2F-1.-standard-io-st\"><code class=\"language-c++\">// 1. Standard IO Stream\n#include &lt;iostream&gt;\n\n// 2. Engine Cores\n#include &lt;bsp/handler.h&gt;\n#include &lt;render/handler.h&gt;\n#include &lt;input/handler.h&gt;\n\n// 3. Game Camera\n#include &lt;bsp/camera.h&gt;\n\n// 4. Example Level\n#include &lt;test/level.h&gt;\n\n// 5. RayLib-Related Code\n#include &lt;raylib.h&gt;\n#include &lt;resource_dir.h&gt;\n\n</code></pre>\n<ol id=\"bkmrk-standard-io-stream--\">\n<li>Standard IO Stream - Debugging</li>\n<li>Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters</li>\n<li>Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)</li>\n<li>Example Level - Provided by the engine for testing</li>\n<li>RayLib-Related Code - For basic configurations (such as window and <code>resources</code> folder finding)</li>\n</ol>\n<p id=\"bkmrk-from-now-on-all-of-t\">From now on all of the code will be placed in the main function:</p>\n<pre id=\"bkmrk-int-main-%28%29-%7B-...-yo\"><code class=\"language-c++\">int main () {\n  ... Your code ...\n}\n</code></pre>\n<h4 id=\"bkmrk-raylib-initializatio\">RayLib Initializations</h4>\n<pre id=\"bkmrk-%2F%2F-optional%3A-tell-th\"><code class=\"language-c++\">  // Optional: Tell the window to use vsync and work on high DPI displays\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\n\n  // Must: Create the window and OpenGL context\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\n\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\n  SetTargetFPS(60);\n\n  // Must: Disable cursor for camera lookaround with 3D Camera\n  DisableCursor();\n</code></pre>\n<h4 id=\"bkmrk-engine-initializatio\">Engine Initializations</h4>\n<pre id=\"bkmrk-%2F%2F-set-game-delta-ti\"><code class=\"language-c++\">  // Set Game Delta-Time for fixed camera, world, and objects movement\n  glm::float32_t deltaTime = 0.0f;\n\n  // Create the 3D Camera and locate it in (6, 7) coordinates\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\n\n  // Create Engine Handlers (BSP, rendering, and user input)\n  bsp::Handler bsp_handler;\n  render::Handler render_handler;\n  input::Handler input_handler;\n\n</code></pre>\n<h4 id=\"bkmrk-resources-loading\">Resources Loading</h4>\n<pre id=\"bkmrk-%2F%2F-set-%60game%2Fresourc\"><code class=\"language-c++\">  // Set `Game/resources` as main resources directory for easy load\n  SearchAndSetResourceDir(\"Game/resources\");\n\n  // Load textures using Texture Manager\n  render_handler.load_texture(1, \"Wall1.png\");\n  render_handler.load_texture(2, \"Monster1-north.png\");\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\n\n  // Load Level sectors and segments from example level\n  bsp_handler.load_level(bsp::test_level_sectors);\n\n  // Load calculated sectors and segments by the BSP Handler\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\n\n  // Load sprites for example level\n  render_handler.load_sprites(bsp::test_level_sprites);\n\n</code></pre>\n<h4 id=\"bkmrk-delta-time-clamp-pre\">Delta-Time Clamp Prevention (recommended)</h4>\n<p id=\"bkmrk-first-we%27ll-add-the-\">First we\'ll add the function declaration at the top of the file below the includes:</p>\n<pre id=\"bkmrk-void-prevent_dt_clam\"><code class=\"language-c++\">void prevent_dt_clamp(glm::float32_t&amp; deltaTime);\n</code></pre>\n<p id=\"bkmrk-now-below-the-main-f\">Now below the main function we\'ll add this:</p>\n<pre id=\"bkmrk-void-prevent_dt_clam-1\"><code class=\"language-c++\">void prevent_dt_clamp(glm::float32_t&amp; deltaTime) {\n  if (deltaTime &gt; 0.05f) {\n    deltaTime = 0.0166f; \n  }\n}\n\n</code></pre>\n<p id=\"bkmrk-we%27ll-use-it-soon.\">We\'ll use it soon.</p>\n<h4 id=\"bkmrk-main-game-loop-%26-win\">Main Game Loop &amp; Window Management</h4>\n<pre id=\"bkmrk-%2F%2F-game-loop-%28run-un\"><code class=\"language-c++\">  // Game Loop (run until the window is closed)\n  while (!WindowShouldClose())\n  {\n    // Update and calculate Delta-Time:\n    deltaTime = GetFrameTime();\n    prevent_dt_clamp(deltaTime);\n    camera.pre_update(deltaTime);\n    input_handler.update(camera, render_handler.get_map_renderer());\n    \n    // Ask the BSP tree what is nearby\n    std::vector&lt;bsp::Sector&gt; nearby_sectors = bsp_handler.get_nearby_sectors(\n        camera.get_pos_2d(), \n        camera.get_player_radius()\n    );\n\n    // Update Camera, BSP Tree, and BSP Traverser \n    camera.update(deltaTime, nearby_sectors);\n    bsp_handler.update(camera.get_pos_2d());\n\n    // Render Everything\n    render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());\n  }\n</code></pre>\n<p id=\"bkmrk-at-the-end-of-the-ma\">At the end of the main function add this:</p>\n<pre id=\"bkmrk-%2F%2F-destroy-the-windo\"><code class=\"language-c++\">  // Destroy the window and cleanup the OpenGL context\n  CloseWindow();\n  return 0;\n</code></pre>\n','Introduction\nWe\'re going to create a simple game only in our main.cpp file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\nWe\'ll walk through each step of creating the engine.\nInclude Headers\n// 1. Standard IO Stream\n#include <iostream>\n\n// 2. Engine Cores\n#include <bsp/handler.h>\n#include <render/handler.h>\n#include <input/handler.h>\n\n// 3. Game Camera\n#include <bsp/camera.h>\n\n// 4. Example Level\n#include <test/level.h>\n\n// 5. RayLib-Related Code\n#include <raylib.h>\n#include <resource_dir.h>\n\n\n\nStandard IO Stream - Debugging\nEngine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\nGame Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\nExample Level - Provided by the engine for testing\nRayLib-Related Code - For basic configurations (such as window and resources folder finding)\n\nFrom now on all of the code will be placed in the main function:\nint main () {\n  ... Your code ...\n}\n\nRayLib Initializations\n  // Optional: Tell the window to use vsync and work on high DPI displays\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\n\n  // Must: Create the window and OpenGL context\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\n\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\n  SetTargetFPS(60);\n\n  // Must: Disable cursor for camera lookaround with 3D Camera\n  DisableCursor();\n\nEngine Initializations\n  // Set Game Delta-Time for fixed camera, world, and objects movement\n  glm::float32_t deltaTime = 0.0f;\n\n  // Create the 3D Camera and locate it in (6, 7) coordinates\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\n\n  // Create Engine Handlers (BSP, rendering, and user input)\n  bsp::Handler bsp_handler;\n  render::Handler render_handler;\n  input::Handler input_handler;\n\n\nResources Loading\n  // Set `Game/resources` as main resources directory for easy load\n  SearchAndSetResourceDir(\"Game/resources\");\n\n  // Load textures using Texture Manager\n  render_handler.load_texture(1, \"Wall1.png\");\n  render_handler.load_texture(2, \"Monster1-north.png\");\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\n\n  // Load Level sectors and segments from example level\n  bsp_handler.load_level(bsp::test_level_sectors);\n\n  // Load calculated sectors and segments by the BSP Handler\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\n\n  // Load sprites for example level\n  render_handler.load_sprites(bsp::test_level_sprites);\n\n\nDelta-Time Clamp Prevention (recommended)\nFirst we\'ll add the function declaration at the top of the file below the includes:\nvoid prevent_dt_clamp(glm::float32_t& deltaTime);\n\nNow below the main function we\'ll add this:\nvoid prevent_dt_clamp(glm::float32_t& deltaTime) {\n  if (deltaTime > 0.05f) {\n    deltaTime = 0.0166f; \n  }\n}\n\n\nWe\'ll use it soon.\nMain Game Loop & Window Management\n  // Game Loop (run until the window is closed)\n  while (!WindowShouldClose())\n  {\n    // Update and calculate Delta-Time:\n    deltaTime = GetFrameTime();\n    prevent_dt_clamp(deltaTime);\n    camera.pre_update(deltaTime);\n    input_handler.update(camera, render_handler.get_map_renderer());\n    \n    // Ask the BSP tree what is nearby\n    std::vector<bsp::Sector> nearby_sectors = bsp_handler.get_nearby_sectors(\n        camera.get_pos_2d(), \n        camera.get_player_radius()\n    );\n\n    // Update Camera, BSP Tree, and BSP Traverser \n    camera.update(deltaTime, nearby_sectors);\n    bsp_handler.update(camera.get_pos_2d());\n\n    // Render Everything\n    render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());\n  }\n\nAt the end of the main function add this:\n  // Destroy the window and cleanup the OpenGL context\n  CloseWindow();\n  return 0;\n\n',1,'2026-05-07 13:32:10','2026-05-07 13:32:10','creating-a-simple-game','getting-started','version','#### Introduction\r\nWe\'re going to create a simple game only in our `main.cpp` file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\r\n\r\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\r\n\r\nWe\'ll walk through each step of creating the engine.\r\n\r\n#### Include Headers\r\n```c++\r\n// 1. Standard IO Stream\r\n#include <iostream>\r\n\r\n// 2. Engine Cores\r\n#include <bsp/handler.h>\r\n#include <render/handler.h>\r\n#include <input/handler.h>\r\n\r\n// 3. Game Camera\r\n#include <bsp/camera.h>\r\n\r\n// 4. Example Level\r\n#include <test/level.h>\r\n\r\n// 5. RayLib-Related Code\r\n#include <raylib.h>\r\n#include <resource_dir.h>\r\n\r\n```\r\n1. Standard IO Stream - Debugging\r\n2. Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\r\n3. Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\r\n4. Example Level - Provided by the engine for testing\r\n5. RayLib-Related Code - For basic configurations (such as window and `resources` folder finding)\r\n\r\nFrom now on all of the code will be placed in the main function:\r\n```c++\r\nint main () {\r\n  ... Your code ...\r\n}\r\n```\r\n\r\n#### RayLib Initializations\r\n```c++\r\n  // Optional: Tell the window to use vsync and work on high DPI displays\r\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\r\n\r\n  // Must: Create the window and OpenGL context\r\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\r\n\r\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\r\n  SetTargetFPS(60);\r\n\r\n  // Must: Disable cursor for camera lookaround with 3D Camera\r\n  DisableCursor();\r\n```\r\n\r\n#### Engine Initializations\r\n```c++\r\n  // Set Game Delta-Time for fixed camera, world, and objects movement\r\n  glm::float32_t deltaTime = 0.0f;\r\n\r\n  // Create the 3D Camera and locate it in (6, 7) coordinates\r\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\r\n\r\n  // Create Engine Handlers (BSP, rendering, and user input)\r\n  bsp::Handler bsp_handler;\r\n  render::Handler render_handler;\r\n  input::Handler input_handler;\r\n\r\n```\r\n\r\n#### Resources Loading\r\n```c++\r\n  // Set `Game/resources` as main resources directory for easy load\r\n  SearchAndSetResourceDir(\"Game/resources\");\r\n\r\n  // Load textures using Texture Manager\r\n  render_handler.load_texture(1, \"Wall1.png\");\r\n  render_handler.load_texture(2, \"Monster1-north.png\");\r\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\r\n\r\n  // Load Level sectors and segments from example level\r\n  bsp_handler.load_level(bsp::test_level_sectors);\r\n\r\n  // Load calculated sectors and segments by the BSP Handler\r\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\r\n\r\n  // Load sprites for example level\r\n  render_handler.load_sprites(bsp::test_level_sprites);\r\n\r\n```\r\n\r\n#### Delta-Time Clamp Prevention (recommended)\r\nFirst we\'ll add the function declaration at the top of the file below the includes:\r\n```c++\r\nvoid prevent_dt_clamp(glm::float32_t& deltaTime);\r\n```\r\n\r\nNow below the main function we\'ll add this:\r\n```c++\r\nvoid prevent_dt_clamp(glm::float32_t& deltaTime) {\r\n  if (deltaTime > 0.05f) {\r\n    deltaTime = 0.0166f; \r\n  }\r\n}\r\n\r\n```\r\n\r\nWe\'ll use it soon.\r\n\r\n#### Main Game Loop & Window Management\r\n```c++\r\n  // Game Loop (run until the window is closed)\r\n  while (!WindowShouldClose())\r\n  {\r\n    // Update and calculate Delta-Time:\r\n    deltaTime = GetFrameTime();\r\n    prevent_dt_clamp(deltaTime);\r\n    camera.pre_update(deltaTime);\r\n    input_handler.update(camera, render_handler.get_map_renderer());\r\n    \r\n    // Ask the BSP tree what is nearby\r\n    std::vector<bsp::Sector> nearby_sectors = bsp_handler.get_nearby_sectors(\r\n        camera.get_pos_2d(), \r\n        camera.get_player_radius()\r\n    );\r\n\r\n    // Update Camera, BSP Tree, and BSP Traverser \r\n    camera.update(deltaTime, nearby_sectors);\r\n    bsp_handler.update(camera.get_pos_2d());\r\n\r\n    // Render Everything\r\n    render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());\r\n  }\r\n```\r\n\r\nAt the end of the main function add this:\r\n```c++\r\n  // Destroy the window and cleanup the OpenGL context\r\n  CloseWindow();\r\n  return 0;\r\n```','',7),
(39,10,'Creating a Simple Game','<h4 id=\"bkmrk-introduction\">Introduction</h4>\n<p id=\"bkmrk-we%27re-going-to-creat\">We\'re going to create a simple game only in our <code>main.cpp</code> file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.</p>\n<p id=\"bkmrk-all-of-the-used-reso\">All of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.</p>\n<p id=\"bkmrk-we%27ll-walk-through-e\">We\'ll walk through each step of creating the engine.</p>\n<h4 id=\"bkmrk-include-headers\">Include Headers</h4>\n<pre id=\"bkmrk-%2F%2F-1.-standard-io-st\"><code class=\"language-c++\">// 1. Standard IO Stream\n#include &lt;iostream&gt;\n\n// 2. Engine Cores\n#include &lt;bsp/handler.h&gt;\n#include &lt;render/handler.h&gt;\n#include &lt;input/handler.h&gt;\n\n// 3. Game Camera\n#include &lt;bsp/camera.h&gt;\n\n// 4. Example Level\n#include &lt;test/level.h&gt;\n\n// 5. RayLib-Related Code\n#include &lt;raylib.h&gt;\n#include &lt;resource_dir.h&gt;\n\n</code></pre>\n<ol id=\"bkmrk-standard-io-stream--\">\n<li>Standard IO Stream - Debugging</li>\n<li>Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters</li>\n<li>Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)</li>\n<li>Example Level - Provided by the engine for testing</li>\n<li>RayLib-Related Code - For basic configurations (such as window and <code>resources</code> folder finding)</li>\n</ol>\n<p id=\"bkmrk-from-now-on-all-of-t\">From now on all of the code will be placed in the main function:</p>\n<pre id=\"bkmrk-int-main-%28%29-%7B-...-yo\"><code class=\"language-c++\">int main () {\n  ... Your code ...\n}\n</code></pre>\n<h4 id=\"bkmrk-raylib-initializatio\">RayLib Initializations</h4>\n<pre id=\"bkmrk-%2F%2F-optional%3A-tell-th\"><code class=\"language-c++\">  // Optional: Tell the window to use vsync and work on high DPI displays\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\n\n  // Must: Create the window and OpenGL context\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\n\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\n  SetTargetFPS(60);\n\n  // Must: Disable cursor for camera lookaround with 3D Camera\n  DisableCursor();\n</code></pre>\n<h4 id=\"bkmrk-engine-initializatio\">Engine Initializations</h4>\n<pre id=\"bkmrk-%2F%2F-set-game-delta-ti\"><code class=\"language-c++\">  // Set Game Delta-Time for fixed camera, world, and objects movement\n  glm::float32_t deltaTime = 0.0f;\n\n  // Create the 3D Camera and locate it in (6, 7) coordinates\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\n\n  // Create Engine Handlers (BSP, rendering, and user input)\n  bsp::Handler bsp_handler;\n  render::Handler render_handler;\n  input::Handler input_handler;\n\n</code></pre>\n<h4 id=\"bkmrk-resources-loading\">Resources Loading</h4>\n<pre id=\"bkmrk-%2F%2F-set-%60game%2Fresourc\"><code class=\"language-c++\">  // Set `Game/resources` as main resources directory for easy load\n  SearchAndSetResourceDir(\"Game/resources\");\n\n  // Load textures using Texture Manager\n  render_handler.load_texture(1, \"Wall1.png\");\n  render_handler.load_texture(2, \"Monster1-north.png\");\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\n\n  // Load Level sectors and segments from example level\n  bsp_handler.load_level(bsp::test_level_sectors);\n\n  // Load calculated sectors and segments by the BSP Handler\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\n\n  // Load sprites for example level\n  render_handler.load_sprites(bsp::test_level_sprites);\n\n</code></pre>\n<h4 id=\"bkmrk-delta-time-clamp-pre\">Delta-Time Clamp Prevention (recommended)</h4>\n<p id=\"bkmrk-first-we%27ll-add-the-\">First we\'ll add the function declaration at the top of the file below the includes:</p>\n<pre id=\"bkmrk-void-prevent_dt_clam\"><code class=\"language-c++\">void prevent_dt_clamp(glm::float32_t&amp; deltaTime);\n</code></pre>\n<p id=\"bkmrk-now-below-the-main-f\">Now below the main function we\'ll add this:</p>\n<pre id=\"bkmrk-void-prevent_dt_clam-1\"><code class=\"language-c++\">void prevent_dt_clamp(glm::float32_t&amp; deltaTime) {\n  if (deltaTime &gt; 0.05f) {\n    deltaTime = 0.0166f; \n  }\n}\n\n</code></pre>\n<p id=\"bkmrk-we%27ll-use-it-soon.\">We\'ll use it soon.</p>\n<h4 id=\"bkmrk-main-game-loop-%26-win\">Main Game Loop &amp; Window Management</h4>\n<pre id=\"bkmrk-%2F%2F-game-loop-%28run-un\"><code class=\"language-c++\">  // Game Loop (run until the window is closed)\n  while (!WindowShouldClose())\n  {\n    // Update and calculate Delta-Time:\n    deltaTime = GetFrameTime();\n    prevent_dt_clamp(deltaTime);\n    camera.pre_update(deltaTime);\n    input_handler.update(camera, render_handler.get_map_renderer());\n    \n    // Ask the BSP tree what is nearby\n    std::vector&lt;bsp::Sector&gt; nearby_sectors = bsp_handler.get_nearby_sectors(\n        camera.get_pos_2d(), \n        camera.get_player_radius()\n    );\n\n    // Update Camera, BSP Tree, and BSP Traverser \n    camera.update(deltaTime, nearby_sectors);\n    bsp_handler.update(camera.get_pos_2d());\n\n    // Render Everything\n    render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());\n  }\n</code></pre>\n<p id=\"bkmrk-at-the-end-of-the-ma\">At the end of the main function add this:</p>\n<pre id=\"bkmrk-%2F%2F-destroy-the-windo\"><code class=\"language-c++\">  // Destroy the window and cleanup the OpenGL context\n  CloseWindow();\n  return 0;\n</code></pre>\n<p id=\"bkmrk-you-should-see-this-\">You should see this resulting game if done right:</p>\n<pre id=\"bkmrk-%5B%21%5B%5D%28http%3A%2F%2Flocalhos\"><code class=\"language-c++\">[![](http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/image-1778160938534.png)](http://localhost:6875/uploads/images/gallery/2026-05/image-1778160938534.png)\n</code></pre>\n','Introduction\nWe\'re going to create a simple game only in our main.cpp file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\nWe\'ll walk through each step of creating the engine.\nInclude Headers\n// 1. Standard IO Stream\n#include <iostream>\n\n// 2. Engine Cores\n#include <bsp/handler.h>\n#include <render/handler.h>\n#include <input/handler.h>\n\n// 3. Game Camera\n#include <bsp/camera.h>\n\n// 4. Example Level\n#include <test/level.h>\n\n// 5. RayLib-Related Code\n#include <raylib.h>\n#include <resource_dir.h>\n\n\n\nStandard IO Stream - Debugging\nEngine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\nGame Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\nExample Level - Provided by the engine for testing\nRayLib-Related Code - For basic configurations (such as window and resources folder finding)\n\nFrom now on all of the code will be placed in the main function:\nint main () {\n  ... Your code ...\n}\n\nRayLib Initializations\n  // Optional: Tell the window to use vsync and work on high DPI displays\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\n\n  // Must: Create the window and OpenGL context\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\n\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\n  SetTargetFPS(60);\n\n  // Must: Disable cursor for camera lookaround with 3D Camera\n  DisableCursor();\n\nEngine Initializations\n  // Set Game Delta-Time for fixed camera, world, and objects movement\n  glm::float32_t deltaTime = 0.0f;\n\n  // Create the 3D Camera and locate it in (6, 7) coordinates\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\n\n  // Create Engine Handlers (BSP, rendering, and user input)\n  bsp::Handler bsp_handler;\n  render::Handler render_handler;\n  input::Handler input_handler;\n\n\nResources Loading\n  // Set `Game/resources` as main resources directory for easy load\n  SearchAndSetResourceDir(\"Game/resources\");\n\n  // Load textures using Texture Manager\n  render_handler.load_texture(1, \"Wall1.png\");\n  render_handler.load_texture(2, \"Monster1-north.png\");\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\n\n  // Load Level sectors and segments from example level\n  bsp_handler.load_level(bsp::test_level_sectors);\n\n  // Load calculated sectors and segments by the BSP Handler\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\n\n  // Load sprites for example level\n  render_handler.load_sprites(bsp::test_level_sprites);\n\n\nDelta-Time Clamp Prevention (recommended)\nFirst we\'ll add the function declaration at the top of the file below the includes:\nvoid prevent_dt_clamp(glm::float32_t& deltaTime);\n\nNow below the main function we\'ll add this:\nvoid prevent_dt_clamp(glm::float32_t& deltaTime) {\n  if (deltaTime > 0.05f) {\n    deltaTime = 0.0166f; \n  }\n}\n\n\nWe\'ll use it soon.\nMain Game Loop & Window Management\n  // Game Loop (run until the window is closed)\n  while (!WindowShouldClose())\n  {\n    // Update and calculate Delta-Time:\n    deltaTime = GetFrameTime();\n    prevent_dt_clamp(deltaTime);\n    camera.pre_update(deltaTime);\n    input_handler.update(camera, render_handler.get_map_renderer());\n    \n    // Ask the BSP tree what is nearby\n    std::vector<bsp::Sector> nearby_sectors = bsp_handler.get_nearby_sectors(\n        camera.get_pos_2d(), \n        camera.get_player_radius()\n    );\n\n    // Update Camera, BSP Tree, and BSP Traverser \n    camera.update(deltaTime, nearby_sectors);\n    bsp_handler.update(camera.get_pos_2d());\n\n    // Render Everything\n    render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());\n  }\n\nAt the end of the main function add this:\n  // Destroy the window and cleanup the OpenGL context\n  CloseWindow();\n  return 0;\n\nYou should see this resulting game if done right:\n[![](http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/image-1778160938534.png)](http://localhost:6875/uploads/images/gallery/2026-05/image-1778160938534.png)\n\n',1,'2026-05-07 13:35:51','2026-05-07 13:35:51','creating-a-simple-game','getting-started','version','#### Introduction\r\nWe\'re going to create a simple game only in our `main.cpp` file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\r\n\r\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\r\n\r\nWe\'ll walk through each step of creating the engine.\r\n\r\n#### Include Headers\r\n```c++\r\n// 1. Standard IO Stream\r\n#include <iostream>\r\n\r\n// 2. Engine Cores\r\n#include <bsp/handler.h>\r\n#include <render/handler.h>\r\n#include <input/handler.h>\r\n\r\n// 3. Game Camera\r\n#include <bsp/camera.h>\r\n\r\n// 4. Example Level\r\n#include <test/level.h>\r\n\r\n// 5. RayLib-Related Code\r\n#include <raylib.h>\r\n#include <resource_dir.h>\r\n\r\n```\r\n1. Standard IO Stream - Debugging\r\n2. Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\r\n3. Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\r\n4. Example Level - Provided by the engine for testing\r\n5. RayLib-Related Code - For basic configurations (such as window and `resources` folder finding)\r\n\r\nFrom now on all of the code will be placed in the main function:\r\n```c++\r\nint main () {\r\n  ... Your code ...\r\n}\r\n```\r\n\r\n#### RayLib Initializations\r\n```c++\r\n  // Optional: Tell the window to use vsync and work on high DPI displays\r\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\r\n\r\n  // Must: Create the window and OpenGL context\r\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\r\n\r\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\r\n  SetTargetFPS(60);\r\n\r\n  // Must: Disable cursor for camera lookaround with 3D Camera\r\n  DisableCursor();\r\n```\r\n\r\n#### Engine Initializations\r\n```c++\r\n  // Set Game Delta-Time for fixed camera, world, and objects movement\r\n  glm::float32_t deltaTime = 0.0f;\r\n\r\n  // Create the 3D Camera and locate it in (6, 7) coordinates\r\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\r\n\r\n  // Create Engine Handlers (BSP, rendering, and user input)\r\n  bsp::Handler bsp_handler;\r\n  render::Handler render_handler;\r\n  input::Handler input_handler;\r\n\r\n```\r\n\r\n#### Resources Loading\r\n```c++\r\n  // Set `Game/resources` as main resources directory for easy load\r\n  SearchAndSetResourceDir(\"Game/resources\");\r\n\r\n  // Load textures using Texture Manager\r\n  render_handler.load_texture(1, \"Wall1.png\");\r\n  render_handler.load_texture(2, \"Monster1-north.png\");\r\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\r\n\r\n  // Load Level sectors and segments from example level\r\n  bsp_handler.load_level(bsp::test_level_sectors);\r\n\r\n  // Load calculated sectors and segments by the BSP Handler\r\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\r\n\r\n  // Load sprites for example level\r\n  render_handler.load_sprites(bsp::test_level_sprites);\r\n\r\n```\r\n\r\n#### Delta-Time Clamp Prevention (recommended)\r\nFirst we\'ll add the function declaration at the top of the file below the includes:\r\n```c++\r\nvoid prevent_dt_clamp(glm::float32_t& deltaTime);\r\n```\r\n\r\nNow below the main function we\'ll add this:\r\n```c++\r\nvoid prevent_dt_clamp(glm::float32_t& deltaTime) {\r\n  if (deltaTime > 0.05f) {\r\n    deltaTime = 0.0166f; \r\n  }\r\n}\r\n\r\n```\r\n\r\nWe\'ll use it soon.\r\n\r\n#### Main Game Loop & Window Management\r\n```c++\r\n  // Game Loop (run until the window is closed)\r\n  while (!WindowShouldClose())\r\n  {\r\n    // Update and calculate Delta-Time:\r\n    deltaTime = GetFrameTime();\r\n    prevent_dt_clamp(deltaTime);\r\n    camera.pre_update(deltaTime);\r\n    input_handler.update(camera, render_handler.get_map_renderer());\r\n    \r\n    // Ask the BSP tree what is nearby\r\n    std::vector<bsp::Sector> nearby_sectors = bsp_handler.get_nearby_sectors(\r\n        camera.get_pos_2d(), \r\n        camera.get_player_radius()\r\n    );\r\n\r\n    // Update Camera, BSP Tree, and BSP Traverser \r\n    camera.update(deltaTime, nearby_sectors);\r\n    bsp_handler.update(camera.get_pos_2d());\r\n\r\n    // Render Everything\r\n    render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());\r\n  }\r\n```\r\n\r\nAt the end of the main function add this:\r\n```c++\r\n  // Destroy the window and cleanup the OpenGL context\r\n  CloseWindow();\r\n  return 0;\r\n```\r\n\r\nYou should see this resulting game if done right:\r\n```c++\r\n[![](http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/image-1778160938534.png)](http://localhost:6875/uploads/images/gallery/2026-05/image-1778160938534.png)\r\n```','',8),
(41,10,'Creating a Simple Game','<h4 id=\"bkmrk-introduction\">Introduction</h4>\n<p id=\"bkmrk-we%27re-going-to-creat\">We\'re going to create a simple game only in our <code>main.cpp</code> file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.</p>\n<p id=\"bkmrk-all-of-the-used-reso\">All of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.</p>\n<p id=\"bkmrk-we%27ll-walk-through-e\">We\'ll walk through each step of creating the engine.</p>\n<h4 id=\"bkmrk-include-headers\">Include Headers</h4>\n<pre id=\"bkmrk-%2F%2F-1.-standard-io-st\"><code class=\"language-c++\">// 1. Standard IO Stream\n#include &lt;iostream&gt;\n\n// 2. Engine Cores\n#include &lt;bsp/handler.h&gt;\n#include &lt;render/handler.h&gt;\n#include &lt;input/handler.h&gt;\n\n// 3. Game Camera\n#include &lt;bsp/camera.h&gt;\n\n// 4. Example Level\n#include &lt;test/level.h&gt;\n\n// 5. RayLib-Related Code\n#include &lt;raylib.h&gt;\n#include &lt;resource_dir.h&gt;\n\n</code></pre>\n<ol id=\"bkmrk-standard-io-stream--\">\n<li>Standard IO Stream - Debugging</li>\n<li>Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters</li>\n<li>Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)</li>\n<li>Example Level - Provided by the engine for testing</li>\n<li>RayLib-Related Code - For basic configurations (such as window and <code>resources</code> folder finding)</li>\n</ol>\n<p id=\"bkmrk-from-now-on-all-of-t\">From now on all of the code will be placed in the main function:</p>\n<pre id=\"bkmrk-int-main-%28%29-%7B-...-yo\"><code class=\"language-c++\">int main () {\n  ... Your code ...\n}\n</code></pre>\n<h4 id=\"bkmrk-raylib-initializatio\">RayLib Initializations</h4>\n<pre id=\"bkmrk-%2F%2F-optional%3A-tell-th\"><code class=\"language-c++\">  // Optional: Tell the window to use vsync and work on high DPI displays\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\n\n  // Must: Create the window and OpenGL context\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\n\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\n  SetTargetFPS(60);\n\n  // Must: Disable cursor for camera lookaround with 3D Camera\n  DisableCursor();\n</code></pre>\n<h4 id=\"bkmrk-engine-initializatio\">Engine Initializations</h4>\n<pre id=\"bkmrk-%2F%2F-set-game-delta-ti\"><code class=\"language-c++\">  // Set Game Delta-Time for fixed camera, world, and objects movement\n  glm::float32_t deltaTime = 0.0f;\n\n  // Create the 3D Camera and locate it in (6, 7) coordinates\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\n\n  // Create Engine Handlers (BSP, rendering, and user input)\n  bsp::Handler bsp_handler;\n  render::Handler render_handler;\n  input::Handler input_handler;\n\n</code></pre>\n<h4 id=\"bkmrk-resources-loading\">Resources Loading</h4>\n<pre id=\"bkmrk-%2F%2F-set-%60game%2Fresourc\"><code class=\"language-c++\">  // Set `Game/resources` as main resources directory for easy load\n  SearchAndSetResourceDir(\"Game/resources\");\n\n  // Load textures using Texture Manager\n  render_handler.load_texture(1, \"Wall1.png\");\n  render_handler.load_texture(2, \"Monster1-north.png\");\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\n\n  // Load Level sectors and segments from example level\n  bsp_handler.load_level(bsp::test_level_sectors);\n\n  // Load calculated sectors and segments by the BSP Handler\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\n\n  // Load sprites for example level\n  render_handler.load_sprites(bsp::test_level_sprites);\n\n</code></pre>\n<h4 id=\"bkmrk-delta-time-clamp-pre\">Delta-Time Clamp Prevention (recommended)</h4>\n<p id=\"bkmrk-first-we%27ll-add-the-\">First we\'ll add the function declaration at the top of the file below the includes:</p>\n<pre id=\"bkmrk-void-prevent_dt_clam\"><code class=\"language-c++\">void prevent_dt_clamp(glm::float32_t&amp; deltaTime);\n</code></pre>\n<p id=\"bkmrk-now-below-the-main-f\">Now below the main function we\'ll add this:</p>\n<pre id=\"bkmrk-void-prevent_dt_clam-1\"><code class=\"language-c++\">void prevent_dt_clamp(glm::float32_t&amp; deltaTime) {\n  if (deltaTime &gt; 0.05f) {\n    deltaTime = 0.0166f; \n  }\n}\n\n</code></pre>\n<p id=\"bkmrk-we%27ll-use-it-soon.\">We\'ll use it soon.</p>\n<h4 id=\"bkmrk-main-game-loop-%26-win\">Main Game Loop &amp; Window Management</h4>\n<pre id=\"bkmrk-%2F%2F-game-loop-%28run-un\"><code class=\"language-c++\">  // Game Loop (run until the window is closed)\n  while (!WindowShouldClose())\n  {\n    // Update and calculate Delta-Time:\n    deltaTime = GetFrameTime();\n    prevent_dt_clamp(deltaTime);\n    camera.pre_update(deltaTime);\n    input_handler.update(camera, render_handler.get_map_renderer());\n    \n    // Ask the BSP tree what is nearby\n    std::vector&lt;bsp::Sector&gt; nearby_sectors = bsp_handler.get_nearby_sectors(\n        camera.get_pos_2d(), \n        camera.get_player_radius()\n    );\n\n    // Update Camera, BSP Tree, and BSP Traverser \n    camera.update(deltaTime, nearby_sectors);\n    bsp_handler.update(camera.get_pos_2d());\n\n    // Render Everything\n    render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());\n  }\n</code></pre>\n<p id=\"bkmrk-at-the-end-of-the-ma\">At the end of the main function add this:</p>\n<pre id=\"bkmrk-%2F%2F-destroy-the-windo\"><code class=\"language-c++\">  // Destroy the window and cleanup the OpenGL context\n  CloseWindow();\n  return 0;\n</code></pre>\n<p id=\"bkmrk-you-should-see-this-\">You should see this resulting game if done right:</p>\n<p id=\"bkmrk-\"><a href=\"http://localhost:6875/uploads/images/gallery/2026-05/image-1778161088033.png\"><img src=\"http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/image-1778161088033.png\" alt=\"\"></a></p>\n','Introduction\nWe\'re going to create a simple game only in our main.cpp file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\nWe\'ll walk through each step of creating the engine.\nInclude Headers\n// 1. Standard IO Stream\n#include <iostream>\n\n// 2. Engine Cores\n#include <bsp/handler.h>\n#include <render/handler.h>\n#include <input/handler.h>\n\n// 3. Game Camera\n#include <bsp/camera.h>\n\n// 4. Example Level\n#include <test/level.h>\n\n// 5. RayLib-Related Code\n#include <raylib.h>\n#include <resource_dir.h>\n\n\n\nStandard IO Stream - Debugging\nEngine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\nGame Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\nExample Level - Provided by the engine for testing\nRayLib-Related Code - For basic configurations (such as window and resources folder finding)\n\nFrom now on all of the code will be placed in the main function:\nint main () {\n  ... Your code ...\n}\n\nRayLib Initializations\n  // Optional: Tell the window to use vsync and work on high DPI displays\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\n\n  // Must: Create the window and OpenGL context\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\n\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\n  SetTargetFPS(60);\n\n  // Must: Disable cursor for camera lookaround with 3D Camera\n  DisableCursor();\n\nEngine Initializations\n  // Set Game Delta-Time for fixed camera, world, and objects movement\n  glm::float32_t deltaTime = 0.0f;\n\n  // Create the 3D Camera and locate it in (6, 7) coordinates\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\n\n  // Create Engine Handlers (BSP, rendering, and user input)\n  bsp::Handler bsp_handler;\n  render::Handler render_handler;\n  input::Handler input_handler;\n\n\nResources Loading\n  // Set `Game/resources` as main resources directory for easy load\n  SearchAndSetResourceDir(\"Game/resources\");\n\n  // Load textures using Texture Manager\n  render_handler.load_texture(1, \"Wall1.png\");\n  render_handler.load_texture(2, \"Monster1-north.png\");\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\n\n  // Load Level sectors and segments from example level\n  bsp_handler.load_level(bsp::test_level_sectors);\n\n  // Load calculated sectors and segments by the BSP Handler\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\n\n  // Load sprites for example level\n  render_handler.load_sprites(bsp::test_level_sprites);\n\n\nDelta-Time Clamp Prevention (recommended)\nFirst we\'ll add the function declaration at the top of the file below the includes:\nvoid prevent_dt_clamp(glm::float32_t& deltaTime);\n\nNow below the main function we\'ll add this:\nvoid prevent_dt_clamp(glm::float32_t& deltaTime) {\n  if (deltaTime > 0.05f) {\n    deltaTime = 0.0166f; \n  }\n}\n\n\nWe\'ll use it soon.\nMain Game Loop & Window Management\n  // Game Loop (run until the window is closed)\n  while (!WindowShouldClose())\n  {\n    // Update and calculate Delta-Time:\n    deltaTime = GetFrameTime();\n    prevent_dt_clamp(deltaTime);\n    camera.pre_update(deltaTime);\n    input_handler.update(camera, render_handler.get_map_renderer());\n    \n    // Ask the BSP tree what is nearby\n    std::vector<bsp::Sector> nearby_sectors = bsp_handler.get_nearby_sectors(\n        camera.get_pos_2d(), \n        camera.get_player_radius()\n    );\n\n    // Update Camera, BSP Tree, and BSP Traverser \n    camera.update(deltaTime, nearby_sectors);\n    bsp_handler.update(camera.get_pos_2d());\n\n    // Render Everything\n    render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());\n  }\n\nAt the end of the main function add this:\n  // Destroy the window and cleanup the OpenGL context\n  CloseWindow();\n  return 0;\n\nYou should see this resulting game if done right:\n\n',1,'2026-05-07 13:38:21','2026-05-07 13:38:21','creating-a-simple-game','getting-started','version','#### Introduction\r\nWe\'re going to create a simple game only in our `main.cpp` file! Also, we\'ll dive into more details in the next chapters, for now it\'s a rather simple game.\r\n\r\nAll of the used resources (except for the wabbit sprite) that\'ll be used in this tutorial are made by the engine creator.\r\n\r\nWe\'ll walk through each step of creating the engine.\r\n\r\n#### Include Headers\r\n```c++\r\n// 1. Standard IO Stream\r\n#include <iostream>\r\n\r\n// 2. Engine Cores\r\n#include <bsp/handler.h>\r\n#include <render/handler.h>\r\n#include <input/handler.h>\r\n\r\n// 3. Game Camera\r\n#include <bsp/camera.h>\r\n\r\n// 4. Example Level\r\n#include <test/level.h>\r\n\r\n// 5. RayLib-Related Code\r\n#include <raylib.h>\r\n#include <resource_dir.h>\r\n\r\n```\r\n1. Standard IO Stream - Debugging\r\n2. Engine Cores - All core systems needed for running the engine (BSP calculations, rendering, and user input). Will be detailed in next chapters\r\n3. Game Camera - A basic 3D Player Camera. Can be moved in multiple ways (lookaround and all axis movement)\r\n4. Example Level - Provided by the engine for testing\r\n5. RayLib-Related Code - For basic configurations (such as window and `resources` folder finding)\r\n\r\nFrom now on all of the code will be placed in the main function:\r\n```c++\r\nint main () {\r\n  ... Your code ...\r\n}\r\n```\r\n\r\n#### RayLib Initializations\r\n```c++\r\n  // Optional: Tell the window to use vsync and work on high DPI displays\r\n  SetConfigFlags(FLAG_WINDOW_HIGHDPI);\r\n\r\n  // Must: Create the window and OpenGL context\r\n  InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, \"BSP Game Engine\");\r\n\r\n  // Optional: Set the target FPS to 60 so that our game loop runs at a consistent speed\r\n  SetTargetFPS(60);\r\n\r\n  // Must: Disable cursor for camera lookaround with 3D Camera\r\n  DisableCursor();\r\n```\r\n\r\n#### Engine Initializations\r\n```c++\r\n  // Set Game Delta-Time for fixed camera, world, and objects movement\r\n  glm::float32_t deltaTime = 0.0f;\r\n\r\n  // Create the 3D Camera and locate it in (6, 7) coordinates\r\n  bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);\r\n\r\n  // Create Engine Handlers (BSP, rendering, and user input)\r\n  bsp::Handler bsp_handler;\r\n  render::Handler render_handler;\r\n  input::Handler input_handler;\r\n\r\n```\r\n\r\n#### Resources Loading\r\n```c++\r\n  // Set `Game/resources` as main resources directory for easy load\r\n  SearchAndSetResourceDir(\"Game/resources\");\r\n\r\n  // Load textures using Texture Manager\r\n  render_handler.load_texture(1, \"Wall1.png\");\r\n  render_handler.load_texture(2, \"Monster1-north.png\");\r\n  render_handler.load_texture(3, \"wabbit_alpha.png\");\r\n\r\n  // Load Level sectors and segments from example level\r\n  bsp_handler.load_level(bsp::test_level_sectors);\r\n\r\n  // Load calculated sectors and segments by the BSP Handler\r\n  render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);\r\n\r\n  // Load sprites for example level\r\n  render_handler.load_sprites(bsp::test_level_sprites);\r\n\r\n```\r\n\r\n#### Delta-Time Clamp Prevention (recommended)\r\nFirst we\'ll add the function declaration at the top of the file below the includes:\r\n```c++\r\nvoid prevent_dt_clamp(glm::float32_t& deltaTime);\r\n```\r\n\r\nNow below the main function we\'ll add this:\r\n```c++\r\nvoid prevent_dt_clamp(glm::float32_t& deltaTime) {\r\n  if (deltaTime > 0.05f) {\r\n    deltaTime = 0.0166f; \r\n  }\r\n}\r\n\r\n```\r\n\r\nWe\'ll use it soon.\r\n\r\n#### Main Game Loop & Window Management\r\n```c++\r\n  // Game Loop (run until the window is closed)\r\n  while (!WindowShouldClose())\r\n  {\r\n    // Update and calculate Delta-Time:\r\n    deltaTime = GetFrameTime();\r\n    prevent_dt_clamp(deltaTime);\r\n    camera.pre_update(deltaTime);\r\n    input_handler.update(camera, render_handler.get_map_renderer());\r\n    \r\n    // Ask the BSP tree what is nearby\r\n    std::vector<bsp::Sector> nearby_sectors = bsp_handler.get_nearby_sectors(\r\n        camera.get_pos_2d(), \r\n        camera.get_player_radius()\r\n    );\r\n\r\n    // Update Camera, BSP Tree, and BSP Traverser \r\n    camera.update(deltaTime, nearby_sectors);\r\n    bsp_handler.update(camera.get_pos_2d());\r\n\r\n    // Render Everything\r\n    render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());\r\n  }\r\n```\r\n\r\nAt the end of the main function add this:\r\n```c++\r\n  // Destroy the window and cleanup the OpenGL context\r\n  CloseWindow();\r\n  return 0;\r\n```\r\n\r\nYou should see this resulting game if done right:\r\n\r\n[![](http://localhost:6875/uploads/images/gallery/2026-05/scaled-1680-/image-1778161088033.png)](http://localhost:6875/uploads/images/gallery/2026-05/image-1778161088033.png)','',9);
/*!40000 ALTER TABLE `page_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `role_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES
(19,1),
(20,1),
(21,1),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(36,1),
(37,1),
(38,1),
(39,1),
(40,1),
(41,1),
(42,1),
(43,1),
(44,1),
(45,1),
(46,1),
(47,1),
(48,1),
(49,1),
(50,1),
(51,1),
(52,1),
(53,1),
(54,1),
(55,1),
(56,1),
(57,1),
(58,1),
(59,1),
(60,1),
(61,1),
(62,1),
(63,1),
(64,1),
(65,1),
(66,1),
(67,1),
(68,1),
(69,1),
(70,1),
(71,1),
(72,1),
(73,1),
(74,1),
(75,1),
(76,1),
(77,1),
(78,1),
(79,1),
(24,2),
(25,2),
(26,2),
(27,2),
(28,2),
(29,2),
(30,2),
(31,2),
(32,2),
(33,2),
(34,2),
(35,2),
(36,2),
(37,2),
(38,2),
(39,2),
(40,2),
(41,2),
(42,2),
(43,2),
(44,2),
(45,2),
(46,2),
(47,2),
(48,2),
(49,2),
(50,2),
(51,2),
(52,2),
(53,2),
(66,2),
(67,2),
(68,2),
(69,2),
(70,2),
(71,2),
(72,2),
(73,2),
(76,2),
(48,3),
(49,3),
(50,3),
(51,3),
(52,3),
(53,3),
(66,3),
(67,3),
(76,3),
(48,4),
(49,4),
(50,4),
(51,4),
(52,4),
(53,4),
(66,4),
(67,4),
(76,4);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `references`
--

DROP TABLE IF EXISTS `references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `references` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` bigint(20) unsigned NOT NULL,
  `from_type` varchar(25) NOT NULL,
  `to_id` bigint(20) unsigned NOT NULL,
  `to_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `references_from_id_index` (`from_id`),
  KEY `references_from_type_index` (`from_type`),
  KEY `references_to_id_index` (`to_id`),
  KEY `references_to_type_index` (`to_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `references`
--

LOCK TABLES `references` WRITE;
/*!40000 ALTER TABLE `references` DISABLE KEYS */;
/*!40000 ALTER TABLE `references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES
(19,'settings-manage','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(20,'users-manage','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(21,'user-roles-manage','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(22,'restrictions-manage-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(23,'restrictions-manage-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(24,'book-create-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(25,'book-create-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(26,'book-update-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(27,'book-update-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(28,'book-delete-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(29,'book-delete-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(30,'page-create-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(31,'page-create-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(32,'page-update-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(33,'page-update-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(34,'page-delete-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(35,'page-delete-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(36,'chapter-create-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(37,'chapter-create-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(38,'chapter-update-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(39,'chapter-update-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(40,'chapter-delete-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(41,'chapter-delete-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(42,'image-create-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(43,'image-create-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(44,'image-update-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(45,'image-update-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(46,'image-delete-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(47,'image-delete-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(48,'book-view-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(49,'book-view-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(50,'page-view-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(51,'page-view-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(52,'chapter-view-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(53,'chapter-view-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(54,'attachment-create-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(55,'attachment-create-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(56,'attachment-update-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(57,'attachment-update-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(58,'attachment-delete-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(59,'attachment-delete-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(60,'comment-create-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(61,'comment-create-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(62,'comment-update-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(63,'comment-update-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(64,'comment-delete-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(65,'comment-delete-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(66,'bookshelf-view-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(67,'bookshelf-view-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(68,'bookshelf-create-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(69,'bookshelf-create-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(70,'bookshelf-update-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(71,'bookshelf-update-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(72,'bookshelf-delete-all','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(73,'bookshelf-delete-own','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(74,'templates-manage','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(75,'access-api','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(76,'content-export','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(77,'editor-change','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(78,'receive-notifications','2026-05-04 12:52:56','2026-05-04 12:52:56'),
(79,'content-import','2026-05-04 12:52:56','2026-05-04 12:52:56');
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES
(1,1),
(2,4);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `display_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `system_name` varchar(191) NOT NULL,
  `external_auth_id` varchar(180) NOT NULL DEFAULT '',
  `mfa_enforced` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_system_name_index` (`system_name`),
  KEY `roles_external_auth_id_index` (`external_auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'Admin','Administrator of the whole application','2026-05-04 12:52:56','2026-05-04 12:52:56','admin','',0),
(2,'Editor','User can edit Books, Chapters & Pages','2026-05-04 12:52:56','2026-05-04 12:52:56','','',0),
(3,'Viewer','User can view books & their content behind authentication','2026-05-04 12:52:56','2026-05-04 12:52:56','','',0),
(4,'Public','The role given to public visitors if allowed','2026-05-04 12:52:56','2026-05-04 12:52:56','public','',0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_terms`
--

DROP TABLE IF EXISTS `search_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(180) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` bigint(20) unsigned NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `search_terms_term_index` (`term`),
  KEY `search_terms_entity_type_index` (`entity_type`),
  KEY `search_terms_entity_type_entity_id_index` (`entity_type`,`entity_id`),
  KEY `search_terms_score_index` (`score`)
) ENGINE=InnoDB AUTO_INCREMENT=3668 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_terms`
--

LOCK TABLES `search_terms` WRITE;
/*!40000 ALTER TABLE `search_terms` DISABLE KEYS */;
INSERT INTO `search_terms` VALUES
(1,'BSP','bookshelf',1,49),
(2,'Game','bookshelf',1,49),
(3,'Engine','bookshelf',1,49),
(4,'This','bookshelf',1,1),
(5,'documentation','bookshelf',1,1),
(6,'aims','bookshelf',1,1),
(7,'to','bookshelf',1,1),
(8,'explain','bookshelf',1,1),
(9,'the','bookshelf',1,2),
(10,'main','bookshelf',1,1),
(11,'uses','bookshelf',1,1),
(12,'and','bookshelf',1,1),
(13,'concepts','bookshelf',1,1),
(14,'of','bookshelf',1,1),
(15,'Binary','bookshelf',1,1),
(16,'Space','bookshelf',1,1),
(17,'Partitioning','bookshelf',1,1),
(41,'Engine','bookshelf',3,48),
(42,'Fundamentals','bookshelf',3,48),
(43,'This','bookshelf',3,1),
(44,'shelf','bookshelf',3,1),
(45,'describes','bookshelf',3,1),
(46,'the','bookshelf',3,2),
(47,'main','bookshelf',3,1),
(48,'fundamentals','bookshelf',3,1),
(49,'of','bookshelf',3,1),
(50,'using','bookshelf',3,1),
(51,'game','bookshelf',3,1),
(52,'engine','bookshelf',3,1),
(53,'\r','bookshelf',3,1),
(54,'engine.\r','bookshelf',3,1),
(101,'Getting','book',2,48),
(102,'Started','book',2,48),
(103,'This','book',2,1),
(104,'book','book',2,1),
(105,'describes','book',2,1),
(106,'how','book',2,1),
(107,'to','book',2,1),
(108,'set','book',2,1),
(109,'up','book',2,1),
(110,'a','book',2,1),
(111,'environment','book',2,1),
(112,'setup','book',2,6),
(113,'for','book',2,1),
(114,'the','book',2,1),
(115,'engine','book',2,1),
(116,'\r','book',2,1),
(117,'engine.\r','book',2,1),
(118,'chapter','book',2,3),
(119,'category','book',2,3),
(120,'1','book',2,5),
(210,'Chapter','chapter',4,48),
(211,'1','chapter',4,48),
(212,'Engine','chapter',4,48),
(213,'Structure','chapter',4,48),
(214,'This','chapter',4,1),
(215,'chapter','chapter',4,1),
(216,'explains','chapter',4,1),
(217,'the','chapter',4,2),
(218,'main','chapter',4,2),
(219,'project','chapter',4,6),
(220,'structure','chapter',4,6),
(221,'of','chapter',4,1),
(222,'engine','chapter',4,1),
(223,'technologies','chapter',4,6),
(224,'and','chapter',4,1),
(225,'how','chapter',4,1),
(226,'they','chapter',4,1),
(227,'are','chapter',4,1),
(228,'related','chapter',4,1),
(229,'to','chapter',4,1),
(230,'one','chapter',4,1),
(231,'another','chapter',4,1),
(232,'\r','chapter',4,1),
(233,'another.\r','chapter',4,1),
(234,'category','chapter',4,6),
(235,'project-structure','chapter',4,5),
(236,'Overview','page',5,40),
(237,'The','page',5,2),
(238,'project','page',5,3),
(239,'is','page',5,2),
(240,'a','page',5,2),
(241,'Low','page',5,1),
(242,'Level','page',5,1),
(243,'Binary','page',5,1),
(244,'Space','page',5,1),
(245,'Partitioning','page',5,1),
(246,'BSP','page',5,2),
(247,'based','page',5,1),
(248,'game','page',5,1),
(249,'engine','page',5,2),
(250,'There','page',5,1),
(251,'are','page',5,1),
(252,'multiple','page',5,1),
(253,'technologies','page',5,1),
(254,'included','page',5,1),
(255,'to','page',5,1),
(256,'implement','page',5,1),
(257,'this','page',5,1),
(258,'technology','page',5,1),
(259,'development','page',5,1),
(260,'and','page',5,1),
(261,'build','page',5,1),
(262,'wise','page',5,1),
(263,'C++','page',5,2),
(264,'Main','page',5,1),
(265,'programming','page',5,1),
(266,'language','page',5,1),
(267,'for','page',5,4),
(268,'the','page',5,2),
(269,'engine\r','page',5,1),
(270,'RayLib','page',5,1),
(271,'An','page',5,2),
(272,'open','page',5,1),
(273,'source','page',5,1),
(274,'open-source','page',5,1),
(275,'cross','page',5,2),
(276,'platform','page',5,2),
(277,'cross-platform','page',5,2),
(278,'graphics','page',5,1),
(279,'library','page',5,4),
(280,'creating','page',5,2),
(281,'games/game','page',5,1),
(282,'engines\r','page',5,1),
(283,'GLM','page',5,1),
(284,'OpenGL','page',5,1),
(285,'Mathematics','page',5,1),
(286,'\r','page',5,2),
(287,'EarCut','page',5,1),
(288,'A','page',5,2),
(289,'single','page',5,1),
(290,'header','page',5,1),
(291,'single-header','page',5,1),
(292,'that','page',5,2),
(293,'implements','page',5,1),
(294,'Ear','page',5,1),
(295,'Clipping','page',5,1),
(296,'floor','page',5,1),
(297,'&','page',5,1),
(298,'ceiling','page',5,1),
(299,'calculations','page',5,1),
(300,'PreMake','page',5,1),
(301,'management','page',5,1),
(302,'tool','page',5,1),
(303,'used','page',5,2),
(304,'structure','page',5,1),
(305,'on','page',5,1),
(306,'every','page',5,1),
(307,'environment','page',5,1),
(308,'mainly','page',5,1),
(309,'compiled','page',5,1),
(310,'into','page',5,1),
(311,'file','page',5,1),
(312,'can','page',5,1),
(313,'be','page',5,1),
(314,'everywhere','page',5,1),
(389,'Directory','page',6,43),
(390,'Structure','page',6,40),
(391,'You','page',6,1),
(392,'can','page',6,2),
(393,'find','page',6,1),
(394,'the','page',6,5),
(395,'source','page',6,3),
(396,'code','page',6,1),
(397,'on','page',6,2),
(398,'GitHub','page',6,1),
(399,'feel','page',6,1),
(400,'free','page',6,1),
(401,'to','page',6,2),
(402,'look','page',6,1),
(403,'it','page',6,3),
(404,'up','page',6,1),
(405,'and','page',6,5),
(406,'play','page',6,1),
(407,'with','page',6,1),
(408,'Main','page',6,3),
(409,'There','page',6,1),
(410,'are','page',6,2),
(411,'multiple','page',6,1),
(412,'directories','page',6,2),
(413,'that','page',6,1),
(414,'manages','page',6,1),
(415,'whole','page',6,1),
(416,'project','page',6,3),
(417,'Docs','page',6,1),
(418,'Documentation','page',6,1),
(419,'website','page',6,1),
(420,'one','page',6,1),
(421,'you','page',6,1),
(422,'re','page',6,1),
(423,'reading','page',6,1),
(424,'in','page',6,2),
(425,'right','page',6,1),
(426,'now','page',6,1),
(427,'\r','page',6,3),
(428,'Engine','page',6,5),
(429,'Game','page',6,7),
(430,'s','page',6,1),
(431,'code\r','page',6,1),
(432,'example\r','page',6,1),
(433,'build','page',6,2),
(434,'tools','page',6,1),
(435,'for','page',6,1),
(436,'creating','page',6,1),
(437,'using','page',6,1),
(438,'premake5','page',6,2),
(439,'executables','page',6,1),
(440,'lua','page',6,1),
(441,'premake5.lua','page',6,1),
(442,'PreMake','page',6,1),
(443,'configuration','page',6,1),
(444,'&','page',6,3),
(445,'Example','page',6,3),
(446,'Directories','page',6,3),
(447,'The','page',6,1),
(448,'engine','page',6,1),
(449,'game','page',6,2),
(450,'example','page',6,1),
(451,'managed','page',6,1),
(452,'a','page',6,1),
(453,'similar','page',6,1),
(454,'way','page',6,1),
(455,'include','page',6,1),
(456,'C++','page',6,2),
(457,'header','page',6,1),
(458,'files','page',6,1),
(459,'be','page',6,2),
(460,'also','page',6,1),
(461,'added','page',6,1),
(462,'will','page',6,1),
(463,'explained','page',6,1),
(464,'later','page',6,1),
(465,'src','page',6,1),
(466,'files\r','page',6,1),
(467,'resources','page',6,2),
(468,'such','page',6,1),
(469,'as','page',6,1),
(470,'images','page',6,1),
(471,'fonts','page',6,1),
(472,'sounds','page',6,1),
(1161,'Chapter','chapter',8,48),
(1162,'2','chapter',8,48),
(1163,'Hello','chapter',8,48),
(1164,'World','chapter',8,48),
(1165,'Create','chapter',8,1),
(1166,'a','chapter',8,2),
(1167,'basic','chapter',8,1),
(1168,'project','chapter',8,1),
(1169,'with','chapter',8,1),
(1170,'prepared','chapter',8,1),
(1171,'world','chapter',8,1),
(1172,'map','chapter',8,1),
(1173,'and','chapter',8,1),
(1174,'objects','chapter',8,1),
(1175,'\r','chapter',8,1),
(1176,'objects.\r','chapter',8,1),
(1399,'Summary','page',9,40),
(1400,'In','page',9,2),
(1401,'this','page',9,1),
(1402,'chapter','page',9,2),
(1403,'we','page',9,2),
(1404,'learned','page',9,1),
(1405,'the','page',9,4),
(1406,'main','page',9,2),
(1407,'project','page',9,2),
(1408,'directory','page',9,1),
(1409,'structure','page',9,1),
(1410,'and','page',9,3),
(1411,'technologies','page',9,1),
(1412,'used','page',9,1),
(1413,'for','page',9,1),
(1414,'building','page',9,1),
(1415,'developing','page',9,1),
(1416,'engine','page',9,1),
(1417,'next','page',9,1),
(1418,'ll','page',9,1),
(1419,'learn','page',9,1),
(1420,'how','page',9,1),
(1421,'to','page',9,1),
(1422,'setup','page',9,1),
(1423,'create','page',9,1),
(1424,'are','page',9,1),
(1425,'first','page',9,1),
(1666,'Project','page',7,47),
(1667,'Setup','page',7,40),
(1668,'Now','page',7,1),
(1669,'we','page',7,5),
(1670,'ll','page',7,2),
(1671,'go','page',7,1),
(1672,'through','page',7,1),
(1673,'the','page',7,26),
(1674,'setup','page',7,2),
(1675,'process','page',7,1),
(1676,'Most','page',7,1),
(1677,'of','page',7,2),
(1678,'is','page',7,1),
(1679,'based','page',7,1),
(1680,'on','page',7,3),
(1681,'RayLib','page',7,2),
(1682,'s','page',7,4),
(1683,'Quickstart','page',7,2),
(1684,'Requirements','page',7,3),
(1685,'Build','page',7,7),
(1686,'Tools','page',7,1),
(1687,'Such','page',7,1),
(1688,'as','page',7,2),
(1689,'Make','page',7,3),
(1690,'MinGW','page',7,1),
(1691,'VS','page',7,1),
(1692,'Builder','page',7,1),
(1693,'etc','page',7,1),
(1694,'Premake5','page',7,1),
(1695,'Included','page',7,1),
(1696,'in','page',7,5),
(1697,'build','page',7,8),
(1698,'directory','page',7,8),
(1699,'Add','page',7,3),
(1700,'Before','page',7,1),
(1701,'building','page',7,1),
(1702,'environment','page',7,6),
(1703,'should','page',7,3),
(1704,'create','page',7,2),
(1705,'a','page',7,2),
(1706,'new','page',7,1),
(1707,'project','page',7,8),
(1708,'Clone','page',7,1),
(1709,'repository','page',7,2),
(1710,'to','page',7,8),
(1711,'your','page',7,5),
(1712,'local','page',7,1),
(1713,'machine','page',7,2),
(1714,'Go','page',7,1),
(1715,'premake5','page',7,4),
(1716,'lua','page',7,2),
(1717,'premake5.lua','page',7,2),
(1718,'file','page',7,4),
(1719,'and','page',7,5),
(1720,'add','page',7,2),
(1721,'following','page',7,2),
(1722,'lines','page',7,1),
(1723,'========================================================','page',7,2),
(1724,'PROJECT','page',7,1),
(1725,'3','page',7,1),
(1726,'THE','page',7,1),
(1727,'GAME','page',7,1),
(1728,'Executable','page',7,1),
(1729,'workspaceName','page',7,1),
(1730,'kind','page',7,3),
(1731,'ConsoleApp','page',7,1),
(1732,'language','page',7,1),
(1733,'C++','page',7,1),
(1734,'targetdir','page',7,1),
(1735,'bin/%','page',7,2),
(1736,'cfg','page',7,3),
(1737,'buildcfg','page',7,3),
(1738,'cfg.buildcfg','page',7,3),
(1739,'objdir','page',7,1),
(1740,'obj/%','page',7,1),
(1741,'/Game','page',7,1),
(1742,'filter','page',7,13),
(1743,'system','page',7,8),
(1744,'windows','page',7,5),
(1745,'configurations','page',7,2),
(1746,'Release','page',7,2),
(1747,'action','page',7,5),
(1748,'gmake*','page',7,1),
(1749,'WindowedApp','page',7,2),
(1750,'buildoptions','page',7,3),
(1751,'Wl','page',7,1),
(1752,'-Wl','page',7,1),
(1753,'subsystem','page',7,1),
(1754,'-subsystem','page',7,1),
(1755,'vs*','page',7,4),
(1756,'entrypoint','page',7,1),
(1757,'mainCRTStartup','page',7,1),
(1758,'debugdir','page',7,1),
(1759,'$','page',7,1),
(1760,'SolutionDir','page',7,1),
(1761,'vpaths','page',7,1),
(1762,'Header','page',7,1),
(1763,'Files/*','page',7,3),
(1764,'=','page',7,3),
(1765,'Game/include/**','page',7,4),
(1766,'h','page',7,2),
(1767,'Game/include/**.h','page',7,2),
(1768,'hpp','page',7,2),
(1769,'Game/include/**.hpp','page',7,2),
(1770,'Source','page',7,1),
(1771,'Game/src/**','page',7,4),
(1772,'c','page',7,2),
(1773,'Game/src/**.c','page',7,2),
(1774,'cpp','page',7,2),
(1775,'Game/src/**.cpp','page',7,2),
(1776,'Game','page',7,5),
(1777,'Resource','page',7,1),
(1778,'Game/resources/**','page',7,2),
(1779,'Grab','page',7,1),
(1780,'source','page',7,1),
(1781,'code','page',7,3),
(1782,'ONLY','page',7,1),
(1783,'from','page',7,4),
(1784,'folder','page',7,1),
(1785,'files','page',7,2),
(1786,'The','page',7,2),
(1787,'needs','page',7,1),
(1788,'see','page',7,1),
(1789,'Engine','page',7,2),
(1790,'headers','page',7,1),
(1791,'includedirs','page',7,1),
(1792,'Engine/include','page',7,1),
(1793,'Game/include','page',7,1),
(1794,'external/glm','page',7,1),
(1795,'raylib_dir','page',7,1),
(1796,'/src','page',7,1),
(1797,'LINKING','page',7,1),
(1798,'links','page',7,7),
(1799,'AND','page',7,1),
(1800,'Raylib','page',7,1),
(1801,'BSPEngine','page',7,1),
(1802,'raylib','page',7,1),
(1803,'cdialect','page',7,1),
(1804,'C17','page',7,1),
(1805,'cppdialect','page',7,1),
(1806,'C++17','page',7,1),
(1807,'platform_defines','page',7,1),
(1808,'defines','page',7,2),
(1809,'_WINSOCK_DEPRECATED_NO_WARNINGS','page',7,1),
(1810,'_CRT_SECURE_NO_WARNINGS','page',7,1),
(1811,'characterset','page',7,1),
(1812,'Unicode','page',7,1),
(1813,'/Zc','page',7,1),
(1814,'__cplusplus','page',7,1),
(1815,'OS','page',7,1),
(1816,'SPECIFIC','page',7,1),
(1817,'SYSTEM','page',7,1),
(1818,'LINKS','page',7,1),
(1819,'_WIN32','page',7,1),
(1820,'winmm','page',7,1),
(1821,'gdi32','page',7,1),
(1822,'opengl32','page',7,1),
(1823,'libdirs','page',7,1),
(1824,'linux','page',7,3),
(1825,'stdc++','page',7,1),
(1826,'pthread','page',7,1),
(1827,'m','page',7,1),
(1828,'dl','page',7,1),
(1829,'rt','page',7,1),
(1830,'options','page',7,2),
(1831,'wayland=off','page',7,1),
(1832,'X11','page',7,1),
(1833,'wayland=on','page',7,1),
(1834,'wayland','page',7,3),
(1835,'client','page',7,1),
(1836,'wayland-client','page',7,1),
(1837,'cursor','page',7,1),
(1838,'wayland-cursor','page',7,1),
(1839,'egl','page',7,1),
(1840,'wayland-egl','page',7,1),
(1841,'xkbcommon','page',7,1),
(1842,'macosx','page',7,1),
(1843,'stdlib=libc++','page',7,1),
(1844,'-stdlib=libc++','page',7,1),
(1845,'c++','page',7,1),
(1846,'OpenGL','page',7,1),
(1847,'framework','page',7,7),
(1848,'OpenGL.framework','page',7,1),
(1849,'Cocoa','page',7,1),
(1850,'Cocoa.framework','page',7,1),
(1851,'IOKit','page',7,1),
(1852,'IOKit.framework','page',7,1),
(1853,'CoreFoundation','page',7,1),
(1854,'CoreFoundation.framework','page',7,1),
(1855,'CoreAudio','page',7,1),
(1856,'CoreAudio.framework','page',7,1),
(1857,'CoreVideo','page',7,1),
(1858,'CoreVideo.framework','page',7,1),
(1859,'AudioToolbox','page',7,1),
(1860,'AudioToolbox.framework','page',7,1),
(1861,'sure','page',7,3),
(1862,'that','page',7,2),
(1863,'you','page',7,7),
(1864,'replace','page',7,1),
(1865,'with','page',7,1),
(1866,'name','page',7,1),
(1867,'Also','page',7,1),
(1868,'make','page',7,3),
(1869,'has','page',7,1),
(1870,'at','page',7,1),
(1871,'list','page',7,1),
(1872,'src','page',7,1),
(1873,'include','page',7,1),
(1874,'resources','page',7,1),
(1875,'are','page',7,1),
(1876,'recommended','page',7,1),
(1877,'too','page',7,1),
(1878,'Environment','page',7,3),
(1879,'To','page',7,3),
(1880,'use','page',7,3),
(1881,'PreMake','page',7,2),
(1882,'run','page',7,4),
(1883,'for','page',7,1),
(1884,'check','page',7,1),
(1885,'out','page',7,1),
(1886,'section','page',7,1),
(1887,'Page','page',7,1),
(1888,'Example','page',7,1),
(1889,'gmake','page',7,2),
(1890,'Note','page',7,3),
(1891,'If','page',7,1),
(1892,'executable','page',7,2),
(1893,'main','page',7,3),
(1894,'by','page',7,1),
(1895,'moving','page',7,1),
(1896,'this','page',7,2),
(1897,'refencing','page',7,1),
(1898,'premake','page',7,1),
(1899,'such','page',7,2),
(1900,'/build/premake5','page',7,1),
(1901,'./build/premake5','page',7,1),
(1902,'This','page',7,1),
(1903,'will','page',7,1),
(1904,'using','page',7,1),
(1905,'configuration','page',7,1),
(1906,'Important','page',7,1),
(1907,'everytime','page',7,1),
(1908,'want','page',7,1),
(1909,'In','page',7,1),
(1910,'article','page',7,1),
(1911,'assume','page',7,1),
(1912,'have','page',7,1),
(1913,'Meaning','page',7,1),
(1914,'it','page',7,2),
(1915,'haven','page',7,2),
(1916,'t','page',7,3),
(1917,'been','page',7,1),
(1918,'tested','page',7,1),
(1919,'Visual','page',7,1),
(1920,'Studio','page',7,1),
(1921,'just','page',7,1),
(1922,'command','page',7,1),
(1923,'For','page',7,1),
(1924,'now','page',7,1),
(1925,'won','page',7,1),
(1926,'do','page',7,1),
(1927,'much','page',7,1),
(1928,'because','page',7,1),
(1929,'created','page',7,1),
(1930,'any','page',7,1),
(1931,'next','page',7,1),
(1932,'page','page',7,1),
(1933,'learn','page',7,1),
(1934,'how','page',7,1),
(1935,'an','page',7,1),
(1936,'example','page',7,1),
(1937,'game','page',7,1),
(3354,'Creating','page',10,40),
(3355,'a','page',10,43),
(3356,'Simple','page',10,40),
(3357,'Game','page',10,48),
(3358,'Introduction','page',10,3),
(3359,'We','page',10,3),
(3360,'re','page',10,1),
(3361,'going','page',10,1),
(3362,'to','page',10,3),
(3363,'create','page',10,1),
(3364,'simple','page',10,2),
(3365,'game','page',10,4),
(3366,'only','page',10,1),
(3367,'in','page',10,7),
(3368,'our','page',10,2),
(3369,'main','page',10,6),
(3370,'cpp','page',10,1),
(3371,'main.cpp','page',10,1),
(3372,'file','page',10,2),
(3373,'Also','page',10,1),
(3374,'we','page',10,3),
(3375,'ll','page',10,6),
(3376,'dive','page',10,1),
(3377,'into','page',10,1),
(3378,'more','page',10,1),
(3379,'details','page',10,1),
(3380,'the','page',10,25),
(3381,'next','page',10,2),
(3382,'chapters','page',10,2),
(3383,'for','page',10,8),
(3384,'now','page',10,2),
(3385,'it','page',10,3),
(3386,'s','page',10,1),
(3387,'rather','page',10,1),
(3388,'All','page',10,2),
(3389,'of','page',10,5),
(3390,'used','page',10,2),
(3391,'resources','page',10,3),
(3392,'except','page',10,1),
(3393,'wabbit','page',10,1),
(3394,'sprite','page',10,1),
(3395,'that','page',10,2),
(3396,'be','page',10,4),
(3397,'this','page',10,4),
(3398,'tutorial','page',10,1),
(3399,'are','page',10,1),
(3400,'made','page',10,1),
(3401,'by','page',10,3),
(3402,'engine','page',10,4),
(3403,'creator','page',10,1),
(3404,'walk','page',10,1),
(3405,'through','page',10,1),
(3406,'each','page',10,1),
(3407,'step','page',10,1),
(3408,'creating','page',10,1),
(3409,'Include','page',10,3),
(3410,'Headers','page',10,3),
(3411,'//','page',10,23),
(3412,'1','page',10,2),
(3413,'Standard','page',10,2),
(3414,'IO','page',10,2),
(3415,'Stream','page',10,2),
(3416,'#include','page',10,8),
(3417,'iostream','page',10,1),
(3418,'2','page',10,2),
(3419,'Engine','page',10,7),
(3420,'Cores','page',10,2),
(3421,'bsp/handler','page',10,1),
(3422,'h','page',10,7),
(3423,'bsp/handler.h','page',10,1),
(3424,'render/handler','page',10,1),
(3425,'render/handler.h','page',10,1),
(3426,'input/handler','page',10,1),
(3427,'input/handler.h','page',10,1),
(3428,'3','page',10,2),
(3429,'Camera','page',10,7),
(3430,'bsp/camera','page',10,1),
(3431,'bsp/camera.h','page',10,1),
(3432,'4','page',10,1),
(3433,'Example','page',10,2),
(3434,'Level','page',10,3),
(3435,'test/level','page',10,1),
(3436,'test/level.h','page',10,1),
(3437,'5','page',10,1),
(3438,'RayLib','page',10,5),
(3439,'Related','page',10,2),
(3440,'RayLib-Related','page',10,2),
(3441,'Code','page',10,2),
(3442,'raylib','page',10,1),
(3443,'raylib.h','page',10,1),
(3444,'resource_dir','page',10,1),
(3445,'resource_dir.h','page',10,1),
(3446,'Debugging','page',10,1),
(3447,'core','page',10,1),
(3448,'systems','page',10,1),
(3449,'needed','page',10,1),
(3450,'running','page',10,1),
(3451,'BSP','page',10,7),
(3452,'calculations','page',10,1),
(3453,'rendering','page',10,2),
(3454,'and','page',10,13),
(3455,'user','page',10,2),
(3456,'input','page',10,3),
(3457,'Will','page',10,1),
(3458,'detailed','page',10,1),
(3459,'A','page',10,1),
(3460,'basic','page',10,2),
(3461,'3D','page',10,3),
(3462,'Player','page',10,1),
(3463,'Can','page',10,1),
(3464,'moved','page',10,1),
(3465,'multiple','page',10,1),
(3466,'ways','page',10,1),
(3467,'lookaround','page',10,2),
(3468,'all','page',10,2),
(3469,'axis','page',10,1),
(3470,'movement','page',10,2),
(3471,'Provided','page',10,1),
(3472,'testing','page',10,1),
(3473,'For','page',10,1),
(3474,'configurations','page',10,1),
(3475,'such','page',10,1),
(3476,'as','page',10,2),
(3477,'window','page',10,5),
(3478,'folder','page',10,1),
(3479,'finding','page',10,1),
(3480,'From','page',10,1),
(3481,'on','page',10,2),
(3482,'code','page',10,2),
(3483,'will','page',10,1),
(3484,'placed','page',10,1),
(3485,'function','page',10,4),
(3486,'int','page',10,1),
(3487,'Your','page',10,1),
(3488,'Initializations','page',10,6),
(3489,'Optional','page',10,2),
(3490,'Tell','page',10,1),
(3491,'use','page',10,2),
(3492,'vsync','page',10,1),
(3493,'work','page',10,1),
(3494,'high','page',10,1),
(3495,'DPI','page',10,1),
(3496,'displays','page',10,1),
(3497,'SetConfigFlags','page',10,1),
(3498,'FLAG_WINDOW_HIGHDPI','page',10,1),
(3499,'Must','page',10,2),
(3500,'Create','page',10,3),
(3501,'OpenGL','page',10,2),
(3502,'context','page',10,2),
(3503,'InitWindow','page',10,1),
(3504,'WINDOW_RESOLUTION','page',10,3),
(3505,'x','page',10,1),
(3506,'WINDOW_RESOLUTION.x','page',10,1),
(3507,'y','page',10,1),
(3508,'WINDOW_RESOLUTION.y','page',10,1),
(3509,'Set','page',10,3),
(3510,'target','page',10,1),
(3511,'FPS','page',10,1),
(3512,'60','page',10,3),
(3513,'so','page',10,1),
(3514,'loop','page',10,1),
(3515,'runs','page',10,1),
(3516,'at','page',10,2),
(3517,'consistent','page',10,1),
(3518,'speed','page',10,1),
(3519,'SetTargetFPS','page',10,1),
(3520,'Disable','page',10,1),
(3521,'cursor','page',10,1),
(3522,'camera','page',10,11),
(3523,'with','page',10,1),
(3524,'DisableCursor','page',10,1),
(3525,'Delta','page',10,5),
(3526,'Time','page',10,5),
(3527,'Delta-Time','page',10,5),
(3528,'fixed','page',10,1),
(3529,'world','page',10,1),
(3530,'objects','page',10,1),
(3531,'glm','page',10,5),
(3532,'float32_t','page',10,1),
(3533,'deltaTime','page',10,9),
(3534,'=','page',10,4),
(3535,'0f','page',10,6),
(3536,'0.0f','page',10,3),
(3537,'locate','page',10,1),
(3538,'6','page',10,2),
(3539,'7','page',10,2),
(3540,'coordinates','page',10,1),
(3541,'bsp','page',10,6),
(3542,'vec3','page',10,2),
(3543,'6.0f','page',10,1),
(3544,'CAM_HEIGHT','page',10,2),
(3545,'7.0f','page',10,1),
(3546,'60.0f','page',10,1),
(3547,'Handlers','page',10,1),
(3548,'Handler','page',10,4),
(3549,'bsp_handler','page',10,7),
(3550,'render','page',10,2),
(3551,'render_handler','page',10,8),
(3552,'input_handler','page',10,2),
(3553,'Resources','page',10,3),
(3554,'Loading','page',10,3),
(3555,'Game/resources','page',10,2),
(3556,'directory','page',10,1),
(3557,'easy','page',10,1),
(3558,'load','page',10,1),
(3559,'SearchAndSetResourceDir','page',10,1),
(3560,'Load','page',10,4),
(3561,'textures','page',10,1),
(3562,'using','page',10,1),
(3563,'Texture','page',10,1),
(3564,'Manager','page',10,1),
(3565,'load_texture','page',10,3),
(3566,'render_handler.load_texture','page',10,3),
(3567,'Wall1','page',10,1),
(3568,'png','page',10,3),
(3569,'Wall1.png','page',10,1),
(3570,'Monster1','page',10,1),
(3571,'north','page',10,1),
(3572,'Monster1-north.png','page',10,1),
(3573,'wabbit_alpha','page',10,1),
(3574,'wabbit_alpha.png','page',10,1),
(3575,'sectors','page',10,2),
(3576,'segments','page',10,2),
(3577,'from','page',10,1),
(3578,'example','page',10,2),
(3579,'level','page',10,2),
(3580,'load_level','page',10,1),
(3581,'bsp_handler.load_level','page',10,1),
(3582,'test_level_sectors','page',10,2),
(3583,'calculated','page',10,1),
(3584,'load_segments','page',10,1),
(3585,'render_handler.load_segments','page',10,1),
(3586,'get_segments','page',10,2),
(3587,'bsp_handler.get_segments','page',10,2),
(3588,'sprites','page',10,1),
(3589,'load_sprites','page',10,1),
(3590,'render_handler.load_sprites','page',10,1),
(3591,'test_level_sprites','page',10,1),
(3592,'Clamp','page',10,3),
(3593,'Prevention','page',10,3),
(3594,'recommended','page',10,3),
(3595,'First','page',10,1),
(3596,'add','page',10,3),
(3597,'declaration','page',10,1),
(3598,'top','page',10,1),
(3599,'below','page',10,2),
(3600,'includes','page',10,1),
(3601,'void','page',10,2),
(3602,'prevent_dt_clamp','page',10,3),
(3603,'float32_t&','page',10,2),
(3604,'Now','page',10,1),
(3605,'if','page',10,2),
(3606,'05f','page',10,1),
(3607,'0.05f','page',10,1),
(3608,'0166f','page',10,1),
(3609,'0.0166f','page',10,1),
(3610,'soon','page',10,1),
(3611,'Main','page',10,3),
(3612,'Loop','page',10,4),
(3613,'&','page',10,3),
(3614,'Window','page',10,3),
(3615,'Management','page',10,3),
(3616,'run','page',10,1),
(3617,'until','page',10,1),
(3618,'is','page',10,2),
(3619,'closed','page',10,1),
(3620,'while','page',10,1),
(3621,'WindowShouldClose','page',10,1),
(3622,'Update','page',10,2),
(3623,'calculate','page',10,1),
(3624,'GetFrameTime','page',10,1),
(3625,'pre_update','page',10,1),
(3626,'camera.pre_update','page',10,1),
(3627,'update','page',10,3),
(3628,'input_handler.update','page',10,1),
(3629,'get_map_renderer','page',10,1),
(3630,'render_handler.get_map_renderer','page',10,1),
(3631,'Ask','page',10,1),
(3632,'tree','page',10,1),
(3633,'what','page',10,1),
(3634,'nearby','page',10,1),
(3635,'std','page',10,1),
(3636,'vector','page',10,1),
(3637,'Sector','page',10,1),
(3638,'nearby_sectors','page',10,2),
(3639,'get_nearby_sectors','page',10,1),
(3640,'bsp_handler.get_nearby_sectors','page',10,1),
(3641,'get_pos_2d','page',10,3),
(3642,'camera.get_pos_2d','page',10,3),
(3643,'get_player_radius','page',10,1),
(3644,'camera.get_player_radius','page',10,1),
(3645,'Tree','page',10,1),
(3646,'Traverser','page',10,1),
(3647,'camera.update','page',10,1),
(3648,'bsp_handler.update','page',10,1),
(3649,'Render','page',10,1),
(3650,'Everything','page',10,1),
(3651,'render_handler.render','page',10,1),
(3652,'get_raylib_camera','page',10,1),
(3653,'camera.get_raylib_camera','page',10,1),
(3654,'get_segment_ids_to_render','page',10,1),
(3655,'bsp_handler.get_segment_ids_to_render','page',10,1),
(3656,'At','page',10,1),
(3657,'end','page',10,1),
(3658,'Destroy','page',10,1),
(3659,'cleanup','page',10,1),
(3660,'CloseWindow','page',10,1),
(3661,'return','page',10,1),
(3662,'You','page',10,1),
(3663,'should','page',10,1),
(3664,'see','page',10,1),
(3665,'resulting','page',10,1),
(3666,'done','page',10,1),
(3667,'right','page',10,1);
/*!40000 ALTER TABLE `search_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `setting_key` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'string',
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
('app-color','#206ea7','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('app-color-dark','#195785','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('app-color-light','rgba(32,110,167,0.15)','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('app-color-light-dark','rgba(32,110,167,0.15)','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('app-custom-head','','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('app-editor','markdown','2026-05-04 14:18:09','2026-05-04 14:58:16','string'),
('app-footer-links','[]','2026-05-04 14:18:09','2026-05-04 14:18:09','array'),
('app-homepage','','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('app-homepage-type','default','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('app-name','BSP Engine Docs','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('app-name-header','true','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('book-color','#077b70','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('book-color-dark','#389f60','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('bookshelf-color','#a94747','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('bookshelf-color-dark','#ff5454','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('chapter-color','#af4d0d','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('chapter-color-dark','#ee7a2d','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('instance-id','55dac44e-a5c0-4564-bf21-dc9002f02364','2026-05-04 12:52:56','2026-05-04 12:52:56','string'),
('link-color','#206ea7','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('link-color-dark','#429fe3','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('page-color','#206ea7','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('page-color-dark','#429fe3','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('page-draft-color','#7e50b1','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('page-draft-color-dark','#a66ce8','2026-05-04 14:18:09','2026-05-04 14:18:09','string'),
('registration-confirmation','false','2026-05-04 15:16:15','2026-05-04 15:16:15','string'),
('registration-enabled','true','2026-05-04 15:16:15','2026-05-04 15:16:15','string'),
('registration-restrict','','2026-05-04 15:16:15','2026-05-04 15:16:15','string'),
('registration-role','3','2026-05-04 15:16:15','2026-05-04 15:16:15','string');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slug_history`
--

DROP TABLE IF EXISTS `slug_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slug_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sluggable_type` varchar(10) NOT NULL,
  `sluggable_id` bigint(20) unsigned NOT NULL,
  `slug` varchar(191) NOT NULL,
  `parent_slug` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slug_history_sluggable_type_index` (`sluggable_type`),
  KEY `slug_history_sluggable_id_index` (`sluggable_id`),
  KEY `slug_history_slug_index` (`slug`),
  KEY `slug_history_parent_slug_index` (`parent_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slug_history`
--

LOCK TABLES `slug_history` WRITE;
/*!40000 ALTER TABLE `slug_history` DISABLE KEYS */;
INSERT INTO `slug_history` VALUES
(1,'book',2,'chapter-1-project-setup',NULL,'2026-05-04 13:11:26','2026-05-04 13:11:26'),
(2,'book',2,'project-setup',NULL,'2026-05-04 13:12:15','2026-05-04 13:12:15'),
(3,'page',5,'technologies','getting-started','2026-05-04 14:06:21','2026-05-04 14:06:21'),
(4,'chapter',4,'chapter-1-project-structure','getting-started','2026-05-04 14:06:57','2026-05-04 14:06:57'),
(5,'page',7,'setup','getting-started','2026-05-04 15:47:12','2026-05-04 15:47:12');
/*!40000 ALTER TABLE `slug_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_accounts`
--

DROP TABLE IF EXISTS `social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `driver` varchar(191) NOT NULL,
  `driver_id` varchar(191) NOT NULL,
  `avatar` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_accounts_user_id_index` (`user_id`),
  KEY `social_accounts_driver_index` (`driver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_accounts`
--

LOCK TABLES `social_accounts` WRITE;
/*!40000 ALTER TABLE `social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sort_rules`
--

DROP TABLE IF EXISTS `sort_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sort_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `sequence` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sort_rules`
--

LOCK TABLES `sort_rules` WRITE;
/*!40000 ALTER TABLE `sort_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `sort_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` bigint(20) unsigned NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `name` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_name_index` (`name`),
  KEY `tags_value_index` (`value`),
  KEY `tags_order_index` (`order`),
  KEY `tags_entity_id_entity_type_index` (`entity_id`,`entity_type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES
(7,2,'book','chapter','1',0,'2026-05-04 13:13:13','2026-05-04 13:13:13'),
(8,2,'book','category','setup',0,'2026-05-04 13:13:13','2026-05-04 13:13:13'),
(11,4,'chapter','category','project-structure',0,'2026-05-04 14:06:57','2026-05-04 14:06:57'),
(12,4,'chapter','category','technologies',0,'2026-05-04 14:06:57','2026-05-04 14:06:57');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invites`
--

DROP TABLE IF EXISTS `user_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_invites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_invites_user_id_index` (`user_id`),
  KEY `user_invites_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invites`
--

LOCK TABLES `user_invites` WRITE;
/*!40000 ALTER TABLE `user_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(60) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_confirmed` tinyint(1) NOT NULL DEFAULT 1,
  `image_id` int(11) NOT NULL DEFAULT 0,
  `external_auth_id` varchar(191) NOT NULL,
  `system_name` varchar(191) DEFAULT NULL,
  `slug` varchar(180) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  KEY `users_external_auth_id_index` (`external_auth_id`),
  KEY `users_system_name_index` (`system_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Admin','admin@admin.com','$2y$12$mOj3ZKGgnFPGYdT7dB6Vp.ZwY2Z0x9cv.MtX/GDwgcu8SejIvItSW','yr0yqIubDJ1WEH3J9kMRhhOvdhgPf9SLoXUjXplbJip7PjYgvR5LxZg8CRGN','2026-05-04 12:52:56','2026-05-04 12:52:56',1,0,'',NULL,'admin'),
(2,'Guest','guest@example.com','',NULL,'2026-05-04 12:52:56','2026-05-04 12:52:56',1,0,'','public','guest');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `viewable_id` bigint(20) unsigned NOT NULL,
  `viewable_type` varchar(191) NOT NULL,
  `views` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `views_user_id_index` (`user_id`),
  KEY `views_viewable_id_index` (`viewable_id`),
  KEY `views_updated_at_index` (`updated_at`),
  KEY `views_viewable_type_index` (`viewable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES
(1,1,1,'bookshelf',4,'2026-05-04 13:04:49','2026-05-04 13:11:02'),
(2,1,2,'book',33,'2026-05-04 13:06:58','2026-05-07 13:33:08'),
(3,1,3,'bookshelf',15,'2026-05-04 13:10:56','2026-05-04 15:30:07'),
(4,1,4,'chapter',17,'2026-05-04 13:58:02','2026-05-04 15:47:21'),
(5,1,5,'page',12,'2026-05-04 13:58:31','2026-05-04 15:01:22'),
(6,1,6,'page',7,'2026-05-04 14:11:48','2026-05-04 15:01:22'),
(7,1,7,'page',19,'2026-05-04 14:51:38','2026-05-07 13:33:10'),
(8,1,8,'chapter',9,'2026-05-04 15:46:34','2026-05-07 13:33:09'),
(9,1,9,'page',1,'2026-05-04 15:48:51','2026-05-04 15:48:51'),
(10,1,10,'page',12,'2026-05-05 05:58:21','2026-05-07 13:38:21');
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watches`
--

DROP TABLE IF EXISTS `watches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `watches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `watchable_id` bigint(20) unsigned NOT NULL,
  `watchable_type` varchar(100) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchable_index` (`watchable_id`,`watchable_type`),
  KEY `watches_user_id_index` (`user_id`),
  KEY `watches_level_index` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watches`
--

LOCK TABLES `watches` WRITE;
/*!40000 ALTER TABLE `watches` DISABLE KEYS */;
/*!40000 ALTER TABLE `watches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_tracked_events`
--

DROP TABLE IF EXISTS `webhook_tracked_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_tracked_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int(11) NOT NULL,
  `event` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webhook_tracked_events_event_index` (`event`),
  KEY `webhook_tracked_events_webhook_id_index` (`webhook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_tracked_events`
--

LOCK TABLES `webhook_tracked_events` WRITE;
/*!40000 ALTER TABLE `webhook_tracked_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_tracked_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `endpoint` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `timeout` int(10) unsigned NOT NULL DEFAULT 3,
  `last_error` text NOT NULL DEFAULT '',
  `last_called_at` timestamp NULL DEFAULT NULL,
  `last_errored_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webhooks_name_index` (`name`),
  KEY `webhooks_active_index` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks`
--

LOCK TABLES `webhooks` WRITE;
/*!40000 ALTER TABLE `webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhooks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-05-07 13:43:45
