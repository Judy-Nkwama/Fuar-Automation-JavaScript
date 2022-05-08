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
  `id` int NOT NULL AUTO_INCREMENT,
  `etkinlik_id` int NOT NULL,
  `koltuk_id` int NOT NULL,
  `uye_id` int NOT NULL,
  PRIMARY KEY (`etkinlik_id`,`koltuk_id`),
  UNIQUE KEY `bilet_id` (`id`),
  KEY `koltuk_id-biletler` (`koltuk_id`),
  KEY `uye_id` (`uye_id`),
  CONSTRAINT `etkinlik_id` FOREIGN KEY (`etkinlik_id`) REFERENCES `etkinlikler` (`id`),
  CONSTRAINT `koltuk_id-biletler` FOREIGN KEY (`koltuk_id`) REFERENCES `koltuklar` (`id`),
  CONSTRAINT `uye_id` FOREIGN KEY (`uye_id`) REFERENCES `uyeler` (`id`)
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
  `id` int NOT NULL AUTO_INCREMENT,
  `baslik` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `baslik_UNIQUE` (`baslik`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bilgi_alanlari`
--

LOCK TABLES `bilgi_alanlari` WRITE;
/*!40000 ALTER TABLE `bilgi_alanlari` DISABLE KEYS */;
INSERT INTO `bilgi_alanlari` VALUES (1,'Bitkiler'),(2,'Biyoloji'),(3,'Biyomedikal'),(43,'Bulut Teknologiler'),(5,'Çevre'),(6,'Denizcilik'),(7,'Diş Hekimliği'),(8,'Ebelik'),(24,'Edebiyatı'),(4,'Ekonomi'),(9,'Elektrik'),(10,'Elektronik ve Haberleşme'),(11,'Endüstri'),(12,'Enerji'),(13,'Felsefe'),(14,'Fen'),(15,'Fizik'),(16,'Gastronomi ve Mutfak Sanatları'),(17,'Gazetecilik'),(18,'Görsel İletişim Tasarımı'),(19,'Halkla İlişkiler'),(20,'Hukuk'),(21,'İç Mimarlık'),(22,'İktisat'),(23,'İlahiyat'),(26,'İnşaat'),(27,'İşletme'),(28,'Jeofizik'),(29,'Kimya'),(42,'Makine Ogrenmesi'),(30,'Matematik'),(31,'Mekatronik'),(25,'Öğretmenliği'),(32,'Otomotiv'),(33,'Radyo, Televizyon ve Sinema'),(34,'Rehberlik ve Psikolojik'),(35,'Siyaset'),(36,'Sosyal Hizmet'),(37,'Tarih'),(38,'Tıp'),(39,'Turizm'),(41,'undefined'),(40,'Yazılım');
/*!40000 ALTER TABLE `bilgi_alanlari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diller`
--

DROP TABLE IF EXISTS `diller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `baslik` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diller`
--

LOCK TABLES `diller` WRITE;
/*!40000 ALTER TABLE `diller` DISABLE KEYS */;
INSERT INTO `diller` VALUES (1,'Turkçe'),(2,'İngilizce'),(3,'Arapça'),(4,'Almanca'),(5,'Fince'),(6,'Rusça'),(7,'Farsça'),(8,'Japonca'),(9,'İspanyolca'),(10,'Portekizce'),(11,'Çince'),(12,'Hintçe'),(13,'Korece'),(14,'İtalyanca'),(15,'Kürtçe'),(16,'Azerice'),(17,'Endonezce'),(18,'Özbekçe'),(19,'Yunanca'),(20,'Swahili'),(21,'Lingala');
/*!40000 ALTER TABLE `diller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etkinlik_canli_baglantilari`
--

DROP TABLE IF EXISTS `etkinlik_canli_baglantilari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etkinlik_canli_baglantilari` (
  `id` int NOT NULL AUTO_INCREMENT,
  `baglanti` varchar(255) NOT NULL,
  `etkinlik_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `baglanti_ile_etkinlik_baglanmasi_idx` (`etkinlik_id`),
  CONSTRAINT `baglanti_ile_etkinlik_baglanmasi` FOREIGN KEY (`etkinlik_id`) REFERENCES `etkinlikler` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etkinlik_canli_baglantilari`
--

LOCK TABLES `etkinlik_canli_baglantilari` WRITE;
/*!40000 ALTER TABLE `etkinlik_canli_baglantilari` DISABLE KEYS */;
INSERT INTO `etkinlik_canli_baglantilari` VALUES (1,'https://www.youtube.com/watch?v=5WyDkKCq-j0',2),(2,'https://www.youtube.com/watch?v=IV1EW8TYQ28',1);
/*!40000 ALTER TABLE `etkinlik_canli_baglantilari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etkinlik_turleri`
--

DROP TABLE IF EXISTS `etkinlik_turleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etkinlik_turleri` (
  `id` int NOT NULL AUTO_INCREMENT,
  `baslik` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etkinlik_turleri`
--

LOCK TABLES `etkinlik_turleri` WRITE;
/*!40000 ALTER TABLE `etkinlik_turleri` DISABLE KEYS */;
INSERT INTO `etkinlik_turleri` VALUES (1,'Kongre'),(2,'Konferans'),(3,'Forum'),(4,'Seminer'),(5,'Sympozyum');
/*!40000 ALTER TABLE `etkinlik_turleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etkinlikler`
--

DROP TABLE IF EXISTS `etkinlikler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etkinlikler` (
  `id` int NOT NULL AUTO_INCREMENT,
  `baslik` varchar(255) NOT NULL,
  `tarih` date NOT NULL,
  `konuya_giris_metni` text,
  `baslangic_saati` time NOT NULL,
  `bitis_saati` time NOT NULL,
  `salon_id` int NOT NULL,
  `etkinlik_dili_id` int NOT NULL,
  `etkinlik_turu_id` int NOT NULL,
  `arka_plan_linki` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fuar_veri_tabani-salon_id` (`salon_id`),
  KEY `ekinlik_ile_dilini_baglanmasi_idx` (`etkinlik_dili_id`),
  KEY `ekinlik_ve_turune_baglamak_idx` (`etkinlik_turu_id`),
  CONSTRAINT `ekinlik_ile_dilini_baglanmasi` FOREIGN KEY (`etkinlik_dili_id`) REFERENCES `diller` (`id`),
  CONSTRAINT `ekinlik_ve_turune_baglamak` FOREIGN KEY (`etkinlik_turu_id`) REFERENCES `etkinlik_turleri` (`id`),
  CONSTRAINT `fuar_veri_tabani-salon_id` FOREIGN KEY (`salon_id`) REFERENCES `salonlar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etkinlikler`
--

LOCK TABLES `etkinlikler` WRITE;
/*!40000 ALTER TABLE `etkinlikler` DISABLE KEYS */;
INSERT INTO `etkinlikler` VALUES (1,'Atoma inanmayin. Sorgulayın!','2022-04-15','Erkcan Özcan, daha çok küçük yaşlarda başlayan bilime olan aşkını, ilkokuldan CERN\'e uzanan \'Fizikçi\' olma macerasını bizlerle esprili bir dille paylaşıyor. \'Benim dediğime ya da gösterdiğime inanmayın\' diyen Özcan, bilimin sorgulayarak ilerleyeceğini bizlere bir kez daha örneklerle gösteriyor.','18:30:00','20:00:00',1,1,1,'https://haberler.boun.edu.tr/sites/haberler.boun.edu.tr/files/kapak-ve-haber-resimleri/57862c1b196821.jpg'),(2,'Bilim İnsanının Katmanları','2022-05-16','Eskiden bilim \' adamları \' nasıldı, peki şimdi nasıl? Mete Atatüre, günümüzün değişen bilim insanı kavramını katmanlarıyla açıklıyor. ','17:30:00','21:00:00',2,1,1,'https://www.esciupfnews.com/wp-content/uploads/2021/01/Evolution-COVID19-Lao.jpg');
/*!40000 ALTER TABLE `etkinlikler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etkinliklerin_konusmacilari`
--

DROP TABLE IF EXISTS `etkinliklerin_konusmacilari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etkinliklerin_konusmacilari` (
  `id` int NOT NULL AUTO_INCREMENT,
  `konusmaci_id` int NOT NULL,
  `etkinlik_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `etkinlik_konusmaci_baglantisi_idx` (`etkinlik_id`),
  KEY `konusmaci_etkinlik_id_idx` (`konusmaci_id`),
  CONSTRAINT `etkinlik_konusmaci_baglantisi` FOREIGN KEY (`etkinlik_id`) REFERENCES `etkinlikler` (`id`),
  CONSTRAINT `konusmaci_etkinlik_id` FOREIGN KEY (`konusmaci_id`) REFERENCES `konusmacilar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etkinliklerin_konusmacilari`
--

LOCK TABLES `etkinliklerin_konusmacilari` WRITE;
/*!40000 ALTER TABLE `etkinliklerin_konusmacilari` DISABLE KEYS */;
INSERT INTO `etkinliklerin_konusmacilari` VALUES (1,1,1),(2,1,2),(3,2,2);
/*!40000 ALTER TABLE `etkinliklerin_konusmacilari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etkinliklerin_yonelik_olduklari_bilgi_alanlari`
--

DROP TABLE IF EXISTS `etkinliklerin_yonelik_olduklari_bilgi_alanlari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etkinliklerin_yonelik_olduklari_bilgi_alanlari` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bilgi_alani_id` int NOT NULL,
  `etkinlik_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `etkinlik_ile_biligi_alani_baglanmasi_idx` (`bilgi_alani_id`),
  KEY `etkinlik_ile_biligi_alani_baglanmasi` (`etkinlik_id`),
  CONSTRAINT `biligi_alani_ile_etkinlik_naglanmasi` FOREIGN KEY (`bilgi_alani_id`) REFERENCES `bilgi_alanlari` (`id`),
  CONSTRAINT `etkinlik_ile_biligi_alani_baglanmasi` FOREIGN KEY (`etkinlik_id`) REFERENCES `etkinlikler` (`id`)
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
  `id` int NOT NULL AUTO_INCREMENT,
  `salon_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `salon_id` (`salon_id`),
  CONSTRAINT `salon_id` FOREIGN KEY (`salon_id`) REFERENCES `salonlar` (`id`)
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
  `id` int NOT NULL AUTO_INCREMENT,
  `dil_id` int NOT NULL,
  `konusmaci_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `diller_ile_konusmaci_baglanmasi_idx` (`dil_id`),
  KEY `konusmaci_ile_diller_baglanmasi_idx` (`konusmaci_id`),
  CONSTRAINT `diller_ile_konusmaci_baglanmasi` FOREIGN KEY (`dil_id`) REFERENCES `diller` (`id`),
  CONSTRAINT `konusmaci_ile_diller_baglanmasi` FOREIGN KEY (`konusmaci_id`) REFERENCES `konusmacilar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konusmaci_dilleri`
--

LOCK TABLES `konusmaci_dilleri` WRITE;
/*!40000 ALTER TABLE `konusmaci_dilleri` DISABLE KEYS */;
INSERT INTO `konusmaci_dilleri` VALUES (1,7,2),(2,2,1),(3,3,1),(4,3,2),(5,1,2),(6,2,2),(7,6,2);
/*!40000 ALTER TABLE `konusmaci_dilleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konusmacilar`
--

DROP TABLE IF EXISTS `konusmacilar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konusmacilar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `internet_sitesi` varchar(255) DEFAULT NULL,
  `kurum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Konusmacinin calistigi kurum',
  `kurum_gorevi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Ne olarak calisiyor kurumda',
  `hakkinda` varchar(1000) DEFAULT NULL,
  `profil` varchar(255) DEFAULT NULL,
  `sehir` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ana_bilgi_alani_id` int NOT NULL,
  `meslek_id` int NOT NULL,
  `ulke_id` int NOT NULL,
  `sifre` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tel` (`tel`),
  KEY `ana_bilgi_alani_id_idx` (`ana_bilgi_alani_id`),
  KEY `konusmaciler_ile_meslekler_baglanmasi_idx` (`meslek_id`),
  KEY `konusmaci_ile_ulke_baglanmasi_idx` (`ulke_id`),
  CONSTRAINT `ana_bilgi_alani_ile_bilgi_alanlari_baglanmasi` FOREIGN KEY (`ana_bilgi_alani_id`) REFERENCES `bilgi_alanlari` (`id`),
  CONSTRAINT `konusmaci_ile_ulke_baglanmasi` FOREIGN KEY (`ulke_id`) REFERENCES `ulkeler` (`id`),
  CONSTRAINT `konusmaciler_ile_meslekler_baglanmasi` FOREIGN KEY (`meslek_id`) REFERENCES `meslekler` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konusmacilar`
--

LOCK TABLES `konusmacilar` WRITE;
/*!40000 ALTER TABLE `konusmacilar` DISABLE KEYS */;
INSERT INTO `konusmacilar` VALUES (1,'Erkcan','Özcan','erkcan@gmail.com','+90873648764','https://www.linkedin.com/in/erkcan/?originalSubdomain=tr','Professor of Physics at Boğaziçi University','Academisyen','Lisans eğitimini 1995-1999 arasında Orta Doğu Teknik Üniversitesi’nde elektrik-elektronik mühendisliği ve fizik dallarında tamamlayan Prof. Dr. Erkcan Özcan, deneysel parçacık fiziği üzerine olan doktora derecesini Stanford Üniversitesi’nden aldı. 2006-2010 döneminde University College London adına önce Londra’da, daha sonra İsviçre’deki CERN araştırma merkezinde çalıştı. 2011 başında Boğaziçi Üniversitesi Fizik Bölümü kadrosuna katılan Özcan, halen Boğaziçi CERN ATLAS takımının liderliğini ve KAHVELab (Kandilli Algıç, Hızlandırıcı ve Enstrümantasyon Laboratuvarı) yürütücülüğünü sürdürmektedir. Bilim Akademisi Derneği, Bilim Kahramanları Derneği, Türk Fizik Derneği ve TÜBİTAK tarafından çeşitli ödüllere layık görülmüştür. This talk was given at a TEDx event using the TED conference format but independently organized by a local community',NULL,'Bozci',15,21,190,'24435'),(2,'Mete','Atatüre','mete@gmail.com','+90783674689','https://www.phy.cam.ac.uk/directory/ataturem','Cambridge University','Academisyen','Bilkent Üniversitesi Fizik bölümünden 1996 yılında mezun oldu. Aynı yıl Boston Üniversitesi Kuantum Görüntüleme Laboratuvarinda çok parametreli dolanıklık ve kuantum girişim alanında doktora çalışmalarına başladı. 2002 yılında doktorasını alan Atatüre, ETH Zurih’te Profesör Atac Imamoglu’nun grubunda araştırma görevlisi olarak yer aldı. 2007 yılında Cambridge Üniversitesi Fizik bölümü ’nde öğretim üyesi olarak katılıp kendi araştırma grubunu kurdu, 2015 yılında profesör oldu. Halen aynı bölümde kuantum malzeme ve sistemler konusunda ekibiyle beraber araştırmalarına devam etmekte olan Atatüre, Institute of Physics ve Bilim Akademisi Derneği üyesidir. ','https://upload.wikimedia.org/wikipedia/commons/8/81/Mete_Atatüre.jpg','Ankara',15,21,190,'54653');
/*!40000 ALTER TABLE `konusmacilar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konusmaciler_diger_bilgi_alanlar`
--

DROP TABLE IF EXISTS `konusmaciler_diger_bilgi_alanlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konusmaciler_diger_bilgi_alanlar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `konusmaci_id` int NOT NULL,
  `bilgi_alani_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bilgi_alani_idx` (`bilgi_alani_id`),
  KEY `uyeler_ile_bilgi_alanlari_baglanmasi_idx` (`konusmaci_id`),
  CONSTRAINT `konusmaci_ile_bilgi_alanlar_baglamak` FOREIGN KEY (`bilgi_alani_id`) REFERENCES `bilgi_alanlari` (`id`),
  CONSTRAINT `konusmaciler_ile_diger_bilgi_alanlari_baglanmasi` FOREIGN KEY (`konusmaci_id`) REFERENCES `konusmacilar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konusmaciler_diger_bilgi_alanlar`
--

LOCK TABLES `konusmaciler_diger_bilgi_alanlar` WRITE;
/*!40000 ALTER TABLE `konusmaciler_diger_bilgi_alanlar` DISABLE KEYS */;
INSERT INTO `konusmaciler_diger_bilgi_alanlar` VALUES (1,2,4),(2,2,2),(3,2,3),(4,2,4);
/*!40000 ALTER TABLE `konusmaciler_diger_bilgi_alanlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meslekler`
--

DROP TABLE IF EXISTS `meslekler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meslekler` (
  `id` int NOT NULL AUTO_INCREMENT,
  `baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meslekler`
--

LOCK TABLES `meslekler` WRITE;
/*!40000 ALTER TABLE `meslekler` DISABLE KEYS */;
INSERT INTO `meslekler` VALUES (1,'Biyomedikal Mühendisliği'),(2,'Yazılım Mühendisliği'),(3,'Mali Planlayıcı'),(4,'Diş Sağlığı Uzmanı'),(5,'Aktüer'),(6,'Odyolog'),(7,'Mesleki Terapist'),(8,'Optometrist ( Gözlük veya kontakt lens işleri)'),(9,'Fizyoterapist'),(10,'Bilgisayar Sistem Analisti'),(11,'Kayropraktik Uzmanı'),(12,'Konuşma Bozuklukları Uzmanı'),(13,'Fizyolog (İnsan vücudu ile ilgili problemlerin çözüme kavuşturulması)'),(14,'Üniversite Profesörü'),(15,'Veteriner'),(16,'Diyetisyen'),(17,'Eczacı'),(18,'Matematikçi'),(19,'Sosyolog'),(20,'İstatistikçi'),(21,'Fizikçi'),(22,'Gözlükçü'),(23,'Ayak Hastalıkları Uzmanı'),(24,'Web Geliştirici'),(25,'Tarihçi'),(26,'Çevre Mühendisi'),(27,'Şartlı Tahliye Memuru'),(28,'Petrol Mühendisliği'),(29,'Meteoroloji Uzmanı'),(30,'Jeolog'),(31,'İnsan Kaynakları Müdürü'),(32,'İnşaat Mühendisi'),(33,'Ortodonti Uzmanı'),(34,'Solunum Terapisti'),(35,'Tıbbi Kayıtlar Teknisyeni'),(36,'Astronom'),(37,'Psikiyatrist'),(38,'Bilgisayar Programcısı'),(39,'Sosyal ve Topluluk Müdürü/ Yöneticisi'),(40,'Pazar Araştırma Analisti'),(41,'Avukat Yardımcısı'),(42,'Dişçi'),(43,'Cilt Bakım Uzmanı'),(44,'Endüstriyel Makine Tamircileri'),(45,'Hekim (Genel Uygulama)'),(46,'Lojistik'),(47,'Muhasebeci'),(48,'Yönetim Danışmanı'),(49,'Sosyal Hizmet Uzmanı'),(50,'Hekim Yardımcısı'),(51,'Cerrah'),(52,'Meslek Danışmanı'),(53,'Duvar Ustası'),(54,'Bilirkişi'),(55,'Hemşire'),(56,'Arkeolog'),(57,'Müze Müdürü'),(58,'Psikolog'),(59,'Cam Ustası'),(60,'Teknik Yazar'),(61,'Bilgisayar Mühendisi');
/*!40000 ALTER TABLE `meslekler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salonlar`
--

DROP TABLE IF EXISTS `salonlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salonlar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salon_adi` varchar(50) DEFAULT NULL,
  `koltuk_sayisi` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salonlar`
--

LOCK TABLES `salonlar` WRITE;
/*!40000 ALTER TABLE `salonlar` DISABLE KEYS */;
INSERT INTO `salonlar` VALUES (1,'Alfa',50),(2,'Beta',100),(3,'Gamma',150);
/*!40000 ALTER TABLE `salonlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulkeler`
--

DROP TABLE IF EXISTS `ulkeler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulkeler` (
  `id` int NOT NULL,
  `isim` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
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
  `id` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL,
  `soyadi` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `meslek_id` int NOT NULL,
  `ulke_id` int NOT NULL,
  `sehir` varchar(50) DEFAULT NULL,
  `sifre` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tel` (`tel`),
  KEY `ulke_ile_uye_baglanmasi_idx` (`ulke_id`),
  KEY `uyeler_ile_meslekleri_baglanmasi_idx` (`meslek_id`),
  CONSTRAINT `ulke_ile_uye_baglanmasi` FOREIGN KEY (`ulke_id`) REFERENCES `ulkeler` (`id`),
  CONSTRAINT `uyeler_ile_meslekleri_baglanmasi` FOREIGN KEY (`meslek_id`) REFERENCES `meslekler` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uyeler`
--

LOCK TABLES `uyeler` WRITE;
/*!40000 ALTER TABLE `uyeler` DISABLE KEYS */;
INSERT INTO `uyeler` VALUES (1,'Judy','Nkwama','nkwamajudy@gmail.com','+905386057751',2,99,'Kinshasa','12345'),(2,'Fatma','Nur','fatmanur@gmail.com','+90538787798',38,190,'Kinshasa','12345'),(3,'Derya','Hilal','deryahilal@gmail.com','+905647678',38,190,'Izmit','12345'),(4,'Amouro','Gason','mourg32@protonmail.com','+33769776779',20,15,'BUDAPEST','00000');
/*!40000 ALTER TABLE `uyeler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uyelerin_dilleri`
--

DROP TABLE IF EXISTS `uyelerin_dilleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uyelerin_dilleri` (
  `id` int NOT NULL,
  `dil_id` int NOT NULL,
  `uye_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uyeler_ile_diller_baglanmasi_idx` (`uye_id`),
  KEY `diller_ile_ uyeler_balanmasi_idx` (`dil_id`),
  CONSTRAINT `diller_ile_ uyeler_balanmasi` FOREIGN KEY (`dil_id`) REFERENCES `diller` (`id`),
  CONSTRAINT `uyeler_ile_diller_baglanmasi` FOREIGN KEY (`uye_id`) REFERENCES `uyeler` (`id`)
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
  `id` int NOT NULL AUTO_INCREMENT,
  `uye_id` int NOT NULL,
  `bilgi_alani_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uyeler_ile_favori_alanlari_baglanmasi_idx` (`uye_id`),
  KEY `favori_bilgi_alanlari_ile_uyeleri_baglanmasi_idx` (`bilgi_alani_id`),
  CONSTRAINT `favori_bilgi_alanlari_ile_uyeleri_baglanmasi` FOREIGN KEY (`bilgi_alani_id`) REFERENCES `bilgi_alanlari` (`id`),
  CONSTRAINT `uyeler_ile_favori_alanlari_baglanmasi` FOREIGN KEY (`uye_id`) REFERENCES `uyeler` (`id`)
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
  `id` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `sifre` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tel` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yoneticiler`
--

LOCK TABLES `yoneticiler` WRITE;
/*!40000 ALTER TABLE `yoneticiler` DISABLE KEYS */;
INSERT INTO `yoneticiler` VALUES (1,'Judy','Nkwama','nkwamajudy@gmail.com','+243814702818','11111');
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

-- Dump completed on 2022-04-13 20:48:38
