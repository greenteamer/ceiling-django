-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: mysql2.locum.ru    Database: teamer77_joyus89
-- ------------------------------------------------------
-- Server version	5.5.48-37.8-log

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `sent` datetime DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` (`email_address_id`),
  CONSTRAINT `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add redirect',8,'add_redirect'),(23,'Can change redirect',8,'change_redirect'),(24,'Can delete redirect',8,'delete_redirect'),(25,'Can add email address',9,'add_emailaddress'),(26,'Can change email address',9,'change_emailaddress'),(27,'Can delete email address',9,'delete_emailaddress'),(28,'Can add email confirmation',10,'add_emailconfirmation'),(29,'Can change email confirmation',10,'change_emailconfirmation'),(30,'Can delete email confirmation',10,'delete_emailconfirmation'),(31,'Can add social application',11,'add_socialapp'),(32,'Can change social application',11,'change_socialapp'),(33,'Can delete social application',11,'delete_socialapp'),(34,'Can add social account',12,'add_socialaccount'),(35,'Can change social account',12,'change_socialaccount'),(36,'Can delete social account',12,'delete_socialaccount'),(37,'Can add social application token',13,'add_socialtoken'),(38,'Can change social application token',13,'change_socialtoken'),(39,'Can delete social application token',13,'delete_socialtoken'),(40,'Can add Site Tree',14,'add_tree'),(41,'Can change Site Tree',14,'change_tree'),(42,'Can delete Site Tree',14,'delete_tree'),(43,'Can add Site Tree Item',15,'add_treeitem'),(44,'Can change Site Tree Item',15,'change_treeitem'),(45,'Can delete Site Tree Item',15,'delete_treeitem'),(46,'Can add Тип фильтра потолков',16,'add_filtertype'),(47,'Can change Тип фильтра потолков',16,'change_filtertype'),(48,'Can delete Тип фильтра потолков',16,'delete_filtertype'),(49,'Can add Фильтр',17,'add_filter'),(50,'Can change Фильтр',17,'change_filter'),(51,'Can delete Фильтр',17,'delete_filter'),(52,'Can add filter advantages',18,'add_filteradvantages'),(53,'Can change filter advantages',18,'change_filteradvantages'),(54,'Can delete filter advantages',18,'delete_filteradvantages'),(55,'Can add Потолок',19,'add_ceiling'),(56,'Can change Потолок',19,'change_ceiling'),(57,'Can delete Потолок',19,'delete_ceiling'),(58,'Can add ceiling image',20,'add_ceilingimage'),(59,'Can change ceiling image',20,'change_ceilingimage'),(60,'Can delete ceiling image',20,'delete_ceilingimage'),(61,'Can add Услуга',21,'add_service'),(62,'Can change Услуга',21,'change_service'),(63,'Can delete Услуга',21,'delete_service'),(64,'Can add Страница',22,'add_page'),(65,'Can change Страница',22,'change_page'),(66,'Can delete Страница',22,'delete_page'),(67,'Can add Статья',23,'add_post'),(68,'Can change Статья',23,'change_post'),(69,'Can delete Статья',23,'delete_post'),(70,'Can add Отзыв',24,'add_review'),(71,'Can change Отзыв',24,'change_review'),(72,'Can delete Отзыв',24,'delete_review'),(73,'Can add Партнер',25,'add_partner'),(74,'Can change Партнер',25,'change_partner'),(75,'Can delete Партнер',25,'delete_partner'),(76,'Can add Настройки сайта',26,'add_config'),(77,'Can change Настройки сайта',26,'change_config'),(78,'Can delete Настройки сайта',26,'delete_config'),(79,'Can add Телефон сайта',27,'add_sitephone'),(80,'Can change Телефон сайта',27,'change_sitephone'),(81,'Can delete Телефон сайта',27,'delete_sitephone'),(82,'Can add Ссылка',28,'add_aditionallink'),(83,'Can change Ссылка',28,'change_aditionallink'),(84,'Can delete Ссылка',28,'delete_aditionallink'),(85,'Can add Flat block',29,'add_flatblock'),(86,'Can change Flat block',29,'change_flatblock'),(87,'Can delete Flat block',29,'delete_flatblock'),(88,'Can add Проект',30,'add_project'),(89,'Can change Проект',30,'change_project'),(90,'Can delete Проект',30,'delete_project'),(91,'Can add project image',31,'add_projectimage'),(92,'Can change project image',31,'change_projectimage'),(93,'Can delete project image',31,'delete_projectimage'),(94,'Can add source',32,'add_source'),(95,'Can change source',32,'change_source'),(96,'Can delete source',32,'delete_source'),(97,'Can add thumbnail',33,'add_thumbnail'),(98,'Can change thumbnail',33,'change_thumbnail'),(99,'Can delete thumbnail',33,'delete_thumbnail'),(100,'Can add thumbnail dimensions',34,'add_thumbnaildimensions'),(101,'Can change thumbnail dimensions',34,'change_thumbnaildimensions'),(102,'Can delete thumbnail dimensions',34,'delete_thumbnaildimensions'),(103,'Can add url',35,'add_url'),(104,'Can change url',35,'change_url'),(105,'Can delete url',35,'delete_url'),(106,'Can add rule',36,'add_rule'),(107,'Can change rule',36,'change_rule'),(108,'Can delete rule',36,'delete_rule'),(109,'Can add advantages',37,'add_advantages'),(110,'Can change advantages',37,'change_advantages'),(111,'Can delete advantages',37,'delete_advantages');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$24000$NZt9S4e1wats$TE+hpgnnxaxLgOX1cZFiaNi1nGWqFIKeu1U4Mn1fG+Q=','2016-05-25 22:15:05',1,'admin','','','teamer777@gmail.com',1,1,'2016-05-20 13:16:06'),(4,'pbkdf2_sha256$24000$PWXQW6IcSNAO$37cDHqhMWSgBvQGiOMh8IKnCso81bgahfEGDX9u/hVo=','2016-05-23 11:55:15',1,'godmen','','','',1,1,'2016-05-20 14:41:19');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceilings_ceiling`
--

DROP TABLE IF EXISTS `ceilings_ceiling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceilings_ceiling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `text` longtext NOT NULL,
  `preview_name` varchar(50) NOT NULL,
  `preview_text` longtext NOT NULL,
  `meta_title` varchar(80) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceilings_ceiling`
--

LOCK TABLES `ceilings_ceiling` WRITE;
/*!40000 ALTER TABLE `ceilings_ceiling` DISABLE KEYS */;
INSERT INTO `ceilings_ceiling` VALUES (1,'Глянцевые натяжные потолки','glyancevye-natyazhnye-potolki','<p>В наше время глянцевые натяжные потолки стали действительно популярной темой в строительстве и отделке. Вряд ли какой серьезный дизайнер не учтет прекрасные эстетические свойства такого натяжного потолка тем более владелец помещения. Такая ситуация сложилась при условии целого ряда преимуществ основными из которых являются:&nbsp;</p>\r\n\r\n<p>- водонепроницаемость - благодаря тому что полотно натяжного потолка изготавливается из ПВХ пленки которая не впитывает и не пропускает воду - Вы можете всегда чувствовать себя защищенными от возможности быть затопленными соседями сверху;<br />\r\n- привлекательный внешний вид - когда Вы выбираете глянцевый натяжной потолок Вам предоставляется возможность выбрать цвет, оттенок и фактуру натяжного потолка что максимально ответит Вашим предпочтениям и подчеркнет индивидуальность помещения. Кроме того глянцевые потолки визуально увеличивают пространство помещения за счет хорошей отражающей поверхности;<br />\r\n- быстрота монтажа - благодаря отработанным техникам и профессионализму наших специалистов время установки натяжного потолка начинается от 3 часов;<br />\r\n- Отличным решением так же может быть глянцевый натяжной потолок Ecofole который устойчив к развитию бактерий</p>\r\n\r\n<p>Хотелось бы отдельно отметить что данный вид натяжных потолков зачастую используется в помещениях с низким потолком. В этом случае глянцевый потолок может качественно улучшить восприятие помещения и подарить дополнительное пространство за счет своей отражающей поверхности. По некоторым исследованиям помещения в более высокими потолками способствуют большей продуктивности в работе и более быстрым восстанавливающим свойством, если оно используется для отдыха.</p>\r\n\r\n<p>Компания &laquo;Потолок Лайк&raquo; обеспечит качество как самого полотна так и его устройства в Вашем помещении. Мы используем качественный и экономичные материалы для того что бы Вы были действительно довольны.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>','Глянцевые натяжные потолки','Водонепроницаемость, привлекательный внешний вид, высокая скорость монтажа и невысокая цена - вот те основные качества глянцевого потолка которые мы в нем действительно ценим.','','','','2016-05-17 13:16:08','2016-05-21 15:33:07','ceilings/glanceviy_natagnoy_potolok_kukhnia_1_mppwr6T.JPG',400.00),(2,'Сатиновые натяжные потолки','satinovye-natyazhnye-potolki','<p style=\"margin: 0px; padding: 0px 0px 14px; box-sizing: border-box; line-height: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px;\">Главная отличительная черта сатиновых натяжных потолков заключается в создаваемой ими легкой и утонченной атмосферы, которая будет и радовать и давать прекрасное эстетическое удовольствие. Этот вид полотен пользуется большой популярностью при установке натяжных потолков в спальнях и зонах отдыха.&nbsp;<br />\r\nМы производим потолки сатин и матовой фактуры уже более 5 лет и гордимся тем что можем дать вам гарантию более 10 лет срока службы.<br />\r\nСатиновый потолок - это отличное эстетическое решение.<br />\r\nБлагодаря своей уникальной мелокозернистой структуре сатиновые потолки прекрасно смотрятся в различных вариантах: как в моноцвете так и в варианте с художественной росписью.&nbsp;<br />\r\nЕсли сатиновый потолок установлен в гостиной - он придает ей особый стат своим благородным блеском, в детской же или спальне он станет ненавязчивым хранителем спокойствия ваших снов.&nbsp;<br />\r\nПри легком и правильном уходе потолок прослужит Вам более 50 лет и сохранит при этом свою актуальность. Забудьте про ежегодные побелки потолка и ремонт после пролива соседей - натяжной потолок будет красив даже спустя десятилетия.&nbsp;<br />\r\nПри выборе сатинового натяжного потолка важно внимательно отнестись к освещению помещения для того что бы эффект оказался именно таким как Вы его задумали. Если Вам ближе пышность и узорность закажите сатиновое полотно с принтом римского стиля XVI-XVII веков и эффект вас действительно обрадует, но если Вы больше склонны к спокойному классическому стилю - просто выберите многоцветную гамму или просто белый потолок. Оставьте свой номер телефона и мы перезвоним Вам в течении 1 минуты.</p>','Сатиновые натяжные потолки','Сатиновая ткань подчеркивает утонченность дизайна и, при этом, дает невероятное ощущение качества, легкости и свежести помещения, не привлекая при этом к себе излишнего внимания своего гостя.','','','','2016-05-17 13:25:07','2016-05-23 12:05:04','ceilings/satinovyj-potolok8.jpg',400.00),(3,'Матовые натяжные потолки','matovye-natyazhnye-potolki','<p>Матовые натяжные потолки зарекомендовали себя в условиях когда при желании изменить интерьер нет возможности делать глобальный ремонт. Благодаря своей скромной но в тоже время надежной составляющей матовое полотно крепко &nbsp;зарекомендовало себя в качестве стандартного решения. При этом эти потолки не лишены и эстетических качеств. Просто закажите себе такой потолок и Вы не сможете отличить его от идеально ровной заштукатуренной и побелено поверхности, а ведь зачастую именно такой эффект мы и хотим получить от ремонта.&nbsp;</p>\r\n\r\n<p><br />\r\nТак же матовые натяжные потолки идеальны для долгого использования, потому как не требуют к себе особого отношения: при необходимости Вы просто чистите потолок жидкостью для мытья окон и тряпочкой без ворса и Ваш потолок снова как новый.&nbsp;</p>\r\n\r\n<p><br />\r\nЦветной вариант данного решения так же задаст необычный и оригинальный эффект вашему помещению и позволит с точностью претворить Ваши дизайнерские идеи в жизнь. Наши специалисты с &nbsp;удовольствием помогут Вам с вариантами дизайнерских решений для вашего помещения.&nbsp;</p>\r\n\r\n<p><br />\r\nАкция 3d дизайн вашего потолка при заключении договора - бесплатно*</p>\r\n\r\n<p>* - акция действительна до 23 июня 2016 года.</p>\r\n\r\n<p><br />\r\nДизайн натяжного потолка поможет Вам в случае если вы еще не смогли определиться с цветовой гаммой и фактурой потолка, а так же в случае если Вы желаете сделать многоуровневый матовый натяжной потолок, но хочется понять как это будет выглядеть заранее.</p>\r\n\r\n<p><br />\r\nЗаказав у натяжной потолок в компании &laquo;Потолок Лайк&raquo; вы можете быть уверены что Ваши соседи сверху не принесут Вам много хлопот &nbsp;так как качество устройства и потолка позволяют выдержать до 100 литров воды в экстренном случае.</p>\r\n\r\n<p>&nbsp;</p>','Матовые натяжные потолки','Классический по своему виду и тем не менее интересный и имеющий ряд преимуществ, матовый натяжной потолок, подарит своему хозяину ощущение спокойствия, приятный эстетический вид и сэкономит время при выборе.','','','','2016-05-17 13:25:54','2016-05-23 12:07:04','ceilings/residential.jpg',400.00),(4,'Многоуровневые натяжные потолки','mnogourovnevye','<p>Многоуровневые</p>\r\n\r\n<p style=\"margin: 0px; padding: 0px 0px 14px; box-sizing: border-box; line-height: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px;\">Желая создать неповторимый дизайн интерьера, скрыть множество внешних недостатков и придать помещению ухоженный вид, профессионалы выбирают многоуровневые натяжные потолки для достижения всех необходимых характеристик. Благодаря правильно подобранному потолку, можно получить несколько функциональных зон, визуально изменить параметры комнаты, создать новую форму помещения.</p>\r\n\r\n<p style=\"margin: 0px; padding: 0px 0px 14px; box-sizing: border-box; line-height: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px;\">Компания ГЕНВИК создает оригинальные проекты с учетом специфических особенностей любого помещения. Используя в своей работе современные материалы, последние разработки, широкую палитру цветов и множество фактур, специалисты компании добиваются уникальных результатов, способных стать украшением каждого заведения.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2 style=\"margin: 0px; padding: 0px 0px 12px; font-size: 25px; line-height: 27px; font-family: PFDinDisplayProMedium;\">Прайс-лист на многоуровневые конструкции</h2>\r\n\r\n<div data-table=\"mnogourov_price_table\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; font-size: 14px; line-height: 18px;\">\r\n<div style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">\r\n<table class=\"i_table\" style=\"margin: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; border: 0px; font-size: 13px; width: 708px;\">\r\n	<thead style=\"margin: 0px; padding: 0px;\">\r\n		<tr style=\"margin: 0px; padding: 0px;\">\r\n			<th style=\"margin: 0px; padding: 7px 5px 7px 10px; vertical-align: middle; border: 1px solid rgb(204, 204, 204); background-color: rgb(230, 235, 239);\">Наименование</th>\r\n			<th style=\"margin: 0px; padding: 7px 5px 7px 10px; vertical-align: middle; border: 1px solid rgb(204, 204, 204); background-color: rgb(230, 235, 239);\">Ед. Изм.</th>\r\n			<th style=\"margin: 0px; padding: 7px 5px 7px 10px; vertical-align: middle; border: 1px solid rgb(204, 204, 204); background-color: rgb(230, 235, 239);\">Цена</th>\r\n		</tr>\r\n	</thead>\r\n	<tfoot style=\"margin: 0px; padding: 0px;\">\r\n		<tr style=\"margin: 0px; padding: 0px;\">\r\n			<td colspan=\"3\" style=\"margin: 0px; padding: 7px 5px 7px 10px; vertical-align: middle; border: none; font-size: 12px;\">*Цены указаны без учета&nbsp;<a href=\"http://www.genvik.ru/client/sale/\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(3, 109, 163); outline: none;\">скидок</a>&nbsp;за 1 п.м. алюминиевого конструкционного профиля.&nbsp;<br style=\"margin: 0px; padding: 0px;\" />\r\n			<strong style=\"margin: 0px; padding: 0px;\">Срок изготовления - 10 рабочих дней</strong></td>\r\n		</tr>\r\n	</tfoot>\r\n	<tbody style=\"margin: 0px; padding: 0px;\">\r\n		<tr class=\"bgweit\" style=\"margin: 0px; padding: 0px;\">\r\n			<td style=\"margin: 0px; padding: 7px 5px 7px 10px; vertical-align: middle; border: 1px solid rgb(204, 204, 204);\">Алюминиевая конструкция для криволинейного многоуровневого потолка</td>\r\n			<td style=\"margin: 0px; padding: 7px 5px 7px 10px; vertical-align: middle; border: 1px solid rgb(204, 204, 204);\">1 м.п.</td>\r\n			<td style=\"margin: 0px; padding: 7px 5px 7px 10px; vertical-align: middle; border: 1px solid rgb(204, 204, 204);\">2830,00 руб.</td>\r\n		</tr>\r\n		<tr style=\"margin: 0px; padding: 0px;\">\r\n			<td style=\"margin: 0px; padding: 7px 5px 7px 10px; vertical-align: middle; border: 1px solid rgb(204, 204, 204); background-color: rgb(244, 250, 253);\">Конструкция для криволинейного многоуров. потолка с закарнизной подсветкой</td>\r\n			<td style=\"margin: 0px; padding: 7px 5px 7px 10px; vertical-align: middle; border: 1px solid rgb(204, 204, 204); background-color: rgb(244, 250, 253);\">1 м.п.</td>\r\n			<td style=\"margin: 0px; padding: 7px 5px 7px 10px; vertical-align: middle; border: 1px solid rgb(204, 204, 204); background-color: rgb(244, 250, 253);\">4170,00 руб.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3 style=\"margin: 0px; padding: 0px 0px 15px; font-size: 22px; line-height: 28px; font-family: PFDinDisplayProRegular;\">Особенности установки</h3>\r\n\r\n<p style=\"margin: 0px; padding: 0px 0px 14px; box-sizing: border-box; line-height: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px;\">Криволинейные натяжные потолки задают тон и создают необычную атмосферу. Команда профессионалов даст правильные рекомендации, благодаря которым можно подчеркнуть все достоинства и особенности интерьера.</p>\r\n\r\n<p style=\"margin: 0px; padding: 0px 0px 14px; box-sizing: border-box; line-height: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px;\">Качественная установка криволинейных натяжных потолков доступна только квалифицированным специалистам, умеющим работать в данной области. Специализированное оборудование, ускорит срок установки. А выбранный проект, создаст желаемые эффекты.</p>\r\n\r\n<p style=\"margin: 0px; padding: 0px 0px 14px; box-sizing: border-box; line-height: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px;\">Для того, чтобы установить сложные натяжные потолки необходим багет. Он устанавливается отдельно, в зависимости от количества уровней потолка рассчитанных по проекту. Крепление потолка, выполняется с учетом особенностей поверхности. Все коммуникации, стыки труб, внешние неровности, косметические дефекты и стационарные объекты, которые необходимо скрыть от постороннего глаза, располагаются над поверхностью полотна, не выдавая своего присутствия. По желанию заказчика, можно увеличить количество наклонных поверхностей, изменить количество уровней, добавить дополнительные элементы декора, скомбинировать фактуры, усилить световые эффекты и нанести фотопечать. В зависимости от сложности работ, время на крепление и установку занимает от 2 до 5 часов.</p>','Многоуровневые','Вы бы хотели действительно что-то изменить в Вашем интерьере ? Тогда многоуровневый натяжной потолок - это то что Вам нужно! Функциональный, скрывающий недостатки, придающий уникальность.','','','','2016-05-17 13:38:56','2016-05-21 01:42:13','ceilings/03422_standingontheedgeofinfinity_2880x1800.jpg',100.00);
/*!40000 ALTER TABLE `ceilings_ceiling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceilings_ceiling_advantages`
--

DROP TABLE IF EXISTS `ceilings_ceiling_advantages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceilings_ceiling_advantages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ceiling_id` int(11) NOT NULL,
  `advantages_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ceilings_ceiling_advantages_ceiling_id_8b0973bc_uniq` (`ceiling_id`,`advantages_id`),
  KEY `ceilings_ceiling_ad_advantages_id_4e34c2f5_fk_core_advantages_id` (`advantages_id`),
  CONSTRAINT `ceilings_ceiling_adva_ceiling_id_b72c358c_fk_ceilings_ceiling_id` FOREIGN KEY (`ceiling_id`) REFERENCES `ceilings_ceiling` (`id`),
  CONSTRAINT `ceilings_ceiling_ad_advantages_id_4e34c2f5_fk_core_advantages_id` FOREIGN KEY (`advantages_id`) REFERENCES `core_advantages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceilings_ceiling_advantages`
--

LOCK TABLES `ceilings_ceiling_advantages` WRITE;
/*!40000 ALTER TABLE `ceilings_ceiling_advantages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ceilings_ceiling_advantages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceilings_ceiling_filter`
--

DROP TABLE IF EXISTS `ceilings_ceiling_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceilings_ceiling_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ceiling_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ceilings_ceiling_filter_ceiling_id_ba403802_uniq` (`ceiling_id`,`filter_id`),
  KEY `ceilings_ceiling_filter_filter_id_6dbfa7b4_fk_ceilings_filter_id` (`filter_id`),
  CONSTRAINT `ceilings_ceiling_filter_filter_id_6dbfa7b4_fk_ceilings_filter_id` FOREIGN KEY (`filter_id`) REFERENCES `ceilings_filter` (`id`),
  CONSTRAINT `ceilings_ceiling_filt_ceiling_id_5bd3f825_fk_ceilings_ceiling_id` FOREIGN KEY (`ceiling_id`) REFERENCES `ceilings_ceiling` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceilings_ceiling_filter`
