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
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary`
--

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
INSERT INTO `vocabulary` VALUES (162,'abide_by.mp3','The two parties agreed to abide by the judge\'s decision',' to accept and act according to a law, an agreement','abide_by.jpg',0,'Hai bên đã đồng ý tuân theo quyết định của tòa án.\r\n','(v): tôn trọng, tuân theo, giữ (lời)',NULL,'abide by',129),(163,'agreement.mp3','According to the agreement, the caterer will also supply the flowers for the event','an arrangement, a promise or a contract made with somebody','agreement.jpg',0,'Theo như thỏa thuận, nhà cung cấp lương thực thực phẩm cũng sẽ cung cấp hoa cho sự kiện\r\n',' (n): hợp đồng, giao kèo, sự đồng ý/thỏa thuận với nhau',NULL,'agreement ',129),(165,'cancellation.mp3','The cancelation of her flight caused her problems for the rest of the week','a decision to stop something that has already been arranged from happening','cancellation.jpg',0,'Việc hủy chuyến bay đã gây cho cô ấy nhiều vấn đề trong những ngày còn lại của tuần.\r\n','(n): sự bãi bỏ, hủy bỏ',NULL,'cancellation ',129),(167,'assurance.mp3','The sales associate gave his assurance that the missing keyboard would be replaced the next day.',' a statement that something will certainly be true or will certainly happen','assurance.jpg',0,'Đối tác bán hàng cam đoan rằng ngày mai bàn phím lỗi sẽ được thay.\r\n',' (n): sự cam đoan, bảo đảm, chắc chắn; sự tin chắc, tự tin',NULL,'assurance ',129),(168,'determine.mp3','After reading the contract, I was still unable to detemine if our company was liable for back wages.','to discover the facts about something','determine.jpg',0,'Sau khi đọc hợp đồng, tôi vẫn không thể biết được liệu rằng công ty của chúng tôi có phải chịu trách nhiệm hoàn trả lại lương không','(v): quyết định, xác định, định rõ; quyết tâm, kiên quyết',NULL,'determine ',129),(169,'engage.mp3',' He engaged us in a fascinating discussion about current business law',' to become involved in, to participate','engage.jpg',0,'Anh ấy cùng chúng tôi thảo luận sôi nổi về luật kinh doanh hiện hành','(v): Tham gia, cam kết, (n)sự hứa hẹn, hứa hôn',NULL,'engage ',129),(170,'establish.mp3','The merger of the two company established a powerful new corporation',' to start or create an organization, a system','establish.jpg',0,'Sự liên kết giữa 2 công ty tạo nên một tập đoàn kinh tế hùng mạnh.\r\n','(v): thiết lập, thành lập; xác minh, chứng minh, củng cố',NULL,'establish ',129),(171,'establish.mp3','The contractor was obligated by the contract to work 40 hours a week.','to bind legally or morally','obligate.jpg',0,'Nhà thầu buộc phải làm việc 40 tiếng mỗi tuần.\r\n','(v): bắt buộc, ép buộc',NULL,'obligate ',129),(172,'party.mp3','The parties agreed to settlement in their contract dispute.','one of the people or groups of people involved in a legal agreemen','party.jpg',0,'Các bên đã nhất trí đi đến một thỏa thuận trong hợp đồng gây tranh cãi của họ.\r\n','(n): đảng, phái, đội, nhóm; người tham dự/tham gia; buổi liên hoan, buổi tiệc',NULL,'party ',129),(173,'provision.mp3','The father made provision for his children through his will.\r\n','a condition or an arrangement in a legal document','provision.jpg',0,'Người cha đã truyền lại di chúc cho những đứa con của mình.\r\n',' (n): sự dự liệu, dự trữ, dự phòng, cung cấp; điều khoản',NULL,'provision ',129),(174,'resolve.mp3','The manager resolved to clean out all the files at the end of the week.',' to find an acceptable solution to a problem','resolve.jpg',0,'Cuối tuần, người quản lý đã quyết định xóa sạch tất cả các dữ liệu\r\n','(v, n): (v) giải quyết, (n) sự kiên quyết / sự tin chắc',NULL,'resolve ',129),(175,'specific.mp3','The customer\'s specific complaint was not addressed in his e-mail.','detailed abd exact','specific.jpg',0,'Khiếu nại cụ thể của khách hàng đã không được giải quyết trong Email gửi anh ấy.\r\n','(adj): riêng biệt, cụ thể, đặc trưng; rõ ràng, rành mạch',NULL,'specific ',129),(176,'access.mp3',' You can\'t gain access to the files unless you know the password',' the opportunity or right to use something','access.jpg',0,'Anh không có được quyền truy cập file trừ phi anh biết mật khẩu\r\n','(n, v): (n) lối vào, đường vào, sự/quyền truy cập; (v) truy cập',NULL,'access ',131),(177,'allocate.mp3','The office manager did not allocate enough money to purchase software','to give something officially to somebody / something for a particular purpose','allocate.jpg',0,'Người quản lý văn phòng không cấp đủ tiền để mua sắm phần mềm\r\n','(v): cấp cho, phân phối, phân phát, chia phần; chỉ định, định rõ vị trí',NULL,'allocate ',131),(178,'compatible.mp3','This operating system is not compatible with this model computer','able to be used together','compatible.jpg',0,'Hệ điều hành không tương thích với kiểu máy tính này\r\n',' (adj): tương thích, tương hợp, hợp nhau, có thể dùng được với nhau',NULL,'compatible ',131),(179,'delete.mp3','The technicians deleted all the data on the disk accidentally','to remove something that has been written or printed','delete.png',0,'Kỹ thuật viên đã vô tình xóa mọi dữ liệu trên đĩa\r\n','(v): xóa đi, bỏ đi, gạch đi (to remove, to erase)',NULL,'delete ',131),(180,'display.mp3','The accounting program displays a current balance when opened.',' to put something in a place where people can see it easily','display.jpg',0,'Chương trình kế toán hiển thị một con số cân bằng thu chi khi mở (chương trình đó) ra\r\n','(v, n): (v) hiển thị, biểu lộ, phô bày, trình bày, trưng bày; (n) sự trưng bày',NULL,'display ',131),(181,'duplicate.mp3','I think the new word processing program will duplicate the success of the one introduced last year','to make an extract copy of something','duplicate.jpg',0,'Tôi nghĩ rằng chương trình xử lý văn bản mới sẽ thành công gấp đôi so với chương trình được giới thiệu hồi năm ngoái\r\n','(v): sao lại, làm thành 2 bản, gấp đôi, nhân đôi',NULL,'duplicate ',131),(182,'failure.mp3','Your failure to inform us about the changed password cost the company a day\'s work',' lack of success in doing or achieving something','failure.jpg',0,'Anh không thông báo cho chúng tôi về mật khẩu bị đổi đã làm tốn công ty 1 ngày làm việc\r\n','(n): hỏng, thiếu, yếu, trượt, thất bại, bất thành',NULL,'failure ',131),(183,'figure_out.mp3','By examining all of the errors, the technicians figured out how to fix the problem',' to calculate an amount or the cost','figure_out.jpg',0,'Bằng cách xem xét mọi lỗi, các kỹ thuật viên đã tìm ra các để sửa chữa các sự cố\r\n','(v): tìm hiểu, đoán ra, tính toán ra, giải ra',NULL,'figure out ',131),(184,'ignore.mp3','He ignored all the \'No Smoking\' signs and lit up a cigarette','to pay no attention to something','ignore.jpg',0,'Anh ấy phớt lờ bảng cấm hút thuốc để hút 1 điểu thuốc\r\n',' (v): bỏ qua, phớt lờ, không để ý tới',NULL,'ignore ',131),(185,'search.mp3',' Our search of the database produced very little information','an attemp to find somebody / something, especially by looking acrefully for them /it','search.jpg',0,'Việc tìm kiếm trong cơ sở dữ liệu của chúng tôi đã đem lại rất ít thông tin\r\n',' (n, v): (n) tìm kiếm, tìm hiểu; điều tra, thăm dò; (v) tìm',NULL,'search ',131),(186,'shut_down.mp3','Please shut down the computer before you leave','it stops being often for bussiness','shut_down.jpg',0,'Vui lòng tắt máy trước khi bạn ngừng làm việc\r\n','(v): đóng lại, ngừng lại; tắt máy, ngừng hoạt động, chấm dứt',NULL,'shut down',131),(187,'warning.mp3',' The red flashing light gives a warning to users that the battery is low','a statement, an event, etc. telling somebody that something bad or unpleasant','warning.jpg',0,'Ánh sáng nhấp nháy màu đỏ đưa ra sự cảnh báo với người dùng rằng pin bị cạn\r\n','(n): ‹sự/lời› cảnh báo, báo trước (có nguy hiểm hoặc gặp vấn đề rắc rối)',NULL,'warning ',131);
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

-- Dump completed on 2021-12-08 17:34:48
