-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 22, 2024 lúc 02:25 PM
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
(21, 'TT Nguyễn', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-08', '16:04:00', 2, 'okok', '2024-11-08 15:03:32', 'accept', 22),
(22, 'TT Nguyễn', '0386812933', 'tranhungdao 111', '', 1999, '2024-11-08', '16:04:00', 2, 'okokoko', '2024-11-08 15:03:48', 'pending', 0),
(23, 'TT Nguyễn', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-08', '16:06:00', 8, 'okokok', '2024-11-08 15:05:23', 'accept', 23),
(24, 'TT Nguyễn', '0386812933', 'tranhungdao 111', '', 1999, '2024-11-08', '16:06:00', 8, 'akkakaka', '2024-11-08 15:05:37', 'reject', 0),
(25, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 1999, '2024-11-18', '10:00:00', 8, 'ádasdas', '2024-11-08 15:12:58', 'accept', 23),
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
(44, 'Nguyễn Trần Ngọc Tươi 1234', '0386812933', 'tranhungdao 111', 'Nam', 2000, '2024-11-18', '09:00:00', 8, 'asd', '2024-11-18 00:35:55', 'pending', 0),
(45, 'Nguyen Tran Ngoc Tuoi', '0686812933', 'tranhungdao', 'Nam', 1999, '2024-11-18', '08:00:00', 2, '8h', '2024-11-18 10:52:11', 'pending', 22),
(46, 'Nguyen Tran Ngoc Tuoi', '0686812933', 'tranhungdao', 'Nam', 1999, '2024-11-18', '08:00:00', 1, '123', '2024-11-18 11:28:38', 'reject', 22),
(47, 'Nguyen Tran Ngoc Tuoi', '0686812933', 'tranhungdao', 'Nam', 1999, '2024-11-18', '08:00:00', 12, '8h', '2024-11-18 11:41:52', 'pending', 22),
(48, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao 111', 'Nam', 2000, '2024-11-18', '08:00:00', 12, '12', '2024-11-18 11:42:52', 'reject', 0),
(49, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao', 'Nam', 1999, '2024-11-20', '12:00:00', 8, '123', '2024-11-18 22:43:45', 'pending', 22),
(50, 'Nguyễn Ngọc Lợi', '0975263989', 'An Giang', 'Nam', 1999, '2024-11-19', '09:00:00', 11, 'ok', '2024-11-19 02:50:10', 'accept', 30),
(51, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao', 'Nam', 1999, '2024-11-20', '10:00:00', 11, '123', '2024-11-19 09:46:01', 'accept', 22),
(52, 'Nguyễn Ngọc Lợi', '0975263989', 'An Giang', 'Nam', 1999, '2024-11-22', '12:00:00', 11, 'ok', '2024-11-22 00:33:41', 'reject', 30),
(53, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao', 'Nam', 1999, '2024-11-22', '13:00:00', 11, '123', '2024-11-22 00:55:57', 'pending', 22),
(54, 'Anh Thu', '0686812933', 'tranhungdao', 'Nam', 2000, '2024-11-23', '11:00:00', 11, '123', '2024-11-22 00:56:31', 'pending', 0),
(55, 'Nguyễn Ngọc Lợi', '0975263989', 'An Giang', 'Nam', 1999, '2024-11-22', '13:00:00', 8, '123', '2024-11-22 20:07:01', 'reject', 30);

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
(1, 5, 'BS.Đinh Ngọc Khánh', '0123456788', 'Cần Thơ', 0, 1999, 'Bác sĩ Đinh Ngọc Khánh được đào tạo chuyên sâu về tiểu phẫu, implant, với khả năng sử dụng thành thạo các thiết bị công nghệ cao trong nha khoa, các kỹ thuật chuyên sâu trong cấy ghép implant. Với nhiều năm kinh nghiệm khám, tư vấn và điều trị trong ngành nha khoa, bác sĩ Khánh luôn đặt yếu tố an toàn – chính xác lên chất lượng, đưa đến cho khách hàng những trải nghiệm an toàn, hiệu quả nhất.', 'Năm 2018 – 2020: Công tác tại bệnh viện Hữu Nghị Việt Nam – Cuba Hà Nội\r\n\r\nNăm 2020 – 2021: Công tác tại nha khoa Bảo Việt Hà Nội\r\n\r\nNăm 2021 – 2023: Công tác tại nha khoa Việt Smile', 'Chứng chỉ implant Viện đào tạo Răng – Hàm – Mặt – Đại học Y Hà Nội\r\nChứng nhận Thực hành về phẫu thuật tăng thể tích xương -nâng xoang trong implant\r\nHội thảo Cách mạng mới trong implant – Bệnh viện Răng Hàm Mặt TP.HCM', 'Cần Thơ', '1', '2', '2024-11-01 08:56:07', 'uploads\\1730730668422-bac-si-dinh-ngoc-khanh-2.png'),
(5, 17, 'BS.Lê Thị Hoài Anh', '0386812933', 'Cần Thơ', 1, 2000, NULL, NULL, NULL, NULL, NULL, '5', '2024-11-04 17:27:34', 'uploads\\1730730820419-400-1.png'),
(8, 26, 'BS.Đỗ Văn Đức', '0123456789', 'Cần Thơ', 0, 2000, '123', '123123', '1231', 'Cần Thơ', '12', '1', '2024-11-04 21:34:20', 'uploads\\1730730860271-bs-duc.png'),
(23, 52, 'Nguyen Tran Ngoc Tuoi', '0686812933', 'tranhungdao', 0, 2000, '123', '123', '123', 'Cần Thơ', '10h 12h', '10', '2024-11-22 14:20:04', 'uploads\\1732260003997-bs_bkhanh.png');

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
(7, '22', '2024-11-18', '1231', 1, '2024-11-07 15:20:38'),
(8, '22', '2024-11-10', 'ok', 8, '2024-11-09 02:42:35');

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
  `unit_price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `prescription` text DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `medical_records`
--

INSERT INTO `medical_records` (`id`, `patient_id`, `doctor_id`, `diagnosis`, `treatment`, `record_date`, `address`, `phone`, `gender`, `birth_year`, `specialty`, `service`, `quantity`, `unit_price`, `total_price`, `prescription`, `amount`, `service_id`, `appointment_id`) VALUES
(1, 0, 11, 'tốt', 'tốt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 0, 11, 'xấu', 'xấu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 28, 11, 'tốt', 'tốt', '2024-11-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 30, 11, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 22, 11, '12', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 22, 8, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(22, 32, 'Nguyễn Trần Ngọc Tươi', '0386812933', 'tranhungdao', 0, 2000, '2024-11-04 22:02:48'),
(28, 43, 'Nguyễn Ngọc Tân', '0386812944', '123', 0, 1999, '2024-11-18 18:24:58'),
(30, 46, 'Nguyễn Ngọc Lợi', '0975263989', 'An Giang', 0, 1999, '2024-11-18 19:35:01');

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
(1, 'admin', '$2b$12$ZHHNDLAHIAN2gMomEX4ps.ZeO5DGvkppvY9hXQjhmADE635R5iFYS', 'admin', 1, '2024-11-18 19:39:16'),
(5, 'drkhanh', '$2b$10$MRA1BaB8GLgDgrmd1bZKtOehdSAcSHXiZ9qagSrTxj43C/tMyAMsO', 'doctor', 1, '2024-11-01 08:55:23'),
(17, 'anh', '$2b$10$c8vsDk35ZjdaL0zjuIR2MenWobzNh3boQRPdS6K/VHkngb4tTwKjm', 'doctor', 1, '2024-11-04 17:27:34'),
(26, 'drduc', '$2b$10$1TUmHnXWxOCRhpiGTwJQM.GQGhzdgd2VuxqXaBEb0iha7UilZyENW', 'doctor', 1, '2024-11-04 21:34:20'),
(32, 'tuoinguyen', '$2b$10$7JXXmZI8ib/GaOqW7f99.OU88qPFnt0N9odkZGPHb/GUany24x/l.', 'patient', 1, '2024-11-04 22:02:48'),
(43, 'tuoi1', '$2b$10$ViguuH5Amt.DzsK8hOoNf.cico/6F4mtQ3eip7UhfX9u.zYcVxs9u', 'patient', 1, '2024-11-18 18:24:58'),
(46, 'ngocloi', '$2b$10$XS79R3u9gjaPR9e97T3sU.7jcW5c7IF/Zec6u3nJeG27RIvlnoN/K', 'patient', 1, '2024-11-18 19:35:01'),
(52, 'tuoi', '$2b$10$tSEoRKPmGeEPfpU/d7YimuT2ebjRRwhEau8w5BlP6R/.eMfPO58jO', 'doctor', 1, '2024-11-22 14:20:04');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `follow_up_appointments`
--
ALTER TABLE `follow_up_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
