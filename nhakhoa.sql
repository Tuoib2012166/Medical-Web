-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 29, 2024 lúc 08:38 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nhakhoa`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking_appointments`
--

CREATE TABLE `booking_appointments` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` enum('Nam','Nữ') NOT NULL,
  `birth_year` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'pending',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `booking_appointments`
--

INSERT INTO `booking_appointments` (`id`, `fullname`, `phone`, `address`, `gender`, `birth_year`, `appointment_date`, `appointment_time`, `doctor_id`, `content`, `created_at`, `status`, `user_id`) VALUES
(1, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-23', '10:00:00', 24, '123', '2024-11-23 01:39:44', 'pending', 1),
(2, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-25', '09:00:00', 25, '123', '2024-11-25 00:05:43', 'pending', 1),
(3, 'Nguyễn Thị Đẹp', '0386812933', 'tranhungdao', 'Nam', 1999, '2024-11-25', '09:00:00', 26, '123', '2024-11-25 00:06:19', 'pending', 2),
(4, 'Nguyễn Thị Đẹp', '0386812933', 'tranhungdao', 'Nam', 1999, '2024-11-27', '17:00:00', 25, '123', '2024-11-27 16:07:36', 'pending', 2),
(5, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-27', '08:00:00', 24, '123', '2024-11-27 19:29:28', 'pending', 4),
(6, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-27', '09:00:00', 24, '123', '2024-11-27 19:34:09', 'pending', 4),
(7, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-27', '10:00:00', 24, '123', '2024-11-27 19:46:21', 'pending', 4),
(8, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-29', '08:00:00', 24, '123', '2024-11-29 14:36:49', 'pending', 4),
(9, 'Nguyễn Trần Ngọc Tươi 123', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-29', '09:00:00', 24, '123', '2024-11-29 14:37:37', 'pending', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `birth_year` int(11) NOT NULL,
  `introduction` text DEFAULT NULL,
  `biography` text DEFAULT NULL,
  `certifications` text DEFAULT NULL,
  `main_workplace` varchar(255) DEFAULT NULL,
  `working_hours` varchar(255) DEFAULT NULL,
  `specialty` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `fullname`, `phone`, `address`, `gender`, `birth_year`, `introduction`, `biography`, `certifications`, `main_workplace`, `working_hours`, `specialty`, `created_at`, `image`) VALUES
(24, 3, 'BS.Đinh Ngọc Khánh', '0123456789', 'Cần Thơ', 0, 1999, 'Bác sĩ Đinh Ngọc Khánh được đào tạo chuyên sâu về tiểu phẫu, implant, với khả năng sử dụng thành thạo các thiết bị công nghệ cao trong nha khoa, các kỹ thuật chuyên sâu trong cấy ghép implant. Với nhiều năm kinh nghiệm khám, tư vấn và điều trị trong ngành nha khoa, bác sĩ Khánh luôn đặt yếu tố an toàn – chính xác lên chất lượng, đưa đến cho khách hàng những trải nghiệm an toàn, hiệu quả nhất.', 'Năm 2018 – 2020: Công tác tại bệnh viện Hữu Nghị Việt Nam – Cuba Hà Nội\r\n\r\nNăm 2020 – 2021: Công tác tại nha khoa Bảo Việt Hà Nội\r\n\r\nNăm 2021 – 2023: Công tác tại nha khoa Việt Smile', 'Chứng chỉ implant Viện đào tạo Răng – Hàm – Mặt – Đại học Y Hà Nội\r\nChứng nhận Thực hành về phẫu thuật tăng thể tích xương -nâng xoang trong implant\r\nHội thảo Cách mạng mới trong implant – Bệnh viện Răng Hàm Mặt TP.HCM', 'Cần Thơ', '8:00 - 17:00', '1', '2024-11-23 01:26:25', 'uploads\\1732299985853-bs_khanh.png'),
(25, 4, 'BS.Mai Thị Trang', '0123456789', 'Cần Thơ', 1, 1999, 'Bác sĩ Mai Thị Trang là bác sĩ chỉnh nha được đánh giá là người luôn tận tâm, chu đáo, luôn đặt yếu tố sức khỏe khách hàng lên hàng đầu. Đó cũng là lý do bác sĩ Mai Trang đã được khách hàng tín nhiệm, trao gửi nụ cười của mình. Với sự thành công của nhiều case niềng răng do bác sĩ Mai Trang thực hiện, bạn hoàn toàn có thể an tâm lựa chọn bác sĩ làm người bạn đồng hành trên con đường tìm đến cái đẹp.', 'Năm 2021 – nay: Công tác tại Hệ thống Nha khoa VIET SMILE', 'Chứng chỉ chỉnh nha hay phẫu thuật ở bệnh nhân có sai hình xương\r\nChứng chỉ kiểm soát torque với mắc cài kim loại tự buộc\r\nChứng nhận tham gia Hội thảo Điều trị chỉnh nha sớm của Bệnh viện Răng hàm mặt Trung Ương\r\nChứng chỉ khóa học “Sinh cơ học chỉnh nha – Từ lý thuyết cốt lõi đến ứng dụng lâm sàng” – GS. Kwangchul Choy', 'Cần Thơ', '8:00 - 17:00', '2', '2024-11-23 01:28:36', 'uploads\\1732300116515-bs_trang.png'),
(26, 5, 'BS.Lê Thị Hoài Anh', '0123456789', 'Cần Thơ', 1, 2000, 'Bác sĩ Lê Thị Hoài Anh là bác sĩ chuyên sâu trong lĩnh vực chỉnh nha, có nhiều năm kinh nghiệm. Sự tận tâm và nhiệt tình của bác sĩ Hoài Anh đã thu hút sự tin tưởng của nhiều khách hàng, cùng với sự chuyên nghiệp và sự nhẹ nhàng, hỗ trợ tận tình mà bác sĩ luôn mang đến. Với hàng nghìn khách hàng đã trải qua liệu trình điều trị của bác sĩ Hoài Anh, họ đã có được nụ cười mới, với hàm răng đều đẹp và rất hài lòng với quá trình niềng răng cũng như kết quả của mình.', 'Năm 2020 – 2021: Thực hành tại Bệnh viện Đại học Y Hà Nội\r\nNăm 2021 – nay: BS chỉnh nha tại hệ thống Nha khoa VIET SMILE', 'Chứng chỉ Điều trị chỉnh nha dựa trên nguyên tắc sinh học và kiểm soát mặt phẳng nha ba chiều – MEAW Technique\r\nChưng chỉ chỉnh nha trong suốt Invissalign tập đoàn Align\r\nChứng chỉ Khóa học về Phương pháp bẻ dây với kỹ thuật Geaw – GS Shirasu\r\nChứng chỉ đào tạo liên tục “Cuộc cách mạng của MSE trong điều trị hẹp XHT và các ứng dụng nâng cao ở người trưởng thành” – GS. Won Moon\r\nChứng nhận “Sinh cơ học Chỉnh nha” – GS Kwangchul Choy\r\nChứng nhận “Chỉnh nha cho trẻ em đang tăng trưởng” – Prof. Enrique Garcia Romero', 'Cần Thơ', '8:00 - 17:00', '3', '2024-11-23 01:29:40', 'uploads\\1732300180778-bs_anh.png'),
(27, 6, 'BS.Đỗ Văn Đức', '0123456789', 'Cần Thơ', 0, 2000, 'Bác sĩ Đỗ Văn Đức là bác sĩ được đào tạo chuyên sâu về tiểu phẫu, implant, có khả năng sử dụng thành thạo những công nghệ, kỹ thuật tiên tiến nhất. Với kinh nghiệm và sự tận tâm của mình bác sĩ Đức đã mang lại hàm răng khỏe mạnh cho khách hàng và nhận được nhiều đánh giá tích cực.', 'Năm 2015 – 2021: Học bác sĩ chuyên khoa Răng – Hàm – Mặt, Đại học Y Dược Thái Nguyên.\r\n\r\nNăm 2021- nay: Công tác tại nha khoa VIET SMILE.', 'Chứng chỉ implant K27\r\nChứng nhận tham gia hội thảo: Điều trị tuỷ lại và xử lý các trường hợp phức tạp trong nội nha Dr Moh’d Hammo\r\nChứng nhận tham gia khoá học: Thực hành trám răng thẩm mỹ\r\nChứng nhận tham gia khoá học: Nội nha thực chiến TS.Nguyễn Quang Tâm\r\nChứng nhận tham gia hội thảo: Ứng dụng lâm sàng nâng cao của phẫu thuật laser Diode\r\nChứng nhận tham gia hội nghị: Khoa học và triển lãm RHM quốc tế VIDEC 2023', 'Cần Thơ', '8:00 - 17:00', '10', '2024-11-23 01:30:30', 'uploads\\1732300230412-bs_duc.png'),
(28, 7, 'BS.Phạm Ngọc Quốc', '0123456789', 'Cần Thơ', 0, 2000, 'Bác sĩ Phạm Ngọc Quốc hiện đang công tác tại nha khoa Viet Smile – là bác sĩ chuyên sâu về tiểu phẫu – phục hình – implant. Với kinh nghiệm và sự tận tâm, chuyên nghiệp, chu đáo, bác sĩ Ngọc Quốc đã mang đến cho khách hàng sự an tâm, tin tưởng, cảm thấy thoải mái, đạt hiệu quả cao nhất khi điều trị. Bác sĩ Ngọc Quốc luôn không ngừng nâng cao trình độ chuyên môn, ứng dụng công nghệ hiện đại vào quá trình thực hiện để giúp khách hàng có trải nghiệm dịch vụ chất lượng nhất.', 'Năm 2019 – 2023: Công tác tại nha khoa Lucci\r\n\r\nNăm 2021 – 2022: Thực hành tại Bệnh viện Đại học Y Hà Nội\r\n\r\nNăm 2023 – nay: Công tác tại Nha khoa Viet Smile', 'Chứng chỉ Cấy ghép implant nha khoa\r\nChứng chỉ kiểm soát nhiễm khuẩn bệnh viện, nha khoa', 'Cần Thơ', '8:00 - 17:00', '4', '2024-11-23 01:31:08', 'uploads\\1732300268803-bs_quoc.png'),
(29, 8, 'BS.Nguyễn Gia Bảo Khánh', '0123456789', 'Cần Thơ', 0, 2000, 'Bác sĩ Nguyễn Gia Bảo Khánh – Tốt nghiệp Chuyên khoa Răng Hàm Mặt, Trường Đại học Y Dược Cần Thơ. Với kinh nghiệm hơn 4 năm hoạt động trong lĩnh vực niềng răng và chỉnh nha chuyên sâu. Không chỉ có kỹ năng tốt, bác sĩ Nguyễn Gia Bảo Khánh còn thường xuyên tham gia các khóa học để nâng cao trình độ, kiến thức cho bản thân nhằm mang lại kết quả tốt nhất cho khách hàng. Với phong cách làm việc chuyên nghiệp và sự tận tâm với sức khỏe răng miệng của từng khách hàng. Bác sĩ Nguyễn Gia Bảo Khánh đã nhận được sự tín nhiệm và lòng tin từ rất nhiều khách hàng, và trở thành sự lựa chọn hàng đầu cho việc chăm sóc răng miệng và mang đến nụ cười hoàn hảo.', 'Năm 2021 – nay: Công tác tại Hệ thống Nha Khoa Việt Smile.', 'Chứng chỉ Chẩn đoán và lập kế hoạch điều trị chỉnh nha lâm sàng (Bệnh viện Răng Hàm Mặt Hồ Chí Minh)\r\nChứng chỉ Điều trị chỉnh nha dựa trên sinh học và kiểm soát mặt phẳng nhai theo 3 chiều không gian – Giáo sư Enrique García Romero\r\nChứng chỉ Kỹ thuật dây cung thẳng liên tục (Tổ chức Ortho Organizers)\r\nChứng nhận Khóa học Chỉnh nha với khay trong suốt\r\nChứng nhận đào tạo liên tục Chỉnh nha thời đại mới – Thách thức và xu hướng\r\nChứng chỉ khóa học “Sinh cơ học chỉnh nha – Từ lý thuyết cốt lõi đến ứng dụng lâm sàng” – GS. Kwangchul Choy', 'Cần Thơ', '8:00 - 17:00', '5', '2024-11-23 01:31:50', 'uploads\\1732300310099-bs_bkhanh.png'),
(30, 9, 'BS.Đặng Thị Hà Xuyên', '0123456789', 'Cần Thơ', 0, 2000, 'Hiện tại, Bác sĩ Xuyên đang làm việc tại chuyên khoa Chỉnh nha tại Hệ thống Nha khoa Viet Smile. Bác sĩ Xuyên là người đã mang lại rất nhiều sự an tâm, giúp khách hàng kiên trì trong suốt hành trình niềng răng của mình. Khách hàng tới thăm kháng niềng răng, điều trị nha khoa tổng quát đều nhận xét bác sĩ vô cùng ân cần, kĩ càng và kiên nhẫn lắng nghe mong muốn của họ, dựa trên các dữ liệu đã thu thập được cùng chuyên môn, kinh nghiệm của mình để lên phác đồ điều trị 1 cách chính xác nhất.', 'Năm 2022 – nay: Công tác tại Nha khoa Việt Smile', 'Chứng nhận Chỉnh nha toàn diện SSO – Y Company\r\nChứng nhận tham gia Hội thảo “Điều trị chỉnh nha sớm”\r\nChứng chỉ khóa học “Sinh cơ học chỉnh nha – Từ lý thuyết cốt lõi đến ứng dụng lâm sàng” – GS. Kwangchul Choy\r\nChứng chỉ khóa học đào tạo liên tục “Chỉnh hình răng mặt – ĐH Y Hà Nội', 'Cần Thơ', '8:00 - 17:00', '6', '2024-11-23 01:32:37', 'uploads\\1732300357619-bs_xuyen.png'),
(31, 10, 'BS.Nguyễn Hữu Tân', '0123456789', 'Cần Thơ', 0, 2000, 'Bác sĩ Nguyễn Hữu Tân là bác sĩ chuyên sâu về tiểu phẫu – phục hình – implant. Với nhiều năm kinh nghiệm trong nghề, bác sĩ Tân được các khách hàng đặt niềm tin và an tâm sử dụng dịch vụ, cải thiện tình trạng răng. Bác sĩ Tân có trình độ tay nghề cao, năng lực chẩn đoán chính xác, điều trị hiệu quả giúp khách hàng được khắc phục hoàn toàn những vấn đề như: đau, nhức, mất răng,…', 'Năm 2017 – 2022: Công tác tại nha khoa Trâu Quỳ\r\nNăm 2022 – nay: Công tác tại nha khoa Việt Smile', 'Chứng chỉ hành nghề số 045873/BYT-CCHN\r\n\r\nChứng chỉ implant Viện đào tạo Răng – Hàm – Mặt – Đại học Y Hà Nội', 'Cần Thơ', '8:00 - 17:00', '6', '2024-11-23 01:33:31', 'uploads\\1732300411426-bs_tan.png'),
(32, 11, 'BS.CKI.Nguyễn Thị Hường', '0123456789', 'Cần Thơ', 1, 2000, 'Bác sĩ CKI Nguyễn Thị Hường là bác sĩ trưởng của hệ thống nha khoa Việt Smile. Bác sĩ có trình độ chuyên môn cao về lĩnh vực chỉnh nha, độ uy tín cao với nhiều năm kinh nghiệm. Với ý thức trách nhiệm, tận tụy, yêu nghề của mình, Bs. Nguyễn Thị Hường đã kết hợp với đội ngũ bác sĩ tại Nha Khoa Việt Smile xây dựng một phòng khám không chỉ chuẩn trang thiết bị hiện đại mà còn chuẩn về con người và phương pháp điều trị.', 'Năm 2016 – nay: Trưởng khoa Nắn chỉnh răng tại Nha khoa Việt Smile', 'Chứng chỉ ứng công nghệ GEAW vào niềng răng bởi Giáo sư Dr.Akiyoshi Shirasu\r\nChứng chỉ và account riêng do Invisalign – Niềng khay trong suốt cấp\r\nChứng chỉ chuyên sâu điều trị cắn hở hiệu quả và ổn định – GS.Tae-Woo Kim – Đại học Seoul\r\nChứng chỉ Thực hành mắc cài mặt lưỡi đa rãnh – Viện trưởng viện đào tạo Răng – Hàm – Mặt chứng nhận\r\nChứng chỉ điều trị sai khớp cắn hạng II và III với kỹ thuật Meaw – Dr. Nelson Oppermann – University of Illinois at Chicago United States\r\nChứng chỉ kiểm soát răng đơn – tổng thể và mô mềm với TADS – Prof. Kee Joon Lee – Department Of Orthodontics Yonsei University, Seoul, Korea\r\nChứng chỉ Điều trị chỉnh nha dựa trên sinh học và kiểm soát mặt phẳng nhai theo 3 chiều không gian – Giáo sư Enrique García Romero\r\nChứng nhận tham dự Hội nghị khoa học “Chỉnh nha thời đại mới: Thách thức và Xu hướng”\r\nChứng chỉ khóa học “Sinh cơ học chỉnh nha – Từ lý thuyết cốt lõi đến ứng dụng lâm sàng” – GS. Kwangchul Choy', 'Cần Thơ', '8:00 - 17:00', '7', '2024-11-23 01:35:13', 'uploads\\1732300512945-bac-si-nguyen-thi-huong.png'),
(33, 12, 'BS.Ninh Quang Tùng', '0123456789', 'Cần Thơ', 0, 1999, 'Bác sĩ Ninh Quang Tùng là bác sĩ chuyên sâu chỉnh nha có nhiều kinh nghiệm thực tế và đã cải thiện được nụ cười cho rất nhiều khách hàng. Với phương châm làm việc hết mình, không ngừng học hỏi, bác sĩ Tùng ngày càng nâng cao trình độ tay nghề cũng như cập nhật thêm những kiến thức, phương pháp mới theo thời đại. Hiện tại, bác sĩ Tùng được rất nhiều người tin tưởng và lựa chọn để gắn bó trong cả quá trình niềng răng thay đổi nụ cười.', 'Năm 2020 – 2022: Thực hành tại khoa Răng – Hàm – Mặt bệnh viện Đại học Y Hà Nội.\r\n\r\nNăm 2021 – nay: Công tác tại Nha khoa Việt Smile', 'Chứng chỉ chỉnh nha – Đại học Y Hà Nội\r\nChứng chỉ Điều trị sai khớp cắn và loạn năng hệ thống sọ mặt với dây cung GUMMETAL của Giáo sư Roberto Velasquez Torres\r\nChứng chỉ Điều trị chỉnh nha dựa trên sinh học và kiểm soát mặt phẳng nhai theo 3 chiều không gian – Giáo sư Enrique García Romero\r\nChứng chỉ điều trị chỉnh nha chuyên nghiệp – Dr Nelson Oppermann\r\nChứng nhận Nguyên tắc thiết kế máng ổn định và điều trị ngừng thở khi ngủ với công nghệ 3D\r\nChứng chỉ Khóa học về Phương pháp bẻ dây với kỹ thuật Geaw – GS Shirasu\r\nChứng nhận khoá học: “Thực hành nâng cao về khay trong suốt Inhouse và mắc cài 2D mặt lưỡi” – Dr. Nicolas Salesse', 'Cần Thơ', '8:00 - 17:00', '8', '2024-11-23 01:36:55', 'uploads\\1732300614975-bs-tung.png'),
(34, 13, 'BS.Lê Đức Thăng', '0123456789', 'Cần Thơ', 0, 2000, 'Bác sĩ Lê Đức Thăng tốt nghiệp Đại học Y Hà Nội, hiện đang công tác tại Nha khoa VIET SMILE và chuyên về tiểu phẫu – phục hình – implant.\r\n\r\nTrong suốt quá trình làm việc bác sĩ không ngừng trau dồi kiến thức, học hỏi kinh nghiệm để nâng cao trình độ chuyên môn và kỹ năng nghề nghiệp để mang đến sự hài lòng và yên tâm cho khách hàng. Nhờ đó bác sĩ Đức Thăng đã từng bước khẳng định tên tuổi của bản thân bằng các ca phục hình thành công, trong đó có nhiều ca phức tạp cùng với đó là sự tin tưởng của khách hàng.', 'Năm 2020 – 2022: Thực hành tại Bệnh viên Đa khoa Đồng Nai.\r\n\r\nNăm 2022 – nay: Công tác tại Hệ thống Nha Khoa Việt Smile.', 'Chứng chỉ Implant cơ bản – Bác sĩ Bùi Tùng\r\nChứng chỉ phục hình trên implant trung tâm Sagodent', 'Cần Thơ', '8:00 - 17:00', '9', '2024-11-23 01:38:16', 'uploads\\1732300696671-bac-si-le-duc-thang.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `follow_up_appointments`
--

CREATE TABLE `follow_up_appointments` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `follow_up_date` date NOT NULL,
  `time` varchar(50) NOT NULL,
  `notes` text DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `follow_up_appointments`
--

INSERT INTO `follow_up_appointments` (`id`, `patient_name`, `follow_up_date`, `time`, `notes`, `doctor_id`, `created_at`) VALUES
(10, '1', '2024-11-25', '11:00', '123', 24, '2024-11-22 18:55:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `medical_records`
--

CREATE TABLE `medical_records` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `diagnosis` text DEFAULT NULL,
  `treatment` text DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birth_year` int(11) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` varchar(50) DEFAULT NULL,
  `total_price` varchar(255) DEFAULT NULL,
  `prescription` text DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `medical_records`
--

INSERT INTO `medical_records` (`id`, `patient_id`, `doctor_id`, `diagnosis`, `treatment`, `record_date`, `address`, `phone`, `gender`, `birth_year`, `specialty`, `service`, `quantity`, `unit_price`, `total_price`, `prescription`, `amount`, `service_id`, `appointment_id`) VALUES
(24, 2, 25, '123', '123', '2024-11-27', 'tranhungdao 111', '0386812933', 'female', 1999, 'Cấy ghép implant', '6', 2, '700000.00', '1400000', '123', NULL, NULL, NULL),
(25, 4, 24, '123', '123', '2024-11-29', 'tranhungdao 111', '0386812933', 'male', 1999, 'Cấy ghép implant', '6', 2, '700000.00', '1400000', '123', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `birth_year` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `patients`
--

INSERT INTO `patients` (`id`, `user_id`, `fullname`, `phone`, `address`, `gender`, `birth_year`, `created_at`) VALUES
(4, 18, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 1, 2147483647, '2024-11-27 17:55:01'),
(5, 19, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 0, 1999, '2024-11-27 17:55:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `specialty_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `services`
--