--

LOCK TABLES `ceilings_ceiling_filter` WRITE;
/*!40000 ALTER TABLE `ceilings_ceiling_filter` DISABLE KEYS */;
INSERT INTO `ceilings_ceiling_filter` VALUES (1,1,7),(2,2,9),(3,3,8),(7,4,7),(4,4,8),(5,4,9),(6,4,11);
/*!40000 ALTER TABLE `ceilings_ceiling_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceilings_ceilingimage`
--

DROP TABLE IF EXISTS `ceilings_ceilingimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceilings_ceilingimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `cropping` varchar(255) NOT NULL,
  `cropping_250x375` varchar(255) NOT NULL,
  `cropping_750x455` varchar(255) NOT NULL,
  `ceiling_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ceilings_ceilingimage_ceiling_id_31df1577_fk_ceilings_ceiling_id` (`ceiling_id`),
  CONSTRAINT `ceilings_ceilingimage_ceiling_id_31df1577_fk_ceilings_ceiling_id` FOREIGN KEY (`ceiling_id`) REFERENCES `ceilings_ceiling` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceilings_ceilingimage`
--

LOCK TABLES `ceilings_ceilingimage` WRITE;
/*!40000 ALTER TABLE `ceilings_ceilingimage` DISABLE KEYS */;
INSERT INTO `ceilings_ceilingimage` VALUES (1,'ceilings/01.jpg','42,0,658,394','219,0,482,394','26,0,676,394',4),(2,'ceilings/02_UZ3Y07I.jpg','42,0,658,394','219,0,482,394','26,0,676,394',4),(3,'ceilings/03.jpg','42,0,658,394','219,0,482,394','26,0,676,394',4),(4,'ceilings/glanceviy_natagnoy_potolok_kukhnia_1.JPG','0,185,3264,2274','816,0,2448,2448','0,239,3264,2220',1),(5,'ceilings/zhbi-natjazhnyje-potolki.jpg','0,45,800,557','200,0,600,600','0,56,800,541',1),(6,'ceilings/68.jpg','31,0,1116,693','344,0,807,693','0,0,1145,693',2),(7,'ceilings/satinovyj-potolok8_4Z4ldEs.jpg','0,46,3456,2258','956,0,2492,2304','0,104,3456,2200',2),(8,'ceilings/10060650.jpg','48,0,752,450','250,0,550,450','29,0,771,450',3),(9,'ceilings/1.jpg','0,37,800,549','205,0,595,586','0,50,800,536',3),(10,'ceilings/matovie.jpg','0,220,4000,2780','1000,0,3000,3000','0,287,4000,2713',3);
/*!40000 ALTER TABLE `ceilings_ceilingimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceilings_filter`
--

DROP TABLE IF EXISTS `ceilings_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceilings_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `text` longtext NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `meta_title` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `ceilings_filter_caf7cc51` (`lft`),
  KEY `ceilings_filter_3cfbd988` (`rght`),
  KEY `ceilings_filter_656442a0` (`tree_id`),
  KEY `ceilings_filter_c9e9a848` (`level`),
  KEY `ceilings_filter_6be37982` (`parent_id`),
  KEY `ceilings_filter_94757cae` (`type_id`),
  CONSTRAINT `ceilings_filter_parent_id_76a51d4b_fk_ceilings_filter_id` FOREIGN KEY (`parent_id`) REFERENCES `ceilings_filter` (`id`),
  CONSTRAINT `ceilings_filter_type_id_9d96a3e7_fk_ceilings_filtertype_id` FOREIGN KEY (`type_id`) REFERENCES `ceilings_filtertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceilings_filter`
--

LOCK TABLES `ceilings_filter` WRITE;
/*!40000 ALTER TABLE `ceilings_filter` DISABLE KEYS */;
INSERT INTO `ceilings_filter` VALUES (1,'На кухне','na-kuhne','','','','2016-05-17 13:00:55','2016-05-17 13:00:55',1,2,1,0,NULL,1,''),(2,'В ванной','v-vannoj','','','','2016-05-17 13:01:10','2016-05-17 13:01:10',1,2,2,0,NULL,1,''),(3,'В детской','v-detskoj','','','','2016-05-17 13:01:19','2016-05-17 13:01:19',1,2,3,0,NULL,1,''),(4,'В гостинной','v-gostinnoj','','','','2016-05-17 13:01:27','2016-05-17 13:01:27',1,2,4,0,NULL,1,''),(5,'в спальне','v-spalne','','','','2016-05-17 13:01:34','2016-05-17 13:01:34',1,2,5,0,NULL,1,''),(6,'в бассейне','v-bassejne','','','','2016-05-17 13:01:44','2016-05-17 13:01:44',1,2,6,0,NULL,1,''),(7,'Глянцевые','glyancevye','','','','2016-05-17 13:02:06','2016-05-17 13:02:06',1,2,7,0,NULL,2,''),(8,'Матовые','matovye','','','','2016-05-17 13:02:14','2016-05-17 13:02:14',1,2,8,0,NULL,2,''),(9,'Сатиновые','satinovye','','','','2016-05-17 13:02:21','2016-05-17 13:02:21',1,2,9,0,NULL,2,''),(10,'Фотопечать','fotopechat','','','','2016-05-17 13:02:43','2016-05-17 13:02:43',1,2,10,0,NULL,3,''),(11,'Многоуровневые','mnogourovnevye','<p style=\"margin: 0px; padding: 0px 0px 14px; box-sizing: border-box; line-height: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px;\">Желая создать неповторимый дизайн интерьера, скрыть множество внешних недостатков и придать помещению ухоженный вид, профессионалы выбирают многоуровневые натяжные потолки для достижения всех необходимых характеристик. Благодаря правильно подобранному потолку, можно получить несколько функциональных зон, визуально изменить параметры комнаты, создать новую форму помещения.</p>\r\n\r\n<p style=\"margin: 0px; padding: 0px 0px 14px; box-sizing: border-box; line-height: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px;\">Компания ГЕНВИК создает оригинальные проекты с учетом специфических особенностей любого помещения. Используя в своей работе современные материалы, последние разработки, широкую палитру цветов и множество фактур, специалисты компании добиваются уникальных результатов, способных стать украшением каждого заведения.</p>','','','2016-05-17 13:03:26','2016-05-17 22:02:45',1,2,11,0,NULL,3,''),(12,'Звездное небо','zvezdnoe-nebo','','','','2016-05-17 13:03:33','2016-05-17 13:03:33',1,2,12,0,NULL,3,''),(13,'Dexfort','dexfort','','','','2016-05-17 13:03:54','2016-05-17 13:03:54',1,2,13,0,NULL,4,''),(14,'Elegranto','elegranto','','','','2016-05-17 13:04:07','2016-05-17 13:04:07',1,2,14,0,NULL,4,''),(15,'Arridel','arridel','','','','2016-05-17 13:04:16','2016-05-17 13:04:16',1,2,15,0,NULL,4,''),(16,'Ecofole','ecofole','','','','2016-05-17 13:04:25','2016-05-17 13:04:25',1,2,16,0,NULL,4,''),(17,'Cool Stretch','cool-stretch','','','','2016-05-17 13:04:34','2016-05-17 13:04:34',1,2,17,0,NULL,4,''),(18,'Тканевые','tkanevye','<p>тканевые</p>','','','2016-05-21 19:34:02','2016-05-21 19:34:02',1,2,18,0,NULL,2,'');
/*!40000 ALTER TABLE `ceilings_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceilings_filter_advantages`
--

DROP TABLE IF EXISTS `ceilings_filter_advantages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceilings_filter_advantages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_id` int(11) NOT NULL,
  `advantages_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ceilings_filter_advantages_filter_id_2a6bf955_uniq` (`filter_id`,`advantages_id`),
  KEY `ceilings_filter_adv_advantages_id_dddd69f7_fk_core_advantages_id` (`advantages_id`),
  CONSTRAINT `ceilings_filter_advanta_filter_id_d43aad86_fk_ceilings_filter_id` FOREIGN KEY (`filter_id`) REFERENCES `ceilings_filter` (`id`),
  CONSTRAINT `ceilings_filter_adv_advantages_id_dddd69f7_fk_core_advantages_id` FOREIGN KEY (`advantages_id`) REFERENCES `core_advantages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceilings_filter_advantages`
--

LOCK TABLES `ceilings_filter_advantages` WRITE;
/*!40000 ALTER TABLE `ceilings_filter_advantages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ceilings_filter_advantages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceilings_filteradvantages`
--

DROP TABLE IF EXISTS `ceilings_filteradvantages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceilings_filteradvantages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ceilings_filteradvantag_filter_id_ba99ebaf_fk_ceilings_filter_id` (`filter_id`),
  CONSTRAINT `ceilings_filteradvantag_filter_id_ba99ebaf_fk_ceilings_filter_id` FOREIGN KEY (`filter_id`) REFERENCES `ceilings_filter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceilings_filteradvantages`
--

LOCK TABLES `ceilings_filteradvantages` WRITE;
/*!40000 ALTER TABLE `ceilings_filteradvantages` DISABLE KEYS */;
INSERT INTO `ceilings_filteradvantages` VALUES (1,'Отличный дизайн',11),(2,'Высокая скорость устройства',11),(3,'Решение практически любой дизайнерской мысли',11);
/*!40000 ALTER TABLE `ceilings_filteradvantages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceilings_filtertype`
--

DROP TABLE IF EXISTS `ceilings_filtertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceilings_filtertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `text` longtext NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `meta_title` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceilings_filtertype`
--

LOCK TABLES `ceilings_filtertype` WRITE;
/*!40000 ALTER TABLE `ceilings_filtertype` DISABLE KEYS */;
INSERT INTO `ceilings_filtertype` VALUES (1,'По пременению','po-premeneniyu','','','','2016-05-17 13:00:18','2016-05-17 13:04:55',''),(2,'По фактуре','po-fakture','<p>Натяжные потолки настолько глубоко и повсеместно вошли в сферу строительства и отделки, что на сегодняшний день действительно сложно представить современный ремонт без использования глянцевых или сатиновых натяжных потолков. Это не удивительно, ведь Вы можете позволить себе абсолютный полет фантазии и действительно, с применением современных подходов и решений к установке натяжных потолков и с развитием используемых материалов, Вы действительно увидите у себя в квартире или офисе желаемый результат. Многоуровневые конструкции, перфорированные потолки, светильники различного типа и мощности и все это качественно и по действительно не высокой цене. Наши мастера работают в этой сфере 5 лет. Мы имеем крепкий и надежный опыт для устройства потолки любой сложности. Это невероятно но Вы можете наслаждаться обновленным и неповторимым интерьером всего спустя 2-3 дня после принятия решения.&nbsp;<br />\r\nКомпания &laquo;Потолок Лайк&raquo; рада оказать Вам свои услуги. Мы благодарны нашим клиентам за добрые отзывы о нашей компании и надеемся что сможем быть полезны и Вам.</p>','','','2016-05-17 13:01:53','2016-05-21 15:34:55',''),(3,'По типу','po-tipu','','','','2016-05-17 13:02:33','2016-05-17 13:04:50',''),(4,'По брендам','po-brendam','','','','2016-05-17 13:03:44','2016-05-17 13:03:44','');
/*!40000 ALTER TABLE `ceilings_filtertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceilings_filtertype_advantages`
--

DROP TABLE IF EXISTS `ceilings_filtertype_advantages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceilings_filtertype_advantages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filtertype_id` int(11) NOT NULL,
  `advantages_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ceilings_filtertype_advantages_filtertype_id_0588d97b_uniq` (`filtertype_id`,`advantages_id`),
  KEY `ceilings_filtertype_advantages_id_23761a19_fk_core_advantages_id` (`advantages_id`),
  CONSTRAINT `ceilings_filter_filtertype_id_0040cc28_fk_ceilings_filtertype_id` FOREIGN KEY (`filtertype_id`) REFERENCES `ceilings_filtertype` (`id`),
  CONSTRAINT `ceilings_filtertype_advantages_id_23761a19_fk_core_advantages_id` FOREIGN KEY (`advantages_id`) REFERENCES `core_advantages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceilings_filtertype_advantages`
--

LOCK TABLES `ceilings_filtertype_advantages` WRITE;
/*!40000 ALTER TABLE `ceilings_filtertype_advantages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ceilings_filtertype_advantages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs_aditionallink`
--

DROP TABLE IF EXISTS `configs_aditionallink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs_aditionallink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `machine_name` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `config_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configs_aditionallink_d1738a90` (`config_id`),
  CONSTRAINT `configs_aditionallink_config_id_bb5dce3d_fk_configs_config_id` FOREIGN KEY (`config_id`) REFERENCES `configs_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs_aditionallink`
--

LOCK TABLES `configs_aditionallink` WRITE;
/*!40000 ALTER TABLE `configs_aditionallink` DISABLE KEYS */;
/*!40000 ALTER TABLE `configs_aditionallink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs_config`
--

DROP TABLE IF EXISTS `configs_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(200) NOT NULL,
  `site_description` longtext NOT NULL,
  `site_id` int(11) NOT NULL,
  `site_logo` varchar(100) NOT NULL,
  `site_email` varchar(200) NOT NULL,
  `site_address` varchar(200) NOT NULL,
  `site_logo2` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`),
  CONSTRAINT `configs_config_site_id_dd417ee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs_config`
--

LOCK TABLES `configs_config` WRITE;
/*!40000 ALTER TABLE `configs_config` DISABLE KEYS */;
INSERT INTO `configs_config` VALUES (1,'Натяжные потолки Potolok Like','описание',2,'config/logo-monolit.png','joyus@bitrix24.ru','Дзержинского 226','config/logo-monolit_on36jWJ.png');
/*!40000 ALTER TABLE `configs_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs_sitephone`
--

DROP TABLE IF EXISTS `configs_sitephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs_sitephone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_phone` varchar(200) NOT NULL,
  `is_main` tinyint(1) NOT NULL,
  `config_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configs_sitephone_config_id_95b14dd4_fk_configs_config_id` (`config_id`),
  CONSTRAINT `configs_sitephone_config_id_95b14dd4_fk_configs_config_id` FOREIGN KEY (`config_id`) REFERENCES `configs_config` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs_sitephone`
--

LOCK TABLES `configs_sitephone` WRITE;
/*!40000 ALTER TABLE `configs_sitephone` DISABLE KEYS */;
INSERT INTO `configs_sitephone` VALUES (1,'+7 (900) 270 25 95',1,1);
/*!40000 ALTER TABLE `configs_sitephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_advantages`
--

DROP TABLE IF EXISTS `core_advantages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_advantages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short` varchar(50) NOT NULL,
  `long` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_advantages`
--

LOCK TABLES `core_advantages` WRITE;
/*!40000 ALTER TABLE `core_advantages` DISABLE KEYS */;
INSERT INTO `core_advantages` VALUES (1,'Мы делаем больше чем Вы ожидаете','<p>Уровень клиентского обслуживания опережает Ваши ожидания &mdash; компания &quot;Potolok Like&quot; с максимальным вниманием относится к каждому клиенту.</p>'),(2,'Гарантия качества','<p>Монтаж осуществляется быстро и безопасно силами сертифицированных специалистов, на все работы и материалы предоставляется гарантия до 15 лет.</p>'),(3,'Безопасность и комфорт','<p>Наши натяжные потолки безвредны для здоровья. Производственные материалы свободны от аллергенов и токсичных компонентов, отвечают всем гигиеническим и пожарным требованиям безопасности. Компания обеспечивает бесплатный выезд на дом менеджера-консультанта для проведения тщательных замеров и расчета стоимости.</p>');
/*!40000 ALTER TABLE `core_advantages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_page`
--

DROP TABLE IF EXISTS `core_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `meta_title` varchar(80) NOT NULL,
  `preview_name` varchar(50) NOT NULL,
  `preview_text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_page`
--

LOCK TABLES `core_page` WRITE;
/*!40000 ALTER TABLE `core_page` DISABLE KEYS */;
INSERT INTO `core_page` VALUES (1,'Контакты','contacts','contacts','<p>contacts</p>','','','2016-05-20 12:27:01','2016-05-20 16:34:01','','contacts','contacts'),(2,'О нас','o-nas','o-nas','<p>Натяжные потолки - созданы что бы удивлять и дарить по-настоящему комфортные ощущения в местах где они установлены. Это превосходное изобретение для быстрого и качественного благоустройства Вашего интерьера действительно придется по душе каждому. Короткие сроки установки, простота ухода и, главное, прятный эстетический вид - не оставят Вас равнодушными к этому эллементу интерьера.&nbsp;</p>\r\n\r\n<p>На сегодняшний день многие говорят об этих замечательных качествах натяжных потолков и компания &quot;Potolok Like&quot;&nbsp;будет&nbsp;рада&nbsp;помочь Вам стать вледельцем столь красивого решения в Вашем интерьере.</p>\r\n\r\n<p>&quot;Potolok Like&quot; - это прежде всего качество и забота о результате, мы убеждены что достойное исполенине нашей работы всегда будет вознаграждено благодарностью наших клиентов, поэтому мы используем только качественные материалы и оборудование в&nbsp;производстве и установке натяжных потолков.</p>','','','2016-05-20 12:39:35','2016-05-25 23:13:02','','o-nas','o-nas'),(3,'Натяжные потолки','natyazhnye-potolki','???','<p>Натяжные потолки настолько глубоко и повсеместно вошли в сферу строительства и отделки, что на сегодняшний день действительно сложно представить современный ремонт без использования глянцевых или сатиновых натяжных потолков. Это не удивительно, ведь Вы можете позволить себе абсолютный полет фантазии и действительно, с применением современных подходов и решений к установке натяжных потолков и с развитием используемых материалов, Вы действительно увидите у себя в квартире или офисе желаемый результат. Многоуровневые конструкции, перфорированные потолки, светильники различного типа и мощности и все это качественно и по действительно не высокой цене. Наши мастера работают в этой сфере 5 лет. Мы имеем крепкий и надежный опыт для устройства потолки любой сложности. Это невероятно но Вы можете наслаждаться обновленным и неповторимым интерьером всего спустя 2-3 дня после принятия решения.&nbsp;<br />\r\nКомпания &laquo;Потолок Лайк&raquo; рада оказать Вам свои услуги. Мы благодарны нашим клиентам за добрые отзывы о нашей компании и надеемся что сможем быть полезны и Вам.</p>','','Натяжные потолки от компании \"Потолок Лайк\"','2016-05-21 15:43:15','2016-05-21 15:43:15','натяжные потолки','Натяжные потолки','Каждый хочет что бы его жилье было действительно красивым и удобным. Именно по-поэтому мы говорим о том что натяжные потолки - это лучший а может и единственный претендент на это место не только для неискушенного жителя нашей большой страны но и для человека вкусы которого требуют детальной проработки.'),(4,'Акции','akcii','?','<p>акции</p>','','','2016-05-23 11:57:02','2016-05-23 11:57:06','','Акции','Акции на натяжные потолки'),(5,'Цены','ceny','???','<div class=\"akciya\">\r\n<p>Заказ до 10 м.кв =4000 р</p>\r\n\r\n<p>Заказ свыше 70 м.кв = монтаж осветительных приборов <span>бесплатно</span></p>\r\n\r\n<p>Заказ свыше 100 м.кв =скидка <span>10%</span> от стоимости заказа</p>\r\n</div>\r\n\r\n<div class=\"bs-example\">\r\n<table class=\"table table-striped\">\r\n	<thead>\r\n		<tr>\r\n			<th>Производитель</th>\r\n			<th>Тип полотна</th>\r\n			<th>Размер полотна</th>\r\n			<th>Цена</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Китай,Бельгия</td>\r\n			<td>Глянец, сатин, матовый</td>\r\n			<td>200,270,320</td>\r\n			<td>400р; &nbsp;белый-350р</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Германия</td>\r\n			<td>Глянец, сатин, матовый</td>\r\n			<td>200,270,320</td>\r\n			<td>500р</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Китай,Бельгия</td>\r\n			<td>Глянец, сатин, матовый</td>\r\n			<td>400,500</td>\r\n			<td>500р; белый-450р</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Франция до-30</td>\r\n			<td>Мат,сатин 303</td>\r\n			<td>270,320</td>\r\n			<td>800р</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Бельгия</td>\r\n			<td>Искры</td>\r\n			<td>110,140</td>\r\n			<td>700р</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Германия</td>\r\n			<td>Металлик</td>\r\n			<td>130,150</td>\r\n			<td>700р</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Санкт-петербург</td>\r\n			<td>Фотопечать</td>\r\n			<td>За 1 кв м</td>\r\n			<td>2000р</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Волгоград</td>\r\n			<td>Фотопечать</td>\r\n			<td>За 1 кв м</td>\r\n			<td>1700р</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Бельгия</td>\r\n			<td>Фотопечать ГОТОВАЯ</td>\r\n			<td>150,320</td>\r\n			<td>700р</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\r\n<div class=\"highlight\">\r\n<p><strong>Многоуровневые конструкции </strong>от 2000р за м.п.+общая квадратура</p>\r\n\r\n<p><strong>Волна</strong> 800-1000р м.п.</p>\r\n\r\n<p><strong>Установка &quot;Звездное небо&quot;</strong> 6000р кв.м, заказ от 20 кв.м</p>\r\n\r\n<p><strong>Комбинирование цвета</strong> - 500р м.п.</p>\r\n\r\n<p><strong>Парящий потолок</strong> - 1000р м.п. + общая квадратура</p>\r\n\r\n<p><strong>Перфорированный потолок</strong> - от 1500р кв.м (2 полотна)</p>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div class=\"bs-example\">\r\n<p>&nbsp;</p>\r\n\r\n<h2><strong>&nbsp;Дополнительные работы</strong></h2>\r\n\r\n<table class=\"table table-striped\">\r\n	<thead>\r\n		<tr>\r\n			<th>Наименование услуги</th>\r\n			<th>Стоимость услуги</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Обход трубы</td>\r\n			<td>400р м.п</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Монтаж плинтуса (наклейка+покраска)</td>\r\n			<td>100р м.п</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Сверление по кафелю</td>\r\n			<td>100р м.п</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Внутренний вырез</td>\r\n			<td>500р м.п</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Разделительный багет</td>\r\n			<td>500р м.п</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Декоративная вставка белая</td>\r\n			<td>50р.м.п</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Декоративная вставка цветная</td>\r\n			<td>100р м.п</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>','','','2016-05-23 12:15:50','2016-05-25 21:44:18','','цены на натяжные потолки','цены на натяжные потолки указаны для Новороссийска');
/*!40000 ALTER TABLE `core_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_page_advantages`
--

DROP TABLE IF EXISTS `core_page_advantages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_page_advantages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `advantages_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_page_advantages_page_id_b967c44d_uniq` (`page_id`,`advantages_id`),
  KEY `core_page_advantage_advantages_id_ae397377_fk_core_advantages_id` (`advantages_id`),
  CONSTRAINT `core_page_advantages_page_id_fd5e531e_fk_core_page_id` FOREIGN KEY (`page_id`) REFERENCES `core_page` (`id`),
  CONSTRAINT `core_page_advantage_advantages_id_ae397377_fk_core_advantages_id` FOREIGN KEY (`advantages_id`) REFERENCES `core_advantages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_page_advantages`
--

LOCK TABLES `core_page_advantages` WRITE;
/*!40000 ALTER TABLE `core_page_advantages` DISABLE KEYS */;
INSERT INTO `core_page_advantages` VALUES (1,2,1),(2,2,2),(3,2,3);
/*!40000 ALTER TABLE `core_page_advantages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_partner`
--

DROP TABLE IF EXISTS `core_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_partner`
--

LOCK TABLES `core_partner` WRITE;
/*!40000 ALTER TABLE `core_partner` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_post`
--

DROP TABLE IF EXISTS `core_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `meta_title` varchar(80) NOT NULL,
  `preview_name` varchar(50) NOT NULL,
  `preview_text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_post`
--

LOCK TABLES `core_post` WRITE;
/*!40000 ALTER TABLE `core_post` DISABLE KEYS */;
INSERT INTO `core_post` VALUES (1,'Новая статья','novaya-statya','???','<p>текст</p>','','','2016-05-20 16:35:42','2016-05-20 16:47:46','services/4576.jpg','','статья','статья');
/*!40000 ALTER TABLE `core_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_post_advantages`
--

DROP TABLE IF EXISTS `core_post_advantages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_post_advantages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `advantages_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_post_advantages_post_id_64af940d_uniq` (`post_id`,`advantages_id`),
  KEY `core_post_advantage_advantages_id_8ad74a8d_fk_core_advantages_id` (`advantages_id`),
  CONSTRAINT `core_post_advantages_post_id_fb9d77cb_fk_core_post_id` FOREIGN KEY (`post_id`) REFERENCES `core_post` (`id`),
  CONSTRAINT `core_post_advantage_advantages_id_8ad74a8d_fk_core_advantages_id` FOREIGN KEY (`advantages_id`) REFERENCES `core_advantages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_post_advantages`
--

LOCK TABLES `core_post_advantages` WRITE;
/*!40000 ALTER TABLE `core_post_advantages` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_post_advantages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_review`
--

DROP TABLE IF EXISTS `core_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `text` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_title` varchar(80) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_review`
--

LOCK TABLES `core_review` WRITE;
/*!40000 ALTER TABLE `core_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_review_advantages`
--

DROP TABLE IF EXISTS `core_review_advantages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_review_advantages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `advantages_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_review_advantages_review_id_be756255_uniq` (`review_id`,`advantages_id`),
  KEY `core_review_advanta_advantages_id_5382df3b_fk_core_advantages_id` (`advantages_id`),
  CONSTRAINT `core_review_advantages_review_id_46f67a83_fk_core_review_id` FOREIGN KEY (`review_id`) REFERENCES `core_review` (`id`),
  CONSTRAINT `core_review_advanta_advantages_id_5382df3b_fk_core_advantages_id` FOREIGN KEY (`advantages_id`) REFERENCES `core_advantages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_review_advantages`
--

LOCK TABLES `core_review_advantages` WRITE;
/*!40000 ALTER TABLE `core_review_advantages` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_review_advantages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_service`
--

DROP TABLE IF EXISTS `core_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `text` longtext NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `icon` varchar(200) NOT NULL,
  `is_home` tinyint(1) NOT NULL,
  `is_main` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `meta_title` varchar(80) NOT NULL,
  `preview_name` varchar(50) NOT NULL,
  `preview_text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_service`
--

LOCK TABLES `core_service` WRITE;
/*!40000 ALTER TABLE `core_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_service_advantages`
--

DROP TABLE IF EXISTS `core_service_advantages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_service_advantages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `advantages_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_service_advantages_service_id_728c811f_uniq` (`service_id`,`advantages_id`),
  KEY `core_service_advant_advantages_id_17ab381b_fk_core_advantages_id` (`advantages_id`),
  CONSTRAINT `core_service_advantages_service_id_2f5f7f25_fk_core_service_id` FOREIGN KEY (`service_id`) REFERENCES `core_service` (`id`),
  CONSTRAINT `core_service_advant_advantages_id_17ab381b_fk_core_advantages_id` FOREIGN KEY (`advantages_id`) REFERENCES `core_advantages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_service_advantages`
--

LOCK TABLES `core_service_advantages` WRITE;
/*!40000 ALTER TABLE `core_service_advantages` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_service_advantages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (3,'2016-05-20 14:41:19','4','godmen',1,'Добавлено.',4,2),(4,'2016-05-20 14:41:34','4','godmen',2,'Изменен is_staff и is_superuser.',4,2),(5,'2016-05-20 14:42:10','3','greenteamer',3,'',4,2),(6,'2016-05-20 14:42:10','1','test123',3,'',4,2),(7,'2016-05-20 14:42:21','2','admin',2,'Изменен email.',4,2),(8,'2016-05-20 16:19:21','5','Фото 5',2,'Изменен filter. Удален project image \"ProjectImage object\".',30,4),(9,'2016-05-20 16:19:30','5','Фото 5',2,'Добавлен project image \"ProjectImage object\".',30,4),(10,'2016-05-20 16:20:37','5','Фото 5',2,'Изменены image для project image \"ProjectImage object\".',30,4),(11,'2016-05-20 16:20:48','5','Фото 5',2,'Изменены image для project image \"ProjectImage object\".',30,4),(12,'2016-05-20 16:21:08','5','Фото 5',3,'',30,4),(13,'2016-05-20 16:21:08','4','Фото 4',3,'',30,4),(14,'2016-05-20 16:21:08','3','Фото 3',3,'',30,4),(15,'2016-05-20 16:21:08','2','Фото 2',3,'',30,4),(16,'2016-05-20 16:21:08','1','Фото 1',3,'',30,4),(17,'2016-05-20 16:21:24','6','Фото 1',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(18,'2016-05-20 16:28:43','6','Фото 1',2,'Изменены image для project image \"ProjectImage object\".',30,2),(19,'2016-05-20 16:29:39','4','Многоуровневые натяжные потолки',2,'Изменен image.',19,2),(20,'2016-05-20 16:31:02','1','base',1,'Добавлено.',14,2),(21,'2016-05-20 16:31:17','1','Каталог потолков',1,'Добавлено.',15,2),(22,'2016-05-20 16:34:01','1','Контакты',2,'Изменен name и text.',22,2),(23,'2016-05-20 16:35:42','1','Новая статья',1,'Добавлено.',23,2),(24,'2016-05-20 16:47:46','1','Новая статья',2,'Изменен image.',23,2),(25,'2016-05-20 16:48:22','6','Фото 1',2,'Изменены image для project image \"ProjectImage object\".',30,4),(26,'2016-05-20 16:48:35','6','Фото 1',2,'Изменены image для project image \"ProjectImage object\".',30,4),(27,'2016-05-20 17:05:06','7','Фото 2',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(28,'2016-05-20 17:05:11','7','Фото 2',2,'Изменены cropping и cropping_750x455 для project image \"ProjectImage object\".',30,4),(29,'2016-05-20 17:05:33','8','Фото 3',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(30,'2016-05-20 17:05:59','8','Фото 3',2,'Изменен filter. Изменены cropping и cropping_750x455 для project image \"ProjectImage object\".',30,4),(31,'2016-05-20 17:06:22','9','Фото 4',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(32,'2016-05-20 17:07:53','10','Фото 5',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(33,'2016-05-20 17:08:39','11','Фото 6',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(34,'2016-05-20 17:10:09','12','Фото 7',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(35,'2016-05-20 17:10:32','13','Фото 8',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(36,'2016-05-20 17:11:00','14','Фото 9',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(37,'2016-05-20 17:11:25','15','Фото 10',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(38,'2016-05-20 17:11:49','16','Фото 11',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(39,'2016-05-20 17:12:16','17','Фото 12',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(40,'2016-05-20 17:12:32','18','Фото 12',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(41,'2016-05-20 17:13:07','19','Фото 12',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(42,'2016-05-20 17:13:48','20','Фото 13',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(43,'2016-05-20 17:14:42','21','Фото 14',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(44,'2016-05-20 17:15:05','22','Фото 15',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(45,'2016-05-20 17:15:39','23','Фото 16',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(46,'2016-05-20 17:17:57','24','Фото 16',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(47,'2016-05-20 17:20:23','25','Фото 17',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(48,'2016-05-20 17:22:06','26','Фото 17',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(49,'2016-05-20 17:22:24','27','Фото 17',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(50,'2016-05-21 01:31:37','1','Глянцевые натяжные потолки',2,'Изменен preview_text.',19,2),(51,'2016-05-21 01:33:22','2','Сатиновые натяжные потолки',2,'Изменен preview_text.',19,2),(52,'2016-05-21 01:34:06','2','Сатиновые натяжные потолки',2,'Изменен preview_text.',19,2),(53,'2016-05-21 01:35:08','2','Сатиновые натяжные потолки',2,'Изменен preview_text.',19,2),(54,'2016-05-21 01:38:10','3','Матовые натяжные потолки',2,'Изменен preview_text.',19,2),(55,'2016-05-21 01:40:05','3','Матовые натяжные потолки',2,'Изменен preview_text.',19,2),(56,'2016-05-21 01:42:13','4','Многоуровневые натяжные потолки',2,'Изменен preview_text.',19,2),(57,'2016-05-21 11:37:40','2','О нас',2,'Изменен name и text.',22,2),(58,'2016-05-21 11:41:08','2','О нас',2,'Изменен text.',22,2),(59,'2016-05-21 12:35:27','1','Мы делаем больше чем Вы ожидаете',1,'Добавлено.',37,2),(60,'2016-05-21 12:35:48','2','Гарантия качества',1,'Добавлено.',37,2),(61,'2016-05-21 12:36:07','3','Безопасность и комфорт',1,'Добавлено.',37,2),(62,'2016-05-21 12:36:14','2','О нас',2,'Изменен advantages.',22,2),(63,'2016-05-21 12:42:37','2','О нас',1,'Добавлено.',15,2),(64,'2016-05-21 12:42:46','3','Контакты',1,'Добавлено.',15,2),(65,'2016-05-21 13:11:50','1','Глянцевые натяжные потолки',2,'Добавлен ceiling image \"CeilingImage object\". Добавлен ceiling image \"CeilingImage object\".',19,2),(66,'2016-05-21 14:25:26','1','Глянцевые натяжные потолки',2,'Изменен image. Изменены cropping и cropping_750x455 для ceiling image \"CeilingImage object\". Изменены cropping и cropping_750x455 для ceiling image \"CeilingImage object\".',19,2),(67,'2016-05-21 15:32:32','1','Глянцевые натяжные потолки',2,'Изменен text и price.',19,2),(68,'2016-05-21 15:33:07','1','Глянцевые натяжные потолки',2,'Изменен text.',19,2),(69,'2016-05-21 15:34:55','2','По фактуре',2,'Изменен text.',16,2),(70,'2016-05-21 15:43:15','3','Натяжные потолки',1,'Добавлено.',22,2),(71,'2016-05-21 15:45:14','2','О нас',2,'Изменен url.',15,2),(72,'2016-05-21 15:45:35','3','Контакты',2,'Изменен url.',15,2),(73,'2016-05-21 16:53:41','2','Сатиновые натяжные потолки',2,'Изменен image. Добавлен ceiling image \"CeilingImage object\". Добавлен ceiling image \"CeilingImage object\".',19,2),(74,'2016-05-21 18:57:31','26','Фото 18',2,'Изменен name. Изменены cropping и cropping_750x455 для project image \"ProjectImage object\".',30,4),(75,'2016-05-21 18:57:44','27','Фото 19',2,'Изменен name. Изменены cropping и cropping_750x455 для project image \"ProjectImage object\".',30,4),(76,'2016-05-21 18:58:46','28','Фото 20',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(77,'2016-05-21 19:00:02','29','Фото 21',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(78,'2016-05-21 19:07:16','30','Фото 23',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(79,'2016-05-21 19:07:34','31','Фото 24',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(80,'2016-05-21 19:07:58','32','Фото 25',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(81,'2016-05-21 19:08:59','33','Фото 26',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(82,'2016-05-21 19:09:12','34','Фото 26',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(83,'2016-05-21 19:09:27','35','Фото 27',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(84,'2016-05-21 19:09:43','36','Фото 28',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(85,'2016-05-21 19:10:09','37','Фото 28',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(86,'2016-05-21 19:10:27','38','Фото 29',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(87,'2016-05-21 19:11:03','39','Фото 30',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(88,'2016-05-21 19:11:17','40','Фото 31',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(89,'2016-05-21 19:11:30','41','Фото 32',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(90,'2016-05-21 19:11:44','42','Фото 33',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(91,'2016-05-21 19:12:05','43','Фото 34',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(92,'2016-05-21 19:12:55','44','Фото 35',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(93,'2016-05-21 19:13:09','45','Фото 36',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(94,'2016-05-21 19:14:47','46','Фото 37',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(95,'2016-05-21 19:15:12','47','Фото 38',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(96,'2016-05-21 19:16:26','48','Фото 39',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(97,'2016-05-21 19:17:55','49','Фото 40',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(98,'2016-05-21 19:18:09','50','Фото 41',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(99,'2016-05-21 19:18:28','51','Фото 42',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(100,'2016-05-21 19:18:45','52','Фото 43',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(101,'2016-05-21 19:19:07','53','Фото 44',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(102,'2016-05-21 19:20:03','54','Фото 45',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(103,'2016-05-21 19:20:17','55','Фото 46',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(104,'2016-05-21 19:20:30','56','Фото 47',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(105,'2016-05-21 19:20:51','57','Фото 48',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(106,'2016-05-21 19:21:02','58','Фото 49',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(107,'2016-05-21 19:21:21','59','Фото 50',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(108,'2016-05-21 19:21:33','60','Фото 51',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(109,'2016-05-21 19:25:43','61','Фото 53',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(110,'2016-05-21 19:25:57','62','Фото  54',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(111,'2016-05-21 19:26:11','63','Фото 55',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(112,'2016-05-21 19:26:26','64','Фото 54',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(113,'2016-05-21 19:26:42','65','Фото 56',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(114,'2016-05-21 19:27:01','66','Фото 57',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(115,'2016-05-21 19:27:33','67','Фото  58',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(116,'2016-05-21 19:27:48','68','Фото 59',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(117,'2016-05-21 19:28:06','69','Фото 60',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(118,'2016-05-21 19:28:18','70','Фото 61',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(119,'2016-05-21 19:28:33','71','Фото 62',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(120,'2016-05-21 19:29:01','72','Фото 63',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(121,'2016-05-21 19:29:11','73','Фото 64',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(122,'2016-05-21 19:29:27','74','Фото 65',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(123,'2016-05-21 19:29:53','75','Фото  65',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(124,'2016-05-21 19:30:12','76','Фото  66',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(125,'2016-05-21 19:34:02','18','Тканевые',1,'Добавлено.',17,4),(126,'2016-05-21 19:34:22','77','Фото  67',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(127,'2016-05-21 19:34:39','78','Фото 68',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(128,'2016-05-21 19:34:58','79','Фото 69',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(129,'2016-05-21 19:35:12','80','Фото 70',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(130,'2016-05-21 19:35:29','81','Фото  71',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(131,'2016-05-21 19:35:47','82','Фото 72',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(132,'2016-05-21 19:36:03','83','Фото 73',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(133,'2016-05-21 19:36:19','84','Фото 74',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(134,'2016-05-21 19:36:51','85','Фото 75',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(135,'2016-05-21 19:37:05','86','Фото 76',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(136,'2016-05-21 19:37:25','87','Фото 77',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(137,'2016-05-21 19:37:45','88','Фото 78',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(138,'2016-05-21 19:38:07','89','Фото 79',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(139,'2016-05-21 19:38:37','90','Фото 80',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(140,'2016-05-21 19:38:55','91','Фото 90',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(141,'2016-05-21 19:39:08','92','Фото 91',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(142,'2016-05-21 19:39:33','93','Фото 92',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(143,'2016-05-21 19:39:48','94','Фото 93',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(144,'2016-05-21 19:40:02','95','Фото 94',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(145,'2016-05-21 19:40:16','96','Фото 95',1,'Добавлено. Добавлен project image \"ProjectImage object\".',30,4),(146,'2016-05-23 10:31:30','2','potolok-like.ru',2,'Изменен domain.',7,2),(147,'2016-05-23 10:31:37','2','potolok-like.ru',2,'Изменен name.',7,2),(148,'2016-05-23 11:31:59','2','Сатиновые натяжные потолки',2,'Изменен text. Изменены cropping, cropping_250x375 и cropping_750x455 для ceiling image \"CeilingImage object\". Изменены cropping_250x375 для ceiling image \"CeilingImage object\".',19,2),(149,'2016-05-23 11:54:07','3','Матовые натяжные потолки',2,'Изменен text.',19,2),(150,'2016-05-23 11:56:44','3','Матовые натяжные потолки',2,'Изменен text.',19,2),(151,'2016-05-23 11:57:02','4','Акции',1,'Добавлено.',22,4),(152,'2016-05-23 11:57:06','4','Акции',2,'Ни одно поле не изменено.',22,4),(153,'2016-05-23 11:58:30','4','Акции',1,'Добавлено.',15,4),(154,'2016-05-23 11:59:03','4','Акции',2,'Изменен url.',15,4),(155,'2016-05-23 11:59:18','4','Акции',2,'Ни одно поле не изменено.',15,4),(156,'2016-05-23 12:03:30','3','Матовые натяжные потолки',2,'Изменен text и price.',19,2),(157,'2016-05-23 12:04:25','3','Матовые натяжные потолки',2,'Изменен text.',19,2),(158,'2016-05-23 12:05:04','2','Сатиновые натяжные потолки',2,'Изменен price.',19,2),(159,'2016-05-23 12:07:04','3','Матовые натяжные потолки',2,'Добавлен ceiling image \"CeilingImage object\". Добавлен ceiling image \"CeilingImage object\". Добавлен ceiling image \"CeilingImage object\".',19,2),(160,'2016-05-23 12:15:50','5','Цены',1,'Добавлено.',22,2),(161,'2016-05-23 12:16:06','1','base',2,'Ни одно поле не изменено.',14,2),(162,'2016-05-23 12:16:28','5','Цены',1,'Добавлено.',15,2),(163,'2016-05-23 13:06:24','3','Контакты',2,'Изменен url.',15,2),(164,'2016-05-23 13:07:12','4','Акции',2,'Изменен hidden.',15,2),(165,'2016-05-25 21:44:18','5','Цены',2,'Изменен text.',22,4),(166,'2016-05-25 22:46:06','1','Натяжные потолки Joy Us',2,'Изменен site_email. Изменены site_phone для Телефон сайта \"+7 (900) 270 25 95\".',26,4),(167,'2016-05-25 22:47:07','1','Натяжные потолки Potolok Like',2,'Изменен site_name.',26,4),(168,'2016-05-25 23:13:02','2','О нас',2,'Изменен text.',22,4),(169,'2016-05-25 23:16:51','1','Мы делаем больше чем Вы ожидаете',2,'Изменен long.',37,4);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'account','emailaddress'),(10,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(19,'ceilings','ceiling'),(20,'ceilings','ceilingimage'),(17,'ceilings','filter'),(18,'ceilings','filteradvantages'),(16,'ceilings','filtertype'),(28,'configs','aditionallink'),(26,'configs','config'),(27,'configs','sitephone'),(5,'contenttypes','contenttype'),(37,'core','advantages'),(22,'core','page'),(25,'core','partner'),(23,'core','post'),(24,'core','review'),(21,'core','service'),(32,'easy_thumbnails','source'),(33,'easy_thumbnails','thumbnail'),(34,'easy_thumbnails','thumbnaildimensions'),(29,'flatblocks','flatblock'),(8,'redirects','redirect'),(36,'robots','rule'),(35,'robots','url'),(6,'sessions','session'),(30,'siteprojects','project'),(31,'siteprojects','projectimage'),(7,'sites','site'),(14,'sitetree','tree'),(15,'sitetree','treeitem'),(12,'socialaccount','socialaccount'),(11,'socialaccount','socialapp'),(13,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-05-20 12:02:21'),(2,'auth','0001_initial','2016-05-20 12:02:26'),(3,'account','0001_initial','2016-05-20 12:02:27'),(4,'account','0002_email_max_length','2016-05-20 12:02:28'),(5,'admin','0001_initial','2016-05-20 12:02:28'),(6,'admin','0002_logentry_remove_auto_add','2016-05-20 12:02:29'),(7,'contenttypes','0002_remove_content_type_name','2016-05-20 12:02:29'),(8,'auth','0002_alter_permission_name_max_length','2016-05-20 12:02:29'),(9,'auth','0003_alter_user_email_max_length','2016-05-20 12:02:30'),(10,'auth','0004_alter_user_username_opts','2016-05-20 12:02:30'),(11,'auth','0005_alter_user_last_login_null','2016-05-20 12:02:30'),(12,'auth','0006_require_contenttypes_0002','2016-05-20 12:02:30'),(13,'auth','0007_alter_validators_add_error_messages','2016-05-20 12:02:30'),(14,'core','0001_initial','2016-05-20 12:02:30'),(15,'core','0002_auto_20160307_2012','2016-05-20 12:02:31'),(16,'core','0003_auto_20160307_2040','2016-05-20 12:02:31'),(17,'core','0004_post','2016-05-20 12:02:32'),(18,'core','0005_review','2016-05-20 12:02:32'),(19,'core','0006_auto_20160307_2129','2016-05-20 12:02:32'),(20,'core','0007_auto_20160307_2129','2016-05-20 12:02:32'),(21,'core','0008_auto_20160307_2140','2016-05-20 12:02:32'),(22,'core','0009_auto_20160307_2143','2016-05-20 12:02:32'),(23,'core','0010_auto_20160307_2237','2016-05-20 12:02:33'),(24,'core','0011_auto_20160309_0638','2016-05-20 12:02:33'),(25,'core','0012_post_image','2016-05-20 12:02:34'),(26,'core','0013_notes','2016-05-20 12:02:34'),(27,'core','0014_page_meta_title','2016-05-20 12:02:34'),(28,'core','0015_auto_20160420_1316','2016-05-20 12:02:35'),(29,'core','0016_category','2016-05-20 12:02:36'),(30,'core','0017_page_category','2016-05-20 12:02:37'),(31,'core','0018_auto_20160503_1329','2016-05-20 12:02:38'),(32,'core','0019_auto_20160503_1729','2016-05-20 12:02:39'),(33,'ceilings','0001_initial','2016-05-20 12:02:41'),(34,'ceilings','0002_auto_20160514_2010','2016-05-20 12:02:48'),(35,'ceilings','0003_auto_20160514_2114','2016-05-20 12:02:57'),(36,'ceilings','0004_auto_20160514_2120','2016-05-20 12:02:59'),(37,'ceilings','0005_auto_20160514_2133','2016-05-20 12:02:59'),(38,'ceilings','0006_auto_20160517_1852','2016-05-20 12:02:59'),(39,'ceilings','0007_ceiling_price','2016-05-20 12:02:59'),(40,'ceilings','0008_ceilingimage','2016-05-20 12:03:00'),(41,'ceilings','0009_filteradvantages','2016-05-20 12:03:00'),(42,'ceilings','0010_auto_20160517_2201','2016-05-20 12:03:01'),(43,'ceilings','0011_auto_20160519_1259','2016-05-20 12:03:03'),(44,'ceilings','0012_auto_20160519_1304','2016-05-20 12:03:03'),(45,'sites','0001_initial','2016-05-20 12:03:03'),(46,'configs','0001_initial','2016-05-20 12:03:04'),(47,'configs','0002_config_site','2016-05-20 12:03:05'),(48,'configs','0003_auto_20160218_0645','2016-05-20 12:03:05'),(49,'configs','0004_auto_20160305_1155','2016-05-20 12:03:06'),(50,'configs','0005_auto_20160305_1200','2016-05-20 12:03:07'),(51,'configs','0006_config_site_email','2016-05-20 12:03:07'),(52,'configs','0007_config_site_address','2016-05-20 12:03:08'),(53,'configs','0008_config_site_logo2','2016-05-20 12:03:08'),(54,'core','0020_auto_20160514_2032','2016-05-20 12:03:10'),(55,'core','0021_auto_20160519_1234','2016-05-20 12:03:10'),(56,'core','0022_auto_20160519_1250','2016-05-20 12:03:12'),(57,'core','0023_auto_20160519_1256','2016-05-20 12:03:12'),(58,'easy_thumbnails','0001_initial','2016-05-20 12:03:14'),(59,'easy_thumbnails','0002_thumbnaildimensions','2016-05-20 12:03:15'),(60,'flatblocks','0001_initial','2016-05-20 12:03:15'),(61,'redirects','0001_initial','2016-05-20 12:03:16'),(62,'robots','0001_initial','2016-05-20 12:03:19'),(63,'sessions','0001_initial','2016-05-20 12:03:19'),(64,'siteprojects','0001_initial','2016-05-20 12:03:20'),(65,'siteprojects','0002_remove_project_slug','2016-05-20 12:03:21'),(66,'sites','0002_alter_domain_unique','2016-05-20 12:03:21'),(67,'sitetree','0001_initial','2016-05-20 12:03:23'),(68,'socialaccount','0001_initial','2016-05-20 12:03:26'),(69,'socialaccount','0002_token_max_lengths','2016-05-20 12:03:27'),(70,'socialaccount','0003_extra_data_default_dict','2016-05-20 12:03:27'),(71,'core','0024_auto_20160521_1155','2016-05-21 12:26:34'),(72,'ceilings','0013_auto_20160521_1155','2016-05-21 12:26:37'),(73,'core','0025_auto_20160521_1200','2016-05-21 12:26:37'),(74,'ceilings','0014_auto_20160521_1309','2016-05-21 13:10:26'),(75,'core','0026_auto_20160521_1309','2016-05-21 13:10:32');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_redirect`
--

DROP TABLE IF EXISTS `django_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `old_path` varchar(200) NOT NULL,
  `new_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_redirect_site_id_ac5dd16b_uniq` (`site_id`,`old_path`),
  KEY `django_redirect_91a0b591` (`old_path`),
  CONSTRAINT `django_redirect_site_id_c3e37341_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_redirect`
--

LOCK TABLES `django_redirect` WRITE;
/*!40000 ALTER TABLE `django_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('27itxu1ru8r8c2acu55ycnnl4hfzi4vi','ODNjN2Y5YjA5Y2I2YTJkMDdiYzc5ZDE4OTVjM2E1ODM2YTM0ODg3Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhYzcwZmVmZTUxYTZkYTFjNTI4MjRhOWM2NGRlMmFhZTE5ZDM5OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-06-06 10:40:39'),('g8fv7733dmbrey0y0vadqb8w52rycamh','ZjdhMmE3YTFhM2JjMTMzZTg0NDRjYmE3ZThlN2M1NzY0NmU0NDIxZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmZGVkOTNiN2YwMjNjM2MwOGU3ZDc1OGQ2MDFjMzMzOGZlZWUxZWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2016-06-03 14:41:49'),('j9jouem04ki6ssfwdd3dth7ih4hdzhbn','ODNjN2Y5YjA5Y2I2YTJkMDdiYzc5ZDE4OTVjM2E1ODM2YTM0ODg3Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhYzcwZmVmZTUxYTZkYTFjNTI4MjRhOWM2NGRlMmFhZTE5ZDM5OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-06-08 22:15:05'),('rd3ydoms4wyyjz1alh3ie5i3hjm1dyxj','ZjdhMmE3YTFhM2JjMTMzZTg0NDRjYmE3ZThlN2M1NzY0NmU0NDIxZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmZGVkOTNiN2YwMjNjM2MwOGU3ZDc1OGQ2MDFjMzMzOGZlZWUxZWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2016-06-06 11:55:15'),('we57j20pyg98kwgtvp4b2pyqz4bm8mnl','ODNjN2Y5YjA5Y2I2YTJkMDdiYzc5ZDE4OTVjM2E1ODM2YTM0ODg3Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhYzcwZmVmZTUxYTZkYTFjNTI4MjRhOWM2NGRlMmFhZTE5ZDM5OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-06-03 23:16:54'),('yfkbpwzx2v1s8yorksyhadx5wn3vvolg','ODNjN2Y5YjA5Y2I2YTJkMDdiYzc5ZDE4OTVjM2E1ODM2YTM0ODg3Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhYzcwZmVmZTUxYTZkYTFjNTI4MjRhOWM2NGRlMmFhZTE5ZDM5OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-06-03 14:40:28');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (2,'potolok-like.ru','potolok-like.ru');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_source`
--

DROP TABLE IF EXISTS `easy_thumbnails_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_hash` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `easy_thumbnails_source_storage_hash_481ce32d_uniq` (`storage_hash`,`name`),
  KEY `easy_thumbnails_source_b454e115` (`storage_hash`),
  KEY `easy_thumbnails_source_b068931c` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_source`
--

LOCK TABLES `easy_thumbnails_source` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_source` DISABLE KEYS */;
INSERT INTO `easy_thumbnails_source` VALUES (1,'f9bde26a1556cd667f742bd34ec7c55e','projects/28_kopirovat.jpg','2016-05-20 16:19:30'),(2,'f9bde26a1556cd667f742bd34ec7c55e','projects/28_kopirovat_ejIBeWx.jpg','2016-05-20 16:20:48'),(3,'f9bde26a1556cd667f742bd34ec7c55e','projects/28_kopirovat_OOhONaL.jpg','2016-05-20 16:21:24'),(4,'f9bde26a1556cd667f742bd34ec7c55e','projects/03422_standingontheedgeofinfinity_2880x1800.jpg','2016-05-20 16:28:46'),(5,'f9bde26a1556cd667f742bd34ec7c55e','projects/29_kopirovat.jpg','2016-05-20 17:05:07'),(6,'f9bde26a1556cd667f742bd34ec7c55e','projects/30_kopirovat.jpg','2016-05-20 17:05:44'),(7,'f9bde26a1556cd667f742bd34ec7c55e','ceilings/glanceviy_natagnoy_potolok_kukhnia_1.JPG','2016-05-21 14:33:53'),(8,'f9bde26a1556cd667f742bd34ec7c55e','ceilings/zhbi-natjazhnyje-potolki.jpg','2016-05-21 14:33:53'),(9,'f9bde26a1556cd667f742bd34ec7c55e','ceilings/68.jpg','2016-05-23 11:32:10'),(10,'f9bde26a1556cd667f742bd34ec7c55e','ceilings/satinovyj-potolok8_4Z4ldEs.jpg','2016-05-23 11:31:43'),(11,'f9bde26a1556cd667f742bd34ec7c55e','projects/image-29-04-15-10-17-14.jpeg','2016-05-21 18:57:14'),(12,'f9bde26a1556cd667f742bd34ec7c55e','projects/image-29-04-15-10-17-17.jpeg','2016-05-21 18:57:15'),(13,'f9bde26a1556cd667f742bd34ec7c55e','ceilings/10060650.jpg','2016-05-23 12:07:08'),(14,'f9bde26a1556cd667f742bd34ec7c55e','ceilings/1.jpg','2016-05-23 12:07:08'),(15,'f9bde26a1556cd667f742bd34ec7c55e','ceilings/matovie.jpg','2016-05-23 12:07:08');
/*!40000 ALTER TABLE `easy_thumbnails_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_thumbnail`
--

DROP TABLE IF EXISTS `easy_thumbnails_thumbnail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_thumbnail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_hash` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `modified` datetime NOT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `easy_thumbnails_thumbnail_storage_hash_fb375270_uniq` (`storage_hash`,`name`,`source_id`),
  KEY `easy_thumbnails__source_id_5b57bc77_fk_easy_thumbnails_source_id` (`source_id`),
  KEY `easy_thumbnails_thumbnail_b454e115` (`storage_hash`),
  KEY `easy_thumbnails_thumbnail_b068931c` (`name`),
  CONSTRAINT `easy_thumbnails__source_id_5b57bc77_fk_easy_thumbnails_source_id` FOREIGN KEY (`source_id`) REFERENCES `easy_thumbnails_source` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_thumbnail`
--

LOCK TABLES `easy_thumbnails_thumbnail` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` DISABLE KEYS */;
INSERT INTO `easy_thumbnails_thumbnail` VALUES (1,'d26becbf46ac48eda79c7a39a13a02dd','projects/28_kopirovat.jpg.300x300_q85_detail_upscale.jpg','2016-05-20 16:19:30',1),(2,'d26becbf46ac48eda79c7a39a13a02dd','projects/28_kopirovat_ejIBeWx.jpg.300x300_q85_detail_upscale.jpg','2016-05-20 16:20:48',2),(3,'d26becbf46ac48eda79c7a39a13a02dd','projects/28_kopirovat_OOhONaL.jpg.300x300_q85_detail_upscale.jpg','2016-05-20 16:21:24',3),(4,'d26becbf46ac48eda79c7a39a13a02dd','projects/03422_standingontheedgeofinfinity_2880x1800.jpg.300x300_q85_detail_upscale.jpg','2016-05-20 16:28:46',4),(5,'d26becbf46ac48eda79c7a39a13a02dd','projects/29_kopirovat.jpg.300x300_q85_detail_upscale.jpg','2016-05-20 17:05:07',5),(6,'d26becbf46ac48eda79c7a39a13a02dd','projects/30_kopirovat.jpg.300x300_q85_detail_upscale.jpg','2016-05-20 17:05:44',6),(7,'d26becbf46ac48eda79c7a39a13a02dd','ceilings/glanceviy_natagnoy_potolok_kukhnia_1.JPG.300x300_q85_detail_upscale.jpg','2016-05-21 13:12:15',7),(8,'d26becbf46ac48eda79c7a39a13a02dd','ceilings/zhbi-natjazhnyje-potolki.jpg.300x300_q85_detail_upscale.jpg','2016-05-21 13:12:16',8),(9,'d26becbf46ac48eda79c7a39a13a02dd','ceilings/glanceviy_natagnoy_potolok_kukhnia_1.JPG.750x455_q85_box-0,239,3264,2220_crop_detail.jpg','2016-05-21 14:33:53',7),(10,'d26becbf46ac48eda79c7a39a13a02dd','ceilings/zhbi-natjazhnyje-potolki.jpg.750x455_q85_box-0,56,800,541_crop_detail.jpg','2016-05-21 14:33:53',8),(11,'d26becbf46ac48eda79c7a39a13a02dd','ceilings/68.jpg.750x455_q85_box-1,0,1144,693_crop_detail.jpg','2016-05-21 16:53:43',9),(12,'d26becbf46ac48eda79c7a39a13a02dd','ceilings/satinovyj-potolok8_4Z4ldEs.jpg.750x455_q85_box-0,104,3456,2200_crop_detail.jpg','2016-05-21 16:53:43',10),(13,'d26becbf46ac48eda79c7a39a13a02dd','projects/image-29-04-15-10-17-14.jpeg.300x300_q85_detail_upscale.jpg','2016-05-21 18:57:14',11),(14,'d26becbf46ac48eda79c7a39a13a02dd','projects/image-29-04-15-10-17-17.jpeg.300x300_q85_detail_upscale.jpg','2016-05-21 18:57:15',12),(15,'d26becbf46ac48eda79c7a39a13a02dd','ceilings/68.jpg.300x300_q85_detail_upscale.jpg','2016-05-23 11:31:43',9),(16,'d26becbf46ac48eda79c7a39a13a02dd','ceilings/satinovyj-potolok8_4Z4ldEs.jpg.300x300_q85_detail_upscale.jpg','2016-05-23 11:31:43',10),(17,'d26becbf46ac48eda79c7a39a13a02dd','ceilings/68.jpg.750x455_q85_box-0,0,1145,693_crop_detail.jpg','2016-05-23 11:32:10',9),(18,'d26becbf46ac48eda79c7a39a13a02dd','ceilings/10060650.jpg.750x455_q85_box-29,0,771,450_crop_detail.jpg','2016-05-23 12:07:08',13),(19,'d26becbf46ac48eda79c7a39a13a02dd','ceilings/1.jpg.750x455_q85_box-0,50,800,536_crop_detail.jpg','2016-05-23 12:07:08',14),(20,'d26becbf46ac48eda79c7a39a13a02dd','ceilings/matovie.jpg.750x455_q85_box-0,287,4000,2713_crop_detail.jpg','2016-05-23 12:07:08',15);
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_thumbnaildimensions`
--

DROP TABLE IF EXISTS `easy_thumbnails_thumbnaildimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_thumbnaildimensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail_id` int(11) NOT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thumbnail_id` (`thumbnail_id`),
  CONSTRAINT `easy_thumb_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id` FOREIGN KEY (`thumbnail_id`) REFERENCES `easy_thumbnails_thumbnail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_thumbnaildimensions`
