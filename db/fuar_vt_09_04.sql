-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: fuar_veri_tabani
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `biletler`
--

DROP TABLE IF EXISTS `biletler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biletler` (
  `bilet_id` int NOT NULL AUTO_INCREMENT,
  `etkinlik_id` int NOT NULL,
  `koltuk_id` int NOT NULL,
  `uye_id` int NOT NULL,
  PRIMARY KEY (`etkinlik_id`,`koltuk_id`),
  UNIQUE KEY `bilet_id` (`bilet_id`),
  KEY `koltuk_id-biletler` (`koltuk_id`),
  KEY `uye_id` (`uye_id`),
  CONSTRAINT `etkinlik_id` FOREIGN KEY (`etkinlik_id`) REFERENCES `etkinlikler` (`etkinlik_id`),
  CONSTRAINT `koltuk_id-biletler` FOREIGN KEY (`koltuk_id`) REFERENCES `koltuklar` (`koltuk_id`),
  CONSTRAINT `uye_id` FOREIGN KEY (`uye_id`) REFERENCES `uyeler` (`uye_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biletler`
--

LOCK TABLES `biletler` WRITE;
/*!40000 ALTER TABLE `biletler` DISABLE KEYS */;
/*!40000 ALTER TABLE `biletler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bilgi_alanlari`
--

DROP TABLE IF EXISTS `bilgi_alanlari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bilgi_alanlari` (
  `bilgi_alani_id` int NOT NULL AUTO_INCREMENT,
  `baslik` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`bilgi_alani_id`),
  UNIQUE KEY `baslik_UNIQUE` (`baslik`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bilgi_alanlari`
--

LOCK TABLES `bilgi_alanlari` WRITE;
/*!40000 ALTER TABLE `bilgi_alanlari` DISABLE KEYS */;
INSERT INTO `bilgi_alanlari` VALUES (1,'Bitkiler'),(2,'Biyoloji'),(3,'Biyomedikal'),(5,'Çevre'),(6,'Denizcilik'),(7,'Diş Hekimliği'),(8,'Ebelik'),(24,'Edebiyatı'),(4,'Ekonomi'),(9,'Elektrik'),(10,'Elektronik ve Haberleşme'),(11,'Endüstri'),(12,'Enerji'),(13,'Felsefe'),(14,'Fen'),(15,'Fizik'),(16,'Gastronomi ve Mutfak Sanatları'),(17,'Gazetecilik'),(18,'Görsel İletişim Tasarımı'),(19,'Halkla İlişkiler'),(20,'Hukuk'),(21,'İç Mimarlık'),(22,'İktisat'),(23,'İlahiyat'),(26,'İnşaat'),(27,'İşletme'),(28,'Jeofizik'),(29,'Kimya'),(30,'Matematik'),(31,'Mekatronik'),(25,'Öğretmenliği'),(32,'Otomotiv'),(33,'Radyo, Televizyon ve Sinema'),(34,'Rehberlik ve Psikolojik'),(35,'Siyaset'),(36,'Sosyal Hizmet'),(37,'Tarih'),(38,'Tıp'),(39,'Turizm'),(40,'Yazılım');
/*!40000 ALTER TABLE `bilgi_alanlari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diller`
--

DROP TABLE IF EXISTS `diller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diller` (
  `dil_id` int NOT NULL AUTO_INCREMENT,
  `baslik` varchar(50) NOT NULL,
  PRIMARY KEY (`dil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diller`
--

LOCK TABLES `diller` WRITE;
/*!40000 ALTER TABLE `diller` DISABLE KEYS */;
INSERT INTO `diller` VALUES (1,'Turkçe'),(2,'İngilizce'),(3,'Arapça'),(4,'Almanca'),(5,'Fransızca'),(6,'Rusça'),(7,'Farsça'),(8,'Japonca'),(9,'İspanyolca'),(10,'Portekizce'),(11,'Çince'),(12,'Hintçe'),(13,'Korece'),(14,'İtalyanca'),(15,'Kürtçe'),(16,'Azerice'),(17,'Endonezce'),(18,'Özbekçe'),(19,'Yunanca'),(20,'Swahili');
/*!40000 ALTER TABLE `diller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etkinlik_canli_baglantilari`
--

DROP TABLE IF EXISTS `etkinlik_canli_baglantilari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etkinlik_canli_baglantilari` (
  `baglanti_id` int NOT NULL,
  `baglanti` varchar(255) NOT NULL,
  `etkinlik_id` int NOT NULL,
  PRIMARY KEY (`baglanti_id`),
  KEY `baglanti_ile_etkinlik_baglanmasi_idx` (`etkinlik_id`),
  CONSTRAINT `baglanti_ile_etkinlik_baglanmasi` FOREIGN KEY (`etkinlik_id`) REFERENCES `etkinlikler` (`etkinlik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etkinlik_canli_baglantilari`
--

LOCK TABLES `etkinlik_canli_baglantilari` WRITE;
/*!40000 ALTER TABLE `etkinlik_canli_baglantilari` DISABLE KEYS */;
/*!40000 ALTER TABLE `etkinlik_canli_baglantilari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etkinlik_turleri`
--

DROP TABLE IF EXISTS `etkinlik_turleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etkinlik_turleri` (
  `etkinlik_turu_id` int NOT NULL,
  `baslik` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`etkinlik_turu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etkinlik_turleri`
--

LOCK TABLES `etkinlik_turleri` WRITE;
/*!40000 ALTER TABLE `etkinlik_turleri` DISABLE KEYS */;
INSERT INTO `etkinlik_turleri` VALUES (1,'Kongre'),(2,'Konferans'),(3,'Forum'),(4,'Seminer');
/*!40000 ALTER TABLE `etkinlik_turleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etkinlikler`
--

DROP TABLE IF EXISTS `etkinlikler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etkinlikler` (
  `etkinlik_id` int NOT NULL AUTO_INCREMENT,
  `baslik` varchar(255) NOT NULL,
  `tarih` date NOT NULL,
  `konuya_giris_metni` tinytext NOT NULL,
  `baslangic_saati` time NOT NULL,
  `bitis_saati` time NOT NULL,
  `salon_id` int NOT NULL,
  `etkinlik_dili` int NOT NULL,
  `etkinlik_turu_id` int NOT NULL,
  PRIMARY KEY (`etkinlik_id`),
  KEY `fuar_veri_tabani-salon_id` (`salon_id`),
  KEY `ekinlik_ile_dilini_baglanmasi_idx` (`etkinlik_dili`),
  KEY `ekinlik_ve_turune_baglamak_idx` (`etkinlik_turu_id`),
  CONSTRAINT `ekinlik_ile_dilini_baglanmasi` FOREIGN KEY (`etkinlik_dili`) REFERENCES `diller` (`dil_id`),
  CONSTRAINT `ekinlik_ve_turune_baglamak` FOREIGN KEY (`etkinlik_turu_id`) REFERENCES `etkinlik_turleri` (`etkinlik_turu_id`),
  CONSTRAINT `fuar_veri_tabani-salon_id` FOREIGN KEY (`salon_id`) REFERENCES `salonlar` (`salon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etkinlikler`
--

LOCK TABLES `etkinlikler` WRITE;
/*!40000 ALTER TABLE `etkinlikler` DISABLE KEYS */;
/*!40000 ALTER TABLE `etkinlikler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etkinliklerin_konusmacilari`
--

DROP TABLE IF EXISTS `etkinliklerin_konusmacilari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etkinliklerin_konusmacilari` (
  `etkinlik_konusmacisi_id` int NOT NULL,
  `konusmaci_id` int NOT NULL,
  `etkinlik_id` int NOT NULL,
  PRIMARY KEY (`etkinlik_konusmacisi_id`),
  KEY `etkinlik_konusmaci_baglantisi_idx` (`etkinlik_id`),
  KEY `konusmaci_etkinlik_id_idx` (`konusmaci_id`),
  CONSTRAINT `etkinlik_konusmaci_baglantisi` FOREIGN KEY (`etkinlik_id`) REFERENCES `etkinlikler` (`etkinlik_id`),
  CONSTRAINT `konusmaci_etkinlik_id` FOREIGN KEY (`konusmaci_id`) REFERENCES `konusmacilar` (`konusmaci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etkinliklerin_konusmacilari`
--

LOCK TABLES `etkinliklerin_konusmacilari` WRITE;
/*!40000 ALTER TABLE `etkinliklerin_konusmacilari` DISABLE KEYS */;
/*!40000 ALTER TABLE `etkinliklerin_konusmacilari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etkinliklerin_yonelik_olduklari_bilgi_alanlari`
--

DROP TABLE IF EXISTS `etkinliklerin_yonelik_olduklari_bilgi_alanlari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etkinliklerin_yonelik_olduklari_bilgi_alanlari` (
  `etkinligin_yonelik_oldugu_bilgi_alani_id` int NOT NULL AUTO_INCREMENT,
  `bilgi_alani_id` int NOT NULL,
  `etkinlik_id` int NOT NULL,
  PRIMARY KEY (`etkinligin_yonelik_oldugu_bilgi_alani_id`),
  KEY `etkinlik_ile_biligi_alani_baglanmasi_idx` (`bilgi_alani_id`),
  KEY `etkinlik_ile_biligi_alani_baglanmasi` (`etkinlik_id`),
  CONSTRAINT `biligi_alani_ile_etkinlik_naglanmasi` FOREIGN KEY (`bilgi_alani_id`) REFERENCES `bilgi_alanlari` (`bilgi_alani_id`),
  CONSTRAINT `etkinlik_ile_biligi_alani_baglanmasi` FOREIGN KEY (`etkinlik_id`) REFERENCES `etkinlikler` (`etkinlik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etkinliklerin_yonelik_olduklari_bilgi_alanlari`
--

LOCK TABLES `etkinliklerin_yonelik_olduklari_bilgi_alanlari` WRITE;
/*!40000 ALTER TABLE `etkinliklerin_yonelik_olduklari_bilgi_alanlari` DISABLE KEYS */;
/*!40000 ALTER TABLE `etkinliklerin_yonelik_olduklari_bilgi_alanlari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koltuklar`
--

DROP TABLE IF EXISTS `koltuklar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `koltuklar` (
  `koltuk_id` int NOT NULL AUTO_INCREMENT,
  `salon_id` int NOT NULL,
  PRIMARY KEY (`koltuk_id`),
  KEY `salon_id` (`salon_id`),
  CONSTRAINT `salon_id` FOREIGN KEY (`salon_id`) REFERENCES `salonlar` (`salon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koltuklar`
--

LOCK TABLES `koltuklar` WRITE;
/*!40000 ALTER TABLE `koltuklar` DISABLE KEYS */;
/*!40000 ALTER TABLE `koltuklar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konusmaci_dilleri`
--

DROP TABLE IF EXISTS `konusmaci_dilleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konusmaci_dilleri` (
  `konusmaci_dili_id` int NOT NULL,
  `dil_id` int NOT NULL,
  `konusmaci_id` int NOT NULL,
  PRIMARY KEY (`konusmaci_dili_id`),
  KEY `diller_ile_konusmaci_baglanmasi_idx` (`dil_id`),
  KEY `konusmaci_ile_diller_baglanmasi_idx` (`konusmaci_id`),
  CONSTRAINT `diller_ile_konusmaci_baglanmasi` FOREIGN KEY (`dil_id`) REFERENCES `diller` (`dil_id`),
  CONSTRAINT `konusmaci_ile_diller_baglanmasi` FOREIGN KEY (`konusmaci_id`) REFERENCES `konusmacilar` (`konusmaci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konusmaci_dilleri`
--

LOCK TABLES `konusmaci_dilleri` WRITE;
/*!40000 ALTER TABLE `konusmaci_dilleri` DISABLE KEYS */;
/*!40000 ALTER TABLE `konusmaci_dilleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konusmacilar`
--

DROP TABLE IF EXISTS `konusmacilar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konusmacilar` (
  `konusmaci_id` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `internet_sitesi` varchar(255) DEFAULT NULL,
  `kurum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Konusmacinin calistigi kurum',
  `kurum_gorevi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Ne olarak calisiyor kurumda',
  `ana_bilgi_alani_id` int NOT NULL,
  `meslek_id` int NOT NULL,
  `ulke_id` int NOT NULL,
  `sehir` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`konusmaci_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tel` (`tel`),
  KEY `ana_bilgi_alani_id_idx` (`ana_bilgi_alani_id`),
  KEY `konusmaciler_ile_meslekler_baglanmasi_idx` (`meslek_id`),
  KEY `konusmaci_ile_ulke_baglanmasi_idx` (`ulke_id`),
  CONSTRAINT `ana_bilgi_alani_ile_bilgi_alanlari_baglanmasi` FOREIGN KEY (`ana_bilgi_alani_id`) REFERENCES `bilgi_alanlari` (`bilgi_alani_id`),
  CONSTRAINT `konusmaci_ile_ulke_baglanmasi` FOREIGN KEY (`ulke_id`) REFERENCES `ulkeler` (`ulke_id`),
  CONSTRAINT `konusmaciler_ile_meslekler_baglanmasi` FOREIGN KEY (`meslek_id`) REFERENCES `meslekler` (`meslek_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konusmacilar`
--

LOCK TABLES `konusmacilar` WRITE;
/*!40000 ALTER TABLE `konusmacilar` DISABLE KEYS */;
/*!40000 ALTER TABLE `konusmacilar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konusmaciler_diger_bilgi_alanlar`
--

DROP TABLE IF EXISTS `konusmaciler_diger_bilgi_alanlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konusmaciler_diger_bilgi_alanlar` (
  `uyenin_favori_bilgi_alanlar_id` int NOT NULL AUTO_INCREMENT,
  `konusmaci_id` int NOT NULL,
  `bilgi_alani_id` int NOT NULL,
  PRIMARY KEY (`uyenin_favori_bilgi_alanlar_id`),
  KEY `bilgi_alani_idx` (`bilgi_alani_id`),
  KEY `uyeler_ile_bilgi_alanlari_baglanmasi_idx` (`konusmaci_id`),
  CONSTRAINT `konusmaci_ile_bilgi_alanlar_baglamak` FOREIGN KEY (`bilgi_alani_id`) REFERENCES `bilgi_alanlari` (`bilgi_alani_id`),
  CONSTRAINT `konusmaciler_ile_diger_bilgi_alanlari_baglanmasi` FOREIGN KEY (`konusmaci_id`) REFERENCES `konusmacilar` (`konusmaci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konusmaciler_diger_bilgi_alanlar`
--

LOCK TABLES `konusmaciler_diger_bilgi_alanlar` WRITE;
/*!40000 ALTER TABLE `konusmaciler_diger_bilgi_alanlar` DISABLE KEYS */;
/*!40000 ALTER TABLE `konusmaciler_diger_bilgi_alanlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meslekler`
--

DROP TABLE IF EXISTS `meslekler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meslekler` (
  `meslek_id` int NOT NULL AUTO_INCREMENT,
  `baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`meslek_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meslekler`
--

LOCK TABLES `meslekler` WRITE;
/*!40000 ALTER TABLE `meslekler` DISABLE KEYS */;
INSERT INTO `meslekler` VALUES (1,'Biyomedikal Mühendisliği'),(2,'Yazılım Mühendisliği'),(3,'Mali Planlayıcı'),(4,'Diş Sağlığı Uzmanı'),(5,'Aktüer'),(6,'Odyolog'),(7,'Mesleki Terapist'),(8,'Optometrist ( Gözlük veya kontakt lens işleri)'),(9,'Fizyoterapist'),(10,'Bilgisayar Sistem Analisti'),(11,'Kayropraktik Uzmanı'),(12,'Konuşma Bozuklukları Uzmanı'),(13,'Fizyolog (İnsan vücudu ile ilgili problemlerin çözüme kavuşturulması)'),(14,'Üniversite Profesörü'),(15,'Veteriner'),(16,'Diyetisyen'),(17,'Eczacı'),(18,'Matematikçi'),(19,'Sosyolog'),(20,'İstatistikçi'),(21,'Fizikçi'),(22,'Gözlükçü'),(23,'Ayak Hastalıkları Uzmanı'),(24,'Web Geliştirici'),(25,'Tarihçi'),(26,'Çevre Mühendisi'),(27,'Şartlı Tahliye Memuru'),(28,'Petrol Mühendisliği'),(29,'Meteoroloji Uzmanı'),(30,'Jeolog'),(31,'İnsan Kaynakları Müdürü'),(32,'İnşaat Mühendisi'),(33,'Ortodonti Uzmanı'),(34,'Solunum Terapisti'),(35,'Tıbbi Kayıtlar Teknisyeni'),(36,'Astronom'),(37,'Psikiyatrist'),(38,'Bilgisayar Programcısı'),(39,'Sosyal ve Topluluk Müdürü/ Yöneticisi'),(40,'Pazar Araştırma Analisti'),(41,'Avukat Yardımcısı'),(42,'Dişçi'),(43,'Cilt Bakım Uzmanı'),(44,'Endüstriyel Makine Tamircileri'),(45,'Hekim (Genel Uygulama)'),(46,'Lojistik'),(47,'Muhasebeci'),(48,'Yönetim Danışmanı'),(49,'Sosyal Hizmet Uzmanı'),(50,'Hekim Yardımcısı'),(51,'Cerrah'),(52,'Meslek Danışmanı'),(53,'Duvar Ustası'),(54,'Bilirkişi'),(55,'Hemşire'),(56,'Arkeolog'),(57,'Müze Müdürü'),(58,'Psikolog'),(59,'Cam Ustası'),(60,'Teknik Yazar');
/*!40000 ALTER TABLE `meslekler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salonlar`
--

DROP TABLE IF EXISTS `salonlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salonlar` (
  `salon_id` int NOT NULL AUTO_INCREMENT,
  `koltuk_sayisi` int NOT NULL,
  PRIMARY KEY (`salon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salonlar`
--

LOCK TABLES `salonlar` WRITE;
/*!40000 ALTER TABLE `salonlar` DISABLE KEYS */;
/*!40000 ALTER TABLE `salonlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulkeler`
--

DROP TABLE IF EXISTS `ulkeler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulkeler` (
  `ulke_id` int NOT NULL,
  `isim` varchar(50) NOT NULL,
  PRIMARY KEY (`ulke_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulkeler`
--

LOCK TABLES `ulkeler` WRITE;
/*!40000 ALTER TABLE `ulkeler` DISABLE KEYS */;
INSERT INTO `ulkeler` VALUES (1,'Abhazya'),(2,'Afganistan'),(3,'Almanya'),(4,'Amerika Birleşik Devletleri'),(5,'Andorra'),(6,'Angola'),(7,'Antigua ve Barbuda'),(8,'Arjantin'),(9,'Arnavutluk'),(10,'Avustralya'),(11,'Avusturya'),(12,'Azerbaycan'),(13,'Bahamalar'),(14,'Bahreyn'),(15,'Bangladeş'),(16,'Barbados'),(17,'Batı Sahra'),(18,'Belarus'),(19,'Belçika'),(20,'Belize'),(21,'Benin'),(22,'Bhutan'),(23,'Birleşik Arap Emirlikleri'),(24,'Bolivya'),(25,'Bosna Hersek'),(26,'Botsvana'),(27,'Brezilya'),(28,'Brunei'),(29,'Bulgaristan'),(30,'Burkina Faso'),(31,'Burundi'),(32,'Cezayir'),(33,'Cibuti Cumhuriyeti'),(34,'Çad'),(35,'Çek Cumhuriyeti'),(36,'Çin Halk Cumhuriyeti'),(37,'Dağlık Karabağ Cumhuriyeti'),(38,'Danimarka'),(39,'Doğu Timor'),(40,'Dominik Cumhuriyeti'),(41,'Dominika'),(42,'Ekvador'),(43,'Ekvator Ginesi'),(44,'El Salvador'),(45,'Endonezya'),(46,'Eritre'),(47,'Ermenistan'),(48,'Estonya'),(49,'Etiyopya'),(50,'Fas'),(51,'Fiji'),(52,'Fildişi Sahilleri'),(53,'Filipinler'),(54,'Filistin'),(55,'Finlandiya'),(56,'Fransa'),(57,'Gabon'),(58,'Gambiya'),(59,'Gana'),(60,'Gine Bissau'),(61,'Gine'),(62,'Grenada'),(63,'Guyana'),(64,'Guatemala'),(65,'Güney Afrika Cumhuriyeti'),(66,'Güney Kore'),(67,'Güney Osetya'),(68,'Gürcistan'),(69,'Haiti'),(70,'Hırvatistan'),(71,'Hindistan'),(72,'Hollanda'),(73,'Honduras'),(74,'Irak'),(75,'İngiltere'),(76,'İran'),(77,'İrlanda'),(78,'İspanya'),(79,'İsrail'),(80,'İsveç'),(81,'İsviçre'),(82,'İtalya'),(83,'İzlanda'),(84,'Jamaika'),(85,'Japonya'),(86,'Kamboçya'),(87,'Kamerun'),(88,'Kanada'),(89,'Karadağ'),(90,'Katar'),(91,'Kazakistan'),(92,'Kenya'),(93,'Kırgızistan'),(94,'Kıbrıs Cumhuriyeti'),(95,'Kiribati'),(96,'Kolombiya'),(97,'Komorlar'),(98,'Kongo'),(99,'Kongo Demokratik Cumhuriyeti'),(100,'Kosova'),(101,'Kosta Rika'),(102,'Kuveyt'),(103,'Kuzey Kıbrıs Türk Cumhuriyeti'),(104,'Kuzey Kore'),(105,'Küba'),(106,'Lakota Cumhuriyeti'),(107,'Laos'),(108,'Lesotho'),(109,'Letonya'),(110,'Liberya'),(111,'Libya'),(112,'Liechtenstein'),(113,'Litvanya'),(114,'Lübnan'),(115,'Lüksemburg'),(116,'Macaristan'),(117,'Madagaskar'),(118,'Makedonya Cumhuriyeti'),(119,'Malavi'),(120,'Maldivler'),(121,'Malezya'),(122,'Mali'),(123,'Malta'),(124,'Marshall Adaları'),(125,'Meksika'),(126,'Mısır'),(127,'Mikronezya'),(128,'Moğolistan'),(129,'Moldova'),(130,'Monako'),(131,'Moritanya'),(132,'Moritus'),(133,'Mozambik'),(134,'Myanmar'),(135,'Namibya'),(136,'Nauru'),(137,'Nepal'),(138,'Nikaragua'),(139,'Nijer'),(140,'Nijerya'),(141,'Norveç'),(142,'Orta Afrika Cumhuriyeti'),(143,'Özbekistan'),(144,'Pakistan'),(145,'Palau'),(146,'Panama'),(147,'Papua Yeni Gine'),(148,'Paraguay'),(149,'Peru'),(150,'Polonya'),(151,'Portekiz'),(152,'Romanya'),(153,'Ruanda'),(154,'Rusya Federasyonu'),(155,'Saint Kitts ve Nevis'),(156,'Saint Lucia'),(157,'Saint Vincent ve Grenadinler'),(158,'Samoa'),(159,'San Marino'),(160,'Sao Tome ve Principe'),(161,'Sealand'),(162,'Senegal'),(163,'Seyşeller'),(164,'Sırbistan'),(165,'Sierra Leone'),(166,'Singapur'),(167,'Slovakya'),(168,'Slovenya'),(169,'Solomon Adaları'),(170,'Somali'),(171,'Somaliland'),(172,'Sri Lanka'),(173,'Sudan'),(174,'Surinam'),(175,'Suudi Arabistan'),(176,'Suriye'),(177,'Svaziland'),(178,'Şili'),(179,'Tacikistan'),(180,'Tamil Eelam'),(181,'Tanzanya'),(182,'Tayland'),(183,'Tayvan'),(184,'Togo'),(185,'Tonga'),(186,'Transdinyester'),(187,'Trinidad ve Tobago'),(188,'Tunus'),(189,'Tuvalu'),(190,'Türkiye'),(191,'Türkmenistan'),(192,'Uganda'),(193,'Ukrayna'),(194,'Umman'),(195,'Uruguay'),(196,'Ürdün'),(197,'Vanuatu'),(198,'Vatikan'),(199,'Venezuela'),(200,'Vietnam'),(201,'Yemen'),(202,'Yeni Zelanda'),(203,'Yeşil Burun'),(204,'Yunanistan'),(205,'Zambiya'),(206,'Zimbabve');
/*!40000 ALTER TABLE `ulkeler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uyeler`
--

DROP TABLE IF EXISTS `uyeler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uyeler` (
  `uye_id` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL,
  `soyada` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `meslek` int NOT NULL,
  `ulke_id` int NOT NULL,
  `sehir` varchar(50) DEFAULT NULL,
  `sifre` varchar(5) NOT NULL,
  PRIMARY KEY (`uye_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tel` (`tel`),
  KEY `ulke_ile_uye_baglanmasi_idx` (`ulke_id`),
  KEY `uyeler_ile_meslekleri_baglanmasi_idx` (`meslek`),
  CONSTRAINT `ulke_ile_uye_baglanmasi` FOREIGN KEY (`ulke_id`) REFERENCES `ulkeler` (`ulke_id`),
  CONSTRAINT `uyeler_ile_meslekleri_baglanmasi` FOREIGN KEY (`meslek`) REFERENCES `meslekler` (`meslek_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uyeler`
--

LOCK TABLES `uyeler` WRITE;
/*!40000 ALTER TABLE `uyeler` DISABLE KEYS */;
/*!40000 ALTER TABLE `uyeler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uyelerin_dilleri`
--

DROP TABLE IF EXISTS `uyelerin_dilleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uyelerin_dilleri` (
  `uye_dili_id` int NOT NULL,
  `dil_id` int NOT NULL,
  `uye_id` int NOT NULL,
  PRIMARY KEY (`uye_dili_id`),
  KEY `uyeler_ile_diller_baglanmasi_idx` (`uye_id`),
  KEY `diller_ile_ uyeler_balanmasi_idx` (`dil_id`),
  CONSTRAINT `diller_ile_ uyeler_balanmasi` FOREIGN KEY (`dil_id`) REFERENCES `diller` (`dil_id`),
  CONSTRAINT `uyeler_ile_diller_baglanmasi` FOREIGN KEY (`uye_id`) REFERENCES `uyeler` (`uye_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uyelerin_dilleri`
--

LOCK TABLES `uyelerin_dilleri` WRITE;
/*!40000 ALTER TABLE `uyelerin_dilleri` DISABLE KEYS */;
/*!40000 ALTER TABLE `uyelerin_dilleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uyelerin_favori_bilgi_alanlari`
--

DROP TABLE IF EXISTS `uyelerin_favori_bilgi_alanlari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uyelerin_favori_bilgi_alanlari` (
  `favori_alan_id` int NOT NULL AUTO_INCREMENT,
  `uye_id` int NOT NULL,
  `bilgi_alani_id` int NOT NULL,
  PRIMARY KEY (`favori_alan_id`),
  KEY `uyeler_ile_favori_alanlari_baglanmasi_idx` (`uye_id`),
  KEY `favori_bilgi_alanlari_ile_uyeleri_baglanmasi_idx` (`bilgi_alani_id`),
  CONSTRAINT `favori_bilgi_alanlari_ile_uyeleri_baglanmasi` FOREIGN KEY (`bilgi_alani_id`) REFERENCES `bilgi_alanlari` (`bilgi_alani_id`),
  CONSTRAINT `uyeler_ile_favori_alanlari_baglanmasi` FOREIGN KEY (`uye_id`) REFERENCES `uyeler` (`uye_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uyelerin_favori_bilgi_alanlari`
--

LOCK TABLES `uyelerin_favori_bilgi_alanlari` WRITE;
/*!40000 ALTER TABLE `uyelerin_favori_bilgi_alanlari` DISABLE KEYS */;
/*!40000 ALTER TABLE `uyelerin_favori_bilgi_alanlari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yoneticiler`
--

DROP TABLE IF EXISTS `yoneticiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yoneticiler` (
  `yonetici_id` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `sifre` varchar(5) NOT NULL,
  PRIMARY KEY (`yonetici_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tel` (`tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yoneticiler`
--

LOCK TABLES `yoneticiler` WRITE;
/*!40000 ALTER TABLE `yoneticiler` DISABLE KEYS */;
/*!40000 ALTER TABLE `yoneticiler` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-09 12:09:12
