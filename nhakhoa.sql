-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 18, 2024 lúc 03:59 AM
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
(1, 'Mai Hiếu', '0862355036', '56/1 Đường số 5 Phường Bình Trưng Tây TP Thủ Đức TP Hồ Chí Minh', 'Nam', 1996, '2005-02-17', '11:11:00', 1, 'g', '2024-11-02 14:38:20', 'accept', NULL),
(2, 'hhh', '0938444666', 'fgjggf', 'Nam', 1995, '2024-11-04', '00:00:00', 1, 'xgjn', '2024-11-04 08:03:46', 'accept', NULL),
(3, 'Mai Hiếu', '0938444666', 'sdgf', 'Nam', 1995, '2024-11-30', '02:45:00', 2, 'hvk', '2024-11-04 11:42:32', 'reject', NULL),
(4, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 'Nam', 1999, '2024-11-04', '11:43:00', 2, '123', '2024-11-04 11:43:20', 'reject', NULL),
(5, 'h', '0938444666', 'dhxt', 'Nam', 1996, '2024-11-21', '01:57:00', 4, 'ghkj', '2024-11-04 11:55:40', 'pending', NULL),
(6, 'Mai Hiếu', '0938444666', 'ghjk,', 'Nam', 1995, '2024-11-21', '01:57:00', 4, 'hkmhfvgkm', '2024-11-04 12:32:53', 'pending', NULL),
(7, 'Mai Hiếu', 'tj', '56/1 Đường số 5 Phường Bình Trưng Tây TP Thủ Đức TP Hồ Chí Minh', 'Nam', 1994, '2024-11-14', '18:21:00', 2, 'gku', '2024-11-04 14:17:17', 'accept', NULL),
(8, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 'Nam', 1999, '2024-11-04', '17:07:00', 1, '1231412', '2024-11-04 17:07:04', 'accept', NULL),
(9, 'Tươi Nguyễn hhh', '0386812934', 'tranhungdao', 'Nam', 1999, '2024-11-05', '17:22:00', 2, '112312312', '2024-11-04 17:22:48', 'reject', NULL),
(10, 'Tươi Nguyễn hhh', '0386812934', 'tranhungdao', 'Nam', 1999, '2024-11-04', '17:30:00', 2, '1231231', '2024-11-04 17:26:42', 'reject', NULL),
(11, 'Tươi Nguyễn hhh', '0386812934', 'tranhungdao', 'Nam', 1999, '2024-11-05', '17:30:00', 5, '1231231', '2024-11-04 17:30:12', 'reject', NULL),
(12, 'Tươi Nguyễn hhhdsa', '0386812934', 'tranhungdao', 'Nam', 1999, '2024-11-04', '17:31:00', 5, 'asdasdasdas', '2024-11-04 17:31:53', 'accept', NULL),
(13, 'Tươi Nguyễn hhhdsa', '0386812934', 'tranhungdao', 'Nam', 1999, '2024-11-04', '17:31:00', 5, 'asdasdasdas', '2024-11-04 17:31:54', 'reject', NULL),
(14, 'rdhf', '0938444666', 'sr', 'Nam', 1995, '2024-11-08', '17:50:00', 1, 'ghbjk,', '2024-11-04 17:45:49', 'accept', 15),
(15, 'Tươi Nguyễn hh', '0386812934', 'tranhungdao', 'Nam', 1999, '2024-11-06', '18:01:00', 5, '123123', '2024-11-04 18:01:17', 'accept', 14),
(16, 'Nguyễn Trần Ngọc Tươi', '0123456789', 'thf', 'Nam', 1999, '2024-11-06', '19:42:00', 6, '1231231231231231', '2024-11-04 19:42:56', 'accept', 5),
(17, 'Nguyễn Tươi', '1686812933', 'Ang Gianb', 'Nam', 2000, '2024-11-06', '11:18:00', 9, '123123', '2024-11-04 22:18:02', 'accept', 22),
(18, 'Nguyễn Tươi', '1686812933', 'Ang Gianb', 'Nam', 2002, '2024-11-05', '10:37:00', 8, '213123', '2024-11-04 22:37:09', 'accept', 0),
(19, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-08', '16:01:00', 5, 'okok', '2024-11-08 15:01:11', 'accept', 22),
(20, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 'Nam', 2000, '2024-11-08', '16:01:00', 1, 'ko okok', '2024-11-08 15:01:38', 'reject', 0),
(21, 'TT Nguyễn', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-08', '16:04:00', 2, 'okok', '2024-11-08 15:03:32', 'pending', 22),
(22, 'TT Nguyễn', '0386812933', 'tranhungdao 111', '', 1999, '2024-11-08', '16:04:00', 2, 'okokoko', '2024-11-08 15:03:48', 'pending', 0),
(23, 'TT Nguyễn', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-08', '16:06:00', 8, 'okokok', '2024-11-08 15:05:23', 'accept', 23),
(24, 'TT Nguyễn', '0386812933', 'tranhungdao 111', '', 1999, '2024-11-08', '16:06:00', 8, 'akkakaka', '2024-11-08 15:05:37', 'reject', 0),
(25, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-08', '15:12:00', 8, 'ádasdas', '2024-11-08 15:12:58', 'accept', 23),
(26, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-08', '15:13:00', 8, '1231231', '2024-11-08 15:13:24', 'reject', 23),
(27, 'Nguyễn Tươi 1234', '1686812933', 'Ang Gianb', 'Nam', 2000, '2024-11-09', '10:30:00', 8, '123', '2024-11-09 09:30:36', 'pending', 22),
(28, 'Nguyen Tran Ngoc Tuoi 123', '1686812933', 'tranhungdao', 'Nam', 2000, '2024-11-11', '21:00:00', 8, '123', '2024-11-09 09:36:20', 'accept', 22),
(29, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-11', '23:11:00', 2, '123', '2024-11-11 23:11:52', 'pending', 22),
(30, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-11', '23:54:00', 1, '123', '2024-11-11 23:54:38', 'reject', 0),
(31, '1', '1', '1', 'Nam', 1999, '2024-11-16', '20:44:00', 1, 'ádasd', '2024-11-16 20:44:58', 'pending', 0),
(32, 'Nguyễn Tươi', '1686812933', 'Ang Gianb', 'Nam', 1999, '2024-11-16', '20:45:00', 9, '123', '2024-11-16 20:45:26', 'pending', 0),
(33, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 'Nam', 2000, '2024-11-17', '23:51:00', 1, 'OK', '2024-11-17 23:51:35', 'pending', 0),
(34, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 'Nam', 2000, '2024-11-17', '23:53:00', 5, '12', '2024-11-17 23:53:23', 'pending', 0),
(35, 'Tươi Nguyễn', '0386812933', 'tranhungdao', '', 2000, '2024-11-19', '12:12:00', 8, '123', '2024-11-17 23:53:57', 'pending', 0),
(36, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 'Nam', 2000, '2024-11-18', '23:00:00', 8, '123', '2024-11-17 23:57:10', 'pending', 0),
(37, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 'Nam', 2000, '2024-11-17', '23:59:00', 8, '123', '2024-11-17 23:59:55', 'pending', 8),
(38, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 'Nam', 2000, '2024-11-18', '00:03:00', 8, '123', '2024-11-18 00:03:20', 'pending', 8),
(39, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 'Nam', 2000, '2024-11-18', '00:04:00', 8, '123', '2024-11-18 00:04:23', 'pending', 8),
(40, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 'Nam', 2000, '2024-11-18', '00:06:00', 2, '123', '2024-11-18 00:05:59', 'pending', 8),
(41, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 'Nam', 2000, '2024-11-19', '11:11:00', 8, '123', '2024-11-18 00:07:26', 'pending', 0),
(42, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 'Nam', 2000, '2024-11-19', '12:31:00', 10, '123', '2024-11-18 00:07:42', 'pending', 0),
(43, 'Nguyễn Trần Ngọc Tươi 123', '0386812933', 'tranhungdao 111', 'Nam', 2000, '2024-11-19', '11:00:00', 8, 'asd', '2024-11-18 00:26:16', 'pending', 0),
(44, 'Nguyễn Trần Ngọc Tươi 1234', '0386812933', 'tranhungdao 111', 'Nam', 2000, '2024-11-18', '09:00:00', 8, 'asd', '2024-11-18 00:35:55', 'pending', 0);

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
  `specialty` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `fullname`, `phone`, `address`, `gender`, `birth_year`, `specialty`, `created_at`, `image`) VALUES
(1, 5, 'BS.Đinh Ngọc Khánh', '0123456789', 'Cần Thơ', 0, 1999, '2', '2024-11-01 08:56:07', 'uploads\\1730730668422-bac-si-dinh-ngoc-khanh-2.png'),
(2, 9, 'BS.Mai Thị Trang', '0938444666', 'Cần thơ', 1, 2000, '3', '2024-11-04 01:05:39', 'uploads\\1730730773505-z5336771465710_0f4538c676f7f3640678ffdc96b5d68e.jpg'),
(5, 17, 'BS.Lê Thị Hoài Anh', '0386812933', 'Cần Thơ', 1, 2000, '5', '2024-11-04 17:27:34', 'uploads\\1730730820419-400-1.png'),
(8, 26, 'BS.Đỗ Văn Đức', '0123456789', 'Cần Thơ', 0, 2000, '12', '2024-11-04 21:34:20', 'uploads\\1730730860271-bs-duc.png'),
(9, 27, 'BS.Phạm Ngọc Quốc', '0123456789', 'Cần Thơ', 0, 2000, '7', '2024-11-04 21:35:14', 'uploads\\1730730914252-bs-Ngoc-Quoc.png'),
(10, 28, 'BS.Nguyễn Gia Bảo Khánh', '0123456789', 'Cần Thơ', 1, 2000, '8', '2024-11-04 21:35:53', 'uploads\\1730730952966-vietsmile_Bac-si-Nguyen-Gia-Bao-Khanh.png'),
(11, 29, 'BS.Đặng Thị Hà Xuyên', '0123456789', 'Cần Thơ', 1, 1998, '9', '2024-11-04 21:36:25', 'uploads\\1730730985256-bac-si-dang-thi-ha-xuyen.png'),
(12, 30, 'BS.Nguyễn Hữu Tân', '0123456789', 'Cần Thơ', 0, 1998, '10', '2024-11-04 21:37:02', 'uploads\\1730731022000-bac-si-nguyen-huu-tan.png'),
(17, 42, 'Tươi Nguyễn', '0386812933', 'tranhungdao', 0, 1222, '2', '2024-11-16 23:54:22', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `follow_up_appointments`
--

CREATE TABLE `follow_up_appointments` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `follow_up_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `follow_up_appointments`
--

INSERT INTO `follow_up_appointments` (`id`, `patient_name`, `follow_up_date`, `notes`, `doctor_id`, `created_at`) VALUES
(3, '3', '2024-11-05', '123', 1, '2024-11-04 06:06:42'),
(4, '12', '2024-11-05', '123', 1, '2024-11-04 10:38:22'),
(5, '15', '2024-11-19', 'tdhj', 1, '2024-11-04 10:57:04'),
(6, '14', '2024-11-21', '1231', 5, '2024-11-04 11:02:10'),
(7, '22', '2024-11-08', '123123', 1, '2024-11-07 15:20:38'),
(8, '22', '2024-11-10', 'ok', 8, '2024-11-09 02:42:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `medical_records`
--

CREATE TABLE `medical_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `diagnosis` text NOT NULL,
  `treatment` text NOT NULL,
  `record_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `medical_records`
--

INSERT INTO `medical_records` (`id`, `patient_id`, `doctor_id`, `diagnosis`, `treatment`, `record_date`) VALUES
(8, 21, 5, '123', '123', '2024-11-16'),
(9, 22, 1, '123312', '123213', '2024-11-09');

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
(21, 31, 'Nguy', '0999999999', 'tranhungdao', 1, 1999, '2024-11-04 21:51:55'),
(22, 32, 'Nguyen Tran Ngoc Tuoi', '0686812933', 'tranhungdao', 1, 2000, '2024-11-04 22:02:48'),
(23, 33, 'TT Nguyễn', '0386812933', 'tranhungdao 111', 1, 2004, '2024-11-07 22:31:36'),
(24, 34, '1', '111111111', '1', 1, 1, '2024-11-09 04:19:39'),
(25, 35, 'Nguy', '0386812933', 'tranhungdao 111', 1, 1, '2024-11-14 19:51:12'),
(26, 36, 'Nguy', '0386812933', 'tranhungdao 111', 1, 1, '2024-11-14 19:52:12'),
(27, 37, '2', '3', '4', 1, 5, '2024-11-14 19:54:31');

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
(1, 2, 'Khám răng khôn', 'Khám răng ', 1000000.00),
(2, 3, 'admin', 'Lắp răng', 1500000.00),
(3, 2, '123', '123', 1.50);

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
(1, 'Bọc răng sứ', 'Bọc răng sứ (phục hình cố định răng sứ) là sử dụng răng sứ được làm hoàn toàn từ sứ hoặc sứ kết hợp cùng kim loại để chụp lên phần răng khiếm khuyết hoặc hư tổn để tái tạo hình dáng, kích thước và màu sắc như răng thật.', '2024-11-03 18:31:12', 'uploads\\1730731188231-icon-boc-rang-su-1.png'),
(2, 'Cấy ghép implant', 'Cấy ghép Implant (hay cắm Implant) là phương pháp dùng một trụ chân răng nhân tạo bằng Titanium đặt vào trong xương hàm tại vị trí răng đã mất. Trụ chân răng này sẽ thay thế chân răng thật, sau đó dùng răng sứ gắn lên trụ răng Implant tạo thành răng hoàn chỉnh.', '2024-11-03 18:32:18', 'uploads\\1730731259963-trong-rang-implant.jpg'),
(3, 'Niềng răng thẩm mỹ', 'Niềng răng (chỉnh nha) là kỹ thuật nha khoa giúp cải thiện và khắc phục tình trạng răng mọc khấp khểnh, xô lệch gây mất tương quan giữa 2 hàm. Khác với bọc răng sứ hay các phương pháp nha khoa khác, niềng răng sử dụng các khí cụ tạo lực kéo nhằm di chuyển răng về vị trí đúng trên cung hàm mà không gây ảnh hưởng đến chất lượng và tuổi thọ răng sau này. ', '2024-11-04 14:41:29', 'uploads\\1730731289591-nieng-rang-tham-my.png'),
(10, 'Mặt dán sứ Veneer', 'Mặt dán sứ Veneer là phương pháp phục hình thẩm mỹ giúp khắc phục khuyết điểm răng như răng thưa, sứt mẻ hoặc xỉn màu bằng cách dán một lớp sứ mỏng lên bề mặt răng.', '2024-11-17 14:17:31', 'uploads\\1731853536442-rang-su-veneer.png'),
(4, 'Tẩy trắng răng', 'Tẩy trắng răng là phương pháp dùng các hợp chất kết hợp với năng lượng ánh sáng sẽ tạo ra phản ứng oxy hóa cắt đứt các chuỗi phân tử màu trong ngà răng. ', '2024-11-04 14:42:31', 'uploads\\1730731351663-icon-tay-trang-rang-1.png'),
(5, 'Nhổ răng khôn', 'Răng khôn mọc ngầm là tình trạng rạng răng mọc sai và cần được loại bỏ sớm nhằm hạn chế ảnh hưởng đến các răng cạnh. ', '2024-11-04 14:43:04', 'uploads\\1730731384762-icon-nho-rang-khon-1.png'),
(6, 'Bệnh lý nha chu', 'Bệnh nha chu là một bệnh nhiễm trùng nướu làm tổn thương mô mềm và phá hủy xương xung quanh răng. Trường hợp nhiễm trùng trở nên nghiêm trọng có thể khiến răng bị lỏng hoặc dẫn đến mất răng.', '2024-11-04 14:43:31', 'uploads\\1730731814536-icon-benh-ly-nha-chu.png'),
(7, 'Điều trị tủy', 'Tủy răng chứa nhiều dây thần kinh và mạch máu có ở cả thân răng và chân răng (gọi là buồng tủy và ống tủy) nằm trong hốc giữa ngà răng.', '2024-11-04 14:44:20', 'uploads\\1730731460572-dieu-tri-tuy.png'),
(8, 'Hàn trám răng', 'Hàn trám răng là kỹ thuật mà bác sĩ sẽ sử dụng vật liệu trám bít để khôi phục lại hình dáng và chức năng của răng. Phương pháp này được sử dụng phổ biến trong nha khoa bởi mang lại ý nghĩa cả về thẩm mỹ lẫn điều trị và phòng ngừa bệnh lý răng miệng.', '2024-11-04 14:45:02', 'uploads\\1730731502843-icon-han-tram-rang-sau-01.jpg'),
(9, 'Chăm sóc răng miệng cho phụ nữ mang thai', 'Giai đoạn mang thai, hệ miễn dịch, hóc môn cũng như lượng canxi trong cơ thể thay đổi liên tục, do đó, bà bầu dễ mắc các bệnh về răng miệng và viêm nướu, chảy máu chân răng, viêm nha chu, sâu răng… là bệnh lý phổ biến nhất mà phụ nữ mang thai thường gặp phải.', '2024-11-04 14:45:25', 'uploads\\1730731525299-Icon_Web-08.png');

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
(5, 'khanh', '$2b$10$MRA1BaB8GLgDgrmd1bZKtOehdSAcSHXiZ9qagSrTxj43C/tMyAMsO', 'doctor', 1, '2024-11-01 08:55:23'),
(9, 'trang', '$2b$10$CVYL6il0Mb24DzoHphP6tuClCvHkArNbV65WVcapQQtbpi9wK6tp6', 'doctor', 1, '2024-11-04 01:05:39'),
(17, 'anh', '$2b$10$c8vsDk35ZjdaL0zjuIR2MenWobzNh3boQRPdS6K/VHkngb4tTwKjm', 'doctor', 1, '2024-11-04 17:27:34'),
(26, 'duc', '$2b$10$1TUmHnXWxOCRhpiGTwJQM.GQGhzdgd2VuxqXaBEb0iha7UilZyENW', 'doctor', 1, '2024-11-04 21:34:20'),
(27, 'quoc', '$2b$10$riDKTHX06bBUCj7n4A9U7OElJZfIq1dZ7Xc1/kF3LY/9p9fOGikKu', 'doctor', 1, '2024-11-04 21:35:14'),
(28, 'khanh', '$2b$10$ViQhgwSuV3Ba4YWKQoQszuAEeagQEXHoEsVTzUhyY9X4oCo8Gx2aK', 'doctor', 1, '2024-11-04 21:35:53'),
(29, 'xuyen', '$2b$10$30ZrHuOzjsKW6CRNKJg7POni9E99.XeHVJwj5gNSYhTgBa4oQ.n8a', 'doctor', 1, '2024-11-04 21:36:25'),
(30, 'tan', '$2b$10$pKeEUu1DJec/bJWjg1Va.OLRJKH/OYZRCevQlnXlXW4oU9Qh5gU9a', 'doctor', 1, '2024-11-04 21:37:02'),
(31, 'admin', '$2b$10$uy9H0nbpSZrZhja6D10wFO0R7PBVrvgrnt.dx8Vs6TirWyP9u94ey', 'admin', 1, '2024-11-04 21:51:55'),
(32, 't', '$2b$10$7JXXmZI8ib/GaOqW7f99.OU88qPFnt0N9odkZGPHb/GUany24x/l.', 'patient', 1, '2024-11-04 22:02:48'),
(33, 'tt', '$2b$10$ZpzgXUT/74OkviPmxNgaX.gsy/QtCADHejQjAJ4NHykM5/WEeQTqa', 'patient', 1, '2024-11-07 22:31:36'),
(34, '1', '$2b$10$NZfWzqrijcwzwRywwIqIV.JQOK4WtfeOu5q4Zh5twZL.l8hne9.0i', 'patient', 1, '2024-11-09 04:19:39'),
(35, '12', '$2b$10$O6frTyFCkxv/4Z5Hivfxw.982sObTPzeKcKaAbXF/gaW/Zjy2IOzu', 'patient', 1, '2024-11-14 19:51:12'),
(36, '123', '$2b$10$Av6fPnzbm3P.CX.qXsWLb.yQNP0OsiOMckihrTPWPtEiiw2f6HEIi', 'patient', 1, '2024-11-14 19:52:12'),
(37, '1234', '$2b$10$BexV6CGBnvxK3Z0fdh7vYO1LFrvcxdOIELLeCpn3UZDxA.LxlkOLi', 'patient', 1, '2024-11-14 19:54:31'),
(42, 'khanh', '$2b$10$1ygjfvoBs6RVzL5Re.jG7eEzEq2OySd9h0pole1H9r7YhbaXN.Eai', 'doctor', 1, '2024-11-16 23:54:22');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `follow_up_appointments`
--
ALTER TABLE `follow_up_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `follow_up_appointments`
--
ALTER TABLE `follow_up_appointments`
  ADD CONSTRAINT `follow_up_appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

--
-- Các ràng buộc cho bảng `medical_records`
--
ALTER TABLE `medical_records`
  ADD CONSTRAINT `medical_records_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `medical_records_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
