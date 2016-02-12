-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: books
-- ------------------------------------------------------
-- Server version	5.6.27

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book` varchar(100) NOT NULL,
  `author` varchar(200) NOT NULL,
  `editorial` varchar(100) NOT NULL,
  `isbn` varchar(30) NOT NULL,
  `resume` varchar(300) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user_idx` (`id_user`),
  KEY `id_genre_idx` (`id_genre`),
  CONSTRAINT `book_genre` FOREIGN KEY (`id_genre`) REFERENCES `book_genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `book_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Harry Potter and the philosopher\'s stone','J. K. Rowling','Salamandra','9788700631625','When an orphan guy discover that is a magician he stars to go an school for magicians. His name is Harry Potter and together Ron Wesley and Hermione Granger are going to live great aventures but also they are going to discover big secrets about the past of Harry...','1/harry-potter-and-the-sorcerers-stone-artwork-book-cover.jpg',1,0),(2,'harry potter and chamber of secrets','J.K. Rowling','Salamandra','9780747560722','Harry Potter is going to back Hogwarts, but before star the course a domestic elfo tell him to don\'t go he says that he is trying to help him. Harry is going to go anyway.','2/Harry_Potter_and_the_Chamber_of_Secrets_(US_cover).jpg',1,0),(3,'harry potter and prisoner of azkaban','J. K. Rowling','Salamandra','9780747560777','After destroy Tom Riddle\'s book Harry Potter is in the house of his uncle, when a uncle\'s sister goes to visit them Harry decide get out of there for the rest of the summer holidays, althought exist a danger in the magician world a criminal has gone of his prision.','3/Harry_Potter_and_the_Prisoner_of_Azkaban_(US_cover).jpg',1,0),(4,'harry potter and goblet of fire','J. K. Rowling','Salamandra','9780195799163','A new course on Howarts is coming, this year will be different, The tournament of the three magician will be in the school only the guys of 5th can enter but Harry will receive a surprise, he will do the things change for the competition.','4/Goblet_fire_cover.jpg',1,0),(5,'Harry Potter and the Order of the Phoenix','J. K. Rowling','Salamandra','9788498383621','The \"who you know\" is back, he want something that concerns Harry, the Orden of Phoenix is back and Harry will create the Dumbledor\'s army to keep save the school. Meanwhile Sirius is hidden in his house waiting to a permission to get out.','5/orden.jpg',1,0),(6,'El principito','Rick Cummins','Porrua','9788845115059','The history of a Man who falls on the desert and is found by a little prince who comes from the starts','6/51jbczePReL._AC_UL320_SR226,320_.jpg',1,0),(7,'the lord of the ring: the fellowship of the ring','J. R. R. Tolkien','Porrua','9780007117116','Frodo Baggins inherit the fortune of his uncle Bilbo Baggins, between the big things also he receives a ring but it is not any ring is a powerful ring that can destroy the world.','7/the-lord-of-the-rings-the-fellowship-of-the-ring.jpg',1,0),(8,'the power','power up','Power Off','123-123-123-123','this is the power','8/hald blood.jpg',1,0),(9,'return power','power up','power off','123-123-123-123','this is the power return','9/hald blood.jpg',1,0),(10,'final power','power up','power off','123-123-123-123','when the power is the only option to get a final in the end of series','10/hald blood.jpg',1,0);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_borrowed`
--

DROP TABLE IF EXISTS `book_borrowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_borrowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_book` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user_idx` (`id_user`),
  KEY `id_book_idx` (`id_book`),
  KEY `id_status_idx` (`id_status`),
  CONSTRAINT `book_borrow_book` FOREIGN KEY (`id_book`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `book_borrow_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `book_borrow_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_borrowed`
--

LOCK TABLES `book_borrowed` WRITE;
/*!40000 ALTER TABLE `book_borrowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_borrowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_genre`
--

DROP TABLE IF EXISTS `book_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_genre`
--

LOCK TABLES `book_genre` WRITE;
/*!40000 ALTER TABLE `book_genre` DISABLE KEYS */;
INSERT INTO `book_genre` VALUES (1,'Romance / Erotic'),(2,'Crime / Mystery'),(3,'Religious / Inspirational'),(4,'Science Fiction and Fantasy'),(5,'Horror'),(6,'Other');
/*!40000 ALTER TABLE `book_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_vote`
--

DROP TABLE IF EXISTS `book_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` tinyint(4) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user_idx` (`id_user`),
  CONSTRAINT `book_vote_book` FOREIGN KEY (`id`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `book_vote_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_vote`
--

LOCK TABLES `book_vote` WRITE;
/*!40000 ALTER TABLE `book_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reliability`
--

DROP TABLE IF EXISTS `reliability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reliability` (
  `id` int(11) NOT NULL,
  `up` int(11) NOT NULL DEFAULT '0',
  `down` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `reliability` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reliability`
--

LOCK TABLES `reliability` WRITE;
/*!40000 ALTER TABLE `reliability` DISABLE KEYS */;
/*!40000 ALTER TABLE `reliability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enable` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'firts','1234',1),(2,'second','1234',1),(3,'second','1234',1),(4,'third','1234',1),(5,'third','1234',1),(6,'rojo','1234',0),(7,'','',0),(8,'','',0),(9,'','',0),(10,'blanco','1234',0),(11,'dragon','1234',0),(12,'dragon','1234',0),(13,'amarillo','1234',0),(14,'rojo@rojo.com','1234',0),(15,'rojo@rojo.com','1234',0),(16,'rojo@rojo.com','1234',0),(17,'amarillo@amarillo.com','1234',0),(18,'blanco@blanco.com','1234',0),(19,'uno@uno.com','1234',0),(20,'gris@girs.com','1234',0),(21,'gris@com','1234',0),(22,'naranja@naranja.com','1234',0),(23,'morado@morado.com','1234',0),(24,'red@red.com','1234',0),(25,'p@p.com','123',0),(26,'a@a.com','123',0),(27,'b@b.com','1234',0),(28,'c@c.com','123',0),(29,'d@d.com','123',0),(30,'part','1234',1),(31,'peper@peper.com','1357',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-12 16:36:37