INSERT INTO `services` (`id`, `specialty_id`, `name`, `description`, `price`) VALUES
(1, 1, 'Tư vấn bọc răng sứ', 'Tư vấn và lên kế hoạch bọc răng sứ', 500000.00),
(2, 1, 'Bọc răng sứ thẩm mỹ', 'Dịch vụ bọc răng sứ cao cấp thẩm mỹ', 3000000.00),
(3, 1, 'Bọc răng sứ toàn phần', 'Bọc răng sứ toàn hàm', 10000000.00),
(4, 1, 'Chỉnh sửa răng sứ', 'Chỉnh sửa các vấn đề liên quan đến răng sứ', 2000000.00),
(5, 1, 'Vệ sinh răng trước bọc sứ', 'Làm sạch răng trước khi bọc sứ', 800000.00),
(6, 2, 'Tư vấn cấy ghép Implant', 'Tư vấn và lên kế hoạch cấy ghép', 700000.00),
(7, 2, 'Cấy ghép Implant cơ bản', 'Thực hiện cấy ghép trụ Titanium', 15000000.00),
(8, 2, 'Cấy ghép Implant nâng cao', 'Cấy ghép Implant cho các trường hợp đặc biệt', 20000000.00),
(9, 2, 'Kiểm tra Implant định kỳ', 'Kiểm tra và bảo dưỡng Implant', 1000000.00),
(10, 2, 'Ghép xương hỗ trợ cấy ghép', 'Ghép xương hàm hỗ trợ Implant', 5000000.00),
(11, 3, 'Tư vấn niềng răng', 'Tư vấn lựa chọn phương pháp niềng răng', 500000.00),
(12, 3, 'Niềng răng mắc cài kim loại', 'Niềng răng bằng mắc cài kim loại', 20000000.00),
(13, 3, 'Niềng răng mắc cài sứ', 'Niềng răng bằng mắc cài sứ thẩm mỹ', 25000000.00),
(14, 3, 'Niềng răng trong suốt', 'Niềng răng bằng khay trong suốt', 35000000.00),
(15, 3, 'Điều chỉnh niềng răng định kỳ', 'Kiểm tra và điều chỉnh lực kéo niềng', 1000000.00),
(16, 10, 'Tư vấn dán sứ Veneer', 'Tư vấn và đánh giá tình trạng răng', 300000.00),
(17, 10, 'Dán sứ Veneer một răng', 'Thực hiện dán sứ Veneer cho từng răng', 4000000.00),
(18, 10, 'Dán sứ Veneer toàn hàm', 'Dán sứ Veneer cho toàn bộ hàm', 35000000.00),
(19, 10, 'Chỉnh sửa Veneer', 'Chỉnh sửa các vấn đề về Veneer', 1500000.00),
(20, 10, 'Làm sạch răng trước dán sứ', 'Vệ sinh và chuẩn bị răng trước khi dán sứ', 800000.00),
(21, 4, 'Tẩy trắng răng tại nhà', 'Cung cấp dụng cụ tẩy trắng răng tại nhà', 2000000.00),
(22, 4, 'Tẩy trắng răng tại phòng khám', 'Thực hiện tẩy trắng răng với công nghệ cao', 3000000.00),
(23, 4, 'Tẩy trắng răng bằng Laser', 'Tẩy trắng răng bằng công nghệ Laser', 4000000.00),
(24, 4, 'Kiểm tra sau tẩy trắng', 'Đánh giá và chăm sóc sau tẩy trắng', 500000.00),
(25, 4, 'Vệ sinh răng trước tẩy trắng', 'Làm sạch răng trước khi tẩy trắng', 1000000.00),
(26, 5, 'Tư vấn nhổ răng khôn', 'Tư vấn và kiểm tra tình trạng răng khôn', 300000.00),
(27, 5, 'Nhổ răng khôn mọc lệch', 'Nhổ răng khôn bị lệch với kỹ thuật an toàn', 2000000.00),
(28, 5, 'Nhổ răng khôn mọc ngầm', 'Thực hiện nhổ răng khôn mọc ngầm', 2500000.00),
(29, 5, 'Nhổ răng khôn siêu âm', 'Nhổ răng khôn với công nghệ siêu âm hiện đại', 3000000.00),
(30, 5, 'Chăm sóc sau nhổ răng khôn', 'Dịch vụ kiểm tra và chăm sóc sau nhổ răng', 500000.00),
(31, 6, 'Tư vấn điều trị nha chu', 'Tư vấn và kiểm tra các bệnh lý nha chu', 400000.00),
(32, 6, 'Điều trị viêm nướu', 'Điều trị tình trạng viêm nướu nhẹ', 1500000.00),
(33, 6, 'Điều trị viêm nha chu', 'Điều trị các bệnh lý viêm nha chu nghiêm trọng', 3000000.00),
(34, 6, 'Ghép nướu', 'Thực hiện ghép nướu do nha chu tổn thương', 5000000.00),
(35, 6, 'Vệ sinh răng nha chu', 'Vệ sinh răng và nướu để ngăn ngừa nha chu', 800000.00),
(36, 7, 'Tư vấn điều trị tủy', 'Tư vấn và đánh giá tình trạng tủy răng', 300000.00),
(37, 7, 'Điều trị tủy một răng', 'Điều trị tủy cho răng đơn lẻ', 2000000.00),
(38, 7, 'Điều trị tủy nhiều chân', 'Điều trị tủy cho răng nhiều chân', 3000000.00),
(39, 7, 'Tái tạo tủy răng', 'Tái tạo phần tủy bị tổn thương', 3500000.00),
(40, 7, 'Kiểm tra sau điều trị tủy', 'Kiểm tra tình trạng răng sau điều trị tủy', 500000.00),
(41, 8, 'Tư vấn hàn trám răng', 'Tư vấn và lựa chọn vật liệu hàn trám', 200000.00),
(42, 8, 'Hàn răng sâu', 'Thực hiện hàn trám răng bị sâu', 500000.00),
(43, 8, 'Trám răng thẩm mỹ', 'Hàn trám răng với vật liệu thẩm mỹ', 1000000.00),
(44, 8, 'Trám răng chống ê buốt', 'Trám răng để giảm ê buốt', 800000.00),
(45, 8, 'Chăm sóc răng sau hàn trám', 'Kiểm tra và chăm sóc sau hàn trám', 300000.00),
(46, 9, 'Tư vấn chăm sóc răng miệng', 'Tư vấn vệ sinh răng miệng trong thai kỳ', 200000.00),
(47, 9, 'Làm sạch răng cho bà bầu', 'Làm sạch răng miệng an toàn cho phụ nữ mang thai', 800000.00),
(48, 9, 'Điều trị viêm nướu', 'Điều trị viêm nướu nhẹ trong thai kỳ', 1200000.00),
(49, 9, 'Kiểm tra sức khỏe răng miệng', 'Kiểm tra định kỳ sức khỏe răng miệng', 500000.00),
(50, 9, 'Phòng ngừa bệnh lý nha khoa', 'Hướng dẫn phòng ngừa các bệnh răng miệng', 300000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specialties`
--

CREATE TABLE `specialties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `specialties`
--

INSERT INTO `specialties` (`id`, `name`, `description`, `created_at`, `image`) VALUES
(1, 'Bọc răng sứ', 'Bọc răng sứ (phục hình cố định răng sứ) là sử dụng răng sứ được làm hoàn toàn từ sứ hoặc sứ kết hợp cùng kim loại để chụp lên phần răng khiếm khuyết hoặc hư tổn để tái tạo hình dáng, kích thước và màu sắc như răng thật.', '2024-11-03 18:31:12', 'uploads\\1732261806101-icon-boc-rang-su-1.png'),
(2, 'Cấy ghép implant', 'Cấy ghép Implant (hay cắm Implant) là phương pháp dùng một trụ chân răng nhân tạo bằng Titanium đặt vào trong xương hàm tại vị trí răng đã mất. Trụ chân răng này sẽ thay thế chân răng thật, sau đó dùng răng sứ gắn lên trụ răng Implant tạo thành răng hoàn chỉnh.', '2024-11-03 18:32:18', 'uploads\\1732261829214-trong-rang-implant.jpg'),
(3, 'Niềng răng thẩm mỹ', 'Niềng răng (chỉnh nha) là kỹ thuật nha khoa giúp cải thiện và khắc phục tình trạng răng mọc khấp khểnh, xô lệch gây mất tương quan giữa 2 hàm. Khác với bọc răng sứ hay các phương pháp nha khoa khác, niềng răng sử dụng các khí cụ tạo lực kéo nhằm di chuyển răng về vị trí đúng trên cung hàm mà không gây ảnh hưởng đến chất lượng và tuổi thọ răng sau này. ', '2024-11-04 14:41:29', 'uploads\\1732261835713-nieng-rang-tham-my.png'),
(10, 'Mặt dán sứ Veneer', 'Mặt dán sứ Veneer là phương pháp phục hình thẩm mỹ giúp khắc phục khuyết điểm răng như răng thưa, sứt mẻ hoặc xỉn màu bằng cách dán một lớp sứ mỏng lên bề mặt răng.', '2024-11-17 14:17:31', 'uploads\\1732261842759-rang-su-veneer.png'),
(4, 'Tẩy trắng răng', 'Tẩy trắng răng là phương pháp dùng các hợp chất kết hợp với năng lượng ánh sáng sẽ tạo ra phản ứng oxy hóa cắt đứt các chuỗi phân tử màu trong ngà răng. ', '2024-11-04 14:42:31', 'uploads\\1732261854147-icon-tay-trang-rang-1.png'),
(5, 'Nhổ răng khôn', 'Răng khôn mọc ngầm là tình trạng rạng răng mọc sai và cần được loại bỏ sớm nhằm hạn chế ảnh hưởng đến các răng cạnh. ', '2024-11-04 14:43:04', 'uploads\\1732261860831-icon-nho-rang-khon-1.png'),
(6, 'Bệnh lý nha chu', 'Bệnh nha chu là một bệnh nhiễm trùng nướu làm tổn thương mô mềm và phá hủy xương xung quanh răng. Trường hợp nhiễm trùng trở nên nghiêm trọng có thể khiến răng bị lỏng hoặc dẫn đến mất răng.', '2024-11-04 14:43:31', 'uploads\\1732261872466-icon-benh-ly-nha-chu.png'),
(7, 'Điều trị tủy', 'Tủy răng chứa nhiều dây thần kinh và mạch máu có ở cả thân răng và chân răng (gọi là buồng tủy và ống tủy) nằm trong hốc giữa ngà răng.', '2024-11-04 14:44:20', 'uploads\\1732261879910-dieu-tri-tuy.png'),
(8, 'Hàn trám răng', 'Hàn trám răng là kỹ thuật mà bác sĩ sẽ sử dụng vật liệu trám bít để khôi phục lại hình dáng và chức năng của răng. Phương pháp này được sử dụng phổ biến trong nha khoa bởi mang lại ý nghĩa cả về thẩm mỹ lẫn điều trị và phòng ngừa bệnh lý răng miệng.', '2024-11-04 14:45:02', 'uploads\\1732261891665-icon-han-tram-rang-sau-01.jpg'),
(9, 'Chăm sóc răng miệng cho phụ nữ mang thai', 'Giai đoạn mang thai, hệ miễn dịch, hóc môn cũng như lượng canxi trong cơ thể thay đổi liên tục, do đó, bà bầu dễ mắc các bệnh về răng miệng và viêm nướu, chảy máu chân răng, viêm nha chu, sâu răng… là bệnh lý phổ biến nhất mà phụ nữ mang thai thường gặp phải.', '2024-11-04 14:45:25', 'uploads\\1732261902379-Icon_Web-08.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `status`, `created_at`) VALUES
(1, 'admin', '$2b$10$GJi53bWUZ8DM09CrvVTSkuP7POV7eBKeqi.2Nd2dtMl6cDkWvT30i', 'admin', 1, '2024-11-23 01:19:28'),
(3, 'drkhanh', '$2b$10$oZLhhsqZ7u9yrFfCABC00eKqG1.GOxb/ejGffOrMQ94iVx1Tm7sc6', 'doctor', 1, '2024-11-23 01:26:25'),
(4, 'drtrang', '$2b$10$4dlSfC8gy5COZGSJMmK4yeWiGzcCVL5Nof7IEA8pUDESeevmmSQQ2', 'doctor', 1, '2024-11-23 01:28:36'),
(5, 'dranh', '$2b$10$DQ05ijEWlI1YRwzURGyuCuUJ6s6cCxoiUp.9g2i8JKeT/SDOWL0oa', 'doctor', 1, '2024-11-23 01:29:40'),
(6, 'drduc', '$2b$10$PjUv4fUMubfgx9uDyz7SgOt8wxe1vcCmF5vKOgUOeERpu/hZNkL9.', 'doctor', 1, '2024-11-23 01:30:30'),
(7, 'drquoc', '$2b$10$ARira0QoGSMXAx4UE6jJFOD0siM.ncZgftlNSQXEazu2ZRA546YCe', 'doctor', 1, '2024-11-23 01:31:08'),
(8, 'drbkhanh', '$2b$10$d.Mos3oleprDbRDGePmihuubtMXhYLH6d.GoBftfLP536/BsNWsSC', 'doctor', 1, '2024-11-23 01:31:50'),
(9, 'drxuyen', '$2b$10$4SN.I7oQ2yAj/ly1OZy73.Tc/5fnL1TD8U/o2HMetlRbc7EaEcetO', 'doctor', 1, '2024-11-23 01:32:37'),
(10, 'drtan', '$2b$10$sqLg9eswXt9kN5Imzu.9F.fYguZcQpGXDXDHENS5YQISjRNmxY11O', 'doctor', 1, '2024-11-23 01:33:31'),
(11, 'drhuong', '$2b$10$LUzY/c3Pdrqekr9.5hACauMG5DmMB3Ti4/7sgijZLAo6m9jSQCoGu', 'doctor', 1, '2024-11-23 01:35:13'),
(12, 'drtung', '$2b$10$/9w8ji.htjL8MkS9HqgBiOhsHZghwaiixp72C9fZjWbO3MYzvsS4i', 'doctor', 1, '2024-11-23 01:36:55'),
(13, 'drthang', '$2b$10$1xVprREHzX/HYViGkDJCouMFNz4AHBLG0ssOEOxnVK1VklfUZQiEG', 'doctor', 1, '2024-11-23 01:38:16'),
(18, 'tuoinguyen', '$2b$10$Y/7DriAbHc3R6JfUyKrsse6B4Dibn8sVYdkt3CTsZFh4G4XSQZ8oO', 'patient', 1, '2024-11-27 17:55:01'),
(19, 'tuoinguyen1', '$2b$10$R/NstuoN.a/2Obd8C0evweXbA9fIOGnFiNHQJuEaHOzzAPvTydTeO', 'patient', 1, '2024-11-27 17:55:52');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `booking_appointments`
--
ALTER TABLE `booking_appointments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `booking_appointments_fk1` (`doctor_id`);

--
-- Chỉ mục cho bảng `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `doctors_fk1` (`user_id`);

--
-- Chỉ mục cho bảng `follow_up_appointments`
--
ALTER TABLE `follow_up_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Chỉ mục cho bảng `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `patients_fk1` (`user_id`);

--
-- Chỉ mục cho bảng `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `booking_appointments`
--
ALTER TABLE `booking_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `follow_up_appointments`
--
ALTER TABLE `follow_up_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `follow_up_appointments`
--
ALTER TABLE `follow_up_appointments`
  ADD CONSTRAINT `follow_up_appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
