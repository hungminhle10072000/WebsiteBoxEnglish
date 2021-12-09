CREATE DATABASE  IF NOT EXISTS `dbboxenglish` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbboxenglish`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: dbboxenglish
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `cate_user`
--

DROP TABLE IF EXISTS `cate_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cate_user` (
  `category_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`category_id`,`user_id`),
  KEY `FK6u8tfbgchcylhawhdcbkvpxvc` (`user_id`),
  CONSTRAINT `FK6q7mwd039g0n2599cdpy9h4uf` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK6u8tfbgchcylhawhdcbkvpxvc` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cate_user`
--

LOCK TABLES `cate_user` WRITE;
/*!40000 ALTER TABLE `cate_user` DISABLE KEYS */;
INSERT INTO `cate_user` VALUES (131,1),(1,2),(8,2),(9,2),(134,25),(135,25);
/*!40000 ALTER TABLE `cate_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `isDelete` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  `createDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl5j9gx04mfmjcjfeoms8pv2iw` (`user_id`),
  CONSTRAINT `FKl5j9gx04mfmjcjfeoms8pv2iw` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (8,'Từ vựng lấy từ cuốn 600 essential words for TOEIC của Barron. Đã hoàn tất 50 bài với sự giúp sức của các bạn : EspritdeJune, lminhthua, sonntuit, SeaRain, ngduyinfo......','inventory.jpg',0,'inventory',3,'2021-12-08'),(9,'Từ vựng lấy từ cuốn 600 essential words for TOEIC của Barron. Đã hoàn tất 50 bài với sự giúp sức của các bạn : EspritdeJune, lminhthua, sonntuit, SeaRain, ngduyinfo......','pharmacy.jpg',0,'Pharmacy',3,'2021-12-08'),(129,'Từ vựng lấy từ cuốn 600 essential words for TOEIC của Barron. Đã hoàn tất 50 bài với sự giúp sức của các bạn : EspritdeJune, lminhthua, sonntuit, SeaRain, ngduyinfo......','contracts.jpg',0,'Contracts - Hợp Đồng',3,'2021-12-08'),(131,'Từ vựng lấy từ cuốn 600 essential words for TOEIC của Barron. Đã hoàn tất 50 bài với sự giúp sức của các bạn : EspritdeJune, lminhthua, sonntuit, SeaRain, ngduyinfo......','computers_and_the_internet.jpg',0,'Computers - Máy Vi Tính',3,'2021-12-08'),(134,'Từ vựng lấy từ cuốn 600 essential words for TOEIC của Barron. Đã hoàn tất 50 bài với sự giúp sức của các bạn : EspritdeJune, lminhthua, sonntuit, SeaRain, ngduyinfo......','TheFamily.png',0,'The Family',3,'2021-12-08'),(135,'Từ vựng lấy từ cuốn 600 essential words for TOEIC của Barron. Đã hoàn tất 50 bài với sự giúp sức của các bạn : EspritdeJune, lminhthua, sonntuit, SeaRain, ngduyinfo......','Vegetables.png',0,'Vegetables',3,'2021-12-08');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `createDate` date DEFAULT NULL,
  `status` int DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc54ga40twbyiokfflw20i5g92` (`category_id`),
  KEY `FKl5x05d896sa94pw30d8xm1tk3` (`parent_id`),
  KEY `FKb2ja7paeb2wr0dja38ybmo79o` (`user_id`),
  CONSTRAINT `FKb2ja7paeb2wr0dja38ybmo79o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKc54ga40twbyiokfflw20i5g92` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKl5x05d896sa94pw30d8xm1tk3` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (104,'Hello You','2021-12-09',0,NULL,1,9),(105,'@Hoàng Dương Hùng: AB','2021-12-09',0,NULL,1,9),(106,'@Hoàng Dương Hùng: f','2021-12-09',0,105,25,9);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_practice` datetime NOT NULL,
  `isDelete` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `vocabulary_id` bigint DEFAULT NULL,
  `level` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc634j2fciat0gow1yl0j9u35r` (`user_id`),
  KEY `FK45h7bffc149vrbedslrj5ss1h` (`vocabulary_id`),
  CONSTRAINT `FK45h7bffc149vrbedslrj5ss1h` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`),
  CONSTRAINT `FKc634j2fciat0gow1yl0j9u35r` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (116,'2021-12-04 00:00:00',0,2,13,4,3),(117,'2021-12-04 00:00:00',0,2,14,4,3),(118,'2021-12-04 00:00:00',0,2,15,3,0),(119,'2021-12-04 00:00:00',0,2,16,6,3),(120,'2021-12-04 00:00:00',0,2,17,4,3),(139,'2021-12-07 00:00:00',0,2,17,4,3),(140,'2021-12-07 00:00:00',0,2,16,6,3),(141,'2021-12-07 00:00:00',0,2,14,4,3),(142,'2021-12-07 00:00:00',0,2,13,4,3),(143,'2021-12-07 00:00:00',0,2,20,3,3),(144,'2021-12-07 00:00:00',0,2,19,1,3),(145,'2021-12-07 00:00:00',0,2,21,2,3),(146,'2021-12-07 00:00:00',0,2,1,1,3),(147,'2021-12-07 00:00:00',0,2,2,2,3),(148,'2021-12-07 00:00:00',0,2,18,2,3),(149,'2021-12-07 00:00:00',0,2,22,2,3),(150,'2021-12-08 00:00:00',0,2,21,2,0),(151,'2021-12-08 00:00:00',0,2,18,2,0),(152,'2021-12-08 00:00:00',0,2,20,3,1),(153,'2021-12-08 00:00:00',0,2,2,2,0),(154,'2021-12-08 00:00:00',0,2,22,2,0),(155,'2021-12-08 00:00:00',0,2,17,4,0),(156,'2021-12-08 00:00:00',0,2,16,6,1),(157,'2021-12-08 00:00:00',0,2,14,4,0),(158,'2021-12-08 00:00:00',0,2,13,4,0),(159,'2021-12-08 00:00:00',0,1,183,1,2),(160,'2021-12-08 00:00:00',0,1,184,1,2),(161,'2021-12-08 00:00:00',0,1,176,1,2),(162,'2021-12-08 00:00:00',0,1,177,1,3),(163,'2021-12-08 00:00:00',0,1,178,1,2),(164,'2021-12-08 00:00:00',0,1,179,1,2),(165,'2021-12-08 00:00:00',0,1,181,1,2),(166,'2021-12-08 00:00:00',0,25,200,2,2),(167,'2021-12-08 00:00:00',0,25,201,1,2),(168,'2021-12-08 00:00:00',0,25,199,2,2),(169,'2021-12-08 00:00:00',0,25,202,2,2),(170,'2021-12-08 00:00:00',0,25,203,2,2),(171,'2021-12-08 00:00:00',0,25,204,1,2),(172,'2021-12-08 00:00:00',0,25,204,1,0),(173,'2021-12-08 00:00:00',0,25,199,2,1),(174,'2021-12-08 00:00:00',0,25,202,2,1),(175,'2021-12-08 00:00:00',0,25,200,2,1),(176,'2021-12-08 00:00:00',0,25,203,2,1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isDelete` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` int DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'5024454210220_bo-hinh-nen-cristiano-ronaldo-full-hd-phan-1.jpg','Hoàng Dương Hùng',0,'user','0',0,'user','hungduong.mess2000@gmail.com'),(3,'12025854210220_bo-hinh-nen-cristiano-ronaldo-full-hd-phan-1.jpg','Hoàng Dương Hùng',0,'admin','1',0,'admin','hungduong.mess32@gmail.com'),(25,'avatar.jpg','Bùi Văn Nghĩa',0,'nghiauser','0',0,'nghiauser','nghia@gmail.com'),(26,'light.jpg','Nghia Admin',0,'nghiaadmin','1',0,'nghiaadmin','nghiaadmin@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vocabulary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `audio_vocabulary` varchar(255) NOT NULL,
  `example_vocabulary` varchar(255) NOT NULL,
  `explain_vocabulary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image_vocabulary` varchar(255) NOT NULL,
  `isDelete` int NOT NULL,
  `mean_example_vocabulary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mean_vocabulary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `partOfSpeech` varchar(255) DEFAULT NULL,
  `vocabulary` varchar(255) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqgjen0s2me8e3rbftk871a7tq` (`category_id`),
  CONSTRAINT `FKqgjen0s2me8e3rbftk871a7tq` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary`
--

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
INSERT INTO `vocabulary` VALUES (162,'abide_by.mp3','The two parties agreed to abide by the judge\'s decision',' to accept and act according to a law, an agreement','abide_by.jpg',0,'Hai bên đã đồng ý tuân theo quyết định của tòa án.\r\n','(v): tôn trọng, tuân theo, giữ (lời)',NULL,'abide by',129),(163,'agreement.mp3','According to the agreement, the caterer will also supply the flowers for the event','an arrangement, a promise or a contract made with somebody','agreement.jpg',0,'Theo như thỏa thuận, nhà cung cấp lương thực thực phẩm cũng sẽ cung cấp hoa cho sự kiện\r\n',' (n): hợp đồng, giao kèo, sự đồng ý/thỏa thuận với nhau',NULL,'agreement ',129),(165,'cancellation.mp3','The cancelation of her flight caused her problems for the rest of the week','a decision to stop something that has already been arranged from happening','cancellation.jpg',0,'Việc hủy chuyến bay đã gây cho cô ấy nhiều vấn đề trong những ngày còn lại của tuần.\r\n','(n): sự bãi bỏ, hủy bỏ',NULL,'cancellation ',129),(167,'assurance.mp3','The sales associate gave his assurance that the missing keyboard would be replaced the next day.',' a statement that something will certainly be true or will certainly happen','assurance.jpg',0,'Đối tác bán hàng cam đoan rằng ngày mai bàn phím lỗi sẽ được thay.\r\n',' (n): sự cam đoan, bảo đảm, chắc chắn; sự tin chắc, tự tin',NULL,'assurance ',129),(168,'determine.mp3','After reading the contract, I was still unable to detemine if our company was liable for back wages.','to discover the facts about something','determine.jpg',0,'Sau khi đọc hợp đồng, tôi vẫn không thể biết được liệu rằng công ty của chúng tôi có phải chịu trách nhiệm hoàn trả lại lương không','(v): quyết định, xác định, định rõ; quyết tâm, kiên quyết',NULL,'determine ',129),(169,'engage.mp3',' He engaged us in a fascinating discussion about current business law',' to become involved in, to participate','engage.jpg',0,'Anh ấy cùng chúng tôi thảo luận sôi nổi về luật kinh doanh hiện hành','(v): Tham gia, cam kết, (n)sự hứa hẹn, hứa hôn',NULL,'engage ',129),(170,'establish.mp3','The merger of the two company established a powerful new corporation',' to start or create an organization, a system','establish.jpg',0,'Sự liên kết giữa 2 công ty tạo nên một tập đoàn kinh tế hùng mạnh.\r\n','(v): thiết lập, thành lập; xác minh, chứng minh, củng cố',NULL,'establish ',129),(171,'establish.mp3','The contractor was obligated by the contract to work 40 hours a week.','to bind legally or morally','obligate.jpg',0,'Nhà thầu buộc phải làm việc 40 tiếng mỗi tuần.\r\n','(v): bắt buộc, ép buộc',NULL,'obligate ',129),(172,'party.mp3','The parties agreed to settlement in their contract dispute.','one of the people or groups of people involved in a legal agreemen','party.jpg',0,'Các bên đã nhất trí đi đến một thỏa thuận trong hợp đồng gây tranh cãi của họ.\r\n','(n): đảng, phái, đội, nhóm; người tham dự/tham gia; buổi liên hoan, buổi tiệc',NULL,'party ',129),(173,'provision.mp3','The father made provision for his children through his will.\r\n','a condition or an arrangement in a legal document','provision.jpg',0,'Người cha đã truyền lại di chúc cho những đứa con của mình.\r\n',' (n): sự dự liệu, dự trữ, dự phòng, cung cấp; điều khoản',NULL,'provision ',129),(174,'resolve.mp3','The manager resolved to clean out all the files at the end of the week.',' to find an acceptable solution to a problem','resolve.jpg',0,'Cuối tuần, người quản lý đã quyết định xóa sạch tất cả các dữ liệu\r\n','(v, n): (v) giải quyết, (n) sự kiên quyết / sự tin chắc',NULL,'resolve ',129),(175,'specific.mp3','The customer\'s specific complaint was not addressed in his e-mail.','detailed abd exact','specific.jpg',0,'Khiếu nại cụ thể của khách hàng đã không được giải quyết trong Email gửi anh ấy.\r\n','(adj): riêng biệt, cụ thể, đặc trưng; rõ ràng, rành mạch',NULL,'specific ',129),(176,'access.mp3',' You can\'t gain access to the files unless you know the password',' the opportunity or right to use something','access.jpg',0,'Anh không có được quyền truy cập file trừ phi anh biết mật khẩu\r\n','(n, v): (n) lối vào, đường vào, sự/quyền truy cập; (v) truy cập',NULL,'access ',131),(177,'allocate.mp3','The office manager did not allocate enough money to purchase software','to give something officially to somebody / something for a particular purpose','allocate.jpg',0,'Người quản lý văn phòng không cấp đủ tiền để mua sắm phần mềm\r\n','(v): cấp cho, phân phối, phân phát, chia phần; chỉ định, định rõ vị trí',NULL,'allocate ',131),(178,'compatible.mp3','This operating system is not compatible with this model computer','able to be used together','compatible.jpg',0,'Hệ điều hành không tương thích với kiểu máy tính này\r\n',' (adj): tương thích, tương hợp, hợp nhau, có thể dùng được với nhau',NULL,'compatible ',131),(179,'delete.mp3','The technicians deleted all the data on the disk accidentally','to remove something that has been written or printed','delete.png',0,'Kỹ thuật viên đã vô tình xóa mọi dữ liệu trên đĩa\r\n','(v): xóa đi, bỏ đi, gạch đi (to remove, to erase)',NULL,'delete ',131),(180,'display.mp3','The accounting program displays a current balance when opened.',' to put something in a place where people can see it easily','display.jpg',0,'Chương trình kế toán hiển thị một con số cân bằng thu chi khi mở (chương trình đó) ra\r\n','(v, n): (v) hiển thị, biểu lộ, phô bày, trình bày, trưng bày; (n) sự trưng bày',NULL,'display ',131),(181,'duplicate.mp3','I think the new word processing program will duplicate the success of the one introduced last year','to make an extract copy of something','duplicate.jpg',0,'Tôi nghĩ rằng chương trình xử lý văn bản mới sẽ thành công gấp đôi so với chương trình được giới thiệu hồi năm ngoái\r\n','(v): sao lại, làm thành 2 bản, gấp đôi, nhân đôi',NULL,'duplicate ',131),(182,'failure.mp3','Your failure to inform us about the changed password cost the company a day\'s work',' lack of success in doing or achieving something','failure.jpg',0,'Anh không thông báo cho chúng tôi về mật khẩu bị đổi đã làm tốn công ty 1 ngày làm việc\r\n','(n): hỏng, thiếu, yếu, trượt, thất bại, bất thành',NULL,'failure ',131),(183,'figure_out.mp3','By examining all of the errors, the technicians figured out how to fix the problem',' to calculate an amount or the cost','figure_out.jpg',0,'Bằng cách xem xét mọi lỗi, các kỹ thuật viên đã tìm ra các để sửa chữa các sự cố\r\n','(v): tìm hiểu, đoán ra, tính toán ra, giải ra',NULL,'figure out ',131),(184,'ignore.mp3','He ignored all the \'No Smoking\' signs and lit up a cigarette','to pay no attention to something','ignore.jpg',0,'Anh ấy phớt lờ bảng cấm hút thuốc để hút 1 điểu thuốc\r\n',' (v): bỏ qua, phớt lờ, không để ý tới',NULL,'ignore ',131),(185,'search.mp3',' Our search of the database produced very little information','an attemp to find somebody / something, especially by looking acrefully for them /it','search.jpg',0,'Việc tìm kiếm trong cơ sở dữ liệu của chúng tôi đã đem lại rất ít thông tin\r\n',' (n, v): (n) tìm kiếm, tìm hiểu; điều tra, thăm dò; (v) tìm',NULL,'search ',131),(186,'shut_down.mp3','Please shut down the computer before you leave','it stops being often for bussiness','shut_down.jpg',0,'Vui lòng tắt máy trước khi bạn ngừng làm việc\r\n','(v): đóng lại, ngừng lại; tắt máy, ngừng hoạt động, chấm dứt',NULL,'shut down',131),(187,'warning.mp3',' The red flashing light gives a warning to users that the battery is low','a statement, an event, etc. telling somebody that something bad or unpleasant','warning.jpg',0,'Ánh sáng nhấp nháy màu đỏ đưa ra sự cảnh báo với người dùng rằng pin bị cạn\r\n','(n): ‹sự/lời› cảnh báo, báo trước (có nguy hiểm hoặc gặp vấn đề rắc rối)',NULL,'warning ',131),(189,'adjustment.mp3','I have made a few adjustments to the design','a small change made to something in order to correct or improve it','adjustment.jpg',0,'Tôi đã thực hiện một vài điều chỉnh để thiết kế.','(n): điều chỉnh, chỉnh lý, sự sửa lại cho đúng','noun','adjustment',8),(190,'automatically.mp3','The door opens automatically','having controls that work without needing a person to operate them','automatically.jpg',0,'Cửa mở một cách tự động.','(adv): ‹một cách› tự động','noun','automatically',8),(191,'crucial.mp3','Inventory is a crucial process and must be taken seriously by all staff','extremely important, because it will affect other things','crucial.jpg',0,'Kiểm kê là một quá trình cốt yếu và phải được thực hiện nghiêm túc bởi mọi nhân viên','(adj): cốt yếu, chủ yếu, có tính quyết định','noun','crucial',8),(192,'discrepancy.mp3','We easily explained the discrepancy between the two counts','a difference between two or more things that should be the same','discrepancy.jpg',0,'Chúng tôi giải thích rõ ràng sự khác nhau giữa 2 con số tổng','(n): ‹sự› khác nhau, trái ngược nhau; không nhất quán/thống nhất','noun','discrepancy',8),(193,'disturb.mp3','Let\'s see how many products we can count in advance of inventory so we disturb fewer customers',' to interrupt somebody when they are trying to work','disturb.jpg',0,'Hãy xem có bao nhiêu sản phẩm chúng ta có thể đếm trước khi kiểm kê để cho chúng ta làm phiền khách hàng ít hơn','(v): quấy rầy, quấy rối, làm náo động, gây náo loạn, làm ồn, làm phiền','noun','disturb',8),(194,'consult.mp3','If the pain continues, consult your doctor.','to go to someone for information or advice','consult.jpg',0,'Nếu cơn đau vẫn tiếp tục, thì bạn tham khảo ý kiến bác sĩ của bạn','(v): hỏi ý kiến, tham khảo','noun','consult',9),(195,'control.mp3','Please take your medication every day to control your high blood pressure','the ability to make someone or something do what you want','control.jpg',0,'Vui lòng uống thuốc mỗi ngày để kiểm soát huyết áp cao của ông',' (v): kiểm tra, kiểm soát; điều khiển, chỉ huy','noun','control',9),(196,'convenient.mp3','Is this a convenient location for you to pick up your prescription?','useful, easy, or quick to do; not causing problems','convenient.jpg',0,'Is this a convenient location for you to pick up your prescription?','(adj): thuận lợi, thuận tiện; ở gần, dễ đi đến','noun','convenient',9),(197,'detect.mp3',' (v): dò ra, tìm ra, khám phá ra, phát hiện ra',' to discover something','detect.jpg',0,'Các xét nghiệm này được thiết kế để phát hiện bệnh sớm.',' (v): dò ra, tìm ra, khám phá ra, phát hiện ra','noun','detect',9),(198,'factor.mp3','Could my cat be a factor contributing to my asthma?','one of several things that cause or influence something','factor.jpg',0,'Con mèo của tôi có thể là một yếu tố góp phần cho bệnh hen suyễn của tôi hay không?',' (n): nhân tố, yếu tố','noun','factor',9),(199,'Father.mp3','father of the country','the child is father of the man','Father.png',0,'người cha của đất nước.','(n): Người thầy, người cha','noun','Father',134),(200,'Mother.mp3','My mother was 21','when she got married.','Mother.png',0,'Mẹ tôi 21 tuổi,Khi đó cô ấy cưới.','(n): Người mẹ','noun','Mother',134),(201,'Grandmother.mp3','to teach one\'s grandmother','to suck eggs','Grandmother.png',0,'trứng đòi khôn hơn vịt, dạy bà ru cháu','(nound): Bà ngoại','noun','Grandmother',134),(202,'Son.mp3','he his father\'s son','he his father\'s son','Son.png',0,'nó thật xứng là con cha nó, nó giống cha nó','(n): Con trai','noun','Son',134),(203,'Brother.mp3','uterine brother',' uterine brother','Brother.png',0,'anh khác cha','(n): anh trai','noun','Brother',134),(204,'cauliflower.mp3','If cauliflowers are not protected from extreme temperatures','the heads get discolored','cauliflower.png',0,'NNếu súp lơ không được bảo vệ khỏi nhiệt độ quá cao, đầu hoa sẽ bị biến màu','(v): hoa quả súp lơ','noun','cauliflower',135),(205,'garlic.mp3','What is the difference between ','chopping garlic and  crushing garlic','garlic.png',0,'Sự khác biệt giữa băm tỏi và đập dập tỏi là gì',' (n): hoa quả,tỏi','noun','garlic',135),(206,'pumpkin.mp3','Pumpkin is a variety of squash that people often think of as ','a traditional Halloween decoration or a Thanksgiving pie filling','pumpkin.png',0,'Bí ngô là một loại bí mà mọi người thường nghĩ đến như một món trang trí Halloween truyền thống hoặc nhân bánh Lễ Tạ ơn.','(n): quá bí ngô','noun','pumpkin',135),(207,'cabbage.mp3','If you overcook the cabbage it\'ll turn to mush.','I like most vegetables but not cabbage.','cabbage.png',0,'Tôi thích hầu hết các loại rau nhưng không phải bắp cải.',' (n): hoa quả cải bắp','noun','cabbage',135),(208,'zucchini.mp3','Aerated subsurface irrigation water gives growth and yield benefits to zucchini,','vegetable soybean and cotton in flooded and heavy clay soils.','zucchini.png',0,'Nước tưới dưới bề mặt có sục khí mang lại lợi ích về tăng trưởng và năng suất cho bí xanh, đậu tương rau và bông trong đất ngập úng và đất sét nặng.',' (n): dưa chuột','noun','zucchini',135),(288,'cover.mp3','Will my medical insurance cover this surgery?','to include something; to deal with something','cover.jpg',0,'Hợp đồng bảo hiểm y tế của tôi liệu có bao gồm cho ca phẫu thuật này không?\r\n','to include something; to deal with something',NULL,'cover ',129),(289,'expiration.mp3','(n): sự mãn hạn, sự hết hạn, sự kết thúc','an ending of the period of time when an official document can be used','expired.jpg',0,'Anh đã kiểm tra hạn sử dụng của món sữa chua này chưa?\r\n','(n): sự mãn hạn, sự hết hạn, sự kết thúc',NULL,'expiration ',129),(290,'frequently.mp3','(adv): thường xuyên, một cách thường xuyên','often','frequently.jpg',0,'Trang thiết bị thường có bảo hành một năm\r\n','(adv): thường xuyên, một cách thường xuyên',NULL,'frequently ',129),(291,'imply.mp3','The guarantee on the Walkman implied that all damages were covered under warranty for one year',' to suggest that something is true without saying so directly','imply.jpg',0,'Giấy bảo đảm theo máy nghe nhạc Walkman đã ngụ ý rằng mọi hư hỏng đều được bao gồm trong thời hạn bảo hành là 1 năm',' to suggest that something is true without saying so directly',NULL,'imply ',129),(292,'promise.mp3','The sales associate promised that our new mattress would arrive by noon on Saturday','to tell somebody that you will definitely do or not do something','promise.jpg',0,'Người cộng tác kinh doanh hứa rằng tấm nệm mới của chúng ta sẽ đến trước trưa thứ Bảy\r\n','(v): (n) hứa hẹn, cam đoan, bảo đảm; (v) hứa',NULL,'promise ',129),(293,'accommodate.mp3',' The meeting room was large enough to accommodate the various needs of the groups using it','accommodate ','accommodate.jpg',0,'Phòng họp đủ lớn để phù hợp với nhiều nhu cầu khác nhau của các nhóm sử dụng nó\r\n',' (v): điều tiết, điều chỉnh, thu xếp, làm cho phù hợp',NULL,'accommodate ',131),(294,'arrangement.mp3','The travel arrangements were taken care of by Sara, Mr. Billing\'s capable assistant',' a plan or preparation that you make so that something','arrangement.jpg',0,'Việc thu xếp chuyến đi được chịu trách nhiệm bởi Sara, trợ lý có năng lực của ông Billing\r\n',' (n): ‹sự› thu xếp, dàn xếp, sắp xếp, sắp đặt',NULL,'arrangement ',131),(295,'association.mp3','Local telephone companies formed an association to serve common goals, meet their common needs, and improve efficiency\r\n',' an officcial group of people who have joined together for a particular purpose','association.jpg',0,'Các công ty điện thoại địa phương thành lập một hội liên hiệp để phục vụ các mục đích chung, đáp ứng các nhu cầu chung của họ và',' (n): hội, hội liên hiệp, đoàn thể; ‹sự› kết hợp, liên kết, liên hợp',NULL,'association ',131),(296,'attend.mp3','We expect more than 100 members to attend the annual meeting','to be present at an even','attend.jpg',0,'Chúng tôi hy vọng hơn 100 thành viên đến tham dự cuộc họp thường niên\r\n','(v): tham dự, có mặt; chăm sóc, phục vụ; đi theo, đi kèm, hộ tống',NULL,'attend ',131),(297,'get_in_touch.mp3',' As soon as we arrive at the hotel, we will get in touch with the manager about the unexpected guests',' to communicate / contact with somebody','get_in_touch.jpg',0,'Ngay khi chúng tôi đến khách sạn, chúng tôi sẽ liên hệ với giám đốc về những vị khách không mời mà đến\r\n','(v): liên lạc với, tiếp xúc với, giữ quan hệ với, có dính líu đến',NULL,'get in touch',131),(298,'liability.mp3','The slippery steps were a terrible liability for the store','the state of being legally responsible for something','liability.png',0,'Những bậc thềm trơn trượt là một nguy cơ tệ hại cho cửa hàng','(n): trách nhiệm, nghĩa vụ pháp lý; nguy cơ, điều gây khó khăn trở ngại','noun','liability',8),(299,'reflection.mp3',' She saw her reflection in the mirro','a sign that shows the state or nature of something','reflection.jpg',0,'Cô ấy nhìn ảnh của mình ở trong gương','(n): ‹sự› phản chiếu, phản xạ, phản ánh, hình ảnh; phê phán, nhận xét','noun','reflection',8),(300,'run.mp3','As long as the computer is running, you can keep adding new data','to operate or function; to make something do this','run.jpg',0,'Trong khi máy tính đang chạy, bạn có thể thực hiện việc bổ sung thêm dữ liệu mới',' (v): chạy, vận hành, hoạt động, thực hiện','noun','run',8),(301,'scan.mp3','She scanned through the newspaper over breakfast.','to look at every part of something carefully, especially because you are looking for a particular thing or person','scan.jpg',0,'Cô ấy đã xem qua tờ báo trong lúc ăn sáng','(v): xem lướt, xem qua','noun','scan',8),(302,'subtract.mp3','6 subtracted from 9 is 3','to take a number or an amount away from another number or amount','subtract.png',0,'6 trừ 9 được 3','(v): trừ đi, khấu trừ; loại ra, lấy ra khỏi','noun','subtract',8),(303,'interaction.mp3','My pharmacist was concerned about the interaction of the two medications I was prescribed','communicate with somebody, especially while you work, play or spend time with them','interaction.jpg',0,'Dược sĩ của tôi lo lắng về sự tương tác của 2 loại thuốc mà tôi được kê toa',' (n): ‹sự› tương tác, ảnh hưởng lẫn nhau, tác động qua lại','noun','interaction',9),(304,'limit.mp3','We were reaching the limits of civilization',' a point at which something stops being possible or existing','limit.jpg',0,'Chúng tôi đã đạt đến giới hạn của nền văn minh.','(n): giới hạn, hạn định, ranh giới','noun','limit',9),(305,'monitor.mp3','The patient had weekly appointments so that the doctor could monitor their progress','to watch and check something over a period of time','monitor.jpg',0,'Người bệnh có các cuộc hẹn hàng tuần để cho bác sĩ có thể theo dõi tiến triển của họ','(v): màn hình vi tính, lớp trưởng','noun','monitor',9),(306,'potential.mp3','To avoid any potential side effects from the medication, be sure to tell your doctor all the drugs you are currently taking','that can develop into something or be developed in the future','potential.jpg',0,'Để tránh bất kỳ phản ứng phụ tiềm tàng nào từ thuốc, hãy bảo đảm là kể cho bác sĩ tất cả loại thuốc mà bạn hiện tại đang uốn',' (adj): tiềm tàng, tiềm năng, tiềm lực, khả năng','noun','potential',9),(307,'sample.mp3','A sample of the population taking the new medicine was surveyed to determine whether it caused side effects','a small amount of a substance taken from a larger amount and tested in order to obtain information about the substance','sample.jpg',0,'Một số người dân uống loại thuốc mới đã được khảo sát để xác định xem nó có gây ra phản ứng phụ hay không',' (n): mẫu, hàng mẫu','noun','sample',9),(308,'Nephew.mp3','I watched my two-year-old','nephew toddling around after his puppy','Nephew.png',0,'Tôi nhìn đứa cháu hai tuổi đang chập chững chạy theo con chó con của nó','(n): Cháu trai','noun','Nephew',134),(309,'Grandfather.mp3','My grandfather has a profound','mistrust of anything new or foreign.','Grandfather.png',0,'Ông tôi có một sự nghi ngờ sâu sắc đối với bất cứ điều gì mới hoặc lạ.','(n): Ông nội','noun','Grandfather',134),(310,'Niece.mp3','She only sees her niece occasionally,','so she showers her with presents when she does.','Niece.png',0,'Cô ấy chỉ thỉnh thoảng gặp cháu gái, vì vậy cô ấy sẽ mang quà cho cô ấy khi cô ấy đến.','(nound): Cháu gái','noun','Niece',134),(311,'Uncle.mp3','Her uncle takes a personal','interest in her progress','Uncle.png',0,'Chú của cô ấy quan tâm cá nhân đến sự tiến bộ của cô ấy','(n): chú, bác trai, cậu','noun','Uncle',134),(312,'Sister.mp3','I do like her - after all, she is my sister','a girl or woman who has the same parents as another person','Sister.png',0,'Tôi thích cô ấy - sau tất cả, cô ấy là em gái của tôi','(n): chị/em gái','noun','Sister',134),(313,'pea.mp3','Then raven returned to the pea vine and found three other men who had fallen from the pea pod.','a round, green seed, several of which grow in a pod, eaten as a vegetable','pea.png',0,'Sau đó, quạ quay trở lại cây đậu và tìm thấy ba người đàn ông khác đã rơi từ vỏ hạt đậu xuống','(v): đậu','noun','pea',135),(314,'asparagus.mp3','There is no distinctive aleurone layer in asparagus seeds','a plant with pale green, juicy stems that are cooked and eaten as a vegetable','asparagus.png',0,'Không có lớp aleurone đặc biệt trong hạt măng tây',' (n): măng tây','noun','asparagus',135),(315,'tomato.mp3','We chose a disease-resistant variety of tomato','a round, red fruit with a lot of seeds, eaten cooked or uncooked as a vegetable, for example in salads or sauces','tomato.png',0,'Chúng tôi đã chọn một giống cà chua kháng bệnh','(n): cà chua','noun','tomato',135),(316,'carrot.mp3','The first solid food she gave her baby was mashed carrot','a long pointed orange root eaten as a vegetable','carrot.png',0,'Thức ăn đặc đầu tiên mẹ cho con ăn là cà rốt nghiền',' (n): cà rốt','noun','carrot',135),(317,'eggplant.mp3','More soybean than eggplant leaves were tested because the soybean leaf area was smaller,','an oval, purple vegetable that is white inside and is usually eaten cooked','eggplant.png',0,'Thử nghiệm nhiều đậu tương hơn cà tím vì diện tích lá đậu tương nhỏ hơn',' (n): cà tím','noun','eggplant',135);
/*!40000 ALTER TABLE `vocabulary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-09 17:21:15