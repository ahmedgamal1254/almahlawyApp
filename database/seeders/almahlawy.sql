-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 02, 2024 at 12:34 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `almahlawy`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_view`
--

CREATE TABLE `book_view` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `book_id` bigint UNSIGNED NOT NULL,
  `counter` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_view`
--

INSERT INTO `book_view` (`id`, `user_id`, `book_id`, `counter`, `created_at`, `updated_at`) VALUES
(1, 5, 17, 1, NULL, NULL),
(2, 5, 3, 1, NULL, NULL),
(3, 5, 20, 1, NULL, NULL),
(4, 1, 12, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_studies`
--

CREATE TABLE `class_studies` (
  `id` bigint UNSIGNED NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_time` time DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subject_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_studies`
--

INSERT INTO `class_studies` (`id`, `group_name`, `group_time`, `description`, `subject_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'سنتر الروضة', NULL, NULL, 1, 1, NULL, '2024-06-11 09:51:00', '2024-06-16 21:07:19'),
(2, 'أونلاين', '12:00:00', NULL, 1, 1, NULL, '2024-06-11 09:52:22', '2024-06-11 09:52:22'),
(3, 'سنتر شبين الكوم', NULL, NULL, 1, 1, NULL, '2024-06-16 21:07:40', '2024-06-16 21:07:40'),
(4, 'سنتر 2', NULL, NULL, 1, 1, NULL, '2024-06-16 21:10:42', '2024-06-16 21:10:42'),
(5, 'مجموعة أونلاين', NULL, NULL, 1, 1, NULL, '2024-06-27 06:54:15', '2024-06-27 06:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `date_exam` date DEFAULT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `units_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `free` tinyint NOT NULL DEFAULT '0' COMMENT '0==> not free,1==> free'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `title`, `description`, `code`, `duration`, `start_time`, `end_time`, `date_exam`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`, `units_id`, `free`) VALUES
(2, 'امتخان التيار الكهربى وقانون كيرشوف', NULL, '552661662', '30', '22:00:00', '23:00:00', '2024-08-11', 1, 1, 1, NULL, '2024-06-11 18:45:57', '2024-06-11 18:45:57', '10', 0),
(3, 'اختبار الفيزياء', NULL, '237912797', '60', '05:30:00', '06:30:00', '2024-08-31', 1, 1, 1, NULL, '2024-06-16 01:38:30', '2024-06-16 01:38:30', '10,11', 0),
(4, 'التيار الكهربى والفيزياء الحديثة', NULL, '469846823', '45', '23:12:00', '12:12:00', '2024-08-17', 1, 1, 1, NULL, '2024-06-17 18:13:28', '2024-06-17 18:13:28', '10,11', 0),
(5, 'test', NULL, '112245088', '45', '13:15:00', '12:15:00', '2024-06-20', 1, 1, 1, NULL, '2024-06-17 18:15:23', '2024-06-17 18:15:23', '10,11', 0),
(6, 'test exam', 'test', '386667356', '30', '20:39:00', '21:37:00', '2024-08-17', 1, 1, 1, NULL, '2024-06-17 18:38:05', '2024-06-17 18:38:05', '10,11', 0),
(7, 'امتحان التيار الكهربى والفيزيااء الحديثة', NULL, '926980167', '30', '13:14:00', '23:14:00', '2025-01-17', 1, 1, 1, NULL, '2024-06-17 20:13:59', '2024-06-21 05:27:21', '10,11', 0),
(8, 'امتحان القوة والحركة', 'وصف امتحان القوة والحركة', '424578165', '60', '22:40:00', '23:40:00', '2025-01-17', 1, 3, 1, NULL, '2024-06-29 19:39:49', '2024-06-29 19:39:49', '2,5', 0),
(9, 'امتحان جديد 3 ثانوى', 'وصف امتحان جديد 3 ثانوى', '502428813', '30', '11:50:00', '23:49:00', '2025-01-17', 1, 1, 1, NULL, '2024-06-29 21:49:50', '2024-06-29 21:49:50', '17,12,10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exam_student`
--

CREATE TABLE `exam_student` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `status` tinyint DEFAULT NULL COMMENT '0:end,1:opened',
  `degree` float DEFAULT NULL COMMENT 'student degree in exam',
  `total` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_student`
--

INSERT INTO `exam_student` (`id`, `user_id`, `exam_id`, `status`, `degree`, `total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 7, 0, 22, 40, '2024-06-21 05:42:51', '2024-06-21 05:42:51', NULL),
(2, 6, 7, 0, 0, 40, '2024-06-21 05:42:51', '2024-06-21 05:42:51', NULL),
(3, 7, 4, 0, 0, 40, '2024-06-21 05:42:51', '2024-06-21 05:42:51', NULL),
(4, 7, 6, 0, 20, 40, '2024-06-21 05:42:51', '2024-06-21 05:42:51', NULL),
(5, 5, 2, 0, 25, 40, '2024-06-21 05:42:51', '2024-06-21 05:42:51', NULL),
(6, 6, 3, 0, 15, 40, '2024-06-21 05:42:51', '2024-06-21 05:42:51', NULL),
(7, 7, 2, 0, 15, 40, '2024-06-21 05:42:51', '2024-06-21 05:42:51', NULL),
(9, 5, 3, 0, 22, 40, '2024-06-21 05:42:51', '2024-06-21 05:42:51', NULL),
(10, 6, 6, 0, 0, 40, '2024-06-21 05:42:51', '2024-06-21 05:42:51', NULL),
(11, 6, 2, 0, 25, 40, '2024-06-21 05:42:51', '2024-06-21 05:42:51', NULL),
(13, 7, 7, 0, 25, 40, '2024-06-21 05:42:51', '2024-06-21 05:42:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_timer`
--

CREATE TABLE `exam_timer` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `timer` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `free_books`
--

CREATE TABLE `free_books` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `free_books`
--

INSERT INTO `free_books` (`id`, `title`, `description`, `media_url`, `cover`, `unit_id`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ملخص قانون كيرشوف وقانون أوم للدوائر المغلقة', 'test', 'Lecture 1, 2 (Dr.Alshimaa).pdf', 'books_caption/blob-scene-haikei.png', NULL, 1, 1, 1, NULL, '2024-06-11 13:25:32', '2024-06-17 20:45:32'),
(2, 'ملخص قوانين نيوتن', 'وصف ملخص قوانين نيوتن', '6680cfee422c4_478658373.pdf', 'books_caption/books_caption_6680cfcfec623.jpg', 4, 1, 3, 1, NULL, '2024-06-30 04:24:00', '2024-06-30 04:24:30');

-- --------------------------------------------------------

--
-- Table structure for table `free_exams`
--

CREATE TABLE `free_exams` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `free_videos`
--

CREATE TABLE `free_videos` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'main_server',
  `video_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int NOT NULL,
  `image_caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `free_videos`
--

INSERT INTO `free_videos` (`id`, `title`, `description`, `source`, `video_url`, `duration`, `image_caption`, `unit_id`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'مراجعة درس التيار الكهربى وقانون كيرشوف', 'test', 'main_server', 'http://localhost/Teacher-System/public/app/videos/667d5535d3686_310901276.mp4', 120, 'captions/1674075919800.jpg', 10, 1, 1, 1, NULL, '2024-06-11 13:22:10', '2024-06-11 13:23:07'),
(3, 'درس مجانى', 'وصف للدرس', 'main_server', 'http://localhost/Teacher-System/public/app/videos/667d5535d3686_310901276.mp4', 120, 'captions/Screenshot-2024-06-01-at-2.49.19 PM-390x220.jpg', 6, 1, 3, 1, NULL, '2024-06-16 12:17:42', '2024-06-16 12:23:33'),
(4, 'درس مجانى 2', 'وصفه', 'main_server', 'http://localhost/Teacher-System/public/app/videos/667d5535d3686_310901276.mp4', 60, 'captions/image-04.png', 11, 1, 1, 1, NULL, '2024-06-16 12:22:47', '2024-06-16 12:33:50'),
(5, 'فيديو', 'وصف الفيديو', 'youtube', 'https://www.youtube.com/watch?v=z8hgnmw7PCw', 120, 'captions/captions_667d87fb2bb5c.png', NULL, 1, 1, 1, NULL, '2024-06-27 13:03:35', '2024-06-27 16:40:43'),
(6, 'فيديو جديد', 'وصف فيديو جديد', 'youtube', 'https://youtu.be/z8hgnmw7PCw', 120, 'captions/captions_667d87d86fa74.png', NULL, 1, 1, 1, NULL, '2024-06-27 13:08:25', '2024-06-27 16:40:08'),
(7, 'وصف فيديو جديد مجانى لطلبة 3 ثانوى', 'وصف فيديو جديد مجانى لطلبة 3 ثانوى', 'youtube', 'https://www.youtube.com/watch?v=w8ENjiyBYzg', 60, 'captions/captions_667ec4ce57371.png', 16, 1, 1, 1, NULL, '2024-06-28 15:12:31', '2024-06-28 15:12:31');

-- --------------------------------------------------------

--
-- Table structure for table `governments`
--

CREATE TABLE `governments` (
  `id` bigint UNSIGNED NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `governorate_name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `governorate_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `governments`
--

INSERT INTO `governments` (`id`, `country`, `governorate_name_ar`, `governorate_name_en`, `created_at`, `updated_at`) VALUES
(1, 'مصر', 'القاهرة', 'Cairo', '2023-09-04 02:25:43', '2023-09-04 02:25:43'),
(2, 'مصر', 'الجيزة', 'Giza', '2023-09-04 02:25:43', '2023-09-04 02:25:43'),
(3, 'مصر', 'الأسكندرية', 'Alexandria', '2023-09-04 02:25:43', '2023-09-04 02:25:43'),
(4, 'مصر', 'الدقهلية', 'Dakahlia', '2023-09-04 02:25:43', '2023-09-04 02:25:43'),
(5, 'مصر', 'البحر الأحمر', 'Red Sea', '2023-09-04 02:25:43', '2023-09-04 02:25:43'),
(6, 'مصر', 'البحيرة', 'Beheira', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(7, 'مصر', 'الفيوم', 'Fayoum', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(8, 'مصر', 'الغربية', 'Gharbiya', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(9, 'مصر', 'الإسماعلية', 'Ismailia', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(10, 'مصر', 'المنوفية', 'Menofia', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(11, 'مصر', 'المنيا', 'Minya', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(12, 'مصر', 'القليوبية', 'Qaliubiya', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(13, 'مصر', 'الوادي الجديد', 'New Valley', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(14, 'مصر', 'السويس', 'Suez', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(15, 'مصر', 'اسوان', 'Aswan', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(16, 'مصر', 'اسيوط', 'Assiut', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(17, 'مصر', 'بني سويف', 'Beni Suef', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(18, 'مصر', 'بورسعيد', 'Port Said', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(19, 'مصر', 'دمياط', 'Damietta', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(20, 'مصر', 'الشرقية', 'Sharkia', '2023-09-04 02:25:44', '2023-09-04 02:25:44'),
(21, 'مصر', 'جنوب سيناء', 'South Sinai', '2023-09-04 02:25:45', '2023-09-04 02:25:45'),
(22, 'مصر', 'كفر الشيخ', 'Kafr Al sheikh', '2023-09-04 02:25:45', '2023-09-04 02:25:45'),
(23, 'مصر', 'مطروح', 'Matrouh', '2023-09-04 02:25:45', '2023-09-04 02:25:45'),
(24, 'مصر', 'الأقصر', 'Luxor', '2023-09-04 02:25:45', '2023-09-04 02:25:45'),
(25, 'مصر', 'قنا', 'Qena', '2023-09-04 02:25:45', '2023-09-04 02:25:45'),
(26, 'مصر', 'شمال سيناء', 'North Sinai', '2023-09-04 02:25:45', '2023-09-04 02:25:45'),
(27, 'مصر', 'سوهاج', 'Sohag', '2023-09-04 02:25:45', '2023-09-04 02:25:45'),
(28, 'مصر', 'سوهاج', 'Sohag', NULL, NULL),
(29, 'مصر', 'شمال سيناء', 'North Sinai', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(70, 'default', '{\"uuid\":\"0cfc4d39-5cb6-40ca-9e0e-304d48437bdf\",\"displayName\":\"App\\\\Jobs\\\\NotificationLessonJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationLessonJob\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\NotificationLessonJob\\\":2:{s:18:\\\"\\u0000*\\u0000school_grade_id\\\";s:1:\\\"1\\\";s:10:\\\"\\u0000*\\u0000message\\\";s:71:\\\"تم رفع درس درس الحمض النوووى لشهر أغسطس\\\";}\"}}', 0, NULL, 1719680115, 1719680115),
(71, 'default', '{\"uuid\":\"f79e7ef3-9615-48b6-b054-ebe3fe92481c\",\"displayName\":\"App\\\\Jobs\\\\NotificationBookJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationBookJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationBookJob\\\":2:{s:15:\\\"\\u0000*\\u0000school_grade\\\";s:1:\\\"1\\\";s:7:\\\"\\u0000*\\u0000book\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:33;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 0, NULL, 1719681872, 1719681872),
(72, 'default', '{\"uuid\":\"f3b307ff-f624-4e19-8ec2-5a67e5cd2860\",\"displayName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationPostJob\\\":2:{s:8:\\\"\\u0000*\\u0000users\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:189:{i:0;i:1;i:1;i:3;i:2;i:4;i:3;i:6;i:4;i:8;i:5;i:16;i:6;i:19;i:7;i:20;i:8;i:21;i:9;i:22;i:10;i:23;i:11;i:24;i:12;i:26;i:13;i:28;i:14;i:29;i:15;i:30;i:16;i:31;i:17;i:32;i:18;i:35;i:19;i:37;i:20;i:38;i:21;i:39;i:22;i:40;i:23;i:41;i:24;i:42;i:25;i:43;i:26;i:44;i:27;i:45;i:28;i:46;i:29;i:47;i:30;i:48;i:31;i:49;i:32;i:50;i:33;i:51;i:34;i:52;i:35;i:53;i:36;i:54;i:37;i:56;i:38;i:57;i:39;i:59;i:40;i:61;i:41;i:63;i:42;i:64;i:43;i:65;i:44;i:66;i:45;i:70;i:46;i:71;i:47;i:72;i:48;i:73;i:49;i:76;i:50;i:78;i:51;i:82;i:52;i:84;i:53;i:86;i:54;i:87;i:55;i:94;i:56;i:95;i:57;i:96;i:58;i:99;i:59;i:101;i:60;i:102;i:61;i:103;i:62;i:104;i:63;i:106;i:64;i:107;i:65;i:108;i:66;i:109;i:67;i:110;i:68;i:113;i:69;i:114;i:70;i:115;i:71;i:117;i:72;i:118;i:73;i:119;i:74;i:121;i:75;i:123;i:76;i:124;i:77;i:125;i:78;i:126;i:79;i:128;i:80;i:129;i:81;i:131;i:82;i:132;i:83;i:134;i:84;i:136;i:85;i:138;i:86;i:139;i:87;i:140;i:88;i:141;i:89;i:142;i:90;i:143;i:91;i:144;i:92;i:145;i:93;i:146;i:94;i:148;i:95;i:149;i:96;i:150;i:97;i:151;i:98;i:152;i:99;i:158;i:100;i:160;i:101;i:165;i:102;i:166;i:103;i:168;i:104;i:174;i:105;i:177;i:106;i:179;i:107;i:180;i:108;i:181;i:109;i:182;i:110;i:183;i:111;i:189;i:112;i:193;i:113;i:196;i:114;i:202;i:115;i:203;i:116;i:208;i:117;i:209;i:118;i:211;i:119;i:214;i:120;i:216;i:121;i:218;i:122;i:219;i:123;i:221;i:124;i:222;i:125;i:224;i:126;i:225;i:127;i:231;i:128;i:233;i:129;i:238;i:130;i:239;i:131;i:240;i:132;i:241;i:133;i:242;i:134;i:243;i:135;i:245;i:136;i:250;i:137;i:252;i:138;i:254;i:139;i:255;i:140;i:256;i:141;i:259;i:142;i:262;i:143;i:263;i:144;i:267;i:145;i:268;i:146;i:269;i:147;i:270;i:148;i:273;i:149;i:280;i:150;i:284;i:151;i:285;i:152;i:289;i:153;i:293;i:154;i:297;i:155;i:300;i:156;i:301;i:157;i:302;i:158;i:303;i:159;i:305;i:160;i:308;i:161;i:309;i:162;i:311;i:163;i:312;i:164;i:316;i:165;i:317;i:166;i:342;i:167;i:346;i:168;i:352;i:169;i:354;i:170;i:360;i:171;i:361;i:172;i:363;i:173;i:372;i:174;i:385;i:175;i:388;i:176;i:390;i:177;i:392;i:178;i:394;i:179;i:396;i:180;i:397;i:181;i:398;i:182;i:401;i:183;i:403;i:184;i:404;i:185;i:406;i:186;i:407;i:187;i:408;i:188;i:409;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000message\\\";s:26:\\\"تم نشر  بوست 1 ث\\\";}\"}}', 0, NULL, 1719685589, 1719685589),
(73, 'default', '{\"uuid\":\"435f0c5d-34c3-44b0-92d2-a2ce79a3ed62\",\"displayName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationPostJob\\\":2:{s:8:\\\"\\u0000*\\u0000users\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:189:{i:0;i:1;i:1;i:3;i:2;i:4;i:3;i:6;i:4;i:8;i:5;i:16;i:6;i:19;i:7;i:20;i:8;i:21;i:9;i:22;i:10;i:23;i:11;i:24;i:12;i:26;i:13;i:28;i:14;i:29;i:15;i:30;i:16;i:31;i:17;i:32;i:18;i:35;i:19;i:37;i:20;i:38;i:21;i:39;i:22;i:40;i:23;i:41;i:24;i:42;i:25;i:43;i:26;i:44;i:27;i:45;i:28;i:46;i:29;i:47;i:30;i:48;i:31;i:49;i:32;i:50;i:33;i:51;i:34;i:52;i:35;i:53;i:36;i:54;i:37;i:56;i:38;i:57;i:39;i:59;i:40;i:61;i:41;i:63;i:42;i:64;i:43;i:65;i:44;i:66;i:45;i:70;i:46;i:71;i:47;i:72;i:48;i:73;i:49;i:76;i:50;i:78;i:51;i:82;i:52;i:84;i:53;i:86;i:54;i:87;i:55;i:94;i:56;i:95;i:57;i:96;i:58;i:99;i:59;i:101;i:60;i:102;i:61;i:103;i:62;i:104;i:63;i:106;i:64;i:107;i:65;i:108;i:66;i:109;i:67;i:110;i:68;i:113;i:69;i:114;i:70;i:115;i:71;i:117;i:72;i:118;i:73;i:119;i:74;i:121;i:75;i:123;i:76;i:124;i:77;i:125;i:78;i:126;i:79;i:128;i:80;i:129;i:81;i:131;i:82;i:132;i:83;i:134;i:84;i:136;i:85;i:138;i:86;i:139;i:87;i:140;i:88;i:141;i:89;i:142;i:90;i:143;i:91;i:144;i:92;i:145;i:93;i:146;i:94;i:148;i:95;i:149;i:96;i:150;i:97;i:151;i:98;i:152;i:99;i:158;i:100;i:160;i:101;i:165;i:102;i:166;i:103;i:168;i:104;i:174;i:105;i:177;i:106;i:179;i:107;i:180;i:108;i:181;i:109;i:182;i:110;i:183;i:111;i:189;i:112;i:193;i:113;i:196;i:114;i:202;i:115;i:203;i:116;i:208;i:117;i:209;i:118;i:211;i:119;i:214;i:120;i:216;i:121;i:218;i:122;i:219;i:123;i:221;i:124;i:222;i:125;i:224;i:126;i:225;i:127;i:231;i:128;i:233;i:129;i:238;i:130;i:239;i:131;i:240;i:132;i:241;i:133;i:242;i:134;i:243;i:135;i:245;i:136;i:250;i:137;i:252;i:138;i:254;i:139;i:255;i:140;i:256;i:141;i:259;i:142;i:262;i:143;i:263;i:144;i:267;i:145;i:268;i:146;i:269;i:147;i:270;i:148;i:273;i:149;i:280;i:150;i:284;i:151;i:285;i:152;i:289;i:153;i:293;i:154;i:297;i:155;i:300;i:156;i:301;i:157;i:302;i:158;i:303;i:159;i:305;i:160;i:308;i:161;i:309;i:162;i:311;i:163;i:312;i:164;i:316;i:165;i:317;i:166;i:342;i:167;i:346;i:168;i:352;i:169;i:354;i:170;i:360;i:171;i:361;i:172;i:363;i:173;i:372;i:174;i:385;i:175;i:388;i:176;i:390;i:177;i:392;i:178;i:394;i:179;i:396;i:180;i:397;i:181;i:398;i:182;i:401;i:183;i:403;i:184;i:404;i:185;i:406;i:186;i:407;i:187;i:408;i:188;i:409;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000message\\\";s:52:\\\"تم نشر  وصف بوست جديد تانى  1 ث\\\";}\"}}', 0, NULL, 1719685637, 1719685637),
(74, 'default', '{\"uuid\":\"5ae98351-357d-4a6b-9a0b-1639a763af30\",\"displayName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationPostJob\\\":2:{s:8:\\\"\\u0000*\\u0000users\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:187:{i:0;i:9;i:1;i:12;i:2;i:14;i:3;i:15;i:4;i:17;i:5;i:18;i:6;i:27;i:7;i:33;i:8;i:34;i:9;i:36;i:10;i:55;i:11;i:58;i:12;i:60;i:13;i:62;i:14;i:67;i:15;i:68;i:16;i:69;i:17;i:74;i:18;i:75;i:19;i:77;i:20;i:79;i:21;i:80;i:22;i:81;i:23;i:83;i:24;i:85;i:25;i:88;i:26;i:89;i:27;i:90;i:28;i:91;i:29;i:92;i:30;i:93;i:31;i:97;i:32;i:98;i:33;i:100;i:34;i:105;i:35;i:111;i:36;i:112;i:37;i:116;i:38;i:120;i:39;i:122;i:40;i:127;i:41;i:130;i:42;i:133;i:43;i:135;i:44;i:137;i:45;i:147;i:46;i:153;i:47;i:154;i:48;i:155;i:49;i:156;i:50;i:157;i:51;i:159;i:52;i:161;i:53;i:162;i:54;i:163;i:55;i:164;i:56;i:167;i:57;i:169;i:58;i:170;i:59;i:171;i:60;i:172;i:61;i:173;i:62;i:175;i:63;i:176;i:64;i:178;i:65;i:184;i:66;i:185;i:67;i:186;i:68;i:187;i:69;i:188;i:70;i:190;i:71;i:191;i:72;i:192;i:73;i:194;i:74;i:195;i:75;i:197;i:76;i:198;i:77;i:199;i:78;i:200;i:79;i:201;i:80;i:204;i:81;i:205;i:82;i:206;i:83;i:207;i:84;i:210;i:85;i:212;i:86;i:213;i:87;i:215;i:88;i:217;i:89;i:220;i:90;i:223;i:91;i:226;i:92;i:227;i:93;i:228;i:94;i:229;i:95;i:230;i:96;i:232;i:97;i:234;i:98;i:235;i:99;i:236;i:100;i:237;i:101;i:244;i:102;i:246;i:103;i:247;i:104;i:248;i:105;i:249;i:106;i:251;i:107;i:253;i:108;i:257;i:109;i:258;i:110;i:260;i:111;i:261;i:112;i:264;i:113;i:265;i:114;i:266;i:115;i:271;i:116;i:272;i:117;i:274;i:118;i:275;i:119;i:276;i:120;i:277;i:121;i:278;i:122;i:279;i:123;i:281;i:124;i:282;i:125;i:283;i:126;i:286;i:127;i:287;i:128;i:290;i:129;i:291;i:130;i:292;i:131;i:294;i:132;i:295;i:133;i:296;i:134;i:298;i:135;i:299;i:136;i:304;i:137;i:307;i:138;i:310;i:139;i:313;i:140;i:314;i:141;i:315;i:142;i:318;i:143;i:323;i:144;i:325;i:145;i:327;i:146;i:328;i:147;i:331;i:148;i:333;i:149;i:335;i:150;i:337;i:151;i:338;i:152;i:339;i:153;i:340;i:154;i:341;i:155;i:343;i:156;i:344;i:157;i:345;i:158;i:347;i:159;i:349;i:160;i:350;i:161;i:353;i:162;i:355;i:163;i:356;i:164;i:357;i:165;i:359;i:166;i:362;i:167;i:364;i:168;i:369;i:169;i:370;i:170;i:373;i:171;i:374;i:172;i:375;i:173;i:379;i:174;i:380;i:175;i:381;i:176;i:382;i:177;i:386;i:178;i:387;i:179;i:391;i:180;i:395;i:181;i:399;i:182;i:402;i:183;i:405;i:184;i:429;i:185;i:435;i:186;i:439;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000message\\\";s:42:\\\"تم نشر  وصف بوست 2  ثانوى\\\";}\"}}', 0, NULL, 1719685663, 1719685663),
(75, 'default', '{\"uuid\":\"05c6d292-49c0-4760-a35e-0ca95a65d797\",\"displayName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationPostJob\\\":2:{s:8:\\\"\\u0000*\\u0000users\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:187:{i:0;i:9;i:1;i:12;i:2;i:14;i:3;i:15;i:4;i:17;i:5;i:18;i:6;i:27;i:7;i:33;i:8;i:34;i:9;i:36;i:10;i:55;i:11;i:58;i:12;i:60;i:13;i:62;i:14;i:67;i:15;i:68;i:16;i:69;i:17;i:74;i:18;i:75;i:19;i:77;i:20;i:79;i:21;i:80;i:22;i:81;i:23;i:83;i:24;i:85;i:25;i:88;i:26;i:89;i:27;i:90;i:28;i:91;i:29;i:92;i:30;i:93;i:31;i:97;i:32;i:98;i:33;i:100;i:34;i:105;i:35;i:111;i:36;i:112;i:37;i:116;i:38;i:120;i:39;i:122;i:40;i:127;i:41;i:130;i:42;i:133;i:43;i:135;i:44;i:137;i:45;i:147;i:46;i:153;i:47;i:154;i:48;i:155;i:49;i:156;i:50;i:157;i:51;i:159;i:52;i:161;i:53;i:162;i:54;i:163;i:55;i:164;i:56;i:167;i:57;i:169;i:58;i:170;i:59;i:171;i:60;i:172;i:61;i:173;i:62;i:175;i:63;i:176;i:64;i:178;i:65;i:184;i:66;i:185;i:67;i:186;i:68;i:187;i:69;i:188;i:70;i:190;i:71;i:191;i:72;i:192;i:73;i:194;i:74;i:195;i:75;i:197;i:76;i:198;i:77;i:199;i:78;i:200;i:79;i:201;i:80;i:204;i:81;i:205;i:82;i:206;i:83;i:207;i:84;i:210;i:85;i:212;i:86;i:213;i:87;i:215;i:88;i:217;i:89;i:220;i:90;i:223;i:91;i:226;i:92;i:227;i:93;i:228;i:94;i:229;i:95;i:230;i:96;i:232;i:97;i:234;i:98;i:235;i:99;i:236;i:100;i:237;i:101;i:244;i:102;i:246;i:103;i:247;i:104;i:248;i:105;i:249;i:106;i:251;i:107;i:253;i:108;i:257;i:109;i:258;i:110;i:260;i:111;i:261;i:112;i:264;i:113;i:265;i:114;i:266;i:115;i:271;i:116;i:272;i:117;i:274;i:118;i:275;i:119;i:276;i:120;i:277;i:121;i:278;i:122;i:279;i:123;i:281;i:124;i:282;i:125;i:283;i:126;i:286;i:127;i:287;i:128;i:290;i:129;i:291;i:130;i:292;i:131;i:294;i:132;i:295;i:133;i:296;i:134;i:298;i:135;i:299;i:136;i:304;i:137;i:307;i:138;i:310;i:139;i:313;i:140;i:314;i:141;i:315;i:142;i:318;i:143;i:323;i:144;i:325;i:145;i:327;i:146;i:328;i:147;i:331;i:148;i:333;i:149;i:335;i:150;i:337;i:151;i:338;i:152;i:339;i:153;i:340;i:154;i:341;i:155;i:343;i:156;i:344;i:157;i:345;i:158;i:347;i:159;i:349;i:160;i:350;i:161;i:353;i:162;i:355;i:163;i:356;i:164;i:357;i:165;i:359;i:166;i:362;i:167;i:364;i:168;i:369;i:169;i:370;i:170;i:373;i:171;i:374;i:172;i:375;i:173;i:379;i:174;i:380;i:175;i:381;i:176;i:382;i:177;i:386;i:178;i:387;i:179;i:391;i:180;i:395;i:181;i:399;i:182;i:402;i:183;i:405;i:184;i:429;i:185;i:435;i:186;i:439;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000message\\\";s:51:\\\"تم نشر  وصف بوست تانى 2  ثانوى\\\";}\"}}', 0, NULL, 1719685688, 1719685688),
(76, 'default', '{\"uuid\":\"0e93e4a7-f704-4a86-b80c-14d3084611e7\",\"displayName\":\"App\\\\Jobs\\\\NotificationLessonJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationLessonJob\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\NotificationLessonJob\\\":2:{s:18:\\\"\\u0000*\\u0000school_grade_id\\\";s:1:\\\"3\\\";s:10:\\\"\\u0000*\\u0000message\\\";s:73:\\\"تم رفع درس درس شهر  يناير 1 ث 102 لشهر يناير\\\";}\"}}', 0, NULL, 1719686125, 1719686125),
(77, 'default', '{\"uuid\":\"e770c88b-ef29-45e2-95e9-7b77fc44eb5c\",\"displayName\":\"App\\\\Jobs\\\\NotificationBookJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationBookJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationBookJob\\\":2:{s:15:\\\"\\u0000*\\u0000school_grade\\\";s:1:\\\"3\\\";s:7:\\\"\\u0000*\\u0000book\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:34;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 0, NULL, 1719686218, 1719686218),
(78, 'default', '{\"uuid\":\"02b981ab-5a35-41ca-8515-62e99b6eb3e8\",\"displayName\":\"App\\\\Jobs\\\\NotificationExamJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationExamJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationExamJob\\\":2:{s:18:\\\"\\u0000*\\u0000school_grade_id\\\";s:1:\\\"3\\\";s:7:\\\"\\u0000*\\u0000exam\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Exam\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 0, NULL, 1719686390, 1719686390),
(79, 'default', '{\"uuid\":\"ed660b6e-c99b-4a28-8348-ed11a693cb1a\",\"displayName\":\"App\\\\Jobs\\\\NotificationExamJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationExamJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationExamJob\\\":2:{s:18:\\\"\\u0000*\\u0000school_grade_id\\\";s:1:\\\"1\\\";s:7:\\\"\\u0000*\\u0000exam\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Exam\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 0, NULL, 1719694190, 1719694190);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'main_server',
  `video_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `img_caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `date_show` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
  `duration` int DEFAULT '0',
  `free` tinyint NOT NULL DEFAULT '0' COMMENT '0==> not free,1==> free'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `title`, `description`, `source`, `video_url`, `img_caption`, `subject_id`, `school_grade_id`, `teacher_id`, `date_show`, `deleted_at`, `created_at`, `updated_at`, `unit_id`, `duration`, `free`) VALUES
(1, 'التيار الكهربي وقانون اوم وقوانين كيرشوف', 'في هذا الدرس، سوف نتعلَّم كيف نستخدم القانون: I = Q/t لحساب شدة التيار المار عبر نقطة في دائرة بسيطة بمعلومية الشحنة التي تمر عبر هذه النقطة في زمن معطًى.', 'main_server', 'http://localhost/Teacher-System/public/app/videos/66728b686db6e_977245085.mp4', 'captions/ERLING-HAALAND-MANCHESTER-CITY-scaled-e1662531544452-1024x683.jpg', 1, 1, 1, '2024-08-01', NULL, '2024-06-11 22:12:38', '2024-06-29 17:47:56', 10, 120, 0),
(2, 'المقاومة والمقاومة النوعية للموصِّلات', 'في هذا الشارح، سوف نتعلَّم كيف نربط أبعاد جسم وحركة الإلكترونات الحرَّة خلاله بمقاومته.\r\n\r\nيُمكن الحصول على المقاومة الكهربية لجسم باستخدام الصيغة الآتية.\r\n\r\nصيغة: المقاومة الكهربية\r\nإذا طُبِّق فرق الجهد \r\n𝑉\r\n،على جسم، ومرَّ به تيار شدَّته \r\n𝐼\r\n،فإن المقاومة \r\n𝑅\r\n تُعطَى بالصيغة: \r\n𝑅\r\n=\r\n𝑉\r\n𝐼\r\n.\r\n\r\nتُعَدُّ المقاومة إحدى خواصِّ الجسم. وتعتمد مقاومة الجسم على عاملين:\r\n\r\nأبعاد الجسم.\r\nالمقاومة النوعية، وهي إحدى خواصِّ المادة التي يتكوَّن منها الجسم.\r\nهيَّا نرَ أولًا كيف تؤثِّر أبعاد الجسم على مقاومته.\r\n\r\nيوضِّح الشكل الآتي ثلاث مقاومات. تمثِّل مساحة وجه المقاومات في المستوى \r\n𝑥\r\n𝑦\r\n مساحة المقطع لكلِّ مقاومة.', 'main_server', 'http://localhost/Teacher-System/public/app/videos/66728b686db6e_977245085.mp4', 'captions/download (3).jpg', 1, 1, 1, '2024-08-01', NULL, '2024-06-11 22:14:55', '2024-06-15 20:17:16', 10, 45, 0),
(3, 'درس الحث الكهرومعناطيسى', 'شرح الحث الكهرومغناطيسي تحدث عملية الحث الكهرومغناطيسي عند استخدام موصل ومغناطيس، ثم تحريك المغناطيس وتثبيت الموصل، أو تثبيت المغناطيس وتحريك الموصل، إذ ينتج عن ذلك التحريك تغيّر في التدفق المغناطيسي؛ وبالتالي توليد قوة دافعة حثية (Electromotive Force) عبر الملف، ويتم توليد القوة الدافعة الحثية؛ بسبب حركة الموصل أو الملف عبر المجال المغناطيسي أو بسبب التغير في التدفق المغناطيسي، ويحدث هذا التغير إما عندما يتم وضع الموصل في مجال مغناطيسي متحرك، أي عند استخدام مصدر تيار متردد (AC)، أو عندما يتحرك الموصل دائمًا في مجال مغناطيسي ثابت، وتعمل ظاهرة الحث الكهرومغناطيسي على توليد التيار الكهربائي باستخدام المجال المغناطيسي، كما أن اكتشاف ظاهرة الحث الكهرومغناطيسي أثبت أنّه يمكن توليد تيار كهربائي باستخدام المجال المغناطيسي.', 'main_server', 'http://localhost/Teacher-System/public/app/videos/66728b686db6e_977245085.mp4', 'captions/image-04.png', 1, 1, 1, '2024-08-01', NULL, '2024-06-15 20:10:56', '2024-06-15 20:11:17', 11, 60, 0),
(4, 'التيار المتردد', 'التيار المتناوب أو التيار المتردد (بالإنجليزية: Alternating current)‏ هو تيار كهربائي يعكس اتجاهه بشكل دوري ويتذبذب في مكانه ذهابا وإيابا 50 أو 60 مرة في الثانية حسب النظام الكهربائي المستخدم. يمكن توليده فقط حسب قانون فرداي عن طريق مولد كهربائي متردد.\r\n\r\nويستخدم التيار المتردد حاليًّا لنقل الطاقة الكهربائية في كل دول العالم رغم أسبقية التيار المستمر التاريخية، ورغم أن أول محطة تجارية لتوليد الكهرباء في العالم وهي التي أنشأها أديسون في نيويورك سنة 1882 م كانت كذلك محطة لتوليد التيار المستمر حتى أن أولى الأجهزة الكهربية كانت تعمل على التيار المستمر مثل مصباح أديسون إلا أن الوضع انقلب رأسا على عقب بعيد حرب التيارات فأصبح التيار المتذبذب مفضلا في إيصال الطاقة لأسباب لها علاقة بتقنيتي نقل الطاقة من جهة ومعالجة الإشارات من جهة أخرى.\r\n\r\nشكل موجة التيار المتردد هي الموجودة في المنازل والشركات. والشكل الموجي المعتاد هي موجة جيبية (Sin wave)، ولكن في بعض التطبيقات من الممكن استخدام موجة مثلثية أو مربعة. وغالبًا ما تستخدم الاختصارات (AC) للتيار المتردد، و(DC) للتيار المستمر، كما يمكن التعبير عنها مع الجهد الكهربائي.\r\n\r\nالتيار المتردد (AC) هو تيار كهربائي يعكس الاتجاه بشكل دوري ويغير حجمه باستمرار مع الوقت على عكس التيار المستمر (DC) الذي يتدفق في اتجاه واحد فقط. التيار المتردد هو الشكل الذي يتم فيه توصيل القدرة الكهربائية للشركات والمساكن، وهو شكل الطاقة الكهربائية التي يستخدمها المستهلكون عادةً عند توصيل أجهزة المطبخ وأجهزة التلفزيون والمراوح والمصابيح الكهربائية في مقبس الحائط. المصدر الشائع لطاقة التيار المستمر هو خلية بطارية في مصباح يدوي. غالبًا ما يتم استخدام الاختصارات AC و DC للدلالة على التناوب والتناوب المباشر، كما هو الحال عند تعديل التيار أو الجهد.\r\n\r\nالشكل الموجي المعتاد للتيار المتردد في معظم دوائر الطاقة الكهربائية هو موجة جيبية، تتوافق نصفها الموجب مع الاتجاه الإيجابي للتيار والعكس صحيح. في تطبيقات معينة، مثل مضخم الغيتار، يتم استخدام أشكال موجية مختلفة، مثل الموجات المثلثية أو الموجات المربعة. إشارات الصوت والراديو المحمولة على الأسلاك الكهربائية هي أيضًا أمثلة على التيار المتردد. تحمل هذه الأنواع من التيار المتردد معلومات مثل الصوت (الصوت) أو الصور (الفيديو) أحيانًا عن طريق تعديل إشارة ناقل التيار المتردد. عادة ما تتبدل هذه التيارات عند ترددات أعلى من تلك المستخدمة في نقل الطاقة.', 'main_server', 'http://localhost/Teacher-System/public/app/videos/66728b686db6e_977245085.mp4', 'captions/Types_of_current-ar.svg.png', 1, 3, 1, '2024-10-01', NULL, '2024-06-17 20:24:33', '2024-06-18 19:08:53', 5, 60, 0),
(5, 'الحركة بعجلة خلال الزمن', 'تشمل خطة الدرس هذه الأهداف والمتطلَّبات والنقاط غير المتضمَّنة في الدرس الذي يتعلَّم فيه الطالب كيف يحلِّل حركة الأجسام التي تغيِّر سرعتها خلال فترة من الزمن، وذلك باستخدام معادلة العجلة 𝑎 = Δ𝑣/Δ𝑡.\r\n\r\nالأهداف\r\nسيدرس الطلاب كيف\r\n\r\nاستخدام المعادلة \r\n𝑎=Δ𝑣/Δ𝑡\r\n بجميع صورها\r\nالتمييز بين التسارع في اتجاه السرعة الابتدائية والتسارع في عكس اتجاهها\r\nتحديد الحركة منتظمة التسارع على منحنيات السرعة-الزمن والإزاحة-الزمن\r\nالمتطلبات الأساسية\r\nيجب أن يكون الطلاب على دراية مسبقة بـ\r\n\r\nالسرعة\r\nالإزاحة\r\nالاستثناءات', 'main_server', 'http://localhost/Teacher-System/public/app/videos/66728b686db6e_977245085.mp4', 'captions/1948100_0.jpeg', 1, 3, 1, '2025-01-01', NULL, '2024-06-18 13:59:52', '2024-06-18 14:00:33', 6, 30, 0),
(6, 'درس: الحركة بعجلة خلال المسافة والزمن', '***  المعادلة الأولي :-  معادلة ( السرعة  - الزمن ) :-\r\nالاستنتاج\r\nعندما تتغير سرعة جسم بمعدل ثابت من سرعة ابتدائية(Vi) إلى سرعة نهائية Vf) ) خلال فترة زمنية قدرها(t) فان العجلة المنتظمة التي يتحرك بها تتعين من العلاقة أن العجلة = التغير في السرعة علي التغير في الزمن\r\n***  المعادلة الثانية :- معادلة ( الإزاحة – الزمن ) :-\r\nالاستنتاج\r\nالسرعة المتوسطة تتعين من العلاقة :\r\nوتتعين من العلاقة :\r\nو بالتعويض عن Vf من المعادلة الأولي:\r\nاستنتاج المعادلة الثانية للحركة بيانيا  :- \r\nإذا كانت الإزاحة تساوي السرعة  xالزمن فإنه في الرسم البياني\r\n بين السرعة والزمن ستساوي عدديا الطول x العرض\r\nأي أنها تساوي عدديا المساحة تحت منحني السرعة والزمن \r\nبناء علي ذلك فانه في الشكل المقابل \r\nالإزاحة = مساحة المستطيل + مساحة المثلث\r\n                    مساحة المستطيل = vi t\r\n               مساحة المثلث = ( vf- vi) t \r\n                  ولكن  a t = vf- vi         \r\n                مساحة المثلث = a t2 \r\nوبجمع مساحة المستطيل ومساحة المثلث نحصل علي الإزاحة \r\n***  المعادلة الثالثة :- معادلة  ( الإزاحة – السرعة ) :-\r\nالاستنتاج\r\nطريقة أخري :-\r\nأو    \r\nملاحظات :-\r\n1- يستخدم الشكل المقابل لحل مسائل معادلات الحركة ،\r\nحيث يدل الرقم المكتوب بين الكميتين (المعلومة والمجهولة )\r\n علي رقم معادلة الحركة المستخدمة في الحل \r\n2- في المسائل من النوع : جسم يتحرك طبقا للعلاقة (لمعادلة ما) يجب أن تصل بالمعادلة المعطاة إلي أقرب صورة لأحد المعادلات الثلاث للحركة ثم قارن بينهما لإيجاد المطلوب\r\n(1) بعض ألغاز المسائل :-\r\n1- لو وجدت الكلمات الآتية في المسألة تكون العجلة بالسالب ويعوض بها بالسالب في القانون ( فرامل – قزف لأعلي – تم تبطيئه – احتكاك)\r\n2- لو وجدت الكلمات الآتية في المسألة تكون السرعة النهائية تساوي صفر ( أقصي ارتفاع – حتي توقف )\r\n3- لو وجدت الكلمات الآتية في المسألة تكون السرعة الابتدائية تساوي صفر ( تحرك من سكون – سقط سقوط حر )\r\n4- لو كانت نقطة البداية هي النهاية لجسم فان الإزاحة تساوي صفر \r\n5- لو كانت الإزاحتين في نفس الاتجاه تجمع ولو عكس الاتجاه تطرح ولو تحرك الجسم للأمام ثم عاد للخلف الإزاحة تساوي الفرق بين المسافتين والمسافة هي مجموع المسافتين للأمام والخلف \r\nمسائل علي الحركة بعجلة منتظمة في خط مستقيم\r\n(1) جسم يتحرك بعجلة منتظمة (6m/s2)  من السكون فما هي قيمة كلا من:-\r\n        أ – سرعة الجسم بعد 8 ثواني.\r\n       ب – المسافة المقطوعة بعد 10 ثواني .\r\n      جـ - المسافة المقطوعة عندما  تصبح  سرعة الجسم (12 m/s) .\r\n(2)  سيارة تتحرك بسرعة (20m/s) شاهد قائدها طفل يقف في منتصف الطريق وعلي بعد (30 m) أمامه فضغط علي الفرامل وكانت العجلة التناقصية للسيارة (-6 m/s2) هل يصاب الطفل بأذى أم لا معللا ما تقوله.\r\n(3) جسم يتحرك بسرعة (18m/s) وبعجلة منتظمة (5 m/s2) فما هي قيمة :-\r\n         أ- المسافة المقطوعة بعد أن تصبح سرعته (40m/s) \r\n       ب – سرعة الجسم بعد(12 s) .\r\n(4) يتحرك جسم من السكون بعجلة منتظمة قدرها (4 m/s2) ليقطع مسافة قدرها (200m) احسب\r\n       أ- الزمن اللازم ليقطع الجسم تلك المسافة.\r\n      ب- السرعة التي وصل إليها الجسم عند نهاية المسافة .\r\n(5) تتحرك سيارة من السكون بعجلة منتظمة قدرها (2m/s2)  وعندما قطعت مسافة (100m) استخدم قائدها الفرامل فتوقفت السيارة بعد (5 s) بفعل عجلة تقصيرية اوجد :-\r\n      أ- سرعة السيارة قبل أن يستخدم السائق الفرامل .\r\n     ب – العجلة التقصيرية التي تحركت بها السيارة حتى توقفت .\r\n     جـ - المسافة الكلية التي قطعتها السيارة .\r\n(6) يتحرك مترو الأنفاق بين محطتين A&B المسافة بينهما (1.2 km) ويبدأ بعجلة منتظمة لمدة الخمس ثواني الأولي حيث يقطع مسافة(50m) ثم يتحرك بسرعة منتظمة حتى يصل لنقطة ما ثم بعدها يتحرك بعجلة تناقصية مسافة (80 m)  الأخيرة أوجد \r\n     أ- السرعة المنتظمة التي تحرك بها مترو الأنفاق في المرحلة المتوسطة .\r\n    ب – الزمن الذي استغرقه في قطع المسافة بين المحطتين .\r\n(7) ما الزمن اللازم لجسم بدأ حركته من السكون بعجلة منتظمة قدرها (8m/s2)   ليلحق بجسم آخر يبعد عنه مسافة (120 m)  ويتحرك بسرعة منتظمة قدرها (28 m/s)  في نفس الاتجاه .\r\n(😎 في إحدى المسابقات للمعاقين  يتحرك متسابق علي كرسي بعجلة قدرها (5m/s2)  احسب سرعته بعد (6 s)  من بدأ الحركة من السكون وإذا تحرك بعد ذلك بعجلة قدرها (-0.9 m/s2)  فاحسب الزمن اللازم لكي تصبح سرعته صفرا واحسب المسافة التي يقطعها في الحالة الثانية .\r\n(9) يتحرك جسم طبقا للعلاقة التالية :-                                   Vf -2  t=     \r\n     حيث t الزمن بالثواني ، Vt السرعة بـ (m/s) اوجد\r\n                                                               أ – السرعة الابتدائية         ب – العجلة .\r\n                                                            جـ - المسافة التي يقطعها والسرعة بعد (10 s )  من بداية الحركة .\r\n (10) الشكل البياني المرسوم يوضح حركة سيارة علي طريق مستقيم :- \r\n          أ- أي أجزاء الخط تكون السيارة في ساكنة وكم الفترة الزمنية\r\n             التي تستمر فيها السيارة ساكنة .\r\n         ب- أي أجزاء الخط تكون السيارة فسه متحركة بسرعة منتظمة \r\n             مبتعدة عن نقطة البدء واحسب قيمة السرعة .\r\n        جـ - المسافة التي قطعتها السيارة خلال العشر ثواني الأولي\r\n(11)مدرسة الأقصر الثانوية بنين :-  سقط صندوق من شاحنة( سيارة نقل ) متحركة بسرعة 30 m/s وبعد ملامسته للأرض انزلق مسافة 45 m  حتى توقف تماما احسب الزمن الذي استغرقه الصندوق من لحظة ملامسته الأرض حتى توقف تماما .\r\n(12) مدرسة النيل الثانوية بني سويف :- في الرسم الذي أمامك يمثل مسار حركة جسم\r\n        ١- أوصف نوع حركة الجسم عند انتقاله \r\n       (أ)من A  إلي B                (ب)عند انتقاله من B إلي C \r\n       ٢- اوجد المسافة التي يقطعها عند انتقاله من B إلي C\r\n(13) مدرسة أطلسا الثانوية الفيوم :- جسم يتحرك بسرعة 20 m/s  بعجلة منتظمة 5 m/s2   احسب :\r\n١- سرعة الجسم بعد 4 s      ٢-المسافة المقطوعة خلال هذه الفترة .\r\n(14) مدرسة الرمل الثانوية بنات الإسكندرية :-  جسم يتحرك طبقا للعلاقة : Vf= 0 + 4t      وعندما يقطع \r\n  الجسم مسافة قدرها 18 m  أوجد سرعته النهائية .\r\n(15) مدرسة العاشر الثانوية الشرقية :- أثبت أن  :  d = Vit +  at2        \r\n(16)مدرسة قاسم آمين الثانوية بنات الغربية:- يتحرك جسم طبقا للعلاقة الآتية    \r\nحيث V سرعة الجسم بالمتر /ثانية ، X المسافة بالمتر احسب : \r\n    سرعة الجسم الابتدائية   ،   العجلة التي يتحرك بها الجسم   ، سرعته بعد ثانيتين .\r\n(17) مدرسة الخانكة الثانوية القليوبية :- تتحرك سيارة بسرعة ابتدائية  15 m/sلتصل سرعته خلال\r\n    2.5 s  إلي سرعة نهائية قدرها 20 m/s   احسب المسافة التي تحركنها السيارة خلال تلك الفترة \r\n(18) مدرسة المعادي الثانوية القاهرة :- سيارة بدأت حركتها من السكون بعجلة منتظمة قدرها (2m/s2 )\r\n   احسب المسافة التي تقطعها السيارة خلال (3sec  ) من بدأ الحركة وكذلك سرعته النهائية عندئذ .\r\n(19)مدرسة الأورمان بنين الجيزة:-                                                                \r\n تحرك جسم في خط مستقيم من الموضع (A )\r\nإلي الموضع (B)ثم غير اتجاهه عموديا إلي                                                            \r\n الموضع (C) كما بالرسم احسب                                                              \r\n        (1) المسافة المقطوعة .    (2)الإزاحة الحادثة.                                                    \r\n(20) مدرسة طما بنين سوهاج :- قطار يتحرك بسرعة (20 m/ s) وعند استخدام الفرامل تحرك بعجلة تناقصية\r\nمنتظمة (2 m / s2) احسب الزمن اللازم لتوقف القطار والمسافة التي يقطعها منذ استخدام الفرامل حتي يتوقف .\r\n (21) أزهر 2007 :-  الشكل المقابل يمثل العلاقة بين السرعة والزمن لجسم كتلته 20 kg\r\n(1) صف الحركة التي يتحرك بها الجسم خلال كلا من المرحلة أب ، المرحلة ب جـ\r\n(2) احسب العجلة التي يتحرك بها الجسم خلال كل مرحلة .\r\n(3) احسب القوة المؤثرة علي الجسم خلال كلا من المرحلة أب ، المرحلة ب جـ\r\n(22) أزهر 2006:- يتحرك جسم طبقا للعلاقة التالية  vf =  5d+36           حيث vt السرعة بالمتر / ث ، X المسافة بالمتر أوجد      \r\n (1) السرعة الابتدائية     (2) عجلة الحركة     (3) المسافة التي يقطعها الجسم بعد (10) ثواني من بدأ الحركة.   \r\n(23)  راكب دراجة بدأ حركته من السكون بعجلة منتظمة( 1.5m\\s ) تصل سرعته إلى7.5m\\s)) احسب المسافة التي تقطعها الدراجة\r\n(24)  اكتسبت سيارة سرعة مقدارها(15m\\s ) بعد أن قطعت مسافة( 225m ) من بدء حركتها احسب العجلة التي تحركت بها السيارة\r\n(25)  قطار يتحرك بسرعة (20m\\s ) بعجلة تناقصية مقدرها( 2m\\s² )عند استخدام الفرامل اوجد الزمن اللازم ليتوقف القطار والمسافة التي يقطعها  منذ استخدام الفرامل حتى يتوقف\r\n(26) تزايدت سرعة سيارة بانتظام من (18km/h) إلى (54km/h) خلال زمن (30 s) فاحسب العجلة المنتظمة التى تحركت بها السيارة خلال هذه الفترة واحسب المسافة المقطوعة منذ استخدام الفرامل حتى توقف\r\n(27) يتحرك جسم طبقا للعلاقة التالي   36+5d Vf=     حيث d المسافة بالمتر احسب العجلة التي يتحرك بها الجسم وكذلك السرعة الابتدائية   ثم احسب السرعة بعد أن يقطع الجسم مسافة (9 m ) \r\n(28)  جسم يتحرك طبقا للعلاقة الآتية- 2   t=  Vt احسب السرعة الابتدائية والعجلة التى يتحرك بها الجسم \r\n(29)  سائق سيارة يتحرك بسرعة (54 km/h ) وأثناء السير وجد أمامه شخص على مسافة (35m ) فضغط على الفرامل بانتظام حتى توقفت السيارة بعد (5 sec ) فهل صدم السائق الشخص أم لا ؟\r\n(30)  أرادت نملة أن تتسلق جدار طوله 7 متر لتبحث عن غذائها ثم رجعت مكانها احسب المسافة التي قطعتها وكذلك الإزاحة\r\n(31) الشكل المقابل يمثل العلاقة بين السرعة والزمن لجسم كتلته 20 kg\r\n(1) صف الحركة التي يتحرك بها الجسم خلال كلا من المرحلة أب ، المرحلة ب جـ\r\n(2) احسب العجلة التي يتحرك بها الجسم خلال كل مرحلة .\r\n(32)  الجدول التالي يوضح العلاقة بين الزمن وسرعة جسم بدأ حركته من السكون\r\n8 7 6 4 2 1 t (sec)\r\n40 35 30 20 10 5 V (m/s)\r\nارسم علاقة بيانية بين الزمن على المحور الأفقي والسرعة على المحور الرأسي ومن الرسم أوجد\r\n 1- العجلة التي يتحرك بها الجسم      2- المسافة التي يتحركها الجسم بعد 5 ثواني      \r\n***السقوط الحر:  عندما يسقط جسم من مكان مرتفع عن سطح الأرض فإن هذا الجسم يبدأ حركته من سكون متجهاً إلى أسفل تحت تأثير قوة جذب الأرض له. \r\n***عجلة السقوط الحر :- هي العجلة المنتظمة التي تتحرك بها الأجسام عندما تسقط سقوطاً حراً نحو سطح الأرض \r\n - تتزايد سرعة الجسم الساقط تدريجياً حتى تصل إلى أقصى قيمة لها عند لحظة اصطدامه بالأرض. \r\n - في حالة عدم وجود مقاومة الهواء فإن هذا الجسم يتحرك بعجلة منتظمة تسمى عجلة الجاذبية الأرضية \r\nعجلة السقوط الحر =  \r\n***ملحوظة:\r\n - تختلف قيمة عجلة الجاذبية الأرضية من مكان لآخر على سطح الأرض وتكون قيمة عجلة الجاذبية الأرضية التقريبية =   9.8 m/s2\r\n - يمكن تطبيق معادلات الحركة الثلاثة للحركة الرأسية تحت تأثير عجلة الجاذبية مع استبدال (g) مكان العجلة(a).\r\n*** تتناقص سرعة الجسم إذا قذف راسيا لأعلى وتزيد سرعته إذا سقط راسيا لأسفل (علل)  \r\nجـ : تتناقص سرعته لأنة يتحرك ضد الجاذبية الأرضية وتزيد إذا سقط لأسفل لأنة يتحرك في اتجاه عجلة الجاذبية فتعمل على زيادة سرعة الجسم بمعدل ثابت\r\n*** تختلف قيمة عجلة السقوط الحر باختلاف المكان أو اختلاف بعد الجسم عن مركز الأرض (علل)\r\nجـ : لان الأرض ليست كروية تماما وان مركز الأرض قريب من القطبين عن خط الاستواء \r\nمسائل علي السقوط الحر\r\n(1)مدرسة صلاح سالم بنين القاهرة :- قذف جسم رأسيا لأعلي بسرعة ابتدائية (98 m/s )احسب أقصي ارتفاع يصل إليه الجسم وكذلك الزمنية اللازم لذلك علما بان عجلة الجاذبية (9.8 m/s2  ) .\r\n(2) إدارة الباجور التعليمية المنوفية :- ترك جسم ليسقط حر من اعلي مبنى فوصل إلي الأرض بعد زمن قدره ( 5 ثواني ) فإذا علمت أن عجلة الجاذبية الأرضية  (9.8 m/s2  )احسب :-      1- سرعة الجسم لحظة اصطدامه بالأرض \r\n                                                      2- ارتفاع المبنى عن سطح الأرض .\r\n(3) مدرسة الملك الكامل  الدقهلية :- قذف حجر رأسيا لأعلي فعاد للأرض مرة ثانية بعد (6  ) ثواني فإذا كانت عجلة الجاذبية الأرضية  (10 m/s2  ) احسب :  1- السرعة التي قذف بها الحجر.            2- أقصي ارتفاع يصل إليه الحجر.\r\n(4) مدرسة أجا بنات الدقهلية :- إذا علمت أن عجلة السقوط الحر (10 m/s2  ) احسب :-\r\n                                أقصي ارتفاع يصل إليه جسم قذف لأعلي بسرعة ابتدائية (100 m/s ) .\r\n(5) مدرسة الشهيد خيرت القاضي قنا :- قذف جسم  رأسيا إلي أعلي بسرعة ابتدائية (100 m/s)  وبفرض إهمال مقاومة الهواء واعتبار عجلة الجاذبية (10 m/s2)  اوجد أقصي ارتفاع يصل إليه الحسم .\r\n(6) مدرسة جمال عبد الناصر الفيوم :- سقط جسم رأسيا من قمة مبني فوصل إلي الأرض بعد ( 5 s ) فإذا كانت عجلة السقوط الحر 9.8 m/s2)   ) احسب :-          1- ارتفاع المبني            2- سرعة الجسم لحظة وصوله إلي الأرض .\r\n(6) مدرسة نبوية موسي للبنات الإسكندرية :- قذف جسم رأسيا إلي اعلي بسرعة (50 m/s)  فإذا كانت عجلة السقوط الحر10 m/s2)   ) اوجد          1- أقصى ارتفاع يصل إليه           2- الزمن اللازم لعودة الجسم  ثانية إلي الأرض.\r\n(7) مدرسة العاشر بنين الشرقية :- قذف جسم كتلته (25 Kg )لأعلي بسرعة (20m/s )احسب أقصي ارتفاع يصل إليه الجسم علما بان عجلة الجاذبية ( 10 m/s2  )\r\nالمقذوفات\r\n أولا المقذوفات الرأسية :-\r\nعند قذف جسم لأعلي فإنه يتحرك بعجلة تناقصية منتظمة تساوي عجلة الجاذبية الأرضية أي أن سرعة الجسم  تقل بانتظام تحت تأثير عجلة الجاذبية الأرضية ،وعلى هذا المحور فقط تنطبق معادلات الحركة الثلاث.\r\nملاحظات :-\r\n1- عندما يصل الجسم إلى أعلى نقطة \" أقصى ارتفاع \" تكون سرعتها  صفر بعدها يغير الجسم اتجاه سرعته ليعود الي سطح الأرض تحت تأثير عجلة الجاذبية الأرضية فتزداد سرعته مرة أخري ولكن في عكس الاتجاه  \r\n2- زمن صعود الجسم إلى أقصى ارتفاع = زمن هبوطه من أقصى ارتفاع\r\n3- سرعة الجسم عند أي نقطة أثناء الصعود = سالب سرعة الجسم عند نفس النقطة أثناء الهبوط\r\n                     (( تدل الإشارة سالب علي أن السرعتين في عكس الاتجاه ))\r\n4- الزمن الكلي لتحليق الجسم = ضعف زمن الصعود = ضعف زمن الهبوط\r\nمثال :- \r\nثانيا/ المقذوفات بزاوية (( الحركة في بعدين )):-\r\nعندما ينطلق مقذوف مثل كرة أو دانة مدفع بسرعة ابتدائية vi وبزاوية θ مع المستوى الأفقي  فإنها تأخذ خطا منحنيا \r\nويمكن تحليل السرعة في اتجاهين أفقي (X) ورأسي (y) كما بالشكل \r\n الاتجاه الأفقي (X) :-\r\nيتحرك فيه المقذوف بسرعة vix بفرض عدم \r\nوجود احتكاك ويمكن تعين السرعة الأفقية \r\nمن العلاقة :-\r\nويتم التعويض بقيمة vix التي تم تعيينها\r\nفي معادلات الحركة الثلاث مع ملاحظة ( ax = 0 )   سرعة ثابتة \r\nالاتجاه الرأسي ( y ) :- \r\nيتحرك فيه المقذوف تحت تأثير عجلة الجاذبية الأرضية ( عجلة السقوط الحر ) فتكون سرعة المقذوف متغيرة\r\nويمنك حساب سرعة المقذوف الابتدائية في الاتجاه الرأسي   viy من العلاقة \r\nويتم التعويض بقيمة  viy التي تم تعيينها في معادلات الحركة الثلاث مع ملاحظة ( ay =g=-10 m/s2  ) أثناء الصعود \r\nو ( ay =g=10 m/s2  ) أثناء الهبوط\r\nويمكن حساب سرعة المقذوف عند أي نقطة من نظرية فيثاغورس :\r\nحساب زمن الصعود  ( t ) :-\r\nنضع ( vfy= 0 ) في المعادلة الأولي للحركة فتكون                0 = viy + gt\r\n                                     ومنها  \r\nويكون زمن التحليق ضعف زمن الصعود\r\nحساب أقص ارتفاع رأسي (h ) :- \r\nنضع ( vfy= 0 ) في المعادلة الأولي للحركة فتكون       2 g h = - viy2     \r\n                                          ومنها  \r\nحساب أقصى مدي أفقي ( R ) :-\r\nزمن أقصي مدى أفقي = زمن التحليق \r\nبالتعويض في المعادلة الثانية للحركة عن (ax = 0 )   و ( R =d ) \r\n                        ومنها                     R = vix T = 2 vix t\r\nملحوظة :- 1- الجسم المقذوف يصل إلي أقصي مدي أفقي له عند قذفه بزاوية 45o \r\n             2- المدى الأفقي لجسم مقذوف يتساوى عند قذفه بزاويتين متتامتان (( مجموعهما 90o ))\r\nمثال / انطلقت دراجة نارية بسرعة 15 m/s وفي اتجاه يصنع زاوية 30o علي الأفقي احسب :-\r\n1- أقصي ارتفاع تصل إليه الدراجة      2- زمن تحليقها                    3- أقصي مدى أفقي تصل إليه الدراجة', 'main_server', 'http://localhost/Teacher-System/public/app/videos/66728b686db6e_977245085.mp4', 'captions/thumbnail_s.jpeg', 1, 3, 1, '2025-01-01', NULL, '2024-06-18 14:21:33', '2024-06-18 14:25:44', 6, 45, 0),
(7, 'المجال المغناطيسي الناتج عن تيار يمرُّ في سلك مستقيم', 'تشمل خطة الدرس هذه الأهداف والمتطلَّبات والنقاط غير المتضمَّنة في الدرس الذي يتعلَّم فيه الطالب كيف يحسب شدة المجال المغناطيسي الناتج عن تيار يمرُّ في سلك مستقيم.\r\n\r\nالأهداف\r\nسيدرس الطلاب كيف\r\n\r\nاستخدام المعادلة \r\n𝐵=𝜇𝐼/2𝜋𝑑\r\n لإيجاد شدة المجال المغناطيسي على بعد مسافة  𝑑  من سلك طويل مستقيم يمرُّ به تيار شدته 𝐼\r\nمعرفة أن شدة المجال المغناطيسي الناتج عن سلك يمرُّ به تيار تتناسب عكسيًّا مع المسافة من السلك: \r\n𝐵∝1𝑑\r\nاستخدام قاعدة اليد اليمنى لتحديد اتجاه المجال المغناطيسي عند نقطة والناتج عن سلك طويل مستقيم\r\nالمتطلبات الأساسية\r\nيجب أن يكون الطلاب على دراية مسبقة بـ\r\n\r\nفكرة أن الأسلاك التي يمرُّ بها تيار تولِّد مجالات مغناطيسية\r\nشكل المجال المغناطيسي الناتج عن سلك مستقيم يمرُّ به تيار\r\nالاستثناءات\r\nلن يدرس الطلاب\r\n\r\nالأشكال الهندسية الأخرى للأسلاك (على سبيل المثال: الشكل الدائري، والمربع، واللولبي، وما إلى ذلك)\r\nالصور المتجهة لهذه المعادلة', 'main_server', 'http://localhost/Teacher-System/public/app/videos/66728b686db6e_977245085.mp4', 'captions/66728a0b694fd', 1, 1, 1, '2024-11-01', NULL, '2024-06-19 08:34:36', '2024-06-27 14:25:43', 13, 60, 0),
(8, 'المجال المغناطيسي الناتج عن تيار يمرُّ في ملف دائري', 'أهداف الدرس والمتطلبات\r\nتشمل خطة الدرس هذه الأهداف والمتطلبات والنقاط غير المتضمّنة في الدرس الذي يتعلّم فيه الطالب كيف يحسب شدة المجال المغناطيسي الناتج عن تيار يمر في ملف دائري.\r\n\r\nالأهداف\r\nسيدرس الطلاب كيف:\r\n\r\nاستخدام الصيغة \r\n𝐵=𝜇𝑁𝐼 / 2𝑟\r\n​\r\n  لإيجاد مقدار شدة المجال المغناطيسي في مركز ملف دائري نصف قطره r يمر به تيار I.\r\nاستخدام الصيغة \r\n𝐵=𝜇𝑁𝐼 / 2𝑟\r\nB= μNI / 2r\r\n​\r\n  للعديد من اللفات.\r\nإدراك أنه كلما زاد نصف قطر الملف، تقل شدة المجال المغناطيسي عند مركزه.\r\nاستخدام قاعدة اليد اليمنى لتحديد اتجاه المجال المغناطيسي في الملف.\r\nالمتطلبات الأساسية\r\nيجب أن يكون الطلاب على دراية مسبقة بـ:\r\n\r\nفكرة أن الأسلاك التي يمر بها تيار تُنتج مجالاً مغناطيسياً.', 'main_server', 'http://localhost/Teacher-System/public/app/videos/66728b686db6e_977245085.mp4', 'captions/66728b3d1325a', 1, 1, 1, '2024-11-01', NULL, '2024-06-19 08:39:41', '2024-06-27 14:25:23', 13, 30, 0),
(9, 'أميتر التيار المتردِّد', 'تشمل خطة الدرس هذه الأهداف والمتطلَّبات والنقاط غير المتضمَّنة في الدرس الذي يتعلَّم فيه الطالب كيف يصِف تكوين الأميتر الذي يستخدم التمدُّد الحراري للأسلاك الموصلة لقياس التيارات المتردِّدة.\r\n\r\nالأهداف\r\nسيدرس الطلاب كيف\r\n\r\nالتعرُّف على مكونات الأميتر الحراري\r\nشرح وظائف مكونات الأميتر الحراري \r\nالتعرُّف على عيوب الأميتر الحراري\r\nالمتطلبات الأساسية\r\nيجب أن يكون الطلاب على دراية مسبقة بـ\r\n\r\nالجلفانومترات \r\nالأميترات \r\nالتيار المتردد \r\nتبديد الطاقة في المقاومات\r\nالتمدُّد الحراري', 'main_server', 'http://localhost/Teacher-System/public/app/videos/66729ff066092_73354836.mp4', 'captions/66728cc1493cc', 1, 1, 1, '2024-12-01', NULL, '2024-06-19 08:46:09', '2024-06-27 14:25:01', 14, NULL, 0),
(10, 'معاوَقة دوائر التيار المتردِّد', '### أهداف الدرس والمتطلبات\r\n\r\n#### الأهداف\r\n\r\nسيدرس الطلاب كيف:\r\n\r\n- حساب معاوقة دوائر التيار المتردِّد باستخدام معادلات المفاعلات السعوية والحثية ودمجهما مع مقاومة الدائرة الكهربية:\r\n  - \\(X_C = \\frac{1}{\\omega C}\\)\r\n  - \\(X_L = \\omega L\\)\r\n  - \\(Z = \\sqrt{R^2 + (X_L - X_C)^2}\\)\r\n\r\n#### المتطلبات الأساسية\r\n\r\nيجب أن يكون الطلاب على دراية مسبقة بـ:\r\n\r\n- التردد الزاوي للتيار المتردد \\(\\omega = 2\\pi f\\)\r\n- السعة الكهربية\r\n- معامل الحث\r\nالبنزين (أو البِنْزِن، البنزول، البنزين الحلقي) هو سائل عديم اللون وأحد مركبات البنزين (الوقود) متطاير وأبخرته شديدة الاشتعال هو من المواد المسرطنة وله رائحة قوية ونفاذة وذو رائحة معسولة تشم بمحطات الوقود، تركيبته الكيميائية تتشكل من حلقة سداسية من الكربون والهيدروجين (C6H6) الحلقة السداسية للبنزين هي أبسط جزيء في الكيمياء العضوية العطرية هو أحد المكونات الطبيعية للزيت الخام ومن المذيبات الصناعية المهمة، ويستخدم في صناعة الأدوية واللدائن والمطاط الصناعي والأصبغة والنابالم.ويمكن صناعته من مكونات أخرى غير النفط. والبنزين من الهيدروكربونات الأروماتية وأبسطها على الإطلاق.\r\n\r\nسيدرس الطلاب كيف:\r\n\r\n- حساب معاوقة دوائر التيار المتردِّد باستخدام معادلات المفاعلات السعوية والحثية ودمجهما مع مقاومة الدائرة الكهربية:\r\n  - \\(X_C = \\frac{1}{\\omega C}\\)\r\n  - \\(X_L = \\omega L\\)\r\n  - \\(Z = \\sqrt{R^2 + (X_L - X_C)^2}\\)\r\n\r\n#### المتطلبات الأساسية\r\n\r\nيجب أن يكون الطلاب على دراية مسبقة بـ:\r\n\r\n- التردد الزاوي للتيار المتردد \\(\\omega = 2\\pi f\\)\r\n- السعة الكهربية\r\n- معامل الحث', 'main_server', 'http://localhost/Teacher-System/public/app/videos/66729fdd64560_1488037.mp4', 'captions/66728dd7d74dd', 1, 1, 1, '2024-12-01', NULL, '2024-06-19 08:50:47', '2024-06-27 14:21:32', 14, 30, 0),
(11, 'دوائر التوالي الكهربية', 'تشمل خطة الدرس هذه الأهداف والمتطلَّبات والنقاط غير المتضمَّنة في الدرس الذي يتعلَّم فيه الطالب كيف يحسُب فرق الجهد وشدة التيار والمقاومة عند نقاط مختلفة في دوائر كهربية بسيطة موصَّلة على التوالي.\r\n\r\nالأهداف\r\nسيدرس الطلاب كيف:\r\n\r\n- تذكر أن توصيل مكونين على التوالي يعني أنهما موضوعان الواحد تلو الآخر على المسار نفسه في الدائرة الكهربية\r\n- إدراك إذا ما كانت دائرتان كهربيتان موصَّلتان على التوالي متكافئتين بناء على الأشكال المرسومة باختلافات بسيطة\r\n- استخدام V_{\\text{total}} = V_1 + V_2 + \\dots مع المكونات الموصلة على التوالي\r\n- استخدام I_1 = I_2 = \\dots مع المكونات الموصلة على التوالي\r\n- استخدام R_{\\text{total}} = R_1 + R_2 + \\dots مع المكونات الموصلة على التوالي\r\n\r\nالمتطلبات الأساسية\r\nيجب أن يكون الطلاب على دراية مسبقة بـ:\r\n\r\n- فرق الجهد\r\n- التيار الكهربي\r\n- المقاومة الكهربية\r\n- رموز المكونات الرئيسية للدوائر الكهربية البسيطة: الخلية، والبطارية، والمصباح، والمقاومة، والمقاومة المتغيرة، والثرمستور، وLDR (المقاومة الضوئية)، والدايود، و LED (الدايود الباعث للضوء)', 'main_server', 'http://localhost/Teacher-System/public/app/videos/66728b686db6e_977245085.mp4', 'captions/6672b65a54ad5', 1, 1, 1, '2024-09-01', NULL, '2024-06-19 11:43:38', '2024-06-27 14:24:33', 10, 60, 0),
(12, 'دوائر التوازي الكهربية', 'تشمل خطة الدرس هذه الأهداف والمتطلَّبات والنقاط غير المتضمَّنة في الدرس الذي يتعلَّم فيه الطالب كيف يحسب فرق الجهد وشدة التيار والمقاومة عند نقاط مختلفة في دوائر كهربية بسيطة موصلة على التوازي.\r\n\r\nالأهداف\r\nسيدرس الطلاب كيف\r\n\r\nتذكر أن توصيل مكونين على التوازي يعني أنهما موضوعان على فرعين منفصلين في الدائرة الكهربية\r\nإدراك إذا ما كانت دائرتان كهربيتان موصلتان على التوازي متكافئتين بناء على الأشكال المرسومة باختلافات بسيطة\r\nاستخدام \r\nV_1 = V_2 = V_3 ... مع المكونات الموصلة على التوازي\r\nاستخدام \r\nI_{total} = I_1 + I_2 ... مع المكونات الموصلة على التوازي\r\nاستخدام \r\n1/R_{total} = 1/R_1 + 1/R_2 ... مع المكونات الموصلة على التوازي\r\n\r\nالمتطلبات الأساسية\r\nيجب أن يكون الطلاب على دراية مسبقة بـ\r\n\r\nفرق الجهد\r\nالتيار الكهربي\r\nالمقاومة الكهربية\r\nرموز المكونات الرئيسية للدوائر الكهربية البسيطة: الخلية، والبطارية، والمصباح، والمقاومة، والمقاومة المتغيرة، والثرمستور، وLDR (المقاومة الضوئية)، والدايود، وLED (الدايود الباعث للضوء)', 'main_server', 'http://localhost/Teacher-System/public/app/videos/6672b985612af_975662508.mp4', 'captions/6672b7525f63e', 1, 1, 1, '2024-10-01', NULL, '2024-06-19 11:47:46', '2024-06-27 14:24:09', 10, 60, 0),
(13, 'درس لشهر أعسطس 3ث', 'بالتأكيد! إذا كنت تبحث عن محرر نصوص يدعم عرض معادلات LaTeX داخل النص نفسه، يمكنك استخدام محرر نصوص متقدم مثل Quill مع إضافة MathJax، أو محررات مثل CKEditor وTinyMCE مع إضافات مناسبة.\r\n\r\nاستخدام Quill مع MathJax\r\nإعداد Quill:\r\n\r\nأولاً، تحتاج إلى إضافة مكتبة Quill ومكتبة MathJax إلى مشروعك.', 'main_server', 'http://localhost/Teacher-System/public/app/videos/6672ba7e52baf_1435073358.mp4', 'captions/6672ba0b3528a', 1, 1, 1, '2024-08-01', NULL, '2024-06-19 11:59:23', '2024-06-27 14:23:57', 10, 30, 0),
(14, 'فيديو جديد ل شهر 09 عام 2024 3 ث', 'فيديو جديد ل شهر 09 عام 2024', 'main_server', 'http://localhost/Teacher-System/public/app/videos/667320d840a73_2143528238.mp4', 'captions/667320bfbd866', 1, 1, 1, '2024-09-01', NULL, '2024-06-19 19:17:36', '2024-06-27 14:22:22', 10, 30, 0),
(15, 'فيديو لشهر 8 3 ثانوى', 'فيديو لشهر 8 3 ثانوى', 'youtube', 'https://www.youtube.com/watch?v=F2badZl2pUU', 'captions/captions_667d871885c19.png', 1, 1, 1, '2024-08-01', NULL, '2024-06-27 15:57:15', '2024-06-27 16:36:56', 18, 60, 0),
(16, 'درس جديد 3 ث شهر يناير', 'وصف درس جديد 3 ث شهر يناير', 'youtube', 'https://www.youtube.com/watch?v=F2badZl2pUU', 'captions/captions_667ee98f1c048.png', 1, 1, 1, '2025-01-01', NULL, '2024-06-28 17:49:19', '2024-06-28 17:49:19', 16, 120, 0),
(17, 'الطيف الذرى شهر يناير', 'وصف الطيف الذرى شهر يناير', 'youtube', 'https://www.youtube.com/watch?v=bIhMlT-FAdU', 'captions/captions_667f6852910a3.jpeg', 1, 1, 1, '2024-08-01', NULL, '2024-06-29 02:50:11', '2024-06-29 02:50:11', 11, 60, 0),
(18, 'التيار الكهربى وقانون أوم', 'وصف التيار الكهربى وقانون أوم', 'youtube', 'https://www.youtube.com/watch?v=w8ENjiyBYzg', 'captions/captions_667f698d971b6.png', 1, 1, 1, '2024-08-01', NULL, '2024-06-29 02:55:25', '2024-06-29 02:55:25', 10, 60, 0),
(19, 'شرح التيار الكهربى وقوانين كيرشوف', 'وصف شرح التيار الكهربى وقوانين كيرشوف', 'youtube', 'https://www.youtube.com/w8ENjiyBYzg', 'captions/captions_667f6a416020c.jpg', 1, 1, 1, '2024-08-01', NULL, '2024-06-29 02:58:25', '2024-06-29 02:58:25', 10, 30, 0),
(20, 'درس الحمض النوووى', 'وصف درس الحمض النوووى', 'youtube', 'https://www.youtube.com/watch?v=w8ENjiyBYzg', 'captions/captions_66803c7172b91.png', 1, 1, 1, '2024-08-01', NULL, '2024-06-29 17:55:14', '2024-06-29 17:55:14', 10, 60, 0),
(21, 'درس شهر  يناير 1 ث 102', 'وصف درس شهر  يناير 1 ث 102', 'youtube', 'https://www.youtube.com/watch?v=cJGRhQlE0xw', 'captions/captions_668053ed9fc67.png', 1, 3, 1, '2025-01-01', NULL, '2024-06-29 19:35:25', '2024-06-29 19:35:25', 2, 60, 0);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_show` date NOT NULL,
  `caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free` tinyint NOT NULL DEFAULT '0' COMMENT '0==> not free,1==> free'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `title`, `description`, `media_url`, `unit_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`, `url`, `date_show`, `caption`, `free`) VALUES
(1, 'كتاب التيار الكهربى الدرس الاول', 'test', 'powerBi.pdf', 1, 1, 1, NULL, '2024-06-11 22:20:04', '2024-06-15 19:52:47', NULL, '2024-08-01', 'books_caption/lovepik-man-running-in-the-forest-picture_501454889.jpg', 0),
(2, 'شرح التيار الكهربى وقانون كيرشوف', 'شرح التيار الكهربى وقانون كيرشوف  الوحدة الاولى', 'Machine Learning_ Step-by-Step Guide To Implement Machine Learning Algorithms with Python.pdf', 10, 1, 1, NULL, '2024-06-15 18:58:19', '2024-06-15 19:36:50', NULL, '2024-08-01', 'books_caption/image-04.png', 0),
(3, 'شرح مادة الفيزياء عام 2024', 'شرح مادة الفيزياء لطلبة الصف الثالث الثانوى', 'mindset.pdf', NULL, 1, 1, NULL, '2024-06-15 19:03:34', '2024-06-15 19:49:05', NULL, '2024-08-01', 'books_caption/image-04.png', 0),
(4, 'كتاب قوانين نيوتن', 'كتاب قوانين نيوتن', 'تعلم jQuery في 120 دقيقة.pdf', 6, 3, 1, NULL, '2024-06-19 04:36:22', '2024-06-19 04:37:12', NULL, '2024-10-01', 'books_caption/image-04.png', 0),
(5, 'الحركة بعجلة منتظمة', 'الحركة بعجلة منتظمة', 'css3.pdf', 3, 3, 1, NULL, '2024-06-19 04:42:43', '2024-06-19 04:42:58', NULL, '2024-10-01', NULL, 0),
(6, 'الحركة المتسارعة', 'الحركة المتسارعة', 'ch4.pdf', 3, 3, 1, NULL, '2024-06-19 04:45:43', '2024-06-19 04:46:03', NULL, '2024-10-01', NULL, 0),
(7, 'الحركة بعجلة خلال الزمن', 'وصف الحركة بعجلة خلال الزمن', '', 3, 3, 1, NULL, '2024-06-19 05:00:53', '2024-06-19 05:00:53', NULL, '2024-11-01', NULL, 0),
(8, 'الكميات القياسية والمتجهة', 'وصف لل الكميات القياسية والمتجهة', 'الكميات القياسية والكميات المتجهة.pdf', 5, 3, 1, NULL, '2024-06-19 05:07:08', '2024-06-19 05:07:24', NULL, '2024-09-01', NULL, 0),
(9, 'قياس درجات الحرارة', 'قياس درجات الحرارة', '66725aad896fc.pdf', 6, 3, 1, NULL, '2024-06-19 05:12:16', '2024-06-19 05:12:29', NULL, '2024-08-01', NULL, 0),
(10, 'قوانين الحركة (نيوتن)', 'وصف قوانين الحركة (نيوتن)', 'Deep learning_ adaptive computation and machine learning.pdf', 3, 3, 1, NULL, '2024-06-19 06:40:37', '2024-06-19 06:45:02', NULL, '2024-12-01', NULL, 0),
(11, 'درس  الحركة فى خط مستقيم', 'وصف درس  الحركة فى خط مستقيم', '66727705a3006_799986676.pdf', 4, 3, 1, NULL, '2024-06-19 06:47:12', '2024-06-19 07:13:25', NULL, '2025-03-01', NULL, 0),
(12, 'كتاب لشهر يناير  1 ث', 'كتاب لشهر يناير  1 ث', '6672798c4f13d_1073964112.pdf', 2, 3, 1, NULL, '2024-06-19 07:23:42', '2024-06-19 07:24:12', NULL, '2025-01-01', NULL, 0),
(13, 'كتاب لشهر فبراير  1 ث', 'كتاب لشهر فبراير  1 ث', '667279ee30e63_50401375.pdf', 2, 3, 1, NULL, '2024-06-19 07:25:30', '2024-06-19 07:25:50', NULL, '2025-02-01', NULL, 0),
(14, 'كتاب لشهر أبريل  1 ث', 'كتاب لشهر أبريل  1 ث', '66727a1e15151_707111828.pdf', 3, 3, 1, NULL, '2024-06-19 07:26:27', '2024-06-19 07:26:38', NULL, '2025-04-01', NULL, 0),
(15, 'كتاب لشهر أغسطس 3 ث', 'كتاب لشهر أغسطس 3 ث', '66727db5e94b1_1113495418.pdf', 10, 1, 1, NULL, '2024-06-19 07:37:32', '2024-06-19 07:41:57', NULL, '2024-08-01', NULL, 0),
(16, 'كتاب لشهر سبتمبر 3 ث', 'كتاب لشهر سبتمبر 3 ث', '66727dc9594b8_1724151334.pdf', 10, 1, 1, NULL, '2024-06-19 07:38:13', '2024-06-19 07:42:17', NULL, '2024-09-01', NULL, 0),
(17, 'كتاب لشهر أكتوبر 3 ث', 'كتاب لشهر أكتوبر 3 ث', '66727de3cc34b_109403283.pdf', 11, 1, 1, NULL, '2024-06-19 07:40:41', '2024-06-19 07:42:43', NULL, '2024-10-01', NULL, 0),
(18, 'كتاب لشهر نوفمبر 3 ث', 'كتاب لشهر نوفمبر 3 ث', '66727e00aadf0_1062208832.pdf', 10, 1, 1, NULL, '2024-06-19 07:41:10', '2024-06-19 07:43:12', NULL, '2024-11-01', NULL, 0),
(19, 'كتاب لشهر ديسمبر 3 ث', 'كتاب لشهر ديسمبر 3 ث', '66727e0ebc57f_1461829384.pdf', 11, 1, 1, NULL, '2024-06-19 07:41:39', '2024-06-19 07:43:26', NULL, '2024-12-01', NULL, 0),
(20, 'كتاب لشهر يناير عام 2025 3 ث', 'كتاب لشهر يناير عام 2025 3 ث', '66727f6b4737b_827164010.pdf', NULL, 1, 1, NULL, '2024-06-19 07:46:45', '2024-06-19 07:49:15', NULL, '2025-01-01', 'books_caption/lovepik-man-running-in-the-forest-picture_501454889.jpg', 0),
(21, 'كتاب لشهر فبراير عام 2025 3 ث', 'كتاب لشهر فبراير عام 2025 3 ث', '66727f7ece89d_689305897.pdf', 11, 1, 1, NULL, '2024-06-19 07:47:15', '2024-06-19 07:49:34', NULL, '2025-02-01', NULL, 0),
(22, 'كتاب لشهر مارس عام 2025 3 ث', 'كتاب لشهر مارس عام 2025 3 ث', '66727f8fe0804_1845393019.pdf', NULL, 1, 1, NULL, '2024-06-19 07:48:07', '2024-06-19 07:49:51', NULL, '2025-03-01', NULL, 0),
(23, 'كتاب لشهر أبريل عام 2025 3 ث', 'كتاب لشهر أبريل عام 2025 3 ث', '66727f9d439aa_1878461940.pdf', NULL, 1, 1, NULL, '2024-06-19 07:48:54', '2024-06-19 07:50:05', NULL, '2025-04-01', NULL, 0),
(24, 'كتاب لشهر أغسطس 2 ث', 'كتاب لشهر أغسطس 2 ث', '66727db5e94b1_1113495418.pdf', 10, 2, 1, NULL, '2024-06-19 07:37:32', '2024-06-19 07:41:57', NULL, '2024-08-01', NULL, 0),
(25, 'كتاب لشهر سبتمبر 2 ث', 'كتاب لشهر سبتمبر 2 ث', '66727dc9594b8_1724151334.pdf', 10, 2, 1, NULL, '2024-06-19 07:38:13', '2024-06-19 07:42:17', NULL, '2024-09-01', NULL, 0),
(26, 'كتاب لشهر أكتوبر 2 ث', 'كتاب لشهر أكتوبر 2 ث', '66727de3cc34b_109403283.pdf', 11, 2, 1, NULL, '2024-06-19 07:40:41', '2024-06-19 07:42:43', NULL, '2024-10-01', NULL, 0),
(27, 'كتاب لشهر نوفمبر 2 ث', 'كتاب لشهر نوفمبر 2 ث', '66727e00aadf0_1062208832.pdf', 10, 2, 1, NULL, '2024-06-19 07:41:10', '2024-06-19 07:43:12', NULL, '2024-11-01', NULL, 0),
(28, 'كتاب لشهر ديسمبر 2 ث', 'كتاب لشهر ديسمبر 2 ث', '66727e0ebc57f_1461829384.pdf', 11, 2, 1, NULL, '2024-06-19 07:41:39', '2024-06-19 07:43:26', NULL, '2024-12-01', NULL, 0),
(29, 'كتاب لشهر يناير عام 2025 2 ث', 'كتاب لشهر يناير عام 2025 2 ث', '66727f6b4737b_827164010.pdf', NULL, 2, 1, NULL, '2024-06-19 07:46:45', '2024-06-19 07:49:15', NULL, '2025-01-01', NULL, 0),
(30, 'كتاب لشهر فبراير عام 2025 2 ث', 'كتاب لشهر فبراير عام 2025 2 ث', '66727f7ece89d_689305897.pdf', 11, 2, 1, NULL, '2024-06-19 07:47:15', '2024-06-19 07:49:34', NULL, '2025-02-01', NULL, 0),
(31, 'كتاب لشهر مارس عام 2025 2 ث', 'كتاب لشهر مارس عام 2025 2 ث', '66727f8fe0804_1845393019.pdf', NULL, 2, 1, NULL, '2024-06-19 07:48:07', '2024-06-19 07:49:51', NULL, '2025-03-01', NULL, 0),
(32, 'كتاب لشهر أبريل عام 2025 2 ث', 'كتاب لشهر أبريل عام 2025 2 ث', '66727f9d439aa_1878461940.pdf', NULL, 2, 1, NULL, '2024-06-19 07:48:54', '2024-06-19 07:50:05', NULL, '2025-04-01', NULL, 0),
(33, 'ملخص التيار الكهربى وقانون أوم', 'وصف ملخص التيار الكهربى وقانون أوم', '6680547926f06_1230727097.pdf', 10, 1, 1, NULL, '2024-06-29 18:24:32', '2024-06-29 19:37:45', NULL, '2024-08-01', 'books_caption/books_caption_6680434fedba9.png', 0),
(34, 'ملخص القوة والحركة', 'وصف ملخص القوة والحركة', '6680546e035f3_753967483.pdf', 2, 3, 1, NULL, '2024-06-29 19:36:58', '2024-06-29 19:37:34', NULL, '2025-01-01', 'books_caption/books_caption_6680544a3486c.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_07_21_031229_create_teachers_table', 2),
(6, '2023_07_21_110253_create_school_grades_table', 2),
(7, '2023_07_21_119217_create_subjects_table', 2),
(8, '2023_07_21_120201_create_class_studies_table', 2),
(9, '2023_07_21_130011_create_posts_table', 2),
(10, '2023_07_21_130102_create_lessons_table', 2),
(11, '2023_07_21_130121_create_media_table', 2),
(12, '2023_07_21_130307_create_exams_table', 2),
(13, '2023_07_21_130321_create_questions_table', 2),
(14, '2023_07_21_130343_create_question__exams_table', 2),
(15, '2023_07_21_130406_create_question__exam__students_table', 2),
(16, '2023_08_06_125640_add_to_media_table', 3),
(17, '2023_08_06_131007_add_to_media_table', 4),
(19, '2023_08_06_191356_add_to_exams__table', 5),
(20, '2023_08_07_110419_add_to_users_table', 6),
(21, '2023_08_09_075458_add_to_lessons_table', 6),
(22, '2023_08_10_114954_add_to_teachers_table', 6),
(23, '2023_08_13_063058_create_months_table', 7),
(24, '2023_08_13_063707_create_month_student_table', 7),
(25, '2023_08_13_125506_add_to_month_student_table', 8),
(26, '2023_08_16_064557_create_exam_student__table', 8),
(27, '2023_08_16_064557_create_exam_student_table', 9),
(28, '2023_08_16_065417_create_exam_student_table', 10),
(29, '2023_08_23_154225_create_units_table', 11),
(30, '2023_08_23_191703_add_to_lesson_table', 12),
(31, '2023_08_23_191746_add_to_questions__table', 12),
(32, '2023_08_23_215008_add_to_exams_table', 13),
(35, '2023_09_04_054849_create_governments_table', 15),
(36, '2023_09_08_070540_add_to_media_table', 16),
(37, '2023_09_09_111432_add_to_months_table', 17),
(38, '2023_09_10_092310_add_to_exams_table', 18),
(39, '2023_09_10_195417_add_to_months_table', 19),
(40, '2023_09_12_025435_create_notifications_table', 20),
(41, '2023_09_14_113418_create_book_view_table', 21),
(42, '2023_09_14_150011_create_video_minute__table', 23),
(43, '2023_09_14_163241_add_to_lessons__table', 24),
(44, '2023_09_21_105559_add_to_users_table', 25),
(45, '2023_09_21_151432_add_to_questions_table', 26),
(46, '2023_09_21_195620_create_exam_timer_table', 26),
(47, '2023_09_26_104220_add_to_months_table', 26),
(48, '2023_09_28_065702_add_to_lessons_table', 27),
(49, '2023_09_28_065712_add_to_media_table', 27),
(50, '2023_09_28_065726_add_to_exams_table', 27),
(51, '2023_10_05_095835_add_to_users_table', 28),
(52, '2023_10_27_171049_create_jobs_table', 29),
(53, '2018_08_08_100000_create_telescope_entries_table', 30),
(54, '2024_05_25_090927_add_to_questions_table', 31),
(55, '2024_05_26_230949_create_rechagre_balance_table', 32),
(56, '2024_05_27_052057_create_settings_table', 33),
(57, '2024_05_29_071740_create_sessionslive_table', 34),
(58, '2024_05_29_071804_create_static_exams_table', 34),
(59, '2024_05_29_074645_create_vr_services_table', 35),
(60, '2024_05_30_194515_create_free_videos_table', 36),
(61, '2024_05_30_194549_create_free_books_table', 36),
(62, '2024_05_30_194600_create_free_exams_table', 36),
(63, '2024_05_31_151743_create_register_tokens_table', 37),
(64, '2024_06_11_074433_add_to_units_table', 38),
(65, '2024_06_11_074457_add_to_months_table', 38),
(66, '2024_06_11_074526_add_to_users_table', 38),
(67, '2024_06_11_074757_add_to_vr_services_table', 38),
(68, '2024_06_11_074847_add_to_vr_sessionslive_table', 38),
(69, '2024_06_11_074940_add_to_vr_payments_table', 38),
(70, '2024_06_11_075421_add_to_static_exams_table', 38),
(71, '2024_06_18_180133_add_to_question_exam_students_table', 39),
(72, '2024_06_20_185145_add_to_users_table', 40),
(73, '2024_06_27_074938_add_to_users_table', 40),
(74, '2024_06_27_135640_create_sources_table', 41),
(75, '2024_06_27_141022_add_to_lessons_table', 42),
(76, '2024_06_27_141042_add_to_free_videos_table', 42);

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` bigint UNSIGNED NOT NULL,
  `month_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '09-2023',
  `year` mediumint DEFAULT NULL,
  `month` tinyint DEFAULT NULL,
  `month_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT 'status:(0 ==> show,1 ==> hide)',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `month_name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cost` double(8,2) DEFAULT NULL,
  `orderValue` tinyint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `month_date`, `year`, `month`, `month_name`, `status`, `created_at`, `updated_at`, `teacher_id`, `month_name_ar`, `month_description`, `cost`, `orderValue`, `deleted_at`) VALUES
(1, '2024-08', 2024, 8, 'أغسطس', 0, '2024-06-11 13:35:39', '2024-06-28 18:28:50', 1, 'أغسطس', 'شهر أغسطس ل 2024', 250.00, 1, NULL),
(2, '2024-09', 2024, 9, 'سبتمبر', 0, '2024-06-16 13:42:49', '2024-06-28 18:30:49', 1, 'سبتمبر', 'شهر سبتمبر ل عام 2024', 250.00, 1, NULL),
(3, '2024-10', 2024, 10, 'أكتوبر', 0, '2024-06-16 13:44:00', '2024-06-28 18:31:19', 1, 'أكتوبر', 'شهر أكتوبر ل عام 2024', 250.00, 1, NULL),
(4, '2025-01', 2025, 1, 'يناير', 0, '2024-06-17 20:46:18', '2024-06-17 20:46:18', 1, 'يناير', 'شهر يناير ل عام 2025', 350.00, 1, NULL),
(5, '2024-11', 2024, 11, 'نوفمبر', 0, '2024-06-19 04:46:52', '2024-06-19 04:46:52', 1, 'نوفمبر', 'احصائيات نوفمبر ل عام 2024', 250.00, 1, NULL),
(6, '2024-12', 2024, 12, 'ديسمبر', 0, '2024-06-19 04:47:29', '2024-06-19 04:47:29', 1, 'ديسمبر', 'احصائيات ديسمبر لعام 2024', 250.00, 1, NULL),
(7, '2025-02', 2025, 2, 'فبراير', 0, '2024-06-19 04:48:13', '2024-06-19 04:48:13', 1, 'فبراير', 'احصائيات فبراير  لعام 2025', 250.00, 1, NULL),
(8, '2025-03', 2025, 3, 'مارس', 0, '2024-06-19 04:48:58', '2024-06-19 04:48:58', 1, 'مارس', 'احصائيات مارس لعام 2025', 250.00, 1, NULL),
(9, '2025-04', 2025, 4, 'أبريل', 0, '2024-06-19 04:49:35', '2024-06-19 04:49:35', 1, 'أبريل', 'احصائيات ابريل لعام 2025', 250.00, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `month_student`
--

CREATE TABLE `month_student` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `month_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint NOT NULL,
  `lock` tinyint NOT NULL COMMENT '0==> locked,1 ==> unlocked',
  `points_paid` smallint NOT NULL DEFAULT '100' COMMENT '100 point paid for lock month',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `month_student`
--

INSERT INTO `month_student` (`id`, `user_id`, `month_id`, `teacher_id`, `lock`, `points_paid`, `created_at`, `updated_at`) VALUES
(1, 5, 4, 1, 1, 350, '2024-06-18 18:36:58', '2024-06-18 18:36:58'),
(2, 5, 3, 1, 1, 250, '2024-06-18 19:05:51', '2024-06-18 19:05:51'),
(3, 5, 1, 1, 1, 250, '2024-06-24 20:28:14', '2024-06-24 20:28:14'),
(4, 1, 4, 1, 1, 350, '2024-06-29 19:29:48', '2024-06-29 19:29:48');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0126342b-256c-4752-a76b-4ac0136c7f3e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 319, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('01a05cdd-df67-4909-bc41-b329e209c8eb', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 324, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:34', '2024-06-29 02:55:34'),
('01c2f039-f5ce-4b7b-8746-16ad46582fad', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 6, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('01cb4c49-b472-4ad8-8969-f75dbd7c8924', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 371, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('02602101-7c8a-42db-a367-615c0e226c12', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 286, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('02a4ab34-645a-467d-bdef-1b89dedfa4be', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 377, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('02baee02-337b-4bec-8d55-baf4827de5fc', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 161, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('03730654-540b-4c6b-9038-b3e627b36300', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 321, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:34', '2024-06-29 02:55:34'),
('03db688f-e1cd-48e7-b441-aa33a52d7534', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 329, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('04560c74-e1af-4780-a3d6-305d3d2bcbe3', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('057ef886-3001-4ae3-a3e8-70323ceba2ea', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 September\"}}', NULL, '2024-06-27 16:44:29', '2024-06-27 16:44:29'),
('061fdfe2-56ff-4cd4-811f-b50c855cb394', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 6, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('066a1eb5-b4eb-4c83-afbd-83874c1d99a1', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 5, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('0683774c-3542-4f86-b440-6b5d2a2a1ebc', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 278, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('06b3dec9-32fc-4eb9-9f67-9b132393b62d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 7, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('084aac16-2868-48f0-b245-164b04b4768c', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 265, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('08638026-5dda-4701-9948-2bc7959eaf40', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 332, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('089fdca1-ff00-43c9-89c2-ef1c3fb5d61e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 393, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('094b28d1-3f3d-4dc4-858d-601d78440033', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('09ec01c0-1a84-4c63-b9d3-c000d0ce500c', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 389, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('09ed30b3-edce-498d-bab0-fcc5eb12084f', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 366, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('0a7b1938-de5d-4050-916d-750bbb072f6e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 369, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('0ab7e364-26bc-4d07-951e-a5f3e5220d7a', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 330, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:34', '2024-06-29 02:55:34'),
('0b16276b-d508-45b2-b5a5-1b8b309d56e3', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 415, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('0ca348ce-1cb3-4673-9aea-fb3e84c54be1', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 400, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('0ca90c52-0e72-4a0e-b394-757223112b8a', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 357, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('0d568104-4a46-4251-b820-636024ea5118', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 1, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 December\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('0d8b0dc0-ff64-45b0-bd5a-f8ed2c61f15e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 400, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('0e085104-692f-482b-a427-ab824affc226', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 384, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('0e5f1bf2-3ee3-4ef1-92e7-4c53eb1ee82c', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 3, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 November\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('0f5443ac-eba4-4823-9442-037a46d5c2d5', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 393, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('0fe455dc-a757-4460-be42-8a59bd95e613', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 75, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('102afcdf-40dc-437b-971c-7bcda8a20ea4', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 393, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('104cb4d9-2062-4ad9-b7c0-9bbc13132f58', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 370, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('10976542-49a6-4859-8b02-8e9bfa8ea759', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 275, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('10caa621-06d8-4e94-8965-c4c8a554dca5', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 348, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('11233756-f0ea-486d-874c-f5625ab58f60', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 336, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('114cc583-0791-4b8c-bfe7-2f16261007a3', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 329, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('123d5377-bdc4-4ab4-8aaf-48c5c68dcf6b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 376, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('129899f6-f7a7-4fb0-be41-811d4580cdf0', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 365, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('13730aad-e8e9-456c-b3f7-bffeac1a885a', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 324, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('137ba15f-3537-4f20-9064-5997fee10502', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 156, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('14b7c9d6-5416-44b9-b764-812d5a620357', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 437, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:38', '2024-06-29 02:50:38'),
('14b99aa4-c4cf-4885-995f-1e0a49d91e6c', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 91, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('14d18f95-24e8-45f5-b073-610d98ec5a71', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 6, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('15846488-7569-4174-b66c-f276d5adfc56', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 27, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('15ce01d4-6f09-45e9-b530-ad7c3c3a5380', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 6, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 April\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('169882d9-f572-4a45-b72d-dba302ed4843', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 320, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:34', '2024-06-29 02:55:34'),
('17801ed1-d166-4b93-9a0f-dd0b6e16d70f', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 7, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:33', '2024-06-29 02:55:33'),
('17f266d3-864d-44c2-8468-58c3bbbc6685', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 376, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('1874214e-c6c7-4b14-bb24-adc73ace4bb2', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 306, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('18ad830e-98bc-4264-8959-8cee206a4961', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 371, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('190f4fbe-14a3-4d7e-8ea2-8e521d916689', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 378, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('19da899d-6a04-482d-adf3-697e1da09675', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 376, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('1a33d97b-8767-4aad-a048-c533caf9a57f', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 298, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('1ade5d93-94e5-4b74-b7d5-9c5495e9210e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 3, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('1b316e17-fb41-4b06-ae8f-39c1bce8e483', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 379, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('1b58bde6-f1b7-4635-8d55-a30151b558c3', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 4, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 November\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('1b7e61e4-0082-4318-859c-7fc1a3ab90ab', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 402, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('1be11c59-28cb-49db-9f5d-f308afb6db1f', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 80, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('1c1ba696-074a-4ed1-8b26-0cece444981c', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 332, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:34', '2024-06-29 02:55:34'),
('1c2b3bc8-c440-45f7-9474-b96ce78a5b06', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 366, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('1d299252-7d56-4c95-a81f-3696f038b6b7', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 332, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('1d884803-eb07-424e-9bca-a5066f6dd28b', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 10, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:33', '2024-06-29 02:55:33'),
('1ed74f6d-553d-4256-a7ff-48249bc31c39', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 358, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('1f444324-eacd-4694-9cff-441bb85f5e74', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 288, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:33', '2024-06-29 02:55:33'),
('1f5da0bc-a102-494d-99d2-154085127af3', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 383, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('1fa3d3d7-7267-40a2-974b-b066b984049a', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 437, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('1fcef0b7-ba86-4f3f-858e-37bbe1fd05ee', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 339, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('20789f8f-ebe8-41cf-9f5e-6c28963fc755', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 368, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('214aee7c-d818-4927-a910-8e939e723dd4', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 251, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('2191f824-32b0-4711-aa7b-ba029ceadb19', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 378, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('220a6a6b-89dd-4864-b7ea-ce2bffa9ab11', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 236, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('229318b8-9c5f-424a-bf49-974d31d6f0e5', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 399, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('23144cc8-6e29-4aab-b69d-9bcc4ba453c0', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 384, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('24f3f50c-9fb2-4533-a3a8-90d9925bd1b0', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 6, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('25309735-48c7-42ab-af77-845b04580437', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 6, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 February\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('258b6fa4-1fc3-433b-86d9-fb359f9bb1ac', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 425, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('258df5a0-487b-4ddd-b3af-0b72ea32204c', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 September\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('25bfa4da-7504-41f1-acc3-2986dfb37038', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 417, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('25c2065c-19b5-4af7-9be3-4b3ac43f12d8', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 184, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('26230f0e-8c1a-4476-8f3c-c5479b8b3b5c', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 55, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('262aba35-2f3e-4299-acbb-ae8f61e97519', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 226, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('26640254-77eb-4dd0-84a5-6e038905c740', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 437, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('26f33936-59f9-4daa-a519-1201148c78c1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 210, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('27821264-ce04-4fe5-9267-bc16e759341b', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 1, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 March\"}}', '2024-06-30 04:41:27', '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('27a73a53-01d8-4db6-ac86-f01a49d15d00', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 98, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('27a82710-17b2-4612-84bc-0c17dc0e5494', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 11, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:16', '2024-06-29 02:20:16'),
('27be7309-1dbe-4199-988a-518a58a67898', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 366, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('27cce97b-3b30-49fc-a9f8-934a0a1b7699', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 1, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('27de4965-0db8-4d81-81d9-141ebab029e7', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 320, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('27f0e8e5-2c25-4601-aede-aad1c757cc89', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 287, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('28aa5330-ec4b-4dde-aee0-4a2677079463', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 326, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('29042336-a6c2-41b5-a6f9-5c6cc603e0d3', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 111, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('292d69a4-84f6-4ecc-b2f1-a28906fcadc6', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 3, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 April\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('295e2f0e-ef42-4688-b219-838f32f324f9', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 330, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('29b82c40-8633-4fbf-8fcf-2d8d1217260c', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 4, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('29dbf426-de12-4781-9b4b-848756e74b44', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 25, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('2a736fb8-2508-4aac-8751-e37df845ece1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 336, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('2aa97d77-d87f-4cc4-9ce6-7475e4c4c1e2', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 359, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('2b3385f0-5f49-42d9-a737-83402e44d490', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 25, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('2c382366-8af7-4d48-867a-a26c152cf454', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 367, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('2cbfd3c4-f9f6-4a00-aa9a-ab17ce581177', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 200, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('2d865b01-e33d-4737-a605-a73b1ad01973', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 351, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('2d9f2d55-e8d3-4888-a510-cec096085469', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 195, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('2dd289a3-49ba-45e9-801b-53f6bc34fc4e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 11, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('2deed2cc-6c20-4428-b242-ea4d9084d272', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 3, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('2e63ba6c-4879-4bc5-a8b9-b3d621d611e0', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 374, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('2e663eae-cdc4-4df6-825e-e66ddfd369cb', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 330, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('2ff13486-40cf-47e7-9963-3602db8126c1', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 3, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 December\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('307865ed-ae72-4df5-8bfe-a12e9f661d89', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 334, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('308e7cbc-87c3-40a2-9113-8bc8b5d94ea7', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 277, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('30df86fd-b104-4d75-a333-ce14ce3da809', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 368, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('3145f1ca-5aa3-493b-8afd-905f664b089e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 10, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('32aa3e51-3b78-492f-b1da-6d550d028e3a', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 89, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('32bfbf4c-5c16-4396-b4da-b52ea6f9c746', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 348, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('3304e3ef-5c9a-4b8f-b0a8-96b341133735', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 5, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('33a212b9-d074-4c9b-9b27-370ecaeae075', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 358, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('33a94ab7-dc0e-43e2-9ea7-e9085b4b431a', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:33', '2024-06-29 02:55:33'),
('33bd3382-b07e-47e3-af5d-396c928c43a3', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 351, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('340d1edd-d25d-4540-9069-7e9da85d1836', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 368, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('3455c993-070d-4120-aae0-502cc891d273', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 351, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('34ee0e2c-25f7-4ece-b1c9-825ef04cc808', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 10, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('35171240-6854-412e-adc7-9fb973173c31', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 322, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:34', '2024-06-29 02:55:34'),
('35186d2e-a4c6-4942-b9cf-efc59582ba20', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 367, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('357c06b6-1a9f-4612-8a39-a8286558ce6f', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 383, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('363a3fc8-ab3f-4a13-ae58-fb78bd80942b', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 367, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('36fe570f-6ec0-4b7a-a2b8-bf5078615e46', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 389, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('3723354f-9f5c-4f80-9bf9-b977652a89f8', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 36, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('375f9217-5347-4941-aa91-d72abca716a5', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 417, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('37786b7e-c065-436a-8695-a645ab61c582', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 366, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('37bdc5e2-9604-463d-8476-fd06cb8a84a8', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 384, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('37be9cfc-11f0-4b7c-9162-c4896c4a0d1d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 192, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('383dd76a-c9ff-4c4a-9be9-0646d2a51c70', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 306, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('3860acb5-7917-408d-822a-f0f20d1a73bc', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 336, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('38b80f7b-9dd9-4e3e-bdf2-3dc66088fc33', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 13, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('39bce201-e79c-4866-936b-0fedb6125844', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 248, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('39d768b1-4a9d-49bc-bd35-23ad7779df43', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 December\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('39eaf6ce-2351-4a9c-94ac-f6eb965e4867', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 3, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 February\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('3a392add-49e5-4ba1-a897-b84ce4b90d52', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 389, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('3b63cfce-4c1e-4b8b-8bdf-79692d6b1f9f', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 83, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('3b788964-d01a-4f11-8784-65682f54bafe', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 332, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('3b79b63b-bc75-4b2a-9aca-9e834824d0c9', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 1, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('3ba19645-695d-4623-bd22-7bc0c85d9d90', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 74, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('3bd34f51-0ccd-4b0e-851b-815c661ebd0d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 428, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('3c14f01d-f2a4-4c5b-b959-26bdef02c14b', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 324, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('3d47b117-6e00-4294-b9a4-6c55d38ed0a6', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 358, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('3f162239-072f-4ff0-8a0d-cce08601f2b0', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 171, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('3fa87481-a03b-4d7b-89e3-b475eca5a47b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 13, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('3fe49eed-293e-4871-9503-127f1f254877', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 336, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('3fe9c037-d85e-46dc-8394-9364283976aa', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 4, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('401e07f9-5c7a-43f2-be4d-ac6f445e94d1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 25, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('4021f417-e089-4297-b280-b11d8657db74', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 235, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('40d22dfb-577e-415d-9e40-1ec588b7e323', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 377, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('41973359-81f8-492d-94bd-b254a87bf3c5', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 7, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('421cbba2-fc3f-4692-b44f-2dc3f182ebd0', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 190, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('426074e6-b297-4772-9ac4-a64a3c7ec8fe', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 295, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('42a4dd8d-d18e-499f-a7fa-f22e4eedf547', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 415, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:38', '2024-06-29 02:50:38'),
('42c78f57-98a8-403a-9016-a7aab443f9f9', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 334, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('45008a11-ff2b-4338-aba5-34c603d30bb6', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 4, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 April\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('4533119e-c60f-4b8a-b477-9112093a5875', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 33, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('453f6a5e-5695-4689-b035-98bacf29e898', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 380, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('4559f9c3-92f2-46a1-bb85-1dfebe377d80', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 437, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('45f8b5e8-870c-44a3-9986-93d8496618ed', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 436, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('4610517c-ae44-4f44-a8a2-3d94ea4ebadc', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 378, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('46559cfb-917d-4034-892c-6f83bd8d55fc', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 341, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('46671c4e-3655-477a-a763-ff22eaabb4b1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 5, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('47390c4a-7e3c-4ed7-99ec-80ed729e41d9', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 330, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('476a773f-4310-4c80-b559-606d18b9be08', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 105, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('487e196d-c88d-4c50-bbdf-3aeeb91648be', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 3, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('49c83d05-7d95-4cf4-846f-8347ca0d8be8', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('4a3ce2c2-d7e0-4b3d-b2f9-2e56f2053a7b', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 417, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:38', '2024-06-29 02:50:38'),
('4ad0d8dc-fb71-4e2c-b5ca-0f339c71c02d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 313, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('4b30f3d8-5e78-4725-88f4-f237d079f546', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 November\"}', NULL, '2024-06-27 16:44:29', '2024-06-27 16:44:29'),
('4b46eaab-1623-44e6-be9d-c9ad5fa2c827', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('4b5dd96e-9812-4be2-8879-44f11d9751b0', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 25, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('4b65f4e1-2914-432f-8725-5385412f6290', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 400, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('4bbb66de-8d7f-4e8a-8a2f-534f19dd5116', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 436, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('4c8aec30-6e5f-47bc-b48f-422ea140c639', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 120, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('4cd172f9-a962-4ce3-9fa3-0dfa8707a27f', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 383, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('4cd47915-d7d6-47b4-8564-795e13c5e374', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 175, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('4ce6f6e9-849b-44f3-9d22-e1a0f6b55a48', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 368, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('4db69db7-b7c5-4abb-86cb-16957d3c894d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 133, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('4dd1c673-ca63-444a-906f-834a27ba436b', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 321, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('4e10607f-7e29-4ee5-b470-d41b0d7be214', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 319, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('4e8a815b-35c4-402d-96ac-bc6d222392b6', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('4eb34066-c159-4430-9253-e03603285761', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 306, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:33', '2024-06-29 02:55:33'),
('4f6dac8f-c257-4ff0-a2d2-64913f68eaba', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 5, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('4ff474d5-eecd-438a-93ef-4969f74012e1', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 425, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('50b7781d-8305-4290-b471-9851668c69fc', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 334, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:34', '2024-06-29 02:55:34'),
('50df0dcb-53b7-4ef9-98eb-d50c03e116e1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 178, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('513dd34e-a9e2-48d9-b57f-d85fde233a23', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 10, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('52330019-c097-4a19-845f-036683b4ad1e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 10, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('52914d74-61da-48fb-a556-5613743177bd', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 266, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('529894d7-fd33-4526-a3ea-bf3dc4ef11f9', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 436, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:18', '2024-06-29 02:20:18'),
('52a887ab-a175-4949-be3a-c86b00a20a4b', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 324, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('52e24a84-8878-44e7-b6c8-dccb6ccc9c23', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 383, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('52ed30c5-71ba-4caa-b187-34cb9fac568d', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 383, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('531fc48b-7746-475c-afd2-0790aee18dc2', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 306, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('5359f54f-1ab2-48ac-9dea-34bbe6d27569', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 438, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('53bf84de-734a-49c0-9e51-bf69f128f47e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 383, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('54217f62-f70d-4ae7-9d46-7d80985f2a75', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 299, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('54884c95-ee08-4626-ace9-0d3072adc52c', 'App\\Notifications\\UpdatePoints', 'App\\Models\\User', 5, '{\"msg\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 350 \\u0631\\u0635\\u064a\\u062f \\u0644\\u0643\",\"points\":\"350\",\"teacher_name\":\"\\u0623\\u062d\\u0645\\u062f \\u0627\\u0644\\u0645\\u062d\\u0644\\u0627\\u0648\\u0649\"}', NULL, '2024-06-28 03:37:10', '2024-06-28 03:37:10'),
('54a2c40c-7f57-4233-87c0-f82e34e6db71', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 1, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('54a3f30b-ef73-43e1-9e31-9d7ee929d992', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 428, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:18', '2024-06-29 02:20:18'),
('54b80b71-4e71-47a1-82c8-14348e28e3d9', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 384, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('55d8d9f3-b304-4579-8da0-ad9ecf0e3d8f', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 5, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 February\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('5621cc08-976d-4627-a973-dfdd368ac040', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 25, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:33', '2024-06-29 02:55:33'),
('56b793dd-e999-42f8-8b94-18c5fd77b184', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 319, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('57221738-ce02-4e29-963c-5a86a35c9435', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 1, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('5833a74f-3078-45cf-bebf-8c6ec8dd14ee', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 321, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('583b2caf-d284-4d10-aead-1aacf7dcd5c1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 334, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('591f7cd5-7e26-4e3d-b30b-f15214514922', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 147, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('598a526a-e8c7-4d5b-a1be-570d8ccce14d', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 February\"}}', NULL, '2024-06-27 16:44:29', '2024-06-27 16:44:29'),
('59fbc705-b5d5-4997-9473-e81cb37c8fad', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 384, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('5a293b9c-0557-4b54-92ab-703e972ed1cc', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 288, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:16', '2024-06-29 02:20:16'),
('5a5d3aca-3efe-4ef8-bb26-24b52fb1f91b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 205, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('5a5f9ceb-0993-4919-8f76-14dd9172f9e7', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 320, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('5a8ef5b5-1a48-450b-90dc-fa7bfd6bb2c3', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 198, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('5aa76464-fa82-4772-9022-afd557e86f7b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 367, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('5b4ea388-0bd8-4bb8-9840-117da1519921', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 328, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('5b633bea-c438-4f58-9198-4ff7edb57fdc', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 415, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('5b8ccbaa-fca8-4be9-9c02-5032c073e0f4', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 3, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 March\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('5bfaa34c-a97d-41fa-9e8d-0e1c18155300', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 December\"}', NULL, '2024-06-27 16:44:29', '2024-06-27 16:44:29'),
('5bfd27e5-7bfe-442b-942b-fe12473fcbcc', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 393, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:38', '2024-06-29 02:50:38'),
('5c025116-5d35-4157-bfa2-14dbe7955a6b', 'App\\Notifications\\NotificationExam', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0627\\u0645\\u062a\\u062d\\u0627\\u0646 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('5c675d32-db05-42cd-acfa-6e134c60457f', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 366, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('5c78fea1-c497-455a-a76a-ed02f89b30d3', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 7, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('5c9212ef-bfe5-423f-aa1c-287c3f542823', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:35', '2024-06-29 02:50:35'),
('5d1c0703-d9ad-4c09-88c2-6d97d110783f', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 377, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('5d2488ad-b864-4af3-a6ff-7eb0c67494d8', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 436, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('5ddd913c-3337-4051-a574-1a61aea323f9', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 215, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('5dff5752-8975-41bf-a1e9-c92d7978a703', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 324, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('5e599783-da6d-4350-8243-1bbe2bb93a30', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 10, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:16', '2024-06-29 02:20:16'),
('5f273d3a-ae17-41da-bfc3-03217cdc870e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 288, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('5f2c8bd5-072d-42e9-9c69-3cc38e998464', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 258, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('5f62797b-46c8-44bc-a02b-8a56074c012d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 291, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('5fbed9c0-e496-4f5e-9798-46c5c94c20db', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 377, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('6024f6f3-d2c1-488a-9721-722c10eb8ffb', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 6, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 December\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('6028ca24-b4f3-41cd-bf35-b821abdc49ad', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 400, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('6155a6d8-cad7-4c0d-b9a8-aa8c5b10f827', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 437, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('61815d7d-958f-4571-99bc-5624298b3070', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 4, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 September\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('6181e6f5-d65e-4378-83b3-9e891d2a64a5', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}}', NULL, '2024-06-27 16:44:29', '2024-06-27 16:44:29'),
('6262dc8f-1194-4736-9d9b-cdb3c2dd4a13', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 389, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('62967131-f633-4c11-9076-8b591b34bca5', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 17, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('62991281-20ab-4fa4-8f86-c835a7f4c4c2', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 206, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('6339996e-7967-4301-8e94-b9bed5373036', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 356, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('63968f40-cf16-4129-86df-320a48c91d9e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 237, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('644104c1-0728-4f9e-b852-23f48cd702fc', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 November\"}}', NULL, '2024-06-27 16:44:29', '2024-06-27 16:44:29'),
('646f2622-b14a-4794-bbfc-54f4e6096e96', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 227, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('64af0dd9-0a7c-4508-a677-8bf9bb651c86', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 378, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('65669ca3-4a6a-45fb-8cd0-e89062e43176', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 25, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('65763fe0-d07e-4a34-993a-3c30af33176b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 439, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('65b5dcc0-1c91-4a98-a72a-dba5c9a0ae69', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 288, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('65ced119-9353-41fd-893e-4a1bcf6b6be5', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 274, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('66616fad-37d9-4c63-bbac-f04ac0c1e676', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 384, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('66e5aab6-b483-4d81-8dfc-e55f94b84f34', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 417, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('679f4d6d-63da-4a2f-833a-bc9632e6ab30', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 1, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('680f56d1-a6e6-4abc-a2ee-74af2f497534', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 350, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('686e2547-0ef1-4418-a879-efb213a9e8a1', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 376, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('68a45465-e975-4830-af08-a550d3d67b65', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 230, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('68c83d7b-8e02-49c4-b967-9bbda1c6e7dc', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 348, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('691d3ebd-7900-4aad-aa49-756f4a7423a7', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 321, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('69d2a9b0-8e4f-417e-8da1-926fc93b4b8b', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 4, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('6a426b24-97c6-4d90-a41e-db958f1f3f20', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 10, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('6a476639-83af-425e-b167-047cb06a8bc9', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 437, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('6ad49109-17f2-42b1-a48d-1121631541a1', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 329, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('6b2a3560-827d-4672-9e2c-f0c6094397de', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:16', '2024-06-29 02:20:16'),
('6b2f0dd3-6a45-4598-bcfe-78d75fa08590', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 334, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('6b635127-aeb0-4841-ad4e-c8dc81b4e1ce', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 5, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 November\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('6bc35b9f-d1f4-4a26-88cb-f772f8833c8e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 319, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('6c90b623-fc1f-434e-9791-5b623b68d77b', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 329, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('6d500df1-6bcc-454f-a35f-3396b9441ec9', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 319, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('6f97039e-7303-45a0-a411-ece7e7b2e11e', 'App\\Notifications\\NotificationExam', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0627\\u0645\\u062a\\u062d\\u0627\\u0646 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('6fe1cac9-8d73-45fd-ab5d-a853ae03fa3b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 272, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('70368fee-75c9-40f8-b498-cfae65247870', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 213, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('70d743ee-1bc9-4840-9583-abc65ed0f0b2', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 153, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('70f9cf80-aa5a-49b0-9c79-e12436d76349', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 438, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:18', '2024-06-29 02:20:18'),
('72562d04-50d2-401e-b70d-ce520c9faf3b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 337, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('727af4e5-c3ad-450c-93a0-f17e8a6dba9e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 331, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('72b019e1-56b4-4090-b0b4-61eb1742653b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 389, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('72ca0b51-64eb-4f7d-8da5-3425e44c5c77', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 425, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('72f97cdc-1783-418e-8ca4-0eba3664bef6', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 199, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('731d7133-4806-4ee3-8912-7d96f97b4daf', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 188, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('734a0d05-e3cc-4b4d-90fa-30a0443b1cf4', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 15, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('73afdf1e-7978-4377-9445-c507a262a4d6', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 425, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:38', '2024-06-29 02:50:38'),
('74254ee4-f3dc-4316-94de-3ea86a7abccc', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 358, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('74d9eba0-399f-4251-b0da-dfdd72372bd8', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 257, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('750158e1-f54e-4312-8c83-1b28ead3b9de', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 9, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('75a13036-f7ca-4d1b-85cc-6ba91ae5130e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 383, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('75bc630e-1e6f-4ea0-9d81-7a72222b7ffa', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 11, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('7616479c-d66d-45a4-ba25-3a686aef75c1', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 368, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('76bbc36e-6335-4ea6-951b-d60272bb9cbe', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 322, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('776f6ec3-e586-47d2-8528-3a3b9086bdb4', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 376, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('786e378c-4059-424c-a6b4-e88e7420b7b1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 315, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('789d2301-034d-4bf1-a4a9-1236031c3ee5', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 366, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('7927576d-ec4e-4062-ab41-99c258bca1a0', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 13, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('79bfef75-0a59-40bb-a347-325647f9d3ef', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 December\"}}', NULL, '2024-06-27 16:44:29', '2024-06-27 16:44:29'),
('7a6141e8-7f97-4afb-b9fa-ca32a04ad6f6', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 334, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('7c081852-18af-42ef-993d-698b19f57c2e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 376, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('7c08e673-76be-4d53-96b5-868a7bf65386', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 1, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 September\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('7c6d51c0-4819-480a-ab8d-2ccd53929e24', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 338, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('7c977ff8-cdf9-4156-bbda-fc48a080def9', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 11, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('7cce5143-283c-4546-b7ab-56d34317971d', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 306, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('7db94ed2-1828-4320-a454-f5bdffefe907', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 13, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('7dc15eec-80e1-4fcb-bd94-4e275d637990', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 368, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('7ddac563-4169-45c8-8757-d19d499782a1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 326, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('7ea4be44-57fa-464b-a708-cf1bdb551979', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 389, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:38', '2024-06-29 02:50:38'),
('7ee75b0e-0afe-4419-b958-de5640973e4b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 290, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('808c7410-a0e3-46ed-a8d2-c8c08b3ae692', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 169, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('8090cf28-cd9a-4e69-9b1a-1a19d0dd2b51', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 322, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('80ffc92b-3987-4d55-b8e9-a823595fdbae', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 322, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('81cf16b8-25ca-409a-b9a8-2301a4618f6e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 415, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('82609ee1-6a7f-412b-aab7-bf4d0fab2022', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 163, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('832ee822-0887-4d82-b782-3dc695037e23', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 330, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('83a9f81b-b84b-4188-86ed-57baf79c9ade', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 155, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('83b6380a-3226-4174-a7cc-d66ac2c9eb35', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 351, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('83d044bf-0882-449d-a66e-bfde3ea59f8f', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 5, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:33', '2024-06-29 02:55:33'),
('840f2249-fa37-4d0b-a9bf-4e6c08b6b4e9', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 170, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('842189d6-3ba0-41a3-8f9b-5729a916e34f', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 68, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('849f562d-071c-4db0-9b53-6e259c84c554', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 6, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 March\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('84bd2206-afc4-4fd9-9b2c-d2b451ffd6f1', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 400, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:38', '2024-06-29 02:50:38'),
('85b825fc-013a-4126-af8a-60f7e0eb5bfb', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 367, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('85cfa0e9-9a98-440c-9466-736296f21ebe', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 282, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('866048a7-61e0-481e-82e7-da79f0fad305', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 264, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('87953ba0-b50d-4d3e-8e59-bac830629497', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 135, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('87acbda3-73ff-4bd1-a43e-830526b8aaf6', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 229, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('87b0ff5a-05de-4a02-aa6c-720c8706f970', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 5, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:35', '2024-06-29 02:50:35'),
('87bd8fff-14b8-4c80-ae13-1eb1fa479817', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 383, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('8877e777-d28d-4c3a-a53f-76cec9188337', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 425, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('88c7ecdb-abf7-4913-87f3-c5b8249a77c5', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 321, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('890d15f1-8943-41e7-b581-4a58e5f844be', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 428, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('891bea2f-853d-4c6d-bce4-f1839101474d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 393, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('8a48cc6e-f2c4-47d8-a36a-31432b0c85ab', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 292, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('8a5ebe6a-d8ef-436e-967b-2d69ba90f5ca', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 207, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('8a9379c9-50aa-453c-b4ca-e85bc5e312f3', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 326, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('8ac87ba3-c067-4de3-9554-b52d691db7a0', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 176, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('8b119896-ade8-4cfe-986e-03c2c1de62ca', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 334, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('8b128257-cab3-4d12-aee4-b103e5a22d48', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 351, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('8b56b934-d598-4ec5-9891-1eea31cc832d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 281, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('8b6a1574-6ffd-4208-9bda-1de42f735dae', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 429, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('8c9426d0-e167-43df-aca1-a2646163b7fe', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 329, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('8cf88179-7b8d-4dad-b6fd-a684ce0e4cbe', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 320, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('8d9b3843-c48d-4e5e-af46-53acb8ee5b6d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 271, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('8e402938-c77e-48f9-996f-89b9013ade54', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 307, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('9002dca1-a930-42fc-8710-70c4a92ced55', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 1, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 April\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('90170756-e39d-4b3a-ba21-25c22f93e8b7', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 314, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('908d6cce-261b-4363-b798-85cfddaab1b9', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 330, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('911e85a7-f289-4d42-a6e0-440a4d649627', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 425, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('91765ed1-76ad-4f85-96e5-8da540352277', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 436, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('91dc81aa-c544-44f7-9744-5759d9c6d35c', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 288, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('93e0fd98-a313-4e2b-a682-613d23b84b6b', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 5, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 April\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('93e486ce-7598-44fb-adc4-c99f811f27c5', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 306, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('9555e945-8193-49a5-970b-ef88885fff9b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 162, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('964091a9-b8e2-4c80-ab43-d5ccbd86e184', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 367, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('96b90940-8886-4929-b3ee-28e6d0594e91', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 362, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('96f85dc9-5b1e-496b-b472-45623de1b7be', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 288, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('96fbbead-35da-46df-8cd4-b33531465a00', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 377, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('972d4a21-98e2-48a9-9f88-e39d733e35ea', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 244, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('974a8072-cedc-4f8c-9e0e-e6e7379b5976', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 438, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:38', '2024-06-29 02:50:38'),
('97e6b0ec-8b27-40ba-a4c9-95cb63d0b204', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 417, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('97f12ac7-b18e-4ce1-8229-eec721f8f8e8', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 5, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('982cfa1a-249a-406b-a0d8-c3eaed7de290', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 318, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('98bbc05e-45b3-4eca-9609-66056ed293a9', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 365, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('990347f6-ee23-4e21-b0be-efc42e804b97', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 393, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('999657d2-c16b-4cc8-9ad0-976cda37236f', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 400, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('999c9e5d-088a-47ab-9ff2-9c81821992a2', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 5, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('9a4d6154-bb33-4391-9eb7-ed8a0c09c6e1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 332, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('9b027864-5b52-4d5d-b6d7-7ffa84dcdba1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 417, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('9b2d77b9-f9a4-4b5c-ac0d-b0542b21c6c6', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 6, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('9b38568a-fe9b-48e4-91b6-4b34a630af3a', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 13, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('9b894162-bde2-419d-aa3b-45db3f027fde', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 3, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('9ba8f80e-38f4-4d60-9785-f056250a51cd', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 351, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('9bc31ca1-f31c-4565-9e8f-292ffade8810', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 353, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('9be1281e-49bf-48c8-b21d-59541b5a45fb', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 415, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('9c007d1e-8422-43c9-81d7-068ce80b76b1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 100, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('9d9e2811-cacc-4f1f-8f83-58713d25e179', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 232, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('9dfa6466-aaa6-482e-8ea4-22713b67480a', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 283, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('9e1e1dc7-390f-4657-a524-6ffe08afba57', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 185, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('9e3736c6-cefb-4e87-8e05-4dbd4baee9dc', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 4, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('9ea525d9-f235-448e-8b47-9bf686459004', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 365, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('9eadadd3-ac60-4a03-ba66-d1ca17e1388e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 333, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('9f687b36-6788-49d2-90bc-94ec36dcc49c', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 154, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('a033f5bf-039e-4c6e-8494-5c36aabed3dc', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 234, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('a0c32109-92e4-4cf9-96c7-82445fef3fa6', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 4, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 March\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('a17ec69b-5732-46e2-9fa1-b409515949a7', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 320, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('a19ffe05-819c-4aca-afab-b8e5d8083649', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 92, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('a1f61eb9-5bff-4022-a860-2541b53a9dd2', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 322, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('a22c0090-c39d-4b78-8775-efc6a4fcb619', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 261, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('a26bcbaf-4c5d-4879-815d-910f14d119a5', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 436, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('a38694e2-95ad-482e-8df2-fdf9c9b566d5', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 322, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('a4314edf-9616-49e3-b84a-a442f264bcfb', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 67, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('a4e2c90b-1737-43fc-bd8c-d33ba463068a', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 329, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('a5963c44-f1a2-4956-ad93-99017db23814', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 376, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('a68df013-5566-49ec-9a25-1cfe14cc62f1', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 1, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 November\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('a6c932f4-e119-4661-bcf4-695c8b18a806', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 428, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('a6ef549f-7f67-4128-9fda-f3d3cca07100', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 428, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('a8023ea0-d7ea-4f67-8906-a51b39a7c430', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 371, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('a81aaca3-9bf9-4c6f-862b-8c76bafe5b08', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 319, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('a97b9baa-de5d-4df1-ab47-6f1fee7fd66b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 326, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('a9adbb8d-7a59-4e8b-be58-8c401ba8a2f3', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 437, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('aa24af90-dfaf-44e7-91d2-173379f6e76e', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 6, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('aab82460-295e-487a-86ef-bd38372d95a1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 167, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('ab3e2944-b0fd-406d-a574-8d1c785c2587', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 367, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('ab6cb834-e4f0-4cbd-bbc1-a6a885b26566', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 5, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 March\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('ab766dad-1794-459e-b2f6-a281c3679ab8', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 348, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('ab91c047-c678-4f99-a3c0-67f32829fdb9', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 201, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('ac53bc25-91a5-4afb-b031-5c0b03f17dda', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 321, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('aca16245-26b0-41af-9acc-8dd8c9f00145', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 336, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:34', '2024-06-29 02:55:34'),
('acbe980c-dce9-4a44-a823-86f47beac071', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 4, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 February\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('accd30dd-0119-4f39-8c43-e3197d467731', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 13, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:16', '2024-06-29 02:20:16'),
('ad39fd46-9917-4d16-ac23-11823c5d9c2c', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 324, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('ad44d49c-b8b4-4ae6-8e29-de31a9bce03e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 366, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('adb3d2b3-ccea-4a64-a89f-0b21f98f6f80', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 223, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('ae1204a4-8afc-40c8-9452-919c20f958f6', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 220, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('af1a5370-7ccc-4810-96ad-040b00a4f7bd', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 6, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('af358417-26e9-4bfe-94f8-4bdcad534bc6', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 3, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 September\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('af7551e0-c783-4686-8dec-851c97a28313', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 326, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:34', '2024-06-29 02:55:34'),
('afc4ad19-0d02-4f23-96ee-e6837cef0059', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 April\"}}', NULL, '2024-06-27 16:44:29', '2024-06-27 16:44:29'),
('afebcaab-deae-4d4e-be87-1425cde50a46', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 204, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('b124a9b1-c1a3-46c6-a92d-bfb4befafbcc', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 7, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('b2df4b89-c2a5-4c2f-9006-56210e923b0d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 11, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('b3328396-859e-4f28-af96-396cd8b1e3ab', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 415, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('b41f8911-abd0-477d-8a42-6a1686362d52', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 69, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('b4c3096a-d25e-4fef-b4b8-e85947bbd499', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 400, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('b4d61461-f380-40b9-b740-f26dabf53700', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 279, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('b4fe2025-64c1-49d5-b1fb-d0f9978149c7', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 191, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('b57c721d-1012-4db8-abc8-5d74d8df4500', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 81, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('b58a3b3c-2985-411b-8323-49b05141880f', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 437, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:18', '2024-06-29 02:20:18'),
('b5add4aa-3d92-4b13-93e1-a71c4a1f09b4', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 137, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('b6e2dcfe-7337-4711-ba93-f1dbe0984ab1', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 319, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('b7fcf885-3411-43d5-9dbd-aa6cc01e66e2', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 6, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 September\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('b8e54d72-d01d-4ed8-9bf2-0d31c474b62b', 'App\\Notifications\\NotificationExam', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0627\\u0645\\u062a\\u062d\\u0627\\u0646 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 June\"}}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('b912e349-8fb3-4ec7-ab20-fa812e48e3e9', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 428, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('b9574817-5a40-4be3-b5ff-768c0abb89eb', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 1, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('b9be8c13-d4dc-46a4-915a-1889620c86f7', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 25, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:16', '2024-06-29 02:20:16'),
('bb47d6c8-923d-4caf-bb5f-3a7cdc9e56f1', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 288, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('bc8f4bef-8d9d-4a62-8392-7a9030ccbdaf', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 79, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('bceb27b3-917a-4043-9e59-a12580eebd35', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 336, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('bd054d42-695a-47d8-afd4-b65f36505c53', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 373, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('bd5e8168-2d9b-4919-8576-fcd53d4b2df2', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 77, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('bdf6622f-a472-49da-a044-ea98553bed7e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 334, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('be1b76ef-0ebe-4b01-8526-336c9edc8d61', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 62, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('be959867-079c-4704-9ee1-b3b1d1b100e7', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 246, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('bedbaee9-0d93-47e3-8d9d-f5f65231096d', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 428, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:38', '2024-06-29 02:50:38'),
('bf244df6-027c-4592-8daa-94f732f94dcd', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 335, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('bfb2ebc5-a313-4d3e-9dc6-50e672bfd878', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 415, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('c009bdcc-3911-40b0-b5e4-12377cba14ae', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 387, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('c03f9f33-1dbd-401e-880a-14812994a60c', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}}', NULL, '2024-06-27 16:44:29', '2024-06-27 16:44:29'),
('c0470836-3986-4cfb-8c69-4a74cb2bd23e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 348, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('c0645414-c66b-4d9c-9c15-84e2a5b77ab4', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 425, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:18', '2024-06-29 02:20:18'),
('c155cb60-0a07-4b64-93cd-3b15972c894d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 345, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('c18a062e-e579-45e8-b12d-867461979bf4', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 5, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('c1a6bbc7-182e-4b2c-a6f5-a3bd1d36c279', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 336, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('c1ea6534-61b0-4f58-81f4-7b8d40957ad2', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 367, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('c1fa1549-58ac-4356-9df4-b0febe1e5c19', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 186, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('c2843e84-2835-4d24-a2e2-c0ae3eb26e32', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 310, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('c2d8f206-abfc-4bc7-b3d8-6b4792204114', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 6, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 November\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('c39b7ffb-b68b-425c-9a6e-1841f898e04e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 14, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('c44c774b-bd3d-44fa-a11b-f5ab4e186f7d', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 371, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('c44f5518-39df-4050-bc60-710a88eb5957', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 351, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('c50bfc10-6c60-4931-a4c3-4f55b2d74178', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 323, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('c54f3b13-3941-4f51-a016-627dafe5cf56', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 371, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('c57a8596-8306-4f01-adc9-245b9414f630', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 157, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('c69476b1-ac88-470f-a772-b91f580f44da', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 366, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('c6d2de91-e4a5-42db-af33-543a1d6adf1e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 6, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 September\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('c729cc91-7796-4277-9ff1-c96828ee6c1d', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 13, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('c7480e10-7228-42d9-b6c2-c31cb5852bee', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 326, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('c7e44466-d400-4a52-a988-080e44ca8d31', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 11, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('c807a38b-a2fc-4fd4-854a-37fa5fdc028d', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 417, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('c8366dcd-e156-4052-96a3-b563fb6b61fd', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 228, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('c84f5a97-d195-4509-beb4-ec567805aa6b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 12, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('c8e155c7-9dfa-49db-83d3-7a83d5ee6c02', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 320, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('c92c7f3d-d0df-4d63-9c83-b15fa31e00fd', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 358, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('c9b406fc-6c5e-4a62-89ca-d1799aba4248', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 351, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('c9ebd15a-ff31-4947-a066-46f10e2aac89', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 58, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('c9fc5d8f-a74f-4699-bcda-48b3591d9444', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 326, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('c9fcecc0-0dc8-47ed-8b43-72ed9c8c18ac', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 320, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('cae93c23-9ce4-4078-b455-a82d86f86acf', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 November\"}', NULL, '2024-06-27 16:44:29', '2024-06-27 16:44:29'),
('cbecf0ef-fd36-4880-976a-04fd37607681', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 5, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 December\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('cc8b1727-2162-481b-a564-9b6269102d51', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 348, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:34', '2024-06-29 02:55:34'),
('cc9e6cbb-7251-4a96-b08d-05454e60565e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 365, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('ccf90f77-2756-4799-ba1d-b564f1b366d4', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 March\"}}', NULL, '2024-06-27 16:44:29', '2024-06-27 16:44:29'),
('cd2a95f0-4976-4f07-bd64-6618a4f5b22d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 249, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('cf10be53-cee8-486e-98aa-9f4fe51e3cef', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 378, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('cf2571a5-3cb3-48ba-a538-a1c8e3569715', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 393, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('cf578c26-5282-4eed-bba5-03dbc770f522', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 428, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('cf94a024-edf2-4dcf-a2f9-1e55f62a8d76', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 4, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('cfb03d6a-a030-4c11-9526-383f1ca20e42', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 375, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('cfd37f29-650a-4f49-8c04-34b4b34c47b3', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 4, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('d001d72b-601c-4a92-a31f-fb801176e37e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 389, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('d0e1eb9c-7bcd-4cb0-bf3e-e895e6f49e3e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 116, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('d0e55f90-b55c-4df3-8187-b17a66383e49', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 436, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:38', '2024-06-29 02:50:38'),
('d0f527fa-1f85-4c01-8e25-0230c3de4021', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 321, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('d123d0dc-2e2c-4711-b38e-03c12654bf93', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 3, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('d12850dd-b23b-443c-997d-6f709c70d9df', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 438, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('d1daf6ca-8dc3-4cc4-8482-6bbc779f1c9f', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 377, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('d1e0dcfe-396e-4987-b038-c830f92c4437', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 5, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:16', '2024-06-29 02:20:16'),
('d1f051c4-9e04-4a74-af76-bc5d7088c267', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 365, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('d206ddb5-6712-438b-8e11-80664bd47abe', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 276, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('d217b383-0993-4985-b3ac-7e728abb0cf3', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 122, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('d324254a-6c5f-4672-801e-99d444fb52cb', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 425, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('d3b4e36a-e571-4793-a46e-38bed39c7fb1', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 306, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('d44578af-2c89-42bd-82bd-013c4dd3b3dd', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 4, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 December\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('d51da51f-02cf-4959-a042-5a5a3f309795', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 358, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('d51e4423-6521-4be9-981c-c8b4c9ec85b6', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 358, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('d5632772-6b1a-4f23-aa41-b51904ed3824', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 1, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 February\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('d5837523-420f-4827-8b33-9f49c568fea6', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 332, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('d68c1699-3a6f-4836-b0aa-ef65689f6b8b', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 329, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('d6a15e38-4171-4599-8292-8331fc319a4e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 7, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('d6d4704e-a115-4850-86fe-ba4193848a56', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 393, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('d72e5384-f820-4ef7-bc31-417720338bd0', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 90, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('d863834d-20be-4d5f-af86-d65a0b176836', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 376, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('d9009c98-4ee3-4750-9c90-ac907952a09a', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 365, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('da7950ea-6316-4d9d-8571-2f72fd07a75e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 6, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 September\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('da84536f-eebe-45c4-a6d4-5fe0564006d0', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 3, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('daf77aee-c849-48cf-8a91-3357e222827f', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 130, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('daffe828-021e-45b1-965e-13fc5d14e7a2', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 5, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 September\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('db44fb3c-21ce-4821-a6e8-e4040a6ef442', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 381, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('db5f298d-21ec-4851-a617-7d5f6c0a615e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('dc4941a2-6252-4364-b571-137f7b0b910d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 5, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('dc4c9abc-dc47-4016-9443-b36b65849f5d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 405, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('dcb25738-9499-4f27-9f44-d02caca83765', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 3, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('dccdaf0a-63ac-46dd-bc2f-0cf3292fa8e1', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 438, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('dd5072a9-69f1-4947-87cf-cfe9bba57c9d', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 438, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('dde05a41-a85a-42ac-85fa-c6cb61f9eab5', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 324, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('e0286b4a-2573-48fe-a6c3-b02405acc9ff', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('e060e0a3-eaef-4686-95d8-bed350d14f54', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 September\"}', NULL, '2024-06-27 16:44:30', '2024-06-27 16:44:30'),
('e0c18b3d-dbab-483e-b5fe-75fa266c7ee3', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 7, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:16', '2024-06-29 02:20:16'),
('e1524e64-058f-4d8e-9354-eb0042409b03', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 159, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('e262bd6a-666e-47c1-88d8-19d215f14964', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 438, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:28', '2024-06-29 02:58:28'),
('e3368e0b-3609-407e-aff3-a4e8f7447326', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 378, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('e3423458-97d8-46d8-8aa6-5249125f75f4', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 294, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('e3b3fe99-9f1e-49a7-9618-f0642dce6cb5', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 391, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('e49be9ad-32cd-4086-a953-ae4c0992dde8', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 382, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('e4a57583-3d23-49df-86ad-104d9cd1696f', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 330, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('e4dcd4c3-72be-4aaa-afd5-e52a759d1cc1', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 389, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('e505b8d2-b6b3-483b-8b3f-4c2571b6b16f', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 288, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('e5254b67-4fdb-4063-a3e3-e31616fbe174', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 5, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('e53a433b-7f04-4dd1-8421-f1b35621fa14', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 436, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('e57e36ec-560b-4403-8182-a6044a4ec52b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 217, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('e5ad4735-0957-4eb9-bf19-32c96d4eeffa', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 377, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('e6ef7f28-e479-49bc-a6ee-b50888f73de9', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 400, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('e7551e70-c67b-4f5d-aa86-63c34fc4d544', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 97, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('e779dde1-c54e-41d6-914e-f5c064fdfaa1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 85, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('e7cd4e0a-c457-41a5-bf55-f0a1773c7449', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 88, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('e851bffc-fec1-424b-9710-000f8dd5a547', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 438, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('e8690c21-994e-4b6e-90d3-c787f5c459bf', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 415, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('e869e77f-3145-40d2-9563-4bf13511f126', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 2, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('e8c61f26-2707-4aa8-a570-bd08f2da0048', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 173, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('e94d473f-a697-4693-891d-7c7a33ae504c', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 194, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('e976acd1-f32f-4320-a3f1-4903924d6b4d', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 330, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('ea3e355a-b0a7-4381-a232-006e315c3bf5', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 336, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('ea4043a5-bd7c-4ba4-ba56-18c1685e2383', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:29', '2024-06-27 16:44:29'),
('ea645a41-7a30-41d3-9b62-674ac700f26e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 417, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('ebfeafb8-3bdb-4d63-88a2-ff22b6c922fc', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 322, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('ec570555-fe3f-484f-8ec9-fc11479bdc23', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 378, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('ecc68e4c-d69a-44ad-86e1-291325b39dae', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 386, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('ed1807d4-a1bd-4398-be15-d34f8cae497e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 332, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('ed4a7186-d289-476d-a286-dabf47e9bf64', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 4, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('ee33dca3-05d4-4533-a83c-521f2f2306f2', 'App\\Notifications\\NotificationExam', 'App\\Models\\User', 2, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0627\\u0645\\u062a\\u062d\\u0627\\u0646 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}}', NULL, '2024-06-27 16:44:26', '2024-06-27 16:44:26'),
('ee61d7a1-f02e-4fe5-a092-d462f691269e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 25, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('ee96c55e-b343-42f2-a8c5-45514aa88881', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 368, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('eea8aba3-5321-46be-b4cf-5dc62a2bd0f0', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 320, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('f0507e4a-3c96-4b61-b2ae-ad85e1ad0fd0', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 329, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:34', '2024-06-29 02:55:34'),
('f0948698-bc11-4456-9f64-4d596e988805', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 187, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('f0e94c64-234d-4677-a3ac-be1db70d3e37', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 325, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('f16f39d9-6de8-4a03-b94a-3a22d1502177', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 378, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:37', '2024-06-29 02:50:37'),
('f1a53fc6-d35a-46b0-8774-66508208ab98', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 34, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('f1ecae1e-a3e5-4c74-8295-6828f956c2bf', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 7, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('f1f2fd23-1ca9-45a5-96dc-0d0cf3d5b19d', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 11, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:33', '2024-06-29 02:55:33'),
('f24c3d42-c8f8-4dbe-93ec-aeafb0d67559', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 371, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('f2e4e644-f132-4604-891d-4021310877f2', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 365, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('f351b6e1-f44c-4572-b1b5-0ba003f0f43e', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 326, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:38', '2024-06-27 16:44:38'),
('f3d92766-5ddf-4e63-b2d3-87a24fe80c56', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 5, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}}', NULL, '2024-06-27 16:44:28', '2024-06-27 16:44:28'),
('f405039c-3b08-45bc-b1e3-5debf35fe8e0', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 348, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('f43229e7-603b-4d87-95ad-e88f802a7765', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 384, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-27 16:44:39', '2024-06-27 16:44:39'),
('f46b5852-ae0b-4ea8-94a2-d324bbecc895', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 364, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('f4aaf4ae-1c7d-4b65-85d3-bbd6b15d855c', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 321, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('f4d6890b-1b54-465c-ac09-acc314ff868b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 340, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('f57bb629-d51b-43fe-9a26-af86e8ce22c1', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 319, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:33', '2024-06-29 02:55:33'),
('f5f9d87a-0ab6-4e0f-bffe-a4bbe0b7012a', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 322, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('f600c0de-72de-4c04-b745-1e521ba76144', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 347, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('f61b3f19-e88b-4f4f-8196-43cb7edda2ec', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 358, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('f67268b6-96a4-44a5-a144-0cef066529f3', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 93, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('f680d08e-7461-4231-a167-518aedadac79', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 348, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u062c\\u062f\\u064a\\u062f \\u0646\\u0648\\u0641\\u0649\"}', NULL, '2024-06-27 16:44:40', '2024-06-27 16:44:40'),
('f6927e68-9045-4704-bcd8-7ae4d11620c6', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 304, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('f6991800-b29e-49f4-87b0-67ee09bac416', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 327, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('f69d7173-7d61-44f2-900c-a75c3b575f3c', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 260, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('f6e84f97-a289-4a0c-bad2-c2ce6bb7e137', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 60, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('f76d03a6-ece5-4340-8f44-dfd34ae3ad17', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 365, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('f7788ec6-4367-4a0e-8098-d1a02438ac08', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 247, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('f78a4b09-dec1-445b-927a-d49fd652ba31', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 395, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('f7a7361e-c283-484a-ba06-39e3957d4c71', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 197, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('f7bc4130-95c8-4e8e-977d-b7e5033833d1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 349, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('f807f5b0-8291-4674-9bbb-6fa144f131f7', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 11, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('f8ce82f2-f23e-4a6a-a66b-99046fb7903f', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 371, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('f9203d09-0d80-4e3c-84f6-08205b89d7ca', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 127, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('f951664d-4a9f-4ba9-aed6-b4416b4e5d7b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 355, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('f972b381-e353-4a3c-9c48-b5bbd119ab38', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 112, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:32', '2024-06-27 16:44:32'),
('f9eeeeaf-6468-469c-938b-ce5d45974bea', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 324, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u0637\\u064a\\u0641 \\u0627\\u0644\\u0630\\u0631\\u0649 \\u0634\\u0647\\u0631 \\u064a\\u0646\\u0627\\u064a\\u0631 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:50:36', '2024-06-29 02:50:36'),
('fa132438-737f-47f7-8ad5-c99dfa9cd5b2', 'App\\Notifications\\NotificationBook', 'App\\Models\\User', 1, '{\"msg\":{\"success\":true,\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0643\\u062a\\u0627\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 October\"}}', NULL, '2024-06-27 16:44:27', '2024-06-27 16:44:27'),
('fa41b3b4-bcc5-4bc0-9aa8-d4cbe4011fda', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 296, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:35', '2024-06-27 16:44:35'),
('faefa4b8-b983-4a9b-9858-7b8ce202ddd4', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 435, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('fc3e9b26-abe4-48d9-a430-f2b485f5510e', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 212, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('fc71a488-ced2-48ed-af76-805e14ad82bb', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 368, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('fc84904a-9142-4d84-8d09-a379f07d2ff9', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 332, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0634\\u0631\\u062d \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0643\\u064a\\u0631\\u0634\\u0648\\u0641 \\u0644\\u0634\\u0647\\u0631 \\u0623\\u063a\\u0633\\u0637\\u0633\"}', NULL, '2024-06-29 02:58:27', '2024-06-29 02:58:27'),
('fc8bc0ca-1fbc-48ed-b761-7d184ef9c031', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 344, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('fc952ec9-4fef-4e89-b6d0-8a94bf4762e9', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 371, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u0641\\u064a\\u062f\\u064a\\u0648 \\u062c\\u062f\\u064a\\u062f \\u0644\\u0634\\u0647\\u0631 January\"}', NULL, '2024-06-29 02:20:17', '2024-06-29 02:20:17'),
('fcdc5371-5f2b-42b1-8bbb-d6c53bd5b951', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 306, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('fd029960-7ee2-449d-ae68-5756bb7e1e29', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 10, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 3\"}', NULL, '2024-06-27 16:44:37', '2024-06-27 16:44:37'),
('fd0f2247-1410-47b3-9646-e78d420c90df', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 343, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:36', '2024-06-27 16:44:36'),
('fd3b4d95-a23e-4eeb-a0fc-1f07fb15a0da', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 384, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('fd56fd47-55ca-4d6a-9544-7db3cbb32805', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 13, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:33', '2024-06-29 02:55:33'),
('fd96baa2-d024-4e20-a802-b9824c278c02', 'App\\Notifications\\NotificationLesson', 'App\\Models\\User', 377, '{\"msg\":\"\\u062a\\u0645 \\u0631\\u0641\\u0639 \\u062f\\u0631\\u0633 \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0649 \\u0648\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0623\\u0648\\u0645 \\u0644\\u0634\\u0647\\u0631 August\"}', NULL, '2024-06-29 02:55:35', '2024-06-29 02:55:35'),
('fdb8ea56-5cb5-487f-9673-a16e4df7672b', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 253, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:34', '2024-06-27 16:44:34'),
('fdd9bd5c-bfc8-42ad-87ab-2b2694affe48', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 164, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33'),
('fee130b1-86f5-4377-a964-89ae47cdca03', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 18, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:31', '2024-06-27 16:44:31'),
('ffd187fb-f5d5-4cf0-a97d-9563b5d33ad1', 'App\\Notifications\\NotificationPost', 'App\\Models\\User', 172, '{\"msg\":\"\\u062a\\u0645 \\u0646\\u0634\\u0631  \\u0628\\u0648\\u0633\\u062a \\u0645\\u062a\\u0643\\u064a\\u0634 2\"}', NULL, '2024-06-27 16:44:33', '2024-06-27 16:44:33');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `pin_code`, `expired_at`, `token`, `created_at`, `updated_at`) VALUES
('ag1088768@gmail.com', '998502', '2024-06-30 04:49:00', NULL, '2024-06-30 04:39:00', '2024-06-30 04:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `value` double(8,2) DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT 'status:0 error,status:1 done',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `value`, `image_url`, `user_id`, `teacher_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 300.00, 'payments/payments_667d884c5ac3f.jpeg', 5, NULL, 0, '2024-06-27 16:42:04', '2024-06-28 03:37:09', NULL),
(2, NULL, 'payments/payments_6680d0503276d.jpg', 1, NULL, NULL, '2024-06-30 04:26:08', '2024-06-30 04:26:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `image_url`, `unit_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'بوست 1', 'وصف بوست 1', 'posts/1948100_0.jpeg', 10, 1, 1, NULL, '2024-06-11 12:51:18', '2024-06-15 13:49:30'),
(3, 'بوست 2', 'وصف بوست 2', 'posts/13516627_859008637533582_3833102901120275455_n.jpg', 10, 1, 1, NULL, '2024-06-11 12:51:59', '2024-06-11 12:55:18'),
(4, 'التيار الكهربى', 'أولًا: أكمل:\r\n1. عندما يمر تيار كهربي 3A عبر نقطة من دائرة كهربية، فإن الشحنة الكهربية التي تمر خلال دقيقة تساوي....\r\nQ=IT=3x60=180C\r\n\r\n2. فرق الجهد بالفولت المطلوب لكي يمر تيار مقداره 3A خلال مقاومة 6Ω يساوي....\r\nV=IR=3x6=18V\r\n\r\n3. إذا كان فرق الجهد بين طرفي مقاومة 2Ω يساوي 6V فإن شدة التيار التي تمر فيها تساوي....\r\nI equals V over R equals 6 over 2 equals 3 straight A', 'posts/d7c36e75-cecc-48b1-a7cc-a0509892ce1d.png', 10, 1, 1, NULL, '2024-06-11 12:57:04', '2024-06-15 13:49:26'),
(5, 'ميكانيكا تقليدية', 'الميكانيكا التقليدية (بالإنجليزية: Classical mechanics)‏ هي الفرع الأقدم في علم حركة الأجسام (الميكانيكا)، وهي تهتم بدراسة القوى الواقعة على الجسم وحركته ونظم الجسيمات في فضاء إقليدي ثلاثي الأبعاد ومحاولة صياغة تلك العلاقات في قوانين فيزيائية، تسمح باستنتاج سير الحركة المستقبلية على أساس معرفة الظروف الابتدائية. توارد مصطلح الميكانيكا الكلاسيكية للدلالة على المنظومات الرياضية التي أرساها إسحاق نيوتن، بشكل أساسي، ويوهانز كبلر وغاليليو غاليلي والتي ظلّت سائدة منذ القرن السابع عشر حتى ظهور النسبية الخاصة والنسبية العامة التي صاغها أينشتاين خلال السنوات 1905 - 1916 وميكانيكا الكم التي اشترك في صياغتها ماكس بلانك وهيزنبرج وشرودنجر وديراك في بداية القرن العشرين بين 1900 - 1928.\r\n\r\nفي البداية كانت الميكانيكا الكلاسيكية والمشار إليها بالميكانيكا النيوتنية تهتم بصفة أساسية بتفسير حركة الكواكب والأجسام على الأرض بواسطة أساليب التحليل الرياضي، ولا سيما الحساب التفاضلي، التي وضعها نيوتن بنفسه بالتزامن مع لايبنتز. وفي ما بعد قام لاغرانج وهاميلتون بإعادة صياغة وتبسيط حسابات الميكانيكا التقليدية وذلك بالاعتماد على أن حركة الجسم تخضع لوجود حد أدنى من الطاقة الكامنة دون اللجوء إلى توازن القوى والتسارع (قانون نيوتن الثاني). كما تدخل النظريات الخاصة بتأثير الحرارة على الغازات والأجسام والمعروفة الديناميكا الحرارية ومن المساهمين في هذا المضمار بويل وبولتزمان وكذلك صياغة نظرية الكهرومغناطيسية على يد ماكسويل كلها تنتسب إلى الميكانيكا التقليدية ونظرية النظم الديناميكية.\r\n\r\nوقوانين الميكانيكا الكلاسيكية تنجح في وصف حركة الأجسام عند السرعات البطيئة والصغيرة بالنسبة إلى سرعة الضوء. وتبلغ سرعة الضوء 300 ألف كيلومتر/ثانية. أما إذا اقتربت سرعة الجسم من سرعة الضوء، فيجب الحساب باستخدام النظرية النسبية حتى لا تحدث فروق بين الحساب والمشاهدة إذا اتبعنا طريقة نيوتن. وكذلك لا تأخذ الديناميكا التقليدية التأثيرات الكوموية في الحسبان. وتلك التأثيرات الكمومية لا بد من أخذها في الاعتبار عند دراستنا لخواص المادة وحركتها في الحيز المجهري أي عند تعاملنا مع الجسيمات الذرية وتحت الذرية. مثل التشعب والشواش. كما تعتبر الميكانيكا التقليدية أداة العديد من التطبيقات التقنية الحديثة (مثل الهندسة المدنية، الملاحة الفضائية، الإنسالية).', 'posts/2145.png', 10, 1, 1, NULL, '2024-06-15 09:47:06', '2024-06-15 14:15:09'),
(6, 'فيزياء فلكية', 'الفيزياء الفلكية فرع من أفرع علم الفلك التي توظف مبادئ الفيزياء والكيمياء لدراسة طبيعة الأجسام الفلكية، فضلا عن مواقعها وحركتها في الفضاء. يدرس علم الفيزياء الفلكية أجساماً كالشمس، النجوم الأخرى، المجرات، كواكب النجوم الأخرى، الوسط البين-نجمي، وإشعاع الخلفية الكونية الميكروي. فيتم دراسة ما تصدره هذه الأجسام من إشعاعات عبر الطيف الكهرومغناطيسي بأكمله. كما يتم دراسة باقي خصائصها مثل السطوع، الكثافة، الحرارة، والتركيب الكيميائي. ولأن الفيزياء الفلكية علم شديد الاتساع، فإن الفيزيائيين الفلكيين كثيرا ما يطبقون العديد من أفرع الفيزياء، بما في ذلك الميكانيكا، الكهرومغناطيسية، الميكانيكا الإحصائية، الديناميكا الحرارية، الميكانيكا الكمية، النسبية، الفيزياء النووية وفيزياء الجسيمات، والفيزياء الذرية والجزيئية.\r\n\r\nعمليا، تنطوي الأبحاث الفلكية الحديثة على قدر كبير من أفرع الفيزياء النظرية والرصدية. فبعض حقول الفيزياء الفلكية تتضمن محاولات لتحديد خصائص المادة المظلمة، الطاقة المظلمة، والثقوب السوداء، وما إذا كان السفر عبر الزمن ممكنا، أو إمكانية تكون ثقوب دودية، أو إمكانية وجود أكوان موازية، وكذلك أصل الكون وقدره المحتوم. كما تدرس الفيزياء الفلكية النظرية مواضيعاً مثل ولادة النظام الشمسي وتطوره (الديناميكا والتطور النجمي)، ولادة المجرات وتطورها، الهيدروديناميكا المغناطيسية (الأجرام الكبيرة في الكون)، أصل الأشعة الكونية، النسبية العامة والفيزياء الكونية، وكذلك فيزياء الأوتار الكونية وفيزياء الجسيمات الفلكية.', 'posts/2145.png', 10, 1, 1, NULL, '2024-06-15 09:52:30', '2024-06-15 14:13:53'),
(7, 'ملخص قوانين الفيزياء', 'ثانوية عامة \r\n🛑 ملخص قوانين الفيزياء \r\nلا يخرج عنهم افكار الامتحان - مهم جدا \r\nشير و منشن علشان الكل يستفاد \r\nبالتوفيق و النجاح للجميع ❤️', 'posts/438164348_835176471989652_6494634417182045628_n.jpg', NULL, 1, 1, NULL, '2024-06-15 13:57:35', '2024-06-15 13:57:35'),
(8, 'تسعة أسئلة إذا أجبت إحداها ستحصل على جائزة نوبل', 'هذا المقال كتبته الشابة النابغة الشهيدة تسنيم حجازي، حلمت بمشاركة علمها ومقالاتها مع العالم، لكنها رحلت عن عالمنا قبل أن تكمل مسيرتها، ولكن روحها ستبقى حاضرة بيننا من خلال كلماتها التي أضاءت بها هذا المقال. \r\n\r\nخلال العقود الثلاثة الأخيرة أحدثت ميكانيكا الكم والنسبية لاينشتاين ثورة كبيرة في علم الفيزياء، وكل اكتشاف جديد يقود إلى متاهات وطرح أسئلة أكثر، ففي عام 1900 صرّح العالم الفيزيائي لورد كلفن بأنه “لن يكون هناك اكتشافات جديدة في الفيزياء بعد الآن وما تبقى عبارة عن قياسات أكثر دقة يمكن إجرائها فقط”، ولكن ما حدث بعد ذلك أثبت للعلماء بأن معرفتنا في الفيزياء ما زالت بعيدة عن الاكتمال، ومع كل اكتشاف يتضح بأن الكون أكبر وأعقد مما نتخيل، فما هي الأسئلة التسعة التي يمكن أن تقودك إلى جائزة نوبل؟ تابع معي عزيزي القارئ علّ إجابة إحدى هذه الأسئلة تكون على يدك.', 'posts/image-04.png', NULL, 1, 1, NULL, '2024-06-15 14:10:34', '2024-06-15 14:10:34'),
(9, 'اكتشف سر قوة الليزر: تعرف على خصائصه المدهشة، ومكوناته الاساسية، وكيف يعمل؟', 'الفيزياء الفلكية فرع من أفرع علم الفلك التي توظف مبادئ الفيزياء والكيمياء لدراسة طبيعة الأجسام الفلكية، فضلا عن مواقعها وحركتها في الفضاء. يدرس علم الفيزياء الفلكية أجساماً كالشمس، النجوم الأخرى، المجرات، كواكب النجوم الأخرى، الوسط البين-نجمي، وإشعاع الخلفية الكونية الميكروي. فيتم دراسة ما تصدره هذه الأجسام من إشعاعات عبر الطيف الكهرومغناطيسي بأكمله. كما يتم دراسة باقي خصائصها مثل السطوع، الكثافة، الحرارة، والتركيب الكيميائي. ولأن الفيزياء الفلكية علم شديد الاتساع، فإن الفيزيائيين الفلكيين كثيرا ما يطبقون العديد من أفرع الفيزياء، بما في ذلك الميكانيكا، الكهرومغناطيسية، الميكانيكا الإحصائية، الديناميكا الحرارية، الميكانيكا الكمية، النسبية، الفيزياء النووية وفيزياء الجسيمات، والفيزياء الذرية والجزيئية.\r\n\r\nعمليا، تنطوي الأبحاث الفلكية الحديثة على قدر كبير من أفرع الفيزياء النظرية والرصدية. فبعض حقول الفيزياء الفلكية تتضمن محاولات لتحديد خصائص المادة المظلمة، الطاقة المظلمة، والثقوب السوداء، وما إذا كان السفر عبر الزمن ممكنا، أو إمكانية تكون ثقوب دودية، أو إمكانية وجود أكوان موازية، وكذلك أصل الكون وقدره المحتوم. كما تدرس الفيزياء الفلكية النظرية مواضيعاً مثل ولادة النظام الشمسي وتطوره (الديناميكا والتطور النجمي)، ولادة المجرات وتطورها، الهيدروديناميكا المغناطيسية (الأجرام الكبيرة في الكون)، أصل الأشعة الكونية، النسبية العامة والفيزياء الكونية، وكذلك فيزياء الأوتار الكونية وفيزياء الجسيمات الفلكية.', 'posts/Screenshot-2024-06-01-at-2.49.19 PM-390x220.jpg', NULL, 1, 1, NULL, '2024-06-15 14:12:28', '2024-06-15 14:12:28'),
(18, 'النظرية الموحدة العظمى', 'النظرية المُوَحَّدَة العظمى أو الكبرى grand unified theory أو اختصارا GUT هي إحدى نظريات الحقل الموحد المتشابهة أو نماذجها الفيزيائية التي تحاول توحيد ما يعتبر تناظرات غيجية gauge symmetry للقوى الأساسية : فوق الشحنة hypercharge ، القوة الضعيفة والكرموديناميك الكمومي quantum chromodynamics أو (QCD). ترتكز نظريات التوحيد العظمى على فكرة أنه في الطاقات العالية جدا، جميع التناظرات لها نفس قوة التزاوج الغيجية، وهذا يتوالف مع حقيقة أنها تعبيرات مختلفة لتناظر غيجي واحد. أي أن نظريات التوحيد العظمى تتنبأ أنه في الطاقات العالية فوق \r\n10\r\n14\r\n{\\displaystyle 10^{14}} GeV : فإن القوة الكهرومغناطيسية والنووية الضعيفة والنووية القوية تندمج في قوة موحدة وحيدة. (Parker, B 1993, \'Overcoming some of the problems\', pp. 259–279)\r\n\r\nضمن هذا الإطار : يأمل الفيزيائيون التوصل إلى توحيد بين القوى الكهرومغناطيسية والنووية الضعيفة في القوة الكهروضعيفة ، كما أنجز عمل كبير لتوحيد القوة الكهروضعيفة والكروموديناميك الكمومي لينتج تآثرات كروموديناميك كمومي-كهروضعيفة تدعى أحيانا القوة الكهروقوية electrostrong force. ويبقى هناك تطلع بأنه يمكن أن توحد قوة الثقالة مع التناظرات الغيجية الثلاث الأخرى لإنتاج نظرية كل شيء.', 'posts/1948100_0.jpeg', 10, 1, 1, NULL, '2024-06-11 12:51:18', '2024-06-15 13:49:30'),
(19, 'جاذبية كمية حلقية', 'الجاذبية الكمية الحلقية هي نظرية في الجاذبية الكمومية تحاول دمج ميكانيكا الكم مع النسبية العامة، بما في ذلك دمج المادة الموجودة في النموذج المعياري بالنطاق المؤسس للحالة الصرفة للجاذبية الكمومية. تتنافس الجاذبية الكمية الحلقية مع نظرية الأوتار بصفتها مرشحًا للجاذبية الكمومية.\r\n\r\nوفقًا لآينشتاين فالجاذبية ليست قوة؛ هي خاصيّة للزمكان ذاته. حتى الآن، فشلت كل المحاولات لاعتبار الجاذبية قوةً كمومية أخرى مساوية للقوى النووية والكهرومغناطيسية، والجاذبية الكمية الحلقية هي محاولة لتطوير نظرية كمومية للجاذبية ترتكز بشكل أساسي على صيغة آينشتاين الرياضية بدلًا من معاملة الجاذبية بصفتها قوة. في نظرية الجاذبية الكمية الحلقية يُكمم الزمان والمكان بنفس الطريقة التي تُحول فيها كميات مثل الطاقة والزخم في ميكانيكا الكم. تعطي النظرية صورةً فيزيائية للزمكان يكون فيها الزمان والمكان حبيبيّا الشكل وينفصلان مباشرةً بسبب التكميم مثل الفوتونات في النظرية الكمومية للكهرومغناطيسية ومستويات الطاقة المنفصلة للذرات. إن تضمين الفضاء المُكمم يعني وجود أقل مسافة.\r\n\r\nتُفضل بنية المكان خيطًا مثاليًا إلى أقصى حد أو شبكة محبوكة من الحلقات المحدودة. يُطلق على هذه الشبكات من الحلقات شبكات اللف. يملك تطور شبكة اللف، أو رغوة اللف، مقياسًا على طول بلانك أي ما يُقارب  متر، والمقاييس الأصغر لا معنى لها. ولهذا، ليست المادة فقط بل المكان يُفضل بنية الذرات.\r\n\r\nتتضمن مناطق البحث الواسعة حوالي 30 مجموعة بحث حول العالم. تتشارك جميع هذه المجموعات الافتراض الفيزيائي الأساسي والتوصيف الرياضي للمكان الكمومي. تطور البحث في اتجاهين: الجاذبية الكمية الحلقية المُقننة الأكثر تقليدية والجاذبية الكمية الحلقية المتلازمة الأحدث المسماة نظرية رغوة اللف.\r\n\r\nيُطلق على النتائج الأكثر تطورًا للنظرية المطبقة على علم الكونيات، علم الكونيات الحلقي الكمي، وهي دراسة الكون البدائي وفيزياء الانفجار العظيم. ترى أعظم نتائج هذه الدراسة تطور الكون مستمرًا ما وراء الانفجار العظيم ويُطلق عليها نظرية الارتداد العظيم.', 'posts/13516627_859008637533582_3833102901120275455_n.jpg', 10, 1, 1, NULL, '2024-06-11 12:51:59', '2024-06-11 12:55:18'),
(20, 'نظرية ام', 'نظرية - إم (بالإنجليزية: M-theory)‏ واحدة من الحلول المقترحة لنظرية كل شيء التي يفترض بها أن تدمج نظريات الأوتار الفائقة الخمس مع الأبعاد الأحد عشر للثقالة الفائقة Supergravity.\r\n\r\nقدمت النظرية من قبل الأستاذ إدوارد ويتن الذي يصرح شخصياً بأن هذه النظرية ما تزال تحتاج للكثير من العمل الرياضي وإيجاد أدوات رياضية جديدة لتطوير وإدراك مضامين هذه النظرية.\r\n\r\nفكرة مبسطة حول النظرية\r\nنظرية - إم واحدة من الحلول المقترحة لنظرية كل شيء التي يفترض بها أن تدمج نظريات الأوتار الفائقة Superstrings الخمس مع الأبعاد الأحد عشر للثقالة الفائقة Supergravity. قدمت النظرية من قبل الأستاذ إدوارد ويتن الذي يصرح شخصيا بأن هذه النظرية ما تزال تحتاج للكثير من العمل الرياضي وإيجاد أدوات رياضية جديدة لتطوير وإدراك مضامين هذه النظرية.\r\n\r\nمن المعلوم أن نظرية الأوتار جاءت كمحاولة ناجحة جدا لتوحيد القوى الأساسية الأربع (الكهرومغناطيسية-النووية القوية -النووية الضعيفة- الجاذبية) في عشرة أبعاد وتظل هي الأمل الوحيد في توحيدها والدمج ما بين ميكانيكا الكم التي تصف القوى الثلاث والنسبية العامة التي تصف مبدأ الجذب العام لنيوتن دحضا، ولكن لماذا ظهرت نظرية-إم ؟ سؤال الظهور والبروز و الوجود سؤال يجول في عوالمنا الكونية، فنظرية-إم تجلى ظهورها بعد بروز خمس معادلات في نظرية الأوتار وبالتالي تكونت خمس نظريات وكل نظرية تحمل معادلة معينة تخول لها تفسير محتوياتها من التعنين، فكل من هذه المعادلات النظرية تصف شيئا محددا فكان ذلك عبارة عن مشكلة ومعضلة في جب نظرية الأوتار حيث أن اكتمالها لا ولن يتم إلا بالجمع بين النظريات والمعادلات الخمس للأوتار، أي الجمع بين النموذج الأول من نظرية الأوتار، والنموذج الثاني A من نظرية الأوتار، والنموذج الثاني B من نظرية الأوتار، إضافة إلى نظرية الأوتار HE, و نظرية الأوتار HO . في البداية ظهرت العديد من الظنون التي تقتضي بأن كل معادلة من النظريات الخمس للأوتار مستقلة ولا تجتمع في شيء معين ليتم الدمج والمزج بين محتويات هاته النظريات والمعادلات الخمس، والسؤال الآخر هو لماذا قوى الجاذبية تكون ضعيفة جداً بحسب المرجع المكاني المتخذ، وكيف يستطيع مغناطيس صغير رفع مسمار من على الأرض رغم صغر حجمه وقوته الجذبوية الضعيفة مقارنة بالأرض وحجمها الكبير ومنطلق مراكزها الجذبوية ذات تأثير جذبوي عالي على الماديات الباريونية ؟\r\n\r\nتبين لاحقاً التكافؤ المنعقد بين المعادلات الخمس التي تكون وتجمع النظريات الخمس للأوتار . و في عام 1995 طرح إدوارد ويتين نظرية-إم كنظرية ذات أبعاد مضافة تلخص العلاقات بين النظريات الخمس فيما يعرف بالازدواجيات أو المثنويات التي تزيل الفروق مثل : المثنوية-T التي تزيل الفروق بين المسافات الصغيرة والكبيرة والمثنوية-S التي تزيل الفروق بين التفاعلات القوية والضعيفة وكذا نظرية الثقالة الفائقة ومن ثم تولدت نظرية-إم التي توحد الأنواع الخمس من نظرية الأوتار الفائقة حيث أن عدد الأبعاد فيها يكمن في 11 بُعد بَعدَ أن أضيف بعد آخر لها حيث أن البعد المضاف على الأبعاد العشرة القبلية يسهم في الرفع من التمددات الطارئة على مستوى الأنسجة الوترية للماديات الكونية .\r\n\r\nأصل الحرف إم\r\nلا يوجد معنىً حقيقي لحرف إم، حتى إدوارد ويتن لم يعلم تماماً ما هو حرف إم في اقتراحه الاسم M-theory، (مع أنه صرح في أحد المرات مازحاً أن حرف إم يدل على الغموض والسحر والتشويق mystery).\r\n\r\nيُعتقد أيضا أن حرف إم يعني الغشاء MEMBRANE , وعليه سميت النظرية بنظرية الغشاء، فبحسب النظرية نحن نعيش بعالم داخل غشاء من 11 بُعد في كون مؤلف من عدة أغشية في أبعاد أكبر، وهذه الأغشية تتحرك حركة معقدة جداً، لانستطيع أن نشعر بها. في الحقيقة الجسيمات التي نتكون منها لا تستطيع الانتقال والدخول إلى عده أغشية أخرى لأن تكوين جسيماتنا عبارة عن أوتار مفتوحة، غير قادره على الانتقال، رغم أن الاغشية (كما يُعتقد) متصلة ببعضها البعض ومتداخلة.\r\n\r\nنتائج النظرية\r\nإذا كان الكون عبارة عن غشاء فلماذا نرى الأشياء منفصلة ؟ تفسر النظرية هذا بأن جسيماتنا تستقبل ترددات الجسيمات التي لها نفس التردد ولا تستقبل الترددات الأخرى، بالتالي فإن هذه الأوتار لاتستطيع الانتقال بعكس الأوتار المغلقة من مثل جسيم الجرافيتون الحامل للجاذبيه. إذاً تم حل لغز ضعف الجاذبية، فالجرافيتون هو وتر مغلق ينتقل عبر الأغشية إلى أكوان أخرى موازية، أي أن ضعف الجاذبية سببه تأثير جرافيتونات الغشاء الآخر .\r\n\r\nكيف تستطيع النظرية استيعاب الانفجار العظيم ؟ ببساطة كان هنالك غشاء مماثل لغشائنا حجما فحدث اصطدام مهول بينهما أدى إلى انفجار عظيم في غشائنا بالتالي فإننا نستنتج أن هناك عدد هائل من ولادات أكوان أخرى .\r\n\r\nرغم هذه النتائج ومع أن نظرية-إم وحدت النظريات الخمس إلا أنها تصف الأوتار ذات الطاقات المنخفظة وتفشل في وصف الأوتار ذات الطاقات العالية ولهذا يجب أن تتطور هذه النظرية لتصبح مكتملة، باستخدام صيغ رياضية جديدة .\r\n\r\nشرح النظريات الخمس للأوتار والعلاقة التي تجمع فيما بينها\r\nنظرية الأوتار البوزونية\r\n\r\nالنظرية البوزونية هي نظرية تصف البوزونات فقط (أي الجسيمات البوزونية التي تتبع إحصاء بوز-أينشتاين ) و لا تصف أي نوع من الفرميونات(الجسيمات الفرمية التي تتبع إحصاء فيرمي-ديراك ) حيث أن أبعادها تكمن في 26 بعد حيث أن هاته الأبعاد لا تملك أي تماثل أو أي تناظر تماثلي فيما بينها، والتماثل الفائق يعني أن لكل بوزون موجب نظير سالب فرميوني، وهذا لا يتواجد على مستوى نظرية نظرية الأوتار البوزونية، وعند إدخال التماثل الفائق تظهر نظرية جديدة تسمى نظرية الأوتار الفائقة تتكون من 10 أبعاد . نظرية الأوتار البوزونية تعتبر الوتر جسيم ذري عبارة عن ذرة جسيمية ويفترض أن هذا الجسيم يسير بسرعة تفوق القوة النوعية المسرعة لسرعة الضوء ضوء . كما أن نظرية الأوتار البوزونية تصف الأوتار المفتوحة والمغلقة، وعند إدخال التماثل الفائق تنتهي النظرية وتظهر نظرية الأوتار الفائقة التي تشمل النظريات الخمس بمعادلاتها المتتالية . * النموذج الأول من نظرية الأوتار\r\n\r\nالنموذج الأول من نظرية الأوتار هو نموذج من عشرة أبعاد يصف الأوتار المفتوحة ذات النهايتين والأوتار المغلقة التي ليس لها تملك أية نهاية على الإطلاق، هذا ما يجعلها مميزة ومختلفة عن باقي النظريات الأخرى كالنموذج الثاني A من نظرية الأوتار والنموذج الثاني B ) ، حيث يكمن الفرق فيما بين النموذج الأول من نظرية الأوتار والنموذج الثاني في التواجد المحدث من طرف ذرة التاكيون .\r\nالنموذج الثاني من نظرية الأوتار\r\nفي البداية النموذجين باثنينهما يصفان الأوتار المفتوحة في عشرة أبعاد . حيث تختلف الفرميونات بطبيعتها وفي هذه الحالة نتحدث عن الفرميونات العديمة الكتلة مع وجود اختلاف صغير في معادلات النظريات الخمس للأوتار حيث يتصل النموذجان الثاني A و B عن طريق المثنوية-T .فإذا كان النموذج الثاني من نظرية الأوتار A يضاهي ويماثل النموذج الثاني من نظرية الأوتار B فإنه بإمكاننا القول إن وجد قطر دائره R فإن النتيجة التي يمكن استخلاصها من النموذج الثاني A هي ذاتها التي يمكن استخلاصها من النموذج الثاني B لكن اطراديا مع هذا الأخير حيث أن قطر الدائرة R في النموذج الثاني A المستخلص يصبح 1/R في النموذج الثاني B (حسب المثنوية ) فإذا وصفنا فضاء بالنموذج الثاني A من نظرية الأوتار فإنه يوصف بشكل آخر طبقا لمبادئ النموذج الثاني B من نظرية الأوتار، أي أن ما استخلص من النموذح الثاني A يوصف في النموذج الثاني B لنظرية الأوتار بشكل مكافئ بالرغم من أن اختلافيه هما اللذان يعطيان سمتا الوجود للنظريتين الثانويتين A و B. هذا بسبب النتائج التالية : * - النتائج المستخلصة هي ذاتها التي تكمن في كل من الفيزياء الكمية والميكانيكا الكلاسيكية .*- يمكن أن يبنى حيز من الفضاء بلصق الحلقات المرئية فيما بينها .\r\nالتقصي والوصول لنظريتي الأوتار HO و HE\r\n\r\nنظرية الأوتار HO و HE يمكن أن يتصلا مع بعضهما البعض أيضا عن طريق المثنوية-T فلو كانت نظرية HO تصف نصف قطر دائره R فإننا نيتخلص ذات النتيجة عندما يتم وصف نصف قطر دائره 1\\R ، فتكون لدينا الآن ثلاث نظريات وهي : نظرية الأوتار الأولى والأوتار الثانية ونظرية الأوتار HO بعد الدمج الملحق بين النظريات الخمس للأوتار، ففي استطاعتنا استخدام مبادئ المثنوية لكنها ليس بالمثنوية T بل المثنوية-S حيث تجمع بين نظرية الأوتار الأولى والثانية لتصف بذلك التفاعلات القوية التي تحدث بين الجسيمات حيث يمكن بنظرية الأوتار HO ملاحظة ورصد هذه التفاعلات الشديدة . يتبقى بعد هذا العمل بين النظريات الخمس نظريتين فقط نظرية الأوتار الثانية والأوتار HO والمذهل أيضا انه يمكن توحيدهما فتقريبا هما أيضا بالاستطاعة توحيدهما بخطوه أخيرة ومهمه للوصول للنظرية الأخيرة والشاملة التي تجمع وتشمل كل النظريات الخمس.\r\nالمبادئ الأخيرة من سلسلة النظريات الخمس للأوتار\r\n\r\nأهم خطوة للوصول لنظرية واحدة شاملة تصف كل ما يجول في الكون من ماديات كونية وحركيات ميكانيكية وديناميكية، وجب الإستئناس بنظرية الأوتار الفائقة الصغر بشكل لا يصدق، فإذا أراد أحدا أن يدرس الأوتار ولكن داخل طاقات منخفضة فمن الصعب الشعور بتلك الخيوط الجسيمية الممتدة، لذلك ستصبح عمليا ذات بعد لاشيئي مثل نقطة على وشك الإنعدام، لذلك ميكانيكا الكم تصف حدود الطاقة المنخفضة وهذه النظرية التي تصف حدود الطاقة المنخفضة تسمى نظرية المجال الكمومي، وفي مقابل ذلك نظرية الأوتار تصف تفاعلات الجذب العام المحدث على مستوى الجسيمات لهذا إذا أولا: يتوقع الحصول على نظرية الطاقة المنخفضة لتصف تفاعلات الجسيمات ذات الخلفيات الجاذبيه . *-ثانيا : نظرية الأوتار الفائقة يتواجد على متنها التماثل الفائق لذا يتوقع ظهور التماثل الفائق في الطاقات الضعيفة وهذا ما يعطي أن تقريب الطاقات المنخفضة في نظرية الأوتار الفائقة يعطينا نظرية الجاذبية أو الثقالة الفائقة.\r\nكل هذه النظريات الخمس المشمولة في نظرية الأوتار تدرس محتوياتها في 11 بعدا بدل 10 أبعاد .\r\nنظرية الأوتار البوزونية\r\nنظرية الأوتار البوزونية تصف البوزونات ولا تستوعب الفرميونات، أبعادها 26 بعد ؛ بحيث أنه ليس هنالك أي تماثل فائق فيما بين هذه الأبعاد والتماثل الفائق يعني أن لكل بوزون موجب نظير سالب فرميوني والذي يعد أمرا محتم الوجود في نظرية الأوتار البوزونية . فعند توفر التماثل الفائق تظهر نظرية جديد تسمى الأوتار الفائقة تتكون من 10 أبعاد . و بالعودة لنظرية الأوتار البوزونية فهي في جل الحالات التي تدرسها تعتبر الوتر جسيم ذري عبارة عن ذرة جسيمية مفترضة تسمى بذرة التاكيون المفترضة التي يتم عد سرعتها أكبر من سرعة الفوتونات الضوئية .\r\n\r\nنظريه الأوتار النموذج الأول\r\nالنموذج الأول من عشرة أبعاد تصف الأوتار المفتوحة ذات النهايتين والأوتار المغلقة التي ليس لها نهاية وهذا ما يجعلها مميزة ومختلفة عن بقية النظريات الأخرى (كنظرية الأوتار النموذج الثاني A والنموذج الثاني B والبقية) لايوجد جسيم تاكيوني\r\n\r\nنظريه الأوتار النموذج الثاني A و B\r\nفي البداية كل منهما يصف الأوتار المفتوحة في عشره ابعاد، الفرميونات العديمة الكتلة مع وجود اختلاف صغير في المعادلات يتصل النموذجان الثاني أي والثاني بي عن طريق ثنائية T. فاذا كانت نظرية الأوتار الثانية A نصف نصف قطر دائره R فانه يخرج بنفس النتيجة في نظرية الوتار الثانية B عندما تصف نصف قطر دائره 1\\R (حسب الثنائية) إذا وصفنا فضاء بنظرية الأوتار الثانية A فانه يوصف بشكل آخر بنظرية الأوتار الثانية B إذا النظرية الأوتار ثانية A تشعر بنفس شعور نظرية الأوتار الثانية B إذا الجسم الذي يوصف بنظرية الثانية أي لهو مكافؤ بالرغم من اختلافه في نظرية الثانية بي إذا هما تعطيان نفس سمات النظرية التحتيه. هذا بسبب النتئج التالية : 1- ان النتائج الموجودة هي نفسها في مكانيكا الكم والتي هي بعيده عن الفزياء الكلاسيكيه. 2- يمكن أن يبنى فضاء بلصق حلقات مرئية يبعضها البعض.\r\n\r\nالوصول إلى نظريتين اوتار\r\nنظرية الأوتار HO ونظرية الأوتار HE يمكن أن تتصلان مع بعضهما البعض أيضا عن طريق ثنائية T فلو كانت نظرية HO تصف نصف قطر دائره R فانه تماما نفس النتيجة عندما تصف نصف قطر دائره 1\\R إذا نظرية واحده فتبقى لدينا الآن ثلاث نظريات فقط : نظرية الأوتار الأولى والأوتار الثانية والأوتار HO مره أخرى نستطيع استخدام الثنائية ولأكن ثنائية اس : نظرية الأوتار الأولى تصف التفاعلات القوية بين الجسيمات يمكن أن يرى بنظرية الأوتار HO التي تصف التفاعلات الشديدة القوة بين الجسيمات باستخدام ثنائية S إذا نظرية اوتار HO تتضمن نظرية الأوتار الأولى\r\n\r\nنظريتين فقط\r\nيتبقى بعد هذا العمل بين النظريات الخمس نظريتين فقط نظرية الأوتار الثانية والأوتار HO والمذهل أيضا أنه يمكن توحيدهما، إذ يمكن توحيدهما بخطوه أخيرة ومهمه للوصول للنظرية التحتية التي تجمع كل النظريات الخمس.\r\n\r\nالخطوة الأخيرة\r\nأهم خطوه للوصول لنظرية واحدة تصف كل ما يجري في الكون، الأوتار فائقة الصغر بشكل لا يصدق، إذا أراد أحدٌ أن يدرس الأوتار داخل طاقات منخفضة، إذ من الصعب الشعور بها، تلك الخيوط أجسام ممتدة لذلك ستصبح عملياً ذات 0-إبعاد مثل نقطة. لذلك تصف ميكانيكا الكم حد الطاقة المنخفضة إذا هي النظرية التي تصف ميكانيكيه هذه النقاط أو الأوتار مثل هذه النظريات تسمى نظرية المجال الكمومي ونظرية الأوتار تصف وتفاعلات الجاذبيه لهذا إذا : أولا: يتوقع الحصول على نظرية الطاقة المنخفظة لتصف تفاعلات الجسيمات ذات الخلفيات الجاذبيه ثانيا : نظرية الأوتار الفائقة فيها التماثل الفائق لذا يتوقع ظهور التماثل الفائق في الطاقات الضعيفة هذا يعطي نتيجه إن تقريب الطاقات المنخفضة في نظرية الأوتار الفائقة يعطينا نظرية الجاذبيه الفائقة.\r\n\r\nنظرية الجاذبية أو الثقالة الفائقة\r\nوصفت من قبل وارنر نام عام 1970 ؛ نظرية الأوتار الثانية A لها مكافئ طاقة منخفضة أي أن نظرية الجاذبية الفائقة ونظرية الأوتار الثانية B لها مكافئ طاقة منخفضة من 11 بعد، ونظرية الأوتار HE و HO تعطيان نظرية الأوتار الثانية A والثانية B مما يجعلهما متصلتان . يعني إذا أراد أحد ما دراسة زمكان من 11 بعد بالطاقة المنخفضة فإن دراسته ستعتمد على 10 أبعاد بالتقريب البعدي .\r\n\r\nلخص إدوارد ويتين العلاقة كالتالي:\r\n\r\nنظرية الأوتار الثانية A تعطينا مكافئ الطاقة المنخفضة (نظرية الأوتار الثانية A في الجاذبية الفائقة ونظرية HO) إذا باسخدام المثنوية-T سيتم دمج نظريتي الأوتار الثانية B و A في مجال الطاقات المنخفضة لنحصل على نظرية واحدة بعد الوصول إلى نظرية واحدة من 11 بعد ذات طاقة منخفضة تجمع كل النظريات إلا أنها لا زالت تفتقر للوصف في الطاقات العالية.', 'posts/d7c36e75-cecc-48b1-a7cc-a0509892ce1d.png', 10, 1, 1, NULL, '2024-06-11 12:57:04', '2024-06-15 13:49:26'),
(21, 'ميكانيكا تقليدية 0', 'الميكانيكا التقليدية (بالإنجليزية: Classical mechanics)‏ هي الفرع الأقدم في علم حركة الأجسام (الميكانيكا)، وهي تهتم بدراسة القوى الواقعة على الجسم وحركته ونظم الجسيمات في فضاء إقليدي ثلاثي الأبعاد ومحاولة صياغة تلك العلاقات في قوانين فيزيائية، تسمح باستنتاج سير الحركة المستقبلية على أساس معرفة الظروف الابتدائية. توارد مصطلح الميكانيكا الكلاسيكية للدلالة على المنظومات الرياضية التي أرساها إسحاق نيوتن، بشكل أساسي، ويوهانز كبلر وغاليليو غاليلي والتي ظلّت سائدة منذ القرن السابع عشر حتى ظهور النسبية الخاصة والنسبية العامة التي صاغها أينشتاين خلال السنوات 1905 - 1916 وميكانيكا الكم التي اشترك في صياغتها ماكس بلانك وهيزنبرج وشرودنجر وديراك في بداية القرن العشرين بين 1900 - 1928.\r\n\r\nفي البداية كانت الميكانيكا الكلاسيكية والمشار إليها بالميكانيكا النيوتنية تهتم بصفة أساسية بتفسير حركة الكواكب والأجسام على الأرض بواسطة أساليب التحليل الرياضي، ولا سيما الحساب التفاضلي، التي وضعها نيوتن بنفسه بالتزامن مع لايبنتز. وفي ما بعد قام لاغرانج وهاميلتون بإعادة صياغة وتبسيط حسابات الميكانيكا التقليدية وذلك بالاعتماد على أن حركة الجسم تخضع لوجود حد أدنى من الطاقة الكامنة دون اللجوء إلى توازن القوى والتسارع (قانون نيوتن الثاني). كما تدخل النظريات الخاصة بتأثير الحرارة على الغازات والأجسام والمعروفة الديناميكا الحرارية ومن المساهمين في هذا المضمار بويل وبولتزمان وكذلك صياغة نظرية الكهرومغناطيسية على يد ماكسويل كلها تنتسب إلى الميكانيكا التقليدية ونظرية النظم الديناميكية.\r\n\r\nوقوانين الميكانيكا الكلاسيكية تنجح في وصف حركة الأجسام عند السرعات البطيئة والصغيرة بالنسبة إلى سرعة الضوء. وتبلغ سرعة الضوء 300 ألف كيلومتر/ثانية. أما إذا اقتربت سرعة الجسم من سرعة الضوء، فيجب الحساب باستخدام النظرية النسبية حتى لا تحدث فروق بين الحساب والمشاهدة إذا اتبعنا طريقة نيوتن. وكذلك لا تأخذ الديناميكا التقليدية التأثيرات الكوموية في الحسبان. وتلك التأثيرات الكمومية لا بد من أخذها في الاعتبار عند دراستنا لخواص المادة وحركتها في الحيز المجهري أي عند تعاملنا مع الجسيمات الذرية وتحت الذرية. مثل التشعب والشواش. كما تعتبر الميكانيكا التقليدية أداة العديد من التطبيقات التقنية الحديثة (مثل الهندسة المدنية، الملاحة الفضائية، الإنسالية).', 'posts/2145.png', 10, 1, 1, NULL, '2024-06-15 09:47:06', '2024-06-15 14:15:09'),
(22, 'فيزياء فلكية 0', 'الفيزياء الفلكية فرع من أفرع علم الفلك التي توظف مبادئ الفيزياء والكيمياء لدراسة طبيعة الأجسام الفلكية، فضلا عن مواقعها وحركتها في الفضاء. يدرس علم الفيزياء الفلكية أجساماً كالشمس، النجوم الأخرى، المجرات، كواكب النجوم الأخرى، الوسط البين-نجمي، وإشعاع الخلفية الكونية الميكروي. فيتم دراسة ما تصدره هذه الأجسام من إشعاعات عبر الطيف الكهرومغناطيسي بأكمله. كما يتم دراسة باقي خصائصها مثل السطوع، الكثافة، الحرارة، والتركيب الكيميائي. ولأن الفيزياء الفلكية علم شديد الاتساع، فإن الفيزيائيين الفلكيين كثيرا ما يطبقون العديد من أفرع الفيزياء، بما في ذلك الميكانيكا، الكهرومغناطيسية، الميكانيكا الإحصائية، الديناميكا الحرارية، الميكانيكا الكمية، النسبية، الفيزياء النووية وفيزياء الجسيمات، والفيزياء الذرية والجزيئية.\r\n\r\nعمليا، تنطوي الأبحاث الفلكية الحديثة على قدر كبير من أفرع الفيزياء النظرية والرصدية. فبعض حقول الفيزياء الفلكية تتضمن محاولات لتحديد خصائص المادة المظلمة، الطاقة المظلمة، والثقوب السوداء، وما إذا كان السفر عبر الزمن ممكنا، أو إمكانية تكون ثقوب دودية، أو إمكانية وجود أكوان موازية، وكذلك أصل الكون وقدره المحتوم. كما تدرس الفيزياء الفلكية النظرية مواضيعاً مثل ولادة النظام الشمسي وتطوره (الديناميكا والتطور النجمي)، ولادة المجرات وتطورها، الهيدروديناميكا المغناطيسية (الأجرام الكبيرة في الكون)، أصل الأشعة الكونية، النسبية العامة والفيزياء الكونية، وكذلك فيزياء الأوتار الكونية وفيزياء الجسيمات الفلكية.', 'posts/2145.png', 10, 1, 1, NULL, '2024-06-15 09:52:30', '2024-06-15 14:13:53'),
(23, 'ملخص قوانين الفيزياء 0', 'ثانوية عامة \r\n🛑 ملخص قوانين الفيزياء \r\nلا يخرج عنهم افكار الامتحان - مهم جدا \r\nشير و منشن علشان الكل يستفاد \r\nبالتوفيق و النجاح للجميع ❤️', 'posts/438164348_835176471989652_6494634417182045628_n.jpg', NULL, 1, 1, NULL, '2024-06-15 13:57:35', '2024-06-15 13:57:35'),
(24, 'تسعة أسئلة إذا أجبت إحداها ستحصل على جائزة نوبل 0', 'هذا المقال كتبته الشابة النابغة الشهيدة تسنيم حجازي، حلمت بمشاركة علمها ومقالاتها مع العالم، لكنها رحلت عن عالمنا قبل أن تكمل مسيرتها، ولكن روحها ستبقى حاضرة بيننا من خلال كلماتها التي أضاءت بها هذا المقال. \r\n\r\nخلال العقود الثلاثة الأخيرة أحدثت ميكانيكا الكم والنسبية لاينشتاين ثورة كبيرة في علم الفيزياء، وكل اكتشاف جديد يقود إلى متاهات وطرح أسئلة أكثر، ففي عام 1900 صرّح العالم الفيزيائي لورد كلفن بأنه “لن يكون هناك اكتشافات جديدة في الفيزياء بعد الآن وما تبقى عبارة عن قياسات أكثر دقة يمكن إجرائها فقط”، ولكن ما حدث بعد ذلك أثبت للعلماء بأن معرفتنا في الفيزياء ما زالت بعيدة عن الاكتمال، ومع كل اكتشاف يتضح بأن الكون أكبر وأعقد مما نتخيل، فما هي الأسئلة التسعة التي يمكن أن تقودك إلى جائزة نوبل؟ تابع معي عزيزي القارئ علّ إجابة إحدى هذه الأسئلة تكون على يدك.', 'posts/image-04.png', NULL, 1, 1, NULL, '2024-06-15 14:10:34', '2024-06-15 14:10:34'),
(25, 'اكتشف سر قوة الليزر: تعرف على خصائصه المدهشة، ومكوناته الاساسية، وكيف يعمل؟ 0', 'الفيزياء الفلكية فرع من أفرع علم الفلك التي توظف مبادئ الفيزياء والكيمياء لدراسة طبيعة الأجسام الفلكية، فضلا عن مواقعها وحركتها في الفضاء. يدرس علم الفيزياء الفلكية أجساماً كالشمس، النجوم الأخرى، المجرات، كواكب النجوم الأخرى، الوسط البين-نجمي، وإشعاع الخلفية الكونية الميكروي. فيتم دراسة ما تصدره هذه الأجسام من إشعاعات عبر الطيف الكهرومغناطيسي بأكمله. كما يتم دراسة باقي خصائصها مثل السطوع، الكثافة، الحرارة، والتركيب الكيميائي. ولأن الفيزياء الفلكية علم شديد الاتساع، فإن الفيزيائيين الفلكيين كثيرا ما يطبقون العديد من أفرع الفيزياء، بما في ذلك الميكانيكا، الكهرومغناطيسية، الميكانيكا الإحصائية، الديناميكا الحرارية، الميكانيكا الكمية، النسبية، الفيزياء النووية وفيزياء الجسيمات، والفيزياء الذرية والجزيئية.\r\n\r\nعمليا، تنطوي الأبحاث الفلكية الحديثة على قدر كبير من أفرع الفيزياء النظرية والرصدية. فبعض حقول الفيزياء الفلكية تتضمن محاولات لتحديد خصائص المادة المظلمة، الطاقة المظلمة، والثقوب السوداء، وما إذا كان السفر عبر الزمن ممكنا، أو إمكانية تكون ثقوب دودية، أو إمكانية وجود أكوان موازية، وكذلك أصل الكون وقدره المحتوم. كما تدرس الفيزياء الفلكية النظرية مواضيعاً مثل ولادة النظام الشمسي وتطوره (الديناميكا والتطور النجمي)، ولادة المجرات وتطورها، الهيدروديناميكا المغناطيسية (الأجرام الكبيرة في الكون)، أصل الأشعة الكونية، النسبية العامة والفيزياء الكونية، وكذلك فيزياء الأوتار الكونية وفيزياء الجسيمات الفلكية.', 'posts/Screenshot-2024-06-01-at-2.49.19 PM-390x220.jpg', NULL, 1, 1, NULL, '2024-06-15 14:12:28', '2024-06-15 14:12:28'),
(26, 'كيف أذاكر الفيزياء والكيمياء بطريقة صحيحة؟ أنا بالثانوية العامة وأكره المادتين هاتين ولا أعرف كيف أجيب على الأسئلة الخاصة بكل درس وامتحاناتي اقتربت، كيف أفهم الدرس جيداً؟', 'كيف أستطيع تعلم الفيزياء بالتدريج؟ لا أعلم من أين أبدأ وكيف أضع خطة، مع العلم أنني أعرف بعض الأساسيات ولكن أريد أن أتعلم حل المعادلات، أريد تطوير مهاراتي في الفيزياء خارج نطاق الجامعة أو المدرسة ومن باب التسلية فقط.\r\nكشخص يتعلم الفيزياء خارج الجامعة أو المدرسة لمدة 3 سنوات فاعتقد اني أستطيع الإجابة\r\n\r\nفي البداية وقبل كل شيء يجب أن تتعلم اللغة الانجليزية\r\n\r\n(لا يجب أن تتقنها جدا بل تعلمها المستوى المتوسط واكيد تحتاج تعلم المصطلحات العلمية بالانجليزية )\r\n\r\nوالكورسات المناسبة لك يتم تحديدها عبر مستواك في الرياضيات\r\n\r\nبما انك لم تذكر في السؤال مستواك في الرياضيات\r\n\r\nفسوف اضع لك روابط لكورسات في المكيانيكا الكلاسيكية\r\n\r\nوهي أفضل نقطة بداية لكل شخص يريد تعلم الفيزياء ..واصنف الكورسات حسب المستوى المطلوب في الرياضيات\r\n\r\n(ملاحظة:الكورسات كلها مجانية وباللغة الانجليزية )\r\n\r\nأول كورس\r\n\r\nوهو Khan acdemy physics\r\n\r\nوهذا الرابط Physics library | Science | Khan Academy\r\n\r\nبالنسبة لمستوى الرياضيات المطلوب فلا تحتاج الى رياضيات بسيطة جدا يعني حتى لا تحتاج إلى تعلم التفاضل والتكامل\r\n\r\nطبعا يبدأ الكورس بميكانيكا نيوتن وينتهي بالفيزياء الحديثة\r\n\r\nفي ميكانيكا الكم\r\n\r\nانا شخصيا لا أنصحك بهذا الكورس اذا كنت تريد فهم عميق للفيزياء اما اذا كان طموحك متواضع في فهم الفيزياء ومستواك ضعيف في الرياضيات فهاذا افضل خيار لك\r\n\r\nالكورس الثاني\r\n\r\nوهو الكورس الغني عن التعريف والكورس اللاشهر في الفيزياء\r\n\r\nاكيد هو كورس جامعة mit لمكيانيكا الكلاسيكية\r\n\r\nيقدمه الفيزيائي الشهير والتر لوين', 'posts/image-04.png', NULL, 1, 1, NULL, '2024-06-16 14:20:54', '2024-06-16 14:20:54'),
(27, 'بوست متكيش', 'وصف بوست متكيش', 'posts/post_667d862c49f3a.png', NULL, 1, 1, NULL, '2024-06-27 06:14:24', '2024-06-27 16:33:00'),
(28, 'بوست متكيش 2', 'وصف بوست', 'posts/post_667d857410395.png', NULL, 2, 1, NULL, '2024-06-27 06:17:41', '2024-06-27 16:29:56'),
(29, 'بوست متكيش 3', 'وصف لبوست متكيش 3', 'posts/post_667d856818fc2.png', NULL, 1, 1, NULL, '2024-06-27 07:01:42', '2024-06-27 16:29:44'),
(30, 'بوست جديد نوفى', 'وصف بوست جديد نوفى', 'posts/post_667d853e0f57f.png', 10, 1, 1, NULL, '2024-06-27 16:19:21', '2024-06-27 16:29:02'),
(31, 'بوست 1 ث', 'وصف بوست 1 ث', 'posts/posts_668051d4e4e03.png', NULL, 3, 1, NULL, '2024-06-29 19:26:28', '2024-06-29 19:26:28'),
(32, 'وصف بوست جديد تانى  1 ث', 'وصف بوست جديد تانى  1 ث', 'posts/posts_66805205d2947.png', NULL, 3, 1, NULL, '2024-06-29 19:27:17', '2024-06-29 19:27:17'),
(33, 'وصف بوست 2  ثانوى', 'وصف بوست 2  ثانوى', 'posts/posts_6680521ed3bb6.png', NULL, 2, 1, NULL, '2024-06-29 19:27:42', '2024-06-29 19:27:42'),
(34, 'وصف بوست تانى 2  ثانوى', 'وصف بوست تانى 2  ثانوى', 'posts/posts_66805238747af.png', NULL, 2, 1, NULL, '2024-06-29 19:28:08', '2024-06-29 19:28:08');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint UNSIGNED NOT NULL,
  `type_question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'msg',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chooses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree` float(10,2) NOT NULL DEFAULT '1.00' COMMENT 'degree of question	',
  `subject_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `type_question`, `img`, `name`, `type`, `title`, `description`, `chooses`, `answer`, `degree`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`, `unit_id`) VALUES
(1, '2', NULL, 'عندما يمر تيار كهربي 3A عبر نقطة من دائرة كهربية، فإن الشحنة الكهربية التي تمر خلال دقيقة تساوي... C', 'اختيارات', NULL, '1. عندما يمر تيار كهربي 3A عبر نقطة من دائرة كهربية، فإن الشحنة الكهربية التي تمر خلال دقيقة تساوي...', '[\"180\",\"210\",\"150\",\"120\"]', '180', 2.00, 1, 1, 1, NULL, '2024-06-11 10:53:17', '2024-06-11 10:53:17', 10),
(2, '2', NULL, 'فرق الجهد بالفولت المطلوب لكي يمر تيار مقداره 3A خلال مقاومة 6Ω يساوي....', 'اختيارات', NULL, NULL, '[\"18 V\",\"12 V\",\"5 V\",\"10 V\"]', '18 V', 2.00, 1, 1, 1, NULL, '2024-06-11 11:49:36', '2024-06-11 11:49:36', 10),
(3, '2', NULL, 'إذا كان فرق الجهد بين طرفي مقاومة 2Ω يساوي 6V فإن شدة التيار التي تمر فيها تساوي....', 'اختيارات', NULL, NULL, '[\"1\",\"3\",\"2\",\"4\"]', '3', 2.00, 1, 1, 1, NULL, '2024-06-11 17:16:12', '2024-06-11 17:16:12', 10),
(4, '3', 'questions/1.png', 'قراءة الامبير تساوى :-', 'اختيارات', NULL, NULL, '[\"30\",\"6\",\"5\",\"10\"]', '6', 2.00, 1, 1, 1, NULL, '2024-06-11 17:21:14', '2024-06-11 17:21:14', 10),
(5, '3', 'questions/1.png', 'قراءة الفولتميتر تساوي....', 'اختيارات', NULL, NULL, '[\"48\",\"56\",\"72\",\"96\"]', '56', 2.00, 1, 1, 1, NULL, '2024-06-11 17:22:53', '2024-06-11 17:22:53', 10),
(6, '2', NULL, 'وصلت أربع لمبات مقاومة كل منها 6Ω على التوازي ثم وصلت المجموعة ببطارية 12V ذات مقاومة داخلية مهملة: 1. المقاومة الكلية للمبات الأربع تساوي:', 'اختيارات', NULL, NULL, '[\"2\\/3Ω\",\"24Ω\",\"3\\/2Ω\",\"6Ω\",\"12Ω\"]', '12Ω', 2.00, 1, 1, 1, NULL, '2024-06-11 17:28:17', '2024-06-11 17:28:17', 10),
(7, '2', NULL, 'التيار المار بالبطارية يساوي:', 'اختيارات', NULL, NULL, '[\"8A\",\"6A\",\"4A\",\"2A\",\"0A\"]', '8A', 2.00, 1, 1, 1, NULL, '2024-06-11 17:33:01', '2024-06-11 17:33:01', 10),
(8, '2', NULL, 'الشحنة الكلية التي تترك البطارية في 10s تكون:', 'اختيارات', NULL, NULL, '[\"80c\",\"60c\",\"40c\",\"20c\",\"0c\"]', '80c', 2.00, 1, 1, 1, NULL, '2024-06-11 17:34:27', '2024-06-11 17:34:27', 10),
(9, '2', NULL, 'شدة التيار المار بكل لمبة يساوي:', 'اختيارات', NULL, NULL, '[\"2\\/3A\",\"32A\",\"8A\",\"1A\",\"2A\"]', '2A', 2.00, 1, 1, 1, NULL, '2024-06-11 17:36:00', '2024-06-11 17:36:00', 10),
(10, '2', NULL, 'فرق الجهد بين طرفي كل لمبة يساوي', 'اختيارات', NULL, NULL, '[\"3V\",\"12V\",\"6V\",\"4V\",\"2V\"]', '12V', 2.00, 1, 1, 1, NULL, '2024-06-11 17:37:29', '2024-06-11 17:37:29', 10),
(11, '2', NULL, 'إذا وصلت اللمبات الأربع على التوالي تكون مقاومتها الكلية:', 'اختيارات', NULL, NULL, '[\"2\\/3Ω\",\"24Ω\",\"32Ω\",\"6Ω\",\"12Ω\"]', '24Ω', 2.00, 1, 1, 1, NULL, '2024-06-11 17:39:27', '2024-06-11 17:39:27', 10),
(12, '1', 'questions/2.png', NULL, 'اختيارات', NULL, NULL, '[\"a\",\"b\",\"c\",\"d\"]', 'c', 2.00, 1, 1, 1, NULL, '2024-06-11 17:42:24', '2024-06-11 17:42:24', 10),
(13, '1', 'questions/3.png', NULL, 'اختيارات', NULL, NULL, '[\"25 كولوم\",\"125 كولوم\",\"1.5 كولوم\",\"لا توجد اجابة صحيحة\"]', '125 كولوم', 2.00, 1, 1, 1, NULL, '2024-06-11 17:44:47', '2024-06-11 17:44:47', 10),
(14, '2', NULL, 'خاصية تحدد مقدار الطاقة اللتى تحملها الموجة :-', 'اختيارات', NULL, NULL, '[\"التردد\",\"السعة\",\"الطول الموجى\",\"سرعة الموجة\"]', 'الطول الموجى', 2.00, 1, 2, 1, NULL, '2024-06-11 17:59:42', '2024-06-11 17:59:42', 7),
(15, '2', NULL, 'المسافة بين نقطة على الموجة وأقرب نقطة أخرى اليها تتحرك بنفس سرعتها واتجاهها :-', 'اختيارات', NULL, NULL, '[\"التردد\",\"السعة\",\"الطول الموجى\",\"سرعة الموجة\"]', 'التردد', 2.00, 1, 2, 1, NULL, '2024-06-11 18:03:32', '2024-06-11 18:03:32', 7),
(16, '2', NULL, 'عدد الاطوال الموجية اللتى تعبر نقطة محددة خلال ثانية :-', 'اختيارات', NULL, NULL, '[\"التردد\",\"السعة\",\"الطول الموجى\",\"سرعة الموجة\"]', 'سرعة الموجة', 2.00, 1, 2, 1, NULL, '2024-06-11 18:05:29', '2024-06-11 18:05:29', 7),
(17, '2', NULL, 'ما الذى يولد الموجات ؟', 'اختيارات', NULL, NULL, '[\"الصوت\",\"نقل الطاقة\",\"الحرارة\",\"الاهتزازات\"]', 'الاهتزازات', 2.00, 1, 2, 1, NULL, '2024-06-11 18:08:55', '2024-06-11 18:08:55', 7),
(18, '2', NULL, 'الوحدة اللتى تستخدم لقياس التردد؟', 'اختيارات', NULL, NULL, '[\"ديسبل\",\"هرتز\",\"متر\",\"متر\\/ث\"]', 'هرتز', 2.00, 1, 2, 1, NULL, '2024-06-11 18:10:20', '2024-06-11 18:10:20', 7),
(19, '2', NULL, 'مكتشف النواة هو:', 'اختيارات', NULL, NULL, '[\"رذرفورد\",\"تومسون\",\"اينشتاين\",\"جيمس شادويك\"]', 'رذرفورد', 2.00, 1, 1, 1, NULL, '2024-06-16 01:23:08', '2024-06-16 01:23:08', 11),
(20, '2', NULL, 'من غير الممكن قياس زخم الجسم وتحديد موقعه بدقة في الوقت نفسه:', 'اختيارات', NULL, NULL, '[\"مبدأ برنولي\",\"مبدأ هايزنبرج\",\"نظرية ماكسويل\",\"نظرية آينشتاين\"]', 'مبدأ برنولي', 2.00, 1, 1, 1, NULL, '2024-06-16 01:24:28', '2024-06-16 01:29:46', 11),
(21, '2', NULL, 'في معادلة دي برولي λ = h/mv ترمز λ لـ:', 'اختيارات', NULL, 'في معادلة دي برولي λ = h/mv ترمز λ لـ:', '[\"الطول الموجي\",\"التردد\",\"سعة الموجة\",\"طاقة الموجة\"]', 'الطول الموجي', 2.00, 1, 1, 1, NULL, '2024-06-16 01:26:00', '2024-06-16 01:26:00', 11),
(22, '2', NULL, 'ما صيغة قانون طاقة اهتزاز الذرة ؟', 'اختيارات', NULL, NULL, '[\"E = nhf\",\"V = IR\",\"E = Pt\",\"P = IV\"]', 'E = Pt', 2.00, 1, 1, 1, NULL, '2024-06-16 01:27:33', '2024-06-16 01:29:25', 11),
(23, '2', NULL, 'العالم الذي تنص نظريته على أن (قوانين الكهرومغناطيسية لا تطبق داخل الذرة) هو:', 'اختيارات', NULL, NULL, '[\"بور\",\"رذرفورد\",\"جايجر\",\"طومسون\"]', 'رذرفورد', 2.00, 1, 1, 1, NULL, '2024-06-16 01:29:03', '2024-06-16 01:29:13', 11),
(24, '2', NULL, 'فسر اينشتاين التأثير الكهروضوئي مفترضا أن الضوء موجود على شكل حزم من الطاقة تسمى ؟', 'اختيارات', NULL, NULL, '[\"الفوتونات\",\"الإلكترونات\",\"البروتونات\",\"النيوترونات\"]', 'الإلكترونات', 2.00, 1, 1, 1, NULL, '2024-06-16 01:31:51', '2024-06-16 01:31:51', 11),
(25, '2', NULL, 'بين نموذج بور طيف انبعاث الهيدروجين إلى:', 'اختيارات', NULL, NULL, '[\"انتقال الإلكترون إلى مدارات ذات طاقة أقل\",\"انتظام طاقة الإلكترون في مدار ثابت\",\"انتقال الإلكترون إلى مدارات ذات طاقة أعلى\",\"انتظام سرعة الإلكترون في مدار ثابت\"]', 'انتظام طاقة الإلكترون في مدار ثابت', 1.50, 1, 1, 1, NULL, '2024-06-16 01:36:07', '2024-06-16 01:36:07', 11);

-- --------------------------------------------------------

--
-- Table structure for table `question_exams`
--

CREATE TABLE `question_exams` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `school_grade_id` bigint UNSIGNED DEFAULT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_exams`
--

INSERT INTO `question_exams` (`id`, `exam_id`, `question_id`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 2, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 2, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 2, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 2, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 2, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 3, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 3, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 3, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 3, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 3, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 3, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 3, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 3, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 3, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 3, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 3, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 3, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 4, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 4, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 4, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 4, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 4, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 4, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 4, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 4, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 4, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 4, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 4, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 4, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 4, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 5, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 5, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 5, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 5, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 5, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 5, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 5, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 6, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 6, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 6, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 6, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 6, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 6, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 6, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 6, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 6, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 6, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 6, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 6, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 6, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 7, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 7, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 7, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 7, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 7, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 7, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 7, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 7, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 7, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 7, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 7, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 7, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 7, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 7, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 7, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 7, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 9, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 9, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 9, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 9, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 9, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 9, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 9, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 9, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 9, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 9, 12, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question_exam_students`
--

CREATE TABLE `question_exam_students` (
  `id` bigint UNSIGNED NOT NULL,
  `student_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 ==> wrong\r\n1 ==> correct',
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_exam_students`
--

INSERT INTO `question_exam_students` (`id`, `student_answer`, `exam_id`, `user_id`, `question_id`, `correct`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '24Ω', 7, 5, 11, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(2, '6', 7, 5, 4, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(3, '180', 7, 5, 1, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(4, '12V', 7, 5, 10, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(5, '56', 7, 5, 5, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(6, '12Ω', 7, 5, 6, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(7, '80c', 7, 5, 8, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(8, '3', 7, 5, 3, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(9, '18 V', 7, 5, 2, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(10, 'c', 7, 5, 12, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(11, '2A', 7, 5, 9, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(12, '6A', 7, 5, 7, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(13, '1.5 كولوم', 7, 5, 13, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(14, '2A', 7, 6, 9, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(15, '6A', 7, 6, 7, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(16, '1.5 كولوم', 7, 6, 13, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(17, '24Ω', 7, 7, 11, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(18, '6', 7, 7, 4, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(19, '180', 7, 7, 1, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(20, '6A', 6, 6, 7, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(21, '1.5 كولوم', 6, 6, 13, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(22, '24Ω', 6, 7, 11, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51'),
(23, '6', 6, 7, 4, 0, NULL, 1, NULL, NULL, '2024-06-21 05:42:51', '2024-06-21 05:42:51');

-- --------------------------------------------------------

--
-- Table structure for table `rechagre_balance`
--

CREATE TABLE `rechagre_balance` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `register_tokens`
--

CREATE TABLE `register_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `register_tokens`
--

INSERT INTO `register_tokens` (`id`, `email`, `pin_code`, `expired_at`, `created_at`, `updated_at`) VALUES
(2, 'engahmedgamal00000086@gmail.com', '979400', '2024-07-01 04:33:44', '2024-06-30 04:33:44', '2024-06-30 04:33:44'),
(3, 'engahmedgamal086@gmail.com', '286549', '2024-07-01 04:40:29', '2024-06-30 04:40:29', '2024-06-30 04:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `school_grades`
--

CREATE TABLE `school_grades` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_grades`
--

INSERT INTO `school_grades` (`id`, `name`, `description`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'الصف الثالث الثانوى', NULL, 1, NULL, '2024-06-11 09:50:01', '2024-06-11 10:02:35'),
(2, 'الصف الثانى الثانوى', NULL, 1, NULL, '2024-06-11 09:50:17', '2024-06-11 09:50:17'),
(3, 'الصف الاول الثانوى', NULL, 1, NULL, '2024-06-11 09:50:29', '2024-06-11 09:50:29'),
(4, 'الصف الثالث الاعدادى', NULL, 1, NULL, '2024-06-27 06:35:06', '2024-06-27 06:35:06'),
(5, 'الصف الثانى الاعدادى', NULL, 1, NULL, '2024-06-27 06:36:43', '2024-06-27 06:41:22'),
(6, 'الصف الاول الاعدادى', NULL, 1, NULL, '2024-06-27 06:38:50', '2024-06-27 06:40:12'),
(7, 'الصف السادس الابتدائى', NULL, 1, NULL, '2024-06-27 06:42:58', '2024-06-27 06:42:58'),
(8, 'الصف الخامس الابتدائى', NULL, 1, NULL, '2024-06-27 06:44:31', '2024-06-27 06:44:31');

-- --------------------------------------------------------

--
-- Table structure for table `sessionslive`
--

CREATE TABLE `sessionslive` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `serviceName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'zoom,google meet',
  `creds` json DEFAULT NULL COMMENT 'public key,secret key',
  `teacher_id` bigint UNSIGNED NOT NULL,
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `active` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0 ==> in active  , 1 ==> active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessionslive`
--

INSERT INTO `sessionslive` (`id`, `name`, `photo`, `link`, `description`, `serviceName`, `creds`, `teacher_id`, `unit_id`, `school_grade_id`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'مراجعة ليلة الامتحان لطلبة 3 ثانوى التيار الكهربى وقانون كيرشوف', 'sessions/1948100_0.jpeg', 'https://meet.google.com/qsx-xkwj-pai', NULL, 'zoom', NULL, 1, 10, 1, '1', '2024-06-11 13:07:34', '2024-06-11 13:08:39', NULL),
(2, 'مراجعة ليلة الامتحان 3 ثانوى 2024', 'sessions/image-04.png', 'https://meet.google.com/qsx-xkwj-pai', 'مراجعة شاملة لمنهج الفيزياء الصف الثالث الثانوى', 'google meet', NULL, 1, NULL, 1, '1', '2024-06-15 16:56:37', '2024-06-15 16:57:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sources`
--

INSERT INTO `sources` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'main_server', '2024-06-27 12:00:59', '2024-06-27 12:00:59'),
(2, 'youtube', '2024-06-27 12:00:59', '2024-06-27 12:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `static_exams`
--

CREATE TABLE `static_exams` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_degree` double(8,2) NOT NULL,
  `total_degree` double(8,2) NOT NULL,
  `exam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'file ==> pdf',
  `user_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `static_exams`
--

INSERT INTO `static_exams` (`id`, `title`, `description`, `student_degree`, `total_degree`, `exam`, `user_id`, `teacher_id`, `school_grade_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'امتحان الطالب ندى خالد فوزى', '', 18.00, 20.00, 'sessions/ملف دكتور محمود .pdf', 2, 1, 2, '2024-06-11 19:15:05', '2024-06-11 19:22:14', NULL),
(2, 'امتحان الطالب أحمد جمال فوزى عازى', '', 20.00, 25.00, 'sessions/أسئلة الفيزياء الحديثة.pdf', 1, 1, 3, '2024-06-15 20:22:10', '2024-06-15 20:22:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `title`, `description`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'فيزياء', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `email`, `img_url`, `email_verified_at`, `password`, `remember_token`, `subject_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'أحمد المحلاوى', 'almahalwy@gmail.com', 'teachers/1948100_0.jpeg', NULL, '$2y$10$K5l4KX51qGqT2kY5R/0aE.kw6WKAut/v7/eww5SU5e5zZ5UKYasxK', NULL, 1, NULL, NULL, '2024-06-11 04:22:59'),
(2, 'مستر مصطفى ابراهيم', 'mostafa@marin.live', 'teachers/en-admin-1.png', NULL, '$2y$10$0qqnt5LCiCA9YHctGijWXewcIm6mmtRMi6cDY6NO/cg.hi61fN66u', NULL, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_settings`
--

CREATE TABLE `teacher_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint DEFAULT NULL,
  `phonenumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `avater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiktok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_settings`
--

INSERT INTO `teacher_settings` (`id`, `teacher_id`, `phonenumber`, `whatsapp`, `bio`, `avater`, `facebook`, `youtube`, `instagram`, `tiktok`, `linkedin`, `telegram`, `subject`, `address`, `city`, `state`, `created_at`, `updated_at`) VALUES
(1, 1, '01023065856', '01023065856', 'معكم مستر أحمد المحلاوى مدرس الفيزياء خبرة 15 سنة', '', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'الفيزياء', 'الازبكية - شارع الوايلى', 'المريوطية', 'cairo', '2024-06-11 13:37:30', '2024-06-27 07:46:13');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `telescope_entries`
--

INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(1, '9c4d2a03-4c13-43bc-9d30-510288b0282f', '9c4d2a0d-d35a-48e5-88e7-8974aadeb94d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"74.88\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-16 18:38:32'),
(2, '9c4d2a0c-83ae-43e5-a708-aa9802ba756e', '9c4d2a0d-d35a-48e5-88e7-8974aadeb94d', NULL, 1, 'view', '{\"name\":\"welcome\",\"path\":\"\\\\resources\\\\views\\/welcome.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-16 18:38:38'),
(3, '9c4d2a0d-cff8-44ab-8c85-aa7934dd5ed6', '9c4d2a0d-d35a-48e5-88e7-8974aadeb94d', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"Closure\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"sec-ch-ua\":\"\\\"Not\\/A)Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"126\\\", \\\"Brave\\\";v=\\\"126\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/126.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"sec-gpc\":\"1\",\"accept-language\":\"en-US,en\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImdGNkhld0FSeDY5UE82ZGdTRFpIQnc9PSIsInZhbHVlIjoidzZmUmpDd2d3UEI4R0dUZUdGa0U4ZGJjbEVrSGxPR3BaendyUHRZdEdMcmJucWlHQVZYNmQ3U3ErZTlWRjhpN1Evc2NUZGxsckxhNjBQa1VnVExuYzRxQXRnNWphRE9kTkdGWWM1NXRFUWNNZEE3Rm9lWVdmK0NaV2FRb2NrVEgiLCJtYWMiOiJjZjc0NmQwZjc1ZTAxNTI4YWYwZmViNzJmZjdlMTI2NzVmNDNiYTIyNGJmMTNkZmNiMTQ0YjI4NjFkYTgzZTNmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjduRVlYMjJZTHNISmhrUkRmdnFXQUE9PSIsInZhbHVlIjoiWnh2WEVKUEJhR1Rhd1dlQVRjQ0ZGR1Q2OEc3cnRtOHpzU0t3OFF4Vy94OTBLTGxLQTQ0eDYxUjFpVnY1VU9Cc1lEMGdIWWRXMW95ZG5HV3lSbVdoWUdmMzc3SmhtVHZDc2JBTnhxdGU2TW9LcDNSenVtUTVaSk9qVzlKVUFTRDMiLCJtYWMiOiIxZDk0MWI4NTk2YmRhYzZiMmExNTlkNThjZGZlNTYzZjc2M2ZiMzZhM2E3ZTdmMTc0ZGY4MmZiNDcwMjVjOTNlIiwidGFnIjoiIn0%3D\",\"ngrok-skip-browser-warning\":\"true\"},\"payload\":[],\"session\":{\"_token\":\"5JAKUpPfzRKqFcnjE3mIMpy7fXB20U9cTN3tsxhn\",\"flasher::envelopes\":[],\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":\"HTML Response\",\"duration\":7264,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-16 18:38:39'),
(4, '9c4d2a0d-4bc1-40e0-9db5-0d6fa8d8c719', '9c4d2a0d-d3b9-4095-a4fc-934db4f60a36', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"4.48\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-16 18:38:39'),
(5, '9c4d2a0d-6885-47dc-8733-6c4e8928aef4', '9c4d2a0d-d3b9-4095-a4fc-934db4f60a36', NULL, 1, 'view', '{\"name\":\"welcome\",\"path\":\"\\\\resources\\\\views\\/welcome.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-16 18:38:39'),
(6, '9c4d2a0d-d02a-4e92-8d7a-570b104fe197', '9c4d2a0d-d3b9-4095-a4fc-934db4f60a36', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"Closure\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6InpOT0o1VEhIT1lpQ1pCT3pJZHR5Mmc9PSIsInZhbHVlIjoiQU1SVHl0WTNiR2JWVHZhdWlrS2QrUy9MWDJVdkt4NU1ycHZNanVXTTB1RVlWa1lpY3pSZ1RZaVRHY1FFMm1rcVp0U0tuVDBJUWlYYnZnZmtpUWtZaXRyQ1AxdFF3dDBBVHRNVTRiNmJlOXFSeFpMK3IycWcvMzJQTVNNSTlDYzUiLCJtYWMiOiJkZGFmNjllNGIxOTAwODE4ZjQwMTBhNzI0YWU4NjBiZmUyZmU4YTFlNjUwODg5NWU1ZmJmNWQxMWZiZDRkMjVkIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6Ik5XQ1MzRG1WMTh1bmpWbk8rRlVXelE9PSIsInZhbHVlIjoiYU9kSzJUK09KOEpMUkpuUE84cytKaFAzVFdSUWMzS1JmK0JDc0ZnVXZSb0JWZlV3cGpTc1dmWmNLNXhpY2JtZUpyK01YMVdrUTY1dGtrVjVBY0p6ZEp2TWNxMHdwelpmcE93RmkyZzMvRXMrR0xDd1pMYlY5YjBQUmZxbW1KU3kiLCJtYWMiOiJiOGYyMzIxZDFjNmU2OTVjZDg1MTBiNWI3YTk3MDJiY2VhZGQ4NWIxZTZjMzUwYWQzZGJlYmI5ZTg4ZTQyZTQwIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"XUEqIU7JIJBquwpPkdDa51Jppmj7SpNOJsrm6Ka9\",\"flasher::envelopes\":[],\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":\"HTML Response\",\"duration\":667,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-16 18:38:39'),
(7, '9c512bf7-f7ec-489e-afb8-302fd308e7d4', '9c512c05-2c35-4aa4-87d8-57ddec40c862', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"127.42\",\"slow\":true,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:27:20'),
(8, '9c512c02-80c3-4a1b-b2ce-cfc77d82c4e3', '9c512c05-2c35-4aa4-87d8-57ddec40c862', NULL, 1, 'view', '{\"name\":\"welcome\",\"path\":\"\\\\resources\\\\views\\/welcome.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:27:26'),
(9, '9c512c04-8589-43ae-811f-ef8d5aa63ad9', '9c512c05-2c35-4aa4-87d8-57ddec40c862', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"Closure\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImJUdnlMK3RzSFQyUFlSeWVFVDBtOGc9PSIsInZhbHVlIjoiZkdxd0d1TmZRUmV4c2wyNnR3QUtJMUU5QkRqdmllS09aUFNqcjFicldlMk12R0pCdnRzb1NvVW5QREFOemxpb2NvRXh4aGhHTGo2UGVUek4xUUJ5bEw1aFJJNTNXS3gzNzc0dEZJUkNoN1E2L3A4TEJXNnlwWnlYazQ0ZkN5bXoiLCJtYWMiOiJlZjEwOWM2MzFlMWM3MmFmZjU1MTFmOGJhOWFiNmFiYWYwN2RhMzZkZWNjNzVhOTVhNmU4MGM0YjMxMjQwOWE0IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkZqeUJ5LzNwVXNPSjQvY0FQUWJNdGc9PSIsInZhbHVlIjoiTHM4ekNIYUZBanM1Rk1mQXZoc1BVejNVYmtyOVBibWN3L0FncDdROHg0Wk5uMHJQcWNBN2RnbXBxcnd4Ymx4NWZremdiR1lpVnpTbGNlUFNRNHpvblFTTk0weVhUcXlSYWdSbnBUOGQ5bzNPcVNJVmY3aWFzc3lna1VzU1dZczQiLCJtYWMiOiIxYmM2YTY1ZmU5Y2E0MTNjZWYwNmZmODA0ZGE4ODA3Y2JlZWFmNTMyZGNjY2UzODA0YWYwMTMwMzViYWMwN2EyIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"mRGqBuOjsAcr0ZR0tVS6XMhEr7qKx5Nqq4LPG1BR\",\"flasher::envelopes\":[],\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":\"HTML Response\",\"duration\":34259,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:27:27'),
(10, '9c512c33-7871-4c5a-ade0-966aac43430f', '9c512c36-abca-41cb-ad19-4ec815fdfc4b', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"14.74\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:27:58'),
(11, '9c512c35-0b34-4162-8430-4297f7e3ea7d', '9c512c36-abca-41cb-ad19-4ec815fdfc4b', NULL, 1, 'view', '{\"name\":\"auth.login\",\"path\":\"\\\\resources\\\\views\\/auth\\/login.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:27:59'),
(12, '9c512c36-515e-4ebe-b288-af5ab9d9391f', '9c512c36-abca-41cb-ad19-4ec815fdfc4b', NULL, 1, 'view', '{\"name\":\"layouts.guest\",\"path\":\"\\\\resources\\\\views\\/layouts\\/guest.blade.php\",\"data\":[\"teachers\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:28:00'),
(13, '9c512c36-a7d2-4d79-84f2-1dee87623e86', '9c512c36-abca-41cb-ad19-4ec815fdfc4b', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/login\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\AuthenticatedSessionController@create\",\"middleware\":[\"web\",\"guest\",\"guest:teacher\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Im9vNTQrVnBKYk04QzNKWGxpeHNJaXc9PSIsInZhbHVlIjoiNnZsY0VvVXc3bmpqUzY3dGdmUEsxd0gxNVBMYVRTM2RNR0k5eXllSjgzT2JNMVlzK0VENTVOUjJwNUIxY25yRDR6bVNqMitIT1VQOTZOV1Ztd3VUcytwQXZpdHZ4OEpZbTczODRabmovWXg5ckZwOTg3ZHJvQ0NlRkZjK3VRZW4iLCJtYWMiOiJjZjlkODE5MWE3OTUyMDY3OWNhYTQ3NjVkNTk0OWVjNzk0MTIwN2E0ZWQzMGUyYmMwM2FhNTI0MGYxZTE0NDVjIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6Ii9BOTkwc1hDSXNFVHdlVG5jZE9LT0E9PSIsInZhbHVlIjoiZVZvT0ZuWnZ2dUNBcklZb0JtWFdQWkN6cXh5SDA5NldXY0JEVjJHRm1SMHZMTDlNUWx3amwvczFGcSswTy9JMkx2eWc0QjFPSWkwbm5sRTJVNGlueDUvcDZnN1dvRlZoOTJVNkFoYnlXdVRqckRWZU9zaGtTR081eVdiRStqd2giLCJtYWMiOiI1ZDA2YTJhMTMyOTI5ZGQ1NmZkNWZkNWM2NGNiOTg4NzFiYjQ4N2YwZTEwZjUyMTc4YjQ0ODQ4ZDlhNjYwOWFlIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"mRGqBuOjsAcr0ZR0tVS6XMhEr7qKx5Nqq4LPG1BR\",\"flasher::envelopes\":[],\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\\/login\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":\"HTML Response\",\"duration\":2422,\"memory\":26,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:28:00'),
(14, '9c512c65-b3ae-47f4-ab2c-754892d483b7', '9c512c6b-1da1-49af-afd5-d951248c167d', 'afb3c18b8f3a6e3f5ecd521325c8c47f', 1, 'exception', '{\"class\":\"Illuminate\\\\Database\\\\QueryException\",\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Database\\\\Connection.php\",\"line\":801,\"message\":\"SQLSTATE[42S22]: Column not found: 1054 Unknown column \'active\' in \'where clause\' (Connection: mysql, SQL: select * from `users` where `email` = ghada@gmail.com and `active` = 1 limit 1)\",\"context\":null,\"trace\":[{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Database\\\\Connection.php\",\"line\":755},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Database\\\\Connection.php\",\"line\":424},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Database\\\\Query\\\\Builder.php\",\"line\":2752},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Database\\\\Query\\\\Builder.php\",\"line\":2740},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Database\\\\Query\\\\Builder.php\",\"line\":3294},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Database\\\\Query\\\\Builder.php\",\"line\":2741},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Database\\\\Eloquent\\\\Builder.php\",\"line\":737},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Database\\\\Eloquent\\\\Builder.php\",\"line\":721},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Database\\\\Concerns\\\\BuildsQueries.php\",\"line\":296},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Auth\\\\EloquentUserProvider.php\",\"line\":139},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Auth\\\\SessionGuard.php\",\"line\":381},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Requests\\\\Auth\\\\StudentLoginRequest.php\",\"line\":47},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Auth\\\\AuthenticatedSessionController.php\",\"line\":21},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Controller.php\",\"line\":54},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\ControllerDispatcher.php\",\"line\":43},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Route.php\",\"line\":260},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Route.php\",\"line\":205},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":799},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":141},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":28},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Middleware\\\\RedirectIfAuthenticated.php\",\"line\":28},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\php-flasher\\\\flasher-laravel\\\\Middleware\\\\FlasherMiddleware.php\",\"line\":34},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\php-flasher\\\\flasher-laravel\\\\Middleware\\\\SessionMiddleware.php\",\"line\":34},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Middleware\\\\SubstituteBindings.php\",\"line\":50},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\VerifyCsrfToken.php\",\"line\":78},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\View\\\\Middleware\\\\ShareErrorsFromSession.php\",\"line\":49},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Session\\\\Middleware\\\\StartSession.php\",\"line\":121},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Session\\\\Middleware\\\\StartSession.php\",\"line\":64},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Cookie\\\\Middleware\\\\AddQueuedCookiesToResponse.php\",\"line\":37},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Cookie\\\\Middleware\\\\EncryptCookies.php\",\"line\":67},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":116},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":800},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":777},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":741},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":730},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Kernel.php\",\"line\":200},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":141},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\livewire\\\\livewire\\\\src\\\\DisableBrowserCache.php\",\"line\":19},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\TransformsRequest.php\",\"line\":21},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\TransformsRequest.php\",\"line\":21},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\TrimStrings.php\",\"line\":40},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\ValidatePostSize.php\",\"line\":27},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\PreventRequestsDuringMaintenance.php\",\"line\":89},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Http\\\\Middleware\\\\HandleCors.php\",\"line\":49},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Http\\\\Middleware\\\\TrustProxies.php\",\"line\":39},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":116},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Kernel.php\",\"line\":175},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Kernel.php\",\"line\":144},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\public\\\\index.php\",\"line\":52},{\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\index.php\",\"line\":26}],\"line_preview\":{\"792\":\"        \\/\\/ message to include the bindings with SQL, which will make this exception a\",\"793\":\"        \\/\\/ lot more helpful to the developer instead of just the database\'s errors.\",\"794\":\"        catch (Exception $e) {\",\"795\":\"            if ($this->isUniqueConstraintError($e)) {\",\"796\":\"                throw new UniqueConstraintViolationException(\",\"797\":\"                    $this->getName(), $query, $this->prepareBindings($bindings), $e\",\"798\":\"                );\",\"799\":\"            }\",\"800\":\"\",\"801\":\"            throw new QueryException(\",\"802\":\"                $this->getName(), $query, $this->prepareBindings($bindings), $e\",\"803\":\"            );\",\"804\":\"        }\",\"805\":\"    }\",\"806\":\"\",\"807\":\"    \\/**\",\"808\":\"     * Determine if the given database exception was caused by a unique constraint violation.\",\"809\":\"     *\",\"810\":\"     * @param  \\\\Exception  $exception\",\"811\":\"     * @return bool\"},\"hostname\":\"DESKTOP-NJVJCK5\",\"occurrences\":1}', '2024-06-18 18:28:31'),
(15, '9c512c5f-a334-45ee-af82-6ea20305aa13', '9c512c6b-1da1-49af-afd5-d951248c167d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"13.21\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:28:27'),
(16, '9c512c61-ffb3-4039-bb62-a5d45aa95500', '9c512c6b-1da1-49af-afd5-d951248c167d', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"ghada@gmail.com|::1\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:28:29'),
(17, '9c512c6b-1a91-418d-826d-7f82b2ad6536', '9c512c6b-1da1-49af-afd5-d951248c167d', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/login\\/store\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\AuthenticatedSessionController@store\",\"middleware\":[\"web\",\"guest\",\"guest:teacher\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"content-length\":\"90\",\"cache-control\":\"max-age=0\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"upgrade-insecure-requests\":\"1\",\"origin\":\"http:\\/\\/localhost\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/login\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6InhXRUF0OTd0MnNIaXdSbE8yWUNJVkE9PSIsInZhbHVlIjoicFkweSs3ZmZqd0lOV3k1NTQxQW5vOXRjdkxhM0Q5TkkwT3psYWsyL2tmdDhLbWJIWmw3QTZEdVdSOTVuUUNUWG03NFVEUkRMdFdla0JZVXlqUFpESjF4YU4rZ1hxaE1mS3B5TXY0MEJ5VW9qdnEwU2RPTFQ2d0VHUXNLZm1PaHoiLCJtYWMiOiIwZDY5ZTM2MTc0OTkzMWEwNDBmM2YxMDY2MDRmODkzN2FmYzg0MzlmNDc4NTVjMTVjYTk2YTQwYmI1YjM2MDEwIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlBtOWpLdFhZMkx2MFFJVFFqZjc2U0E9PSIsInZhbHVlIjoiWjhGMDZ2VUx3UWNGQ1l0eklwWTF6bU9zQWlVanRUQ2o0MXNDT1NYSHlZSDdpY2NnUEdrYjB2cUIyQ0J4WFIraEtDMEl6dnVXUmh0TVNpYmFhYTZYUUdBQnVrblhlZTBSSHczR0xtUTRkL0hDZ0h2ODhIQmdkOGo3Z3MvSjc2NVgiLCJtYWMiOiIyMzVhYzVhN2Q3ZWQzZGIzOTk5NzcwYzA5MjU0ZmI2NTczMmU3MTdiN2ZlY2YxZWNjZDkxOGExYmYyMTY1MDhiIiwidGFnIjoiIn0%3D\"},\"payload\":{\"_token\":\"mRGqBuOjsAcr0ZR0tVS6XMhEr7qKx5Nqq4LPG1BR\",\"email\":\"ghada@gmail.com\",\"password\":\"********\"},\"session\":{\"_token\":\"mRGqBuOjsAcr0ZR0tVS6XMhEr7qKx5Nqq4LPG1BR\",\"flasher::envelopes\":[],\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\\/login\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":7887,\"memory\":34,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:28:35'),
(18, '9c512c6c-316c-4641-ad5e-45aaefc25383', '9c512c75-9b9d-4985-8cb8-2a62f586dd0f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"25.65\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:28:35'),
(19, '9c512c75-9a68-4afa-8fd6-d1f6b2b8b162', '9c512c75-9b9d-4985-8cb8-2a62f586dd0f', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/_ignition\\/health-check\",\"method\":\"GET\",\"controller_action\":\"Spatie\\\\LaravelIgnition\\\\Http\\\\Controllers\\\\HealthCheckController\",\"middleware\":[\"Spatie\\\\LaravelIgnition\\\\Http\\\\Middleware\\\\RunnableSolutionsEnabled\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept\":\"*\\/*\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-dest\":\"empty\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/login\\/store\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6InlSc2pZRm1NMk9mOElJYmF2TE1CRXc9PSIsInZhbHVlIjoiVm5uT3FJVXY5bEFId2tyVjdaSEc0V2xmYUE3SHhHUktpVzdjNXVPL2F6RFV4RzRqaWk1VU9MY0FTL1UrbTJ4SjVBNlRVcXZJbEV2THMxUnY4VWpUc3dzR1ZveWdQSFpCVkpSWmZlbnhUaS9UUEcya3JETzBzcm5uWTIrWjB5amoiLCJtYWMiOiI1NTMyMDc0YzgxNzU5MzY1YmEzNTZmZDU5OGQ1ODYwZThkMjMxZTBkNDk0ZWI1ZDgwNjYxNzdkZTEzMGM4YWU1IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IktoUE9EZmx2d0NNb1JSSXVPZVVsc2c9PSIsInZhbHVlIjoiN3NXbkJOZjVWZEo4V3d1a2RBZCt3L3MvL0RhTVRScDI4TVBESld6YkFleGdBU2swY3RKVEpHalI0eENwYjRBZEVaRUVBNU1id3RvZzRya0lPMCtVZ1I4ZWRHQjdpU2lwT1NDbDY1cUNWZWp1UHBSVnp1U2llSmVLMzF3OEVwL2EiLCJtYWMiOiIwODMxZGY1MzBhMzk2OWVmYzdjYzRmZGM0ZWI1ZjBlOWEyODllNjU2NjY2MzgyNzc2ZGQ5M2FhMGMxYTA2NDZkIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":200,\"response\":{\"can_execute_commands\":true},\"duration\":6516,\"memory\":28,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:28:41'),
(20, '9c512cc4-32e8-434d-98ca-5cd992c3259e', '9c512cc5-99dd-4b49-9b7a-69dd7791cf7a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"16.62\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:33'),
(21, '9c512cc4-7ad8-4a1c-94b2-0f7b0f5967de', '9c512cc5-99dd-4b49-9b7a-69dd7791cf7a', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"ghada@gmail.com|::1\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:33'),
(22, '9c512cc4-8116-457f-9db5-65d326ac2996', '9c512cc5-99dd-4b49-9b7a-69dd7791cf7a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `email` = \'ghada@gmail.com\' limit 1\",\"time\":\"0.99\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Requests\\\\Auth\\\\LoginRequest.php\",\"line\":44,\"hash\":\"747ef04de752900539e8a3a1aee036ac\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:33'),
(23, '9c512cc4-814e-4d89-ac8c-217a1f379ac2', '9c512cc5-99dd-4b49-9b7a-69dd7791cf7a', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:33'),
(24, '9c512cc5-9596-4d0d-8344-e6081665af67', '9c512cc5-99dd-4b49-9b7a-69dd7791cf7a', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/login\\/store\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\AuthenticatedSessionController@store\",\"middleware\":[\"web\",\"guest\",\"guest:teacher\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"content-length\":\"90\",\"cache-control\":\"max-age=0\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"origin\":\"http:\\/\\/localhost\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/login\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6InlSc2pZRm1NMk9mOElJYmF2TE1CRXc9PSIsInZhbHVlIjoiVm5uT3FJVXY5bEFId2tyVjdaSEc0V2xmYUE3SHhHUktpVzdjNXVPL2F6RFV4RzRqaWk1VU9MY0FTL1UrbTJ4SjVBNlRVcXZJbEV2THMxUnY4VWpUc3dzR1ZveWdQSFpCVkpSWmZlbnhUaS9UUEcya3JETzBzcm5uWTIrWjB5amoiLCJtYWMiOiI1NTMyMDc0YzgxNzU5MzY1YmEzNTZmZDU5OGQ1ODYwZThkMjMxZTBkNDk0ZWI1ZDgwNjYxNzdkZTEzMGM4YWU1IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IktoUE9EZmx2d0NNb1JSSXVPZVVsc2c9PSIsInZhbHVlIjoiN3NXbkJOZjVWZEo4V3d1a2RBZCt3L3MvL0RhTVRScDI4TVBESld6YkFleGdBU2swY3RKVEpHalI0eENwYjRBZEVaRUVBNU1id3RvZzRya0lPMCtVZ1I4ZWRHQjdpU2lwT1NDbDY1cUNWZWp1UHBSVnp1U2llSmVLMzF3OEVwL2EiLCJtYWMiOiIwODMxZGY1MzBhMzk2OWVmYzdjYzRmZGM0ZWI1ZjBlOWEyODllNjU2NjY2MzgyNzc2ZGQ5M2FhMGMxYTA2NDZkIiwidGFnIjoiIn0%3D\"},\"payload\":{\"_token\":\"mRGqBuOjsAcr0ZR0tVS6XMhEr7qKx5Nqq4LPG1BR\",\"email\":\"ghada@gmail.com\",\"password\":\"********\"},\"session\":{\"_token\":\"UH7kCbkxRFifM5rvYHB8YIjCv68LqSGEdQ58bmEs\",\"flasher::envelopes\":[],\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\\/login\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":5},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/localhost\\/teachme\\/dashboard\",\"duration\":1188,\"memory\":26,\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:34'),
(25, '9c512cc6-2052-44ca-a35b-c78928a4c0d1', '9c512cc7-21a5-4e36-a55c-01aff54bbcce', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"22.05\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:34'),
(26, '9c512cc6-6a25-4f7c-8a60-bc445b9b3603', '9c512cc7-21a5-4e36-a55c-01aff54bbcce', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 5 limit 1\",\"time\":\"1.70\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:34'),
(27, '9c512cc6-6ab7-447b-9732-8de60d243ffe', '9c512cc7-21a5-4e36-a55c-01aff54bbcce', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:34'),
(28, '9c512cc6-7165-4ad5-9472-816273889314', '9c512cc7-21a5-4e36-a55c-01aff54bbcce', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject_name` from `teachers` inner join `subjects` on `teachers`.`subject_id` = `subjects`.`id`\",\"time\":\"1.24\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Student\\\\StudentController.php\",\"line\":22,\"hash\":\"b07113c717328bac17c5c60be41a28d7\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:34'),
(29, '9c512cc6-8b17-42bd-b41f-59606e7125a0', '9c512cc7-21a5-4e36-a55c-01aff54bbcce', NULL, 1, 'view', '{\"name\":\"student.dashboard\",\"path\":\"\\\\resources\\\\views\\/student\\/dashboard.blade.php\",\"data\":[\"teachers\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:34'),
(30, '9c512cc6-db04-4a37-99e7-841baa999a6c', '9c512cc7-21a5-4e36-a55c-01aff54bbcce', NULL, 1, 'view', '{\"name\":\"layouts_teacher_view.script\",\"path\":\"\\\\resources\\\\views\\/layouts_teacher_view\\/script.blade.php\",\"data\":[\"teachers\",\"__currentLoopData\",\"teacher\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:35'),
(31, '9c512cc7-1e08-4ac8-aa3a-a37f67705ed5', '9c512cc7-21a5-4e36-a55c-01aff54bbcce', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/dashboard\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Student\\\\StudentController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/login\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Ing2enZxVENIUGlDcFZreVFCcm55Rmc9PSIsInZhbHVlIjoiZ1VIL0h1bzEwTXJUSzBNYmx2djNqdFpCYjEyb3RzWWhzQ0svWGZhc3U0a3RwSko2Z0JDcmJZVEhzZldPaHZqaEl5dkhRTGlGOVNmU3p0STAvRjMyS0ZDajIrRU5mWVlVeXo2L29Yb0d1dVNwcWUra096YXJOZUJFYk5ONmZFQ20iLCJtYWMiOiIyNzQzOGJhZTA5MTY5MDZjNWJjMjIwMTQxMjg0NTRjZDlkOGFjOWQzNDZhM2I3NThjMThhY2UxNWRiN2IxZGU4IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6Iis4TGJ5YzR6bUkxcytZenBKOFlrYmc9PSIsInZhbHVlIjoiMlVZNGd0eWpjaWxXMlBxZ2tWVUsyOHRlaXhlWnlKLysrckhjcUpJS2RzR3QyR3RtMDZhOGc3VlNRekE3am9DUWNPU1BhTTZacVk4b1h2VU9laGJqTUEvUEUzcEF1OUh4STk1YmUyTEZqcER0ZWZ1d0g0ckZEcGxUeGpiMTJYRTEiLCJtYWMiOiI3ZDkxMTJhNWQyM2U2MWI5NDA0MTQ3YmI4NDkwZjliMzJjODY5MjZmMThlMjFlMDc5YzA4ZGY4Nzg2ZTczMGYzIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"UH7kCbkxRFifM5rvYHB8YIjCv68LqSGEdQ58bmEs\",\"flasher::envelopes\":[],\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\\/dashboard\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":5},\"response_status\":200,\"response\":\"HTML Response\",\"duration\":988,\"memory\":28,\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:35'),
(32, '9c512cc8-2fc0-4d36-b32e-5ad584423052', '9c512cc8-e7be-441c-b483-9c2defab41ae', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"4.63\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:36'),
(33, '9c512cc8-be9a-4ceb-9135-0fbd582402fe', '9c512cc8-e7be-441c-b483-9c2defab41ae', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\resources\\\\views\\/errors\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:36'),
(34, '9c512cc8-e59b-4723-84ac-5ae7dc384966', '9c512cc8-e7be-441c-b483-9c2defab41ae', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/app\\/teachers\\/1948100_0.jpeg\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept\":\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/dashboard\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkNGSTdza2RYQzNaVEFRSVlwNkdCeXc9PSIsInZhbHVlIjoiVU9xTU1aaE5JQTdXcDV0a2Y5THFBVzBWVW9GWlhsK1hKRzVicmZMUTVTQ3FrVmx2aVcyaDMzdThZbDh0SUoyRHhPR0J1VVY1K0p3cExJT3ZVWDJlcjYwVmErU3dwS0Fra3cycjk2QjZJZ21mWW1GcVZySVorYzI4TGVYU1BtdEwiLCJtYWMiOiIzOTFjOGQ0YmQxNjRkZjkyOTNlY2U0MjhjMDVjY2MwZTQ3ZWQ3NDJlYjljYjc0MmJiMDNjNmRhNjIyNzgxNTdiIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjM1bW9KMGlIeVpLY09lZ0IzRUtIZkE9PSIsInZhbHVlIjoiOG1GNmlYRGdDL0wvTm9zTVBhK3J1UUYybVQvTEs5dnNjNjljeTJGeTdmZWR1enFTNk16V0drYUNOaWZTa3hYYjVQVEd6N2RFLzdnRDJDSkNXMUg1T3pQdTVBbUkvYzlwdmtoK0lrQkFHeUpZT0w1MTQ4THJyb2xnOEJCY01kTFQiLCJtYWMiOiJkNjVlNWUzNTJjYWRlNTJiOTdhMWNjMzI0NzI4M2Y4MWM3NDY2MDRkM2Q2NDE0NjQ4ZmRmNTJkNDEzMmNjYTBlIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":727,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:36'),
(35, '9c512ccc-f293-4401-a02c-b4869e29b42d', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"16.31\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:39'),
(36, '9c512ccd-7489-4743-a37a-49b95592ddd6', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 5 limit 1\",\"time\":\"0.93\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:39'),
(37, '9c512ccd-74c6-495f-a68f-f411f8b12a72', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:39'),
(38, '9c512ccd-79a0-48eb-8fd5-4fad4b6c8bfa', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id` where `teachers`.`id` != \'1\' limit 1\",\"time\":\"0.80\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":18,\"hash\":\"edd49dd249c0f68af1c9bf517a4ca4c6\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:39'),
(39, '9c512ccd-7a30-4738-a56c-ab410e26932d', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id` where `teachers`.`id` = \'1\' limit 1\",\"time\":\"0.64\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":21,\"hash\":\"60a69391891eabacba0ffe195559a7ff\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:39'),
(40, '9c512ccd-7b30-4ebc-b415-8ab18dc3f30a', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.* from `months` where `months`.`status` = 0 and `months`.`teacher_id` = 1 group by `months`.`month_date` order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"1.83\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":32,\"hash\":\"551291d8c939d6f18af858edff48cff6\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:39'),
(41, '9c512ccd-826c-4b4c-809d-bc8ea81482e3', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.*, `month_student`.`lock`, `month_student`.`points_paid`, `month_student`.`user_id` from `month_student` inner join `months` on `month_student`.`month_id` = `months`.`id` where `month_student`.`user_id` = 5 and `month_student`.`teacher_id` = 1 order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"16.97\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":40,\"hash\":\"9b19da949a797e0c5bc669efb10f5be6\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:39'),
(42, '9c512cce-005f-44e4-99b6-f7d7326b81b1', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.`month_date`, Count(DISTINCT media.id) as book_count, `status` from `months` left join `media` on `months`.`month_date` = DATE_FORMAT(media.date_show, \'%Y-%m\') left join `users` on `users`.`school_grade_id` = `media`.`school_grade_id` where `months`.`status` = 0 and `media`.`teacher_id` = 1 and `months`.`teacher_id` = 1 and `media`.`school_grade_id` = 2 or `media`.`id` is null group by `months`.`month_date` order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"224.16\",\"slow\":true,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":54,\"hash\":\"cd7502cc8275af7e7e0c267346456d4f\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:39'),
(43, '9c512cce-0420-44b9-812a-ff27c23579b0', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.`month_date`, Count(DISTINCT lessons.id) as lesson_count, `status` from `months` left join `lessons` on `months`.`month_date` = DATE_FORMAT(lessons.date_show, \'%Y-%m\') left join `users` on `users`.`school_grade_id` = `lessons`.`school_grade_id` where `lessons`.`teacher_id` = 1 and `lessons`.`school_grade_id` = 2 or `lessons`.`id` is null and `months`.`teacher_id` = 1 group by `months`.`month_date` order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"6.51\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":64,\"hash\":\"ab20869b472c29ba9396836a13c8c854\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:39'),
(44, '9c512cce-07bc-418b-81ac-389b58c9365f', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.`month_date`, Count(DISTINCT exams.id) as exam_count, `status` from `months` left join `exams` on `months`.`month_date` = DATE_FORMAT(exams.date_exam, \'%Y-%m\') left join `users` on `users`.`school_grade_id` = `exams`.`school_grade_id` where `exams`.`teacher_id` = 1 and `exams`.`school_grade_id` = 2 or `exams`.`id` is null and `months`.`teacher_id` = 1 group by `months`.`month_date` order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"5.40\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":74,\"hash\":\"13f2063f46c5d33b2d860f8d1b283508\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:39'),
(45, '9c512cce-140c-4cc0-8492-92bc30dca1f2', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'view', '{\"name\":\"student.teacher\",\"path\":\"\\\\resources\\\\views\\/student\\/teacher.blade.php\",\"data\":[\"teacher_toggle\",\"teacher\",\"months\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:39'),
(46, '9c512cce-71fd-4825-9115-6a8a09d68a6f', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'view', '{\"name\":\"student.layouts.master\",\"path\":\"\\\\resources\\\\views\\/student\\/layouts\\/master.blade.php\",\"data\":[\"teachers\",\"teacher_toggle\",\"teacher\",\"months\",\"__currentLoopData\",\"month\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:40');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(47, '9c512cce-becf-4bc2-8ce5-bcec73a9d59e', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'view', '{\"name\":\"student.layouts.header\",\"path\":\"\\\\resources\\\\views\\/student\\/layouts\\/header.blade.php\",\"data\":[\"teachers\",\"teacher_toggle\",\"teacher\",\"months\",\"__currentLoopData\",\"month\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:40'),
(48, '9c512ccf-6c5f-4c07-ac4f-cad0641373f0', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `notifications` where `notifications`.`notifiable_type` = \'App\\\\Models\\\\User\' and `notifications`.`notifiable_id` = 5 and `notifications`.`notifiable_id` is not null and `read_at` is null order by `created_at` desc\",\"time\":\"15.62\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\storage\\\\framework\\\\views\\\\326669b10d6a6cdd9a2b856461d70f7e.php\",\"line\":199,\"hash\":\"3a882c3e2494509dba3a023dc0b6a196\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:40'),
(49, '9c512ccf-766d-4cd7-bfce-deac2cdfef81', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'view', '{\"name\":\"student.layouts.sidebar\",\"path\":\"\\\\resources\\\\views\\/student\\/layouts\\/sidebar.blade.php\",\"data\":[\"teachers\",\"teacher_toggle\",\"teacher\",\"months\",\"__currentLoopData\",\"month\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:40'),
(50, '9c512ccf-aabb-4ae5-9ffe-9c046b80b3d9', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'view', '{\"name\":\"layouts_teacher_view.script\",\"path\":\"\\\\resources\\\\views\\/layouts_teacher_view\\/script.blade.php\",\"data\":[\"teachers\",\"teacher_toggle\",\"teacher\",\"months\",\"__currentLoopData\",\"month\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:40'),
(51, '9c512ccf-b2fd-4894-87f2-4a5a86e8c018', '9c512ccf-b733-4291-bbcf-279684a03b02', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/dashboard\\/student\\/teacher\\/1\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Month\\\\MonthController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/dashboard\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkNGSTdza2RYQzNaVEFRSVlwNkdCeXc9PSIsInZhbHVlIjoiVU9xTU1aaE5JQTdXcDV0a2Y5THFBVzBWVW9GWlhsK1hKRzVicmZMUTVTQ3FrVmx2aVcyaDMzdThZbDh0SUoyRHhPR0J1VVY1K0p3cExJT3ZVWDJlcjYwVmErU3dwS0Fra3cycjk2QjZJZ21mWW1GcVZySVorYzI4TGVYU1BtdEwiLCJtYWMiOiIzOTFjOGQ0YmQxNjRkZjkyOTNlY2U0MjhjMDVjY2MwZTQ3ZWQ3NDJlYjljYjc0MmJiMDNjNmRhNjIyNzgxNTdiIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjM1bW9KMGlIeVpLY09lZ0IzRUtIZkE9PSIsInZhbHVlIjoiOG1GNmlYRGdDL0wvTm9zTVBhK3J1UUYybVQvTEs5dnNjNjljeTJGeTdmZWR1enFTNk16V0drYUNOaWZTa3hYYjVQVEd6N2RFLzdnRDJDSkNXMUg1T3pQdTVBbUkvYzlwdmtoK0lrQkFHeUpZT0w1MTQ4THJyb2xnOEJCY01kTFQiLCJtYWMiOiJkNjVlNWUzNTJjYWRlNTJiOTdhMWNjMzI0NzI4M2Y4MWM3NDY2MDRkM2Q2NDE0NjQ4ZmRmNTJkNDEzMmNjYTBlIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"UH7kCbkxRFifM5rvYHB8YIjCv68LqSGEdQ58bmEs\",\"flasher::envelopes\":[],\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\\/dashboard\\/student\\/teacher\\/1\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":5},\"response_status\":200,\"response\":\"HTML Response\",\"duration\":2128,\"memory\":26,\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:29:40'),
(52, '9c512cd0-a674-4c83-a8d4-9d6374d3776f', '9c512cd0-c397-4c3d-bafa-d946184e53b2', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"18.98\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:41'),
(53, '9c512cd0-c17b-43f6-beb5-ce36277dd619', '9c512cd0-c397-4c3d-bafa-d946184e53b2', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\resources\\\\views\\/errors\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:41'),
(54, '9c512cd0-c26b-4fed-96a9-8fb7f6d889c0', '9c512cd0-c397-4c3d-bafa-d946184e53b2', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/app\\/teachers\\/1948100_0.jpeg\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept\":\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/dashboard\\/student\\/teacher\\/1\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IjBVMTgrZEJnRm1PbnlQTWdIc0cxSUE9PSIsInZhbHVlIjoiUkV6bGN0V0I3YXZoeFlDQjB5QkU5N0ZabXoyODh1MFlWSEY1d0x6SVRVWGpDOEY5SzlGbnZKWXZVMkVGVjFBU1kzbkJWT3BIY09aMnhGSU1pMkw1OHZVem1uY3VJWlZEN3hGQlY4WVliV2ZEM2p2YmVsSlp3aURER1p2bTFEVUgiLCJtYWMiOiJlODlkMzQ1ZDk1MjAzOTFjMjBkNzM5Y2Q1MzhlOTVjODEyMzBkNTRmZWMwZjNiZjQyODhjMTc5NjJjOTcyMWM2IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6ImJ2UWtlMit5RHhVRGFxN2xZQS9QblE9PSIsInZhbHVlIjoiUkpLTGVRdGt2TXR0MEFYTmxQQU9aWE5TeWxDTGl2bHd5Q20rbk9Xd2Q4Q3pvMXNLSHAzNlJRa2hESVZObGpOYWlDSDFhOWxGbkZwZG01cmNYSFdjUTZqMWo0dWtRQzFHRzRwcE1mVDB1YzkvZTF0N0hlRHhpYXh4eWJJWEVESkgiLCJtYWMiOiJlZWYxZTM2MDc3Mjk0MDI0ODIzYjUwMWUyZTA1MDFiNjk2YTRhNzI5NThhZDQ2NzBjZGU3MGJkMjE4MWVkZWU4IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":559,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:29:41'),
(55, '9c512d4a-d244-4a40-8453-0ca3e1a4549f', '9c512d4b-1ad0-465e-bce2-0b8dc292e53c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"4.00\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:01'),
(56, '9c512d4b-0dca-4600-9024-e3b08fc5052e', '9c512d4b-1ad0-465e-bce2-0b8dc292e53c', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/dashboard\\/student\\/teacher\\/1\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Month\\\\MonthController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/dashboard\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IlgrbWlQWmNIbHRzdUs1M3pXOFZnZXc9PSIsInZhbHVlIjoiTkVKQ0VTbXhRalBObEJmOFZZN2lEZ2RZUkVvYzdvSEhZb0ZHOGw2SHhraUF2SjU0SENVc2kzU3liendZK1NtWjFtZ2puaGRJRGk1Q2pMUkE0dlFDNkxCLzlsdDcveEZFTUFUWnVocFNhb1NzZzVKYjdoNWtaajk2V003dDhwc28iLCJtYWMiOiI0ZDA2YTA1MzA1OWYwYjQxYmI3ZmNhNmMzYmM3ZTk3OGM5Mzk2OWQ1MTViYjMyYTYwNDFhYTc4NmQ1ZWFiYjgyIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkVqcXhUeW1EZjI2V2doaFRTNU5sYkE9PSIsInZhbHVlIjoiYWg5eUZtUm1ISmNkUm1SMjRmakw2LysyOTI2b2RHZEFJNENnNkZIZitPU2wzc0JVeDc3S0tzdHVwUERKN1VSSWs5OEJYejI2WXE1QURyT0oyNXF2cXUwK284K0NMQXB6dDdnNTAwa3hVcFdkK0EwU2ozOC85VVRNSkFUN2luWHYiLCJtYWMiOiJjN2Q1MTk1ZWI0ZmNjZDRlYTQ2OTQ0ZTI2ZTlkNTE5NTZlNTk4YjUzOTk3YmUyYWNhNjQ3ODQ2OGI5ZmI1MzcxIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"Nbr3vGo7NurAm40eQR5eubV2CSqDkIQNRdV1G8G6\",\"url\":{\"intended\":\"http:\\/\\/localhost\\/teachme\\/dashboard\\/student\\/teacher\\/1\"},\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\\/dashboard\\/student\\/teacher\\/1\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/localhost\\/teachme\\/login\",\"duration\":514,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:01'),
(57, '9c512d4b-a8d6-453d-a04d-043afbfbabb7', '9c512d4b-d5d3-4ddb-a24c-8435ca6e78ca', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"26.61\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:02'),
(58, '9c512d4b-cc46-4c57-9a39-6612fdde6fbb', '9c512d4b-d5d3-4ddb-a24c-8435ca6e78ca', NULL, 1, 'view', '{\"name\":\"auth.login\",\"path\":\"\\\\resources\\\\views\\/auth\\/login.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:02'),
(59, '9c512d4b-ce0a-49f8-84bf-8a04a4fb822f', '9c512d4b-d5d3-4ddb-a24c-8435ca6e78ca', NULL, 1, 'view', '{\"name\":\"layouts.guest\",\"path\":\"\\\\resources\\\\views\\/layouts\\/guest.blade.php\",\"data\":[\"teachers\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:02'),
(60, '9c512d4b-d485-4d29-ab2f-bc6702682067', '9c512d4b-d5d3-4ddb-a24c-8435ca6e78ca', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/login\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\AuthenticatedSessionController@create\",\"middleware\":[\"web\",\"guest\",\"guest:teacher\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/dashboard\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IndFc0NNWElFa0ZUYWNhMkhQblVYeHc9PSIsInZhbHVlIjoiTVdPVXkzRTlCcHpuQklZbFdMNlFZdjZYWlM1dk02SHo2c0VmL3gwS1Q3d1k5TXJRWTlyMGhDR0o4UHRnWUxKaU5HaEV1VmduRWtnQWtoOXFTMUpkWFVaVVBUN1hqc1JOZG9kKzg3MkJRZ0tLcEhqRCt5R3pGaWVlUXlLN3ptVVIiLCJtYWMiOiJiZTM0YTMyNjU0OGMwOGZlNGZkZDY0N2Q1M2ZlODdmMmVlZmE2MmViNmM0YzlmZWE5ZDU5MWZhMTI2MWE2NDhiIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6InZlMS9YTTZucHhadVd1MWtBTVc1V3c9PSIsInZhbHVlIjoiNy80b1hPMXdtVXNHVmJwdHl4dXVmYThlM0g2bjUxc3Mwd2JCa2dERTVmQmEwVWU5b0JnT1h2enhBRnpmQU9BWGZRR25NK0I3OEZxYjNMa2dtaWgwbGtENTFXN3JmUy83VmxXVllYK1RVN0lKVUtqSUcvUGlpbnl1UVRIaEplWHoiLCJtYWMiOiIyNjRkNGJkODZjY2IyNDJkYjc1ZmIzZDIwMWRjZDAzYjIyZTEzOGU1YTNhYjAzNDgzZGM1MDlmYTY0OTE4NzZhIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"Nbr3vGo7NurAm40eQR5eubV2CSqDkIQNRdV1G8G6\",\"url\":{\"intended\":\"http:\\/\\/localhost\\/teachme\\/dashboard\\/student\\/teacher\\/1\"},\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\\/login\"},\"_flash\":{\"old\":[],\"new\":[]},\"flasher::envelopes\":[]},\"response_status\":200,\"response\":\"HTML Response\",\"duration\":492,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:02'),
(61, '9c512d5d-3081-49a7-8388-1b9621eb8c80', '9c512d5d-9489-4a70-a8fd-d6ad8112dbba', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"17.48\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:13'),
(62, '9c512d5d-5bef-4c39-9ef1-bc2174eaee6b', '9c512d5d-9489-4a70-a8fd-d6ad8112dbba', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"ghada@gmail.com|::1\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:13'),
(63, '9c512d5d-620f-4bd6-a358-3dabc2039a1f', '9c512d5d-9489-4a70-a8fd-d6ad8112dbba', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `email` = \'ghada@gmail.com\' limit 1\",\"time\":\"0.81\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Requests\\\\Auth\\\\LoginRequest.php\",\"line\":44,\"hash\":\"747ef04de752900539e8a3a1aee036ac\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:13'),
(64, '9c512d5d-6246-4b75-b5a0-6f306e589d25', '9c512d5d-9489-4a70-a8fd-d6ad8112dbba', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:13'),
(65, '9c512d5d-9318-42a1-b3a6-73bbe3749643', '9c512d5d-9489-4a70-a8fd-d6ad8112dbba', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/login\\/store\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\AuthenticatedSessionController@store\",\"middleware\":[\"web\",\"guest\",\"guest:teacher\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"content-length\":\"90\",\"cache-control\":\"max-age=0\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"upgrade-insecure-requests\":\"1\",\"origin\":\"http:\\/\\/localhost\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/login\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6InNNWE1NM01Yb0I4OEtIeFNNVm54aEE9PSIsInZhbHVlIjoiUnhpWDVMRDh1dHB0NjllSXZlRENmQU41Q2pHd2hXZUp0TFozUkVOaTFuNGpTWWhnMVg2cE84djU2NkVDS25JOExOWDc3ZkY0WWI2UlNYRmJ5TVJFY1RPNjhGMGM3S1FLdDhHQVFkYWhkZ0pOdTZPQ0xyZ3VzQ0ptTC9OR3dkOUkiLCJtYWMiOiI0ZDkwZjNiMjQwODMxNWNmNDgzMzc0NGFmZGZjNWEzNzY1NzdhYzVhN2E1MTkxNGUyZjJhOWExM2MzMWZlZTY5IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlQvcFVYT3JBeXNaRE1BQ1JLdi9GeXc9PSIsInZhbHVlIjoidTVYUnBDOFV3QnVOTmo2SThqRjVHTWlGSTZpNjJta1lieHlIWGViRmJ5Z1BxMVFnU3B5WWlyZ29FOEdUOFpMYTRybXYxbERPQVBRWGczbzkyWURsRnR5VVBJTEprVXFjYmlEZVVNWURrZGRnSWdZNHFYWERtU1A4cXZWeXFFU0MiLCJtYWMiOiI5M2QyMjkyMTI0MjVjMDIxNWQzZDg1NTM1NmJiMWRhYjVhMzJmOWJkNmU0MjMxZjNjYmY3ZTk1ZjhlNzE2YTFiIiwidGFnIjoiIn0%3D\"},\"payload\":{\"_token\":\"Nbr3vGo7NurAm40eQR5eubV2CSqDkIQNRdV1G8G6\",\"email\":\"ghada@gmail.com\",\"password\":\"********\"},\"session\":{\"_token\":\"NccE0bFdNyKWS5jGePdrJ4xmt4BBLXF0iW80Jgxh\",\"url\":{\"intended\":\"http:\\/\\/localhost\\/teachme\\/dashboard\\/student\\/teacher\\/1\"},\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\\/login\"},\"_flash\":{\"old\":[],\"new\":[]},\"flasher::envelopes\":[],\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":5},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/localhost\\/teachme\\/dashboard\",\"duration\":523,\"memory\":26,\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:13'),
(66, '9c512d66-f3fb-442f-8e46-6069dd5e642d', '9c512d67-2cca-4338-bf07-b570f580c72e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"17.05\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:20'),
(67, '9c512d67-1371-47a9-bab4-b215e967a680', '9c512d67-2cca-4338-bf07-b570f580c72e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 5 limit 1\",\"time\":\"0.92\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:20'),
(68, '9c512d67-13ad-4879-90f2-d393c785f204', '9c512d67-2cca-4338-bf07-b570f580c72e', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:20'),
(69, '9c512d67-187b-46d2-b200-58766dd7fd56', '9c512d67-2cca-4338-bf07-b570f580c72e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject_name` from `teachers` inner join `subjects` on `teachers`.`subject_id` = `subjects`.`id`\",\"time\":\"0.82\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Student\\\\StudentController.php\",\"line\":22,\"hash\":\"b07113c717328bac17c5c60be41a28d7\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:20'),
(70, '9c512d67-1a92-40b1-ad98-18635fe723bb', '9c512d67-2cca-4338-bf07-b570f580c72e', NULL, 1, 'view', '{\"name\":\"student.dashboard\",\"path\":\"\\\\resources\\\\views\\/student\\/dashboard.blade.php\",\"data\":[\"teachers\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:20'),
(71, '9c512d67-1c0f-45d8-a6ae-bae8eec82b5b', '9c512d67-2cca-4338-bf07-b570f580c72e', NULL, 1, 'view', '{\"name\":\"layouts_teacher_view.script\",\"path\":\"\\\\resources\\\\views\\/layouts_teacher_view\\/script.blade.php\",\"data\":[\"teachers\",\"__currentLoopData\",\"teacher\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:20'),
(72, '9c512d67-293f-4e48-b739-7c014f2d1c0c', '9c512d67-2cca-4338-bf07-b570f580c72e', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/dashboard\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Student\\\\StudentController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Im5ncG5aOFZIVWg5NFVNQjhNQm9nV2c9PSIsInZhbHVlIjoiRE1rcnJxU0xWaDNvN1pTUU8vNnp3RGU2emtwVTc4OFQrdVZsVVpMT0JEOXpaNEs5TG0yekNRL0h5MFdXN3ZHVC9RZldoZmxMY0lNbmlXTGdhazBxWG5GTjlvbFFhS2twcUh4TGl3dlM0SVpGanhJU2dTbEhUS0ZwbzdHUUt6UEUiLCJtYWMiOiI2Mzc3ZGU4ZWVhZmFlNjI1MzQ5Mjk0YTYzNGQ0NjJiMDUxN2ZlYTkwMGFmYjg3Y2Q3MmJjODM3NWI1ZGE0Y2NhIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6InhFRXcwRFMwcThmV3l0WVhCd3Y1WlE9PSIsInZhbHVlIjoiYlFjU0laeTRPYldySVZlc1Z1NkhYZVlYTTRsQ2Zwa3pzYk1Ud25vVTJKTy9nSndkRCs1MHhDaVpxZnVITnUzMUJOMGdVZTNjY0RDQjFoQUlPTnBuV3M5WmdudTVuWGl5Q1BDa0xGUXU5ek9QV016VVJ0SnFldWxheG15S3E4Z0UiLCJtYWMiOiJlMzEwZmI5MzBiODgxZjgyNDI3MGJmMzU0YjY5ZThjNjA5YzM4NTg3ZDM3ZGFmZGRjYWVmMmNiYzZlZDEzMzc3IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"NccE0bFdNyKWS5jGePdrJ4xmt4BBLXF0iW80Jgxh\",\"url\":{\"intended\":\"http:\\/\\/localhost\\/teachme\\/dashboard\\/student\\/teacher\\/1\"},\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\\/dashboard\"},\"_flash\":{\"old\":[],\"new\":[]},\"flasher::envelopes\":[],\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":5},\"response_status\":200,\"response\":\"HTML Response\",\"duration\":494,\"memory\":26,\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:20'),
(73, '9c512d67-cea5-4fce-a0a3-bc71c9af785d', '9c512d67-eb32-42d5-9051-26a029fd83d0', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"3.04\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:20'),
(74, '9c512d67-e8db-4970-b36c-80b782bc72e3', '9c512d67-eb32-42d5-9051-26a029fd83d0', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\resources\\\\views\\/errors\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:20'),
(75, '9c512d67-e9ca-4d5c-b257-005c6e53ea95', '9c512d67-eb32-42d5-9051-26a029fd83d0', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/app\\/teachers\\/1948100_0.jpeg\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept\":\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/dashboard\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkI3eEc2a2didkRuTEwrK0lPVFlSN1E9PSIsInZhbHVlIjoiMmJRQ3ZIU0g0eVRGSWFKUTdiOTZ3SDFjMWE5WGdMS3pjQTlXZVNza0pDN3oweWpONllFTlFGelVoQkt6SGhrY2hla1ZCL3NpYk82S1ZJYlFUUkpyWFA1RnZuWnFLMmFNUSswUGpNaVJLTWNOdS9aWjl6aXZCc05pRmxXK1N6OXUiLCJtYWMiOiJkYmJiZjlkNjg3MGVmNDAyMzI0MjZjZjdiNGYwZmQxOTA2MTgyNTU3ZTRlNTllMDUyYTdmNTQwMWZkYmU3NTJjIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlBibHFBNkNtY2Foc2o3RUdUNXg2dUE9PSIsInZhbHVlIjoiSFZrM0ZlcnhkRFlYaHNWUHQwR09sandYNDcySWNZMlRHUmNRWEQ5RkVoTUdkVkdvUHpXN1dicWZMVDJsUTV4ajBYNVRJUCtnREVRbVFrK2cvMG5mTm1saWNhbVljTnRFc1B4bmtpTFJTT2tOWmFoY21LR2JNdDFRWmMzclY0R3ciLCJtYWMiOiIwY2ExYmZlNjQzNDY2ZmU5MDcxYzNkNDIyYmJhNGQ0NmJlMWZlNjJmMzdlNzZiYjVhN2MyNjNjZGQzNTRlODQ4IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":361,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:20'),
(76, '9c512d6a-dcda-44dd-bbae-be6cdb94d8ca', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"22.28\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:22'),
(77, '9c512d6b-010e-4686-aabc-359ff8794a78', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 5 limit 1\",\"time\":\"0.92\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:22'),
(78, '9c512d6b-014a-454b-8b68-21685c9c3f3b', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:22'),
(79, '9c512d6b-0516-4152-9782-4233d9a8f2d7', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id` where `teachers`.`id` != \'1\' limit 1\",\"time\":\"0.91\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":18,\"hash\":\"edd49dd249c0f68af1c9bf517a4ca4c6\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(80, '9c512d6b-05b7-4e35-97fd-bb615b905950', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id` where `teachers`.`id` = \'1\' limit 1\",\"time\":\"0.72\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":21,\"hash\":\"60a69391891eabacba0ffe195559a7ff\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(81, '9c512d6b-0665-4f3e-8ba7-3fde6f05ef02', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.* from `months` where `months`.`status` = 0 and `months`.`teacher_id` = 1 group by `months`.`month_date` order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"1.07\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":32,\"hash\":\"551291d8c939d6f18af858edff48cff6\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(82, '9c512d6b-0719-4631-9b39-8db576623f21', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.*, `month_student`.`lock`, `month_student`.`points_paid`, `month_student`.`user_id` from `month_student` inner join `months` on `month_student`.`month_id` = `months`.`id` where `month_student`.`user_id` = 5 and `month_student`.`teacher_id` = 1 order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"1.04\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":40,\"hash\":\"9b19da949a797e0c5bc669efb10f5be6\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(83, '9c512d6b-0845-4bc8-999b-07a33afa82e9', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.`month_date`, Count(DISTINCT media.id) as book_count, `status` from `months` left join `media` on `months`.`month_date` = DATE_FORMAT(media.date_show, \'%Y-%m\') left join `users` on `users`.`school_grade_id` = `media`.`school_grade_id` where `months`.`status` = 0 and `media`.`teacher_id` = 1 and `months`.`teacher_id` = 1 and `media`.`school_grade_id` = 3 or `media`.`id` is null group by `months`.`month_date` order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"1.59\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":54,\"hash\":\"cd7502cc8275af7e7e0c267346456d4f\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(84, '9c512d6b-0931-4152-ad54-88a3222ccd6c', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.`month_date`, Count(DISTINCT lessons.id) as lesson_count, `status` from `months` left join `lessons` on `months`.`month_date` = DATE_FORMAT(lessons.date_show, \'%Y-%m\') left join `users` on `users`.`school_grade_id` = `lessons`.`school_grade_id` where `lessons`.`teacher_id` = 1 and `lessons`.`school_grade_id` = 3 or `lessons`.`id` is null and `months`.`teacher_id` = 1 group by `months`.`month_date` order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"1.45\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":64,\"hash\":\"ab20869b472c29ba9396836a13c8c854\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(85, '9c512d6b-0a19-4430-8070-ca283a4e57d1', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.`month_date`, Count(DISTINCT exams.id) as exam_count, `status` from `months` left join `exams` on `months`.`month_date` = DATE_FORMAT(exams.date_exam, \'%Y-%m\') left join `users` on `users`.`school_grade_id` = `exams`.`school_grade_id` where `exams`.`teacher_id` = 1 and `exams`.`school_grade_id` = 3 or `exams`.`id` is null and `months`.`teacher_id` = 1 group by `months`.`month_date` order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"1.41\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":74,\"hash\":\"13f2063f46c5d33b2d860f8d1b283508\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(86, '9c512d6b-0c35-40e2-a9d9-aa4ca58ebce4', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'view', '{\"name\":\"student.teacher\",\"path\":\"\\\\resources\\\\views\\/student\\/teacher.blade.php\",\"data\":[\"teacher_toggle\",\"teacher\",\"months\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(87, '9c512d6b-0cbe-4b95-ab9b-06c3f87b5976', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'view', '{\"name\":\"student.layouts.master\",\"path\":\"\\\\resources\\\\views\\/student\\/layouts\\/master.blade.php\",\"data\":[\"teachers\",\"teacher_toggle\",\"teacher\",\"months\",\"__currentLoopData\",\"month\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(88, '9c512d6b-0dd0-4bc7-935b-2cd47100013c', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'view', '{\"name\":\"student.layouts.header\",\"path\":\"\\\\resources\\\\views\\/student\\/layouts\\/header.blade.php\",\"data\":[\"teachers\",\"teacher_toggle\",\"teacher\",\"months\",\"__currentLoopData\",\"month\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(89, '9c512d6b-0fef-41ab-a530-34fb5918c485', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `notifications` where `notifications`.`notifiable_type` = \'App\\\\Models\\\\User\' and `notifications`.`notifiable_id` = 5 and `notifications`.`notifiable_id` is not null and `read_at` is null order by `created_at` desc\",\"time\":\"1.18\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\storage\\\\framework\\\\views\\\\326669b10d6a6cdd9a2b856461d70f7e.php\",\"line\":199,\"hash\":\"3a882c3e2494509dba3a023dc0b6a196\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(90, '9c512d6b-1067-49d7-88ee-50805c6b07e1', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'view', '{\"name\":\"student.layouts.sidebar\",\"path\":\"\\\\resources\\\\views\\/student\\/layouts\\/sidebar.blade.php\",\"data\":[\"teachers\",\"teacher_toggle\",\"teacher\",\"months\",\"__currentLoopData\",\"month\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(91, '9c512d6b-10f8-4327-88b7-b4db166f19de', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'view', '{\"name\":\"layouts_teacher_view.script\",\"path\":\"\\\\resources\\\\views\\/layouts_teacher_view\\/script.blade.php\",\"data\":[\"teachers\",\"teacher_toggle\",\"teacher\",\"months\",\"__currentLoopData\",\"month\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(92, '9c512d6b-2188-41b9-b728-92c2b9b2d451', '9c512d6b-253d-43a9-a0ea-29f2f1c5983c', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/dashboard\\/student\\/teacher\\/1\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Month\\\\MonthController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/dashboard\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkI3eEc2a2didkRuTEwrK0lPVFlSN1E9PSIsInZhbHVlIjoiMmJRQ3ZIU0g0eVRGSWFKUTdiOTZ3SDFjMWE5WGdMS3pjQTlXZVNza0pDN3oweWpONllFTlFGelVoQkt6SGhrY2hla1ZCL3NpYk82S1ZJYlFUUkpyWFA1RnZuWnFLMmFNUSswUGpNaVJLTWNOdS9aWjl6aXZCc05pRmxXK1N6OXUiLCJtYWMiOiJkYmJiZjlkNjg3MGVmNDAyMzI0MjZjZjdiNGYwZmQxOTA2MTgyNTU3ZTRlNTllMDUyYTdmNTQwMWZkYmU3NTJjIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlBibHFBNkNtY2Foc2o3RUdUNXg2dUE9PSIsInZhbHVlIjoiSFZrM0ZlcnhkRFlYaHNWUHQwR09sandYNDcySWNZMlRHUmNRWEQ5RkVoTUdkVkdvUHpXN1dicWZMVDJsUTV4ajBYNVRJUCtnREVRbVFrK2cvMG5mTm1saWNhbVljTnRFc1B4bmtpTFJTT2tOWmFoY21LR2JNdDFRWmMzclY0R3ciLCJtYWMiOiIwY2ExYmZlNjQzNDY2ZmU5MDcxYzNkNDIyYmJhNGQ0NmJlMWZlNjJmMzdlNzZiYjVhN2MyNjNjZGQzNTRlODQ4IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"NccE0bFdNyKWS5jGePdrJ4xmt4BBLXF0iW80Jgxh\",\"url\":{\"intended\":\"http:\\/\\/localhost\\/teachme\\/dashboard\\/student\\/teacher\\/1\"},\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\\/dashboard\\/student\\/teacher\\/1\"},\"_flash\":{\"old\":[],\"new\":[]},\"flasher::envelopes\":[],\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":5},\"response_status\":200,\"response\":\"HTML Response\",\"duration\":469,\"memory\":26,\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:22'),
(93, '9c512d6b-dec4-4188-b489-8c4b965332c9', '9c512d6c-0491-4f89-8680-38dfd1bbaadc', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"10.77\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:23'),
(94, '9c512d6c-0026-49ef-9623-4bd2bed86d21', '9c512d6c-0491-4f89-8680-38dfd1bbaadc', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\resources\\\\views\\/errors\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:23'),
(95, '9c512d6c-021d-452c-9f0c-7f644ca5422b', '9c512d6c-0491-4f89-8680-38dfd1bbaadc', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/app\\/teachers\\/1948100_0.jpeg\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept\":\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/dashboard\\/student\\/teacher\\/1\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkJNeEVNemVwVk5KN1dtVTAyOTRCQWc9PSIsInZhbHVlIjoiREZpWFJtNXZ3aGpIMTZ1dWlzMmllbGJEQlBFUGZ6eUJJRmxzTUk0aEtBUmRMaTREL3gxcVRpVGk4TU5DQW1jZkc4T2xvOVJaR01aQm90dkxqcHF1cTRFeVRBemg1eHpYWnY3aUI1OVpHcVFpS1dnSVdTYzVsOVR0TG0zbjdYVnciLCJtYWMiOiIyZDc5MTZjOThmOTM0MTM3ZGRhMjA3NzhkYWU0MWQ2Zjg0ZjUwMmE5NzA1NmUxZTRhMDJkNDU3NzE1NjIzNzJmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkJ2TDhnQXZrL083c0lSSlRtbjhhbGc9PSIsInZhbHVlIjoic0hLZ1VuQ0d0N2RhM08yVFdQVVFVTXhadm55M21VWXQ2SHFWNHgyeWZBdXh6SHMwamZROHZtb1VkcWhmV0JzVlYxTlRIdTh1UmZTOTM1NUczR2lHZ1ZIMzBZcVFTWnhDNkRrMTF3M3FpS05DcnpPZFRNMzA4Z2tyR285V1pYMGwiLCJtYWMiOiJhOTA2YTFjYTgyYWJmYTQ1MTg5NzgwZjIzM2NkZDQ2ZjBjOGI5M2RmMzY4MGQ0MzhhYjE0MDQ3MmJmMTljZmNhIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":459,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:23'),
(96, '9c512d89-f761-4d75-9de4-ac2e8a89a2b4', '9c512d8a-202a-46f7-8515-28592a0c3432', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"4.06\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:43'),
(97, '9c512d8a-1cc0-4bae-b36c-fdfb8e7df965', '9c512d8a-202a-46f7-8515-28592a0c3432', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\resources\\\\views\\/errors\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:43'),
(98, '9c512d8a-1e79-425a-8643-0f5715c5f800', '9c512d8a-202a-46f7-8515-28592a0c3432', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/assets\\/student_assets\\/js\\/libs\\/bootstrap.min.js.map\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"empty\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkJNeEVNemVwVk5KN1dtVTAyOTRCQWc9PSIsInZhbHVlIjoiREZpWFJtNXZ3aGpIMTZ1dWlzMmllbGJEQlBFUGZ6eUJJRmxzTUk0aEtBUmRMaTREL3gxcVRpVGk4TU5DQW1jZkc4T2xvOVJaR01aQm90dkxqcHF1cTRFeVRBemg1eHpYWnY3aUI1OVpHcVFpS1dnSVdTYzVsOVR0TG0zbjdYVnciLCJtYWMiOiIyZDc5MTZjOThmOTM0MTM3ZGRhMjA3NzhkYWU0MWQ2Zjg0ZjUwMmE5NzA1NmUxZTRhMDJkNDU3NzE1NjIzNzJmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkJ2TDhnQXZrL083c0lSSlRtbjhhbGc9PSIsInZhbHVlIjoic0hLZ1VuQ0d0N2RhM08yVFdQVVFVTXhadm55M21VWXQ2SHFWNHgyeWZBdXh6SHMwamZROHZtb1VkcWhmV0JzVlYxTlRIdTh1UmZTOTM1NUczR2lHZ1ZIMzBZcVFTWnhDNkRrMTF3M3FpS05DcnpPZFRNMzA4Z2tyR285V1pYMGwiLCJtYWMiOiJhOTA2YTFjYTgyYWJmYTQ1MTg5NzgwZjIzM2NkZDQ2ZjBjOGI5M2RmMzY4MGQ0MzhhYjE0MDQ3MmJmMTljZmNhIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":441,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:43'),
(99, '9c512d8a-227d-42c3-b677-b7fc4b5c906b', '9c512d8a-570b-4e9b-9cda-1fc1ded8d542', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"4.36\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:43'),
(100, '9c512d8a-5339-4cea-b6e0-fb601ea4f3a4', '9c512d8a-570b-4e9b-9cda-1fc1ded8d542', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\resources\\\\views\\/errors\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:43'),
(101, '9c512d8a-54fe-49ed-bc75-a55cd721eade', '9c512d8a-570b-4e9b-9cda-1fc1ded8d542', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/assets\\/student_assets\\/js\\/libs\\/popper.min.js.map\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"empty\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkJNeEVNemVwVk5KN1dtVTAyOTRCQWc9PSIsInZhbHVlIjoiREZpWFJtNXZ3aGpIMTZ1dWlzMmllbGJEQlBFUGZ6eUJJRmxzTUk0aEtBUmRMaTREL3gxcVRpVGk4TU5DQW1jZkc4T2xvOVJaR01aQm90dkxqcHF1cTRFeVRBemg1eHpYWnY3aUI1OVpHcVFpS1dnSVdTYzVsOVR0TG0zbjdYVnciLCJtYWMiOiIyZDc5MTZjOThmOTM0MTM3ZGRhMjA3NzhkYWU0MWQ2Zjg0ZjUwMmE5NzA1NmUxZTRhMDJkNDU3NzE1NjIzNzJmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkJ2TDhnQXZrL083c0lSSlRtbjhhbGc9PSIsInZhbHVlIjoic0hLZ1VuQ0d0N2RhM08yVFdQVVFVTXhadm55M21VWXQ2SHFWNHgyeWZBdXh6SHMwamZROHZtb1VkcWhmV0JzVlYxTlRIdTh1UmZTOTM1NUczR2lHZ1ZIMzBZcVFTWnhDNkRrMTF3M3FpS05DcnpPZFRNMzA4Z2tyR285V1pYMGwiLCJtYWMiOiJhOTA2YTFjYTgyYWJmYTQ1MTg5NzgwZjIzM2NkZDQ2ZjBjOGI5M2RmMzY4MGQ0MzhhYjE0MDQ3MmJmMTljZmNhIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":580,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:43'),
(102, '9c512d8a-2ecb-41e0-ab4a-3929d840bfcd', '9c512d8a-5b4e-4282-8995-85ebcb8fda30', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"5.09\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:43'),
(103, '9c512d8a-5854-4224-9bda-a18e0543f410', '9c512d8a-5b4e-4282-8995-85ebcb8fda30', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\resources\\\\views\\/errors\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:43'),
(104, '9c512d8a-5971-4b1f-9f7f-5fee4cdec737', '9c512d8a-5b4e-4282-8995-85ebcb8fda30', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/assets\\/student_assets\\/scss\\/libs\\/bootstrap.min.css.map\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"empty\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkJNeEVNemVwVk5KN1dtVTAyOTRCQWc9PSIsInZhbHVlIjoiREZpWFJtNXZ3aGpIMTZ1dWlzMmllbGJEQlBFUGZ6eUJJRmxzTUk0aEtBUmRMaTREL3gxcVRpVGk4TU5DQW1jZkc4T2xvOVJaR01aQm90dkxqcHF1cTRFeVRBemg1eHpYWnY3aUI1OVpHcVFpS1dnSVdTYzVsOVR0TG0zbjdYVnciLCJtYWMiOiIyZDc5MTZjOThmOTM0MTM3ZGRhMjA3NzhkYWU0MWQ2Zjg0ZjUwMmE5NzA1NmUxZTRhMDJkNDU3NzE1NjIzNzJmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkJ2TDhnQXZrL083c0lSSlRtbjhhbGc9PSIsInZhbHVlIjoic0hLZ1VuQ0d0N2RhM08yVFdQVVFVTXhadm55M21VWXQ2SHFWNHgyeWZBdXh6SHMwamZROHZtb1VkcWhmV0JzVlYxTlRIdTh1UmZTOTM1NUczR2lHZ1ZIMzBZcVFTWnhDNkRrMTF3M3FpS05DcnpPZFRNMzA4Z2tyR285V1pYMGwiLCJtYWMiOiJhOTA2YTFjYTgyYWJmYTQ1MTg5NzgwZjIzM2NkZDQ2ZjBjOGI5M2RmMzY4MGQ0MzhhYjE0MDQ3MmJmMTljZmNhIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":571,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:43'),
(105, '9c512d8a-4530-4f90-90f9-06c615e3013f', '9c512d8a-79ba-4cb6-be58-a92af743be08', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"4.07\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:43'),
(106, '9c512d8a-75d1-43b9-bedf-7b1dca84ed23', '9c512d8a-79ba-4cb6-be58-a92af743be08', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\resources\\\\views\\/errors\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:43');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(107, '9c512d8a-778c-43d7-8889-983b345a230c', '9c512d8a-79ba-4cb6-be58-a92af743be08', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/assets\\/student_assets\\/main.css.map\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"empty\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkJNeEVNemVwVk5KN1dtVTAyOTRCQWc9PSIsInZhbHVlIjoiREZpWFJtNXZ3aGpIMTZ1dWlzMmllbGJEQlBFUGZ6eUJJRmxzTUk0aEtBUmRMaTREL3gxcVRpVGk4TU5DQW1jZkc4T2xvOVJaR01aQm90dkxqcHF1cTRFeVRBemg1eHpYWnY3aUI1OVpHcVFpS1dnSVdTYzVsOVR0TG0zbjdYVnciLCJtYWMiOiIyZDc5MTZjOThmOTM0MTM3ZGRhMjA3NzhkYWU0MWQ2Zjg0ZjUwMmE5NzA1NmUxZTRhMDJkNDU3NzE1NjIzNzJmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkJ2TDhnQXZrL083c0lSSlRtbjhhbGc9PSIsInZhbHVlIjoic0hLZ1VuQ0d0N2RhM08yVFdQVVFVTXhadm55M21VWXQ2SHFWNHgyeWZBdXh6SHMwamZROHZtb1VkcWhmV0JzVlYxTlRIdTh1UmZTOTM1NUczR2lHZ1ZIMzBZcVFTWnhDNkRrMTF3M3FpS05DcnpPZFRNMzA4Z2tyR285V1pYMGwiLCJtYWMiOiJhOTA2YTFjYTgyYWJmYTQ1MTg5NzgwZjIzM2NkZDQ2ZjBjOGI5M2RmMzY4MGQ0MzhhYjE0MDQ3MmJmMTljZmNhIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":648,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:43'),
(108, '9c512d94-840e-49ad-be21-c2cc5711ee9e', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"5.51\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:49'),
(109, '9c512d94-9f92-44e6-90c7-3b24fd3efea6', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 5 limit 1\",\"time\":\"0.89\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:49'),
(110, '9c512d94-9fce-4264-99e3-13d986b0690a', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:49'),
(111, '9c512d94-a3db-4f0b-8029-e46c1baa0d41', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id` where `teachers`.`id` != \'1\' limit 1\",\"time\":\"0.81\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":18,\"hash\":\"edd49dd249c0f68af1c9bf517a4ca4c6\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(112, '9c512d94-a46b-4a85-9735-671cdb4b3f88', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id` where `teachers`.`id` = \'1\' limit 1\",\"time\":\"0.63\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":21,\"hash\":\"60a69391891eabacba0ffe195559a7ff\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(113, '9c512d94-a4fb-4632-8b68-2ffe1d75f19f', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.* from `months` where `months`.`status` = 0 and `months`.`teacher_id` = 1 group by `months`.`month_date` order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"0.78\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":32,\"hash\":\"551291d8c939d6f18af858edff48cff6\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(114, '9c512d94-a597-409b-9056-53be5ae89397', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.*, `month_student`.`lock`, `month_student`.`points_paid`, `month_student`.`user_id` from `month_student` inner join `months` on `month_student`.`month_id` = `months`.`id` where `month_student`.`user_id` = 5 and `month_student`.`teacher_id` = 1 order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"0.80\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":40,\"hash\":\"9b19da949a797e0c5bc669efb10f5be6\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(115, '9c512d94-a6c8-455c-8ffa-8142c3b865e6', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.`month_date`, Count(DISTINCT media.id) as book_count, `status` from `months` left join `media` on `months`.`month_date` = DATE_FORMAT(media.date_show, \'%Y-%m\') left join `users` on `users`.`school_grade_id` = `media`.`school_grade_id` where `months`.`status` = 0 and `media`.`teacher_id` = 1 and `months`.`teacher_id` = 1 and `media`.`school_grade_id` = 3 or `media`.`id` is null group by `months`.`month_date` order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"1.44\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":54,\"hash\":\"cd7502cc8275af7e7e0c267346456d4f\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(116, '9c512d94-a7c4-4471-a12c-5123faf1e734', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.`month_date`, Count(DISTINCT lessons.id) as lesson_count, `status` from `months` left join `lessons` on `months`.`month_date` = DATE_FORMAT(lessons.date_show, \'%Y-%m\') left join `users` on `users`.`school_grade_id` = `lessons`.`school_grade_id` where `lessons`.`teacher_id` = 1 and `lessons`.`school_grade_id` = 3 or `lessons`.`id` is null and `months`.`teacher_id` = 1 group by `months`.`month_date` order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"1.35\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":64,\"hash\":\"ab20869b472c29ba9396836a13c8c854\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(117, '9c512d94-a88d-4932-bdef-97fa288936f4', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `months`.`month_date`, Count(DISTINCT exams.id) as exam_count, `status` from `months` left join `exams` on `months`.`month_date` = DATE_FORMAT(exams.date_exam, \'%Y-%m\') left join `users` on `users`.`school_grade_id` = `exams`.`school_grade_id` where `exams`.`teacher_id` = 1 and `exams`.`school_grade_id` = 3 or `exams`.`id` is null and `months`.`teacher_id` = 1 group by `months`.`month_date` order by `months`.`year` asc, `months`.`orderValue` asc\",\"time\":\"1.09\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Http\\\\Controllers\\\\Month\\\\MonthController.php\",\"line\":74,\"hash\":\"13f2063f46c5d33b2d860f8d1b283508\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(118, '9c512d94-aa98-4506-bbf8-6de6e2bea07f', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'view', '{\"name\":\"student.teacher\",\"path\":\"\\\\resources\\\\views\\/student\\/teacher.blade.php\",\"data\":[\"teacher_toggle\",\"teacher\",\"months\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(119, '9c512d94-ab11-486d-9d18-adbbe755bcf1', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'view', '{\"name\":\"student.layouts.master\",\"path\":\"\\\\resources\\\\views\\/student\\/layouts\\/master.blade.php\",\"data\":[\"teachers\",\"teacher_toggle\",\"teacher\",\"months\",\"__currentLoopData\",\"month\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(120, '9c512d94-ac26-4be5-9999-983938aa817d', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'view', '{\"name\":\"student.layouts.header\",\"path\":\"\\\\resources\\\\views\\/student\\/layouts\\/header.blade.php\",\"data\":[\"teachers\",\"teacher_toggle\",\"teacher\",\"months\",\"__currentLoopData\",\"month\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(121, '9c512d94-ae43-49f6-9ffa-8fe3c286a396', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `notifications` where `notifications`.`notifiable_type` = \'App\\\\Models\\\\User\' and `notifications`.`notifiable_id` = 5 and `notifications`.`notifiable_id` is not null and `read_at` is null order by `created_at` desc\",\"time\":\"0.93\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\storage\\\\framework\\\\views\\\\326669b10d6a6cdd9a2b856461d70f7e.php\",\"line\":199,\"hash\":\"3a882c3e2494509dba3a023dc0b6a196\",\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(122, '9c512d94-aebd-4d4f-96fb-38fdc00377d8', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'view', '{\"name\":\"student.layouts.sidebar\",\"path\":\"\\\\resources\\\\views\\/student\\/layouts\\/sidebar.blade.php\",\"data\":[\"teachers\",\"teacher_toggle\",\"teacher\",\"months\",\"__currentLoopData\",\"month\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(123, '9c512d94-af62-4a13-b53b-a470413ca038', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'view', '{\"name\":\"layouts_teacher_view.script\",\"path\":\"\\\\resources\\\\views\\/layouts_teacher_view\\/script.blade.php\",\"data\":[\"teachers\",\"teacher_toggle\",\"teacher\",\"months\",\"__currentLoopData\",\"month\",\"loop\"],\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(124, '9c512d94-b2d1-40cc-b922-5e3ed9ec9c2f', '9c512d94-b40d-4917-85db-69bd637f80bd', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/dashboard\\/student\\/teacher\\/1\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Month\\\\MonthController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"referer\":\"http:\\/\\/localhost\\/teachme\\/dashboard\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkJNeEVNemVwVk5KN1dtVTAyOTRCQWc9PSIsInZhbHVlIjoiREZpWFJtNXZ3aGpIMTZ1dWlzMmllbGJEQlBFUGZ6eUJJRmxzTUk0aEtBUmRMaTREL3gxcVRpVGk4TU5DQW1jZkc4T2xvOVJaR01aQm90dkxqcHF1cTRFeVRBemg1eHpYWnY3aUI1OVpHcVFpS1dnSVdTYzVsOVR0TG0zbjdYVnciLCJtYWMiOiIyZDc5MTZjOThmOTM0MTM3ZGRhMjA3NzhkYWU0MWQ2Zjg0ZjUwMmE5NzA1NmUxZTRhMDJkNDU3NzE1NjIzNzJmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkJ2TDhnQXZrL083c0lSSlRtbjhhbGc9PSIsInZhbHVlIjoic0hLZ1VuQ0d0N2RhM08yVFdQVVFVTXhadm55M21VWXQ2SHFWNHgyeWZBdXh6SHMwamZROHZtb1VkcWhmV0JzVlYxTlRIdTh1UmZTOTM1NUczR2lHZ1ZIMzBZcVFTWnhDNkRrMTF3M3FpS05DcnpPZFRNMzA4Z2tyR285V1pYMGwiLCJtYWMiOiJhOTA2YTFjYTgyYWJmYTQ1MTg5NzgwZjIzM2NkZDQ2ZjBjOGI5M2RmMzY4MGQ0MzhhYjE0MDQ3MmJmMTljZmNhIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"NccE0bFdNyKWS5jGePdrJ4xmt4BBLXF0iW80Jgxh\",\"url\":{\"intended\":\"http:\\/\\/localhost\\/teachme\\/dashboard\\/student\\/teacher\\/1\"},\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\\/dashboard\\/student\\/teacher\\/1\"},\"_flash\":{\"old\":[],\"new\":[]},\"flasher::envelopes\":[],\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":5},\"response_status\":200,\"response\":\"HTML Response\",\"duration\":562,\"memory\":26,\"hostname\":\"DESKTOP-NJVJCK5\",\"user\":{\"id\":5,\"name\":\"\\u0639\\u0627\\u062f\\u0629 \\u0631\\u062c\\u0628\",\"email\":\"ghada@gmail.com\"}}', '2024-06-18 18:31:50'),
(125, '9c512d95-7519-454f-9c71-2213af8d00d6', '9c512d95-9a54-4444-8146-74ae7a0ecc6d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"3.43\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:50'),
(126, '9c512d95-9822-49c2-b0c6-fd9f508c3be2', '9c512d95-9a54-4444-8146-74ae7a0ecc6d', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\resources\\\\views\\/errors\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:50'),
(127, '9c512d95-990a-4f2f-aa41-56309ce230de', '9c512d95-9a54-4444-8146-74ae7a0ecc6d', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/assets\\/student_assets\\/scss\\/libs\\/bootstrap.min.css.map\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"empty\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Imc0TEluRkJzT0tyYlBYb1FoaFpjT0E9PSIsInZhbHVlIjoiT1R5K2tNWXNGRVlpMVFmWGxjK1hkS0tnS1JtdXRhVEE1RGRpNzI3S0lMM3JJWHZZUVpvQWZoQW1rYzY1MytMYjZvMndmeXdrUXAzRzNpamtRS284Njd5aHFtODA2WUZYaWRxTFU1dGlsbjVFZU1XQXk4eXpORU1tV3JvbHUxWEwiLCJtYWMiOiI3MTIxMTVmODE4NmNmY2YzMTYwZDJjMGZmMzJjNzlkMzUxYmQyYTZlOTdmYmQxNzRkMzA2ZDEyMTg2NThhZmRmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjBTeG10R1B0Nk1FVnJGUnBkRFd5NXc9PSIsInZhbHVlIjoidlp4T2tEK0h3K09vc1hVTGpReExwdllDeG5VSi9TY2x4R2RHRVd6bTlmQnpiTVB2YXlQM2U4ZnFnTUVkRVNhcXNVSmNCOWRPdkF0NmcvZXNNMGFBSjhhWEJBVkJTemRNcUJIRmhBWlJuUkgzaTJXcGFEQ3FIak9BejlXRTRUdm8iLCJtYWMiOiIzOTQ5OGJhZTgyMzk4MzYzZjY5MzJhOWMyMjAwYjYzMTU0OWRmMWMxZjc0M2Q5OGQ1M2MwZmI3NmE3NTUxMzYxIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":463,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:50'),
(128, '9c512d95-799c-476f-b392-1027d65d7276', '9c512d95-9d55-44a0-b7c8-9e16d635bc12', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"4.53\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:50'),
(129, '9c512d95-9b47-49bc-b600-33b61107b3bc', '9c512d95-9d55-44a0-b7c8-9e16d635bc12', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\resources\\\\views\\/errors\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:50'),
(130, '9c512d95-9c21-42c8-b932-ec480240a769', '9c512d95-9d55-44a0-b7c8-9e16d635bc12', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/assets\\/student_assets\\/main.css.map\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"empty\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Imc0TEluRkJzT0tyYlBYb1FoaFpjT0E9PSIsInZhbHVlIjoiT1R5K2tNWXNGRVlpMVFmWGxjK1hkS0tnS1JtdXRhVEE1RGRpNzI3S0lMM3JJWHZZUVpvQWZoQW1rYzY1MytMYjZvMndmeXdrUXAzRzNpamtRS284Njd5aHFtODA2WUZYaWRxTFU1dGlsbjVFZU1XQXk4eXpORU1tV3JvbHUxWEwiLCJtYWMiOiI3MTIxMTVmODE4NmNmY2YzMTYwZDJjMGZmMzJjNzlkMzUxYmQyYTZlOTdmYmQxNzRkMzA2ZDEyMTg2NThhZmRmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjBTeG10R1B0Nk1FVnJGUnBkRFd5NXc9PSIsInZhbHVlIjoidlp4T2tEK0h3K09vc1hVTGpReExwdllDeG5VSi9TY2x4R2RHRVd6bTlmQnpiTVB2YXlQM2U4ZnFnTUVkRVNhcXNVSmNCOWRPdkF0NmcvZXNNMGFBSjhhWEJBVkJTemRNcUJIRmhBWlJuUkgzaTJXcGFEQ3FIak9BejlXRTRUdm8iLCJtYWMiOiIzOTQ5OGJhZTgyMzk4MzYzZjY5MzJhOWMyMjAwYjYzMTU0OWRmMWMxZjc0M2Q5OGQ1M2MwZmI3NmE3NTUxMzYxIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":470,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:50'),
(131, '9c512d95-8c48-45ba-942f-13a77438c066', '9c512d95-a8b8-4585-aede-3952595f8748', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"4.66\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:50'),
(132, '9c512d95-a6c5-4192-a228-6887743a6375', '9c512d95-a8b8-4585-aede-3952595f8748', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\resources\\\\views\\/errors\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:50'),
(133, '9c512d95-a7a0-42a8-a762-e4461aa915ff', '9c512d95-a8b8-4585-aede-3952595f8748', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/assets\\/student_assets\\/js\\/libs\\/bootstrap.min.js.map\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"empty\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Imc0TEluRkJzT0tyYlBYb1FoaFpjT0E9PSIsInZhbHVlIjoiT1R5K2tNWXNGRVlpMVFmWGxjK1hkS0tnS1JtdXRhVEE1RGRpNzI3S0lMM3JJWHZZUVpvQWZoQW1rYzY1MytMYjZvMndmeXdrUXAzRzNpamtRS284Njd5aHFtODA2WUZYaWRxTFU1dGlsbjVFZU1XQXk4eXpORU1tV3JvbHUxWEwiLCJtYWMiOiI3MTIxMTVmODE4NmNmY2YzMTYwZDJjMGZmMzJjNzlkMzUxYmQyYTZlOTdmYmQxNzRkMzA2ZDEyMTg2NThhZmRmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjBTeG10R1B0Nk1FVnJGUnBkRFd5NXc9PSIsInZhbHVlIjoidlp4T2tEK0h3K09vc1hVTGpReExwdllDeG5VSi9TY2x4R2RHRVd6bTlmQnpiTVB2YXlQM2U4ZnFnTUVkRVNhcXNVSmNCOWRPdkF0NmcvZXNNMGFBSjhhWEJBVkJTemRNcUJIRmhBWlJuUkgzaTJXcGFEQ3FIak9BejlXRTRUdm8iLCJtYWMiOiIzOTQ5OGJhZTgyMzk4MzYzZjY5MzJhOWMyMjAwYjYzMTU0OWRmMWMxZjc0M2Q5OGQ1M2MwZmI3NmE3NTUxMzYxIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":443,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:50'),
(134, '9c512d95-b4f3-456f-87e8-3e6895fb9fdd', '9c512d95-cfeb-49d8-8651-e661a47e6354', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"3.63\",\"slow\":false,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:50'),
(135, '9c512d95-cdc3-4813-8594-b5fa5f469999', '9c512d95-cfeb-49d8-8651-e661a47e6354', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\resources\\\\views\\/errors\\/404.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:50'),
(136, '9c512d95-cea9-489b-a92a-dc8694d93653', '9c512d95-cfeb-49d8-8651-e661a47e6354', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/assets\\/student_assets\\/js\\/libs\\/popper.min.js.map\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"empty\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Imc0TEluRkJzT0tyYlBYb1FoaFpjT0E9PSIsInZhbHVlIjoiT1R5K2tNWXNGRVlpMVFmWGxjK1hkS0tnS1JtdXRhVEE1RGRpNzI3S0lMM3JJWHZZUVpvQWZoQW1rYzY1MytMYjZvMndmeXdrUXAzRzNpamtRS284Njd5aHFtODA2WUZYaWRxTFU1dGlsbjVFZU1XQXk4eXpORU1tV3JvbHUxWEwiLCJtYWMiOiI3MTIxMTVmODE4NmNmY2YzMTYwZDJjMGZmMzJjNzlkMzUxYmQyYTZlOTdmYmQxNzRkMzA2ZDEyMTg2NThhZmRmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjBTeG10R1B0Nk1FVnJGUnBkRFd5NXc9PSIsInZhbHVlIjoidlp4T2tEK0h3K09vc1hVTGpReExwdllDeG5VSi9TY2x4R2RHRVd6bTlmQnpiTVB2YXlQM2U4ZnFnTUVkRVNhcXNVSmNCOWRPdkF0NmcvZXNNMGFBSjhhWEJBVkJTemRNcUJIRmhBWlJuUkgzaTJXcGFEQ3FIak9BejlXRTRUdm8iLCJtYWMiOiIzOTQ5OGJhZTgyMzk4MzYzZjY5MzJhOWMyMjAwYjYzMTU0OWRmMWMxZjc0M2Q5OGQ1M2MwZmI3NmE3NTUxMzYxIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":504,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-18 18:31:50'),
(137, '9c6939a8-e65d-4f82-9312-2fa56ad863fe', '9c6939b2-b898-4a8f-a1e8-20e89e05594a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `teachers`.*, `subjects`.`title` as `subject` from `teachers` inner join `subjects` on `subjects`.`id` = `teachers`.`subject_id`\",\"time\":\"421.22\",\"slow\":true,\"file\":\"E:\\\\laragon\\\\www\\\\teachme\\\\app\\\\Providers\\\\AppServiceProvider.php\",\"line\":36,\"hash\":\"5dc6cb3f5b0c4620ba279d7d00261d42\",\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-30 17:25:29'),
(138, '9c6939b1-482d-4250-8d92-8610b68619e9', '9c6939b2-b898-4a8f-a1e8-20e89e05594a', NULL, 1, 'view', '{\"name\":\"welcome\",\"path\":\"\\\\resources\\\\views\\/welcome.blade.php\",\"data\":[],\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-30 17:25:34'),
(139, '9c6939b2-47f5-4ae7-b36b-3e4960e11c54', '9c6939b2-b898-4a8f-a1e8-20e89e05594a', NULL, 1, 'request', '{\"ip_address\":\"::1\",\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"Closure\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/126.0.0.0 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"sec-gpc\":\"1\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"sec-ch-ua\":\"\\\"Not\\/A)Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"126\\\", \\\"Brave\\\";v=\\\"126\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept-language\":\"en-US,en\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"ngrok-skip-browser-warning\":\"true\"},\"payload\":[],\"session\":{\"_token\":\"0yoXDOnP5C4AUYEMqmJl1vkUohKnyvtfywK9oxFL\",\"flasher::envelopes\":[],\"_previous\":{\"url\":\"http:\\/\\/localhost\\/teachme\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":\"HTML Response\",\"duration\":31350,\"memory\":24,\"hostname\":\"DESKTOP-NJVJCK5\"}', '2024-06-30 17:25:34');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `telescope_entries_tags`
--

INSERT INTO `telescope_entries_tags` (`entry_uuid`, `tag`) VALUES
('9c512bf7-f7ec-489e-afb8-302fd308e7d4', 'slow'),
('9c512cc4-814e-4d89-ac8c-217a1f379ac2', 'App\\Models\\User'),
('9c512cc5-9596-4d0d-8344-e6081665af67', 'Auth:5'),
('9c512cc6-6ab7-447b-9732-8de60d243ffe', 'App\\Models\\User'),
('9c512cc6-7165-4ad5-9472-816273889314', 'Auth:5'),
('9c512cc6-8b17-42bd-b41f-59606e7125a0', 'Auth:5'),
('9c512cc6-db04-4a37-99e7-841baa999a6c', 'Auth:5'),
('9c512cc7-1e08-4ac8-aa3a-a37f67705ed5', 'Auth:5'),
('9c512ccd-74c6-495f-a68f-f411f8b12a72', 'App\\Models\\User'),
('9c512ccd-79a0-48eb-8fd5-4fad4b6c8bfa', 'Auth:5'),
('9c512ccd-7a30-4738-a56c-ab410e26932d', 'Auth:5'),
('9c512ccd-7b30-4ebc-b415-8ab18dc3f30a', 'Auth:5'),
('9c512ccd-826c-4b4c-809d-bc8ea81482e3', 'Auth:5'),
('9c512cce-005f-44e4-99b6-f7d7326b81b1', 'Auth:5'),
('9c512cce-005f-44e4-99b6-f7d7326b81b1', 'slow'),
('9c512cce-0420-44b9-812a-ff27c23579b0', 'Auth:5'),
('9c512cce-07bc-418b-81ac-389b58c9365f', 'Auth:5'),
('9c512cce-140c-4cc0-8492-92bc30dca1f2', 'Auth:5'),
('9c512cce-71fd-4825-9115-6a8a09d68a6f', 'Auth:5'),
('9c512cce-becf-4bc2-8ce5-bcec73a9d59e', 'Auth:5'),
('9c512ccf-6c5f-4c07-ac4f-cad0641373f0', 'Auth:5'),
('9c512ccf-766d-4cd7-bfce-deac2cdfef81', 'Auth:5'),
('9c512ccf-aabb-4ae5-9ffe-9c046b80b3d9', 'Auth:5'),
('9c512ccf-b2fd-4894-87f2-4a5a86e8c018', 'Auth:5'),
('9c512d5d-6246-4b75-b5a0-6f306e589d25', 'App\\Models\\User'),
('9c512d5d-9318-42a1-b3a6-73bbe3749643', 'Auth:5'),
('9c512d67-13ad-4879-90f2-d393c785f204', 'App\\Models\\User'),
('9c512d67-187b-46d2-b200-58766dd7fd56', 'Auth:5'),
('9c512d67-1a92-40b1-ad98-18635fe723bb', 'Auth:5'),
('9c512d67-1c0f-45d8-a6ae-bae8eec82b5b', 'Auth:5'),
('9c512d67-293f-4e48-b739-7c014f2d1c0c', 'Auth:5'),
('9c512d6b-014a-454b-8b68-21685c9c3f3b', 'App\\Models\\User'),
('9c512d6b-0516-4152-9782-4233d9a8f2d7', 'Auth:5'),
('9c512d6b-05b7-4e35-97fd-bb615b905950', 'Auth:5'),
('9c512d6b-0665-4f3e-8ba7-3fde6f05ef02', 'Auth:5'),
('9c512d6b-0719-4631-9b39-8db576623f21', 'Auth:5'),
('9c512d6b-0845-4bc8-999b-07a33afa82e9', 'Auth:5'),
('9c512d6b-0931-4152-ad54-88a3222ccd6c', 'Auth:5'),
('9c512d6b-0a19-4430-8070-ca283a4e57d1', 'Auth:5'),
('9c512d6b-0c35-40e2-a9d9-aa4ca58ebce4', 'Auth:5'),
('9c512d6b-0cbe-4b95-ab9b-06c3f87b5976', 'Auth:5'),
('9c512d6b-0dd0-4bc7-935b-2cd47100013c', 'Auth:5'),
('9c512d6b-0fef-41ab-a530-34fb5918c485', 'Auth:5'),
('9c512d6b-1067-49d7-88ee-50805c6b07e1', 'Auth:5'),
('9c512d6b-10f8-4327-88b7-b4db166f19de', 'Auth:5'),
('9c512d6b-2188-41b9-b728-92c2b9b2d451', 'Auth:5'),
('9c512d94-9fce-4264-99e3-13d986b0690a', 'App\\Models\\User'),
('9c512d94-a3db-4f0b-8029-e46c1baa0d41', 'Auth:5'),
('9c512d94-a46b-4a85-9735-671cdb4b3f88', 'Auth:5'),
('9c512d94-a4fb-4632-8b68-2ffe1d75f19f', 'Auth:5'),
('9c512d94-a597-409b-9056-53be5ae89397', 'Auth:5'),
('9c512d94-a6c8-455c-8ffa-8142c3b865e6', 'Auth:5'),
('9c512d94-a7c4-4471-a12c-5123faf1e734', 'Auth:5'),
('9c512d94-a88d-4932-bdef-97fa288936f4', 'Auth:5'),
('9c512d94-aa98-4506-bbf8-6de6e2bea07f', 'Auth:5'),
('9c512d94-ab11-486d-9d18-adbbe755bcf1', 'Auth:5'),
('9c512d94-ac26-4be5-9999-983938aa817d', 'Auth:5'),
('9c512d94-ae43-49f6-9ffa-8fe3c286a396', 'Auth:5'),
('9c512d94-aebd-4d4f-96fb-38fdc00377d8', 'Auth:5'),
('9c512d94-af62-4a13-b53b-a470413ca038', 'Auth:5'),
('9c512d94-b2d1-40cc-b922-5e3ed9ec9c2f', 'Auth:5'),
('9c6939a8-e65d-4f82-9312-2fa56ad863fe', 'slow');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `title`, `description`, `school_grade_id`, `teacher_id`, `subject_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'مدخل إلى علم الفيزياء', NULL, 3, 1, 1, '2024-06-11 10:37:50', '2024-06-11 10:37:50', NULL),
(2, 'القوة والحركة', NULL, 3, 1, 1, '2024-06-11 10:38:27', '2024-06-19 04:58:52', NULL),
(3, 'الحركة بعجلة منتظمة', NULL, 3, 1, 1, '2024-06-11 10:38:45', '2024-06-19 04:58:32', NULL),
(4, 'الحركة في خط مستقيم', NULL, 3, 1, 1, '2024-06-11 10:39:03', '2024-06-19 04:58:06', NULL),
(5, 'الكميات القياسية والمتجهة', NULL, 3, 1, 1, '2024-06-11 10:39:20', '2024-06-19 04:57:39', NULL),
(6, 'القياسات الفيزيائية', NULL, 3, 1, 1, '2024-06-11 10:39:41', '2024-06-19 04:57:13', NULL),
(7, 'الموجات', NULL, 2, 1, 1, '2024-06-11 10:41:22', '2024-06-11 10:41:22', NULL),
(8, 'الموائع', NULL, 2, 1, 1, '2024-06-11 10:41:41', '2024-06-11 10:41:41', NULL),
(9, 'الحرارة', NULL, 2, 1, 1, '2024-06-11 10:42:01', '2024-06-11 10:42:01', NULL),
(10, 'التيار الكهربي وقانون أوم', NULL, 1, 1, 1, '2024-06-11 10:42:45', '2024-06-19 08:24:22', NULL),
(11, 'مقدمة في الفيزياء الحديثة', NULL, 1, 1, 1, '2024-06-11 10:43:02', '2024-06-11 10:43:02', NULL),
(12, 'التأثير المغناطيسي للتيار الكهربي وأجهزة القياس', NULL, 1, 1, 1, '2024-06-19 08:24:43', '2024-06-19 08:24:43', NULL),
(13, 'الحث الكهرومغناطيسي', NULL, 1, 1, 1, '2024-06-19 08:25:02', '2024-06-19 08:25:02', NULL),
(14, 'دوائر التيار المتردد', NULL, 1, 1, 1, '2024-06-19 08:25:23', '2024-06-19 08:25:23', NULL),
(15, 'ازدواجية الموجة والجسيم', NULL, 1, 1, 1, '2024-06-19 08:25:41', '2024-06-19 08:25:41', NULL),
(16, 'الطيف الذري', NULL, 1, 1, 1, '2024-06-19 08:26:05', '2024-06-19 08:26:05', NULL),
(17, 'الليزر', NULL, 1, 1, 1, '2024-06-19 08:26:28', '2024-06-19 08:26:28', NULL),
(18, 'الإلكترونيات الحديثة', NULL, 1, 1, 1, '2024-06-19 08:26:44', '2024-06-19 08:26:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` int DEFAULT NULL COMMENT '1:male,0:femal',
  `phonenumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `government` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `all_points` int NOT NULL DEFAULT '0',
  `active_points` int NOT NULL DEFAULT '0',
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'profile image',
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `school_grade_id` bigint UNSIGNED DEFAULT '0',
  `group_id` bigint DEFAULT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_exam` smallint NOT NULL DEFAULT '0',
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `gender`, `phonenumber`, `phone_parent`, `government`, `email_verified_at`, `password`, `all_points`, `active_points`, `profile`, `subject_id`, `school_grade_id`, `group_id`, `teacher_id`, `remember_token`, `status_exam`, `provider_id`, `provider`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'أحمد جمال فوزى عازى', 'engahmedgamal860@gmail.com', NULL, '01091536978', '01060753790', 'القاهرة', '2024-06-11 10:18:02', '$2y$10$ZILziz/ddOzYWPwcg0bY7OOiuLGuWWQsR1YY1htkBfMLMJFK9Q6oC', 500, 150, 'users/340449380_189760030058369_252300388191378691_n.jpg', 1, 3, 1, 1, NULL, 0, NULL, NULL, '2024-06-11 10:18:02', '2024-06-29 19:29:48', NULL),
(2, 'ندى خالد فوزى', 'nada@gmail.com', NULL, '01016204668', '01060753790', 'الجيزة', '2024-06-11 10:31:56', '$2y$10$rC7yNuMzpz9oWbtr8eQyf.SCv7Nai/1lASaz4GoDVop018KfT1BC6', 750, 750, 'users/image-04.png', 1, 1, 2, 1, NULL, 0, NULL, NULL, '2024-06-11 10:31:56', '2024-06-16 20:37:46', NULL),
(3, 'أحمد ميسى', 'ag1088768@gmail.com', NULL, '01191536978', '01191536987', 'القاهرة', '2024-06-16 16:26:10', '$2y$10$wp0GTZl0dkGuIDbxtEO2MetmXrmN530OK1VOtoaH27KqtsvdUkXaC', 125, 125, 'users/1948100_0.jpeg', 1, 3, 2, 1, NULL, 0, NULL, NULL, '2024-06-16 16:26:10', '2024-06-16 21:09:58', NULL),
(4, 'أحمد هالاند', 'jodE2kOZDw@gmail.com', NULL, '01023065856', '01023065856', 'المنوفية', '2024-06-16 20:47:05', '$2y$10$8phn0B6iJWf94AeQe5ZQuO9QzHyGTujd6kBSbuIDwvjDXHXCD7EFG', 155, 155, 'users/ERLING-HAALAND-MANCHESTER-CITY-scaled-e1662531544452-1024x683.jpg', 1, 3, 1, 1, NULL, 0, NULL, NULL, '2024-06-16 20:47:05', '2024-06-17 08:42:19', NULL),
(5, 'عادة رجب', 'ghada@gmail.com', NULL, '01591484746', '01023065856', 'الغربية', '2024-06-16 21:15:32', '$2y$10$ZILziz/ddOzYWPwcg0bY7OOiuLGuWWQsR1YY1htkBfMLMJFK9Q6oC', 850, 550, NULL, 1, 1, 3, 1, NULL, 0, NULL, NULL, '2024-06-16 21:15:32', '2024-06-28 03:37:09', NULL),
(6, 'عادل أحمد  الالفى', 'ag108876801@gmail.com', NULL, '01029065856', '01023065856', 'اسوان', '2024-06-17 08:42:01', '$2y$10$c0EH67SeHJujv0mjWISsK.2A3T74FcYUXZmXKUcOwaP3wVVI2xwoC', 600, 600, NULL, 1, 3, 1, 1, NULL, 0, NULL, NULL, '2024-06-17 08:42:01', '2024-06-22 21:45:21', NULL),
(7, 'ahmed gamal web', 'ake@gmail.com', NULL, '01014151617', '01016201415', 'الدقهلية', NULL, '$2y$10$Y9GCFm667P0lNdvnjjwMt.NodeqUZuvVh7xH/PvKPU65rs4s26UKS', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-10-05 11:14:09', '2023-10-05 11:14:09', NULL),
(8, 'ahmed web', 'ak22e@gmail.com', NULL, '01012141515', '01014151212', 'الفيوم', NULL, '$2y$10$7AiT9za9RK2SmKKFavrZf.Z2fDnywRKt1q/1/HB9yQVdTyTf/kHoC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-05 11:25:32', '2023-10-05 11:25:32', NULL),
(9, 'ahmed gama web 3', 'ah@gmail.com', NULL, '01014151819', '01014151716', 'الفيوم', NULL, '$2y$10$xCeS4uzfm.NvgHhzs6OFIOasZD9IG2CF.oT22RCv7gNF6uqtzEMuy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-05 11:28:50', '2023-10-05 11:28:50', NULL),
(10, 'Test', 'test@gmail.com', NULL, '01234567890', '01234567891', 'البحيرة', NULL, '$2y$10$Z0iHoYZ89tyqFIF0QrPFFeTEB6vUQa6E/p3br6DhOBs/m4iGPU3wG', 200, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2023-10-05 11:31:39', '2023-10-05 11:33:20', NULL),
(11, 'محمد اسلام الجمال', 'ameeraalsukary79@gmail.com', NULL, '01030972740', '01285143934', 'الغربية', NULL, '$2y$10$MNA7vo3lnrLyHlTo71AtBOAWFce3DItsQqIeg5PK6AdKTopCgE3rW', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-10-07 03:57:57', '2023-10-07 03:57:57', NULL),
(12, 'toto moto', 'mohamedmasoud531@gmail.com', NULL, '01125793778', '01021553902', 'الغربية', NULL, '$2y$10$efvOpU3XQnv6cfiBYz2lZui/oyX7uEe/ccVmQbEzoFIeOq3q/R1Ey', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-07 04:55:14', '2023-10-07 04:55:14', NULL),
(13, 'Ibrahim mostafa', 'hemamostafa379@gmail.com', NULL, '01558557615', '01203817595', 'الغربية', NULL, '$2y$10$l496XkJpyJ/QYkWuMHl4qeG.ozNuStjJI4PywFZftucwdu8pb8oB.', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-10-07 06:36:59', '2023-10-07 06:36:59', NULL),
(14, 'Habiba Morad', 'moradhabiba0@gmail.com', NULL, '01021232676', '01091250900', 'الغربية', NULL, '$2y$10$t3qbcEYxJ7DAHopgzulXieAw2I/3snFu5d/823KlJeSF3L/AWCSZO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-07 20:37:50', '2023-10-07 20:37:50', NULL),
(15, 'Malak abo eldahab', 'malakaboeldahab295@gmail.com', NULL, '01280661727', '01226635096', 'الغربية', NULL, '$2y$10$UkfqBiwMirzjIadHwmm/ZO6de5jcKuX5eF55UKN/teZBPkW7Ou0ey', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-08 05:14:04', '2023-10-08 05:14:04', NULL),
(16, 'Hossam elgazzar', 'hossamelgazzar50@icloud.com', NULL, '01288383038', '01022020497', 'الغربية', NULL, '$2y$10$Xcg.aryeVkK00Y0wRS0vveA.KDTPj85XgeAJ83FcDc/XcIAxfN2Ly', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 05:28:56', '2023-10-08 05:28:56', NULL),
(17, 'Zekra eid', 'zekraeid417@gmail.com', NULL, '01205589530', '01288485817', 'الغربية', NULL, '$2y$10$6Nx8m6PqjAW6TldmTJ6pVuabAR5NIMeTnXar6vvPdZDdC42SHf/K.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-08 06:20:18', '2023-10-08 06:20:18', NULL),
(18, 'Omar Aboelkhair', 'omarahmedaboelkair666@gmail.com', NULL, '01124074098', '01061594955', 'الغربية', NULL, '$2y$10$NS.aH.f8WKO7dNEIflboH.xoOkzgyO3MuhJ6wPrJkyU0sUyc4kCG2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-08 13:00:47', '2023-10-08 13:00:47', NULL),
(19, 'Abd ELRhman Allam', 'mbedo2203@gmail.com', NULL, '01091160556', '01063820991', 'الغربية', NULL, '$2y$10$NUndlYVGvcGEtvrctu9qIepJADCjEhF03j4TjtGVXBaSw4EGmENie', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 18:05:44', '2023-10-08 18:05:44', NULL),
(20, 'يوسف احمد', 'tnt312gg@gmail.com', NULL, '01063997663', '01091501888', 'الغربية', NULL, '$2y$10$Iukl4EigIHaWxje3RU7QAe7.g76OS.I/5R3pnTNTT2jwskpJn9J7q', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 18:09:15', '2023-10-08 18:09:15', NULL),
(21, 'KitKat', 'ghalwashhabiba @gmil.com', NULL, '01206949106', '01020012079', 'الغربية', NULL, '$2y$10$E3YMI1rn/o/SGPMeQj8ekuaBcpripaWbsFmlLHqWVuqQlr2w74nHS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 19:53:04', '2023-10-08 19:53:04', NULL),
(22, 'هنا عبد الرازق', 'hk3916193@gmail.com', NULL, '01026816485', '01229740653', 'الغربية', NULL, '$2y$10$rKcS95M.1OcKSqRsvecXuex4KDOU/G02xseTBJvTcXEnydjvF9E6m', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 20:28:03', '2023-10-08 20:28:03', NULL),
(23, 'لبني محمد علي', 'mohamedlobna692@gmail.com', NULL, '01014185401', '01279743112', 'الغربية', NULL, '$2y$10$Lf/sPL99V7zPqPrBw2VKTOivRkuW8iWFm4q7HVI9vtyfM4fL.niva', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 21:15:07', '2023-10-08 21:15:07', NULL),
(24, 'نادين', 'nadinabeed@yahoo.com', NULL, '01205579268', '01221255755', 'الغربية', NULL, '$2y$10$/ZKIkMCcnMsW00ZVtajlVegGwbaK7.cMD.YNwo6NUt7.hn3ZdjNxa', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 21:36:34', '2023-10-08 21:36:34', NULL),
(25, 'نور شريف', 'nourshiref267@gmail.com', NULL, '01206247856', '01221760110', 'الغربية', NULL, '$2y$10$wR4pnrczzQNS.WG.4tvXWOx.XtopVcO2x8zh51t0GEGb.7JQDqaQu', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-10-08 22:28:13', '2023-10-08 22:28:13', NULL),
(26, 'رؤى رفعت كمال', 'roaarefaat66@gmail.com', NULL, '01099397445', '01004536240', 'الغربية', NULL, '$2y$10$/rXd8E1ub9U7WONjfW7FGOyazXZk9Tx7xQIAYdV4KxHeFXIOlZ/Zq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 23:25:07', '2023-10-08 23:25:07', NULL),
(27, 'مريم عبد الفتاح', 'meroooooo169@gmail.com', NULL, '01227970052', '01282472016', 'الغربية', NULL, '$2y$10$j4N.lj.5K4jP7hBIXguBVOc3s5Im2eBpDhmqW96nRoLGkwVdhxj22', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-08 23:28:43', '2023-10-08 23:28:43', NULL),
(28, 'Safy adel', 'safyelhalwagy0@gmail.com', NULL, '01550115712', '01554165250', 'الغربية', NULL, '$2y$10$LCn78solSOGNazXQ4blgP.4gNWcseMp0MsMioeiz/C2hSNSIs3O4u', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 23:28:51', '2023-10-08 23:28:51', NULL),
(29, 'جنا وليد هيكل', 'hikalj4@gmail.com', NULL, '01554543249', '01026760408', 'الغربية', NULL, '$2y$10$ydGBrsmp/hS3s9xfhfyy5utboC0r/SQmJeLjV9IKEf/Z7XdwCgY1S', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 23:33:05', '2023-10-08 23:33:05', NULL),
(30, 'Nabil Elmahdy', 'nabilelmahdy512@gmail.com', NULL, '01207282611', '01207282611', 'الغربية', NULL, '$2y$10$s3NO4MkAgu.b68bao/QlSeSCnpzODeT0HOoSnIIpi7BflMAalg/DW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 23:53:41', '2023-10-08 23:53:41', NULL),
(31, 'Mai Zidan', 'mai25zidan@gmail.com', NULL, '01275893886', '01065891558', 'الغربية', NULL, '$2y$10$NyFrWVp7NTBW8Hi4MQdR0ev6SYcMPqbXn4mNGg3QZfkKkwvwo62Ym', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 00:57:57', '2023-10-09 00:57:57', NULL),
(32, 'Mohamed Zeid', 'mezozeid1@gmail.com', NULL, '01067182560', '01009765131', 'الغربية', NULL, '$2y$10$kGj3HhE0LcquxgHXM2RqlOGrRZHH.bUzuoiBGQUGBgnQ/qC/Ijozm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 02:19:16', '2023-10-09 02:19:16', NULL),
(33, 'مريم ابو اليزيد', 'mero60748@gmail.com', NULL, '01091479772', '01068713748', 'الغربية', NULL, '$2y$10$b6QRlyjjDPFC998rdVvCjuoxJSZ3MmVQ/mo/G5tj3I3FhElhRZOIW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-09 02:50:14', '2023-10-09 02:50:14', NULL),
(34, 'Ziad amr', 'ziadeladl919@gmail.com', NULL, '01067975073', '01095581186', 'الغربية', NULL, '$2y$10$ScqGrJO8Utk3efdAfIovF.J1clmRA/JlXgQBJqD32XG5xSC8AdCuO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-09 03:06:24', '2023-10-09 03:06:24', NULL),
(35, 'haneen hussein', 'haneenhussein@gmail.com', NULL, '01208169765', '01282827979', 'الغربية', NULL, '$2y$10$fqRLPn.Ox2JPGuGwdmJ0Y.cp6TdEI4iZ/mzJpAie3vXCrY10Pli66', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 03:18:30', '2023-10-09 03:18:30', NULL),
(36, 'رؤي احمد الغنام', 'roaaelghnam183@gmail.com', NULL, '01028526518', '01014050941', 'الغربية', NULL, '$2y$10$fu/yjFwJpO4inwpnr71fpu1Q4wnpig11gwU0MWOToi5KsWpSv18n6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-09 03:25:58', '2023-10-09 03:25:58', NULL),
(37, 'مؤمن رمضان برهومه', 'momenbarhoma380@gmail.com', NULL, '01028579458', '01220704661', 'الغربية', NULL, '$2y$10$XoIEJj5YHUu6jKXxAwDuyO67OQYzw542yTkZAC71WDjh64U7FOT.y', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 03:32:34', '2023-10-09 03:32:34', NULL),
(38, 'احمد محمد النجار', 'ae461415@gmail.com', NULL, '01122630156', '01227261967', 'الغربية', NULL, '$2y$10$AkHoGybIKAklTn9CZk7Qw.2.iDWpbauFBDEjiZML.NxxVeqJODavW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 05:06:17', '2023-10-09 05:06:17', NULL),
(39, 'روان علي ابو المجد', 'rawanali557@gmail.com', NULL, '01221677603', '01208436688', 'الغربية', NULL, '$2y$10$NRPN5Ihueq2fe4wR9ugkRupSz33WWpX5rQsMf.4iyyGA7CraFyKIu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 07:58:51', '2023-10-09 07:58:51', NULL),
(40, 'Mariam Elsendiony', 'mariamelsendiony20@gmail.com', NULL, '01012533484', '01093803781', 'الغربية', NULL, '$2y$10$OSsOiyw0XkNmnEQMqoX7w.Qnc7LBiPzg6hXrrahO.MumZ1VEhLCAW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 08:14:47', '2023-10-09 08:14:47', NULL),
(41, 'Kemo Diab', 'kareemdiab222@gmail.com', NULL, '01005648809', '01027649264', 'الغربية', NULL, '$2y$10$zfM6dn8slq1JMbhSsM3fiuWszuUA140BgCYF0gEUzIRm/BVC3wkmK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 12:41:33', '2023-10-09 12:41:33', NULL),
(42, 'محمود ابراهيم', 'mahmoudibrahimsaad792@gmail.com', NULL, '01274621620', '01220503937', 'الغربية', NULL, '$2y$10$aYJxBjHk16Q.GJe8zNXxo.354gIZrCQbSgI9CBX.gPcvejtLi9fEm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 18:13:08', '2023-10-09 18:13:08', NULL),
(43, 'نور مدحت شبل', 'nourmedhat681@gmail.com', NULL, '01065084884', '01021976688', 'الغربية', NULL, '$2y$10$0buYNchQg1B1CtExcvgbQerkzR315YB4E/Ys3ZUoCcYahEnk.rsCK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 19:21:09', '2023-10-09 19:21:09', NULL),
(44, 'ادهم عصام السيد عبدالفتاح البلتاجي', 'eladham955@gmail.com', NULL, '01019331730', '01067939060', 'الغربية', NULL, '$2y$10$T.Ep9ReVu2BzmhUMfh6YCuoYGezdc6PPh74U.bmbpccjz76RlrmG6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 20:01:23', '2023-10-09 20:01:23', NULL),
(45, 'رنا غريب احمد مراد', 'moradrana891@gmail.com', NULL, '01066790802', '01001895041', 'الغربية', NULL, '$2y$10$KGW8xAEHjk62oFHq3Q1Tgu3wtSaB.5w6LR.fsbFADNu4oIkOZR8s2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 20:21:34', '2023-10-09 20:21:34', NULL),
(46, 'Sara adel', 'saraadelsaleh2005@gmail.com', NULL, '01554052588', '01553117979', 'الغربية', NULL, '$2y$10$grueRgPRYGgVQA6Gs6BBGOBOaPRLaipz3n3pbLJ9xU/KIcwatoS.W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 22:01:33', '2023-10-09 22:01:33', NULL),
(47, 'hanna mohamed rady', 'hanarady612@gmail.com', NULL, '01062330990', '01024777620', 'الغربية', NULL, '$2y$10$QvR0P12fT.J/PJV10xszXuIsB9JOR.ifX77xJ2Eb/RcbNKvA9/VpO', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 22:17:03', '2023-10-09 22:17:03', NULL),
(48, 'احمد سمير', 'ahmedwelahly@gmail.com', NULL, '01022826071', '01063385088', 'الغربية', NULL, '$2y$10$AyLN6ZTt1aMOIgwoDTdwB.t/yVqDI.SMI/01uYPNegiceIveCcD8K', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 22:44:25', '2023-10-09 22:44:25', NULL),
(49, 'Sara Elsayed', 'sarasyaed778@gmail.com', NULL, '01015636426', '01008152517', 'الغربية', NULL, '$2y$10$E1gtjQxevda3t8zS2wRwJOJoMVWLVd1FwyIHwcJxn8LIw91DKqrYG', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 23:16:34', '2023-10-09 23:16:34', NULL),
(50, 'youssef asal', 'yasal2773@gmail.com', NULL, '01550580169', '01097708283', 'الغربية', NULL, '$2y$10$hXCnmQ.VN1wNwfiGj..zf.wSW/duUtg217vUuD799ui2H2huLN2o6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 23:46:30', '2023-10-09 23:46:30', NULL),
(51, 'Abdelrhman ibrahim Mohammed', 'xabdelrhman090@gmail.com', NULL, '01006304486', '01201270875', 'الغربية', NULL, '$2y$10$xdAkvy/51QgL8N.8nUhS3.NDnUrpR8vqN12GvKbTRcwUUbun6pF/6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 00:13:21', '2023-10-10 00:13:21', NULL),
(52, 'Lujain hatem Zayan', 'logyzayan@icloud.com', NULL, '01212613851', '01211261552', 'الغربية', NULL, '$2y$10$rgYR5RLe1/DQvsEYF/DVnOKW5YFwWGLMohTgV5lyd8wkPv9dYCsIm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 00:31:14', '2023-10-10 00:31:14', NULL),
(53, 'BASMALA ELSEBAEY', 'basmalaelsebaey@gmail.com', NULL, '01210717870', '01223701878', 'الغربية', NULL, '$2y$10$x84p.CjsScEDuYIDNv4bnumuHmEw.rPMBx4m2uuzcMLbyiBvM0yPK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 00:37:45', '2023-10-10 00:37:45', NULL),
(54, 'مروان سليمان', 'marwansaliem15@gmail.com', NULL, '01271654231', '01061305473', 'الغربية', NULL, '$2y$10$2SrfxlLNjudxVKgTVHJ29uDHV8iHySwSAq3dSxklgWN5kLlmwzSKK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 00:41:01', '2023-10-10 00:41:01', NULL),
(55, 'Wafaa Bassem', 'wafaabassem200715@gmail.com', NULL, '01284500516', '01281183966', 'الغربية', NULL, '$2y$10$LnjM5VQiTxITroG6NcK/BeAhwRyws8hbnO9HqRQf5U.HtTWqCkJW.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 00:48:55', '2023-10-10 00:48:55', NULL),
(56, 'mohamed nabil darwish', 'mohamednabidarwish@gmail.com', NULL, '01555847735', '01102230148', 'الغربية', NULL, '$2y$10$QAmXp4qT9FFwj4uZxj8PLuBgX3lmB3DG8jQq8CCTLSHdYEe46spHK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 00:54:39', '2023-10-10 00:54:39', NULL),
(57, 'Ahmed hany', 'ahmedahmedhany808@gmail.com', NULL, '01062141947', '01050078086', 'الغربية', NULL, '$2y$10$/dUP4wDDONr6JVzVsozOGu37SvJJooSfvbQamU9mQ80Hm7z8BHto2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 01:10:32', '2023-10-10 01:10:32', NULL),
(58, 'Shaza Osama', 'haamaan@icloud.com', NULL, '01114284272', '01013953655', 'الغربية', NULL, '$2y$10$jYanBpJRO0Iql9xpQKStCOmhFIke.ItaGOAVUZmWIbQC9JWdZFuLq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 01:15:24', '2023-10-10 01:15:24', NULL),
(59, 'الماجيك 😍(محمود رمضان)', 'mahmoud91639@gmail.com', NULL, '01221393152', '01276164434', 'الغربية', NULL, '$2y$10$3hIC1trdPnTiXxMxacDmSeeo5bvOR9g1HmujIshH8dCk0CM08de8W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 01:20:31', '2023-10-10 01:20:31', NULL),
(60, 'Magdy Rabeh', 'magdy01283@gmail.com', NULL, '01288721907', '01283122629', 'الغربية', NULL, '$2y$10$.bw4HrKbpVBVfVwvg3wvhey/JV5r3Qv75S08V8n4kC79M35JVpSGO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 01:22:06', '2023-10-10 01:22:06', NULL),
(61, 'محمد اسامه قنديل', 'qndyl801@gmail.com', NULL, '01153544875', '01272683664', 'الغربية', NULL, '$2y$10$F3WCuWPIVczk0T9yNC31F.M/S9395ODEsltie0W3whDIyhKg52x6i', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 01:26:17', '2023-10-10 01:26:17', NULL),
(62, 'Seif akram', 'seifakrammarzouq@gmail.com', NULL, '01550697572', '01220262388', 'الغربية', NULL, '$2y$10$VpDV4Engn5IPLpGmx8rHDu2L.nnbyyIVxn3/e2PM9PMGZN3A6NyuO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 01:32:48', '2023-10-10 01:32:48', NULL),
(63, 'مروان السيد حلمي', 'marwan72005@gmail.com', NULL, '01099767049', '01007873379', 'الغربية', NULL, '$2y$10$hq9sqPBjKCP4IoAweRRqM.aqss5U0RfyOOgN07smaNrV1LlCPQTpy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 01:34:47', '2023-10-10 01:34:47', NULL),
(64, 'دينا اشرف العجمي', 'dynaaljmy0@gmail.com', NULL, '01012726307', '01002646958', 'الغربية', NULL, '$2y$10$977SGLLOC9NalTt5/q21duFP0E5VQNyfqysZpO3mwTEa4lKOkPR.O', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 01:36:50', '2023-10-10 01:36:50', NULL),
(65, 'منه المصري', 'waledmenna389@gmail.com', NULL, '01559799986', '01009727087', 'الغربية', NULL, '$2y$10$YlUsZOg2TuyX8nTyxxuDUOi9CiVBf85ZhrD5T0zkbyyS1VkzYD64W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 02:17:31', '2023-10-10 02:17:31', NULL),
(66, 'هبه الله هاني فاروق سعد', 'hanyheba149@yahoo.com', NULL, '01112647496', '01281185008', 'الغربية', NULL, '$2y$10$SvNUcr6UZmS3p4Hw8tFo0uu7ljTEB.bp7oefOPjXXfTtOJIhpaxjy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 02:23:02', '2023-10-10 02:23:02', NULL),
(67, 'Thomas', 'thomasfrangilos2@gmail.com', NULL, '01275818929', '01272244864', 'الغربية', NULL, '$2y$10$pJOHD2Y2dDCVGuggLdXn7.vTAd/tz70nRUdvy6rqZu8tqJJq4Qe1O', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 03:26:19', '2023-10-10 03:26:19', NULL),
(68, 'Malak Kandil', 'malakkandel188@gmail.com', NULL, '01156220640', '01068507450', 'الغربية', NULL, '$2y$10$6FhXk4ROY5sT5H3Eylf2t.zsBHxhZwj/Mq.V/guuPU05iT991O1Oy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 03:57:44', '2023-10-10 03:57:44', NULL),
(69, 'مريم محمود أبو شبانة', 'Marimahmo361@gmail.com', NULL, '01148529609', '01157523814', 'الغربية', NULL, '$2y$10$CyR0LagFGmEOyG82yC092ONPAOfCwMpHuyWLWLXTNoguGhVk4H7GC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 04:14:07', '2023-10-10 04:14:07', NULL),
(70, 'Eman ali', 'emanali82005@gmail.com', NULL, '01559661813', '01141157662', 'الغربية', NULL, '$2y$10$2yAqVtZLeXJEVRUDelXwz.Q4FZm3JpDS1QlYGjFe13BoFw1P2804i', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 04:26:13', '2023-10-10 04:26:13', NULL),
(71, 'احمد سمير سعد', 'lil.samir02@gmail.com', NULL, '01067960269', '01221192253', 'الغربية', NULL, '$2y$10$kkz1S07cF6j7rOAJLrLf3OnPpTTRygxy8ed/mteMilgvShkvYBCca', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 04:35:35', '2023-10-10 04:35:35', NULL),
(72, 'مهند محمد كمال', 'mohandkamal1122@gmail.com', NULL, '01221192253', '01281638638', 'الغربية', NULL, '$2y$10$69ikyelY4zf8Wvinx7m7te03WbDXjZ42BlHidNlneSklcC/d0h57i', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 04:35:58', '2023-10-10 04:35:58', NULL),
(73, 'اسماعيل ايمن البنا', 'esmailelbana12@icloud.com', NULL, '01033737354', '01091685551', 'الغربية', NULL, '$2y$10$tBgtS5KnxofRrkRf5ch8Ou/bKGBb1SHYva4cM9DnzOtyHQI.8ELaS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 04:44:13', '2023-10-10 04:44:13', NULL),
(74, 'salma mohamed joudah', 'varjmy@gmail.com', NULL, '01110172887', '01116030318', 'الغربية', NULL, '$2y$10$U/sBVngaQ6WQ0MOOFaa14eOvJvDPlLwbrGc3dwJSNgZp5Lqf37ReO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 05:08:16', '2023-10-10 05:08:16', NULL),
(75, 'Habiba Draz', 'habibadraz00@gmail.com', NULL, '01093737188', '01025250131', 'الغربية', NULL, '$2y$10$0jZ58MDz8cKHvNyZB2O7OelDtPH2iu5WbJHHb2OAdk0X7t/ZmN25O', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 05:13:40', '2023-10-10 05:13:40', NULL),
(76, 'Magdy Mohamed Bayoumy', 'bayoumym62@gmail.com', NULL, '01097371410', '01208739369', 'الغربية', NULL, '$2y$10$wz3PfaRBao0m5yxfB6M7f.M6jHrRkVgtkG2MAv923n8o.4u47m7j6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 05:50:31', '2023-10-10 05:50:31', NULL),
(77, 'بريهان محمد ابراهيم', 'berybangtan@gmail.com', NULL, '01122849009', '01140444920', 'الغربية', NULL, '$2y$10$ZoPiggG1rHTa0z08lyadg.EGlGlnzI4JuYPxmGmck8ODceHL/naPW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 05:51:25', '2023-10-10 05:51:25', NULL),
(78, 'سارة سامح محمد البطل', 'sockssara20@gmail.com', NULL, '01002359216', '01024078777', 'الغربية', NULL, '$2y$10$Ju1NsVD0oKaiqwd.ZlL52u1pW9zGE0S/zGhqHOxk5T2RxDN1oBki2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 05:54:58', '2023-10-10 05:54:58', NULL),
(79, 'منه الله محمد طاحون', 'mennatahon@icloud.com', NULL, '01099653780', '01155257764', 'الغربية', NULL, '$2y$10$rm5T5go0ydOumAObHZuoceqOhAntZZ1wVatP132/5r8VFM8S364HC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 05:58:04', '2023-10-10 05:58:04', NULL),
(80, 'ناريمان محمد العفيفي', 'mohamednariman30@gmail.com', NULL, '01558402525', '01551555122', 'الغربية', NULL, '$2y$10$jdjyAB7qAQNMPL7MspBhNeuACDQf/zjeWsc7YfOTtjkWSyhlwl/Ae', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 05:59:05', '2023-10-10 05:59:05', NULL),
(81, 'Waleed', 'waleedelashry7@gmail.com', NULL, '01097672129', '01014931385', 'الغربية', NULL, '$2y$10$tpbGvtdNO4U47NZJO1Cx/e8oqBcbZ8yY8X3Zf8tacGmabGqo8gIOS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 06:03:51', '2023-10-10 06:03:51', NULL),
(82, 'Mira Elshormollesy', 'mira.elshormollesy@icloud.com', NULL, '01001190982', '01224511638', 'الغربية', NULL, '$2y$10$qbtQRQfOLJAny1bTfRoijOq/srUT9WvJvvBGNrKxbDnARkICfYEVG', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 06:20:33', '2023-10-10 06:20:33', NULL),
(83, 'Ahmed Ghazy', '20102007ma@gmail.com', NULL, '01110044138', '01222974107', 'الغربية', NULL, '$2y$10$ZfYaVi20xvafWaB1q1fLm.LJqbPyObw.FEwR1WI/Wy2Ncc5Dq6RHO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 07:09:51', '2023-10-10 07:09:51', NULL),
(84, 'Youssef barhoma', 'youssefbarhoma123@gmail.com', NULL, '01288311858', '01204495657', 'الغربية', NULL, '$2y$10$s8r71zZbmMXK5uZDoMyf6uUnQIsTOIv.nxE5Ow7IQP5eBYPuMrVhm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 08:02:09', '2023-10-10 08:02:09', NULL),
(85, 'كريم ايهاب حسين', 'karimeh.ehab1203@icloud.com', NULL, '01003653439', '01100021678', 'الغربية', NULL, '$2y$10$P7GufC1lFvSz.EdjHF1fy.3kydnMa1c7bzgvUWc6QhdW8R4RlzlEO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 08:47:02', '2023-10-10 08:47:02', NULL),
(86, 'محمد مسعد رمضان', 'kokebast33@gmail.com', NULL, '01011671768', '01098003625', 'الغربية', NULL, '$2y$10$yaG8XNexbVgj4UZl9CHTEeQX7vlxOJ.ih1IzosElZZC5HtPKr6u5.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 11:25:49', '2023-10-10 11:25:49', NULL),
(87, 'علياء السيد هلال', 'loloelsayed061@gmail.com', NULL, '01020476641', '01206954405', 'الغربية', NULL, '$2y$10$VS5t/tRyRhVO5tFwTu1pbudIbRznAWHEGn6fGPpBZDohgcKLmPVee', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 11:27:18', '2023-10-10 11:27:18', NULL),
(88, 'Mohamed sherif samy', 'mohamd24zaglool@gmail.com', NULL, '01557182519', '01023071949', 'الغربية', NULL, '$2y$10$TgAuG/w8tbOiX3/HXqYrn.TVT3XxX.HTro6U.nBBNYYmbIgGafIGS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 13:29:20', '2023-10-10 13:29:20', NULL),
(89, 'Aya', 'hodahossam8@gmail.com', NULL, '01224061196', '01092449221', 'الغربية', NULL, '$2y$10$3bjpKhZ0CZTTuVyZexOiPeAFkoACXG2i3i6oyNx.KDuD6gcxqtZA6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 13:34:09', '2023-10-10 13:34:09', NULL),
(90, 'Joo', 'yusufdawoud2311@gmail.com', NULL, '01003864736', '01552028898', 'الغربية', NULL, '$2y$10$sbRvNGSgD9AB4vHwX5mhyeKR8clUJq/4rBU/nevXWm5gJt/wuBSyW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 14:48:13', '2023-10-10 14:48:13', NULL),
(91, 'mohammed said', 'mo.saeed.zizo55@gmail.com', NULL, '01091014528', '01095320079', 'الغربية', NULL, '$2y$10$RZFCs63/SV/3QB6/Renu1eLfefkyRB3ZuCwfT2Ni/pa4GZRCa/xJi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 15:16:21', '2023-10-10 15:16:21', NULL),
(92, 'Mariam Sabah', 'mrmrsabah@icloud.com', NULL, '01093953140', '01223547842', 'الغربية', NULL, '$2y$10$iiv.wKGh9CKJw9AUzz/DOuLuiQPBEi0dmWVYHDwUCGXqTlWQY45wO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 16:05:51', '2023-10-10 16:05:51', NULL),
(93, 'محمد أحمد أمين بر', 'mohamedbar1106@gmail.com', NULL, '01129270804', '01066913110', 'الغربية', NULL, '$2y$10$.KGWYxJPKs.seoftXmhY/OZmPtRDrU.fBOIWI9SoiVkcaB0irMhze', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 16:21:12', '2023-10-10 16:21:12', NULL),
(94, 'Tasneem bahaa', 'tasneembahaa31@gmail.com', NULL, '01009856954', '01019149603', 'الغربية', NULL, '$2y$10$Mxb/Mw66qHVX5T6SbFlNJusfeBLfJxiiXcmCHB8FbhAhPvbkGMi0C', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 16:41:42', '2023-10-10 16:41:42', NULL),
(95, 'امنية محمد عبدالله مرعي', 'mony12mony21@gmail.com', NULL, '01096170728', '01156455448', 'الغربية', NULL, '$2y$10$v5mmfngBuXF9PdexSxaXr.cPB7KDBs8GAxWGAN8d3wzPooypfjClO', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 18:28:41', '2023-10-10 18:28:41', NULL),
(96, 'روان منذر محمود اغا', 'rewanmonzer@gmail.com', NULL, '01061305834', '01144918171', 'الغربية', NULL, '$2y$10$8XmKZ1XeEopm2x0wMK0X1eRWjQ5D.DzIyrYtMeA2IUGJx2keI3n3K', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 20:10:38', '2023-10-10 20:10:38', NULL),
(97, 'Shahd mahmoud', 'shosho.dadoo@gmail.com', NULL, '01030455923', '01102016056', 'الغربية', NULL, '$2y$10$xr6fp8plfGuplyAY7339z.QD2LtIMsEYpjdu8iwgCcs8CFAgkLxvS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 20:30:20', '2023-10-10 20:30:20', NULL),
(98, 'اسلام احمد', 'ea890914@gmail.com', NULL, '01284579725', '01086414414', 'الغربية', NULL, '$2y$10$uOKIAc5Qglsk9A00l20LfeVl3FVsarAkbKDawbVXCAvVF1bwjmvHa', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 20:57:24', '2023-10-10 20:57:24', NULL),
(99, 'Mariam', 'maryomaa8853@gmail.com', NULL, '01010567263', '01203228107', 'الغربية', NULL, '$2y$10$pzpg9tj0gswBV.uAGQ2SbevYfOT09ihIWcZBkaYgmytKJbArpL/V.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 21:03:55', '2023-10-10 21:03:55', NULL),
(100, 'ياسمين هشام', 'yasmeenhesham703@gmail.com', NULL, '01097626557', '01501543348', 'الغربية', NULL, '$2y$10$3E5W2B.51XQ83TKZiEJXQOcX4/Hdd2qOWJh49NxW89nH3QGm4CPaG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 21:43:35', '2023-10-10 21:43:35', NULL),
(101, 'عبد الرحمن عبد العزيز', 'abdelrahmanabdelaziz47@gmail.com', NULL, '01002628534', '01091874524', 'الغربية', NULL, '$2y$10$r2j8YjW0zD0motQ5TecCCO7fyQYIXgxuwx8HlAk3jo6UIh4K4pEKS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 21:55:03', '2023-10-10 21:55:03', NULL),
(102, 'Malak Ayman', 'sallamMalak50@gmail.com', NULL, '01024177186', '01285101743', 'الغربية', NULL, '$2y$10$p2CHz3lznCJFeBNNU9Xnke74gzPL1xtpuezCoENYNxbl1k6vxRkay', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 22:25:32', '2023-10-10 22:25:32', NULL),
(103, 'Samia Mohamed gnedy', 'samyagnady080@gmail.com', NULL, '01207335660', '01207499558', 'الغربية', NULL, '$2y$10$uCo2R4ucS7IrXjvKnmhR8.mdwRgbSL0Jtlds7rXpuW3gbUWs4SOzu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 22:28:21', '2023-10-10 22:28:21', NULL),
(104, 'Bavlymaicheal', 'bebobavly357@gmail.com', NULL, '01285054113', '01273232795', 'الغربية', NULL, '$2y$10$RW14A10okckjNvkm4yV0OOrmpJRozEAtUXwYCroJCuQmwGMZl3EY.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 23:42:03', '2023-10-10 23:42:03', NULL),
(105, 'حبيبه هيثم احمد الحو', 'alhwmhmd67@gmail.com', NULL, '01202429988', '01008431662', 'الغربية', NULL, '$2y$10$mvshxhe.ASXR2i1fuSgRderP4o9DO7vuSWj.muXLVDuwQPd1FMUjW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 00:28:14', '2023-10-11 00:28:14', NULL),
(106, 'ياسمين حماده', 'yasminhamada2006p@gmail.com', NULL, '01013352070', '01008467413', 'الغربية', NULL, '$2y$10$sN1MeXx7uPwp38z2nNiamuUrM8oXiDRcJ7ww2nd0dcYVWddXYn/cO', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 01:05:03', '2023-10-11 01:05:03', NULL),
(107, 'نادين سليمان', 'nadeen.dodo.2020@gmail.com', NULL, '01093406133', '01064369906', 'الغربية', NULL, '$2y$10$Q/jQXiIrrPUJE2OBxAhtmOtTUTwlFozrtY/9LXQULlwvRFEsKVYuu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 01:18:03', '2023-10-11 01:18:03', NULL),
(108, 'Yousef elhabbal', 'Sm633951@gmail.com', NULL, '01090426195', '01014259179', 'الغربية', NULL, '$2y$10$fVZaFBuX7TJK6afN1asfI.yR.GuBt.BVifYnfKs36ZABLYiYBQSjK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 01:37:09', '2023-10-11 01:37:09', NULL),
(109, 'Hana Hany', 'hanahanymetwally@gmail.com', NULL, '01063735674', '01005093298', 'الغربية', NULL, '$2y$10$fuYCBzk.JdfA4wSCs56ZdOydt9qJByUPS8SIhDgQVrQIB1zPnj12.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 02:13:03', '2023-10-11 02:13:03', NULL),
(110, 'Manar', 'engahmedgamal0086@gmail.com', NULL, '01000770456', '01002886233', 'الغربية', NULL, '$2y$10$XM8DszEoY3MOqs2VIRi.XuPtNpipcaC8f6XpxhQlo8pp5ck7IiKLu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 02:21:20', '2024-05-31 09:41:49', NULL),
(111, 'ملك محمد جاد ابو اليذيد الوقاد', 'malakgadmalak00@gmail.com', NULL, '01029427171', '01223134726', 'الغربية', NULL, '$2y$10$yXprP.AhzoznkCNSRT4dne2NPK5qfddMG83pX4YrtqHH1jL3RkonO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 03:00:54', '2023-10-11 03:00:54', NULL),
(112, 'روان عمرو الحناوي', 'elhenawyrewan738@gmail.com', NULL, '01096497765', '01281961112', 'الغربية', NULL, '$2y$10$Y4CSZ.X3dtdpIPkcyuxajefmsKTI.VD.cvIeY6qRQ/aUQrfrVBDl.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 03:02:52', '2023-10-11 03:02:52', NULL),
(113, 'حبيبه عصام الفخراني', 'h.essam1020@gmial.com', NULL, '01225511901', '01211168027', 'الغربية', NULL, '$2y$10$y5Ix65ekyNvipwRGEmwVjOu34u1dJb68WsPII1fzbjD2KXENHbL1K', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 03:04:36', '2023-10-11 03:04:36', NULL),
(114, 'marwan mohamed megahed', 'megahedmarwan@gmail.com', NULL, '01099880000', '01069698888', 'الغربية', NULL, '$2y$10$PBWail1L71xjc/c47hGqsuBAM4JvW454y4Mdnazrxki8o138DyR/m', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 03:10:40', '2023-10-11 03:10:40', NULL),
(115, 'سما إيهاب خيري', 'smakhyry33@gmail.com', NULL, '01005117043', '01005123200', 'الغربية', NULL, '$2y$10$WfhIDvQp27NnqMzV7K7wKu7DnF1vkC3s1vcHEewIiLvcnDDGo8Jhy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 03:29:03', '2023-10-11 03:29:03', NULL),
(116, 'محمد احمد بسيوني', 'mohamedahemdbasiony@gmail.com', NULL, '01202394484', '01202323032', 'الغربية', NULL, '$2y$10$C6v2p.hiXPGgfV.5rO.Beu/J1yqM33T7UUQ8OunXnaaGGbkfnHR..', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 03:32:18', '2023-10-11 03:32:18', NULL),
(117, 'malak ashraf', 'malakashraf7@gmai.com', NULL, '01227309156', '01287024514', 'الغربية', NULL, '$2y$10$NJ2twB25Nr5sMoWXlqZg7u4zOgrPys5Wsm7bECT9qfLHpn1bbziey', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 03:38:16', '2023-10-11 03:38:16', NULL),
(118, 'Omar amgad', 'omaramgad834@gmail.com', NULL, '01022466898', '01273139639', 'الغربية', NULL, '$2y$10$hiTQuXtKm9IzPBYOhNT0fe4cym13DJxkEEBIB1WC4J7dU0eTmNJ9.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 03:53:20', '2023-10-11 03:53:20', NULL),
(119, 'Salma Mohammed', 'salmasallam4321@gmail.com', NULL, '01110961581', '01014878983', 'الغربية', NULL, '$2y$10$cwgxDFVlGkz6KRddPc5qT.p/Tbe2fpnF5v38YO6oKomVP9rXlfQr2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 04:02:27', '2023-10-11 04:02:27', NULL),
(120, 'مريم سمير', 'mariemsamir@com', NULL, '01223852292', '01284370641', 'الغربية', NULL, '$2y$10$joP0z.YvsZ08GKMum33/EOv7lZE/64AAiKchPCStL4m8uiskF9tS2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 05:01:28', '2023-10-11 05:01:28', NULL),
(121, 'Haneen elazab', 'haneenel3azab@gmail.com', NULL, '01025422872', '01030809350', 'الغربية', NULL, '$2y$10$ZJdtNbR8y7789z8F2pVZ2eC/dzJx0odsBxFYfh.2W2EmQoYkYds5K', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 05:02:27', '2023-10-11 05:02:27', NULL),
(122, 'روان اسامه', 'orwan2649@gmail.com', NULL, '01278538210', '01141986810', 'الغربية', NULL, '$2y$10$1etoLpH0v2c2OvmYVJj2vuXl3ZvVyTNtDz0.ZGIt4seyPA.daTe8a', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 05:21:53', '2023-10-11 05:21:53', NULL),
(123, 'حسين ابراهيم حسين عبده', 'bdhhsyn350@gmail.com', NULL, '01063271185', '01068822316', 'الغربية', NULL, '$2y$10$T3CDWunzY2FZ8pf5IEjPluxbuTgGxpIMkmS1ZqUEGgq6vDqex.WRS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 06:00:54', '2023-10-11 06:00:54', NULL),
(124, 'Eman ali', 'emanali8122005@gmail.com', NULL, '01141157662', '01210741813', 'الغربية', NULL, '$2y$10$tD57ILLgBxWcPLYnuUz7KuHL9DtgzWrcjxCgaEY5QeRENe9P3eSke', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 06:53:31', '2023-10-11 06:53:31', NULL),
(125, 'Mohamed Ahmed dahshan', 'dahshanbrothers@gmail.com', NULL, '01140170866', '01063538701', 'الغربية', NULL, '$2y$10$zZ1tD8/00iOm6Ymo0hzQsuzYQ4fmz90UNW5qvZlOhb9.LZ.I0qvoq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 09:02:26', '2023-10-11 09:02:26', NULL),
(126, 'عبدالرحمن حسن علي', 'alyhassan286@gmail.com', NULL, '01121369784', '01098369069', 'الغربية', NULL, '$2y$10$gNxLxreDKqJCsZgTiG1OheMPDnnV1hLJOjtjKmQRqFYS5OXfhEgay', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 12:38:38', '2023-10-11 12:38:38', NULL),
(127, 'Malak Fahmy', 'fahmyvip2000@gmail.com', NULL, '01099052827', '01008333791', 'الغربية', NULL, '$2y$10$sthWySo1Z0jvMeeCueUWteHypooRUer84sYufxJQXfdJo5h9NQgT6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 13:51:15', '2023-10-11 13:51:15', NULL),
(128, 'Youssef Fouad', 'fwady979@gmail.com', NULL, '01272308237', '01288380643', 'الغربية', NULL, '$2y$10$SUvCYOUh8d5yACJ0aJGP9OtvasA.rAAMI/pzFTUs4WrR3UcOG2FWe', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 15:52:50', '2023-10-11 15:52:50', NULL),
(129, 'Mo3taz', 'motazelassy210@gmail.com', NULL, '01032858934', '01032858934', 'الغربية', NULL, '$2y$10$u95MWj2s6ErCBocbEt3xn..6SIB0fqSQAEq.GCRupOgC1nSRdB0gW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 16:40:39', '2023-10-11 16:40:39', NULL),
(130, 'لميس عمرو', 'lamisamr04@gmail.com', NULL, '01009642765', '01062318880', 'الغربية', NULL, '$2y$10$wBmWERmSrIznmw2S1hZq3eKm0hDZD6FTuFSNcqJNqU2VuALsr/Ra6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 16:50:16', '2023-10-11 16:50:16', NULL),
(131, 'Mostafa Ahmed El-shie5', 'mostafaelshei36@gmail.com', NULL, '01229036550', '01271123482', 'الغربية', NULL, '$2y$10$/gZjBN5IqpwfE6peNni08e2chGb4/gMTmRilcDgfAIjLXXDKj6yhm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 16:52:30', '2023-10-11 16:52:30', NULL),
(132, 'هبة عبدالعزيز', 'hebaelbaaly7@gmail.com', NULL, '01557266304', '01223651483', 'الغربية', NULL, '$2y$10$EbQmi4SaX3SwkDFb25iDtu4wWZBZnxSejDaspwS0/1PFXnklrbYga', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 17:22:43', '2023-10-11 17:22:43', NULL),
(133, 'رودينا عمرو', 'rodinaamr144@gmail.com', NULL, '01273390877', '01286898799', 'الغربية', NULL, '$2y$10$f7hTpbDmCo58gnfB3S794OoB06zLUvzEkenUZJzvjmzx2jctZXd8q', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 17:47:41', '2023-10-11 17:47:41', NULL),
(134, 'عمرو جمال امين', 'amr895028@gmail.com', NULL, '01068026316', '01096032668', 'الغربية', NULL, '$2y$10$F977wLXfSm1uRqZJSD7mBOF3KoHlew1pRRuwhGC3lJpi0Dwvc37M6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 17:48:13', '2023-10-11 17:48:13', NULL),
(135, 'رحمه حاتم جوالي', 'ramagawaly@gmail.com', NULL, '01151689000', '01095222333', 'الغربية', NULL, '$2y$10$.APpQjVGZk0aNBwneE2al.DXx2gtxAxeptjXyB8vrRrwaNvaAT7bC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 21:04:01', '2023-10-11 21:04:01', NULL),
(136, 'Ahmed fouad haggag', 'hagggagma@gmail.com', NULL, '01069374799', '01028006165', 'الغربية', NULL, '$2y$10$YkEz1xos5YSsLGyAI8yaYutD2cVlguSolNc87v2.EWh2m0NWPVenu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 22:57:59', '2023-10-11 22:57:59', NULL),
(137, 'سارة عمرو الجزار', 'SaraElgazzar@gmail.com', NULL, '01016858432', '01067076382', 'الغربية', NULL, '$2y$10$EsXv6qwO2EI.bfgZaNPD2.Ih5TgcHRG5S90u2qmJwjAt2m1krXz3y', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 23:42:16', '2023-10-11 23:42:16', NULL),
(138, 'Karima Mostafa', 'karimamostafa05@gmail.com', NULL, '01279439341', '01229492663', 'الغربية', NULL, '$2y$10$na247uHKhwFw1/Yq2FNwc.FWAsqGKHgbkhSoVM1RwUEoK5BVDJvnC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 00:12:24', '2023-10-12 00:12:24', NULL),
(139, 'Farida Hany elnaggar', 'faridaelnaggar240@gmail.com', NULL, '01226388486', '01210608085', 'الغربية', NULL, '$2y$10$SOKi.VkGBRzL5Fl8xQkuuOA7DW5d2tE4JaumO5n4uupKSECsSidH6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 00:52:14', '2023-10-12 00:52:14', NULL),
(140, 'Mohamed mahmoud', 'hodamedo045@gmail.com', NULL, '01553639843', '01153876284', 'الغربية', NULL, '$2y$10$t.HDsdoYQ/JoX2BD66XPfuP7HEtbaALOZFJYEktWkcnkfK/kGVtF2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 01:22:43', '2023-10-12 01:22:43', NULL),
(141, 'Aliaa', 'aliaamursy@gamail.com', NULL, '01281546070', '01279666036', 'الغربية', NULL, '$2y$10$PMlzB36UiGfAc.dq2wttmezLZOl/QXx8KrELHOxYiIqfr29p8utyu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 02:26:23', '2023-10-12 02:26:23', NULL),
(142, 'Shahd', 'fekrysami25@gmail.com', NULL, '01029939027', '01212808659', 'الغربية', NULL, '$2y$10$BdOyPxioJoXK3vPq4KqNQeHOnBaeXuk.pjn2wdtY6f72DKD3uI9BS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 02:36:01', '2023-10-12 02:36:01', NULL),
(143, 'Yousef adel said', 'yousefxxpp@gmail.com', NULL, '01220940892', '01222674866', 'الغربية', NULL, '$2y$10$DaGsjaJuZ7ykr/UPkqdto.SufEYybHxk9HiG8dsnuZKcswq/MldLu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 02:42:42', '2023-10-12 02:42:42', NULL),
(144, 'مهند رامي السعيد', 'mohanadramy88@gmail.com', NULL, '01205798695', '01205798695', 'الغربية', NULL, '$2y$10$YaSnzr1hXYyC76wJpSDMTuUspsfrI9doPFy/xnPJc/xoX3rjnIsi.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 05:40:36', '2023-10-12 05:40:36', NULL),
(145, 'حنين كامل شعبان', 'ahmed.kamel201992@gmail.com', NULL, '01026191284', '01004488385', 'الغربية', NULL, '$2y$10$.YeySca/rJvZoHM86lPBE.cC4glpOKQrqurKJpmyVDvJhvIbR032W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 06:18:14', '2023-10-12 06:18:14', NULL),
(146, 'عمر محمد محروس ابوزيد', 'omarozoo121@gmail.com', NULL, '01270206071', '01205042111', 'الغربية', NULL, '$2y$10$cxcM7glT/sGaCoSy4ZhcZe7TBKcZc3xEF6w9EibrnbIzUdP4j/29q', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 06:32:57', '2023-10-12 06:32:57', NULL),
(147, 'ماجد رامي', 'magedgamer11@gmail.com', NULL, '01205798694', '01212785720', 'الغربية', NULL, '$2y$10$moOzO0iIz5V7t.o6XjEvnuAjA/odDj2bp68F.Sc18RmL3nKBJqKRq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 06:37:49', '2023-10-12 06:37:49', NULL),
(148, 'Farah Wesam', 'farahwesam16@gmail.com', NULL, '01224521742', '01224521742', 'الغربية', NULL, '$2y$10$/QfIKZZ4N9CGxQALaSWyRe9RYHOcJ9m4dokFLyN2zPTxeTD9bdc5i', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 07:49:13', '2023-10-12 07:49:13', NULL),
(149, 'Yousef Yossry', 'yousefyosry5@gmail.com', NULL, '01274484939', '01270645409', 'الغربية', NULL, '$2y$10$5E9woO2Pegdj33DNjxlH/eFDBZmVCU7UnMFa0cgreMGJHofNbS3ra', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 08:45:40', '2023-10-12 08:45:40', NULL),
(150, 'Hanna', 'hannagamelgamel@gmail.com', NULL, '01013262876', '01062661293', 'الغربية', NULL, '$2y$10$.kdyj5fUkx2Ro0MxIV/Ufutf3rm6PG35hK.OT5Dd7MaQJvdMRdava', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 12:02:39', '2023-10-12 12:02:39', NULL),
(151, 'كريم سامح سمير', 'kareemruneer11@gmail.com', NULL, '01553370444', '01550593959', 'الغربية', NULL, '$2y$10$4H/esvcF8tO2VVvAEQdK6euB3FCUQZomYS6COhNaD161.zXo2C5oe', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 15:09:26', '2023-10-12 15:09:26', NULL),
(152, 'أدهم ايهاب محمد', 'adhamehab012@gmail.com', NULL, '01155291678', '01100075923', 'الغربية', NULL, '$2y$10$aoebt7s2SM1TqO3PbyJQFOm0CudTkMkC6yPmSoiPttXgzzOZzm3YW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 15:54:30', '2023-10-12 15:54:30', NULL),
(153, 'رحب طارق', 'rahbtarek1@gmail.com', NULL, '01281067684', '01156614476', 'الغربية', NULL, '$2y$10$EP6ZtfUfXpm0I9ah9DcHL.sEi/RVgoCds8KGO2harKLSCAwCCvaWC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 16:58:09', '2023-10-12 16:58:09', NULL),
(154, 'Yara elfarsy', 'yaraelfarsy@gmail.com', NULL, '01010922207', '01008578361', 'الغربية', NULL, '$2y$10$uBpUDoJjy/aTcBttZecCr.3YZ9Ii23clnC2kMZHzyvD6cVFK1f5G.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:43:10', '2023-10-12 21:43:10', NULL),
(155, 'Nesma Nabil', 'nesmanabilabdelrhim@gmail.com', NULL, '01278755403', '01125259973', 'الغربية', NULL, '$2y$10$I.oQKHoyA0TO53Rz2xyIm.2dfDXYQd22kiS8144UzJJmsi1UCVbwy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:43:20', '2023-10-12 21:43:20', NULL),
(156, 'جني صبحي محمد', 'janasobhy000@gmail.com', NULL, '01281355289', '01223387834', 'الغربية', NULL, '$2y$10$ETWVVZ9icOxSehD8mnelweOr1BevsijakPpWz6mAXQ.9QAQ0w3oGi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:44:06', '2023-10-12 21:44:06', NULL),
(157, 'Rahma Gamal', 'rahmaelnashar810@gmail.com', NULL, '01276381569', '01277624801', 'الغربية', NULL, '$2y$10$UFCxZlUTpux3ayVXyh4eKOxTMKbLwDsbtvEziC1iICzj.2EchaOXu', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:44:10', '2023-10-12 21:44:10', NULL),
(158, 'عمر محمد عبد الكريم', 'omarrrrzz455@gmail.com', NULL, '01032966351', '01022511314', 'الغربية', NULL, '$2y$10$YZaDpG6lDA.XtLE/pwaU0ewcsS70hqyZz.9A9ABrAS2zDhD.YZgWq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:44:25', '2023-10-12 21:44:25', NULL),
(159, 'Farida', 'nohamongy12@gmail.com', NULL, '01026755367', '01010910902', 'الغربية', NULL, '$2y$10$BH1ioJyEEn7PQVdGlyoLa.nusWjaBV98a/DKBpUKzBJUrR7G3TetC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:44:34', '2023-10-12 21:44:34', NULL),
(160, 'عمرو عبدالعزيز مروان', 'amro.mrawan2003@gmail.com', NULL, '01112335283', '01557700705', 'الغربية', NULL, '$2y$10$Te2AWNt4Rkn77szmiObwRealmog0HVXOwQ1RSvj2W9R2Rk9fGrDTC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:45:30', '2023-10-12 21:45:30', NULL),
(161, 'Rowida khedr', 'rowidakhedr984@gmail.com', NULL, '01147630311', '01205586239', 'الغربية', NULL, '$2y$10$0UD4AfBXuUm6xlMvSjORgO3Nfux7UfXIWoxtvaq8HnJEs9WbkXj7u', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:45:52', '2023-10-12 21:45:52', NULL),
(162, 'جنه فره', 'gannaferra45@gmail.com', NULL, '01224438765', '01226807332', 'الغربية', NULL, '$2y$10$0WiKz09ayyO0yHqIGwDaM.evjqZP.afHFtIAuSBNW70.hmHrjl3D6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:48:24', '2023-10-12 21:48:24', NULL),
(163, 'إسراء سامي مشعل', 'esraamashal@yahoo.com', NULL, '01110384998', '01286962719', 'الغربية', NULL, '$2y$10$N4mkoJNl18eZagHWrqePve6rm9jT53Fy50xUinlDZHd/jnR.cw3zq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:51:54', '2023-10-12 21:51:54', NULL),
(164, 'منى سعيد محمد', 'mona.said9@icloud.com', NULL, '01205344298', '01271856878', 'الغربية', NULL, '$2y$10$eCuhws52l21uyhWzEmpnQe66XQSDP8xgOCER9oTITrRItfhKsO8Qe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:53:47', '2023-10-12 21:53:47', NULL),
(165, 'Rodina', 'rrody5516@gmail.com', NULL, '01220646771', '01220666920', 'الغربية', NULL, '$2y$10$sf6a.ZAFz1K.7T1pcOlG..GkIEHIP.h7K2MiDURtpmS/0E.VcGyEm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:53:57', '2023-10-12 21:53:57', NULL),
(166, 'همس على مناع', 'hmsmanaa@yahoo.com', NULL, '01010425413', '01010505976', 'الغربية', NULL, '$2y$10$7eQrYsP0u3TEsa3EchWemuXgCX75JjcOdrCj0XzOF7z7uadohuZy2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 21:58:19', '2023-10-12 21:58:19', NULL),
(167, 'ملك هشام السيد', 'malakhishamel@gmail.com', NULL, '01100764967', '01096289771', 'الغربية', NULL, '$2y$10$FMrvRVnfp6IrTb2YziZbleKfiFS8tVzO.qo/M8b9eSTgCblRhF4rS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 22:07:27', '2023-10-12 22:07:27', NULL),
(168, 'Sohila osama', 'sohilao831@gmail.com', NULL, '01559986351', '01060206351', 'الغربية', NULL, '$2y$10$hD3jIzjxEF.EwR1cNo1.n.RL.ROHZ.aQ0PUgkwfVz9.45q9cRjCrC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 22:13:58', '2023-10-12 22:13:58', NULL),
(169, 'سنا حسان سليمان', 'sannnahassan@gmail.com', NULL, '01272271173', '01005736008', 'الغربية', NULL, '$2y$10$wbVt.F0RMy.Zdy/n0pvhH.jf3tozE70EOeiOfAyHEN3n2O8OryFbG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 22:14:06', '2023-10-12 22:14:06', NULL),
(170, 'مريم إبراهيم مصطفى', 'elbayoume@gmail.com', NULL, '01277466994', '01275331886', 'الغربية', NULL, '$2y$10$TbgP1nJWoT69g/KHnY97o.tqDRzS5uQmUrw15bf0TLfyeh2HsL7Ba', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 22:15:38', '2023-10-12 22:15:38', NULL),
(171, 'عبدالله احمد حسن', 'bedoabdallah2030@gmail.com', NULL, '01068136925', '01201482995', 'الغربية', NULL, '$2y$10$z9PQBsWWvic8GXvA12xzS.zIQr.ocH7WzGnUpLdpZjbTBcAGjcCQ2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 22:33:18', '2023-10-12 22:33:18', NULL),
(172, 'رنا احمد سند', 'rnasane@gmail.com', NULL, '01284174065', '01282028470', 'الغربية', NULL, '$2y$10$JMCGcRCiyV.31AobNx.c5.O09Z1QNJCFLzlA6aK/0wEBD/F.oQOsa', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 22:34:02', '2023-10-12 22:34:02', NULL),
(173, 'حنين محمود عطيه بدر', 'haneenbadr112007@gmail.com', NULL, '01276432235', '01229803646', 'الغربية', NULL, '$2y$10$634/TD7T6cf1YURnof245e9uvratE8qBfIs/t4jkU80553rcSTn2K', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 22:39:17', '2023-10-12 22:39:17', NULL),
(174, 'مريم احمد شيحة', 'mariamshiha@icloud.com', NULL, '01288733723', '01201788543', 'الغربية', NULL, '$2y$10$CG9VE3vCAbWG2PLKJHCIK.bdSh8z2imczIgnySLcchLRFnP0TE5cW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 22:49:40', '2023-10-12 22:49:40', NULL),
(175, 'حبيبه اشرف فؤاد', 'habibaashraffoad@gmail.com', NULL, '01119251296', '01122869306', 'الغربية', NULL, '$2y$10$A4FJ3lnvRQrG4bJ5z0CMy.QaNFj7HqSjez9l7T3AxuDrCQCw9HKeC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 22:51:44', '2023-10-12 22:51:44', NULL),
(176, 'salma mohamed joudah', 'mrsjoudah@gmail.com', NULL, '01009350686', '01116030318', 'الغربية', NULL, '$2y$10$eF.7B8k/5HliUi4LxSd9JecECHwAl/vCBY8QhYhQmUudWpyQxvgMG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 22:55:22', '2023-10-12 22:55:22', NULL),
(177, 'مهاب جمال محمد الخطيب', 'mohabjamalkh@gmail.com', NULL, '01153304989', '01158877212', 'الغربية', NULL, '$2y$10$RHn7CmtT0rzO2S.HqDcfr.59A9sCm4S0MFvkgpXlj5PZNuxJgRzf.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:05:45', '2023-10-12 23:05:45', NULL),
(178, 'حنين احمد', 'hsjsvxjs@gmail.com', NULL, '01552900527', '01557239439', 'الغربية', NULL, '$2y$10$7/psth6IyT3MFTlFXmnlXOU7dhLkZWkKHPmBY2pI7e/1krGWkiEFK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:09:05', '2023-10-12 23:09:05', NULL),
(179, 'Marwan Mohamed', 'mr_marawn@yahoo.com', NULL, '01272444939', '01202553468', 'الغربية', NULL, '$2y$10$h9iVyi/t0NbzycZA619KJOhMwTtZrZ5jfDaFlqiRh2WLdpBlGYDMC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:14:01', '2023-10-12 23:14:01', NULL),
(180, 'Omar Shreef', 'omar.bebo@icloud.com', NULL, '01277624906', '01277624906', 'الغربية', NULL, '$2y$10$U/b8W.B73SehgQ9MEmqSAeMM31U1Y0CnI/3zd3zY65t0VTA2TI32W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:19:33', '2023-10-12 23:19:33', NULL),
(181, 'عمار ياسر', 'amoryyasser2005@gmail.com', NULL, '01021721737', '01001809838', 'الغربية', NULL, '$2y$10$e72DRSE6CWY.h2/Hk2SK4.KrHvVr3ZHkPXmdwsfnLtNGbduLmZv8W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:19:53', '2023-10-12 23:19:53', NULL),
(182, 'حبيبة جمال', 'Iamhbyt94@gmail.com', NULL, '01001794658', '01001794658', 'الغربية', NULL, '$2y$10$aBw7vj8i4kD66g7TS.WPmOwvted6ItitP61Ysf818S2AWTmR3JyuK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:21:53', '2023-10-12 23:21:53', NULL),
(183, 'حبيبه ابراهيم محروس', 'habibamahrous92@gmail.com', NULL, '01019471866', '01099507441', 'الغربية', NULL, '$2y$10$JAMRp7ZPORZroMg0JN4gC.McAM7nG6YoXAC040VPu0j6Rs7TWqyDS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:22:05', '2023-10-12 23:22:05', NULL),
(184, 'ZËZŌ ËLHÂDÅRY', 'zyadkhaled360@gmail.com', NULL, '01006014260', '01067820894', 'الغربية', NULL, '$2y$10$aOETTyNuV1RuF.DsuNieKuV2wF1IRDgFUSC9CjsGDr5mAhu//gGFi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:23:54', '2023-10-12 23:23:54', NULL);
INSERT INTO `users` (`id`, `name`, `email`, `gender`, `phonenumber`, `phone_parent`, `government`, `email_verified_at`, `password`, `all_points`, `active_points`, `profile`, `subject_id`, `school_grade_id`, `group_id`, `teacher_id`, `remember_token`, `status_exam`, `provider_id`, `provider`, `created_at`, `updated_at`, `deleted_at`) VALUES
(185, 'نورين ابراهيم', 'omarnoreen072@gmail.com', NULL, '01090572173', '01000924556', 'الغربية', NULL, '$2y$10$quuj/vSezeHwhYnbdyDMROmVpE3vnh8Ne8SyycnM5JnmhbonI6WRG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:29:24', '2023-10-12 23:29:24', NULL),
(186, 'فرح احمد الرفاعي', 'Farah012210@gmail.com', NULL, '01068095110', '01221088636', 'الغربية', NULL, '$2y$10$WNJSWhUBAkKWc0kyv9Lh6u1XH5ThGQywtktncDo7RwzIJsdSTb5G6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:30:29', '2023-10-12 23:30:29', NULL),
(187, 'ندى ايهاب عبد الوهاب', 'ndhfb25@gmail.com', NULL, '01507081544', '01010656273', 'الغربية', NULL, '$2y$10$ZUlKW.hbgccCZiDR8spkiOGSik63HTH3vGwj3JIUsER9EMpuarDLK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:31:10', '2023-10-12 23:31:10', NULL),
(188, 'Mohamed Sa3ed', 'spstone0@gmail.com', NULL, '01271178866', '01205716777', 'الغربية', NULL, '$2y$10$KnWoGrlwLylFrIzJmCuQ4.bTa4tKS.prtrATmSQTJXyT7/0AU7v7K', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:31:12', '2023-10-12 23:31:12', NULL),
(189, 'Omar hamdy', 'moraahamdy11@gmail.com', NULL, '01153073591', '01153073591', 'الغربية', NULL, '$2y$10$qTdMifiM4H7S26wYDQwSpOqi11czdvpxceuZjoSdMGnzEew4H/mW6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:50:30', '2023-10-12 23:50:30', NULL),
(190, 'محمد احمد ابو الخير', 'm.ahmad.aboelkheir@gmail.com', NULL, '01015974499', '01027798634', 'الغربية', NULL, '$2y$10$5jG3Wd/wkGOXNPi28LaT7.J7JYivuZm5J1KtPFewa2.bvxE166IBO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:02:47', '2023-10-13 00:02:47', NULL),
(191, 'رودينا حسان', 'rodinahosam@gmail.com', NULL, '01016499564', '01221747841', 'الغربية', NULL, '$2y$10$omerw5aGsai.1usOX.VyhOyU2mrriSHZUZueLc2aHM4o7saC4NXhG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:09:43', '2023-10-13 00:09:43', NULL),
(192, 'روان ايمن ابراهيم', 'rowanayman10@gmail.com', NULL, '01032710567', '01030241646', 'الغربية', NULL, '$2y$10$xuSqsgRy/OvMynwpsM/V4OwBPmA.f6/P1Aj3cQrNxL/xRjD41nwbK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:16:46', '2023-10-13 00:16:46', NULL),
(193, 'Habiba Elsissy', 'elsissyhabiba@gmail.com', NULL, '01067367369', '01010391478', 'الغربية', NULL, '$2y$10$yiY4y3ShRTktc8Kw4voMte.Jnain7JsYEsmwJd4IAx/nUiDIGDvhC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:34:42', '2023-10-13 00:34:42', NULL),
(194, 'رحمه محمد منصور', 'rhmh1627@gmail.com', NULL, '01121371509', '01111253555', 'الغربية', NULL, '$2y$10$ekWsPF4mfsztWg5phDW3w.y4hhuSL3rfHyh1T4PL7EG/9h8xN.8Ry', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:01:48', '2023-10-13 01:01:48', NULL),
(195, 'Ganna elmasry', 'gannaelmasry367@gmail.com', NULL, '01159820782', '01115533414', 'الغربية', NULL, '$2y$10$MbiAJF.12aHDsLG3b.RQy.oN8E9O2.MYmqSs3CPCqWHk30sPUxLke', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:12:55', '2023-10-13 01:12:55', NULL),
(196, 'محمد ايهاب الشناوي', 'mohammedelshenawy261@gmail.com', NULL, '01501302076', '01555960692', 'الغربية', NULL, '$2y$10$XjKizSgbiCvvgi7hlyduSeyW6mTzOIFCjga3kaXveY5uDaxam.A7q', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:18:03', '2023-10-13 01:18:03', NULL),
(197, 'مريم السعدي الشناوي', 'mariemelsaady15@icloud.com', NULL, '01285335474', '01273336597', 'الغربية', NULL, '$2y$10$K6EhMR73f4CLQwq1t2gSSuFNksSQ.LGMw4G6E4X9PCYPFmPUtLpe2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:42:07', '2023-10-13 01:42:07', NULL),
(198, 'رودينا محمد عبد اللطيف', 'rodinamohamed494@gmail.com', NULL, '01090401982', '01063695005', 'الغربية', NULL, '$2y$10$ktJjxvtX57C7w.MugI0j4eB78PtW7vJ8jEHbiUsuvnPe.CK9MMvTu', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 02:36:12', '2023-10-13 02:36:12', NULL),
(199, 'ايمان احمد سعد بر', 'ea0msh@gmail.com', NULL, '01021738808', '01060212168', 'الغربية', NULL, '$2y$10$1ccM47n6JPohypeVVuC1C.tGdVd1SCQY.qn5njUNkf8DD5ZsDOQ/O', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 03:02:36', '2023-10-13 03:02:36', NULL),
(200, 'Sama Allam', 'samaallam412@gmail.com', NULL, '01004135288', '01004106051', 'الغربية', NULL, '$2y$10$gFjfYbq6Kms5Pkb.icrk6uiARDTsdppKKp7V58GoeaxQ8ljAQXQQC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 03:09:56', '2023-10-13 03:09:56', NULL),
(201, 'Mariam Bahaa', 'm91127981@gmail.com', NULL, '01206544524', '01271539418', 'الغربية', NULL, '$2y$10$3llkZCHofnSsg.u4XNGdOum/UMGcyC5y1YVZqPp6QuvWsbO0vUaZW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 03:14:00', '2023-10-13 03:14:00', NULL),
(202, 'rokaya', 'rokayakhaled2006@gmail.com', NULL, '01201156687', '01224444271', 'الغربية', NULL, '$2y$10$kJNTf13PdTMx6Eb8oDqbQ.j8aJey.YZYr4u.Bn5TUgTdj0MI/ypvy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 03:16:24', '2023-10-13 03:16:24', NULL),
(203, 'منه عمرو النمر', 'menna.amrr34@gmail.com', NULL, '01279262046', '01211468362', 'الغربية', NULL, '$2y$10$5ApDBQOyLPqsyJRIMDxhOO2E8OMt5n60ZrrDDnrNSoPkNKBU3KD1S', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 03:34:51', '2023-10-13 03:34:51', NULL),
(204, 'حبيبه سعيدوني شعبان', 'Habibasaid07@gmail.com', NULL, '01098043711', '01554505254', 'الغربية', NULL, '$2y$10$TqqX2hvtZ4KLAKzp0Es2lu3YT/LyOTgw1/zAiHkT0DFVuc6vxDzAi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 04:13:21', '2023-10-13 04:13:21', NULL),
(205, 'Shahd mohamed', 'shahodam7med16@gmail.com', NULL, '01283947242', '01273742409', 'الغربية', NULL, '$2y$10$0z7RurCzVIIPTuPS6mVBKOZcj4jxY0Ee3lQl5epRPSnUCMpJzsU/m', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 04:40:07', '2023-10-13 04:40:07', NULL),
(206, 'Miran', 'miranazzam368@gmail.com', NULL, '01551211035', '01033550920', 'الغربية', NULL, '$2y$10$Ir4yyGlWWfcytNuWpHDej.aiEHill4zTThPVg1YXbUkaK.7PwtHNu', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 05:13:57', '2023-10-13 05:13:57', NULL),
(207, 'Malak mo3taz', 'malakmoataz55@gmail.com', NULL, '01554431071', '01093429669', 'الغربية', NULL, '$2y$10$TsI9asI41M15bC7ccMJrz.epVrkTEvcnYULHxbxhNdLQQN8URuD0a', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 06:43:51', '2023-10-13 06:43:51', NULL),
(208, 'Omar elmedany', 'omarelmedany37@gmail.com', NULL, '01559633639', '01024720260', 'الغربية', NULL, '$2y$10$GGw79BgUbojc2diMqLSFXen5oI0ozBtQPmUL5ZpSPRShMiwV8i3Bi', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 09:06:47', '2023-10-13 09:06:47', NULL),
(209, 'تقي محمد جمال', 'y.tokamohamed@yahoo.com', NULL, '01552210587', '01098157126', 'الغربية', NULL, '$2y$10$rR3II.vYadrSASONX.2pauSq/1d/lutg7mdsCt9B3F1Ya./jxGxeq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 11:41:10', '2023-10-13 11:41:10', NULL),
(210, 'اذان محمد وسام', 'azanwessam@gmail.com', NULL, '01024489342', '01005381668', 'الغربية', NULL, '$2y$10$S/SAl.pRl17tZPEJzhNGJe2oUnxsujSfMp8PQ64OwqznvBSvCJsZ6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 11:51:25', '2023-10-13 11:51:25', NULL),
(211, 'فرح محمد وفا', 'fw8958067@gmail.com', NULL, '01032023253', '01022206365', 'الغربية', NULL, '$2y$10$lEGXRD7oso2a3jJnfXWfm.GcdqNruMMYRFOYRjAc3dw7XHR.jULWm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 13:36:25', '2023-10-13 13:36:25', NULL),
(212, 'لجين نبيل السيد الصفطي', 'lugien.elsafty1@gmail.com', NULL, '01553740170', '01098758514', 'الغربية', NULL, '$2y$10$mBDlpy176/yhwnKWAS9QsO1j0Y4ZDl.Tn9fgjDV19vztYQ33LNWPy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 13:51:50', '2023-10-13 13:51:50', NULL),
(213, 'Rahma', 'ra6256614@gmail.com', NULL, '01279338839', '01200962910', 'الغربية', NULL, '$2y$10$/7JuiTPrTgGyjVFjzTpr3O6ZjIVky70ZgbuGH/XN4LGVzZZUEZZDq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 19:01:45', '2023-10-13 19:01:45', NULL),
(214, 'Mohamed', 'md447999@gmail.com', NULL, '01091796031', '01060839521', 'الغربية', NULL, '$2y$10$RYMqrz8m.irhC7Qxrqk/VuCopmxKBsPgvT1daYAtmZ7hMwIwvMLqS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 19:07:15', '2023-10-13 19:07:15', NULL),
(215, 'بسمه سمير محمد انور', 'se.me.basmasamir2007@gmail.com', NULL, '01222632702', '01096055151', 'الغربية', NULL, '$2y$10$/D5e1twneyFQvFuCBOi4SOO1IWxUFpMAAGYsMAdGvFUvlgSQSp3w6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 19:59:15', '2023-10-13 19:59:15', NULL),
(216, 'Mariam', 'rneemS705@gmail.com', NULL, '01103193139', '01156251760', 'الغربية', NULL, '$2y$10$jhuXl.prIZuz1tsKysUpVeMZ00hjmdBJ..fIq3KAUOeQO6E45666C', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 20:16:53', '2023-10-13 20:16:53', NULL),
(217, 'Mostafa Mahmoud', 'mm2394447@gmail.com', NULL, '01068785159', '01007288550', 'الغربية', NULL, '$2y$10$Oyb28M9ei1/lGwtvu6pzwu4x4bFWyHejVo1nH/n2JEnDnRN6VHQwi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 20:50:22', '2023-10-13 20:50:22', NULL),
(218, 'عمر على أحمد الخطيب', 'omar54.sb@gmail.com', NULL, '01116944340', '01112067011', 'الغربية', NULL, '$2y$10$N.tr2EATzntQrforSMVw5O9E5qm2nfGYASWlyGZS2FSfTRKmEWgFa', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 21:17:56', '2023-10-13 21:17:56', NULL),
(219, 'علاء البسيوني', 'albsywnyla69@gmail.com', NULL, '01068465269', '01223269071', 'الغربية', NULL, '$2y$10$yU2REVOKQNi9T/1.YVfaVOt.SXIoO026UjBwxKdDIH5gtFB/uybue', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 21:22:22', '2023-10-13 21:22:22', NULL),
(220, 'ندى ابو عفصه', 'nadaabofsa@gmail.com', NULL, '01094500142', '01111999854', 'الغربية', NULL, '$2y$10$LogfcpJDwB3tomhjedFeW.mWJzQHOttBt4UMgl68NNfMYbaOFvoka', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 22:11:17', '2023-10-13 22:11:17', NULL),
(221, 'Mariam mosad', 'mariammosad777777@gmail.com', NULL, '01124657730', '01124377019', 'الغربية', NULL, '$2y$10$s/dhiZYUoo.4w.ySqmWsPun/RJ7tncHCwcN2TRYbwrFxqpAUyY4Yi', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 22:32:59', '2023-10-13 22:32:59', NULL),
(222, 'منه الله شريف العزب', 'elazabmenna76@gmail.com', NULL, '01062887051', '01098929181', 'الغربية', NULL, '$2y$10$5sqoBA/UeCNhtMOKnfCbBOu2gzikkJzcdX5Vm.x1RE1XR75AP8a.G', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 23:30:52', '2023-10-13 23:30:52', NULL),
(223, 'حنين عمرو', 'ha7605873@gmail.com', NULL, '01098802594', '01094300502', 'الغربية', NULL, '$2y$10$sqP48d2Hu5eoFpLTOed6i.bvv2N9.brCBk5v93qBoLyTAgaK0x1ra', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 23:39:19', '2023-10-13 23:39:19', NULL),
(224, 'ساجده محمد حسن', 'sagdam69@gmail.com', NULL, '01284065785', '01110073758', 'الغربية', NULL, '$2y$10$zTMTdBbSD7sCQRP1sHejauURBJqUc9vclh8yHfEzdiTU/N6hctkVS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 23:45:06', '2023-10-13 23:45:06', NULL),
(225, 'Mohamed', 'my776606@gmail.com', NULL, '01225358388', '01272660758', 'الغربية', NULL, '$2y$10$qDQKz.8V9TD7El8YRzEKpuFfUF7c48T3u4E3.nDoIs.kbvVwJhqTm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 23:57:47', '2023-10-13 23:57:47', NULL),
(226, 'مريم السيد يونس', 'mariomaraed@gmail.com', NULL, '01067423004', '01066206621', 'الغربية', NULL, '$2y$10$/HBZcdf7h9.JZL1bVqw9xOFY7yXMTm1Vpp68LbWxqGowA47p8AOqG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 00:26:04', '2023-10-14 00:26:04', NULL),
(227, 'محمد', 'mohamed.noch70@gmail.com', NULL, '01146500140', '01100910200', 'الغربية', NULL, '$2y$10$/D/1KzhQdMRYJY6edL/k9elh1tLmQVJi/gwPCAkQsFy3f6d1QTDvC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 02:20:18', '2023-10-14 02:20:18', NULL),
(228, 'بسمله السعيد السيد شعير', 'gmail@Bs01025116163.com', NULL, '01158303486', '01025116163', 'الغربية', NULL, '$2y$10$dCOytmWg7OF45cTTfog98OzLte.tGDz3jmN2Bd7WCInMBYxySDzY2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 03:05:23', '2023-10-14 03:05:23', NULL),
(229, 'Hagar Aboafsa', 'hagaraboafsa@gmail.com', NULL, '01095090479', '01068988830', 'الغربية', NULL, '$2y$10$7XhnxJgDdWFx9oxaYyYjk.kLr1fTZqruoIaBRYAqH5AtlTguzK8L2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 03:39:55', '2023-10-14 03:39:55', NULL),
(230, 'Ramsa Yasser sharaf', 'ramsasharaf4@gmail.come', NULL, '01122212467', '01123925678', 'الغربية', NULL, '$2y$10$dk1t7cnsa99NqXNvjPBreOOolbaNCS/P9roWP/FeKWGiac0UIDOXe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 04:01:36', '2023-10-14 04:01:36', NULL),
(231, 'A. M. A. N. Y🩷🩷Hamed', 'amanyhamedebrahim@gmail.com', NULL, '01032640348', '01063805715', 'الغربية', NULL, '$2y$10$2t/VzOn5ma5px.4Nou1in.ySkNOFsJc5tQjTvfxwojZiuVAIT7n/W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 04:43:46', '2023-10-14 04:43:46', NULL),
(232, 'Jana atya', 'janaatya618@gmail.com', NULL, '01555161363', '01020619103', 'الغربية', NULL, '$2y$10$Yer7M6NcUD7YQPoSIptMiOJoHZg6qyKH8VMaAtSTPYSTuumKN3rUm', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 05:38:31', '2023-10-14 05:38:31', NULL),
(233, 'Fares', 'faresbahnsy@gmail.com', NULL, '01275309935', '01208000246', 'الغربية', NULL, '$2y$10$.cjWbBtRA3xkfL2OkE/44.24iUKEc5HlYpsisc8RNMCKMGTYjlSTa', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 08:39:39', '2023-10-14 08:39:39', NULL),
(234, 'ملك قنديل', 'malakkandil604@gmail.com', NULL, '01286695345', '01224895500', 'الغربية', NULL, '$2y$10$a7G3LoIHWoDHNFA0UdzKreY5Ja7FqE4YHUa9zh0D1e.rWKmZNLVhK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 09:57:36', '2023-10-14 09:57:36', NULL),
(235, 'Hager mostafa shawky', 'hagermoastafashawky@gmail.com', NULL, '01283283754', '01227575547', 'الغربية', NULL, '$2y$10$7amTG.lpEyvWtT23V01M.uq9tDu/xL3wVm9m0MaUOzi4Bu5rcO7by', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 13:43:49', '2023-10-14 13:43:49', NULL),
(236, 'محمد', 'mohamed.amgad.zalat@gmail.com', NULL, '01025360776', '01554940776', 'الغربية', NULL, '$2y$10$H6L.ly/KaVMTTtyOOeFCj.H.q8pL5XNJ43Djwr0aFkX6TrDs1HwjK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 16:03:36', '2023-10-14 16:03:36', NULL),
(237, '01098774408', 'f01098774408@gmail.com', NULL, '01098774408', '01000157616', 'الغربية', NULL, '$2y$10$SfNuPvONdTRGBmG8OlIYCOZxrHTsDpI3VkWnGmMYFRCIr4Lx3i8YG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 17:39:55', '2023-10-14 17:39:55', NULL),
(238, 'Moamen El-Fakharany', 'notmoamen981@gmail.com', NULL, '01212279275', '01271876056', 'الغربية', NULL, '$2y$10$X6zDqREKP9Db9qRWTzYLSOaq10sKPWOUTydnRvxlp3sfETEa57yii', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 18:15:08', '2023-10-14 18:15:08', NULL),
(239, 'قصي مسعود', 'qusaimasoud12@gmail.com', NULL, '01124990495', '01273114863', 'الغربية', NULL, '$2y$10$u3TiaUCCkj7G8i3FJGIvkugByEpm39C1ljQaHsa1B5eLQRhi3KHIG', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 21:50:03', '2023-10-14 21:50:03', NULL),
(240, 'محمد ممدوح خلاف', 'mkmk1682006@gmail.com', NULL, '01285365616', '01281388178', 'الغربية', NULL, '$2y$10$bO4Xd.uUh9igl/cNPjdf8uuAe2klph1cM8YN6wUKz2ilaZoki1yMC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 22:46:50', '2023-10-14 22:46:50', NULL),
(241, 'Sama Usama', 'Nohakotb55@yahoo.com', NULL, '01064022755', '01029663522', 'الغربية', NULL, '$2y$10$G5gxii8me7lrokIAP.WcTeWxsFJ08w2CbL.HNGI6OAzarrX89tGoa', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 00:02:46', '2023-10-15 00:02:46', NULL),
(242, 'ياسمين محمود السيد', 'yasomahmoud04@gamil.com', NULL, '01011023955', '01064449469', 'الغربية', NULL, '$2y$10$siZZCNBHqyhxMwRabCJu4.gJZEw3RQJDCQ.BSoEQ.pVll93YOLJQS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 01:26:31', '2023-10-15 01:26:31', NULL),
(243, 'احمد محمد على', 'fady26868@gmail.com', NULL, '01279961128', '01279980074', 'الغربية', NULL, '$2y$10$ccStDb8uWmrT//FNfo8Lf.CikAm4gLuMYcOMbfFQdJyLB4IfB2D.e', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 01:31:09', '2023-10-15 01:31:09', NULL),
(244, 'جنى ساعي الدين', 'medosayeldeen953@gmail.com', NULL, '01143393750', '01207170300', 'الغربية', NULL, '$2y$10$YpbjPtEmm/yfEa00CXSLfeGhKhIkNgFmTeKDvuQUmLI7eRlLYmRYa', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 01:34:05', '2023-10-15 01:34:05', NULL),
(245, 'Habiba Ahmed', 'beba74709@gmail.com', NULL, '01555896261', '01555896261', 'الغربية', NULL, '$2y$10$k3Ydak2RyzCT9L7Dv38AIuKYimPY9kT9T6JQQENpAe37bpFMnX44i', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 02:10:59', '2023-10-15 02:10:59', NULL),
(246, 'Eslam hamed', 'eh1812008@gmail.com', NULL, '01200807887', '01205234935', 'الغربية', NULL, '$2y$10$4o1ZkvQHAXFONZFAYFB3EOpdo9RlVEO.qxgQG7aRCecWJ/XsMkNvy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 02:23:41', '2023-10-15 02:23:41', NULL),
(247, 'تسنيم ناصر محمد الشهداوى', 'manarabokora8@gmail.com', NULL, '01119128579', '01119128579', 'الغربية', NULL, '$2y$10$IQzYzTTz5t/zdYHwEf.OQux/K4dRX5A1K2MLxrd29SI20DCRvvJA2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 02:30:01', '2023-10-15 02:30:01', NULL),
(248, 'جنا عزيز حماده', 'jnazyz911@gmail.com', NULL, '01064266926', '01008038177', 'الغربية', NULL, '$2y$10$1LPzbvjAed9LEry0TzjB0u77u6LDtRvZErvxT1skYxZv2ui7zVDqy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 04:38:33', '2023-10-15 04:38:33', NULL),
(249, 'احمد كمال احمد', 'midookimoo.2007@gmail.com', NULL, '01152953518', '01005296394', 'الغربية', NULL, '$2y$10$kP.Lbn3WRFKIVuCAWBydhOQvEU1ZIUruFVplnxhTlDcHXv6lINWWe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 04:51:56', '2023-10-15 04:51:56', NULL),
(250, 'نورين وليد عمر', 'noreenaboeldahb2020@icloud.com', NULL, '01208178347', '01002302006', 'الغربية', NULL, '$2y$10$nSd5pBhLOCZhLkh4FK7yhO1GpfXTmB.nvoVjsVN4lF/cYC1metBDi', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 07:34:11', '2023-10-15 07:34:11', NULL),
(251, 'چنى إبراهيم محمود', 'jana.ibrahem286@gmail.com', NULL, '01270797124', '01280916664', 'الغربية', NULL, '$2y$10$DG5y9rbM9dhDqkFzAFlceudCi5ks9p1FgemM0/kjb5WQeybWBLyC.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 13:04:08', '2023-10-15 13:04:08', NULL),
(252, 'Jooo', 'yeljoo027@gamil.com', NULL, '01557597748', '01201150652', 'الغربية', NULL, '$2y$10$4ZB0JRgBn0AMnmtRLGqTz.G/T.JTIDKOCctmUjK8oc4Cnpxoet9rm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 18:33:32', '2023-10-15 18:33:32', NULL),
(253, 'يوسف', 'youse.amr2012@gmail.com', NULL, '01200615084', '01559044032', 'الغربية', NULL, '$2y$10$i.YQKk3E.pVK06Xe6Q3CPucbljCTO/UpXLIkQAMFrBVpm/oAiMiZa', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 18:56:59', '2023-10-15 18:56:59', NULL),
(254, 'جنه الحداد', 'ganas2905@gmail.com', NULL, '01124891392', '01141577206', 'الغربية', NULL, '$2y$10$7BJytShzrW0L8FuoEQQJOu8azWKJC.XZ7PAqocm//4.jJRSqzeY0S', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 22:42:15', '2023-10-15 22:42:15', NULL),
(255, 'Salma shaban', 'shbansdyq09@gmail.com', NULL, '01555362002', '01090089604', 'الغربية', NULL, '$2y$10$Pb2.msUsuemNc4XeAjdaWuyLec4.a2MYOPcEiBJI8cEP8AW0pqdJa', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 23:57:37', '2023-10-15 23:57:37', NULL),
(256, 'Romysaa Emad', 'romysaaemad523@gmail.com', NULL, '01156111192', '01113338930', 'الغربية', NULL, '$2y$10$JubpdG/YWpcGLGgGvVleHemHPWvkm5F8EjKHsZDscorUrrLYJcr0i', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 00:14:39', '2023-10-16 00:14:39', NULL),
(257, 'هنا شريف العشري', 'sheriefhana012@gmail', NULL, '01025265100', '01000598068', 'الغربية', NULL, '$2y$10$fS5rX88g7K0HarMtbtBL7uEZCVvNpWb5TwNt.s46i0uFMXy0U5Y66', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 01:04:08', '2023-10-16 01:04:08', NULL),
(258, 'Mohamed Abdelhafez', 'mohamedabdelhafez0112@gmail.com', NULL, '01145852044', '01275824065', 'الغربية', NULL, '$2y$10$.VVARXVEAy2gst5WxviFqOpBc0OifsKwHr594G1fpR7JbyBrzJTkC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 01:30:07', '2023-10-16 01:30:07', NULL),
(259, 'شذى حسن حلمى', 'shazahassanhelmy@gmail.com', NULL, '01211484104', '01063612236', 'الغربية', NULL, '$2y$10$hA/ZmW5Exe9STdfFCm9XM.elobOQAi6FOHAH9TBC225u0uZTD6Wmu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 01:47:16', '2023-10-16 01:47:16', NULL),
(260, 'فيرينا جرجس يوسف', 'grigesverena@gmail.com', NULL, '01227401269', '01223789752', 'الغربية', NULL, '$2y$10$lDTn2VhOtS6yhvZgNcsv4.OHcAkG7hsUvSMoDopGJ1vyn0QZd9jEe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 02:14:04', '2023-10-16 02:14:04', NULL),
(261, 'نور محمد عبد السلام', 'nourmahamed571@gmail.com', NULL, '01225299536', '01289310675', 'الغربية', NULL, '$2y$10$qdTTARQ2ESaLSVAQLB8N4O0TFiAi.VqYkwJX0uh4pEBSibMwQNoYi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 02:17:46', '2023-10-16 02:17:46', NULL),
(262, 'Malak Fahmy', 'malakfahmy924@gmail.com', NULL, '01288054009', '01288054009', 'الغربية', NULL, '$2y$10$t0LCjRNSiRpwGB9IpiD/IeiNlEUwlmOLBiNglFzwDN7zqneXwHu6W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 02:23:10', '2023-10-16 02:23:10', NULL),
(263, 'Abdelrhman', 'manorizk2345@gmail.com', NULL, '01092549422', '01064338526', 'الغربية', NULL, '$2y$10$HYUawe2vjO8utzZfJUigi.oL4k4/L6h4rOCJZ8GPZDnHkOMFLhGfC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 03:53:24', '2023-10-16 03:53:24', NULL),
(264, 'احمد حامد عبد الحافظ', 'ahmedhamed2007@gmail.com', NULL, '01012681842', '01068404062', 'الغربية', NULL, '$2y$10$uex9tY6Bs4Fxk.1xOD4mse1ms0UhC1oRlH8cQaD8haABFn0FuPNv6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 05:34:25', '2023-10-16 05:34:25', NULL),
(265, 'ملك العسال', 'malakalassal142@gmail.com', NULL, '01227101531', '01201882080', 'الغربية', NULL, '$2y$10$en.zFQ57nfaD7q6ELcrRN.ctOT/1Qw9xf80ZgS1oBcDxRfpTzJGVG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 05:36:29', '2023-10-16 05:36:29', NULL),
(266, 'Mohamed', 'modyalazap@gmail.com', NULL, '01229600139', '01203866051', 'الغربية', NULL, '$2y$10$ofLhGXzEq2mtAyTjxyJiQ.pjMU3EZDfz.aCO6nU/0tuU3HNrNCvZK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 06:33:26', '2023-10-16 06:33:26', NULL),
(267, 'Habiba Saber', 'ascondal008@gmail.com', NULL, '01278282008', '01276621199', 'الغربية', NULL, '$2y$10$D6mQS224EoRGxtnPzgI/R.wSg5MXkz2m3g4q2zOZ6Phnf9B9XfATm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 08:37:06', '2023-10-16 08:37:06', NULL),
(268, 'Omar', 'omarhes12346@gmail.com', NULL, '01017652153', '01287490747', 'الغربية', NULL, '$2y$10$xjY.5oBkfAfS5Jl3V.i6aOv4g3GzDxGSEvQkoPdX2o0GHZEMOlCFW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 10:51:51', '2023-10-16 10:51:51', NULL),
(269, 'محمد احمد الخطيب', 'mohamedelkhateb740@gmail.com', NULL, '01129258622', '01068156078', 'الغربية', NULL, '$2y$10$HXPg5nkoPBxb7nusuZ5V2.UoBjLU4OyaC.v44HOEOoScpf48WXnWC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 13:00:12', '2023-10-16 13:00:12', NULL),
(270, 'Mahmoud Karam', 'mo703860@gmail.com', NULL, '01557228583', '01008637019', 'الغربية', NULL, '$2y$10$/hmC2dz3ORIMfjU7AVcZYeOOzDtAy3AOrEDLIsx7TZww4S61MAjQS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 14:29:16', '2023-10-16 14:29:16', NULL),
(271, 'عاليا جوده', 'Aliamohamedgouda@gmail.com', NULL, '01211726693', '01211726691', 'الغربية', NULL, '$2y$10$DGyZ9EmSy2uo/mXGz48IiemVD9/Ka4zXnYX6d2j.Zh8oolXp3/L9.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 15:37:01', '2023-10-16 15:37:01', NULL),
(272, 'ميرنا الشامي', 'myrnaalshamy102@gmail.com', NULL, '01289795687', '01222509143', 'الغربية', NULL, '$2y$10$PdZs9MK2hnT/W4Ef.ECmhepnwtX42qE34EcIPBAsw2fD9njAp0lyq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 16:47:29', '2023-10-16 16:47:29', NULL),
(273, 'يوسف المطاهر', 'yousefalmetaher2@gmail.com', NULL, '01065468685', '01550594255', 'الغربية', NULL, '$2y$10$r.92kDeLtjBvs.PqXYQHnO0QnqDqmxT3X8Us4lRCkN3DWTECAOiEy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 16:59:50', '2023-10-16 16:59:50', NULL),
(274, 'احمد زكريا حسن البنداري', 'ahmedalbendaryzakaria2007@gmail.com', NULL, '01271733177', '01271733177', 'الغربية', NULL, '$2y$10$kRnmJHPqUMG6hpQLpVD8l.foBRveav1AQP9NUFbdw0rzjgLwWQdKO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 19:25:00', '2023-10-16 19:25:00', NULL),
(275, 'عبدالرحمن عمر البري', 'omarlalal589@gmail.com', NULL, '01200739520', '01271057191', 'الغربية', NULL, '$2y$10$1NMP7.0t4Eear563syLxZOZb7DRtAuTx3YVDMhro.V.mu6PQjY.w2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 19:25:42', '2023-10-16 19:25:42', NULL),
(276, 'لجين ملهم حبلص', 'lojainmlham@gmail.com', NULL, '01090825525', '01007870688', 'الغربية', NULL, '$2y$10$ClJYuLF9BVjFWqYoaCQz6ev/059F86aeP1c/ILH4qU.2QYL1h2/rG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 20:21:21', '2023-10-16 20:21:21', NULL),
(277, 'منة الله مدحت', 'menhmedhat17907@gmail.com', NULL, '01278890336', '01211604225', 'الغربية', NULL, '$2y$10$3HKgSORQHj0biQlpurJnEuRZerD6wOIkxTJyUx7OFO5/sRVeO9QWm', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 21:08:21', '2023-10-16 21:08:21', NULL),
(278, 'زياد محمد كمال الخطيب', 'z4224885@gmail.com', NULL, '01206624201', '01227072351', 'الغربية', NULL, '$2y$10$cq28wekRUL/rKr46P4L1Q.uDlzAMQqIXy6m0tHf1JI8IVS9/DXy26', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 21:09:47', '2023-10-16 21:09:47', NULL),
(279, 'Mohamed El menshawy', 'Mohamedmm30001@gmail.com', NULL, '01015053288', '01009264241', 'الغربية', NULL, '$2y$10$t9w0c8HfUWT2CthcxLRuz.oQN24/K8TL9yI2bonCOBqhhZWMFSlNm', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 22:45:06', '2023-10-16 22:45:06', NULL),
(280, 'Shahd farghly', 'shahdfarghly583@gmail.com', NULL, '01228697257', '01024578799', 'الغربية', NULL, '$2y$10$RkigloeETIemrVSenguU5eD0Q9aM9TzVQj2yd7BKCB8LiisoK3vFe', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 23:06:11', '2023-10-16 23:06:11', NULL),
(281, 'نورهان هيثم علي السيد حماد', 'nourhanhaitham568@gmail.com', NULL, '01111334860', '01111334860', 'الغربية', NULL, '$2y$10$Lsr.h/mZmxyVfc6azW2Ja.Mz3i.JxWzZkJ5Y/wCOwPb8HOj1P9ch.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-17 02:37:29', '2023-10-17 02:37:29', NULL),
(282, 'Maryam Sharaf', 'maryamsharaf453@gmail.com', NULL, '01220338991', '01006000839', 'الغربية', NULL, '$2y$10$vjfhBqOqn0SoiXRiQDZ/ae57m.eVnGd9aJZV9tyYQc61hwARsRB0S', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-17 02:45:47', '2023-10-17 02:45:47', NULL),
(283, 'يحيى حاتم محمد كمال', 'yahyaandeyad@gmail.com', NULL, '01208177370', '01287156635', 'الغربية', NULL, '$2y$10$fewBIjh4j2x6.F4h2ooj0uca2lHzu1cJBEgBGoYT5rRpAHC1Am/h6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-17 04:01:02', '2023-10-17 04:01:02', NULL),
(284, 'Malak Elgallad', 'malakelgallad80@gmail.com', NULL, '01224311168', '01200001224', 'الغربية', NULL, '$2y$10$Ee5PKIo6c3zMaQsgxyycAOckM.EL8yoXwghSuynB5kaHQIPB999Ke', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-17 04:17:27', '2023-10-17 04:17:27', NULL),
(285, 'اشرقت اسلام', 'ashrakata410@gmail.com', NULL, '01210558082', '01202755966', 'الغربية', NULL, '$2y$10$YgEGfSJLnGKYaQV1czLerunZSlyHeufAzbTokiV92Xs1otJ7xwu6G', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-17 05:39:59', '2023-10-17 05:39:59', NULL),
(286, 'sama ❤️', 'srda6837@gmail.com', NULL, '01017018504', '01019029901', 'الغربية', NULL, '$2y$10$3NWTuUg.Qeffq2jEsnOEFeqCeT5fiXquMFS2I1NVigWlNQzylJgwW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-17 07:55:13', '2023-10-17 07:55:13', NULL),
(287, 'مريم وليد بركات', 'mw7596139@gmail.com', NULL, '01557291041', '01277670490', 'الغربية', NULL, '$2y$10$n/v3tZQNGLobRDDDDOB7POh1he6fyRye/lOK/Uf6U3MTQgm1rCpR6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-17 14:38:12', '2023-10-17 14:38:12', NULL),
(288, 'MohamedHasona', 'hasonamohamed033@gmail.com', NULL, '01020063459', '01273095210', 'القاهرة', NULL, '$2y$10$OlhU4ogiZ7sZu4sa8dE1Euz4PK6hpxFTH9r6lTZIVyK7iZ8XLI27.', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-10-17 17:46:56', '2023-10-17 17:46:56', NULL),
(289, 'Hala Assy', 'lolokitty.2005@gmail.com', NULL, '01205840071', '01061701155', 'الغربية', NULL, '$2y$10$x3zHdjX03lrF/3jxfvPvL.KGoiomqMhlCo2EbMhzcbLBjlzHuOn..', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-18 01:02:05', '2023-10-18 01:02:05', NULL),
(290, 'فريدة يوسف ابو رية', 'faridayosef81@gmail.com', NULL, '01207806585', '01201403345', 'الغربية', NULL, '$2y$10$ukdShggVBqR4ZnPs8QoK/eOY77gwhEP3psvZ.ISmh2d14NZsZYCFy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-18 03:44:58', '2023-10-18 03:44:58', NULL),
(291, 'آلاء عماد يوسف', 'ae856765@gmail.com', NULL, '01551712120', '01020067786', 'الغربية', NULL, '$2y$10$vC/8BMCTxXcyBCYjp1gUBOnJdHk7xe/0I9JlivNbc8lXGIKnTVvPW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-19 03:32:59', '2023-10-19 03:32:59', NULL),
(292, 'عبدالرحمن خالد مرغلي', 'Abdelrahman5marghaly@gmail.com', NULL, '01283497293', '01288729361', 'الغربية', NULL, '$2y$10$Cc5fbyAL5O8gU35JQ8CkleYcUNhKUMdCiRrshQ462o4enWgcTGi/2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-19 18:15:39', '2023-10-19 18:15:39', NULL),
(293, 'Malak Mahmoud El sayed', 'malakmahmoud1012007@gamil.com', NULL, '01552258192', '01280855020', 'الغربية', NULL, '$2y$10$1UTRgD5jjP9TrDSdJ8tMjeMNy8X/HWuU0Yi7Yn1L1HrSu55fm.Fde', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-19 20:04:54', '2023-10-19 20:04:54', NULL),
(294, 'محمد محمود جعيصه', 'mohamedgeaissa@yahoo.com', NULL, '01146152228', '01280834686', 'الغربية', NULL, '$2y$10$TPoQJSKRHXXgjbnSQ3nZIOucXx91ET7aRTMVyhhZc4y2GUEVoZpf6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-20 01:47:31', '2023-10-20 01:47:31', NULL),
(295, 'Malak Sherif', 'gamil.com@Sherifmalak319', NULL, '01271210480', '01204190450', 'الغربية', NULL, '$2y$10$0OIw8xU43v88M7nmKdSU7OuQnciHNpGq.XSwJbwhXnMnA.Vo.tU4S', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-20 18:07:16', '2023-10-20 18:07:16', NULL),
(296, 'بسمله السعيد السيد شعير', 'Bsmala01025116163@gmail.com', NULL, '01025116163', '01158303468', 'الغربية', NULL, '$2y$10$qdtV3va3mhRfs8Xl4VFaDulb1BDDn9kHcLETjy2Ec0lVqyFsHZEzq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-22 06:27:31', '2023-10-22 06:27:31', NULL),
(297, 'زينة', 'zeinamohamed753@gmail.com', NULL, '01282422873', '01224712419', 'الغربية', NULL, '$2y$10$umuJXLLcXky/S5zr8yjoVesP0Ua14K9o0vmBL.N3So1cVmngHGlUm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-22 21:40:31', '2023-10-22 21:40:31', NULL),
(298, 'هنا احمد العمروسي', 'hanaelamrosy69@gamil.com', NULL, '01275616506', '01554636111', 'الغربية', NULL, '$2y$10$m609714QGZi2DkngXSR6.O7cRJhuzgPWtWPBZWPL6G91gFBVuBPku', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-23 02:54:35', '2023-10-23 02:54:35', NULL),
(299, 'Maryam Sharaf', 'aliaa.hodeib@gmail.com', NULL, '01006000839', '01288948888', 'الغربية', NULL, '$2y$10$H31HCGA2JpAQf6SXldZXhe65MmzzmoXsSE28yKSt2kn3hPJYWqSru', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-24 03:42:43', '2023-10-24 03:42:43', NULL),
(300, 'مريم الدمسيسي', 'mariemeldamsesy@gmail.com', NULL, '01013483313', '01277973325', 'الغربية', NULL, '$2y$10$u5vbImMxzPZGJ8rRRz26A.3ZGJi4BsdgR0YCnYwU02BhDfaeiEpTy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-24 20:38:10', '2023-10-24 20:38:10', NULL),
(301, 'Shaban Salah', 'shabansalah712@gmail.com', NULL, '01150584658', '01111163450', 'الغربية', NULL, '$2y$10$q3k993QHwqEWyYkw9fvoSe3AJy314ypI.FrHbBVrwUyAWD1IVSvUm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-25 00:21:47', '2023-10-25 00:21:47', NULL),
(302, 'اياد محمد احمد الديبه', 'eyaddeba0@gmail.com', NULL, '01274292267', '01203849106', 'الغربية', NULL, '$2y$10$32YoqCPDFoUQy/V4gi87aeUAE15ROoVtB5kIqYqBQI/hznsVgvFmq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-25 03:15:50', '2023-10-25 03:15:50', NULL),
(303, 'عبدالرحمن ميدان', '01092851abdo@gmail.com', NULL, '01280319837', '01004157196', 'الغربية', NULL, '$2y$10$cQjcmxU0rnfsJ02mMMuhBO7A7Ij6p/oPIC/VbxiYGIlewyE7SNREW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-25 03:21:58', '2023-10-25 03:21:58', NULL),
(304, 'ناريمان محمد العفيفي', 'mohamednariman@gmail.com', NULL, '01551555122', '01558402525', 'الغربية', NULL, '$2y$10$/ok4Et4hs0jm2fN3Kefaz.iA6kcvdgwge4GjDi7cQf4Psal6Sgwme', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-25 06:27:19', '2023-10-25 06:27:19', NULL),
(305, 'نورين وليد عمر', 'noorevie7@gmail.com', NULL, '01280681175', '01002302006', 'الغربية', NULL, '$2y$10$AJg.IyehWYz1pcEBdvXw5.dIVpSL4VGCDs1.VjSRRl7iwaLBLsMvG', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-26 13:13:17', '2023-10-26 13:13:17', NULL),
(306, 'Nagwa', 'nnnnali123@gmail.com', NULL, '01017349655', '01013765674', 'الأسكندرية', NULL, '$2y$10$yTtMNcOSRV2EdCtf64OTpOcvX8W8DxXV7zoDtkfSfgqXeri.HLrvW', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-10-29 04:08:45', '2023-10-29 04:08:45', NULL),
(307, 'فاتن اشرف', 'fatenashraf286@gmail.com', NULL, '01273834069', '01278419516', 'الغربية', NULL, '$2y$10$rwGXtGo0gWcmtX3YksAklOSLId0acUV76kfy1Myd.NxuKLTpP7Uhe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-30 04:35:47', '2023-10-30 04:35:47', NULL),
(308, 'يوسف جمال يوسف زيدان', 'jousanda4@gmail.com', NULL, '01008861616', '01020075888', 'الغربية', NULL, '$2y$10$FzJlN.fGkacRpTezD7/f8.cRdbKKdB7cq.Q7566l8aJK28z.CZPx6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-11-01 03:14:15', '2023-11-01 03:14:15', NULL),
(309, 'ملك مصطفي', 'razanomar788@gmail.com', NULL, '01006415219', '01288245807', 'الغربية', NULL, '$2y$10$o.ODP5R7VprL0yoEBsyc9ObJ4jK.Di0TESn2y7GPANBvb4y43Jf5G', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-11-07 03:26:04', '2023-11-07 03:26:04', NULL),
(310, 'يوسف احمد طه', 'yousefahmedtaha594@gmail.com', NULL, '01094895914', '01559788424', 'الغربية', NULL, '$2y$10$.qZ0xGmoGQXldJJPL6ObROxgsEPQuxkwyZoNqiQZSdqklk/lEeGwy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-11-09 06:38:20', '2023-11-09 06:38:20', NULL),
(311, 'yousefsaad', 'ysd68045@gmail.com', NULL, '01060758203', '01060758203', 'الغربية', NULL, '$2y$10$WMT2QCmCe.m1M96B0szTp.cRQbUj5K7BBuQ03hNUsrMKtczc5kPfi', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-11-10 19:23:14', '2023-11-10 19:23:14', NULL),
(312, 'منة ابراهيم نجم', 'mennaebrahim2272006@gmail.com', NULL, '01001504183', '01002598928', 'الغربية', NULL, '$2y$10$2qzPDGtyZezZSHrKKotRQegVMeVqo6YKlTJNe9CM8DT9CxPtefBly', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-11-12 03:45:43', '2023-11-12 03:45:43', NULL),
(313, 'عبدالله مصطفي', 'abduallahmostafa1122@gmail.com', NULL, '01559311770', '01559311770', 'الغربية', NULL, '$2y$10$Q9WSJ1qnl9aG/QwtPIgNwe/6MxLBKmB5gnSd6COgmfvcwT7PhH86m', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-11-14 19:24:24', '2023-11-14 19:24:24', NULL),
(314, 'Ahela', 'ahelahussein@icloud.com', NULL, '01226996870', '01284804648', 'الغربية', NULL, '$2y$10$OM9hNoSoP.s2aOEccESu3uG/p5wD.2jH7nwzKeaKzfMDgNLvKxdHG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-11-15 08:55:57', '2023-11-15 08:55:57', NULL),
(315, 'عمر محمد', 'omarmohammmed05@gmail.com', NULL, '01200809971', '01091004612', 'الغربية', NULL, '$2y$10$E2HhH2FR2QSLHNhMBNnEQeLrD4iYUrJ4OMGRETxmD73WTseq4IKR6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-11-23 05:03:39', '2023-11-23 05:03:39', NULL),
(316, 'Super Mario', 'kidalal881@cumzle.com', NULL, '01152649130', '01066431589', 'المنوفية', NULL, '$2y$10$Wi0QYiW.XX8ZiwlWnymZ/e7hpMAYVRMYX.h.TA8f0uj/.qN9VM6ZC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-11-29 06:42:18', '2023-11-29 06:42:18', NULL),
(317, 'Norhan Mohamed', 'kn314559@gmail.com', NULL, '01284858335', '01155103441', 'الغربية', NULL, '$2y$10$tZkLsGDcoQKydPzLIb/E9.kHpg/mh2KgVI2zMBeD02V5LZjJ52DnO', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-11-30 01:31:14', '2023-11-30 01:31:14', NULL),
(318, 'عائشه هاني', 'aeshaabotalib61@gmail.com', NULL, '01095347908', '01146169162', 'الغربية', NULL, '$2y$10$3rUIq7iFcC7pcONq5wMFveuy5IAWcgGQL57XSmBCfg2GsJ63AiW/y', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-11-30 02:42:11', '2023-11-30 02:42:11', NULL),
(319, 'احمد شاكر', 'bolt50cr7@gmail.com', NULL, '01507214467', '01204478691', 'الغربية', NULL, '$2y$10$LXAMvoJ0K/WmXXJkZ7Gx3.DeLotT//Wos0C2l8fM9V056QLyAD6Zm', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-01 08:50:57', '2023-12-01 08:50:57', NULL),
(320, 'علي حنتيرة', 'ail.ail20203la@gmail.com', NULL, '01120847571', '01283366058', 'الغربية', NULL, '$2y$10$m9aiSb2hgYo2Gh2vISK34uulxwBY/zONxofYl8Rm8rZWTL/ezHmoW', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-14 19:18:36', '2023-12-14 19:18:36', NULL),
(321, 'احمد شعبان شاكر', 'zrsalarb@hi2.in', NULL, '01204478691', '01552782017', 'الغربية', NULL, '$2y$10$/4FAV/yb7PJyV3PhqED7ju/wl48EgEyv5e7z1pl3NyXLbmfzvMa6C', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-14 20:41:51', '2023-12-14 20:41:51', NULL),
(322, 'اياد اسلام', 'eeyad8060@gmail.com', NULL, '01551079052', '01000732608', 'الغربية', NULL, '$2y$10$4/Y/Jv8TpfuCN3GKBjqjzOcZ/b5WbI888NFw3OE83lJfAPjLJWBSK', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-14 20:44:39', '2023-12-14 20:44:39', NULL),
(323, 'Omar Konbr', 'omarkonbr7@gmail.com', NULL, '01004445129', '01022210478', 'الغربية', NULL, '$2y$10$usdhYcoWcyc0Y3ny4lMua.79oyig7e8kKvO.kbZrP3PusY9LmWB7e', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-14 23:52:06', '2023-12-14 23:52:06', NULL),
(324, 'Malak Elkateib', 'malakelkateeb644@gmail.com', NULL, '01150526868', '01287293315', 'الغربية', NULL, '$2y$10$QmdHnie0vCurAYCa/C40M.pM6shW9hpPXVtMJ6.Y6A7DMkAnz8MLG', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-15 04:43:38', '2023-12-15 04:43:38', NULL),
(325, 'Shaden el fakhrany', 'shaden2007@hotmail.com', NULL, '01066317069', '01091853858', 'الغربية', NULL, '$2y$10$aEgUhtaklxuXIhyGNwudIOkAPVF9WetfWdWQI/S4I8g.N0SXH.Wwa', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-15 05:23:47', '2023-12-15 05:23:47', NULL),
(326, 'مريم محمد الحلواني', 'mariemmohame2008@gmail.com', NULL, '01554963663', '01227656727', 'الغربية', NULL, '$2y$10$.bYnqG.Z2srn2kcT0mbkPus21VvGpHrHzm/WJMbp/oJOi6sd90ht6', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-15 23:31:38', '2023-12-15 23:31:38', NULL),
(327, 'احمد عبداللطيف جابر', 'ahmedabedellatef90@gmail.com', NULL, '01006081452', '01024574533', 'الغربية', NULL, '$2y$10$LxABXc7DEiGr2R5jNvq0C.l9wY2ePPnE77VxyXSL7Akwy11hn5dUe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-16 02:57:24', '2023-12-16 02:57:24', NULL),
(328, 'Muhhamed Essouy', 'mohamedelessouy77@gmail.com', NULL, '01062628000', '01201180760', 'الغربية', NULL, '$2y$10$ZyuJf1ArtUbunS1g8J4.kOC7V5glXfN8DSZaWwz8Q8eaMuBn2OMqO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-16 06:46:34', '2023-12-16 06:46:34', NULL),
(329, 'عبدالرحمن عفيفي', 'Matrixbedo2008@gmail.com', NULL, '01008801550', '01200052772', 'الغربية', NULL, '$2y$10$6JNs4bQTcdygyDZ5Cck5ZuV/Y7AU5pr0XmPRoCPQWIzHgpaN.aPFK', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-16 07:57:49', '2023-12-16 07:57:49', NULL),
(330, 'Khaled', 'lolotaha20008@gmail.com', NULL, '01068096770', '01068096770', 'الغربية', NULL, '$2y$10$qzqIzXFGs2lxEbHixivAgOAqttL3uRMYrZxKQX0t0VfZYTkxgiKHa', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-16 15:01:27', '2023-12-16 15:01:27', NULL),
(331, 'Abdulrhman', 'boodyhussein99@gmail.com', NULL, '01551246300', '01029037710', 'الغربية', NULL, '$2y$10$Qvn93xwrEU93YzSItoxFyOF2kpyMtYQyf/CLKfk2SREPUC6m.cqii', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-16 15:36:44', '2023-12-16 15:36:44', NULL),
(332, 'Safa ashraf', 'ashrafsafa136@gmail.com', NULL, '01030498842', '01003752748', 'الغربية', NULL, '$2y$10$TNvp7qlUD5djHpCYxNGOQe5IJIxQWl/Q4x/n/fm3ORrypc51./VeO', 0, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2023-12-16 17:50:20', '2023-12-16 17:50:20', NULL),
(333, 'Ganna elrefaey', 'gannaelrefaey9@gmail.com', NULL, '01065305062', '01029844151', 'القاهرة', NULL, '$2y$10$EwvSQyq11WLsYF.fY2aBbuclafsLvNFPFn0DbwNRvhvT2gh9S2Xfq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-16 19:24:49', '2023-12-16 19:24:49', NULL),
(334, 'mariam alsaid', 'mariamalsaid558@gmail.com', NULL, '01091182068', '01026872058', 'الغربية', NULL, '$2y$10$p1NAFsE9drbn6e5tIqVA3umw36X1Iim./9ZVKhh6Ck4s6MbBaUMni', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-17 03:00:26', '2023-12-17 03:00:26', NULL),
(335, 'احمد عمرو رجب', 'ahmedyouns914@gmail.com', NULL, '01019259702', '01090626781', 'الغربية', NULL, '$2y$10$JzhIygHgYbqaj6uuBlssyOZbz8ZAfHiWIeGkrPKA3iQR8c6rzt/r2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-17 03:37:58', '2023-12-17 03:37:58', NULL),
(336, 'مريم ابوريه', 'mariamaboraya77@gmail.com', NULL, '01220379582', '01281820549', 'الغربية', NULL, '$2y$10$olyPy20HBPsmfB49vYe9pukeoosF/LYRhZC87LMbkzmuWB467N.GS', 0, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2023-12-17 03:55:32', '2023-12-17 03:55:32', NULL),
(337, 'سلمي حمدي يوسف', 'hamdysalma130@gmail.com', NULL, '01001380027', '01003867229', 'الغربية', NULL, '$2y$10$QASa1XeaCHQLPF4zDM3SP.8YT1bsI8SytgvzNw5Lbpl/p8NhXglPW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-17 07:39:06', '2023-12-17 07:39:06', NULL),
(338, 'ملك غنيم', 'malakghonem9@gmail.con', NULL, '01271277989', '01201439633', 'الغربية', NULL, '$2y$10$AU0YNDaMJypN4NdJYWdLLOnS/DWFnrtgVhzq.T/3jDrmrA.Uo7NAW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-17 08:53:41', '2023-12-17 08:53:41', NULL),
(339, 'Ganna Yaseen', 'gannayassen05@gmail.com', NULL, '01206170194', '01229794603', 'الغربية', NULL, '$2y$10$/k/M6AHFQa69p9SckcKxsu89mX./nAiyheAh9UR9dPJFAl634b9Je', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-17 17:13:16', '2023-12-17 17:13:16', NULL),
(340, 'ردينه محمد', 'rdynhmhmd585@gmail.com', NULL, '01069015258', '01065517746', 'الغربية', NULL, '$2y$10$1FjIhGkwCatiNbwDKlYtCuONjjkAR5m5v4E/V.jnrhOgIyPsGdsjK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-17 21:11:05', '2023-12-17 21:11:05', NULL),
(341, 'Shaza', 'shodytamer10@gmail.com', NULL, '01026455156', '01026455156', 'الغربية', NULL, '$2y$10$kdrSmknc89ZC1FRAFIMO1OAwktKf2mlW2OTc2X8Y44aPz41bm77Jm', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-18 04:38:15', '2023-12-18 04:38:15', NULL),
(342, 'Salma', 'm_hennawy@yahoo.com', NULL, '01060060519', '01225593938', 'الغربية', NULL, '$2y$10$D9DUnTAZMxqpHL2RhB2s9.dkcw7aWcaYj3kbEde43YLYkGJyEdHJ.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-12-18 06:58:59', '2023-12-18 06:58:59', NULL),
(343, 'معاذ عماد', 'moazemad7001@gmail.com', NULL, '01060007001', '01101004462', 'الغربية', NULL, '$2y$10$Ha2/ZRALd9NFakqmH0YDoOBV/u2NbfVCEnbluunplJU6iMhyeXo3y', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-19 03:04:07', '2023-12-19 03:04:07', NULL),
(344, '𝐍𝐚𝐡𝐥𝐚 𝐀𝐡𝐦𝐞𝐝', 'nhlhahmd379@gmail.com', NULL, '01205963933', '01280554299', 'الغربية', NULL, '$2y$10$FUwA3xLAm4veBGhOZNhKLeUIQFkrZ/PUSXgVIoG6Ly0TY3ecpKKeC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-19 04:12:35', '2023-12-19 04:12:35', NULL),
(345, 'محمد عاشور', 'pepoashor9@gmail.com', NULL, '01228387505', '01092697429', 'الغربية', NULL, '$2y$10$mYsTdbCgToWXoo8FLrlsWe3O3eXipSF5Vbid5YF/EnE2TLb/5BOdO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-19 18:42:45', '2023-12-19 18:42:45', NULL),
(346, 'هبه الله هاني فاروق سعد', 'alihany7@outlook.com', NULL, '01145411207', '01281185008', 'الغربية', NULL, '$2y$10$.3jEhWNNTlQOOd8tuz.Une9JAtYn7klyY1WYcuJD6x9xwTEjjCq3y', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-12-20 00:27:16', '2023-12-20 00:27:16', NULL),
(347, 'Khadija', 'khadijaehabshahin2007@gamil.com', NULL, '01080564536', '01002343016', 'الغربية', NULL, '$2y$10$gXdhc4PrUGdnpdMpABQ3Y.bWP.2bj85Y1ijc26yjgh5rPy0resPzS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-20 05:32:39', '2023-12-20 05:32:39', NULL),
(348, 'الاء', 'alaaqutb874@gmail.com', NULL, '01150975907', '01020088906', 'الغربية', NULL, '$2y$10$bQV8RqP4Doa3d2ka4vXEl.fgpj93lMei5xsT/uBf8..xncWoKlg6S', 0, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2023-12-20 13:41:15', '2023-12-20 13:41:15', NULL),
(349, 'Menna helal', 'ah7738553@gmail.com', NULL, '01554247185', '01227886417', 'الغربية', NULL, '$2y$10$zlsVJLPeRjYHxssT9NLAB.Rg/6ZF7WlApkQXQtyBYuHoh0uEFariu', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-21 03:42:02', '2023-12-21 03:42:02', NULL),
(350, 'الاء احمد', 'nor.ahmed349@yahoo.com', NULL, '01060827111', '01060826663', 'الغربية', NULL, '$2y$10$a04EYjFlisqNtaTFhJm9QOrvSLMjLmBhZjl79c5Tzn8gYdTuZsnMS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-21 05:02:34', '2023-12-21 05:02:34', NULL),
(351, 'فاطمه محمود', 'fatma2008mahmoud@gmail.com', NULL, '01022515263', '01012822722', 'الغربية', NULL, '$2y$10$DFA6lZ6Dh58668vP5bc3WOo81jGKeMbEuhcK7x5TvO.brhr9UGwNC', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-21 05:04:07', '2023-12-21 05:04:07', NULL),
(352, 'Kareem elnady', 'kareemelnady3@gmail.com', NULL, '01158682144', '01204420182', 'الغربية', NULL, '$2y$10$Bk8GyTNQZPW5hfuVb6k2J.toBXqFu0iaMC6Gos1fzNIMAD6uDBmlq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-12-21 18:14:12', '2023-12-21 18:14:12', NULL),
(353, 'Adham', 'adhamshehab26@gmail.com', NULL, '01277225909', '01220524959', 'الغربية', NULL, '$2y$10$wRk45BdBr10hIPbVJKgi5uHBerg4hNsRDvsq2/w5pq29wxFhMLMF2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-21 22:26:28', '2023-12-21 22:26:28', NULL),
(354, 'مهاب تامر أحمد توفيق', 'mohabtamer237@gmail.com', NULL, '01204241801', '01023636634', 'الغربية', NULL, '$2y$10$Cx5PetX0tb/bEUx5u3oKvu9dmHFgRb17WCqrj8tD6o2H65Ooh8TJ6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-12-23 13:26:30', '2023-12-23 13:26:30', NULL),
(355, 'جومانه مصطفى فؤاد', 'gomanaelmetwaly@icloud.com', NULL, '01559069068', '01205044408', 'الغربية', NULL, '$2y$10$XE86fg0F00mnPg/RwbrEWuBiSXv00PIg4/75H3g.DigfuoM3kygeq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-31 05:47:31', '2023-12-31 05:47:31', NULL),
(356, 'usama ragab elshnnawy', 'usamaelshnnawy@gmail.com', NULL, '01018808163', '01017018454', 'الغربية', NULL, '$2y$10$TyAtKkqSYgrnzivOXZL8qepTZMqNtHAeUK2sjyEkACuN62t05Mksi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-01-02 18:20:38', '2024-01-02 18:20:38', NULL),
(357, 'Mohamed allam', 'engahmedgamal@gmail.com', NULL, '01088768899', '01016406670', 'الغربية', NULL, '$2y$10$NTWCcCcCJUF7dqhokPiFkOBkPLIwq.lIeV2XvkJ27VHmQMFSOB8GK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-01-07 15:25:27', '2024-01-07 15:25:27', NULL),
(358, 'Rahma', 'rahmaala2008@gmail.com', NULL, '01156869125', '01123346332', 'الغربية', NULL, '$2y$10$Hye9buDvDzHrtAyCqqk8AO7ElrQfnyzAiW7FEKrAaMBQxQg9nYeX.', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-01-10 01:56:51', '2024-01-10 01:56:51', NULL),
(359, 'عمر  جاد', 'omarjad583@gmail.com', NULL, '01204083260', '01224569613', 'الغربية', NULL, '$2y$10$31XuxWqswaMbRuUHvjyv9ehLWigIJRPX0hoTBfEiLCAiz92l9X1LG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-01-15 08:21:09', '2024-01-15 08:21:09', NULL),
(360, 'Fatma yasser', 'fatmayaseen549@yahoo.com', NULL, '01227322829', '01227322829', 'الغربية', NULL, '$2y$10$LEzXsyuzGEeWylkLraLYW.wjCD7frbkeaIeEPoPPvkHlqVJjJ4gWC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-01-15 10:52:49', '2024-01-15 10:52:49', NULL),
(361, 'شهد خالد العدلى', 'shahd6@gmail.com', NULL, '01023009966', '01024968696', 'الغربية', NULL, '$2y$10$gAdXaJDisotll1/9Pjlv7OsmbDmzG.edPyxS5PV/OmPoLnf0T4yQ2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-01-26 18:18:41', '2024-01-26 18:18:41', NULL),
(362, 'Mohamed masoud', 'mohamedmasoud522@gmail.com', NULL, '01169985473', '01016588223', 'الغربية', NULL, '$2y$10$PUYSHFpbkImDglT.VUvjRu/YxYLqCG87cX8bvDLUs4YUJ/j4TmS92', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-04 05:37:09', '2024-02-04 05:37:09', NULL),
(363, 'Nour Osama', 'saramostafa5544@gmail.com', NULL, '01093660530', '01000961002', 'الغربية', NULL, '$2y$10$.oiU43Ne5AcBIpkd4JymW.ro3gCwcFruZQx56h/Ff081qGfPS3A3y', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-02-06 07:49:33', '2024-02-06 07:49:33', NULL),
(364, 'يوسف مسعود', 'alaayosso45@gmail.com', NULL, '01554051985', '01125593778', 'الغربية', NULL, '$2y$10$r8Wb2D4smTJ4JmG8SoACo..kmlJbYeW6.1CWafeNe1y0iK/a6/0Rq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-07 03:19:01', '2024-02-07 03:19:01', NULL),
(365, 'يوسف محمد فتح الله', 'youseffathala25@gmail.com', NULL, '01019978523', '01503929492', 'الغربية', NULL, '$2y$10$95zAAKnLpapkmFSR05wEf.9VKdqCsMwnaplOMP9Gbi6bpuYaavz6i', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-07 05:14:20', '2024-02-07 05:14:20', NULL),
(366, 'Sama', 'sama.mostafa2069@gmail.com', NULL, '01226804929', '01228426674', 'الغربية', NULL, '$2y$10$xgeVVwM8cWR6tMZ70kT3BeBq2o3o24C4cxoiMo5XXtXI3JFMhoJ.2', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-07 06:42:27', '2024-02-07 06:42:27', NULL),
(367, 'Mayar Elhawati', 'mayarelhawati@gmail.com', NULL, '01033552093', '01060789150', 'الغربية', NULL, '$2y$10$eqSjUBQRxMk2Al8h5WRYWe6N7ZMCqQs1AvqjiBVtk.UV116RrH08C', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-09 04:38:04', '2024-02-09 04:38:04', NULL),
(368, 'احمد خالد عسل', 'ahmedasal217@gmail.com', NULL, '01228491829', '01277725106', 'الغربية', NULL, '$2y$10$8EEemR8sS3xwGGuOnPchoejH4bZTzElaeo1SOCqc2SKHQZCLvaD5a', 0, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2024-02-11 15:20:38', '2024-02-11 15:20:38', NULL);
INSERT INTO `users` (`id`, `name`, `email`, `gender`, `phonenumber`, `phone_parent`, `government`, `email_verified_at`, `password`, `all_points`, `active_points`, `profile`, `subject_id`, `school_grade_id`, `group_id`, `teacher_id`, `remember_token`, `status_exam`, `provider_id`, `provider`, `created_at`, `updated_at`, `deleted_at`) VALUES
(369, 'زياد طارق البابلي', 'zeyadelbably693@gmail.com', NULL, '01206468463', '01222540272', 'الغربية', NULL, '$2y$10$JLMTpxUkX2vRW5Oa4WeKMeqccztbaIRh6XK7DTolQ0iZS5Y/FDlrO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-13 02:19:37', '2024-02-13 02:19:37', NULL),
(370, 'كنزي محمد ماهر', 'kenzymohamedmaher213@gmail.com', NULL, '01550653377', '01070063361', 'الغربية', NULL, '$2y$10$Vq22eGjFCsToYG4Ih50FbOgm4xmGthaSoV84/tCDzASFdZGgV6ZV6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-13 04:28:34', '2024-02-13 04:28:34', NULL),
(371, 'Yousef elbaradei', 'yousef2elbaradei2@gmail.com', NULL, '01204163402', '01282141223', 'الغربية', NULL, '$2y$10$3a7PUh.oSGLvQl.ieE18ieE50Y5Vm9CTr33bPpaqVL.BINtUE/aXi', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-13 20:20:28', '2024-02-13 20:20:28', NULL),
(372, 'Kareem', 'ka0697918@gmail.com', NULL, '01203597624', '01224383032', 'الغربية', NULL, '$2y$10$fKPZEuSZ40FLm1G2fxn./epfEnMSSa.iklTWbsM8lP8YAP3eRPxyi', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-02-14 06:29:43', '2024-02-14 06:29:43', NULL),
(373, 'نورهان عمرو', 'kim.ronnie.official.01@gmail.com', NULL, '01280150236', '01119150010', 'الغربية', NULL, '$2y$10$xK8cWGLbmbz1yaUn0f7ZBuvqTe159HUvFs.9rNnJZy.TWzMek/HJe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-15 01:34:34', '2024-02-15 01:34:34', NULL),
(374, 'بسمله محمد عزت', 'basmalamohammed909@gmail.com', NULL, '01006101752', '01015284607', 'الغربية', NULL, '$2y$10$Gk3iqhmlfVdqFiBDFQu3m.UbI.fT4b7xgCHvNDal2Yh2vvfehMhkm', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-15 03:36:35', '2024-02-15 03:36:35', NULL),
(375, 'Ahmed Hussain', 'ahmedhadia370@gmail.com', NULL, '01113348573', '01113327481', 'الغربية', NULL, '$2y$10$2K.wwEShPpeJivTOWkjeWejrnVOYt7xXpXddqQS9T2mSZJspXeTfi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-17 04:42:03', '2024-02-17 04:42:03', NULL),
(376, 'احمد ايهاب', 'aelbohofy206@gmail.com', NULL, '01098175187', '01002019309', 'الغربية', NULL, '$2y$10$pQ6IvSue3NkXHD2Zb7WWY.wxZbdLHD7Us2GP.qHa53oM1C4tjliYq', 0, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2024-02-17 06:11:27', '2024-02-17 06:11:27', NULL),
(377, 'Haidy', 'haidy.elsamanody@icloud.com', NULL, '01066629291', '01224990133', 'الغربية', NULL, '$2y$10$5TtlhNgJ/sL4Bo7SYzpSLOAx9dAea9ZKd1Td7LqpIZVDIYFgCyeRu', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-17 23:02:26', '2024-02-17 23:02:26', NULL),
(378, 'shahd', 'shahdkhaled@hotmail.com', NULL, '01099683841', '01019272096', 'الغربية', NULL, '$2y$10$e5beBqCZqrH6WRi5JZ.AVuEDDc4VVVZQe51ET1AZZaChfFUTX3kZ2', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-17 23:39:30', '2024-02-17 23:39:30', NULL),
(379, 'روضه على', 'faten.yasen@yahoo.com', NULL, '01503405419', '01270747169', 'الغربية', NULL, '$2y$10$03p.QcQ3aezaFctVBmHxy.NcxOAuUn438uqPedn5l4y1JIMeobHnW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-18 01:36:10', '2024-02-18 01:36:10', NULL),
(380, 'ياسمين الشاعر', 'Yasmeinabdelkadir@gmail.com', NULL, '01223513090', '01281687732', 'الغربية', NULL, '$2y$10$5RwO3c6ytt.iCvJVae0uX.ZDXAYgb4aVqaBeFcvZ..WvaSpOJi3cq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-19 06:33:17', '2024-02-19 06:33:17', NULL),
(381, 'Wadie magdy', 'wadiemagdy@gmail.com', NULL, '01271265433', '01271265433', 'الغربية', NULL, '$2y$10$XUC8Rc.n3pUyaXor4DJ8xOxXDfz4IZ/U31n1Y0qPg8p90HogXhLgy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-20 01:07:03', '2024-02-20 01:07:03', NULL),
(382, 'جوفانى جرجس', 'govanygergesmores@gmail.com', NULL, '01204771193', '01222731193', 'الغربية', NULL, '$2y$10$r8ch5O9buxle4JxR3XOfVOIOhvnwEyxv6ij6pawDIBJdghIB7un7G', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-21 09:46:17', '2024-02-21 09:46:17', NULL),
(383, 'عبد الرحمن محمد', 'am814121@gmail.com', NULL, '01127762591', '01127762591', 'الغربية', NULL, '$2y$10$LR3MjrGeDr7W6vG4vf.pGeNa/4b9c/fjZXezka8baPnC7MUujAceq', 0, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2024-02-23 21:16:18', '2024-02-23 21:16:18', NULL),
(384, 'هادي محمد', 'habem640@gmail.com', NULL, '01024595155', '01024595155', 'الغربية', NULL, '$2y$10$yeb/XNjuzoVE6aCX89kvye1vVQQP4EKciZlHJJVaSlGRZkjWGJG.i', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-25 00:43:46', '2024-02-25 00:43:46', NULL),
(385, 'Abdullah Ibrahim', 'a67377624@gmail.com', NULL, '01507134479', '01508218472', 'الغربية', NULL, '$2y$10$x.HRrxQaORDwxUhi9FzaP.jQBDTiJ4moebZeuHhv8y/bPVg4jsqMO', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-02-25 01:51:10', '2024-02-25 01:51:10', NULL),
(386, 'Alaa Elbarbary', 'loloelbarbary@gmail.com', NULL, '01552793234', '01225605105', 'الغربية', NULL, '$2y$10$NCxU4U9ewiriW0PhvKgAeudhU6KJrvBFWuCpE.aoeUk8N/hu3/rHa', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-26 04:25:04', '2024-02-26 04:25:04', NULL),
(387, 'Malk Tayfour', 'MalokaTayfour21@gmail.com', NULL, '01141645176', '01279437732', 'الغربية', NULL, '$2y$10$Zko47GI4lJeu3xf3rX8Lauxxl9gMbkCfuRBVbtKT6rcjP9k40W.lG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-27 02:14:03', '2024-02-27 02:14:03', NULL),
(388, 'Abanoub Aziz', 'azizabanoub@gmail.com', NULL, '01284116516', '01273486754', 'الغربية', NULL, '$2y$10$f/wOewVjqvDLkjHzsVZrhehQo2LDKw2d.oSunxrLR046avUN5Jq2e', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-02-28 00:18:53', '2024-02-28 00:18:53', NULL),
(389, 'fbvf', 'geoeltorigy@icloud.com', NULL, '01000763773', '01000763774', 'القاهرة', NULL, '$2y$10$LWhzngI9RFTGJ9DXfy.kjO99N.76ccX.jhlshOrrVcX41ei8.FN9O', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-28 02:46:19', '2024-02-28 02:46:19', NULL),
(390, 'الاء عبد العزيز عشماوي امين ابو حجازي', '2l227egazy@gmail.com', NULL, '01015139952', '01069803781', 'الغربية', NULL, '$2y$10$MXtBSW/U1cyJ2wnbRCsqU.IbaxGn5MNng8OGHIkkfo4GV0KTqrv.K', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-02-29 01:10:31', '2024-02-29 01:10:31', NULL),
(391, 'Ahmed Elmarhomy', 'eelmarhomy@gmail.com', NULL, '01004206887', '01220071865', 'الغربية', NULL, '$2y$10$V264Iz8BvaVDQX3y4kyxFeDUKL0HusQ/gJjR2cpPJxxfC5Vn7Bx6q', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-03-02 00:47:23', '2024-03-02 00:47:23', NULL),
(392, 'نور محمد الحو', 'nourelhaw02@gmail.com', NULL, '01005126499', '01095604005', 'القاهرة', NULL, '$2y$10$GA2Rvv58K6izNVRdOz9mWe1wKE6atHLBu.rY5igKfNQCLAxFEV5q2', 0, 0, NULL, 1, 3, 4, 1, NULL, 0, NULL, NULL, '2024-03-02 16:34:57', '2024-05-29 20:20:37', NULL),
(393, 'محمد نشأت', 'medonashat20@gmail.com', NULL, '01558961208', '01280214502', 'الغربية', NULL, '$2y$10$xe4MD9zBW55QvxtO6G02U.CD.To46Z6pURdE16zFp4gAS1pt3qX2O', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-03-03 02:59:42', '2024-03-03 02:59:42', NULL),
(394, 'Amr Hossny', 'mandohossny7@gmail.com', NULL, '01011020253', '01065531369', 'الغربية', NULL, '$2y$10$EmeMbKdrY5/GFQYKLr07ueBQ.yF9cPYzioBVowH9Ep8H4jWGtKjSq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-04 00:14:55', '2024-03-04 00:14:55', NULL),
(395, 'علي عامر', 'alibabaamer56@gmail.com', NULL, '01281176686', '01226979422', 'الغربية', NULL, '$2y$10$M7jCHz.Bar0owQHLg.D1JOYeuIrpqOakBTtCGYfje9KP4oqbXB0zi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-03-05 16:12:43', '2024-03-05 16:12:43', NULL),
(396, 'مصطفى السيد مصطفى ياقوت', 'mostafayacout66@gmail.com', NULL, '01204301045', '01289331889', 'الغربية', NULL, '$2y$10$srnOyChBTWe9XbR2cI8hSea2w5PYEYHZ3LcKKoBaueDiVMFz4Z9om', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-06 02:58:14', '2024-03-06 02:58:14', NULL),
(397, 'شذا خالد علي', 'shazakhalid31@gmail.com', NULL, '01091280631', '01067770277', 'الغربية', NULL, '$2y$10$7dU3ssKD8M6pn9QPvFnrou1XhgraxRAv9Avhcw8aXJtM3SX0Oq/mm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-06 23:44:55', '2024-03-06 23:44:55', NULL),
(398, 'basmalamohamed', 'basmalamohamed@gmail.com', NULL, '01024613682', '01550647705', 'الغربية', NULL, '$2y$10$dkreBN7QImWvCtc3K0lqOOAyWjttCkW4hpJqtfnzYjvMC9WFbAyH6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-11 19:26:32', '2024-03-11 19:26:32', NULL),
(399, 'نهال احمد', 'nehal.ismeal@gmail.com', NULL, '01289887108', '01287415783', 'الغربية', NULL, '$2y$10$2yiDoKCgiQnXXKv8aluvgeR7l2LKGWgMsP5tnwYECbC8x5vsxBs5a', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-03-12 20:34:46', '2024-03-12 20:34:46', NULL),
(400, 'علي محمد الليثي', 'l37668215@gmail.com', NULL, '01221159764', '01223735700', 'الغربية', NULL, '$2y$10$rj3CwFnloqrVztseTTFhi.ceUFid74FbJBv91tyJ4on5MmxI26u/e', 0, 0, NULL, 1, 1, 6, 1, NULL, 0, NULL, NULL, '2024-03-14 18:58:50', '2024-06-06 19:35:19', NULL),
(401, 'تسنيم محمود', 'tasnimmahmoud2007@gmail.com', NULL, '01222521463', '01555406789', 'الغربية', NULL, '$2y$10$0KfLvOGUS5.CBl9E6d6i7.UZB4hxz7sea3UJm.MgK3N1x63jLmx0e', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-15 00:55:50', '2024-03-15 00:55:50', NULL),
(402, 'محمد وليد شحاته محمود', 'mohamedwaleed111455@gmail.com', NULL, '01201218498', '01276490038', 'الغربية', NULL, '$2y$10$PPrh0cNTTujsfy2e3Y4lGO/8KxweVjbBQ1AOkCrNDePoC.ssH80Ym', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-03-16 03:55:53', '2024-03-16 03:55:53', NULL),
(403, 'محمد بدر الدين حمدي محمود', 'mohamadbadr803@gmail.com', NULL, '01066407429', '01007528291', 'الغربية', NULL, '$2y$10$f3nhVn/Bt3FOhtcgfR8E/uYJqDm0TmDwb9L03BrXlbvR7pO1vWOpy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-21 18:18:02', '2024-03-21 18:18:02', NULL),
(404, 'khaled Elnger', 'khaledelnger1@gmail.com', NULL, '01096002655', '01117666600', 'الغربية', NULL, '$2y$10$3FqDqg5LXi1yib/ow79WFeRVcFd8Zo9oupG4zUfqj3J/zc.FMZcKm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-24 06:53:09', '2024-03-24 06:53:09', NULL),
(405, 'نور فايد', 'n01091921026@gmail.com', NULL, '01091921026', '01550606573', 'الغربية', NULL, '$2y$10$SMtY.kqsX3zN47mmphCmr.aaKVNqzh8sy8gau4Z/7szHZNXsCwu56', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-03-30 14:06:47', '2024-03-30 14:06:47', NULL),
(406, 'Rodina Wael', 'rorowael111@gmail.com', NULL, '01555714810', '01205221525', 'القاهرة', NULL, '$2y$10$iYQnQCYkHzgep77VUhPz..cm.exw3Mlu.5cVW2cLy0Iuvpv5RkGru', 0, 0, NULL, 1, 3, 4, 1, NULL, 0, NULL, NULL, '2024-04-04 06:21:18', '2024-05-29 20:20:05', NULL),
(407, 'Wesam', 'wesamabdin1@gmail.com', NULL, '01066570129', '01019133185', 'البحر الأحمر', NULL, '$2y$10$dC2hDq8uNso1QVg.DCtE9OoUsw5TREPROHV.VT3JY2G0yyBVGe27q', 125, 125, NULL, 1, 3, 4, 1, NULL, 0, NULL, NULL, '2024-04-22 05:21:57', '2024-06-06 19:45:36', NULL),
(408, 'أحمد عادل', 'ag10880768@gmail.com', NULL, '01500121512', '01516204667', 'القاهرة', NULL, '$2y$10$ZtPaQaajW7INcopA5QoXB.FVMD9u8rkjK4mXPl39UKuVgiLIYJwZW', 1000, 600, NULL, 1, 3, 4, 1, NULL, 0, NULL, NULL, '2024-05-24 11:03:44', '2024-05-29 20:16:29', NULL),
(409, 'أحمد خالد', 'ag10801@gmail.com', NULL, '01200121512', '01516204667', 'القاهرة', NULL, '$2y$10$YAjxHNVhHCI6cFZpLEM/Y.YzsNxD3rSW0J1SzmkCYfCVoXlorC6Ey', 0, 0, NULL, NULL, 3, 1, NULL, NULL, 0, NULL, NULL, '2024-05-29 21:36:48', '2024-05-29 21:36:48', NULL),
(413, 'nada youssery', 'ah82602416@gmail.com', NULL, '01019204667', '01056294667', 'القاهرة', '2024-06-01 21:22:18', '$2y$10$tdWRnTNj3DSVzd9yD3tAD.PiIQgWWoXmHwSRweLgrDcRYOG1mMJb2', 550, 300, 'users/340449380_189760030058369_252300388191378691_n.jpg', 1, 4, 4, 1, NULL, 0, NULL, NULL, '2024-06-01 21:09:00', '2024-06-05 19:56:23', NULL),
(414, 'aya fawzy', 'ah826211416@gmail.com', NULL, '01059204667', '01056294667', 'القاهرة', '2024-06-05 19:59:28', '$2y$10$hVEsMYulR.PytVPyxQULDOdxARXHiVNspQXBe0gDB2Hq.zYrlhcM.', 125, 125, NULL, 1, 4, 6, 1, NULL, 0, NULL, NULL, '2024-06-05 19:57:03', '2024-06-06 19:33:58', NULL),
(415, 'aya fawzy', 'ah8260416@gmail.com', NULL, '0105904667', '01056294667', 'القاهرة', NULL, '$2y$10$7yMM1adUdMM9VFOWHt4pyOHIuqWXv.STd7drIykBg4dlhHMjgWMWW', 0, 0, NULL, 1, 1, 4, 1, NULL, 0, NULL, NULL, '2024-06-05 20:12:43', '2024-06-06 19:35:37', NULL),
(417, 'فادى خالد  الالفى', 'ag1510105@gmail.com', NULL, '01011111111', '01022224433', 'دمياط', '2024-06-13 10:56:51', '$2y$10$4eG2xfsyP43zLnbiwf0A/eY3RLooqZdmuQKpsT9cfAdOu3MyjJVDK', 0, 0, NULL, 1, 1, 7, 1, NULL, 0, NULL, NULL, '2024-06-06 19:50:00', '2024-06-06 19:50:00', NULL),
(425, 'محمد هاشم', 'mohamedhashimrezk73@gmail.com', NULL, '01099874902', '0102308425', 'القاهرة', '2024-06-13 09:16:24', '$2y$10$lhNPOpK2xvnoEj5cI4WBN.aC8FXP1.5y4STwjKYGEUaFYSP21rkY.', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-06-13 09:11:44', '2024-06-13 09:16:24', NULL),
(428, 'إلين هاشم', 'elienhashim@gmail.com', NULL, '01094874902', '01202308425', 'الغربية', '2024-06-13 15:32:04', '$2y$10$8FfMdKYYtnKa71an.3u3auQiM/.f7NVGOeX91NOHYeuyLMb288UJm', 0, 0, NULL, NULL, 1, 6, NULL, NULL, 0, NULL, NULL, '2024-06-13 14:59:10', '2024-06-13 15:32:04', NULL),
(429, 'محمود سعد', 'salehgoma22@gmail.com', NULL, '01523548721', '01254213698', 'الغربية', NULL, '$2y$10$d4//16lhhlMykSy9TMhul.3/g9y6WrDUE6HNFK0lHxmwBwJ5QhTxm', 0, 0, NULL, NULL, 2, 6, NULL, NULL, 0, NULL, NULL, '2024-06-13 15:53:49', '2024-06-13 15:53:49', NULL),
(435, 'Muhammed Hashim', 'engahmedgamal08544@gmail.com', NULL, '01222254455', '01222225445', 'الغربية', NULL, '$2y$10$BL/nniRVYqCwsTSgq7kbtu2Ev3X3LspJ2ay39nPL9yXY1QHHtBvX.', 0, 0, NULL, 1, 1, 1, 1, NULL, 0, NULL, NULL, '2024-06-13 16:20:51', '2024-07-02 12:06:43', NULL),
(436, 'M.Hashim', 'm.saleh22@gmail.com', NULL, '01011115454', '0115454454', 'البحيرة', NULL, '$2y$10$6CXTNqTJegYiohBXWMNyFeyFb9BBId689plnSv60cdRZPs0oflIku', 0, 0, NULL, NULL, 1, 6, NULL, NULL, 0, NULL, NULL, '2024-06-13 16:27:55', '2024-06-13 16:27:55', NULL),
(437, 'dww', 'dwdwwd@gmail.com', NULL, '01202454545', '145411541541', 'الإسماعلية', NULL, '$2y$10$Oln.4UqdKL9M0ZdwRIrrpO/rVr/t3sDthjmOxoCmdtQ.T7EfNqP2O', 0, 0, NULL, NULL, 1, 6, NULL, NULL, 0, NULL, NULL, '2024-06-13 16:38:16', '2024-06-13 16:38:16', NULL),
(438, 'dwdwq', 'mohamedhashimrezk743@gmail.com', NULL, '01059874902', '01202308425', 'الإسماعلية', NULL, '$2y$10$8htP.rQQVAbu1bxEW08SgOHaPZeo5PJ1/AJjYtJkQhINAI/z45X2u', 0, 0, NULL, NULL, 1, 6, NULL, NULL, 0, NULL, NULL, '2024-06-13 16:40:26', '2024-06-13 16:40:26', NULL),
(439, 'محمد هاشم', 'mohamedhashimrezk734@gmail.com', NULL, '01099800902', '01202308425', 'الغربية', NULL, '$2y$10$A8be7FN5sbk1hfgAppegbeTEVx1ilZ7Sx/XtBzSgC0dK4soe/VGAO', 0, 0, NULL, NULL, 2, 4, NULL, NULL, 0, NULL, NULL, '2024-06-13 17:03:21', '2024-06-13 17:03:21', NULL),
(442, 'gamal khaled', 'engahmedgamal186@gmail.com', NULL, '01099239677', '01056294667', 'القاهرة', NULL, '$2y$10$o9k.rILqdV8iuOVw4LsDB.8AKozqjPRTOwoNl11/JmQz3yCEiyY5W', 0, 0, NULL, NULL, 3, 1, NULL, NULL, 0, NULL, NULL, '2024-06-30 04:32:22', '2024-06-30 04:32:22', NULL),
(443, 'gamal khaled', 'engahmedgamal00000086@gmail.com', NULL, '01090239677', '01056294667', 'القاهرة', NULL, '$2y$10$mQbR.OmKjLhHOn7Tb32pnOxHUXuK/bxC3j8SHp7dKTJJDa1HHe7KS', 0, 0, NULL, NULL, 3, 1, NULL, NULL, 0, NULL, NULL, '2024-06-30 04:33:44', '2024-06-30 04:33:44', NULL),
(444, 'gamal khaled', 'engahmedgamal086@gmail.com', NULL, '01096239677', '01056294667', 'القاهرة', '2024-06-30 04:40:00', '$2y$10$dzYJ6Co6rUQhWyhz3/CdO.ILrIDVuPCMuYK6ArCp7X/is0.HE5FYG', 0, 0, NULL, NULL, 3, 1, NULL, NULL, 0, NULL, NULL, '2024-06-30 04:37:32', '2024-06-30 04:40:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `video_minute`
--

CREATE TABLE `video_minute` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `video_id` bigint UNSIGNED NOT NULL,
  `current_time` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_minute`
--

INSERT INTO `video_minute` (`id`, `user_id`, `video_id`, `current_time`, `created_at`, `updated_at`) VALUES
(1, 5, 5, 450, NULL, NULL),
(2, 5, 4, 450, NULL, NULL),
(3, 5, 2, 6000, NULL, NULL),
(4, 5, 15, 6000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vr_services`
--

CREATE TABLE `vr_services` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `creds` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vr_services`
--

INSERT INTO `vr_services` (`id`, `name`, `description`, `creds`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'zoom', NULL, NULL, '2024-05-29 06:11:00', '2024-05-29 06:11:00', NULL),
(2, 'google meet', NULL, NULL, '2024-05-29 06:11:01', '2024-05-29 06:11:01', NULL),
(3, 'vconnect', NULL, NULL, '2024-05-29 06:11:01', '2024-05-29 06:11:01', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_view`
--
ALTER TABLE `book_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_view_user_id_foreign` (`user_id`),
  ADD KEY `book_view_book_id_foreign` (`book_id`);

--
-- Indexes for table `class_studies`
--
ALTER TABLE `class_studies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_studies_subject_id_foreign` (`subject_id`),
  ADD KEY `class_studies_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `exams_subject_id_foreign` (`subject_id`),
  ADD KEY `exams_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `exams_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `exam_student`
--
ALTER TABLE `exam_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_student_user_id_foreign` (`user_id`),
  ADD KEY `exam_student_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `exam_timer`
--
ALTER TABLE `exam_timer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_timer_exam_id_foreign` (`exam_id`),
  ADD KEY `exam_timer_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `free_books`
--
ALTER TABLE `free_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `free_books_unit_id_foreign` (`unit_id`),
  ADD KEY `free_books_subject_id_foreign` (`subject_id`),
  ADD KEY `free_books_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `free_books_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `free_exams`
--
ALTER TABLE `free_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `free_exams_unit_id_foreign` (`unit_id`),
  ADD KEY `free_exams_subject_id_foreign` (`subject_id`),
  ADD KEY `free_exams_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `free_exams_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `free_videos`
--
ALTER TABLE `free_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `free_videos_unit_id_foreign` (`unit_id`),
  ADD KEY `free_videos_subject_id_foreign` (`subject_id`),
  ADD KEY `free_videos_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `free_videos_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `governments`
--
ALTER TABLE `governments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `lessons_subject_id_foreign` (`subject_id`),
  ADD KEY `lessons_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `lessons_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `media_subject_id_foreign` (`unit_id`),
  ADD KEY `media_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `media_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `month_date` (`month_date`);

--
-- Indexes for table `month_student`
--
ALTER TABLE `month_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `month_student_user_id_foreign` (`user_id`),
  ADD KEY `month_student_month_id_foreign` (`month_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  ADD KEY `notifiable_id` (`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `posts_subject_id_foreign` (`unit_id`),
  ADD KEY `posts_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `posts_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_subject_id_foreign` (`subject_id`),
  ADD KEY `questions_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `questions_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `question_exams`
--
ALTER TABLE `question_exams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_question_exam` (`question_id`,`exam_id`),
  ADD KEY `question_exams_exam_id_foreign` (`exam_id`),
  ADD KEY `question_exams_question_id_foreign` (`question_id`),
  ADD KEY `question_exams_subject_id_foreign` (`subject_id`),
  ADD KEY `question_exams_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `question_exams_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `question_exam_students`
--
ALTER TABLE `question_exam_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_exam_students_exam_id_foreign` (`exam_id`),
  ADD KEY `question_exam_students_user_id_foreign` (`user_id`),
  ADD KEY `question_exam_students_question_id_foreign` (`question_id`),
  ADD KEY `question_exam_students_subject_id_foreign` (`subject_id`),
  ADD KEY `question_exam_students_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `question_exam_students_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `rechagre_balance`
--
ALTER TABLE `rechagre_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register_tokens`
--
ALTER TABLE `register_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `register_tokens_email_unique` (`email`);

--
-- Indexes for table `school_grades`
--
ALTER TABLE `school_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_grades_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `sessionslive`
--
ALTER TABLE `sessionslive`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `static_exams`
--
ALTER TABLE `static_exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `subjects_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_email_unique` (`email`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `teacher_settings`
--
ALTER TABLE `teacher_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `units_teacher_id_foreign` (`teacher_id`),
  ADD KEY `units_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_email_password_index` (`email`,`password`);

--
-- Indexes for table `video_minute`
--
ALTER TABLE `video_minute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_minute_user_id_foreign` (`user_id`),
  ADD KEY `video_minute_video_id_foreign` (`video_id`);

--
-- Indexes for table `vr_services`
--
ALTER TABLE `vr_services`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_view`
--
ALTER TABLE `book_view`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `class_studies`
--
ALTER TABLE `class_studies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `exam_student`
--
ALTER TABLE `exam_student`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `exam_timer`
--
ALTER TABLE `exam_timer`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `free_books`
--
ALTER TABLE `free_books`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `free_exams`
--
ALTER TABLE `free_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `free_videos`
--
ALTER TABLE `free_videos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `governments`
--
ALTER TABLE `governments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `month_student`
--
ALTER TABLE `month_student`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `question_exams`
--
ALTER TABLE `question_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `question_exam_students`
--
ALTER TABLE `question_exam_students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `rechagre_balance`
--
ALTER TABLE `rechagre_balance`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `register_tokens`
--
ALTER TABLE `register_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `school_grades`
--
ALTER TABLE `school_grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sessionslive`
--
ALTER TABLE `sessionslive`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `static_exams`
--
ALTER TABLE `static_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teacher_settings`
--
ALTER TABLE `teacher_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=445;

--
-- AUTO_INCREMENT for table `video_minute`
--
ALTER TABLE `video_minute`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vr_services`
--
ALTER TABLE `vr_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_view`
--
ALTER TABLE `book_view`
  ADD CONSTRAINT `book_view_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `media` (`id`);

--
-- Constraints for table `class_studies`
--
ALTER TABLE `class_studies`
  ADD CONSTRAINT `class_studies_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `class_studies_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
  ADD CONSTRAINT `exams_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `exams_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `exam_student`
--
ALTER TABLE `exam_student`
  ADD CONSTRAINT `exam_student_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`);

--
-- Constraints for table `exam_timer`
--
ALTER TABLE `exam_timer`
  ADD CONSTRAINT `exam_timer_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`);

--
-- Constraints for table `free_books`
--
ALTER TABLE `free_books`
  ADD CONSTRAINT `free_books_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
  ADD CONSTRAINT `free_books_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `free_books_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `free_books_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `free_exams`
--
ALTER TABLE `free_exams`
  ADD CONSTRAINT `free_exams_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
  ADD CONSTRAINT `free_exams_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `free_exams_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `free_exams_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `free_videos`
--
ALTER TABLE `free_videos`
  ADD CONSTRAINT `free_videos_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
  ADD CONSTRAINT `free_videos_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `free_videos_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `free_videos_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
  ADD CONSTRAINT `lessons_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `lessons_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
  ADD CONSTRAINT `media_subject_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `media_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `month_student`
--
ALTER TABLE `month_student`
  ADD CONSTRAINT `month_student_month_id_foreign` FOREIGN KEY (`month_id`) REFERENCES `months` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
  ADD CONSTRAINT `posts_subject_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `posts_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
  ADD CONSTRAINT `questions_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `questions_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `question_exams`
--
ALTER TABLE `question_exams`
  ADD CONSTRAINT `question_exams_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`),
  ADD CONSTRAINT `question_exams_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
  ADD CONSTRAINT `question_exams_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `question_exams_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `question_exam_students`
--
ALTER TABLE `question_exam_students`
  ADD CONSTRAINT `question_exam_students_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`),
  ADD CONSTRAINT `question_exam_students_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
  ADD CONSTRAINT `question_exam_students_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `question_exam_students_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `school_grades`
--
ALTER TABLE `school_grades`
  ADD CONSTRAINT `school_grades_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
  ADD CONSTRAINT `subjects_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
  ADD CONSTRAINT `units_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `units_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `video_minute`
--
ALTER TABLE `video_minute`
  ADD CONSTRAINT `video_minute_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `lessons` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