--

LOCK TABLES `easy_thumbnails_thumbnaildimensions` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnaildimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnaildimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flatblocks_flatblock`
--

DROP TABLE IF EXISTS `flatblocks_flatblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flatblocks_flatblock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `header` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flatblocks_flatblock`
--

LOCK TABLES `flatblocks_flatblock` WRITE;
/*!40000 ALTER TABLE `flatblocks_flatblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `flatblocks_flatblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule`
--

DROP TABLE IF EXISTS `robots_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `robot` varchar(255) NOT NULL,
  `crawl_delay` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule`
--

LOCK TABLES `robots_rule` WRITE;
/*!40000 ALTER TABLE `robots_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_allowed`
--

DROP TABLE IF EXISTS `robots_rule_allowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_allowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `robots_rule_allowed_rule_id_83b262d4_uniq` (`rule_id`,`url_id`),
  KEY `robots_rule_allowed_url_id_6157f60a_fk_robots_url_id` (`url_id`),
  CONSTRAINT `robots_rule_allowed_url_id_6157f60a_fk_robots_url_id` FOREIGN KEY (`url_id`) REFERENCES `robots_url` (`id`),
  CONSTRAINT `robots_rule_allowed_rule_id_aa90358c_fk_robots_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `robots_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_allowed`
--

LOCK TABLES `robots_rule_allowed` WRITE;
/*!40000 ALTER TABLE `robots_rule_allowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_allowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_disallowed`
--

DROP TABLE IF EXISTS `robots_rule_disallowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_disallowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `robots_rule_disallowed_rule_id_4d9b6222_uniq` (`rule_id`,`url_id`),
  KEY `robots_rule_disallowed_url_id_8e02db92_fk_robots_url_id` (`url_id`),
  CONSTRAINT `robots_rule_disallowed_url_id_8e02db92_fk_robots_url_id` FOREIGN KEY (`url_id`) REFERENCES `robots_url` (`id`),
  CONSTRAINT `robots_rule_disallowed_rule_id_fad7328c_fk_robots_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `robots_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_disallowed`
--

LOCK TABLES `robots_rule_disallowed` WRITE;
/*!40000 ALTER TABLE `robots_rule_disallowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_disallowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_sites`
--

DROP TABLE IF EXISTS `robots_rule_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `robots_rule_sites_rule_id_093f04ea_uniq` (`rule_id`,`site_id`),
  KEY `robots_rule_sites_site_id_efe5be97_fk_django_site_id` (`site_id`),
  CONSTRAINT `robots_rule_sites_site_id_efe5be97_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `robots_rule_sites_rule_id_7921a799_fk_robots_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `robots_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_sites`
--

LOCK TABLES `robots_rule_sites` WRITE;
/*!40000 ALTER TABLE `robots_rule_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_url`
--

DROP TABLE IF EXISTS `robots_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_url`
--

LOCK TABLES `robots_url` WRITE;
/*!40000 ALTER TABLE `robots_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siteprojects_project`
--

DROP TABLE IF EXISTS `siteprojects_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siteprojects_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteprojects_project`
--

LOCK TABLES `siteprojects_project` WRITE;
/*!40000 ALTER TABLE `siteprojects_project` DISABLE KEYS */;
INSERT INTO `siteprojects_project` VALUES (6,'Фото 1','2016-05-20 16:21:24','2016-05-20 16:48:35'),(7,'Фото 2','2016-05-20 17:05:06','2016-05-20 17:05:11'),(8,'Фото 3','2016-05-20 17:05:33','2016-05-20 17:05:59'),(9,'Фото 4','2016-05-20 17:06:22','2016-05-20 17:06:22'),(10,'Фото 5','2016-05-20 17:07:53','2016-05-20 17:07:53'),(11,'Фото 6','2016-05-20 17:08:39','2016-05-20 17:08:39'),(12,'Фото 7','2016-05-20 17:10:09','2016-05-20 17:10:09'),(13,'Фото 8','2016-05-20 17:10:32','2016-05-20 17:10:32'),(14,'Фото 9','2016-05-20 17:11:00','2016-05-20 17:11:00'),(15,'Фото 10','2016-05-20 17:11:25','2016-05-20 17:11:25'),(16,'Фото 11','2016-05-20 17:11:49','2016-05-20 17:11:49'),(17,'Фото 12','2016-05-20 17:12:16','2016-05-20 17:12:16'),(18,'Фото 12','2016-05-20 17:12:32','2016-05-20 17:12:32'),(19,'Фото 12','2016-05-20 17:13:07','2016-05-20 17:13:07'),(20,'Фото 13','2016-05-20 17:13:48','2016-05-20 17:13:48'),(21,'Фото 14','2016-05-20 17:14:42','2016-05-20 17:14:42'),(22,'Фото 15','2016-05-20 17:15:05','2016-05-20 17:15:05'),(23,'Фото 16','2016-05-20 17:15:39','2016-05-20 17:15:39'),(24,'Фото 16','2016-05-20 17:17:57','2016-05-20 17:17:57'),(25,'Фото 17','2016-05-20 17:20:23','2016-05-20 17:20:23'),(26,'Фото 18','2016-05-20 17:22:06','2016-05-21 18:57:31'),(27,'Фото 19','2016-05-20 17:22:24','2016-05-21 18:57:44'),(28,'Фото 20','2016-05-21 18:58:46','2016-05-21 18:58:46'),(29,'Фото 21','2016-05-21 19:00:02','2016-05-21 19:00:02'),(30,'Фото 23','2016-05-21 19:07:16','2016-05-21 19:07:16'),(31,'Фото 24','2016-05-21 19:07:34','2016-05-21 19:07:34'),(32,'Фото 25','2016-05-21 19:07:58','2016-05-21 19:07:58'),(33,'Фото 26','2016-05-21 19:08:59','2016-05-21 19:08:59'),(34,'Фото 26','2016-05-21 19:09:12','2016-05-21 19:09:12'),(35,'Фото 27','2016-05-21 19:09:27','2016-05-21 19:09:27'),(36,'Фото 28','2016-05-21 19:09:43','2016-05-21 19:09:43'),(37,'Фото 28','2016-05-21 19:10:09','2016-05-21 19:10:09'),(38,'Фото 29','2016-05-21 19:10:27','2016-05-21 19:10:27'),(39,'Фото 30','2016-05-21 19:11:03','2016-05-21 19:11:03'),(40,'Фото 31','2016-05-21 19:11:17','2016-05-21 19:11:17'),(41,'Фото 32','2016-05-21 19:11:30','2016-05-21 19:11:30'),(42,'Фото 33','2016-05-21 19:11:44','2016-05-21 19:11:44'),(43,'Фото 34','2016-05-21 19:12:05','2016-05-21 19:12:05'),(44,'Фото 35','2016-05-21 19:12:55','2016-05-21 19:12:55'),(45,'Фото 36','2016-05-21 19:13:09','2016-05-21 19:13:09'),(46,'Фото 37','2016-05-21 19:14:47','2016-05-21 19:14:47'),(47,'Фото 38','2016-05-21 19:15:12','2016-05-21 19:15:12'),(48,'Фото 39','2016-05-21 19:16:26','2016-05-21 19:16:26'),(49,'Фото 40','2016-05-21 19:17:55','2016-05-21 19:17:55'),(50,'Фото 41','2016-05-21 19:18:09','2016-05-21 19:18:09'),(51,'Фото 42','2016-05-21 19:18:28','2016-05-21 19:18:28'),(52,'Фото 43','2016-05-21 19:18:45','2016-05-21 19:18:45'),(53,'Фото 44','2016-05-21 19:19:07','2016-05-21 19:19:07'),(54,'Фото 45','2016-05-21 19:20:03','2016-05-21 19:20:03'),(55,'Фото 46','2016-05-21 19:20:17','2016-05-21 19:20:17'),(56,'Фото 47','2016-05-21 19:20:30','2016-05-21 19:20:30'),(57,'Фото 48','2016-05-21 19:20:51','2016-05-21 19:20:51'),(58,'Фото 49','2016-05-21 19:21:02','2016-05-21 19:21:02'),(59,'Фото 50','2016-05-21 19:21:21','2016-05-21 19:21:21'),(60,'Фото 51','2016-05-21 19:21:33','2016-05-21 19:21:33'),(61,'Фото 53','2016-05-21 19:25:43','2016-05-21 19:25:43'),(62,'Фото  54','2016-05-21 19:25:57','2016-05-21 19:25:57'),(63,'Фото 55','2016-05-21 19:26:11','2016-05-21 19:26:11'),(64,'Фото 54','2016-05-21 19:26:26','2016-05-21 19:26:26'),(65,'Фото 56','2016-05-21 19:26:42','2016-05-21 19:26:42'),(66,'Фото 57','2016-05-21 19:27:01','2016-05-21 19:27:01'),(67,'Фото  58','2016-05-21 19:27:33','2016-05-21 19:27:33'),(68,'Фото 59','2016-05-21 19:27:48','2016-05-21 19:27:48'),(69,'Фото 60','2016-05-21 19:28:06','2016-05-21 19:28:06'),(70,'Фото 61','2016-05-21 19:28:18','2016-05-21 19:28:18'),(71,'Фото 62','2016-05-21 19:28:33','2016-05-21 19:28:33'),(72,'Фото 63','2016-05-21 19:29:01','2016-05-21 19:29:01'),(73,'Фото 64','2016-05-21 19:29:11','2016-05-21 19:29:11'),(74,'Фото 65','2016-05-21 19:29:27','2016-05-21 19:29:27'),(75,'Фото  65','2016-05-21 19:29:53','2016-05-21 19:29:53'),(76,'Фото  66','2016-05-21 19:30:12','2016-05-21 19:30:12'),(77,'Фото  67','2016-05-21 19:34:22','2016-05-21 19:34:22'),(78,'Фото 68','2016-05-21 19:34:39','2016-05-21 19:34:39'),(79,'Фото 69','2016-05-21 19:34:58','2016-05-21 19:34:58'),(80,'Фото 70','2016-05-21 19:35:12','2016-05-21 19:35:12'),(81,'Фото  71','2016-05-21 19:35:29','2016-05-21 19:35:29'),(82,'Фото 72','2016-05-21 19:35:47','2016-05-21 19:35:47'),(83,'Фото 73','2016-05-21 19:36:03','2016-05-21 19:36:03'),(84,'Фото 74','2016-05-21 19:36:19','2016-05-21 19:36:19'),(85,'Фото 75','2016-05-21 19:36:51','2016-05-21 19:36:51'),(86,'Фото 76','2016-05-21 19:37:05','2016-05-21 19:37:05'),(87,'Фото 77','2016-05-21 19:37:25','2016-05-21 19:37:25'),(88,'Фото 78','2016-05-21 19:37:45','2016-05-21 19:37:45'),(89,'Фото 79','2016-05-21 19:38:07','2016-05-21 19:38:07'),(90,'Фото 80','2016-05-21 19:38:37','2016-05-21 19:38:37'),(91,'Фото 90','2016-05-21 19:38:55','2016-05-21 19:38:55'),(92,'Фото 91','2016-05-21 19:39:08','2016-05-21 19:39:08'),(93,'Фото 92','2016-05-21 19:39:33','2016-05-21 19:39:33'),(94,'Фото 93','2016-05-21 19:39:48','2016-05-21 19:39:48'),(95,'Фото 94','2016-05-21 19:40:02','2016-05-21 19:40:02'),(96,'Фото 95','2016-05-21 19:40:16','2016-05-21 19:40:16');
/*!40000 ALTER TABLE `siteprojects_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siteprojects_project_filter`
--

DROP TABLE IF EXISTS `siteprojects_project_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siteprojects_project_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siteprojects_project_filter_project_id_5ebfb401_uniq` (`project_id`,`filter_id`),
  KEY `siteprojects_project_fi_filter_id_78cb587a_fk_ceilings_filter_id` (`filter_id`),
  CONSTRAINT `siteprojects_project_fi_filter_id_78cb587a_fk_ceilings_filter_id` FOREIGN KEY (`filter_id`) REFERENCES `ceilings_filter` (`id`),
  CONSTRAINT `siteprojects_proj_project_id_fe68da5b_fk_siteprojects_project_id` FOREIGN KEY (`project_id`) REFERENCES `siteprojects_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteprojects_project_filter`
--

LOCK TABLES `siteprojects_project_filter` WRITE;
/*!40000 ALTER TABLE `siteprojects_project_filter` DISABLE KEYS */;
INSERT INTO `siteprojects_project_filter` VALUES (7,6,8),(8,7,8),(9,8,8),(10,9,8),(11,10,8),(12,11,8),(13,12,8),(14,13,8),(15,14,8),(16,15,8),(17,16,8),(18,17,8),(19,18,8),(20,19,8),(21,20,8),(22,21,8),(23,22,8),(24,23,8),(25,24,8),(26,25,8),(27,26,8),(28,27,8),(29,28,7),(30,29,7),(31,30,7),(32,31,7),(33,32,7),(34,33,7),(35,34,7),(36,35,7),(37,36,7),(38,37,7),(39,38,7),(40,39,7),(41,40,7),(42,41,7),(43,42,7),(44,43,7),(45,44,7),(46,45,7),(47,46,7),(48,47,7),(49,48,7),(50,49,7),(51,50,7),(52,51,7),(53,52,7),(54,53,7),(55,54,7),(56,55,7),(57,56,7),(58,57,7),(59,58,7),(60,59,7),(61,61,11),(62,62,11),(63,63,7),(64,64,11),(65,65,11),(66,66,11),(67,67,11),(68,68,11),(69,69,11),(70,70,11),(71,71,7),(72,72,11),(73,73,7),(74,74,7),(75,75,11),(76,76,11),(77,77,18),(78,78,18),(79,79,18),(80,80,18),(81,81,18),(82,83,18),(83,84,18),(84,85,18),(85,86,18),(86,87,18),(87,88,18),(88,89,18),(89,90,18),(90,91,18),(91,92,18),(92,93,18),(93,94,18),(94,95,18),(95,96,18);
/*!40000 ALTER TABLE `siteprojects_project_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siteprojects_projectimage`
--

DROP TABLE IF EXISTS `siteprojects_projectimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siteprojects_projectimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `cropping` varchar(255) NOT NULL,
  `cropping_250x375` varchar(255) NOT NULL,
  `cropping_750x455` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteprojects_proj_project_id_609534f5_fk_siteprojects_project_id` (`project_id`),
  CONSTRAINT `siteprojects_proj_project_id_609534f5_fk_siteprojects_project_id` FOREIGN KEY (`project_id`) REFERENCES `siteprojects_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteprojects_projectimage`
--

LOCK TABLES `siteprojects_projectimage` WRITE;
/*!40000 ALTER TABLE `siteprojects_projectimage` DISABLE KEYS */;
INSERT INTO `siteprojects_projectimage` VALUES (7,'projects/image-04-11-15-12-33-2.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',6),(8,'projects/29_kopirovat.jpg','0,45,800,557','200,0,600,600','0,56,800,541',7),(9,'projects/30_kopirovat.jpg','0,45,800,557','200,0,600,600','0,56,800,541',8),(10,'projects/50_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',9),(11,'projects/88_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',10),(12,'projects/image-04-11-15-10-38-15.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',11),(13,'projects/image-04-11-15-10-38-22.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',12),(14,'projects/image-04-11-15-12-27-10.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',13),(15,'projects/image-04-11-15-12-32-3.jpeg','0,108,600,492','100,0,500,600','0,118,600,482',14),(16,'projects/image-04-11-15-12-33.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',15),(17,'projects/image-04-11-15-12-33-1.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',16),(18,'projects/image-04-11-15-12-33-2_oaZuE69.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',17),(19,'projects/image-12-06-14-10-08-2_kopirovat.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',18),(20,'projects/image-12-06-14-10-09-2_kopirovat.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',19),(21,'projects/image-12-06-14-10-09-3_kopirovat.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',20),(22,'projects/image-12-06-14-10-09-4_kopirovat.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',21),(23,'projects/image-12-06-14-10-09-8_kopirovat.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',22),(24,'projects/image-12-06-14-10-09-14_kopirovat.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',23),(25,'projects/image-29-04-15-10-17-5.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',24),(26,'projects/image-29-04-15-10-17-11.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',25),(27,'projects/image-29-04-15-10-17-14.jpeg','0,45,800,557','200,0,600,600','0,56,800,541',26),(28,'projects/image-29-04-15-10-17-17.jpeg','0,45,800,557','200,0,600,600','0,56,800,541',27),(29,'projects/46_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',28),(30,'projects/14_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',29),(31,'projects/19_kopirovat.jpg','0,17,800,528','218,0,582,545','0,30,800,515',30),(32,'projects/27_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',31),(33,'projects/35_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',32),(34,'projects/42_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',33),(35,'projects/43_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',34),(36,'projects/48_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',35),(37,'projects/49_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',36),(38,'projects/55_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',37),(39,'projects/61_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',38),(40,'projects/66_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',39),(41,'projects/67_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',40),(42,'projects/69_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',41),(43,'projects/70_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',42),(44,'projects/81_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',43),(45,'projects/83_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',44),(46,'projects/86_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',45),(47,'projects/142_kopirovat.jpg','0,43,800,555','201,0,599,598','0,56,800,542',46),(48,'projects/image-04-11-15-11-00-1.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',47),(49,'projects/image-04-11-15-12-27-1.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',48),(50,'projects/image-04-11-15-12-27-1_t0vAcEt.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',49),(51,'projects/image-04-11-15-12-27-3.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',50),(52,'projects/image-04-11-15-12-27-14.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',51),(53,'projects/image-04-11-15-12-27-18.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',52),(54,'projects/image-12-06-14-10-09-15_kopirovat.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',53),(55,'projects/image-12-06-14-10-09-16_kopirovat.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',54),(56,'projects/image-12-06-14-10-09-18_kopirovat.jpeg','0,11,800,522','222,0,578,533','0,24,800,509',55),(57,'projects/image-12-06-14-10-09_kopirovat.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',56),(58,'projects/image-25-06-15-08-53-19.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',57),(59,'projects/image-25-06-15-08-53-20.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',58),(60,'projects/img_0282_kopirovat.jpg','0,43,800,555','201,0,599,598','0,56,800,542',59),(61,'projects/img_0443_kopirovat.jpg','0,43,800,555','201,0,599,598','0,56,800,542',60),(62,'projects/5_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',61),(63,'projects/10_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',62),(64,'projects/11_kopirovat.jpg','0,113,584,487','92,0,492,600','0,123,584,477',63),(65,'projects/20_kopirovat.jpg','0,29,800,540','210,0,590,569','0,42,800,527',64),(66,'projects/image-04-11-15-10-37.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',65),(67,'projects/image-04-11-15-10-37-14.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',66),(68,'projects/image-04-11-15-11-00-14.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',67),(69,'projects/image-04-11-15-11-01-1.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',68),(70,'projects/image-04-11-15-12-32.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',69),(71,'projects/image-04-11-15-12-33-3.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',70),(72,'projects/image-12-06-14-10-09-5_kopirovat.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',71),(73,'projects/img_0367_kopirovat.jpg','0,43,800,555','201,0,599,598','0,56,800,542',72),(74,'projects/living-rooms-141_-_kopiya_0.jpg','0,44,800,556','200,0,600,600','0,57,800,543',73),(75,'projects/multilevel8.jpg','0,44,800,556','200,0,600,600','0,57,800,543',74),(76,'projects/multilevel17.jpg','0,44,800,556','200,0,600,600','0,57,800,543',75),(77,'projects/multilevel25.jpg','0,44,800,556','200,0,600,600','0,57,800,543',76),(78,'projects/38_kopirovat.jpg','0,160,439,440','20,0,419,600','0,167,439,433',77),(79,'projects/56_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',78),(80,'projects/58_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',79),(81,'projects/59_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',80),(82,'projects/62_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',81),(83,'projects/62_kopirovat_1geVJaD.jpg','0,44,800,556','200,0,600,600','0,57,800,543',82),(84,'projects/63_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',83),(85,'projects/82_kopirovat.jpg','0,44,800,556','200,0,600,600','0,57,800,543',84),(86,'projects/image-04-11-15-11-01-16.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',85),(87,'projects/image-04-11-15-11-02.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',86),(88,'projects/image-04-11-15-11-02-2.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',87),(89,'projects/image-04-11-15-11-02-8.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',88),(90,'projects/image-06-05-15-09-20-12.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',89),(91,'projects/image-06-05-15-09-20-23.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',90),(92,'projects/image-06-05-15-09-20-29.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',91),(93,'projects/image-25-06-15-08-53-9.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',92),(94,'projects/image-25-06-15-08-53-16.jpeg','0,44,800,556','200,0,600,600','0,57,800,543',93),(95,'projects/tkanev1_11_12_14_0.jpg','0,44,800,556','200,0,600,600','0,57,800,543',94),(96,'projects/tkanev2_11_12_14_0.jpg','0,44,800,556','200,0,600,600','0,57,800,543',95),(97,'projects/tkanev_11_12_14_0.jpg','0,44,800,556','200,0,600,600','0,57,800,543',96);
/*!40000 ALTER TABLE `siteprojects_projectimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitetree_tree`
--

DROP TABLE IF EXISTS `sitetree_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitetree_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitetree_tree`
--

LOCK TABLES `sitetree_tree` WRITE;
/*!40000 ALTER TABLE `sitetree_tree` DISABLE KEYS */;
INSERT INTO `sitetree_tree` VALUES (1,'base','base');
/*!40000 ALTER TABLE `sitetree_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitetree_treeitem`
--

DROP TABLE IF EXISTS `sitetree_treeitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitetree_treeitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `hint` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `urlaspattern` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `alias` varchar(80) DEFAULT NULL,
  `description` longtext NOT NULL,
  `inmenu` tinyint(1) NOT NULL,
  `inbreadcrumbs` tinyint(1) NOT NULL,
  `insitetree` tinyint(1) NOT NULL,
  `access_loggedin` tinyint(1) NOT NULL,
  `access_guest` tinyint(1) NOT NULL,
  `access_restricted` tinyint(1) NOT NULL,
  `access_perm_type` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `tree_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sitetree_treeitem_tree_id_f597fbd9_uniq` (`tree_id`,`alias`),
  KEY `sitetree_treeitem_parent_id_88f6f9a4_fk_sitetree_treeitem_id` (`parent_id`),
  KEY `sitetree_treeitem_572d4e42` (`url`),
  KEY `sitetree_treeitem_daef6449` (`urlaspattern`),
  KEY `sitetree_treeitem_662f707d` (`hidden`),
  KEY `sitetree_treeitem_724874d1` (`alias`),
  KEY `sitetree_treeitem_5ea60347` (`inmenu`),
  KEY `sitetree_treeitem_a623d47f` (`inbreadcrumbs`),
  KEY `sitetree_treeitem_0d286676` (`insitetree`),
  KEY `sitetree_treeitem_070ee996` (`access_loggedin`),
  KEY `sitetree_treeitem_a0d0c0e2` (`access_guest`),
  KEY `sitetree_treeitem_dd0f9f4f` (`access_restricted`),
  KEY `sitetree_treeitem_a73f1f77` (`sort_order`),
  CONSTRAINT `sitetree_treeitem_tree_id_038a4bc7_fk_sitetree_tree_id` FOREIGN KEY (`tree_id`) REFERENCES `sitetree_tree` (`id`),
  CONSTRAINT `sitetree_treeitem_parent_id_88f6f9a4_fk_sitetree_treeitem_id` FOREIGN KEY (`parent_id`) REFERENCES `sitetree_treeitem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitetree_treeitem`
--

LOCK TABLES `sitetree_treeitem` WRITE;
/*!40000 ALTER TABLE `sitetree_treeitem` DISABLE KEYS */;
INSERT INTO `sitetree_treeitem` VALUES (1,'Каталог потолков','','/natyazhnye-potolki/',0,0,NULL,'',1,1,1,0,0,0,1,1,NULL,1),(2,'О нас','','/pages/o-nas/',0,0,NULL,'',1,1,1,0,0,0,1,2,NULL,1),(3,'Контакты','','/contacts/',0,0,NULL,'',1,1,1,0,0,0,1,5,NULL,1),(4,'Акции','','/pages/akcii/',0,1,NULL,'',1,1,1,0,0,0,1,3,NULL,1),(5,'Цены','','/pages/ceny/',0,0,NULL,'',1,1,1,0,0,0,1,4,NULL,1);
/*!40000 ALTER TABLE `sitetree_treeitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitetree_treeitem_access_permissions`
--

DROP TABLE IF EXISTS `sitetree_treeitem_access_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitetree_treeitem_access_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `treeitem_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sitetree_treeitem_access_permissions_treeitem_id_a3224a96_uniq` (`treeitem_id`,`permission_id`),
  KEY `sitetree_treeitem_a_permission_id_c6d1d87a_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `sitetree_treeitem_a_permission_id_c6d1d87a_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `sitetree_treeitem_a_treeitem_id_aedb7367_fk_sitetree_treeitem_id` FOREIGN KEY (`treeitem_id`) REFERENCES `sitetree_treeitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitetree_treeitem_access_permissions`
--

LOCK TABLES `sitetree_treeitem_access_permissions` WRITE;
/*!40000 ALTER TABLE `sitetree_treeitem_access_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitetree_treeitem_access_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `socialaccoun_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialacco_account_id_951f210e_fk_socialaccount_socialaccount_id` (`account_id`),
  CONSTRAINT `socialaccount_soci_app_id_636a42d7_fk_socialaccount_socialapp_id` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialacco_account_id_951f210e_fk_socialaccount_socialaccount_id` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-26 19:33:56
