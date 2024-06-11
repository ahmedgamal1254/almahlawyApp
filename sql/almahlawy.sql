-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 11, 2024 at 06:24 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `class_studies`
--

CREATE TABLE `class_studies` (
  `id` bigint UNSIGNED NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_time` time NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subject_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_studies`
--

INSERT INTO `class_studies` (`id`, `group_name`, `group_time`, `description`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'أونلاين', '12:00:00', NULL, 1, 3, 1, NULL, '2024-06-11 09:51:00', '2024-06-11 09:51:23'),
(2, 'أونلاين', '12:00:00', NULL, 1, 2, 1, NULL, '2024-06-11 09:52:22', '2024-06-11 09:52:22');

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
  `units_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free` tinyint NOT NULL DEFAULT '0' COMMENT '0==> not free,1==> free'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `title`, `description`, `code`, `duration`, `start_time`, `end_time`, `date_exam`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`, `units_id`, `free`) VALUES
(1, 'اختبار على النيار الكهربى وقانون أوم', NULL, '701629132', '60', '22:30:00', '23:30:00', '2024-08-01', 1, 1, 1, '2024-06-11 18:30:56', '2024-06-11 18:18:09', '2024-06-11 18:30:56', 'null', 0),
(2, 'امتخان التيار الكهربى وقانون كيرشوف', NULL, '552661662', '30', '22:00:00', '23:00:00', '2024-08-11', 1, 1, 1, NULL, '2024-06-11 18:45:57', '2024-06-11 18:45:57', '10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exam_student`
--

CREATE TABLE `exam_student` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `status` tinyint DEFAULT NULL COMMENT '0:end,1:opened',
  `degree` smallint DEFAULT NULL COMMENT 'student degree in exam',
  `total` smallint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
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
(1, 'ملخص قانون كيرشوف وقانون أوم للدوائر المغلقة', NULL, 'Lecture 1, 2 (Dr.Alshimaa).pdf', 'books_caption/blob-scene-haikei.png', 10, 1, 1, 1, NULL, '2024-06-11 13:25:32', '2024-06-11 13:31:46');

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
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int NOT NULL,
  `image_caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
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

INSERT INTO `free_videos` (`id`, `title`, `description`, `video_url`, `duration`, `image_caption`, `unit_id`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'مراجعة درس التيار الكهربى وقانون كيرشوف', NULL, '1- مقدمة الكورس.mp4', 120, 'captions/1674075919800.jpg', 10, 1, 1, 1, NULL, '2024-06-11 13:22:10', '2024-06-11 13:23:07');

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
(1, 'default', '{\"uuid\":\"afc48db9-1625-4104-a442-6cf6794d266a\",\"displayName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationPostJob\\\":2:{s:8:\\\"\\u0000*\\u0000users\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";N;s:2:\\\"id\\\";a:0:{}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";N;s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000message\\\";s:21:\\\"تم نشر  بوست\\\";}\"}}', 0, NULL, 1718106681, 1718106681),
(2, 'default', '{\"uuid\":\"bb3ce5b8-2fa1-491c-8608-03aae8cfec70\",\"displayName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationPostJob\\\":2:{s:8:\\\"\\u0000*\\u0000users\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";N;s:2:\\\"id\\\";a:0:{}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";N;s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000message\\\";s:23:\\\"تم نشر  بوست 2\\\";}\"}}', 0, NULL, 1718106719, 1718106719),
(3, 'default', '{\"uuid\":\"afca5841-90a6-419b-a14c-1aab6567837d\",\"displayName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationPostJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationPostJob\\\":2:{s:8:\\\"\\u0000*\\u0000users\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";N;s:2:\\\"id\\\";a:0:{}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";N;s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000message\\\";s:40:\\\"تم نشر  التيار الكهربى\\\";}\"}}', 0, NULL, 1718107024, 1718107024),
(4, 'default', '{\"uuid\":\"3de41675-be31-447e-88d0-97fe323311e9\",\"displayName\":\"App\\\\Jobs\\\\UploadVideoNotificationJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UploadVideoNotificationJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\UploadVideoNotificationJob\\\":2:{s:8:\\\"\\u0000*\\u0000users\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";N;s:2:\\\"id\\\";a:0:{}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";N;s:15:\\\"collectionClass\\\";N;}s:9:\\\"\\u0000*\\u0000lesson\\\";i:1;}\"}}', 0, NULL, 1718108069, 1718108069),
(5, 'default', '{\"uuid\":\"24680dd8-0c00-45c6-a5d0-459bbf39ab5f\",\"displayName\":\"App\\\\Jobs\\\\UploadVideoNotificationJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UploadVideoNotificationJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\UploadVideoNotificationJob\\\":2:{s:8:\\\"\\u0000*\\u0000users\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";N;s:2:\\\"id\\\";a:0:{}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";N;s:15:\\\"collectionClass\\\";N;}s:9:\\\"\\u0000*\\u0000lesson\\\";i:2;}\"}}', 0, NULL, 1718108530, 1718108530),
(6, 'default', '{\"uuid\":\"b86d0897-b569-4606-ad71-176ba8671fed\",\"displayName\":\"App\\\\Jobs\\\\NotificationExamJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationExamJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationExamJob\\\":2:{s:8:\\\"\\u0000*\\u0000users\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";N;s:2:\\\"id\\\";a:0:{}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";N;s:15:\\\"collectionClass\\\";N;}s:7:\\\"\\u0000*\\u0000exam\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Exam\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 0, NULL, 1718126290, 1718126290),
(7, 'default', '{\"uuid\":\"b458adce-6e87-4f6a-894f-6a2ee51e9826\",\"displayName\":\"App\\\\Jobs\\\\NotificationExamJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NotificationExamJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\NotificationExamJob\\\":2:{s:8:\\\"\\u0000*\\u0000users\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";N;s:2:\\\"id\\\";a:0:{}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";N;s:15:\\\"collectionClass\\\";N;}s:7:\\\"\\u0000*\\u0000exam\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Exam\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 0, NULL, 1718127958, 1718127958);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
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
(70, '2024_06_11_075421_add_to_static_exams_table', 38);

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
(1, '2024-08', 2024, 8, 'أغسطس', 0, '2024-06-11 13:35:39', '2024-06-11 13:36:04', 1, 'أغسطس', 'محتوى شهر أغسطس ل 2024', 150.00, 1, NULL);

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
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
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
(2, 'بوست 1', 'وصف بوست 1', 'posts/1948100_0.jpeg', 10, 1, 1, NULL, '2024-06-11 12:51:18', '2024-06-11 12:55:06'),
(3, 'بوست 2', 'وصف بوست 2', 'posts/13516627_859008637533582_3833102901120275455_n.jpg', 10, 1, 1, '2024-06-11 12:55:18', '2024-06-11 12:51:59', '2024-06-11 12:55:18'),
(4, 'التيار الكهربى', 'أولًا: أكمل:\r\n1. عندما يمر تيار كهربي 3A عبر نقطة من دائرة كهربية، فإن الشحنة الكهربية التي تمر خلال دقيقة تساوي....\r\nQ=IT=3x60=180C\r\n\r\n2. فرق الجهد بالفولت المطلوب لكي يمر تيار مقداره 3A خلال مقاومة 6Ω يساوي....\r\nV=IR=3x6=18V\r\n\r\n3. إذا كان فرق الجهد بين طرفي مقاومة 2Ω يساوي 6V فإن شدة التيار التي تمر فيها تساوي....\r\nI equals V over R equals 6 over 2 equals 3 straight A', 'posts/d7c36e75-cecc-48b1-a7cc-a0509892ce1d.png', 10, 1, 1, NULL, '2024-06-11 12:57:04', '2024-06-11 12:57:04');

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
  `degree` int NOT NULL DEFAULT '1' COMMENT 'degree of question	',
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
(1, '2', NULL, 'عندما يمر تيار كهربي 3A عبر نقطة من دائرة كهربية، فإن الشحنة الكهربية التي تمر خلال دقيقة تساوي... C', 'اختيارات', NULL, '1. عندما يمر تيار كهربي 3A عبر نقطة من دائرة كهربية، فإن الشحنة الكهربية التي تمر خلال دقيقة تساوي...', '[\"180\",\"210\",\"150\",\"120\"]', '180', 2, 1, 1, 1, NULL, '2024-06-11 10:53:17', '2024-06-11 10:53:17', 10),
(2, '2', NULL, 'فرق الجهد بالفولت المطلوب لكي يمر تيار مقداره 3A خلال مقاومة 6Ω يساوي....', 'اختيارات', NULL, NULL, '[\"18 V\",\"12 V\",\"5 V\",\"10 V\"]', '18 V', 2, 1, 1, 1, NULL, '2024-06-11 11:49:36', '2024-06-11 11:49:36', 10),
(3, '2', NULL, 'إذا كان فرق الجهد بين طرفي مقاومة 2Ω يساوي 6V فإن شدة التيار التي تمر فيها تساوي....', 'اختيارات', NULL, NULL, '[\"1\",\"3\",\"2\",\"4\"]', '3', 2, 1, 1, 1, NULL, '2024-06-11 17:16:12', '2024-06-11 17:16:12', 10),
(4, '3', 'questions/1.png', 'قراءة الامبير تساوى :-', 'اختيارات', NULL, NULL, '[\"30\",\"6\",\"5\",\"10\"]', '6', 2, 1, 1, 1, NULL, '2024-06-11 17:21:14', '2024-06-11 17:21:14', 10),
(5, '3', 'questions/1.png', 'قراءة الفولتميتر تساوي....', 'اختيارات', NULL, NULL, '[\"48\",\"56\",\"72\",\"96\"]', '56', 2, 1, 1, 1, NULL, '2024-06-11 17:22:53', '2024-06-11 17:22:53', 10),
(6, '2', NULL, 'وصلت أربع لمبات مقاومة كل منها 6Ω على التوازي ثم وصلت المجموعة ببطارية 12V ذات مقاومة داخلية مهملة: 1. المقاومة الكلية للمبات الأربع تساوي:', 'اختيارات', NULL, NULL, '[\"2\\/3Ω\",\"24Ω\",\"3\\/2Ω\",\"6Ω\",\"12Ω\"]', '12Ω', 2, 1, 1, 1, NULL, '2024-06-11 17:28:17', '2024-06-11 17:28:17', 10),
(7, '2', NULL, 'التيار المار بالبطارية يساوي:', 'اختيارات', NULL, NULL, '[\"8A\",\"6A\",\"4A\",\"2A\",\"0A\"]', '8A', 2, 1, 1, 1, NULL, '2024-06-11 17:33:01', '2024-06-11 17:33:01', 10),
(8, '2', NULL, 'الشحنة الكلية التي تترك البطارية في 10s تكون:', 'اختيارات', NULL, NULL, '[\"80c\",\"60c\",\"40c\",\"20c\",\"0c\"]', '80c', 2, 1, 1, 1, NULL, '2024-06-11 17:34:27', '2024-06-11 17:34:27', 10),
(9, '2', NULL, 'شدة التيار المار بكل لمبة يساوي:', 'اختيارات', NULL, NULL, '[\"2\\/3A\",\"32A\",\"8A\",\"1A\",\"2A\"]', '2A', 2, 1, 1, 1, NULL, '2024-06-11 17:36:00', '2024-06-11 17:36:00', 10),
(10, '2', NULL, 'فرق الجهد بين طرفي كل لمبة يساوي', 'اختيارات', NULL, NULL, '[\"3V\",\"12V\",\"6V\",\"4V\",\"2V\"]', '12V', 2, 1, 1, 1, NULL, '2024-06-11 17:37:29', '2024-06-11 17:37:29', 10),
(11, '2', NULL, 'إذا وصلت اللمبات الأربع على التوالي تكون مقاومتها الكلية:', 'اختيارات', NULL, NULL, '[\"2\\/3Ω\",\"24Ω\",\"32Ω\",\"6Ω\",\"12Ω\"]', '24Ω', 2, 1, 1, 1, NULL, '2024-06-11 17:39:27', '2024-06-11 17:39:27', 10),
(12, '1', 'questions/2.png', NULL, 'اختيارات', NULL, NULL, '[\"a\",\"b\",\"c\",\"d\"]', 'c', 2, 1, 1, 1, NULL, '2024-06-11 17:42:24', '2024-06-11 17:42:24', 10),
(13, '1', 'questions/3.png', NULL, 'اختيارات', NULL, NULL, '[\"25 كولوم\",\"125 كولوم\",\"1.5 كولوم\",\"لا توجد اجابة صحيحة\"]', '125 كولوم', 2, 1, 1, 1, NULL, '2024-06-11 17:44:47', '2024-06-11 17:44:47', 10),
(14, '2', NULL, 'خاصية تحدد مقدار الطاقة اللتى تحملها الموجة :-', 'اختيارات', NULL, NULL, '[\"التردد\",\"السعة\",\"الطول الموجى\",\"سرعة الموجة\"]', 'الطول الموجى', 2, 1, 2, 1, NULL, '2024-06-11 17:59:42', '2024-06-11 17:59:42', 7),
(15, '2', NULL, 'المسافة بين نقطة على الموجة وأقرب نقطة أخرى اليها تتحرك بنفس سرعتها واتجاهها :-', 'اختيارات', NULL, NULL, '[\"التردد\",\"السعة\",\"الطول الموجى\",\"سرعة الموجة\"]', 'التردد', 2, 1, 2, 1, NULL, '2024-06-11 18:03:32', '2024-06-11 18:03:32', 7),
(16, '2', NULL, 'عدد الاطوال الموجية اللتى تعبر نقطة محددة خلال ثانية :-', 'اختيارات', NULL, NULL, '[\"التردد\",\"السعة\",\"الطول الموجى\",\"سرعة الموجة\"]', 'سرعة الموجة', 2, 1, 2, 1, NULL, '2024-06-11 18:05:29', '2024-06-11 18:05:29', 7),
(17, '2', NULL, 'ما الذى يولد الموجات ؟', 'اختيارات', NULL, NULL, '[\"الصوت\",\"نقل الطاقة\",\"الحرارة\",\"الاهتزازات\"]', 'الاهتزازات', 2, 1, 2, 1, NULL, '2024-06-11 18:08:55', '2024-06-11 18:08:55', 7),
(18, '2', NULL, 'الوحدة اللتى تستخدم لقياس التردد؟', 'اختيارات', NULL, NULL, '[\"ديسبل\",\"هرتز\",\"متر\",\"متر\\/ث\"]', 'هرتز', 2, 1, 2, 1, NULL, '2024-06-11 18:10:20', '2024-06-11 18:10:20', 7);

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
(13, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL);

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
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(3, 'الصف الاول الثانوى', NULL, 1, NULL, '2024-06-11 09:50:29', '2024-06-11 09:50:29');

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
  `unit_id` bigint UNSIGNED NOT NULL,
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
(1, 'مراجعة ليلة الامتحان لطلبة 3 ثانوى التيار الكهربى وقانون كيرشوف', 'sessions/1948100_0.jpeg', 'https://meet.google.com/qsx-xkwj-pai', NULL, 'zoom', NULL, 1, 10, 1, '1', '2024-06-11 13:07:34', '2024-06-11 13:08:39', NULL);

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
(1, 'امتحان الطالب ندى خالد فوزى', '', 18.00, 20.00, 'sessions/ملف دكتور محمود .pdf', 2, 1, 2, '2024-06-11 19:15:05', '2024-06-11 19:22:14', NULL);

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
(1, 1, '01023065856', '01023065856', 'معكم مستر أحمد المحلاوى مدرس الفيزياء خبرة 15 سنة', 'teachers/340449380_189760030058369_252300388191378691_n.jpg', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'الفيزياء', 'الازبكية - شارع الوايلى', '15 مايو', 'cairo', '2024-06-11 13:37:30', '2024-06-11 13:37:30');

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

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 'تمثيل الحركة', NULL, 3, 1, 1, '2024-06-11 10:38:27', '2024-06-11 10:38:27', NULL),
(3, 'الحركة المتسارعة', NULL, 3, 1, 1, '2024-06-11 10:38:45', '2024-06-11 10:38:45', NULL),
(4, 'القوى في بعد واحد', NULL, 3, 1, 1, '2024-06-11 10:39:03', '2024-06-11 10:39:03', NULL),
(5, 'القوى في بعدين', NULL, 3, 1, 1, '2024-06-11 10:39:20', '2024-06-11 10:39:20', NULL),
(6, 'الحركة في بعدين', NULL, 3, 1, 1, '2024-06-11 10:39:41', '2024-06-11 10:40:17', NULL),
(7, 'الموجات', NULL, 2, 1, 1, '2024-06-11 10:41:22', '2024-06-11 10:41:22', NULL),
(8, 'الموائع', NULL, 2, 1, 1, '2024-06-11 10:41:41', '2024-06-11 10:41:41', NULL),
(9, 'الحرارة', NULL, 2, 1, 1, '2024-06-11 10:42:01', '2024-06-11 10:42:01', NULL),
(10, 'الفصل الأول: التيار الكهربي وقانون أوم وقانون كيرتشوف', NULL, 1, 1, 1, '2024-06-11 10:42:45', '2024-06-11 10:46:41', NULL),
(11, 'مقدمة في الفيزياء الحديثة', NULL, 1, 1, 1, '2024-06-11 10:43:02', '2024-06-11 10:43:02', NULL);

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
(1, 'أحمد جمال فوزى عازى', 'engahmedgamal860@gmail.com', NULL, '01091536978', '01060753790', 'القاهرة', '2024-06-11 10:18:02', '$2y$10$DpD93n4wA8c/ge0ZC5XJPOZtArIGpSVNH5ylZ7QOAZrPaBBpf.quq', 500, 500, 'users/340449380_189760030058369_252300388191378691_n.jpg', 1, 3, 1, 1, NULL, 0, NULL, NULL, '2024-06-11 10:18:02', '2024-06-11 10:30:14', NULL),
(2, 'ندى خالد فوزى', 'nada@gmail.com', NULL, '01016204668', '01060753790', 'الجيزة', '2024-06-11 10:31:56', '$2y$10$SqpLGKPsjeFT3IoSdKPq/upGKKyeFjGHFouoOjMFmHWSjpbnUVrdG', 125, 125, 'users/download (2).jpg', 1, 2, 2, 1, NULL, 0, NULL, NULL, '2024-06-11 10:31:56', '2024-06-11 10:35:47', NULL);

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
  ADD KEY `class_studies_school_grade_id_foreign` (`school_grade_id`),
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
  ADD KEY `media_subject_id_foreign` (`subject_id`),
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
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_studies`
--
ALTER TABLE `class_studies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exam_student`
--
ALTER TABLE `exam_student`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_timer`
--
ALTER TABLE `exam_timer`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `free_books`
--
ALTER TABLE `free_books`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `free_exams`
--
ALTER TABLE `free_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `free_videos`
--
ALTER TABLE `free_videos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `governments`
--
ALTER TABLE `governments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `month_student`
--
ALTER TABLE `month_student`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `question_exams`
--
ALTER TABLE `question_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `question_exam_students`
--
ALTER TABLE `question_exam_students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rechagre_balance`
--
ALTER TABLE `rechagre_balance`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `register_tokens`
--
ALTER TABLE `register_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_grades`
--
ALTER TABLE `school_grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sessionslive`
--
ALTER TABLE `sessionslive`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `static_exams`
--
ALTER TABLE `static_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `sequence` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `video_minute`
--
ALTER TABLE `video_minute`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `class_studies_school_grade_id_foreign` FOREIGN KEY (`school_grade_id`) REFERENCES `school_grades` (`id`),
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
  ADD CONSTRAINT `media_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
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
