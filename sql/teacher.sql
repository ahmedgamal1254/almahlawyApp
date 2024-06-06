-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2024 at 04:59 PM
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
-- Database: `teacher`
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
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_time` time NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
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
(4, 'السبت والخميس', '13:00:00', NULL, 1, 2, 1, NULL, '2024-05-22 20:11:30', '2024-05-22 20:12:50');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `date_exam` date DEFAULT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `units_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free` tinyint NOT NULL DEFAULT '0' COMMENT '0==> not free,1==> free'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `title`, `description`, `code`, `duration`, `start_time`, `end_time`, `date_exam`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`, `units_id`, `free`) VALUES
(5, 'تيست', NULL, '269281883', '45', '22:23:00', '23:24:00', '2024-05-23', 1, 1, 1, NULL, '2024-05-27 20:23:58', '2024-05-27 20:23:58', '1,3', 0),
(6, 'امتحان على البنزين', 'وصف الامتحان على البنزين', '964346860', '30', '22:00:00', '22:30:00', '2024-03-01', 1, 3, 1, NULL, '2024-06-02 18:32:28', '2024-06-02 18:32:28', '3,2,1', 0),
(7, 'امتحان على التيار الكهربى وقانون أوم', NULL, '139025780', '30', '21:00:00', '21:30:00', '2024-04-17', 1, 3, 1, NULL, '2024-06-02 19:02:04', '2024-06-02 19:02:04', '3', 0);

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

--
-- Dumping data for table `exam_student`
--

INSERT INTO `exam_student` (`id`, `user_id`, `exam_id`, `status`, `degree`, `total`, `created_at`, `updated_at`) VALUES
(1, 413, 6, 0, 0, 11, '2024-06-03 19:28:46', '2024-06-03 19:28:46');

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
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `free_books`
--

CREATE TABLE `free_books` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(4, 'ahmed', 'ahmed', 'c++ examples.pdf', 'books_caption/1948100_0.jpeg', 7, 1, 1, 1, NULL, '2024-05-31 04:06:17', '2024-05-31 06:35:33');

-- --------------------------------------------------------

--
-- Table structure for table `free_exams`
--

CREATE TABLE `free_exams` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int NOT NULL,
  `image_caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, 'ahmed', NULL, '2- تحميل وتشغيل متطلبات الكورس.mp4', 120, 'captions/3.png', 4, 1, 1, 1, NULL, '2024-05-31 04:39:27', '2024-05-31 06:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `governments`
--

CREATE TABLE `governments` (
  `id` bigint UNSIGNED NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `governorate_name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `governorate_name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `governments`
--

INSERT INTO `governments` (`id`, `country`, `governorate_name_ar`, `governorate_name_en`, `created_at`, `updated_at`) VALUES
(1, 'مصر', 'القاهرة', 'Cairo', '2023-09-04 04:25:43', '2023-09-04 04:25:43'),
(2, 'مصر', 'الجيزة', 'Giza', '2023-09-04 04:25:43', '2023-09-04 04:25:43'),
(3, 'مصر', 'الأسكندرية', 'Alexandria', '2023-09-04 04:25:43', '2023-09-04 04:25:43'),
(4, 'مصر', 'الدقهلية', 'Dakahlia', '2023-09-04 04:25:43', '2023-09-04 04:25:43'),
(5, 'مصر', 'البحر الأحمر', 'Red Sea', '2023-09-04 04:25:43', '2023-09-04 04:25:43'),
(6, 'مصر', 'البحيرة', 'Beheira', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(7, 'مصر', 'الفيوم', 'Fayoum', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(8, 'مصر', 'الغربية', 'Gharbiya', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(9, 'مصر', 'الإسماعلية', 'Ismailia', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(10, 'مصر', 'المنوفية', 'Menofia', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(11, 'مصر', 'المنيا', 'Minya', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(12, 'مصر', 'القليوبية', 'Qaliubiya', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(13, 'مصر', 'الوادي الجديد', 'New Valley', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(14, 'مصر', 'السويس', 'Suez', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(15, 'مصر', 'اسوان', 'Aswan', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(16, 'مصر', 'اسيوط', 'Assiut', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(17, 'مصر', 'بني سويف', 'Beni Suef', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(18, 'مصر', 'بورسعيد', 'Port Said', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(19, 'مصر', 'دمياط', 'Damietta', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(20, 'مصر', 'الشرقية', 'Sharkia', '2023-09-04 04:25:44', '2023-09-04 04:25:44'),
(21, 'مصر', 'جنوب سيناء', 'South Sinai', '2023-09-04 04:25:45', '2023-09-04 04:25:45'),
(22, 'مصر', 'كفر الشيخ', 'Kafr Al sheikh', '2023-09-04 04:25:45', '2023-09-04 04:25:45'),
(23, 'مصر', 'مطروح', 'Matrouh', '2023-09-04 04:25:45', '2023-09-04 04:25:45'),
(24, 'مصر', 'الأقصر', 'Luxor', '2023-09-04 04:25:45', '2023-09-04 04:25:45'),
(25, 'مصر', 'قنا', 'Qena', '2023-09-04 04:25:45', '2023-09-04 04:25:45'),
(26, 'مصر', 'شمال سيناء', 'North Sinai', '2023-09-04 04:25:45', '2023-09-04 04:25:45'),
(27, 'مصر', 'سوهاج', 'Sohag', '2023-09-04 04:25:45', '2023-09-04 04:25:45'),
(28, 'مصر', 'سوهاج', 'Sohag', NULL, NULL),
(29, 'مصر', 'شمال سيناء', 'North Sinai', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"b2fa1fb6-a3d9-467d-b55c-ac2fa6954a1e\",\"displayName\":\"App\\\\Jobs\\\\UploadVideoNotificationJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UploadVideoNotificationJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\UploadVideoNotificationJob\\\":3:{s:41:\\\"\\u0000App\\\\Jobs\\\\UploadVideoNotificationJob\\u0000data\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";N;s:2:\\\"id\\\";a:0:{}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";N;s:15:\\\"collectionClass\\\";N;}s:45:\\\"\\u0000App\\\\Jobs\\\\UploadVideoNotificationJob\\u0000video_id\\\";i:1;s:44:\\\"\\u0000App\\\\Jobs\\\\UploadVideoNotificationJob\\u0000teacher\\\";s:30:\\\"مستر حسام الجزار\\\";}\"}}', 0, NULL, 1716521521, 1716521521),
(2, 'default', '{\"uuid\":\"1d61c81b-c636-4a6a-b42e-5b64413590b2\",\"displayName\":\"App\\\\Jobs\\\\UploadVideoNotificationJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UploadVideoNotificationJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\UploadVideoNotificationJob\\\":3:{s:41:\\\"\\u0000App\\\\Jobs\\\\UploadVideoNotificationJob\\u0000data\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:34:{i:0;i:5;i:1;i:7;i:2;i:10;i:3;i:11;i:4;i:13;i:5;i:25;i:6;i:288;i:7;i:306;i:8;i:319;i:9;i:320;i:10;i:321;i:11;i:322;i:12;i:324;i:13;i:326;i:14;i:329;i:15;i:330;i:16;i:332;i:17;i:334;i:18;i:336;i:19;i:348;i:20;i:351;i:21;i:358;i:22;i:365;i:23;i:366;i:24;i:367;i:25;i:368;i:26;i:371;i:27;i:376;i:28;i:377;i:29;i:378;i:30;i:383;i:31;i:384;i:32;i:389;i:33;i:393;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:45:\\\"\\u0000App\\\\Jobs\\\\UploadVideoNotificationJob\\u0000video_id\\\";i:1;s:44:\\\"\\u0000App\\\\Jobs\\\\UploadVideoNotificationJob\\u0000teacher\\\";s:34:\\\"مستر أحمد المحلاوى\\\";}\"}}', 0, NULL, 1717126770, 1717126770),
(3, 'default', '{\"uuid\":\"ca4452ec-dbc6-4e8c-9a9a-681ac55d2266\",\"displayName\":\"App\\\\Jobs\\\\UploadVideoNotificationJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UploadVideoNotificationJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\UploadVideoNotificationJob\\\":3:{s:41:\\\"\\u0000App\\\\Jobs\\\\UploadVideoNotificationJob\\u0000data\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:192:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:8;i:4;i:16;i:5;i:19;i:6;i:20;i:7;i:21;i:8;i:22;i:9;i:23;i:10;i:24;i:11;i:26;i:12;i:28;i:13;i:29;i:14;i:30;i:15;i:31;i:16;i:32;i:17;i:35;i:18;i:37;i:19;i:38;i:20;i:39;i:21;i:40;i:22;i:41;i:23;i:42;i:24;i:43;i:25;i:44;i:26;i:45;i:27;i:46;i:28;i:47;i:29;i:48;i:30;i:49;i:31;i:50;i:32;i:51;i:33;i:52;i:34;i:53;i:35;i:54;i:36;i:56;i:37;i:57;i:38;i:59;i:39;i:61;i:40;i:63;i:41;i:64;i:42;i:65;i:43;i:66;i:44;i:70;i:45;i:71;i:46;i:72;i:47;i:73;i:48;i:76;i:49;i:78;i:50;i:82;i:51;i:84;i:52;i:86;i:53;i:87;i:54;i:94;i:55;i:95;i:56;i:96;i:57;i:99;i:58;i:101;i:59;i:102;i:60;i:103;i:61;i:104;i:62;i:106;i:63;i:107;i:64;i:108;i:65;i:109;i:66;i:110;i:67;i:113;i:68;i:114;i:69;i:115;i:70;i:117;i:71;i:118;i:72;i:119;i:73;i:121;i:74;i:123;i:75;i:124;i:76;i:125;i:77;i:126;i:78;i:128;i:79;i:129;i:80;i:131;i:81;i:132;i:82;i:134;i:83;i:136;i:84;i:138;i:85;i:139;i:86;i:140;i:87;i:141;i:88;i:142;i:89;i:143;i:90;i:144;i:91;i:145;i:92;i:146;i:93;i:148;i:94;i:149;i:95;i:150;i:96;i:151;i:97;i:152;i:98;i:158;i:99;i:160;i:100;i:165;i:101;i:166;i:102;i:168;i:103;i:174;i:104;i:177;i:105;i:179;i:106;i:180;i:107;i:181;i:108;i:182;i:109;i:183;i:110;i:189;i:111;i:193;i:112;i:196;i:113;i:202;i:114;i:203;i:115;i:208;i:116;i:209;i:117;i:211;i:118;i:214;i:119;i:216;i:120;i:218;i:121;i:219;i:122;i:221;i:123;i:222;i:124;i:224;i:125;i:225;i:126;i:231;i:127;i:233;i:128;i:238;i:129;i:239;i:130;i:240;i:131;i:241;i:132;i:242;i:133;i:243;i:134;i:245;i:135;i:250;i:136;i:252;i:137;i:254;i:138;i:255;i:139;i:256;i:140;i:259;i:141;i:262;i:142;i:263;i:143;i:267;i:144;i:268;i:145;i:269;i:146;i:270;i:147;i:273;i:148;i:280;i:149;i:284;i:150;i:285;i:151;i:289;i:152;i:293;i:153;i:297;i:154;i:300;i:155;i:301;i:156;i:302;i:157;i:303;i:158;i:305;i:159;i:308;i:160;i:309;i:161;i:311;i:162;i:312;i:163;i:316;i:164;i:317;i:165;i:342;i:166;i:346;i:167;i:352;i:168;i:354;i:169;i:360;i:170;i:361;i:171;i:363;i:172;i:372;i:173;i:385;i:174;i:388;i:175;i:390;i:176;i:392;i:177;i:394;i:178;i:396;i:179;i:397;i:180;i:398;i:181;i:401;i:182;i:403;i:183;i:404;i:184;i:406;i:185;i:407;i:186;i:408;i:187;i:409;i:188;i:410;i:189;i:411;i:190;i:412;i:191;i:413;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:45:\\\"\\u0000App\\\\Jobs\\\\UploadVideoNotificationJob\\u0000video_id\\\";i:3;s:44:\\\"\\u0000App\\\\Jobs\\\\UploadVideoNotificationJob\\u0000teacher\\\";s:34:\\\"مستر أحمد المحلاوى\\\";}\"}}', 0, NULL, 1717345176, 1717345176),
(4, 'default', '{\"uuid\":\"6275a414-e27e-4f24-8fcb-61c524417f0d\",\"displayName\":\"App\\\\Jobs\\\\UploadVideoNotificationJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UploadVideoNotificationJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\UploadVideoNotificationJob\\\":3:{s:41:\\\"\\u0000App\\\\Jobs\\\\UploadVideoNotificationJob\\u0000data\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:192:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:8;i:4;i:16;i:5;i:19;i:6;i:20;i:7;i:21;i:8;i:22;i:9;i:23;i:10;i:24;i:11;i:26;i:12;i:28;i:13;i:29;i:14;i:30;i:15;i:31;i:16;i:32;i:17;i:35;i:18;i:37;i:19;i:38;i:20;i:39;i:21;i:40;i:22;i:41;i:23;i:42;i:24;i:43;i:25;i:44;i:26;i:45;i:27;i:46;i:28;i:47;i:29;i:48;i:30;i:49;i:31;i:50;i:32;i:51;i:33;i:52;i:34;i:53;i:35;i:54;i:36;i:56;i:37;i:57;i:38;i:59;i:39;i:61;i:40;i:63;i:41;i:64;i:42;i:65;i:43;i:66;i:44;i:70;i:45;i:71;i:46;i:72;i:47;i:73;i:48;i:76;i:49;i:78;i:50;i:82;i:51;i:84;i:52;i:86;i:53;i:87;i:54;i:94;i:55;i:95;i:56;i:96;i:57;i:99;i:58;i:101;i:59;i:102;i:60;i:103;i:61;i:104;i:62;i:106;i:63;i:107;i:64;i:108;i:65;i:109;i:66;i:110;i:67;i:113;i:68;i:114;i:69;i:115;i:70;i:117;i:71;i:118;i:72;i:119;i:73;i:121;i:74;i:123;i:75;i:124;i:76;i:125;i:77;i:126;i:78;i:128;i:79;i:129;i:80;i:131;i:81;i:132;i:82;i:134;i:83;i:136;i:84;i:138;i:85;i:139;i:86;i:140;i:87;i:141;i:88;i:142;i:89;i:143;i:90;i:144;i:91;i:145;i:92;i:146;i:93;i:148;i:94;i:149;i:95;i:150;i:96;i:151;i:97;i:152;i:98;i:158;i:99;i:160;i:100;i:165;i:101;i:166;i:102;i:168;i:103;i:174;i:104;i:177;i:105;i:179;i:106;i:180;i:107;i:181;i:108;i:182;i:109;i:183;i:110;i:189;i:111;i:193;i:112;i:196;i:113;i:202;i:114;i:203;i:115;i:208;i:116;i:209;i:117;i:211;i:118;i:214;i:119;i:216;i:120;i:218;i:121;i:219;i:122;i:221;i:123;i:222;i:124;i:224;i:125;i:225;i:126;i:231;i:127;i:233;i:128;i:238;i:129;i:239;i:130;i:240;i:131;i:241;i:132;i:242;i:133;i:243;i:134;i:245;i:135;i:250;i:136;i:252;i:137;i:254;i:138;i:255;i:139;i:256;i:140;i:259;i:141;i:262;i:142;i:263;i:143;i:267;i:144;i:268;i:145;i:269;i:146;i:270;i:147;i:273;i:148;i:280;i:149;i:284;i:150;i:285;i:151;i:289;i:152;i:293;i:153;i:297;i:154;i:300;i:155;i:301;i:156;i:302;i:157;i:303;i:158;i:305;i:159;i:308;i:160;i:309;i:161;i:311;i:162;i:312;i:163;i:316;i:164;i:317;i:165;i:342;i:166;i:346;i:167;i:352;i:168;i:354;i:169;i:360;i:170;i:361;i:171;i:363;i:172;i:372;i:173;i:385;i:174;i:388;i:175;i:390;i:176;i:392;i:177;i:394;i:178;i:396;i:179;i:397;i:180;i:398;i:181;i:401;i:182;i:403;i:183;i:404;i:184;i:406;i:185;i:407;i:186;i:408;i:187;i:409;i:188;i:410;i:189;i:411;i:190;i:412;i:191;i:413;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:45:\\\"\\u0000App\\\\Jobs\\\\UploadVideoNotificationJob\\u0000video_id\\\";i:4;s:44:\\\"\\u0000App\\\\Jobs\\\\UploadVideoNotificationJob\\u0000teacher\\\";s:34:\\\"مستر أحمد المحلاوى\\\";}\"}}', 0, NULL, 1717345674, 1717345674);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `video_url` text COLLATE utf8mb4_unicode_ci,
  `img_caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `lessons` (`id`, `title`, `description`, `video_url`, `img_caption`, `subject_id`, `school_grade_id`, `teacher_id`, `date_show`, `deleted_at`, `created_at`, `updated_at`, `unit_id`, `duration`, `free`) VALUES
(1, 'الاتزان', NULL, 'Facebook.mp4', 'captions/Screenshot_4.png', 1, 1, 1, '2024-03-01', NULL, '2024-05-24 04:31:59', '2024-05-31 04:41:44', 1, 120, 1),
(2, 'الاتزان', NULL, 'Facebook.mp4', 'captions/Screenshot_4.png', 1, 1, 1, '2024-03-01', NULL, '2024-05-24 04:31:59', '2024-05-31 05:04:16', 1, 120, 0),
(3, 'درس النزين', 'البنزين (أو البِنْزِن، البنزول، البنزين الحلقي) هو سائل عديم اللون وأحد مركبات البنزين (الوقود) متطاير وأبخرته شديدة الاشتعال هو من المواد المسرطنة وله رائحة قوية ونفاذة وذو رائحة معسولة تشم بمحطات الوقود، تركيبته الكيميائية تتشكل من حلقة سداسية من الكربون والهيدروجين (C6H6) الحلقة السداسية للبنزين هي أبسط جزيء في الكيمياء العضوية العطرية هو أحد المكونات الطبيعية للزيت الخام ومن المذيبات الصناعية المهمة، ويستخدم في صناعة الأدوية واللدائن والمطاط الصناعي والأصبغة والنابالم.ويمكن صناعته من مكونات أخرى غير النفط. والبنزين من الهيدروكربونات الأروماتية وأبسطها على الإطلاق.', '[Cimawbas]].Ashghal.Shaqa.S01E06.mp4', 'captions/1674075919800.jpg', 1, 3, 1, '2024-03-01', NULL, '2024-06-02 17:19:35', '2024-06-02 17:20:12', 1, 120, 0),
(4, 'خواص البنزين', NULL, 'مسلسل_الكبير_أوي_الجزء_3_-_الحلقة_23(0).mp4', 'captions/2.svg', 1, 3, 1, '2024-03-01', NULL, '2024-06-02 17:27:54', '2024-06-02 17:28:19', 2, 40, 0);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `media_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_show` date NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free` tinyint NOT NULL DEFAULT '0' COMMENT '0==> not free,1==> free'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `title`, `description`, `media_url`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`, `url`, `date_show`, `caption`, `free`) VALUES
(1, 'شرح الاتزان', NULL, 'Mastering Machine Learning with Python in Six Steps A Practical Implementation Guide to Predictive Data Analytics Using Python by Manohar Swamynathan.pdf', 1, 1, 1, NULL, '2024-05-24 04:39:55', '2024-05-31 04:15:10', NULL, '2024-03-01', NULL, 1),
(2, 'شرح الاتزان', NULL, 'التعلم العميق_د علاء طعيمة.pdf', 1, 1, 1, NULL, '2024-05-24 04:39:55', '2024-05-24 04:40:20', NULL, '2024-03-01', NULL, 0),
(3, 'كتب الحث الكهرومغناطيسي وقانون فارادي', NULL, '', 1, 3, 1, NULL, '2024-06-02 17:52:11', '2024-06-02 17:53:46', NULL, '2024-03-01', NULL, 0),
(4, 'فيزياء الحث الكهرومغناطيسي', NULL, 'DL.pdf', 1, 3, 1, NULL, '2024-06-02 17:57:34', '2024-06-02 17:57:48', NULL, '2024-03-01', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(63, '2024_05_31_151743_create_register_tokens_table', 37);

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` bigint UNSIGNED NOT NULL,
  `month_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '09-2023',
  `year` mediumint DEFAULT NULL,
  `month` tinyint DEFAULT NULL,
  `month_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT 'status:(0 ==> show,1 ==> hide)',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `month_name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month_description` text COLLATE utf8mb4_unicode_ci,
  `cost` double(8,2) DEFAULT NULL,
  `orderValue` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `month_date`, `year`, `month`, `month_name`, `status`, `created_at`, `updated_at`, `teacher_id`, `month_name_ar`, `month_description`, `cost`, `orderValue`) VALUES
(1, '2024-03', 2024, 3, 'مارس', 0, '2024-05-23 02:36:52', '2024-05-23 02:36:52', 1, 'مارس', 'شهر مارس ل 2024', 250.00, 1),
(2, '2024-04', 2024, 4, 'أبريل', 0, '2024-05-24 09:37:10', '2024-05-24 09:37:27', 1, 'أبريل', 'شهر ابريل', 250.00, 1);

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
(1, 1, 1, 1, 1, 250, '2024-05-24 08:55:23', '2024-05-24 08:55:23'),
(2, 413, 1, 1, 1, 250, '2024-06-02 19:21:02', '2024-06-02 19:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin_code` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `value` double(8,2) DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `status` tinyint DEFAULT NULL COMMENT 'status:0 error,status:1 done',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `image_url`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'الاتزان الديناميكى', 'في هذا الشارح، سوف نتعلَّم كيف نُعرِّف الاتزان الديناميكي، ونوضِّح كيف يمكن حدوثه.\r\n\r\nدعونا نتناول التفاعل الكيميائي الانعكاسي الآتي: \r\nفي بداية التفاعل، كان تركيز كلٍّ من غاز الهيدروجين والنيتروجين مرتفعًا، في حين كان تركيز الأمونيا يساوي صفرًا لأنها كانت لم تنتج بعد.', 'posts/download.png', 1, 1, 1, NULL, '2024-05-24 07:27:12', '2024-05-24 07:27:12'),
(2, 'شرح الفيزياء الحديثة', 'الفيزياء الكلاسيكية هيا واحده من فروع علم الفيزياء اللى يهتم بدراسة الظواهر الحركية للأجسام والقوى المسببة لحركتها، وتعتمد فى دراساتها هذه على قوانين الحركة الخطية لنيوتن وقانون الجذب العام والتحليل الضوئي، ونظريات الاشعاع الكهرومغناطيسي (معادلات ماكسويل) لجيمس كلارك ماكسويل وقانون التعجيل المنتظم لجاليليو جاليلي وقانون حفظ المادة وقانون حفظ الطاقة وقوانين تانيه معاصرة ليها نتج عنها ظهور أو تطور فروع الفيزياء الكلاسيكية، كالديناميكا والهيدروداينمك وعلم توازن القوى والبصريات والديناميكا الحرارية وعلم الصوت والمغناطيسية والكهربائية.[1]\r\n\r\nمن سنة 1905 فصاعداً تمّ وضع القوانين والنظريات الفيزيائية الجديدة تحت مسمّى الفيزياء الحديثة، كنظرية النسبية لألبرت أينشتاين.[1]\r\n\r\n\r\nالفيزيا كلاسيكية بتهتم بظروف الحياة اليومية زى السرعة ( اقل من سرعة الضوء , والأحجام الاكبر من الذرات , الفيزيا الحديثة بتهتم بالسرعات الكبيرة والأحجام الصغيرة . شوف فيزيا\r\nكلمة فيزياء حديثة بتدل على الفترة الى بعد فترة نيوتن فى الفيزياء. وبتتفق مع البنية الاساسية لأصغر الجزيئات فى الطبيعة ( الميكانيكا الكمية ), و بتشرحلنا شرح دقيق عن التفاعلات الاساسية للجزيئات وبتتفهم على انها قوه. الفيزيا الحديثة بستخدم فى الظروف القاسية مثلا : التأثير الكمى بيطبق فى العادى على المسافات بتساوى تقريبا الذرات (تقريبا 10−9 متر = 1 نانومتر ) , نظرية النسبية بتتعامل مع سرعات بتساوى سرعة الضوء ( تقريبا 108 م/ث ), فى حين ان الفيزياء كلاسيكية بتتعامل مع المسافات الطويلة و السرعات القليلة ( اقل منسرعة الضوء ).\r\n\r\nفى الفيزيا الحديثة الوصف الكلاسيكى للظواهر الطبيعية مالهوش لزمة, وبشكل دقيق \"الحديث\" هو وصف واقع بيحتاج لدمج بين الميكانيكا الكمية و نظرية النسبية. وبشكل عام مصطلح \" حديث \" فى الفيزيا بتدل على اى فرع من فروع الفيزيا المتقدمة سواء فى اول القرن 20 او بعده او فروع بتتأثر بشكل كبير من بداية القرن 20.', 'posts/Quantum_time_dilation.webp.png', 1, 1, 1, NULL, '2024-05-31 22:39:20', '2024-05-31 22:39:20'),
(3, 'شرح النسبية', 'النسبية الخاصة (انجليزى: special relativity) او نظرية النسبية البالخصوص هى نظرية فى الفيزياء تقيس الاختلافات بالنسبة لاكتر من راصد يتحركون بسرعات مختلفة وثابتة, النظرية اقترحها البرت اينشتاين فى سنة 1905. النظرية تعمم قاعدة النسبية البالخصوص بجاليليو جاليلى اللى تقول أن أي حركة منتظمة عبارة عن حركة نسبية, ده معناه أنه لا وجود لحالة ثبات مطلقة. نظرية النسبية البالخصوص تقول أن سرعة الضوء ثابتة لأي راصد ولا تعتمد على حركة مصدر الضوء بالنسبة للراصد.', 'posts/Gedankenexperiment_Zeitdilitation.svg.png', 1, 1, 1, NULL, '2024-05-31 22:40:15', '2024-05-31 22:40:15'),
(4, 'شرح فيزياء', 'الفِيزِيَاءُ أو علم الفيزياء أو الفِيزِيقَا (من الإغريقية: φυσική)، وتُسَمّى أيضًا بـ الطَبِيعِيَّاتِ أو عِلْمِ الطَبِيعَةِ هو العلم الذي يدرس المفاهيم الأساسية مثل الطاقة، القوة،(1) والزمان، وكل ما ينبع من هذا، مثل الكتلة، المادة وحركتها.(2) وعلى نطاق أوسع، هو التحليل العام للطبيعة، والذي يهدف إلى فهم كيف يعمل الكون.\r\n\r\nوتحاول الفيزياء أن تفهم الظواهر الطبيعية والقوى والحركة المؤثرة في سيرها، وصياغة المعرفة في قوانين لا تفسر العمليات السالفة فقط بل التنبؤ بمسيرة العمليات الطبيعية بنماذج تقترب رويدًا رويدًا من الواقع.\r\n\r\nيعتبر علم الفيزياء من أحد أقدم التّخصصات الأكاديمية، فقد بدأت بالبزوغ منذ العصور الوسطى، وتميّزت كعلمٍ حديثٍ في القرن السابع عشر، وباعتبار أن أحد فروعها، وهو علم الفلك، يعد من أعرق العلومِ الكونيةِ على الإطلاقِ. خلال معظم الألفي سنةِ الماضيةِ، كانت الفيزياء (علم الطبيعة) والكيمياء وعلم الأحياء وبعض فروع الرياضيات، جزءً من الفلسفة الطبيعية، ولكن خلال الثورة العلمية في القرن السابع عشر ظهرت هذه العلوم الطبيعية كمساعي بحثية فريدة في حد ذاتها. تتقاطع الفيزياء مع العديد من مجالات البحث متعددة التخصصات، مثل الفيزياء الحيوية والكيمياء الكمومية، وحدود الفيزياء التي لم يتم تعريفها بشكل صارم. غالبًا ما تشرح الأفكار الجديدة في الفيزياء الآليات الأساسية التي تدرسها علوم أخرى وتقترح طرقًا جديدة للبحث في التخصصات الأكاديمية مثل الرياضيات والفلسفة.', 'posts/Natural-Language-Processing-Uses-In-Industry.jpg', 1, 3, 1, NULL, '2024-05-31 22:44:30', '2024-05-31 22:44:30'),
(5, 'بنزين (مركب كيميائي)', 'البنزين (أو البِنْزِن، البنزول، البنزين الحلقي) هو سائل عديم اللون وأحد مركبات البنزين (الوقود) متطاير وأبخرته شديدة الاشتعال هو من المواد المسرطنة وله رائحة قوية ونفاذة وذو رائحة معسولة تشم بمحطات الوقود، تركيبته الكيميائية تتشكل من حلقة سداسية من الكربون والهيدروجين (C6H6) الحلقة السداسية للبنزين هي أبسط جزيء في الكيمياء العضوية العطرية هو أحد المكونات الطبيعية للزيت الخام ومن المذيبات الصناعية المهمة، ويستخدم في صناعة الأدوية واللدائن والمطاط الصناعي والأصبغة والنابالم.ويمكن صناعته من مكونات أخرى غير النفط. والبنزين من الهيدروكربونات الأروماتية وأبسطها على الإطلاق.', 'posts/Benzene_geometrie.svg.png', 1, 3, 1, NULL, '2024-06-02 17:14:39', '2024-06-02 17:14:39');

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
(5, '1', 'questions/FB-IMG-1-1291 (1).jpg', NULL, 'اختيارات', NULL, NULL, '[\"شدة تيار الموصل\",\"شدة تيار الموصل 2\",\"شدة تيار الموصل 3\",\"شدة تيار الموصل 4\"]', 'شدة تيار الموصل', 1, 1, 1, 1, NULL, '2024-05-25 13:35:53', '2024-05-25 13:36:11', 1),
(6, '3', 'questions/1.png', 'حسيم يتحرك على خط مستقيم', 'اختيارات', NULL, 'حسيم يتحرك على خط مستقيم', '[\"7 ي\",\"-3 ي\",\"10 ي\",\"-10 ي\"]', '-3 ي', 1, 1, 1, 1, NULL, '2024-05-26 16:56:10', '2024-05-26 16:56:10', 1),
(7, '3', 'questions/2.png', NULL, 'اختيارات', NULL, NULL, '[\"25 كولوم\",\"15 كولوم\",\"1.5 كولوم\",\"لا توجد اجابة صحيحة\"]', 'لا توجد اجابة صحيحة', 1, 1, 1, 1, NULL, '2024-05-26 17:19:09', '2024-05-26 17:19:09', 1),
(8, '1', 'questions/3.png', NULL, 'اختيارات', NULL, NULL, '[\"a\",\"b\",\"c\",\"لا توجد اجابة صحيحة\"]', 'c', 1, 1, 1, 1, NULL, '2024-05-26 17:27:58', '2024-05-26 17:27:58', 1),
(9, '3', 'questions/4.png', '1-المقاومه الكليه لمقاومتين متساويتيين على التوازى ............قيمتهما على التوالى', 'اختيارات', NULL, '1-المقاومه الكليه لمقاومتين متساويتيين على التوازى ............قيمتهما على التوالى', '[\"ضعف\",\"نص\",\"ربع\",\"أربع أمثال\"]', 'ربع', 1, 1, 1, 1, NULL, '2024-05-27 18:31:56', '2024-05-27 18:31:56', 3),
(10, '2', NULL, '2- النسبه المئويه بين فرق الجهد بين طرفى بطاريه والقوه الدافعه الكهربيه لها', 'اختيارات', NULL, '2- النسبه المئويه بين فرق الجهد بين طرفى بطاريه والقوه الدافعه الكهربيه لها', '[\"كفائه البطاريه\",\"قانون اوم للدوائر المغلقه\",\"شده التيار الكلى\",\"المقاومه المكافئه\"]', 'كفائه البطاريه', 1, 1, 1, 1, NULL, '2024-05-27 18:41:22', '2024-05-27 18:41:22', 3),
(11, '2', NULL, '3- عندما يزداد نصف القطر للسلك الى الضعف فان شده التيار...........', 'اختيارات', NULL, NULL, '[\"تزداد للضعف\",\"تقل للنصف  تظل ثابته\",\"تزداد لاربع أمثال\",\"يقل للربع\"]', 'تزداد لاربع أمثال', 1, 1, 1, 1, NULL, '2024-05-27 18:44:20', '2024-05-27 18:44:20', 3),
(12, '2', NULL, '4- عن زياده شده التيار المار فى موصل للضعف فان مقاومته', 'اختيارات', NULL, NULL, '[\"تزداد للضعف\",\"تقل للنصف\",\"تقل لاربع امثال\",\"تظل ثابته\",\"تزداد لاربع امثال\"]', 'تظل ثابته', 1, 1, 1, 1, NULL, '2024-05-27 18:47:22', '2024-05-27 18:47:22', 3),
(13, '2', NULL, '5-مقاومتان ع التوازى قيمه احدهما 5 اوم تكون المقاومه المكافئه لها...............5اوم', 'اختيارات', NULL, NULL, '[\"اكبر\",\"أصغر\",\"يساوى\"]', 'أصغر', 1, 1, 1, 1, NULL, '2024-05-27 18:51:28', '2024-05-27 18:51:28', 3),
(14, '1', 'questions/5.png', NULL, 'اختيارات', NULL, NULL, '[\"اضاءه مصباح 1 اكبر\",\"اضاءه مصباح 2 اكبر\",\".اضاءتهما متساويه\"]', 'اضاءه مصباح 2 اكبر', 1, 1, 1, 1, NULL, '2024-05-27 18:54:04', '2024-05-27 18:54:04', 3),
(15, '2', NULL, 'جول/اوم.كلوم      تكافئ', 'اختيارات', NULL, NULL, '[\"فولت\",\"وات\",\"أمبير\",\"نيوتن\",\"ثانية\"]', 'أمبير', 1, 1, 1, 1, NULL, '2024-05-27 18:56:42', '2024-05-27 18:56:42', 3);

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
(26, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 5, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 5, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 5, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 5, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 5, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 5, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 6, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 6, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 6, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 6, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 6, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 6, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 6, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 6, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 6, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 6, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question_exam_students`
--

CREATE TABLE `question_exam_students` (
  `id` bigint UNSIGNED NOT NULL,
  `student_answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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

--
-- Dumping data for table `question_exam_students`
--

INSERT INTO `question_exam_students` (`id`, `student_answer`, `exam_id`, `user_id`, `question_id`, `subject_id`, `school_grade_id`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'ضعف', 6, 413, 6, NULL, 3, NULL, NULL, '2024-06-03 19:28:46', '2024-06-03 19:28:46'),
(3, 'تزداد للضعف', 6, 413, 12, NULL, 3, NULL, NULL, '2024-06-03 19:28:46', '2024-06-03 19:28:46'),
(4, 'تقل', 6, 411, 6, NULL, 3, NULL, NULL, '2024-06-03 19:28:46', '2024-06-03 19:28:46'),
(5, 'تقل', 6, 411, 12, NULL, 3, NULL, NULL, '2024-06-03 19:28:46', '2024-06-03 19:28:46'),
(6, 'ربع', 6, 413, 9, NULL, 3, NULL, NULL, '2024-06-03 19:28:46', '2024-06-03 19:28:46'),
(7, 'تقل', 6, 411, 9, NULL, 3, NULL, NULL, '2024-06-03 19:28:46', '2024-06-03 19:28:46');

-- --------------------------------------------------------

--
-- Table structure for table `rechagre_balance`
--

CREATE TABLE `rechagre_balance` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_grades`
--

INSERT INTO `school_grades` (`id`, `name`, `description`, `teacher_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'الصف الثالث الثانوى عام', NULL, 1, NULL, '2024-05-22 17:27:32', '2024-05-22 17:28:20'),
(2, 'الصف الثانى الثانوى', NULL, 1, NULL, '2024-05-22 17:27:56', '2024-05-22 17:27:56'),
(3, 'الصف الاول الثانوى', NULL, 1, NULL, '2024-05-22 17:28:08', '2024-05-22 17:28:08'),
(4, 'الصف الثالث الاعدادى', NULL, 1, NULL, '2024-05-31 15:38:29', '2024-05-31 15:38:29');

-- --------------------------------------------------------

--
-- Table structure for table `sessionslive`
--

CREATE TABLE `sessionslive` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `serviceName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'zoom,google meet',
  `creds` json DEFAULT NULL COMMENT 'public key,secret key',
  `teacher_id` bigint UNSIGNED NOT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0 ==> in active  , 1 ==> active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessionslive`
--

INSERT INTO `sessionslive` (`id`, `name`, `photo`, `link`, `description`, `serviceName`, `creds`, `teacher_id`, `unit_id`, `school_grade_id`, `active`, `created_at`, `updated_at`) VALUES
(3, 'مراجعة ليلة الامتحان لطلبة 3 ثانوى الحث الكهرومغناطيسى', 'sessions/3.png', 'https://youtube.com', NULL, 'zoom', NULL, 1, 2, 1, '1', '2024-05-29 09:33:00', '2024-05-29 09:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `static_exams`
--

CREATE TABLE `static_exams` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_degree` double(8,2) NOT NULL,
  `total_degree` double(8,2) NOT NULL,
  `exam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'file ==> pdf',
  `user_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `school_grade_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `static_exams`
--

INSERT INTO `static_exams` (`id`, `title`, `description`, `student_degree`, `total_degree`, `exam`, `user_id`, `teacher_id`, `school_grade_id`, `created_at`, `updated_at`) VALUES
(1, 'امتحان الطالب ندى ايهاب عبد الوهاب', '', 15.00, 20.00, 'sessions/ملف دكتور محمود .pdf', 187, 1, 1, '2024-05-29 14:34:16', '2024-05-29 14:34:16'),
(2, 'امتحان الطالب nada youssery', '', 15.00, 20.00, 'sessions/document_12.pdf', 413, 1, 3, '2024-06-02 19:05:26', '2024-06-02 19:05:26');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `email`, `img_url`, `email_verified_at`, `password`, `remember_token`, `subject_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'مستر أحمد المحلاوى', 'almahalwy@gmail.com', 'teachers/1948100_0.jpeg', NULL, '$2y$10$K5l4KX51qGqT2kY5R/0aE.kw6WKAut/v7/eww5SU5e5zZ5UKYasxK', NULL, 1, NULL, NULL, '2024-05-29 23:29:08'),
(2, 'مستر مصطفى ابراهيم', 'mostafa@marin.live', 'teachers/en-admin-1.png', NULL, '$2y$10$0qqnt5LCiCA9YHctGijWXewcIm6mmtRMi6cDY6NO/cg.hi61fN66u', NULL, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_settings`
--

CREATE TABLE `teacher_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` longtext COLLATE utf8mb4_unicode_ci,
  `avater` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiktok` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_settings`
--

INSERT INTO `teacher_settings` (`id`, `teacher_id`, `phonenumber`, `whatsapp`, `bio`, `avater`, `facebook`, `youtube`, `instagram`, `tiktok`, `linkedin`, `telegram`, `subject`, `address`, `city`, `state`, `created_at`, `updated_at`) VALUES
(6, 1, '01023065856', '01091536978', 'i am josse morinoh', '', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'https://www.facebook.com/elking.ahmed.35175', 'لغة عربية', 'الازبكية - شارع الوايلى', 'الزمالك', 'cairo', '2024-05-27 04:58:07', '2024-05-27 04:58:29');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_grade_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `title`, `description`, `school_grade_id`, `teacher_id`, `subject_id`, `created_at`, `updated_at`) VALUES
(1, 'الاتزان', NULL, 1, 1, 1, '2024-05-24 04:31:27', '2024-05-24 04:31:27'),
(2, 'الحث الكهرومغتاطيسى', 'الحث الكهرومغتاطيسى', 1, 1, 1, '2024-05-27 18:22:04', '2024-05-27 18:22:04'),
(3, 'التيار الكهربي وقانون أوم', NULL, 1, 1, 1, '2024-05-27 18:22:46', '2024-05-27 18:22:46'),
(4, 'التأثير المغناطيسي للتيار الكهربي وأجهزة القياس', NULL, 1, 1, 1, '2024-05-27 18:23:04', '2024-05-27 18:23:04'),
(5, 'دوائر التيار المتردد', NULL, 1, 1, 1, '2024-05-27 18:23:33', '2024-05-27 18:23:33'),
(6, 'ازدواجية الموجة والجسيم', NULL, 1, 1, 1, '2024-05-27 18:23:56', '2024-05-27 18:23:56'),
(7, 'الطيف الذري', NULL, 1, 1, 1, '2024-05-27 18:24:15', '2024-05-27 18:24:15'),
(8, 'الإلكترونيات الحديثة', NULL, 1, 1, 1, '2024-05-27 18:24:36', '2024-05-27 18:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` int DEFAULT NULL COMMENT '1:male,0:femal',
  `phonenumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_parent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `government` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `all_points` int NOT NULL DEFAULT '0',
  `active_points` int NOT NULL DEFAULT '0',
  `profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'profile image',
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `school_grade_id` bigint UNSIGNED DEFAULT '0',
  `group_id` bigint DEFAULT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_exam` smallint NOT NULL DEFAULT '0',
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `gender`, `phonenumber`, `phone_parent`, `government`, `email_verified_at`, `password`, `all_points`, `active_points`, `profile`, `subject_id`, `school_grade_id`, `group_id`, `teacher_id`, `remember_token`, `status_exam`, `provider_id`, `provider`, `created_at`, `updated_at`) VALUES
(2, 'Mostafa', 'mostafaibrahem@icloud.com', NULL, '01273292170', '01023666603', 'الغربية', NULL, '$2y$10$53tKgHPMdKkZiQT/X2aVoOOL6KjOUZtttwzPYxz9mSX9kMHKY7MYG', 0, 0, NULL, NULL, 3, 1, NULL, NULL, 0, NULL, NULL, '2023-10-01 04:29:17', '2023-10-01 04:29:17'),
(3, 'khaled nasser shebl', 'khaled1@example.com', NULL, '01113305998', '01007056732', 'الجيزة', NULL, '$2y$10$9FmnXt9KVpIXSBZUEMTMSe5FXB1giTq71Td8.oYieaJZqKSx1bPvC', 0, 0, NULL, NULL, 3, 1, NULL, NULL, 1, NULL, NULL, '2023-10-03 06:03:34', '2023-10-17 00:54:26'),
(4, 'Abo sallam', 'sall@gmail.com', NULL, '01066435330', '01065536856', 'البحيرة', NULL, '$2y$10$SOP.MDCCA6wh60CqXbp3Be6oLkYsIAjGM5JfLl68eQY3IYOsCeFfC', 350, 350, NULL, 2, 3, 4, 2, NULL, 0, NULL, NULL, '2023-10-03 23:11:12', '2023-10-05 13:04:20'),
(5, 'أحمد جمال', 'ahmgamal372@gmail.com', NULL, '01091536978', '01016204667', 'دمياط', NULL, '$2y$10$0S.yTo/uedxs10fNbRGjIOzObEf1cZfcA.CcQXOajMTvI5ko83Oj.', 350, 0, 'users/slider-2.jpg', 1, 1, 1, 1, NULL, 0, NULL, NULL, '2023-10-05 05:44:20', '2023-10-05 13:05:26'),
(6, 'Mohamed alaa ahmed masoud', 'mohamedmasoud521@gmail.com', NULL, '01125593778', '01021553902', 'الغربية', NULL, '$2y$10$12lWbUf8HQ.SRF4Ig1x1JeAo0JZchEmw3aigMUTnpbVPWD2qqX06i', 350, 0, NULL, 2, 2, 3, 2, NULL, 0, NULL, NULL, '2023-10-05 12:07:47', '2023-10-26 06:49:02'),
(7, 'ahmed gamal web', 'ake@gmail.com', NULL, '01014151617', '01016201415', 'الدقهلية', NULL, '$2y$10$Y9GCFm667P0lNdvnjjwMt.NodeqUZuvVh7xH/PvKPU65rs4s26UKS', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-10-05 13:14:09', '2023-10-05 13:14:09'),
(8, 'ahmed web', 'ak22e@gmail.com', NULL, '01012141515', '01014151212', 'الفيوم', NULL, '$2y$10$7AiT9za9RK2SmKKFavrZf.Z2fDnywRKt1q/1/HB9yQVdTyTf/kHoC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-05 13:25:32', '2023-10-05 13:25:32'),
(9, 'ahmed gama web 3', 'ah@gmail.com', NULL, '01014151819', '01014151716', 'الفيوم', NULL, '$2y$10$xCeS4uzfm.NvgHhzs6OFIOasZD9IG2CF.oT22RCv7gNF6uqtzEMuy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-05 13:28:50', '2023-10-05 13:28:50'),
(10, 'Test', 'test@gmail.com', NULL, '01234567890', '01234567891', 'البحيرة', NULL, '$2y$10$Z0iHoYZ89tyqFIF0QrPFFeTEB6vUQa6E/p3br6DhOBs/m4iGPU3wG', 200, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2023-10-05 13:31:39', '2023-10-05 13:33:20'),
(11, 'محمد اسلام الجمال', 'ameeraalsukary79@gmail.com', NULL, '01030972740', '01285143934', 'الغربية', NULL, '$2y$10$MNA7vo3lnrLyHlTo71AtBOAWFce3DItsQqIeg5PK6AdKTopCgE3rW', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-10-07 05:57:57', '2023-10-07 05:57:57'),
(12, 'toto moto', 'mohamedmasoud531@gmail.com', NULL, '01125793778', '01021553902', 'الغربية', NULL, '$2y$10$efvOpU3XQnv6cfiBYz2lZui/oyX7uEe/ccVmQbEzoFIeOq3q/R1Ey', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-07 06:55:14', '2023-10-07 06:55:14'),
(13, 'Ibrahim mostafa', 'hemamostafa379@gmail.com', NULL, '01558557615', '01203817595', 'الغربية', NULL, '$2y$10$l496XkJpyJ/QYkWuMHl4qeG.ozNuStjJI4PywFZftucwdu8pb8oB.', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-10-07 08:36:59', '2023-10-07 08:36:59'),
(14, 'Habiba Morad', 'moradhabiba0@gmail.com', NULL, '01021232676', '01091250900', 'الغربية', NULL, '$2y$10$t3qbcEYxJ7DAHopgzulXieAw2I/3snFu5d/823KlJeSF3L/AWCSZO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-07 22:37:50', '2023-10-07 22:37:50'),
(15, 'Malak abo eldahab', 'malakaboeldahab295@gmail.com', NULL, '01280661727', '01226635096', 'الغربية', NULL, '$2y$10$UkfqBiwMirzjIadHwmm/ZO6de5jcKuX5eF55UKN/teZBPkW7Ou0ey', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-08 07:14:04', '2023-10-08 07:14:04'),
(16, 'Hossam elgazzar', 'hossamelgazzar50@icloud.com', NULL, '01288383038', '01022020497', 'الغربية', NULL, '$2y$10$Xcg.aryeVkK00Y0wRS0vveA.KDTPj85XgeAJ83FcDc/XcIAxfN2Ly', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 07:28:56', '2023-10-08 07:28:56'),
(17, 'Zekra eid', 'zekraeid417@gmail.com', NULL, '01205589530', '01288485817', 'الغربية', NULL, '$2y$10$6Nx8m6PqjAW6TldmTJ6pVuabAR5NIMeTnXar6vvPdZDdC42SHf/K.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-08 08:20:18', '2023-10-08 08:20:18'),
(18, 'Omar Aboelkhair', 'omarahmedaboelkair666@gmail.com', NULL, '01124074098', '01061594955', 'الغربية', NULL, '$2y$10$NS.aH.f8WKO7dNEIflboH.xoOkzgyO3MuhJ6wPrJkyU0sUyc4kCG2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-08 15:00:47', '2023-10-08 15:00:47'),
(19, 'Abd ELRhman Allam', 'mbedo2203@gmail.com', NULL, '01091160556', '01063820991', 'الغربية', NULL, '$2y$10$NUndlYVGvcGEtvrctu9qIepJADCjEhF03j4TjtGVXBaSw4EGmENie', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 20:05:44', '2023-10-08 20:05:44'),
(20, 'يوسف احمد', 'tnt312gg@gmail.com', NULL, '01063997663', '01091501888', 'الغربية', NULL, '$2y$10$Iukl4EigIHaWxje3RU7QAe7.g76OS.I/5R3pnTNTT2jwskpJn9J7q', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 20:09:15', '2023-10-08 20:09:15'),
(21, 'KitKat', 'ghalwashhabiba @gmil.com', NULL, '01206949106', '01020012079', 'الغربية', NULL, '$2y$10$E3YMI1rn/o/SGPMeQj8ekuaBcpripaWbsFmlLHqWVuqQlr2w74nHS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 21:53:04', '2023-10-08 21:53:04'),
(22, 'هنا عبد الرازق', 'hk3916193@gmail.com', NULL, '01026816485', '01229740653', 'الغربية', NULL, '$2y$10$rKcS95M.1OcKSqRsvecXuex4KDOU/G02xseTBJvTcXEnydjvF9E6m', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 22:28:03', '2023-10-08 22:28:03'),
(23, 'لبني محمد علي', 'mohamedlobna692@gmail.com', NULL, '01014185401', '01279743112', 'الغربية', NULL, '$2y$10$Lf/sPL99V7zPqPrBw2VKTOivRkuW8iWFm4q7HVI9vtyfM4fL.niva', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 23:15:07', '2023-10-08 23:15:07'),
(24, 'نادين', 'nadinabeed@yahoo.com', NULL, '01205579268', '01221255755', 'الغربية', NULL, '$2y$10$/ZKIkMCcnMsW00ZVtajlVegGwbaK7.cMD.YNwo6NUt7.hn3ZdjNxa', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-08 23:36:34', '2023-10-08 23:36:34'),
(25, 'نور شريف', 'nourshiref267@gmail.com', NULL, '01206247856', '01221760110', 'الغربية', NULL, '$2y$10$wR4pnrczzQNS.WG.4tvXWOx.XtopVcO2x8zh51t0GEGb.7JQDqaQu', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-10-09 00:28:13', '2023-10-09 00:28:13'),
(26, 'رؤى رفعت كمال', 'roaarefaat66@gmail.com', NULL, '01099397445', '01004536240', 'الغربية', NULL, '$2y$10$/rXd8E1ub9U7WONjfW7FGOyazXZk9Tx7xQIAYdV4KxHeFXIOlZ/Zq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 01:25:07', '2023-10-09 01:25:07'),
(27, 'مريم عبد الفتاح', 'meroooooo169@gmail.com', NULL, '01227970052', '01282472016', 'الغربية', NULL, '$2y$10$j4N.lj.5K4jP7hBIXguBVOc3s5Im2eBpDhmqW96nRoLGkwVdhxj22', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-09 01:28:43', '2023-10-09 01:28:43'),
(28, 'Safy adel', 'safyelhalwagy0@gmail.com', NULL, '01550115712', '01554165250', 'الغربية', NULL, '$2y$10$LCn78solSOGNazXQ4blgP.4gNWcseMp0MsMioeiz/C2hSNSIs3O4u', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 01:28:51', '2023-10-09 01:28:51'),
(29, 'جنا وليد هيكل', 'hikalj4@gmail.com', NULL, '01554543249', '01026760408', 'الغربية', NULL, '$2y$10$ydGBrsmp/hS3s9xfhfyy5utboC0r/SQmJeLjV9IKEf/Z7XdwCgY1S', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 01:33:05', '2023-10-09 01:33:05'),
(30, 'Nabil Elmahdy', 'nabilelmahdy512@gmail.com', NULL, '01207282611', '01207282611', 'الغربية', NULL, '$2y$10$s3NO4MkAgu.b68bao/QlSeSCnpzODeT0HOoSnIIpi7BflMAalg/DW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 01:53:41', '2023-10-09 01:53:41'),
(31, 'Mai Zidan', 'mai25zidan@gmail.com', NULL, '01275893886', '01065891558', 'الغربية', NULL, '$2y$10$NyFrWVp7NTBW8Hi4MQdR0ev6SYcMPqbXn4mNGg3QZfkKkwvwo62Ym', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 02:57:57', '2023-10-09 02:57:57'),
(32, 'Mohamed Zeid', 'mezozeid1@gmail.com', NULL, '01067182560', '01009765131', 'الغربية', NULL, '$2y$10$kGj3HhE0LcquxgHXM2RqlOGrRZHH.bUzuoiBGQUGBgnQ/qC/Ijozm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 04:19:16', '2023-10-09 04:19:16'),
(33, 'مريم ابو اليزيد', 'mero60748@gmail.com', NULL, '01091479772', '01068713748', 'الغربية', NULL, '$2y$10$b6QRlyjjDPFC998rdVvCjuoxJSZ3MmVQ/mo/G5tj3I3FhElhRZOIW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-09 04:50:14', '2023-10-09 04:50:14'),
(34, 'Ziad amr', 'ziadeladl919@gmail.com', NULL, '01067975073', '01095581186', 'الغربية', NULL, '$2y$10$ScqGrJO8Utk3efdAfIovF.J1clmRA/JlXgQBJqD32XG5xSC8AdCuO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-09 05:06:24', '2023-10-09 05:06:24'),
(35, 'haneen hussein', 'haneenhussein@gmail.com', NULL, '01208169765', '01282827979', 'الغربية', NULL, '$2y$10$fqRLPn.Ox2JPGuGwdmJ0Y.cp6TdEI4iZ/mzJpAie3vXCrY10Pli66', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 05:18:30', '2023-10-09 05:18:30'),
(36, 'رؤي احمد الغنام', 'roaaelghnam183@gmail.com', NULL, '01028526518', '01014050941', 'الغربية', NULL, '$2y$10$fu/yjFwJpO4inwpnr71fpu1Q4wnpig11gwU0MWOToi5KsWpSv18n6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-09 05:25:58', '2023-10-09 05:25:58'),
(37, 'مؤمن رمضان برهومه', 'momenbarhoma380@gmail.com', NULL, '01028579458', '01220704661', 'الغربية', NULL, '$2y$10$XoIEJj5YHUu6jKXxAwDuyO67OQYzw542yTkZAC71WDjh64U7FOT.y', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 05:32:34', '2023-10-09 05:32:34'),
(38, 'احمد محمد النجار', 'ae461415@gmail.com', NULL, '01122630156', '01227261967', 'الغربية', NULL, '$2y$10$AkHoGybIKAklTn9CZk7Qw.2.iDWpbauFBDEjiZML.NxxVeqJODavW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 07:06:17', '2023-10-09 07:06:17'),
(39, 'روان علي ابو المجد', 'rawanali557@gmail.com', NULL, '01221677603', '01208436688', 'الغربية', NULL, '$2y$10$NRPN5Ihueq2fe4wR9ugkRupSz33WWpX5rQsMf.4iyyGA7CraFyKIu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 09:58:51', '2023-10-09 09:58:51'),
(40, 'Mariam Elsendiony', 'mariamelsendiony20@gmail.com', NULL, '01012533484', '01093803781', 'الغربية', NULL, '$2y$10$OSsOiyw0XkNmnEQMqoX7w.Qnc7LBiPzg6hXrrahO.MumZ1VEhLCAW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 10:14:47', '2023-10-09 10:14:47'),
(41, 'Kemo Diab', 'kareemdiab222@gmail.com', NULL, '01005648809', '01027649264', 'الغربية', NULL, '$2y$10$zfM6dn8slq1JMbhSsM3fiuWszuUA140BgCYF0gEUzIRm/BVC3wkmK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 14:41:33', '2023-10-09 14:41:33'),
(42, 'محمود ابراهيم', 'mahmoudibrahimsaad792@gmail.com', NULL, '01274621620', '01220503937', 'الغربية', NULL, '$2y$10$aYJxBjHk16Q.GJe8zNXxo.354gIZrCQbSgI9CBX.gPcvejtLi9fEm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 20:13:08', '2023-10-09 20:13:08'),
(43, 'نور مدحت شبل', 'nourmedhat681@gmail.com', NULL, '01065084884', '01021976688', 'الغربية', NULL, '$2y$10$0buYNchQg1B1CtExcvgbQerkzR315YB4E/Ys3ZUoCcYahEnk.rsCK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 21:21:09', '2023-10-09 21:21:09'),
(44, 'ادهم عصام السيد عبدالفتاح البلتاجي', 'eladham955@gmail.com', NULL, '01019331730', '01067939060', 'الغربية', NULL, '$2y$10$T.Ep9ReVu2BzmhUMfh6YCuoYGezdc6PPh74U.bmbpccjz76RlrmG6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 22:01:23', '2023-10-09 22:01:23'),
(45, 'رنا غريب احمد مراد', 'moradrana891@gmail.com', NULL, '01066790802', '01001895041', 'الغربية', NULL, '$2y$10$KGW8xAEHjk62oFHq3Q1Tgu3wtSaB.5w6LR.fsbFADNu4oIkOZR8s2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-09 22:21:34', '2023-10-09 22:21:34'),
(46, 'Sara adel', 'saraadelsaleh2005@gmail.com', NULL, '01554052588', '01553117979', 'الغربية', NULL, '$2y$10$grueRgPRYGgVQA6Gs6BBGOBOaPRLaipz3n3pbLJ9xU/KIcwatoS.W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 00:01:33', '2023-10-10 00:01:33'),
(47, 'hanna mohamed rady', 'hanarady612@gmail.com', NULL, '01062330990', '01024777620', 'الغربية', NULL, '$2y$10$QvR0P12fT.J/PJV10xszXuIsB9JOR.ifX77xJ2Eb/RcbNKvA9/VpO', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 00:17:03', '2023-10-10 00:17:03'),
(48, 'احمد سمير', 'ahmedwelahly@gmail.com', NULL, '01022826071', '01063385088', 'الغربية', NULL, '$2y$10$AyLN6ZTt1aMOIgwoDTdwB.t/yVqDI.SMI/01uYPNegiceIveCcD8K', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 00:44:25', '2023-10-10 00:44:25'),
(49, 'Sara Elsayed', 'sarasyaed778@gmail.com', NULL, '01015636426', '01008152517', 'الغربية', NULL, '$2y$10$E1gtjQxevda3t8zS2wRwJOJoMVWLVd1FwyIHwcJxn8LIw91DKqrYG', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 01:16:34', '2023-10-10 01:16:34'),
(50, 'youssef asal', 'yasal2773@gmail.com', NULL, '01550580169', '01097708283', 'الغربية', NULL, '$2y$10$hXCnmQ.VN1wNwfiGj..zf.wSW/duUtg217vUuD799ui2H2huLN2o6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 01:46:30', '2023-10-10 01:46:30'),
(51, 'Abdelrhman ibrahim Mohammed', 'xabdelrhman090@gmail.com', NULL, '01006304486', '01201270875', 'الغربية', NULL, '$2y$10$xdAkvy/51QgL8N.8nUhS3.NDnUrpR8vqN12GvKbTRcwUUbun6pF/6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 02:13:21', '2023-10-10 02:13:21'),
(52, 'Lujain hatem Zayan', 'logyzayan@icloud.com', NULL, '01212613851', '01211261552', 'الغربية', NULL, '$2y$10$rgYR5RLe1/DQvsEYF/DVnOKW5YFwWGLMohTgV5lyd8wkPv9dYCsIm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 02:31:14', '2023-10-10 02:31:14'),
(53, 'BASMALA ELSEBAEY', 'basmalaelsebaey@gmail.com', NULL, '01210717870', '01223701878', 'الغربية', NULL, '$2y$10$x84p.CjsScEDuYIDNv4bnumuHmEw.rPMBx4m2uuzcMLbyiBvM0yPK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 02:37:45', '2023-10-10 02:37:45'),
(54, 'مروان سليمان', 'marwansaliem15@gmail.com', NULL, '01271654231', '01061305473', 'الغربية', NULL, '$2y$10$2SrfxlLNjudxVKgTVHJ29uDHV8iHySwSAq3dSxklgWN5kLlmwzSKK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 02:41:01', '2023-10-10 02:41:01'),
(55, 'Wafaa Bassem', 'wafaabassem200715@gmail.com', NULL, '01284500516', '01281183966', 'الغربية', NULL, '$2y$10$LnjM5VQiTxITroG6NcK/BeAhwRyws8hbnO9HqRQf5U.HtTWqCkJW.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 02:48:55', '2023-10-10 02:48:55'),
(56, 'mohamed nabil darwish', 'mohamednabidarwish@gmail.com', NULL, '01555847735', '01102230148', 'الغربية', NULL, '$2y$10$QAmXp4qT9FFwj4uZxj8PLuBgX3lmB3DG8jQq8CCTLSHdYEe46spHK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 02:54:39', '2023-10-10 02:54:39'),
(57, 'Ahmed hany', 'ahmedahmedhany808@gmail.com', NULL, '01062141947', '01050078086', 'الغربية', NULL, '$2y$10$/dUP4wDDONr6JVzVsozOGu37SvJJooSfvbQamU9mQ80Hm7z8BHto2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 03:10:32', '2023-10-10 03:10:32'),
(58, 'Shaza Osama', 'haamaan@icloud.com', NULL, '01114284272', '01013953655', 'الغربية', NULL, '$2y$10$jYanBpJRO0Iql9xpQKStCOmhFIke.ItaGOAVUZmWIbQC9JWdZFuLq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 03:15:24', '2023-10-10 03:15:24'),
(59, 'الماجيك 😍(محمود رمضان)', 'mahmoud91639@gmail.com', NULL, '01221393152', '01276164434', 'الغربية', NULL, '$2y$10$3hIC1trdPnTiXxMxacDmSeeo5bvOR9g1HmujIshH8dCk0CM08de8W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 03:20:31', '2023-10-10 03:20:31'),
(60, 'Magdy Rabeh', 'magdy01283@gmail.com', NULL, '01288721907', '01283122629', 'الغربية', NULL, '$2y$10$.bw4HrKbpVBVfVwvg3wvhey/JV5r3Qv75S08V8n4kC79M35JVpSGO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 03:22:06', '2023-10-10 03:22:06'),
(61, 'محمد اسامه قنديل', 'qndyl801@gmail.com', NULL, '01153544875', '01272683664', 'الغربية', NULL, '$2y$10$F3WCuWPIVczk0T9yNC31F.M/S9395ODEsltie0W3whDIyhKg52x6i', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 03:26:17', '2023-10-10 03:26:17'),
(62, 'Seif akram', 'seifakrammarzouq@gmail.com', NULL, '01550697572', '01220262388', 'الغربية', NULL, '$2y$10$VpDV4Engn5IPLpGmx8rHDu2L.nnbyyIVxn3/e2PM9PMGZN3A6NyuO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 03:32:48', '2023-10-10 03:32:48'),
(63, 'مروان السيد حلمي', 'marwan72005@gmail.com', NULL, '01099767049', '01007873379', 'الغربية', NULL, '$2y$10$hq9sqPBjKCP4IoAweRRqM.aqss5U0RfyOOgN07smaNrV1LlCPQTpy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 03:34:47', '2023-10-10 03:34:47'),
(64, 'دينا اشرف العجمي', 'dynaaljmy0@gmail.com', NULL, '01012726307', '01002646958', 'الغربية', NULL, '$2y$10$977SGLLOC9NalTt5/q21duFP0E5VQNyfqysZpO3mwTEa4lKOkPR.O', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 03:36:50', '2023-10-10 03:36:50'),
(65, 'منه المصري', 'waledmenna389@gmail.com', NULL, '01559799986', '01009727087', 'الغربية', NULL, '$2y$10$YlUsZOg2TuyX8nTyxxuDUOi9CiVBf85ZhrD5T0zkbyyS1VkzYD64W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 04:17:31', '2023-10-10 04:17:31'),
(66, 'هبه الله هاني فاروق سعد', 'hanyheba149@yahoo.com', NULL, '01112647496', '01281185008', 'الغربية', NULL, '$2y$10$SvNUcr6UZmS3p4Hw8tFo0uu7ljTEB.bp7oefOPjXXfTtOJIhpaxjy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 04:23:02', '2023-10-10 04:23:02'),
(67, 'Thomas', 'thomasfrangilos2@gmail.com', NULL, '01275818929', '01272244864', 'الغربية', NULL, '$2y$10$pJOHD2Y2dDCVGuggLdXn7.vTAd/tz70nRUdvy6rqZu8tqJJq4Qe1O', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 05:26:19', '2023-10-10 05:26:19'),
(68, 'Malak Kandil', 'malakkandel188@gmail.com', NULL, '01156220640', '01068507450', 'الغربية', NULL, '$2y$10$6FhXk4ROY5sT5H3Eylf2t.zsBHxhZwj/Mq.V/guuPU05iT991O1Oy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 05:57:44', '2023-10-10 05:57:44'),
(69, 'مريم محمود أبو شبانة', 'Marimahmo361@gmail.com', NULL, '01148529609', '01157523814', 'الغربية', NULL, '$2y$10$CyR0LagFGmEOyG82yC092ONPAOfCwMpHuyWLWLXTNoguGhVk4H7GC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 06:14:07', '2023-10-10 06:14:07'),
(70, 'Eman ali', 'emanali82005@gmail.com', NULL, '01559661813', '01141157662', 'الغربية', NULL, '$2y$10$2yAqVtZLeXJEVRUDelXwz.Q4FZm3JpDS1QlYGjFe13BoFw1P2804i', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 06:26:13', '2023-10-10 06:26:13'),
(71, 'احمد سمير سعد', 'lil.samir02@gmail.com', NULL, '01067960269', '01221192253', 'الغربية', NULL, '$2y$10$kkz1S07cF6j7rOAJLrLf3OnPpTTRygxy8ed/mteMilgvShkvYBCca', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 06:35:35', '2023-10-10 06:35:35'),
(72, 'مهند محمد كمال', 'mohandkamal1122@gmail.com', NULL, '01221192253', '01281638638', 'الغربية', NULL, '$2y$10$69ikyelY4zf8Wvinx7m7te03WbDXjZ42BlHidNlneSklcC/d0h57i', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 06:35:58', '2023-10-10 06:35:58'),
(73, 'اسماعيل ايمن البنا', 'esmailelbana12@icloud.com', NULL, '01033737354', '01091685551', 'الغربية', NULL, '$2y$10$tBgtS5KnxofRrkRf5ch8Ou/bKGBb1SHYva4cM9DnzOtyHQI.8ELaS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 06:44:13', '2023-10-10 06:44:13'),
(74, 'salma mohamed joudah', 'varjmy@gmail.com', NULL, '01110172887', '01116030318', 'الغربية', NULL, '$2y$10$U/sBVngaQ6WQ0MOOFaa14eOvJvDPlLwbrGc3dwJSNgZp5Lqf37ReO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 07:08:16', '2023-10-10 07:08:16'),
(75, 'Habiba Draz', 'habibadraz00@gmail.com', NULL, '01093737188', '01025250131', 'الغربية', NULL, '$2y$10$0jZ58MDz8cKHvNyZB2O7OelDtPH2iu5WbJHHb2OAdk0X7t/ZmN25O', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 07:13:40', '2023-10-10 07:13:40'),
(76, 'Magdy Mohamed Bayoumy', 'bayoumym62@gmail.com', NULL, '01097371410', '01208739369', 'الغربية', NULL, '$2y$10$wz3PfaRBao0m5yxfB6M7f.M6jHrRkVgtkG2MAv923n8o.4u47m7j6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 07:50:31', '2023-10-10 07:50:31'),
(77, 'بريهان محمد ابراهيم', 'berybangtan@gmail.com', NULL, '01122849009', '01140444920', 'الغربية', NULL, '$2y$10$ZoPiggG1rHTa0z08lyadg.EGlGlnzI4JuYPxmGmck8ODceHL/naPW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 07:51:25', '2023-10-10 07:51:25'),
(78, 'سارة سامح محمد البطل', 'sockssara20@gmail.com', NULL, '01002359216', '01024078777', 'الغربية', NULL, '$2y$10$Ju1NsVD0oKaiqwd.ZlL52u1pW9zGE0S/zGhqHOxk5T2RxDN1oBki2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 07:54:58', '2023-10-10 07:54:58'),
(79, 'منه الله محمد طاحون', 'mennatahon@icloud.com', NULL, '01099653780', '01155257764', 'الغربية', NULL, '$2y$10$rm5T5go0ydOumAObHZuoceqOhAntZZ1wVatP132/5r8VFM8S364HC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 07:58:04', '2023-10-10 07:58:04'),
(80, 'ناريمان محمد العفيفي', 'mohamednariman30@gmail.com', NULL, '01558402525', '01551555122', 'الغربية', NULL, '$2y$10$jdjyAB7qAQNMPL7MspBhNeuACDQf/zjeWsc7YfOTtjkWSyhlwl/Ae', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 07:59:05', '2023-10-10 07:59:05'),
(81, 'Waleed', 'waleedelashry7@gmail.com', NULL, '01097672129', '01014931385', 'الغربية', NULL, '$2y$10$tpbGvtdNO4U47NZJO1Cx/e8oqBcbZ8yY8X3Zf8tacGmabGqo8gIOS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 08:03:51', '2023-10-10 08:03:51'),
(82, 'Mira Elshormollesy', 'mira.elshormollesy@icloud.com', NULL, '01001190982', '01224511638', 'الغربية', NULL, '$2y$10$qbtQRQfOLJAny1bTfRoijOq/srUT9WvJvvBGNrKxbDnARkICfYEVG', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 08:20:33', '2023-10-10 08:20:33'),
(83, 'Ahmed Ghazy', '20102007ma@gmail.com', NULL, '01110044138', '01222974107', 'الغربية', NULL, '$2y$10$ZfYaVi20xvafWaB1q1fLm.LJqbPyObw.FEwR1WI/Wy2Ncc5Dq6RHO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 09:09:51', '2023-10-10 09:09:51'),
(84, 'Youssef barhoma', 'youssefbarhoma123@gmail.com', NULL, '01288311858', '01204495657', 'الغربية', NULL, '$2y$10$s8r71zZbmMXK5uZDoMyf6uUnQIsTOIv.nxE5Ow7IQP5eBYPuMrVhm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 10:02:09', '2023-10-10 10:02:09'),
(85, 'كريم ايهاب حسين', 'karimeh.ehab1203@icloud.com', NULL, '01003653439', '01100021678', 'الغربية', NULL, '$2y$10$P7GufC1lFvSz.EdjHF1fy.3kydnMa1c7bzgvUWc6QhdW8R4RlzlEO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 10:47:02', '2023-10-10 10:47:02'),
(86, 'محمد مسعد رمضان', 'kokebast33@gmail.com', NULL, '01011671768', '01098003625', 'الغربية', NULL, '$2y$10$yaG8XNexbVgj4UZl9CHTEeQX7vlxOJ.ih1IzosElZZC5HtPKr6u5.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 13:25:49', '2023-10-10 13:25:49'),
(87, 'علياء السيد هلال', 'loloelsayed061@gmail.com', NULL, '01020476641', '01206954405', 'الغربية', NULL, '$2y$10$VS5t/tRyRhVO5tFwTu1pbudIbRznAWHEGn6fGPpBZDohgcKLmPVee', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 13:27:18', '2023-10-10 13:27:18'),
(88, 'Mohamed sherif samy', 'mohamd24zaglool@gmail.com', NULL, '01557182519', '01023071949', 'الغربية', NULL, '$2y$10$TgAuG/w8tbOiX3/HXqYrn.TVT3XxX.HTro6U.nBBNYYmbIgGafIGS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 15:29:20', '2023-10-10 15:29:20'),
(89, 'Aya', 'hodahossam8@gmail.com', NULL, '01224061196', '01092449221', 'الغربية', NULL, '$2y$10$3bjpKhZ0CZTTuVyZexOiPeAFkoACXG2i3i6oyNx.KDuD6gcxqtZA6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 15:34:09', '2023-10-10 15:34:09'),
(90, 'Joo', 'yusufdawoud2311@gmail.com', NULL, '01003864736', '01552028898', 'الغربية', NULL, '$2y$10$sbRvNGSgD9AB4vHwX5mhyeKR8clUJq/4rBU/nevXWm5gJt/wuBSyW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 16:48:13', '2023-10-10 16:48:13'),
(91, 'mohammed said', 'mo.saeed.zizo55@gmail.com', NULL, '01091014528', '01095320079', 'الغربية', NULL, '$2y$10$RZFCs63/SV/3QB6/Renu1eLfefkyRB3ZuCwfT2Ni/pa4GZRCa/xJi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 17:16:21', '2023-10-10 17:16:21'),
(92, 'Mariam Sabah', 'mrmrsabah@icloud.com', NULL, '01093953140', '01223547842', 'الغربية', NULL, '$2y$10$iiv.wKGh9CKJw9AUzz/DOuLuiQPBEi0dmWVYHDwUCGXqTlWQY45wO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 18:05:51', '2023-10-10 18:05:51'),
(93, 'محمد أحمد أمين بر', 'mohamedbar1106@gmail.com', NULL, '01129270804', '01066913110', 'الغربية', NULL, '$2y$10$.KGWYxJPKs.seoftXmhY/OZmPtRDrU.fBOIWI9SoiVkcaB0irMhze', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 18:21:12', '2023-10-10 18:21:12'),
(94, 'Tasneem bahaa', 'tasneembahaa31@gmail.com', NULL, '01009856954', '01019149603', 'الغربية', NULL, '$2y$10$Mxb/Mw66qHVX5T6SbFlNJusfeBLfJxiiXcmCHB8FbhAhPvbkGMi0C', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 18:41:42', '2023-10-10 18:41:42'),
(95, 'امنية محمد عبدالله مرعي', 'mony12mony21@gmail.com', NULL, '01096170728', '01156455448', 'الغربية', NULL, '$2y$10$v5mmfngBuXF9PdexSxaXr.cPB7KDBs8GAxWGAN8d3wzPooypfjClO', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 20:28:41', '2023-10-10 20:28:41'),
(96, 'روان منذر محمود اغا', 'rewanmonzer@gmail.com', NULL, '01061305834', '01144918171', 'الغربية', NULL, '$2y$10$8XmKZ1XeEopm2x0wMK0X1eRWjQ5D.DzIyrYtMeA2IUGJx2keI3n3K', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 22:10:38', '2023-10-10 22:10:38'),
(97, 'Shahd mahmoud', 'shosho.dadoo@gmail.com', NULL, '01030455923', '01102016056', 'الغربية', NULL, '$2y$10$xr6fp8plfGuplyAY7339z.QD2LtIMsEYpjdu8iwgCcs8CFAgkLxvS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 22:30:20', '2023-10-10 22:30:20'),
(98, 'اسلام احمد', 'ea890914@gmail.com', NULL, '01284579725', '01086414414', 'الغربية', NULL, '$2y$10$uOKIAc5Qglsk9A00l20LfeVl3FVsarAkbKDawbVXCAvVF1bwjmvHa', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 22:57:24', '2023-10-10 22:57:24'),
(99, 'Mariam', 'maryomaa8853@gmail.com', NULL, '01010567263', '01203228107', 'الغربية', NULL, '$2y$10$pzpg9tj0gswBV.uAGQ2SbevYfOT09ihIWcZBkaYgmytKJbArpL/V.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 23:03:55', '2023-10-10 23:03:55'),
(100, 'ياسمين هشام', 'yasmeenhesham703@gmail.com', NULL, '01097626557', '01501543348', 'الغربية', NULL, '$2y$10$3E5W2B.51XQ83TKZiEJXQOcX4/Hdd2qOWJh49NxW89nH3QGm4CPaG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-10 23:43:35', '2023-10-10 23:43:35'),
(101, 'عبد الرحمن عبد العزيز', 'abdelrahmanabdelaziz47@gmail.com', NULL, '01002628534', '01091874524', 'الغربية', NULL, '$2y$10$r2j8YjW0zD0motQ5TecCCO7fyQYIXgxuwx8HlAk3jo6UIh4K4pEKS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-10 23:55:03', '2023-10-10 23:55:03'),
(102, 'Malak Ayman', 'sallamMalak50@gmail.com', NULL, '01024177186', '01285101743', 'الغربية', NULL, '$2y$10$p2CHz3lznCJFeBNNU9Xnke74gzPL1xtpuezCoENYNxbl1k6vxRkay', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 00:25:32', '2023-10-11 00:25:32'),
(103, 'Samia Mohamed gnedy', 'samyagnady080@gmail.com', NULL, '01207335660', '01207499558', 'الغربية', NULL, '$2y$10$uCo2R4ucS7IrXjvKnmhR8.mdwRgbSL0Jtlds7rXpuW3gbUWs4SOzu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 00:28:21', '2023-10-11 00:28:21'),
(104, 'Bavlymaicheal', 'bebobavly357@gmail.com', NULL, '01285054113', '01273232795', 'الغربية', NULL, '$2y$10$RW14A10okckjNvkm4yV0OOrmpJRozEAtUXwYCroJCuQmwGMZl3EY.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 01:42:03', '2023-10-11 01:42:03'),
(105, 'حبيبه هيثم احمد الحو', 'alhwmhmd67@gmail.com', NULL, '01202429988', '01008431662', 'الغربية', NULL, '$2y$10$mvshxhe.ASXR2i1fuSgRderP4o9DO7vuSWj.muXLVDuwQPd1FMUjW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 02:28:14', '2023-10-11 02:28:14'),
(106, 'ياسمين حماده', 'yasminhamada2006p@gmail.com', NULL, '01013352070', '01008467413', 'الغربية', NULL, '$2y$10$sN1MeXx7uPwp38z2nNiamuUrM8oXiDRcJ7ww2nd0dcYVWddXYn/cO', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 03:05:03', '2023-10-11 03:05:03'),
(107, 'نادين سليمان', 'nadeen.dodo.2020@gmail.com', NULL, '01093406133', '01064369906', 'الغربية', NULL, '$2y$10$Q/jQXiIrrPUJE2OBxAhtmOtTUTwlFozrtY/9LXQULlwvRFEsKVYuu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 03:18:03', '2023-10-11 03:18:03'),
(108, 'Yousef elhabbal', 'Sm633951@gmail.com', NULL, '01090426195', '01014259179', 'الغربية', NULL, '$2y$10$fVZaFBuX7TJK6afN1asfI.yR.GuBt.BVifYnfKs36ZABLYiYBQSjK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 03:37:09', '2023-10-11 03:37:09'),
(109, 'Hana Hany', 'hanahanymetwally@gmail.com', NULL, '01063735674', '01005093298', 'الغربية', NULL, '$2y$10$fuYCBzk.JdfA4wSCs56ZdOydt9qJByUPS8SIhDgQVrQIB1zPnj12.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 04:13:03', '2023-10-11 04:13:03'),
(110, 'Manar', 'engahmedgamal086@gmail.com', NULL, '01000770456', '01002886233', 'الغربية', NULL, '$2y$10$XM8DszEoY3MOqs2VIRi.XuPtNpipcaC8f6XpxhQlo8pp5ck7IiKLu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 04:21:20', '2024-05-31 11:41:49'),
(111, 'ملك محمد جاد ابو اليذيد الوقاد', 'malakgadmalak00@gmail.com', NULL, '01029427171', '01223134726', 'الغربية', NULL, '$2y$10$yXprP.AhzoznkCNSRT4dne2NPK5qfddMG83pX4YrtqHH1jL3RkonO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 05:00:54', '2023-10-11 05:00:54'),
(112, 'روان عمرو الحناوي', 'elhenawyrewan738@gmail.com', NULL, '01096497765', '01281961112', 'الغربية', NULL, '$2y$10$Y4CSZ.X3dtdpIPkcyuxajefmsKTI.VD.cvIeY6qRQ/aUQrfrVBDl.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 05:02:52', '2023-10-11 05:02:52'),
(113, 'حبيبه عصام الفخراني', 'h.essam1020@gmial.com', NULL, '01225511901', '01211168027', 'الغربية', NULL, '$2y$10$y5Ix65ekyNvipwRGEmwVjOu34u1dJb68WsPII1fzbjD2KXENHbL1K', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 05:04:36', '2023-10-11 05:04:36'),
(114, 'marwan mohamed megahed', 'megahedmarwan@gmail.com', NULL, '01099880000', '01069698888', 'الغربية', NULL, '$2y$10$PBWail1L71xjc/c47hGqsuBAM4JvW454y4Mdnazrxki8o138DyR/m', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 05:10:40', '2023-10-11 05:10:40'),
(115, 'سما إيهاب خيري', 'smakhyry33@gmail.com', NULL, '01005117043', '01005123200', 'الغربية', NULL, '$2y$10$WfhIDvQp27NnqMzV7K7wKu7DnF1vkC3s1vcHEewIiLvcnDDGo8Jhy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 05:29:03', '2023-10-11 05:29:03'),
(116, 'محمد احمد بسيوني', 'mohamedahemdbasiony@gmail.com', NULL, '01202394484', '01202323032', 'الغربية', NULL, '$2y$10$C6v2p.hiXPGgfV.5rO.Beu/J1yqM33T7UUQ8OunXnaaGGbkfnHR..', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 05:32:18', '2023-10-11 05:32:18'),
(117, 'malak ashraf', 'malakashraf7@gmai.com', NULL, '01227309156', '01287024514', 'الغربية', NULL, '$2y$10$NJ2twB25Nr5sMoWXlqZg7u4zOgrPys5Wsm7bECT9qfLHpn1bbziey', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 05:38:16', '2023-10-11 05:38:16'),
(118, 'Omar amgad', 'omaramgad834@gmail.com', NULL, '01022466898', '01273139639', 'الغربية', NULL, '$2y$10$hiTQuXtKm9IzPBYOhNT0fe4cym13DJxkEEBIB1WC4J7dU0eTmNJ9.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 05:53:20', '2023-10-11 05:53:20'),
(119, 'Salma Mohammed', 'salmasallam4321@gmail.com', NULL, '01110961581', '01014878983', 'الغربية', NULL, '$2y$10$cwgxDFVlGkz6KRddPc5qT.p/Tbe2fpnF5v38YO6oKomVP9rXlfQr2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 06:02:27', '2023-10-11 06:02:27'),
(120, 'مريم سمير', 'mariemsamir@com', NULL, '01223852292', '01284370641', 'الغربية', NULL, '$2y$10$joP0z.YvsZ08GKMum33/EOv7lZE/64AAiKchPCStL4m8uiskF9tS2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 07:01:28', '2023-10-11 07:01:28'),
(121, 'Haneen elazab', 'haneenel3azab@gmail.com', NULL, '01025422872', '01030809350', 'الغربية', NULL, '$2y$10$ZJdtNbR8y7789z8F2pVZ2eC/dzJx0odsBxFYfh.2W2EmQoYkYds5K', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 07:02:27', '2023-10-11 07:02:27'),
(122, 'روان اسامه', 'orwan2649@gmail.com', NULL, '01278538210', '01141986810', 'الغربية', NULL, '$2y$10$1etoLpH0v2c2OvmYVJj2vuXl3ZvVyTNtDz0.ZGIt4seyPA.daTe8a', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 07:21:53', '2023-10-11 07:21:53'),
(123, 'حسين ابراهيم حسين عبده', 'bdhhsyn350@gmail.com', NULL, '01063271185', '01068822316', 'الغربية', NULL, '$2y$10$T3CDWunzY2FZ8pf5IEjPluxbuTgGxpIMkmS1ZqUEGgq6vDqex.WRS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 08:00:54', '2023-10-11 08:00:54'),
(124, 'Eman ali', 'emanali8122005@gmail.com', NULL, '01141157662', '01210741813', 'الغربية', NULL, '$2y$10$tD57ILLgBxWcPLYnuUz7KuHL9DtgzWrcjxCgaEY5QeRENe9P3eSke', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 08:53:31', '2023-10-11 08:53:31'),
(125, 'Mohamed Ahmed dahshan', 'dahshanbrothers@gmail.com', NULL, '01140170866', '01063538701', 'الغربية', NULL, '$2y$10$zZ1tD8/00iOm6Ymo0hzQsuzYQ4fmz90UNW5qvZlOhb9.LZ.I0qvoq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 11:02:26', '2023-10-11 11:02:26'),
(126, 'عبدالرحمن حسن علي', 'alyhassan286@gmail.com', NULL, '01121369784', '01098369069', 'الغربية', NULL, '$2y$10$gNxLxreDKqJCsZgTiG1OheMPDnnV1hLJOjtjKmQRqFYS5OXfhEgay', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 14:38:38', '2023-10-11 14:38:38'),
(127, 'Malak Fahmy', 'fahmyvip2000@gmail.com', NULL, '01099052827', '01008333791', 'الغربية', NULL, '$2y$10$sthWySo1Z0jvMeeCueUWteHypooRUer84sYufxJQXfdJo5h9NQgT6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 15:51:15', '2023-10-11 15:51:15'),
(128, 'Youssef Fouad', 'fwady979@gmail.com', NULL, '01272308237', '01288380643', 'الغربية', NULL, '$2y$10$SUvCYOUh8d5yACJ0aJGP9OtvasA.rAAMI/pzFTUs4WrR3UcOG2FWe', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 17:52:50', '2023-10-11 17:52:50'),
(129, 'Mo3taz', 'motazelassy210@gmail.com', NULL, '01032858934', '01032858934', 'الغربية', NULL, '$2y$10$u95MWj2s6ErCBocbEt3xn..6SIB0fqSQAEq.GCRupOgC1nSRdB0gW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 18:40:39', '2023-10-11 18:40:39'),
(130, 'لميس عمرو', 'lamisamr04@gmail.com', NULL, '01009642765', '01062318880', 'الغربية', NULL, '$2y$10$wBmWERmSrIznmw2S1hZq3eKm0hDZD6FTuFSNcqJNqU2VuALsr/Ra6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 18:50:16', '2023-10-11 18:50:16'),
(131, 'Mostafa Ahmed El-shie5', 'mostafaelshei36@gmail.com', NULL, '01229036550', '01271123482', 'الغربية', NULL, '$2y$10$/gZjBN5IqpwfE6peNni08e2chGb4/gMTmRilcDgfAIjLXXDKj6yhm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 18:52:30', '2023-10-11 18:52:30'),
(132, 'هبة عبدالعزيز', 'hebaelbaaly7@gmail.com', NULL, '01557266304', '01223651483', 'الغربية', NULL, '$2y$10$EbQmi4SaX3SwkDFb25iDtu4wWZBZnxSejDaspwS0/1PFXnklrbYga', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 19:22:43', '2023-10-11 19:22:43'),
(133, 'رودينا عمرو', 'rodinaamr144@gmail.com', NULL, '01273390877', '01286898799', 'الغربية', NULL, '$2y$10$f7hTpbDmCo58gnfB3S794OoB06zLUvzEkenUZJzvjmzx2jctZXd8q', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 19:47:41', '2023-10-11 19:47:41'),
(134, 'عمرو جمال امين', 'amr895028@gmail.com', NULL, '01068026316', '01096032668', 'الغربية', NULL, '$2y$10$F977wLXfSm1uRqZJSD7mBOF3KoHlew1pRRuwhGC3lJpi0Dwvc37M6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-11 19:48:13', '2023-10-11 19:48:13'),
(135, 'رحمه حاتم جوالي', 'ramagawaly@gmail.com', NULL, '01151689000', '01095222333', 'الغربية', NULL, '$2y$10$.APpQjVGZk0aNBwneE2al.DXx2gtxAxeptjXyB8vrRrwaNvaAT7bC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-11 23:04:01', '2023-10-11 23:04:01'),
(136, 'Ahmed fouad haggag', 'hagggagma@gmail.com', NULL, '01069374799', '01028006165', 'الغربية', NULL, '$2y$10$YkEz1xos5YSsLGyAI8yaYutD2cVlguSolNc87v2.EWh2m0NWPVenu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 00:57:59', '2023-10-12 00:57:59'),
(137, 'سارة عمرو الجزار', 'SaraElgazzar@gmail.com', NULL, '01016858432', '01067076382', 'الغربية', NULL, '$2y$10$EsXv6qwO2EI.bfgZaNPD2.Ih5TgcHRG5S90u2qmJwjAt2m1krXz3y', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 01:42:16', '2023-10-12 01:42:16'),
(138, 'Karima Mostafa', 'karimamostafa05@gmail.com', NULL, '01279439341', '01229492663', 'الغربية', NULL, '$2y$10$na247uHKhwFw1/Yq2FNwc.FWAsqGKHgbkhSoVM1RwUEoK5BVDJvnC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 02:12:24', '2023-10-12 02:12:24'),
(139, 'Farida Hany elnaggar', 'faridaelnaggar240@gmail.com', NULL, '01226388486', '01210608085', 'الغربية', NULL, '$2y$10$SOKi.VkGBRzL5Fl8xQkuuOA7DW5d2tE4JaumO5n4uupKSECsSidH6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 02:52:14', '2023-10-12 02:52:14'),
(140, 'Mohamed mahmoud', 'hodamedo045@gmail.com', NULL, '01553639843', '01153876284', 'الغربية', NULL, '$2y$10$t.HDsdoYQ/JoX2BD66XPfuP7HEtbaALOZFJYEktWkcnkfK/kGVtF2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 03:22:43', '2023-10-12 03:22:43'),
(141, 'Aliaa', 'aliaamursy@gamail.com', NULL, '01281546070', '01279666036', 'الغربية', NULL, '$2y$10$PMlzB36UiGfAc.dq2wttmezLZOl/QXx8KrELHOxYiIqfr29p8utyu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 04:26:23', '2023-10-12 04:26:23'),
(142, 'Shahd', 'fekrysami25@gmail.com', NULL, '01029939027', '01212808659', 'الغربية', NULL, '$2y$10$BdOyPxioJoXK3vPq4KqNQeHOnBaeXuk.pjn2wdtY6f72DKD3uI9BS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 04:36:01', '2023-10-12 04:36:01'),
(143, 'Yousef adel said', 'yousefxxpp@gmail.com', NULL, '01220940892', '01222674866', 'الغربية', NULL, '$2y$10$DaGsjaJuZ7ykr/UPkqdto.SufEYybHxk9HiG8dsnuZKcswq/MldLu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 04:42:42', '2023-10-12 04:42:42'),
(144, 'مهند رامي السعيد', 'mohanadramy88@gmail.com', NULL, '01205798695', '01205798695', 'الغربية', NULL, '$2y$10$YaSnzr1hXYyC76wJpSDMTuUspsfrI9doPFy/xnPJc/xoX3rjnIsi.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 07:40:36', '2023-10-12 07:40:36'),
(145, 'حنين كامل شعبان', 'ahmed.kamel201992@gmail.com', NULL, '01026191284', '01004488385', 'الغربية', NULL, '$2y$10$.YeySca/rJvZoHM86lPBE.cC4glpOKQrqurKJpmyVDvJhvIbR032W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 08:18:14', '2023-10-12 08:18:14'),
(146, 'عمر محمد محروس ابوزيد', 'omarozoo121@gmail.com', NULL, '01270206071', '01205042111', 'الغربية', NULL, '$2y$10$cxcM7glT/sGaCoSy4ZhcZe7TBKcZc3xEF6w9EibrnbIzUdP4j/29q', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 08:32:57', '2023-10-12 08:32:57'),
(147, 'ماجد رامي', 'magedgamer11@gmail.com', NULL, '01205798694', '01212785720', 'الغربية', NULL, '$2y$10$moOzO0iIz5V7t.o6XjEvnuAjA/odDj2bp68F.Sc18RmL3nKBJqKRq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 08:37:49', '2023-10-12 08:37:49'),
(148, 'Farah Wesam', 'farahwesam16@gmail.com', NULL, '01224521742', '01224521742', 'الغربية', NULL, '$2y$10$/QfIKZZ4N9CGxQALaSWyRe9RYHOcJ9m4dokFLyN2zPTxeTD9bdc5i', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 09:49:13', '2023-10-12 09:49:13'),
(149, 'Yousef Yossry', 'yousefyosry5@gmail.com', NULL, '01274484939', '01270645409', 'الغربية', NULL, '$2y$10$5E9woO2Pegdj33DNjxlH/eFDBZmVCU7UnMFa0cgreMGJHofNbS3ra', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 10:45:40', '2023-10-12 10:45:40'),
(150, 'Hanna', 'hannagamelgamel@gmail.com', NULL, '01013262876', '01062661293', 'الغربية', NULL, '$2y$10$.kdyj5fUkx2Ro0MxIV/Ufutf3rm6PG35hK.OT5Dd7MaQJvdMRdava', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 14:02:39', '2023-10-12 14:02:39'),
(151, 'كريم سامح سمير', 'kareemruneer11@gmail.com', NULL, '01553370444', '01550593959', 'الغربية', NULL, '$2y$10$4H/esvcF8tO2VVvAEQdK6euB3FCUQZomYS6COhNaD161.zXo2C5oe', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 17:09:26', '2023-10-12 17:09:26'),
(152, 'أدهم ايهاب محمد', 'adhamehab012@gmail.com', NULL, '01155291678', '01100075923', 'الغربية', NULL, '$2y$10$aoebt7s2SM1TqO3PbyJQFOm0CudTkMkC6yPmSoiPttXgzzOZzm3YW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 17:54:30', '2023-10-12 17:54:30'),
(153, 'رحب طارق', 'rahbtarek1@gmail.com', NULL, '01281067684', '01156614476', 'الغربية', NULL, '$2y$10$EP6ZtfUfXpm0I9ah9DcHL.sEi/RVgoCds8KGO2harKLSCAwCCvaWC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 18:58:09', '2023-10-12 18:58:09'),
(154, 'Yara elfarsy', 'yaraelfarsy@gmail.com', NULL, '01010922207', '01008578361', 'الغربية', NULL, '$2y$10$uBpUDoJjy/aTcBttZecCr.3YZ9Ii23clnC2kMZHzyvD6cVFK1f5G.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:43:10', '2023-10-12 23:43:10'),
(155, 'Nesma Nabil', 'nesmanabilabdelrhim@gmail.com', NULL, '01278755403', '01125259973', 'الغربية', NULL, '$2y$10$I.oQKHoyA0TO53Rz2xyIm.2dfDXYQd22kiS8144UzJJmsi1UCVbwy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:43:20', '2023-10-12 23:43:20'),
(156, 'جني صبحي محمد', 'janasobhy000@gmail.com', NULL, '01281355289', '01223387834', 'الغربية', NULL, '$2y$10$ETWVVZ9icOxSehD8mnelweOr1BevsijakPpWz6mAXQ.9QAQ0w3oGi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:44:06', '2023-10-12 23:44:06'),
(157, 'Rahma Gamal', 'rahmaelnashar810@gmail.com', NULL, '01276381569', '01277624801', 'الغربية', NULL, '$2y$10$UFCxZlUTpux3ayVXyh4eKOxTMKbLwDsbtvEziC1iICzj.2EchaOXu', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:44:10', '2023-10-12 23:44:10'),
(158, 'عمر محمد عبد الكريم', 'omarrrrzz455@gmail.com', NULL, '01032966351', '01022511314', 'الغربية', NULL, '$2y$10$YZaDpG6lDA.XtLE/pwaU0ewcsS70hqyZz.9A9ABrAS2zDhD.YZgWq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:44:25', '2023-10-12 23:44:25'),
(159, 'Farida', 'nohamongy12@gmail.com', NULL, '01026755367', '01010910902', 'الغربية', NULL, '$2y$10$BH1ioJyEEn7PQVdGlyoLa.nusWjaBV98a/DKBpUKzBJUrR7G3TetC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:44:34', '2023-10-12 23:44:34'),
(160, 'عمرو عبدالعزيز مروان', 'amro.mrawan2003@gmail.com', NULL, '01112335283', '01557700705', 'الغربية', NULL, '$2y$10$Te2AWNt4Rkn77szmiObwRealmog0HVXOwQ1RSvj2W9R2Rk9fGrDTC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:45:30', '2023-10-12 23:45:30'),
(161, 'Rowida khedr', 'rowidakhedr984@gmail.com', NULL, '01147630311', '01205586239', 'الغربية', NULL, '$2y$10$0UD4AfBXuUm6xlMvSjORgO3Nfux7UfXIWoxtvaq8HnJEs9WbkXj7u', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:45:52', '2023-10-12 23:45:52'),
(162, 'جنه فره', 'gannaferra45@gmail.com', NULL, '01224438765', '01226807332', 'الغربية', NULL, '$2y$10$0WiKz09ayyO0yHqIGwDaM.evjqZP.afHFtIAuSBNW70.hmHrjl3D6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:48:24', '2023-10-12 23:48:24'),
(163, 'إسراء سامي مشعل', 'esraamashal@yahoo.com', NULL, '01110384998', '01286962719', 'الغربية', NULL, '$2y$10$N4mkoJNl18eZagHWrqePve6rm9jT53Fy50xUinlDZHd/jnR.cw3zq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:51:54', '2023-10-12 23:51:54'),
(164, 'منى سعيد محمد', 'mona.said9@icloud.com', NULL, '01205344298', '01271856878', 'الغربية', NULL, '$2y$10$eCuhws52l21uyhWzEmpnQe66XQSDP8xgOCER9oTITrRItfhKsO8Qe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:53:47', '2023-10-12 23:53:47'),
(165, 'Rodina', 'rrody5516@gmail.com', NULL, '01220646771', '01220666920', 'الغربية', NULL, '$2y$10$sf6a.ZAFz1K.7T1pcOlG..GkIEHIP.h7K2MiDURtpmS/0E.VcGyEm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:53:57', '2023-10-12 23:53:57'),
(166, 'همس على مناع', 'hmsmanaa@yahoo.com', NULL, '01010425413', '01010505976', 'الغربية', NULL, '$2y$10$7eQrYsP0u3TEsa3EchWemuXgCX75JjcOdrCj0XzOF7z7uadohuZy2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-12 23:58:19', '2023-10-12 23:58:19'),
(167, 'ملك هشام السيد', 'malakhishamel@gmail.com', NULL, '01100764967', '01096289771', 'الغربية', NULL, '$2y$10$FMrvRVnfp6IrTb2YziZbleKfiFS8tVzO.qo/M8b9eSTgCblRhF4rS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:07:27', '2023-10-13 00:07:27'),
(168, 'Sohila osama', 'sohilao831@gmail.com', NULL, '01559986351', '01060206351', 'الغربية', NULL, '$2y$10$hD3jIzjxEF.EwR1cNo1.n.RL.ROHZ.aQ0PUgkwfVz9.45q9cRjCrC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:13:58', '2023-10-13 00:13:58'),
(169, 'سنا حسان سليمان', 'sannnahassan@gmail.com', NULL, '01272271173', '01005736008', 'الغربية', NULL, '$2y$10$wbVt.F0RMy.Zdy/n0pvhH.jf3tozE70EOeiOfAyHEN3n2O8OryFbG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:14:06', '2023-10-13 00:14:06'),
(170, 'مريم إبراهيم مصطفى', 'elbayoume@gmail.com', NULL, '01277466994', '01275331886', 'الغربية', NULL, '$2y$10$TbgP1nJWoT69g/KHnY97o.tqDRzS5uQmUrw15bf0TLfyeh2HsL7Ba', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:15:38', '2023-10-13 00:15:38'),
(171, 'عبدالله احمد حسن', 'bedoabdallah2030@gmail.com', NULL, '01068136925', '01201482995', 'الغربية', NULL, '$2y$10$z9PQBsWWvic8GXvA12xzS.zIQr.ocH7WzGnUpLdpZjbTBcAGjcCQ2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:33:18', '2023-10-13 00:33:18'),
(172, 'رنا احمد سند', 'rnasane@gmail.com', NULL, '01284174065', '01282028470', 'الغربية', NULL, '$2y$10$JMCGcRCiyV.31AobNx.c5.O09Z1QNJCFLzlA6aK/0wEBD/F.oQOsa', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:34:02', '2023-10-13 00:34:02'),
(173, 'حنين محمود عطيه بدر', 'haneenbadr112007@gmail.com', NULL, '01276432235', '01229803646', 'الغربية', NULL, '$2y$10$634/TD7T6cf1YURnof245e9uvratE8qBfIs/t4jkU80553rcSTn2K', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:39:17', '2023-10-13 00:39:17'),
(174, 'مريم احمد شيحة', 'mariamshiha@icloud.com', NULL, '01288733723', '01201788543', 'الغربية', NULL, '$2y$10$CG9VE3vCAbWG2PLKJHCIK.bdSh8z2imczIgnySLcchLRFnP0TE5cW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:49:40', '2023-10-13 00:49:40'),
(175, 'حبيبه اشرف فؤاد', 'habibaashraffoad@gmail.com', NULL, '01119251296', '01122869306', 'الغربية', NULL, '$2y$10$A4FJ3lnvRQrG4bJ5z0CMy.QaNFj7HqSjez9l7T3AxuDrCQCw9HKeC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:51:44', '2023-10-13 00:51:44'),
(176, 'salma mohamed joudah', 'mrsjoudah@gmail.com', NULL, '01009350686', '01116030318', 'الغربية', NULL, '$2y$10$eF.7B8k/5HliUi4LxSd9JecECHwAl/vCBY8QhYhQmUudWpyQxvgMG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 00:55:22', '2023-10-13 00:55:22'),
(177, 'مهاب جمال محمد الخطيب', 'mohabjamalkh@gmail.com', NULL, '01153304989', '01158877212', 'الغربية', NULL, '$2y$10$RHn7CmtT0rzO2S.HqDcfr.59A9sCm4S0MFvkgpXlj5PZNuxJgRzf.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:05:45', '2023-10-13 01:05:45'),
(178, 'حنين احمد', 'hsjsvxjs@gmail.com', NULL, '01552900527', '01557239439', 'الغربية', NULL, '$2y$10$7/psth6IyT3MFTlFXmnlXOU7dhLkZWkKHPmBY2pI7e/1krGWkiEFK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:09:05', '2023-10-13 01:09:05'),
(179, 'Marwan Mohamed', 'mr_marawn@yahoo.com', NULL, '01272444939', '01202553468', 'الغربية', NULL, '$2y$10$h9iVyi/t0NbzycZA619KJOhMwTtZrZ5jfDaFlqiRh2WLdpBlGYDMC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:14:01', '2023-10-13 01:14:01'),
(180, 'Omar Shreef', 'omar.bebo@icloud.com', NULL, '01277624906', '01277624906', 'الغربية', NULL, '$2y$10$U/b8W.B73SehgQ9MEmqSAeMM31U1Y0CnI/3zd3zY65t0VTA2TI32W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:19:33', '2023-10-13 01:19:33'),
(181, 'عمار ياسر', 'amoryyasser2005@gmail.com', NULL, '01021721737', '01001809838', 'الغربية', NULL, '$2y$10$e72DRSE6CWY.h2/Hk2SK4.KrHvVr3ZHkPXmdwsfnLtNGbduLmZv8W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:19:53', '2023-10-13 01:19:53'),
(182, 'حبيبة جمال', 'Iamhbyt94@gmail.com', NULL, '01001794658', '01001794658', 'الغربية', NULL, '$2y$10$aBw7vj8i4kD66g7TS.WPmOwvted6ItitP61Ysf818S2AWTmR3JyuK', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:21:53', '2023-10-13 01:21:53'),
(183, 'حبيبه ابراهيم محروس', 'habibamahrous92@gmail.com', NULL, '01019471866', '01099507441', 'الغربية', NULL, '$2y$10$JAMRp7ZPORZroMg0JN4gC.McAM7nG6YoXAC040VPu0j6Rs7TWqyDS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:22:05', '2023-10-13 01:22:05'),
(184, 'ZËZŌ ËLHÂDÅRY', 'zyadkhaled360@gmail.com', NULL, '01006014260', '01067820894', 'الغربية', NULL, '$2y$10$aOETTyNuV1RuF.DsuNieKuV2wF1IRDgFUSC9CjsGDr5mAhu//gGFi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:23:54', '2023-10-13 01:23:54'),
(185, 'نورين ابراهيم', 'omarnoreen072@gmail.com', NULL, '01090572173', '01000924556', 'الغربية', NULL, '$2y$10$quuj/vSezeHwhYnbdyDMROmVpE3vnh8Ne8SyycnM5JnmhbonI6WRG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:29:24', '2023-10-13 01:29:24'),
(186, 'فرح احمد الرفاعي', 'Farah012210@gmail.com', NULL, '01068095110', '01221088636', 'الغربية', NULL, '$2y$10$WNJSWhUBAkKWc0kyv9Lh6u1XH5ThGQywtktncDo7RwzIJsdSTb5G6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:30:29', '2023-10-13 01:30:29'),
(187, 'ندى ايهاب عبد الوهاب', 'ndhfb25@gmail.com', NULL, '01507081544', '01010656273', 'الغربية', NULL, '$2y$10$ZUlKW.hbgccCZiDR8spkiOGSik63HTH3vGwj3JIUsER9EMpuarDLK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:31:10', '2023-10-13 01:31:10'),
(188, 'Mohamed Sa3ed', 'spstone0@gmail.com', NULL, '01271178866', '01205716777', 'الغربية', NULL, '$2y$10$KnWoGrlwLylFrIzJmCuQ4.bTa4tKS.prtrATmSQTJXyT7/0AU7v7K', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:31:12', '2023-10-13 01:31:12'),
(189, 'Omar hamdy', 'moraahamdy11@gmail.com', NULL, '01153073591', '01153073591', 'الغربية', NULL, '$2y$10$qTdMifiM4H7S26wYDQwSpOqi11czdvpxceuZjoSdMGnzEew4H/mW6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 01:50:30', '2023-10-13 01:50:30'),
(190, 'محمد احمد ابو الخير', 'm.ahmad.aboelkheir@gmail.com', NULL, '01015974499', '01027798634', 'الغربية', NULL, '$2y$10$5jG3Wd/wkGOXNPi28LaT7.J7JYivuZm5J1KtPFewa2.bvxE166IBO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 02:02:47', '2023-10-13 02:02:47');
INSERT INTO `users` (`id`, `name`, `email`, `gender`, `phonenumber`, `phone_parent`, `government`, `email_verified_at`, `password`, `all_points`, `active_points`, `profile`, `subject_id`, `school_grade_id`, `group_id`, `teacher_id`, `remember_token`, `status_exam`, `provider_id`, `provider`, `created_at`, `updated_at`) VALUES
(191, 'رودينا حسان', 'rodinahosam@gmail.com', NULL, '01016499564', '01221747841', 'الغربية', NULL, '$2y$10$omerw5aGsai.1usOX.VyhOyU2mrriSHZUZueLc2aHM4o7saC4NXhG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 02:09:43', '2023-10-13 02:09:43'),
(192, 'روان ايمن ابراهيم', 'rowanayman10@gmail.com', NULL, '01032710567', '01030241646', 'الغربية', NULL, '$2y$10$xuSqsgRy/OvMynwpsM/V4OwBPmA.f6/P1Aj3cQrNxL/xRjD41nwbK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 02:16:46', '2023-10-13 02:16:46'),
(193, 'Habiba Elsissy', 'elsissyhabiba@gmail.com', NULL, '01067367369', '01010391478', 'الغربية', NULL, '$2y$10$yiY4y3ShRTktc8Kw4voMte.Jnain7JsYEsmwJd4IAx/nUiDIGDvhC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 02:34:42', '2023-10-13 02:34:42'),
(194, 'رحمه محمد منصور', 'rhmh1627@gmail.com', NULL, '01121371509', '01111253555', 'الغربية', NULL, '$2y$10$ekWsPF4mfsztWg5phDW3w.y4hhuSL3rfHyh1T4PL7EG/9h8xN.8Ry', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 03:01:48', '2023-10-13 03:01:48'),
(195, 'Ganna elmasry', 'gannaelmasry367@gmail.com', NULL, '01159820782', '01115533414', 'الغربية', NULL, '$2y$10$MbiAJF.12aHDsLG3b.RQy.oN8E9O2.MYmqSs3CPCqWHk30sPUxLke', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 03:12:55', '2023-10-13 03:12:55'),
(196, 'محمد ايهاب الشناوي', 'mohammedelshenawy261@gmail.com', NULL, '01501302076', '01555960692', 'الغربية', NULL, '$2y$10$XjKizSgbiCvvgi7hlyduSeyW6mTzOIFCjga3kaXveY5uDaxam.A7q', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 03:18:03', '2023-10-13 03:18:03'),
(197, 'مريم السعدي الشناوي', 'mariemelsaady15@icloud.com', NULL, '01285335474', '01273336597', 'الغربية', NULL, '$2y$10$K6EhMR73f4CLQwq1t2gSSuFNksSQ.LGMw4G6E4X9PCYPFmPUtLpe2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 03:42:07', '2023-10-13 03:42:07'),
(198, 'رودينا محمد عبد اللطيف', 'rodinamohamed494@gmail.com', NULL, '01090401982', '01063695005', 'الغربية', NULL, '$2y$10$ktJjxvtX57C7w.MugI0j4eB78PtW7vJ8jEHbiUsuvnPe.CK9MMvTu', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 04:36:12', '2023-10-13 04:36:12'),
(199, 'ايمان احمد سعد بر', 'ea0msh@gmail.com', NULL, '01021738808', '01060212168', 'الغربية', NULL, '$2y$10$1ccM47n6JPohypeVVuC1C.tGdVd1SCQY.qn5njUNkf8DD5ZsDOQ/O', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 05:02:36', '2023-10-13 05:02:36'),
(200, 'Sama Allam', 'samaallam412@gmail.com', NULL, '01004135288', '01004106051', 'الغربية', NULL, '$2y$10$gFjfYbq6Kms5Pkb.icrk6uiARDTsdppKKp7V58GoeaxQ8ljAQXQQC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 05:09:56', '2023-10-13 05:09:56'),
(201, 'Mariam Bahaa', 'm91127981@gmail.com', NULL, '01206544524', '01271539418', 'الغربية', NULL, '$2y$10$3llkZCHofnSsg.u4XNGdOum/UMGcyC5y1YVZqPp6QuvWsbO0vUaZW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 05:14:00', '2023-10-13 05:14:00'),
(202, 'rokaya', 'rokayakhaled2006@gmail.com', NULL, '01201156687', '01224444271', 'الغربية', NULL, '$2y$10$kJNTf13PdTMx6Eb8oDqbQ.j8aJey.YZYr4u.Bn5TUgTdj0MI/ypvy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 05:16:24', '2023-10-13 05:16:24'),
(203, 'منه عمرو النمر', 'menna.amrr34@gmail.com', NULL, '01279262046', '01211468362', 'الغربية', NULL, '$2y$10$5ApDBQOyLPqsyJRIMDxhOO2E8OMt5n60ZrrDDnrNSoPkNKBU3KD1S', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 05:34:51', '2023-10-13 05:34:51'),
(204, 'حبيبه سعيدوني شعبان', 'Habibasaid07@gmail.com', NULL, '01098043711', '01554505254', 'الغربية', NULL, '$2y$10$TqqX2hvtZ4KLAKzp0Es2lu3YT/LyOTgw1/zAiHkT0DFVuc6vxDzAi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 06:13:21', '2023-10-13 06:13:21'),
(205, 'Shahd mohamed', 'shahodam7med16@gmail.com', NULL, '01283947242', '01273742409', 'الغربية', NULL, '$2y$10$0z7RurCzVIIPTuPS6mVBKOZcj4jxY0Ee3lQl5epRPSnUCMpJzsU/m', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 06:40:07', '2023-10-13 06:40:07'),
(206, 'Miran', 'miranazzam368@gmail.com', NULL, '01551211035', '01033550920', 'الغربية', NULL, '$2y$10$Ir4yyGlWWfcytNuWpHDej.aiEHill4zTThPVg1YXbUkaK.7PwtHNu', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 07:13:57', '2023-10-13 07:13:57'),
(207, 'Malak mo3taz', 'malakmoataz55@gmail.com', NULL, '01554431071', '01093429669', 'الغربية', NULL, '$2y$10$TsI9asI41M15bC7ccMJrz.epVrkTEvcnYULHxbxhNdLQQN8URuD0a', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 08:43:51', '2023-10-13 08:43:51'),
(208, 'Omar elmedany', 'omarelmedany37@gmail.com', NULL, '01559633639', '01024720260', 'الغربية', NULL, '$2y$10$GGw79BgUbojc2diMqLSFXen5oI0ozBtQPmUL5ZpSPRShMiwV8i3Bi', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 11:06:47', '2023-10-13 11:06:47'),
(209, 'تقي محمد جمال', 'y.tokamohamed@yahoo.com', NULL, '01552210587', '01098157126', 'الغربية', NULL, '$2y$10$rR3II.vYadrSASONX.2pauSq/1d/lutg7mdsCt9B3F1Ya./jxGxeq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 13:41:10', '2023-10-13 13:41:10'),
(210, 'اذان محمد وسام', 'azanwessam@gmail.com', NULL, '01024489342', '01005381668', 'الغربية', NULL, '$2y$10$S/SAl.pRl17tZPEJzhNGJe2oUnxsujSfMp8PQ64OwqznvBSvCJsZ6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 13:51:25', '2023-10-13 13:51:25'),
(211, 'فرح محمد وفا', 'fw8958067@gmail.com', NULL, '01032023253', '01022206365', 'الغربية', NULL, '$2y$10$lEGXRD7oso2a3jJnfXWfm.GcdqNruMMYRFOYRjAc3dw7XHR.jULWm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 15:36:25', '2023-10-13 15:36:25'),
(212, 'لجين نبيل السيد الصفطي', 'lugien.elsafty1@gmail.com', NULL, '01553740170', '01098758514', 'الغربية', NULL, '$2y$10$mBDlpy176/yhwnKWAS9QsO1j0Y4ZDl.Tn9fgjDV19vztYQ33LNWPy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 15:51:50', '2023-10-13 15:51:50'),
(213, 'Rahma', 'ra6256614@gmail.com', NULL, '01279338839', '01200962910', 'الغربية', NULL, '$2y$10$/7JuiTPrTgGyjVFjzTpr3O6ZjIVky70ZgbuGH/XN4LGVzZZUEZZDq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 21:01:45', '2023-10-13 21:01:45'),
(214, 'Mohamed', 'md447999@gmail.com', NULL, '01091796031', '01060839521', 'الغربية', NULL, '$2y$10$RYMqrz8m.irhC7Qxrqk/VuCopmxKBsPgvT1daYAtmZ7hMwIwvMLqS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 21:07:15', '2023-10-13 21:07:15'),
(215, 'بسمه سمير محمد انور', 'se.me.basmasamir2007@gmail.com', NULL, '01222632702', '01096055151', 'الغربية', NULL, '$2y$10$/D5e1twneyFQvFuCBOi4SOO1IWxUFpMAAGYsMAdGvFUvlgSQSp3w6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 21:59:15', '2023-10-13 21:59:15'),
(216, 'Mariam', 'rneemS705@gmail.com', NULL, '01103193139', '01156251760', 'الغربية', NULL, '$2y$10$jhuXl.prIZuz1tsKysUpVeMZ00hjmdBJ..fIq3KAUOeQO6E45666C', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 22:16:53', '2023-10-13 22:16:53'),
(217, 'Mostafa Mahmoud', 'mm2394447@gmail.com', NULL, '01068785159', '01007288550', 'الغربية', NULL, '$2y$10$Oyb28M9ei1/lGwtvu6pzwu4x4bFWyHejVo1nH/n2JEnDnRN6VHQwi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-13 22:50:22', '2023-10-13 22:50:22'),
(218, 'عمر على أحمد الخطيب', 'omar54.sb@gmail.com', NULL, '01116944340', '01112067011', 'الغربية', NULL, '$2y$10$N.tr2EATzntQrforSMVw5O9E5qm2nfGYASWlyGZS2FSfTRKmEWgFa', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 23:17:56', '2023-10-13 23:17:56'),
(219, 'علاء البسيوني', 'albsywnyla69@gmail.com', NULL, '01068465269', '01223269071', 'الغربية', NULL, '$2y$10$yU2REVOKQNi9T/1.YVfaVOt.SXIoO026UjBwxKdDIH5gtFB/uybue', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-13 23:22:22', '2023-10-13 23:22:22'),
(220, 'ندى ابو عفصه', 'nadaabofsa@gmail.com', NULL, '01094500142', '01111999854', 'الغربية', NULL, '$2y$10$LogfcpJDwB3tomhjedFeW.mWJzQHOttBt4UMgl68NNfMYbaOFvoka', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 00:11:17', '2023-10-14 00:11:17'),
(221, 'Mariam mosad', 'mariammosad777777@gmail.com', NULL, '01124657730', '01124377019', 'الغربية', NULL, '$2y$10$s/dhiZYUoo.4w.ySqmWsPun/RJ7tncHCwcN2TRYbwrFxqpAUyY4Yi', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 00:32:59', '2023-10-14 00:32:59'),
(222, 'منه الله شريف العزب', 'elazabmenna76@gmail.com', NULL, '01062887051', '01098929181', 'الغربية', NULL, '$2y$10$5sqoBA/UeCNhtMOKnfCbBOu2gzikkJzcdX5Vm.x1RE1XR75AP8a.G', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 01:30:52', '2023-10-14 01:30:52'),
(223, 'حنين عمرو', 'ha7605873@gmail.com', NULL, '01098802594', '01094300502', 'الغربية', NULL, '$2y$10$sqP48d2Hu5eoFpLTOed6i.bvv2N9.brCBk5v93qBoLyTAgaK0x1ra', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 01:39:19', '2023-10-14 01:39:19'),
(224, 'ساجده محمد حسن', 'sagdam69@gmail.com', NULL, '01284065785', '01110073758', 'الغربية', NULL, '$2y$10$zTMTdBbSD7sCQRP1sHejauURBJqUc9vclh8yHfEzdiTU/N6hctkVS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 01:45:06', '2023-10-14 01:45:06'),
(225, 'Mohamed', 'my776606@gmail.com', NULL, '01225358388', '01272660758', 'الغربية', NULL, '$2y$10$qDQKz.8V9TD7El8YRzEKpuFfUF7c48T3u4E3.nDoIs.kbvVwJhqTm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 01:57:47', '2023-10-14 01:57:47'),
(226, 'مريم السيد يونس', 'mariomaraed@gmail.com', NULL, '01067423004', '01066206621', 'الغربية', NULL, '$2y$10$/HBZcdf7h9.JZL1bVqw9xOFY7yXMTm1Vpp68LbWxqGowA47p8AOqG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 02:26:04', '2023-10-14 02:26:04'),
(227, 'محمد', 'mohamed.noch70@gmail.com', NULL, '01146500140', '01100910200', 'الغربية', NULL, '$2y$10$/D/1KzhQdMRYJY6edL/k9elh1tLmQVJi/gwPCAkQsFy3f6d1QTDvC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 04:20:18', '2023-10-14 04:20:18'),
(228, 'بسمله السعيد السيد شعير', 'gmail@Bs01025116163.com', NULL, '01158303486', '01025116163', 'الغربية', NULL, '$2y$10$dCOytmWg7OF45cTTfog98OzLte.tGDz3jmN2Bd7WCInMBYxySDzY2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 05:05:23', '2023-10-14 05:05:23'),
(229, 'Hagar Aboafsa', 'hagaraboafsa@gmail.com', NULL, '01095090479', '01068988830', 'الغربية', NULL, '$2y$10$7XhnxJgDdWFx9oxaYyYjk.kLr1fTZqruoIaBRYAqH5AtlTguzK8L2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 05:39:55', '2023-10-14 05:39:55'),
(230, 'Ramsa Yasser sharaf', 'ramsasharaf4@gmail.come', NULL, '01122212467', '01123925678', 'الغربية', NULL, '$2y$10$dk1t7cnsa99NqXNvjPBreOOolbaNCS/P9roWP/FeKWGiac0UIDOXe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 06:01:36', '2023-10-14 06:01:36'),
(231, 'A. M. A. N. Y🩷🩷Hamed', 'amanyhamedebrahim@gmail.com', NULL, '01032640348', '01063805715', 'الغربية', NULL, '$2y$10$2t/VzOn5ma5px.4Nou1in.ySkNOFsJc5tQjTvfxwojZiuVAIT7n/W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 06:43:46', '2023-10-14 06:43:46'),
(232, 'Jana atya', 'janaatya618@gmail.com', NULL, '01555161363', '01020619103', 'الغربية', NULL, '$2y$10$Yer7M6NcUD7YQPoSIptMiOJoHZg6qyKH8VMaAtSTPYSTuumKN3rUm', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 07:38:31', '2023-10-14 07:38:31'),
(233, 'Fares', 'faresbahnsy@gmail.com', NULL, '01275309935', '01208000246', 'الغربية', NULL, '$2y$10$.cjWbBtRA3xkfL2OkE/44.24iUKEc5HlYpsisc8RNMCKMGTYjlSTa', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 10:39:39', '2023-10-14 10:39:39'),
(234, 'ملك قنديل', 'malakkandil604@gmail.com', NULL, '01286695345', '01224895500', 'الغربية', NULL, '$2y$10$a7G3LoIHWoDHNFA0UdzKreY5Ja7FqE4YHUa9zh0D1e.rWKmZNLVhK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 11:57:36', '2023-10-14 11:57:36'),
(235, 'Hager mostafa shawky', 'hagermoastafashawky@gmail.com', NULL, '01283283754', '01227575547', 'الغربية', NULL, '$2y$10$7amTG.lpEyvWtT23V01M.uq9tDu/xL3wVm9m0MaUOzi4Bu5rcO7by', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 15:43:49', '2023-10-14 15:43:49'),
(236, 'محمد', 'mohamed.amgad.zalat@gmail.com', NULL, '01025360776', '01554940776', 'الغربية', NULL, '$2y$10$H6L.ly/KaVMTTtyOOeFCj.H.q8pL5XNJ43Djwr0aFkX6TrDs1HwjK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 18:03:36', '2023-10-14 18:03:36'),
(237, '01098774408', 'f01098774408@gmail.com', NULL, '01098774408', '01000157616', 'الغربية', NULL, '$2y$10$SfNuPvONdTRGBmG8OlIYCOZxrHTsDpI3VkWnGmMYFRCIr4Lx3i8YG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-14 19:39:55', '2023-10-14 19:39:55'),
(238, 'Moamen El-Fakharany', 'notmoamen981@gmail.com', NULL, '01212279275', '01271876056', 'الغربية', NULL, '$2y$10$X6zDqREKP9Db9qRWTzYLSOaq10sKPWOUTydnRvxlp3sfETEa57yii', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 20:15:08', '2023-10-14 20:15:08'),
(239, 'قصي مسعود', 'qusaimasoud12@gmail.com', NULL, '01124990495', '01273114863', 'الغربية', NULL, '$2y$10$u3TiaUCCkj7G8i3FJGIvkugByEpm39C1ljQaHsa1B5eLQRhi3KHIG', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-14 23:50:03', '2023-10-14 23:50:03'),
(240, 'محمد ممدوح خلاف', 'mkmk1682006@gmail.com', NULL, '01285365616', '01281388178', 'الغربية', NULL, '$2y$10$bO4Xd.uUh9igl/cNPjdf8uuAe2klph1cM8YN6wUKz2ilaZoki1yMC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 00:46:50', '2023-10-15 00:46:50'),
(241, 'Sama Usama', 'Nohakotb55@yahoo.com', NULL, '01064022755', '01029663522', 'الغربية', NULL, '$2y$10$G5gxii8me7lrokIAP.WcTeWxsFJ08w2CbL.HNGI6OAzarrX89tGoa', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 02:02:46', '2023-10-15 02:02:46'),
(242, 'ياسمين محمود السيد', 'yasomahmoud04@gamil.com', NULL, '01011023955', '01064449469', 'الغربية', NULL, '$2y$10$siZZCNBHqyhxMwRabCJu4.gJZEw3RQJDCQ.BSoEQ.pVll93YOLJQS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 03:26:31', '2023-10-15 03:26:31'),
(243, 'احمد محمد على', 'fady26868@gmail.com', NULL, '01279961128', '01279980074', 'الغربية', NULL, '$2y$10$ccStDb8uWmrT//FNfo8Lf.CikAm4gLuMYcOMbfFQdJyLB4IfB2D.e', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 03:31:09', '2023-10-15 03:31:09'),
(244, 'جنى ساعي الدين', 'medosayeldeen953@gmail.com', NULL, '01143393750', '01207170300', 'الغربية', NULL, '$2y$10$YpbjPtEmm/yfEa00CXSLfeGhKhIkNgFmTeKDvuQUmLI7eRlLYmRYa', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 03:34:05', '2023-10-15 03:34:05'),
(245, 'Habiba Ahmed', 'beba74709@gmail.com', NULL, '01555896261', '01555896261', 'الغربية', NULL, '$2y$10$k3Ydak2RyzCT9L7Dv38AIuKYimPY9kT9T6JQQENpAe37bpFMnX44i', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 04:10:59', '2023-10-15 04:10:59'),
(246, 'Eslam hamed', 'eh1812008@gmail.com', NULL, '01200807887', '01205234935', 'الغربية', NULL, '$2y$10$4o1ZkvQHAXFONZFAYFB3EOpdo9RlVEO.qxgQG7aRCecWJ/XsMkNvy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 04:23:41', '2023-10-15 04:23:41'),
(247, 'تسنيم ناصر محمد الشهداوى', 'manarabokora8@gmail.com', NULL, '01119128579', '01119128579', 'الغربية', NULL, '$2y$10$IQzYzTTz5t/zdYHwEf.OQux/K4dRX5A1K2MLxrd29SI20DCRvvJA2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 04:30:01', '2023-10-15 04:30:01'),
(248, 'جنا عزيز حماده', 'jnazyz911@gmail.com', NULL, '01064266926', '01008038177', 'الغربية', NULL, '$2y$10$1LPzbvjAed9LEry0TzjB0u77u6LDtRvZErvxT1skYxZv2ui7zVDqy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 06:38:33', '2023-10-15 06:38:33'),
(249, 'احمد كمال احمد', 'midookimoo.2007@gmail.com', NULL, '01152953518', '01005296394', 'الغربية', NULL, '$2y$10$kP.Lbn3WRFKIVuCAWBydhOQvEU1ZIUruFVplnxhTlDcHXv6lINWWe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 06:51:56', '2023-10-15 06:51:56'),
(250, 'نورين وليد عمر', 'noreenaboeldahb2020@icloud.com', NULL, '01208178347', '01002302006', 'الغربية', NULL, '$2y$10$nSd5pBhLOCZhLkh4FK7yhO1GpfXTmB.nvoVjsVN4lF/cYC1metBDi', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 09:34:11', '2023-10-15 09:34:11'),
(251, 'چنى إبراهيم محمود', 'jana.ibrahem286@gmail.com', NULL, '01270797124', '01280916664', 'الغربية', NULL, '$2y$10$DG5y9rbM9dhDqkFzAFlceudCi5ks9p1FgemM0/kjb5WQeybWBLyC.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 15:04:08', '2023-10-15 15:04:08'),
(252, 'Jooo', 'yeljoo027@gamil.com', NULL, '01557597748', '01201150652', 'الغربية', NULL, '$2y$10$4ZB0JRgBn0AMnmtRLGqTz.G/T.JTIDKOCctmUjK8oc4Cnpxoet9rm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-15 20:33:32', '2023-10-15 20:33:32'),
(253, 'يوسف', 'youse.amr2012@gmail.com', NULL, '01200615084', '01559044032', 'الغربية', NULL, '$2y$10$i.YQKk3E.pVK06Xe6Q3CPucbljCTO/UpXLIkQAMFrBVpm/oAiMiZa', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-15 20:56:59', '2023-10-15 20:56:59'),
(254, 'جنه الحداد', 'ganas2905@gmail.com', NULL, '01124891392', '01141577206', 'الغربية', NULL, '$2y$10$7BJytShzrW0L8FuoEQQJOu8azWKJC.XZ7PAqocm//4.jJRSqzeY0S', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 00:42:15', '2023-10-16 00:42:15'),
(255, 'Salma shaban', 'shbansdyq09@gmail.com', NULL, '01555362002', '01090089604', 'الغربية', NULL, '$2y$10$Pb2.msUsuemNc4XeAjdaWuyLec4.a2MYOPcEiBJI8cEP8AW0pqdJa', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 01:57:37', '2023-10-16 01:57:37'),
(256, 'Romysaa Emad', 'romysaaemad523@gmail.com', NULL, '01156111192', '01113338930', 'الغربية', NULL, '$2y$10$JubpdG/YWpcGLGgGvVleHemHPWvkm5F8EjKHsZDscorUrrLYJcr0i', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 02:14:39', '2023-10-16 02:14:39'),
(257, 'هنا شريف العشري', 'sheriefhana012@gmail', NULL, '01025265100', '01000598068', 'الغربية', NULL, '$2y$10$fS5rX88g7K0HarMtbtBL7uEZCVvNpWb5TwNt.s46i0uFMXy0U5Y66', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 03:04:08', '2023-10-16 03:04:08'),
(258, 'Mohamed Abdelhafez', 'mohamedabdelhafez0112@gmail.com', NULL, '01145852044', '01275824065', 'الغربية', NULL, '$2y$10$.VVARXVEAy2gst5WxviFqOpBc0OifsKwHr594G1fpR7JbyBrzJTkC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 03:30:07', '2023-10-16 03:30:07'),
(259, 'شذى حسن حلمى', 'shazahassanhelmy@gmail.com', NULL, '01211484104', '01063612236', 'الغربية', NULL, '$2y$10$hA/ZmW5Exe9STdfFCm9XM.elobOQAi6FOHAH9TBC225u0uZTD6Wmu', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 03:47:16', '2023-10-16 03:47:16'),
(260, 'فيرينا جرجس يوسف', 'grigesverena@gmail.com', NULL, '01227401269', '01223789752', 'الغربية', NULL, '$2y$10$lDTn2VhOtS6yhvZgNcsv4.OHcAkG7hsUvSMoDopGJ1vyn0QZd9jEe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 04:14:04', '2023-10-16 04:14:04'),
(261, 'نور محمد عبد السلام', 'nourmahamed571@gmail.com', NULL, '01225299536', '01289310675', 'الغربية', NULL, '$2y$10$qdTTARQ2ESaLSVAQLB8N4O0TFiAi.VqYkwJX0uh4pEBSibMwQNoYi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 04:17:46', '2023-10-16 04:17:46'),
(262, 'Malak Fahmy', 'malakfahmy924@gmail.com', NULL, '01288054009', '01288054009', 'الغربية', NULL, '$2y$10$t0LCjRNSiRpwGB9IpiD/IeiNlEUwlmOLBiNglFzwDN7zqneXwHu6W', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 04:23:10', '2023-10-16 04:23:10'),
(263, 'Abdelrhman', 'manorizk2345@gmail.com', NULL, '01092549422', '01064338526', 'الغربية', NULL, '$2y$10$HYUawe2vjO8utzZfJUigi.oL4k4/L6h4rOCJZ8GPZDnHkOMFLhGfC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 05:53:24', '2023-10-16 05:53:24'),
(264, 'احمد حامد عبد الحافظ', 'ahmedhamed2007@gmail.com', NULL, '01012681842', '01068404062', 'الغربية', NULL, '$2y$10$uex9tY6Bs4Fxk.1xOD4mse1ms0UhC1oRlH8cQaD8haABFn0FuPNv6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 07:34:25', '2023-10-16 07:34:25'),
(265, 'ملك العسال', 'malakalassal142@gmail.com', NULL, '01227101531', '01201882080', 'الغربية', NULL, '$2y$10$en.zFQ57nfaD7q6ELcrRN.ctOT/1Qw9xf80ZgS1oBcDxRfpTzJGVG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 07:36:29', '2023-10-16 07:36:29'),
(266, 'Mohamed', 'modyalazap@gmail.com', NULL, '01229600139', '01203866051', 'الغربية', NULL, '$2y$10$ofLhGXzEq2mtAyTjxyJiQ.pjMU3EZDfz.aCO6nU/0tuU3HNrNCvZK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 08:33:26', '2023-10-16 08:33:26'),
(267, 'Habiba Saber', 'ascondal008@gmail.com', NULL, '01278282008', '01276621199', 'الغربية', NULL, '$2y$10$D6mQS224EoRGxtnPzgI/R.wSg5MXkz2m3g4q2zOZ6Phnf9B9XfATm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 10:37:06', '2023-10-16 10:37:06'),
(268, 'Omar', 'omarhes12346@gmail.com', NULL, '01017652153', '01287490747', 'الغربية', NULL, '$2y$10$xjY.5oBkfAfS5Jl3V.i6aOv4g3GzDxGSEvQkoPdX2o0GHZEMOlCFW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 12:51:51', '2023-10-16 12:51:51'),
(269, 'محمد احمد الخطيب', 'mohamedelkhateb740@gmail.com', NULL, '01129258622', '01068156078', 'الغربية', NULL, '$2y$10$HXPg5nkoPBxb7nusuZ5V2.UoBjLU4OyaC.v44HOEOoScpf48WXnWC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 15:00:12', '2023-10-16 15:00:12'),
(270, 'Mahmoud Karam', 'mo703860@gmail.com', NULL, '01557228583', '01008637019', 'الغربية', NULL, '$2y$10$/hmC2dz3ORIMfjU7AVcZYeOOzDtAy3AOrEDLIsx7TZww4S61MAjQS', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 16:29:16', '2023-10-16 16:29:16'),
(271, 'عاليا جوده', 'Aliamohamedgouda@gmail.com', NULL, '01211726693', '01211726691', 'الغربية', NULL, '$2y$10$DGyZ9EmSy2uo/mXGz48IiemVD9/Ka4zXnYX6d2j.Zh8oolXp3/L9.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 17:37:01', '2023-10-16 17:37:01'),
(272, 'ميرنا الشامي', 'myrnaalshamy102@gmail.com', NULL, '01289795687', '01222509143', 'الغربية', NULL, '$2y$10$PdZs9MK2hnT/W4Ef.ECmhepnwtX42qE34EcIPBAsw2fD9njAp0lyq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 18:47:29', '2023-10-16 18:47:29'),
(273, 'يوسف المطاهر', 'yousefalmetaher2@gmail.com', NULL, '01065468685', '01550594255', 'الغربية', NULL, '$2y$10$r.92kDeLtjBvs.PqXYQHnO0QnqDqmxT3X8Us4lRCkN3DWTECAOiEy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-16 18:59:50', '2023-10-16 18:59:50'),
(274, 'احمد زكريا حسن البنداري', 'ahmedalbendaryzakaria2007@gmail.com', NULL, '01271733177', '01271733177', 'الغربية', NULL, '$2y$10$kRnmJHPqUMG6hpQLpVD8l.foBRveav1AQP9NUFbdw0rzjgLwWQdKO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 21:25:00', '2023-10-16 21:25:00'),
(275, 'عبدالرحمن عمر البري', 'omarlalal589@gmail.com', NULL, '01200739520', '01271057191', 'الغربية', NULL, '$2y$10$1NMP7.0t4Eear563syLxZOZb7DRtAuTx3YVDMhro.V.mu6PQjY.w2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 21:25:42', '2023-10-16 21:25:42'),
(276, 'لجين ملهم حبلص', 'lojainmlham@gmail.com', NULL, '01090825525', '01007870688', 'الغربية', NULL, '$2y$10$ClJYuLF9BVjFWqYoaCQz6ev/059F86aeP1c/ILH4qU.2QYL1h2/rG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 22:21:21', '2023-10-16 22:21:21'),
(277, 'منة الله مدحت', 'menhmedhat17907@gmail.com', NULL, '01278890336', '01211604225', 'الغربية', NULL, '$2y$10$3HKgSORQHj0biQlpurJnEuRZerD6wOIkxTJyUx7OFO5/sRVeO9QWm', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 23:08:21', '2023-10-16 23:08:21'),
(278, 'زياد محمد كمال الخطيب', 'z4224885@gmail.com', NULL, '01206624201', '01227072351', 'الغربية', NULL, '$2y$10$cq28wekRUL/rKr46P4L1Q.uDlzAMQqIXy6m0tHf1JI8IVS9/DXy26', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-16 23:09:47', '2023-10-16 23:09:47'),
(279, 'Mohamed El menshawy', 'Mohamedmm30001@gmail.com', NULL, '01015053288', '01009264241', 'الغربية', NULL, '$2y$10$t9w0c8HfUWT2CthcxLRuz.oQN24/K8TL9yI2bonCOBqhhZWMFSlNm', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-17 00:45:06', '2023-10-17 00:45:06'),
(280, 'Shahd farghly', 'shahdfarghly583@gmail.com', NULL, '01228697257', '01024578799', 'الغربية', NULL, '$2y$10$RkigloeETIemrVSenguU5eD0Q9aM9TzVQj2yd7BKCB8LiisoK3vFe', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-17 01:06:11', '2023-10-17 01:06:11'),
(281, 'نورهان هيثم علي السيد حماد', 'nourhanhaitham568@gmail.com', NULL, '01111334860', '01111334860', 'الغربية', NULL, '$2y$10$Lsr.h/mZmxyVfc6azW2Ja.Mz3i.JxWzZkJ5Y/wCOwPb8HOj1P9ch.', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-17 04:37:29', '2023-10-17 04:37:29'),
(282, 'Maryam Sharaf', 'maryamsharaf453@gmail.com', NULL, '01220338991', '01006000839', 'الغربية', NULL, '$2y$10$vjfhBqOqn0SoiXRiQDZ/ae57m.eVnGd9aJZV9tyYQc61hwARsRB0S', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-17 04:45:47', '2023-10-17 04:45:47'),
(283, 'يحيى حاتم محمد كمال', 'yahyaandeyad@gmail.com', NULL, '01208177370', '01287156635', 'الغربية', NULL, '$2y$10$fewBIjh4j2x6.F4h2ooj0uca2lHzu1cJBEgBGoYT5rRpAHC1Am/h6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-17 06:01:02', '2023-10-17 06:01:02'),
(284, 'Malak Elgallad', 'malakelgallad80@gmail.com', NULL, '01224311168', '01200001224', 'الغربية', NULL, '$2y$10$Ee5PKIo6c3zMaQsgxyycAOckM.EL8yoXwghSuynB5kaHQIPB999Ke', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-17 06:17:27', '2023-10-17 06:17:27'),
(285, 'اشرقت اسلام', 'ashrakata410@gmail.com', NULL, '01210558082', '01202755966', 'الغربية', NULL, '$2y$10$YgEGfSJLnGKYaQV1czLerunZSlyHeufAzbTokiV92Xs1otJ7xwu6G', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-17 07:39:59', '2023-10-17 07:39:59'),
(286, 'sama ❤️', 'srda6837@gmail.com', NULL, '01017018504', '01019029901', 'الغربية', NULL, '$2y$10$3NWTuUg.Qeffq2jEsnOEFeqCeT5fiXquMFS2I1NVigWlNQzylJgwW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-17 09:55:13', '2023-10-17 09:55:13'),
(287, 'مريم وليد بركات', 'mw7596139@gmail.com', NULL, '01557291041', '01277670490', 'الغربية', NULL, '$2y$10$n/v3tZQNGLobRDDDDOB7POh1he6fyRye/lOK/Uf6U3MTQgm1rCpR6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-17 16:38:12', '2023-10-17 16:38:12'),
(288, 'MohamedHasona', 'hasonamohamed033@gmail.com', NULL, '01020063459', '01273095210', 'القاهرة', NULL, '$2y$10$OlhU4ogiZ7sZu4sa8dE1Euz4PK6hpxFTH9r6lTZIVyK7iZ8XLI27.', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-10-17 19:46:56', '2023-10-17 19:46:56'),
(289, 'Hala Assy', 'lolokitty.2005@gmail.com', NULL, '01205840071', '01061701155', 'الغربية', NULL, '$2y$10$x3zHdjX03lrF/3jxfvPvL.KGoiomqMhlCo2EbMhzcbLBjlzHuOn..', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-18 03:02:05', '2023-10-18 03:02:05'),
(290, 'فريدة يوسف ابو رية', 'faridayosef81@gmail.com', NULL, '01207806585', '01201403345', 'الغربية', NULL, '$2y$10$ukdShggVBqR4ZnPs8QoK/eOY77gwhEP3psvZ.ISmh2d14NZsZYCFy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-18 05:44:58', '2023-10-18 05:44:58'),
(291, 'آلاء عماد يوسف', 'ae856765@gmail.com', NULL, '01551712120', '01020067786', 'الغربية', NULL, '$2y$10$vC/8BMCTxXcyBCYjp1gUBOnJdHk7xe/0I9JlivNbc8lXGIKnTVvPW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-19 05:32:59', '2023-10-19 05:32:59'),
(292, 'عبدالرحمن خالد مرغلي', 'Abdelrahman5marghaly@gmail.com', NULL, '01283497293', '01288729361', 'الغربية', NULL, '$2y$10$Cc5fbyAL5O8gU35JQ8CkleYcUNhKUMdCiRrshQ462o4enWgcTGi/2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-19 20:15:39', '2023-10-19 20:15:39'),
(293, 'Malak Mahmoud El sayed', 'malakmahmoud1012007@gamil.com', NULL, '01552258192', '01280855020', 'الغربية', NULL, '$2y$10$1UTRgD5jjP9TrDSdJ8tMjeMNy8X/HWuU0Yi7Yn1L1HrSu55fm.Fde', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-19 22:04:54', '2023-10-19 22:04:54'),
(294, 'محمد محمود جعيصه', 'mohamedgeaissa@yahoo.com', NULL, '01146152228', '01280834686', 'الغربية', NULL, '$2y$10$TPoQJSKRHXXgjbnSQ3nZIOucXx91ET7aRTMVyhhZc4y2GUEVoZpf6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-20 03:47:31', '2023-10-20 03:47:31'),
(295, 'Malak Sherif', 'gamil.com@Sherifmalak319', NULL, '01271210480', '01204190450', 'الغربية', NULL, '$2y$10$0OIw8xU43v88M7nmKdSU7OuQnciHNpGq.XSwJbwhXnMnA.Vo.tU4S', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-20 20:07:16', '2023-10-20 20:07:16'),
(296, 'بسمله السعيد السيد شعير', 'Bsmala01025116163@gmail.com', NULL, '01025116163', '01158303468', 'الغربية', NULL, '$2y$10$qdtV3va3mhRfs8Xl4VFaDulb1BDDn9kHcLETjy2Ec0lVqyFsHZEzq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-22 08:27:31', '2023-10-22 08:27:31'),
(297, 'زينة', 'zeinamohamed753@gmail.com', NULL, '01282422873', '01224712419', 'الغربية', NULL, '$2y$10$umuJXLLcXky/S5zr8yjoVesP0Ua14K9o0vmBL.N3So1cVmngHGlUm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-22 23:40:31', '2023-10-22 23:40:31'),
(298, 'هنا احمد العمروسي', 'hanaelamrosy69@gamil.com', NULL, '01275616506', '01554636111', 'الغربية', NULL, '$2y$10$m609714QGZi2DkngXSR6.O7cRJhuzgPWtWPBZWPL6G91gFBVuBPku', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-23 04:54:35', '2023-10-23 04:54:35'),
(299, 'Maryam Sharaf', 'aliaa.hodeib@gmail.com', NULL, '01006000839', '01288948888', 'الغربية', NULL, '$2y$10$H31HCGA2JpAQf6SXldZXhe65MmzzmoXsSE28yKSt2kn3hPJYWqSru', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-24 05:42:43', '2023-10-24 05:42:43'),
(300, 'مريم الدمسيسي', 'mariemeldamsesy@gmail.com', NULL, '01013483313', '01277973325', 'الغربية', NULL, '$2y$10$u5vbImMxzPZGJ8rRRz26A.3ZGJi4BsdgR0YCnYwU02BhDfaeiEpTy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-24 22:38:10', '2023-10-24 22:38:10'),
(301, 'Shaban Salah', 'shabansalah712@gmail.com', NULL, '01150584658', '01111163450', 'الغربية', NULL, '$2y$10$q3k993QHwqEWyYkw9fvoSe3AJy314ypI.FrHbBVrwUyAWD1IVSvUm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-25 02:21:47', '2023-10-25 02:21:47'),
(302, 'اياد محمد احمد الديبه', 'eyaddeba0@gmail.com', NULL, '01274292267', '01203849106', 'الغربية', NULL, '$2y$10$32YoqCPDFoUQy/V4gi87aeUAE15ROoVtB5kIqYqBQI/hznsVgvFmq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-25 05:15:50', '2023-10-25 05:15:50'),
(303, 'عبدالرحمن ميدان', '01092851abdo@gmail.com', NULL, '01280319837', '01004157196', 'الغربية', NULL, '$2y$10$cQjcmxU0rnfsJ02mMMuhBO7A7Ij6p/oPIC/VbxiYGIlewyE7SNREW', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-25 05:21:58', '2023-10-25 05:21:58'),
(304, 'ناريمان محمد العفيفي', 'mohamednariman@gmail.com', NULL, '01551555122', '01558402525', 'الغربية', NULL, '$2y$10$/ok4Et4hs0jm2fN3Kefaz.iA6kcvdgwge4GjDi7cQf4Psal6Sgwme', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-25 08:27:19', '2023-10-25 08:27:19'),
(305, 'نورين وليد عمر', 'noorevie7@gmail.com', NULL, '01280681175', '01002302006', 'الغربية', NULL, '$2y$10$AJg.IyehWYz1pcEBdvXw5.dIVpSL4VGCDs1.VjSRRl7iwaLBLsMvG', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-10-26 15:13:17', '2023-10-26 15:13:17'),
(306, 'Nagwa', 'nnnnali123@gmail.com', NULL, '01017349655', '01013765674', 'الأسكندرية', NULL, '$2y$10$yTtMNcOSRV2EdCtf64OTpOcvX8W8DxXV7zoDtkfSfgqXeri.HLrvW', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-10-29 06:08:45', '2023-10-29 06:08:45'),
(307, 'فاتن اشرف', 'fatenashraf286@gmail.com', NULL, '01273834069', '01278419516', 'الغربية', NULL, '$2y$10$rwGXtGo0gWcmtX3YksAklOSLId0acUV76kfy1Myd.NxuKLTpP7Uhe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-10-30 06:35:47', '2023-10-30 06:35:47'),
(308, 'يوسف جمال يوسف زيدان', 'jousanda4@gmail.com', NULL, '01008861616', '01020075888', 'الغربية', NULL, '$2y$10$FzJlN.fGkacRpTezD7/f8.cRdbKKdB7cq.Q7566l8aJK28z.CZPx6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-11-01 05:14:15', '2023-11-01 05:14:15'),
(309, 'ملك مصطفي', 'razanomar788@gmail.com', NULL, '01006415219', '01288245807', 'الغربية', NULL, '$2y$10$o.ODP5R7VprL0yoEBsyc9ObJ4jK.Di0TESn2y7GPANBvb4y43Jf5G', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-11-07 05:26:04', '2023-11-07 05:26:04'),
(310, 'يوسف احمد طه', 'yousefahmedtaha594@gmail.com', NULL, '01094895914', '01559788424', 'الغربية', NULL, '$2y$10$.qZ0xGmoGQXldJJPL6ObROxgsEPQuxkwyZoNqiQZSdqklk/lEeGwy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-11-09 08:38:20', '2023-11-09 08:38:20'),
(311, 'yousefsaad', 'ysd68045@gmail.com', NULL, '01060758203', '01060758203', 'الغربية', NULL, '$2y$10$WMT2QCmCe.m1M96B0szTp.cRQbUj5K7BBuQ03hNUsrMKtczc5kPfi', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-11-10 21:23:14', '2023-11-10 21:23:14'),
(312, 'منة ابراهيم نجم', 'mennaebrahim2272006@gmail.com', NULL, '01001504183', '01002598928', 'الغربية', NULL, '$2y$10$2qzPDGtyZezZSHrKKotRQegVMeVqo6YKlTJNe9CM8DT9CxPtefBly', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-11-12 05:45:43', '2023-11-12 05:45:43'),
(313, 'عبدالله مصطفي', 'abduallahmostafa1122@gmail.com', NULL, '01559311770', '01559311770', 'الغربية', NULL, '$2y$10$Q9WSJ1qnl9aG/QwtPIgNwe/6MxLBKmB5gnSd6COgmfvcwT7PhH86m', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-11-14 21:24:24', '2023-11-14 21:24:24'),
(314, 'Ahela', 'ahelahussein@icloud.com', NULL, '01226996870', '01284804648', 'الغربية', NULL, '$2y$10$OM9hNoSoP.s2aOEccESu3uG/p5wD.2jH7nwzKeaKzfMDgNLvKxdHG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-11-15 10:55:57', '2023-11-15 10:55:57'),
(315, 'عمر محمد', 'omarmohammmed05@gmail.com', NULL, '01200809971', '01091004612', 'الغربية', NULL, '$2y$10$E2HhH2FR2QSLHNhMBNnEQeLrD4iYUrJ4OMGRETxmD73WTseq4IKR6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-11-23 07:03:39', '2023-11-23 07:03:39'),
(316, 'Super Mario', 'kidalal881@cumzle.com', NULL, '01152649130', '01066431589', 'المنوفية', NULL, '$2y$10$Wi0QYiW.XX8ZiwlWnymZ/e7hpMAYVRMYX.h.TA8f0uj/.qN9VM6ZC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-11-29 08:42:18', '2023-11-29 08:42:18'),
(317, 'Norhan Mohamed', 'kn314559@gmail.com', NULL, '01284858335', '01155103441', 'الغربية', NULL, '$2y$10$tZkLsGDcoQKydPzLIb/E9.kHpg/mh2KgVI2zMBeD02V5LZjJ52DnO', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-11-30 03:31:14', '2023-11-30 03:31:14'),
(318, 'عائشه هاني', 'aeshaabotalib61@gmail.com', NULL, '01095347908', '01146169162', 'الغربية', NULL, '$2y$10$3rUIq7iFcC7pcONq5wMFveuy5IAWcgGQL57XSmBCfg2GsJ63AiW/y', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-11-30 04:42:11', '2023-11-30 04:42:11'),
(319, 'احمد شاكر', 'bolt50cr7@gmail.com', NULL, '01507214467', '01204478691', 'الغربية', NULL, '$2y$10$LXAMvoJ0K/WmXXJkZ7Gx3.DeLotT//Wos0C2l8fM9V056QLyAD6Zm', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-01 10:50:57', '2023-12-01 10:50:57'),
(320, 'علي حنتيرة', 'ail.ail20203la@gmail.com', NULL, '01120847571', '01283366058', 'الغربية', NULL, '$2y$10$m9aiSb2hgYo2Gh2vISK34uulxwBY/zONxofYl8Rm8rZWTL/ezHmoW', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-14 21:18:36', '2023-12-14 21:18:36'),
(321, 'احمد شعبان شاكر', 'zrsalarb@hi2.in', NULL, '01204478691', '01552782017', 'الغربية', NULL, '$2y$10$/4FAV/yb7PJyV3PhqED7ju/wl48EgEyv5e7z1pl3NyXLbmfzvMa6C', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-14 22:41:51', '2023-12-14 22:41:51'),
(322, 'اياد اسلام', 'eeyad8060@gmail.com', NULL, '01551079052', '01000732608', 'الغربية', NULL, '$2y$10$4/Y/Jv8TpfuCN3GKBjqjzOcZ/b5WbI888NFw3OE83lJfAPjLJWBSK', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-14 22:44:39', '2023-12-14 22:44:39'),
(323, 'Omar Konbr', 'omarkonbr7@gmail.com', NULL, '01004445129', '01022210478', 'الغربية', NULL, '$2y$10$usdhYcoWcyc0Y3ny4lMua.79oyig7e8kKvO.kbZrP3PusY9LmWB7e', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-15 01:52:06', '2023-12-15 01:52:06'),
(324, 'Malak Elkateib', 'malakelkateeb644@gmail.com', NULL, '01150526868', '01287293315', 'الغربية', NULL, '$2y$10$QmdHnie0vCurAYCa/C40M.pM6shW9hpPXVtMJ6.Y6A7DMkAnz8MLG', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-15 06:43:38', '2023-12-15 06:43:38'),
(325, 'Shaden el fakhrany', 'shaden2007@hotmail.com', NULL, '01066317069', '01091853858', 'الغربية', NULL, '$2y$10$aEgUhtaklxuXIhyGNwudIOkAPVF9WetfWdWQI/S4I8g.N0SXH.Wwa', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-15 07:23:47', '2023-12-15 07:23:47'),
(326, 'مريم محمد الحلواني', 'mariemmohame2008@gmail.com', NULL, '01554963663', '01227656727', 'الغربية', NULL, '$2y$10$.bYnqG.Z2srn2kcT0mbkPus21VvGpHrHzm/WJMbp/oJOi6sd90ht6', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-16 01:31:38', '2023-12-16 01:31:38'),
(327, 'احمد عبداللطيف جابر', 'ahmedabedellatef90@gmail.com', NULL, '01006081452', '01024574533', 'الغربية', NULL, '$2y$10$LxABXc7DEiGr2R5jNvq0C.l9wY2ePPnE77VxyXSL7Akwy11hn5dUe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-16 04:57:24', '2023-12-16 04:57:24'),
(328, 'Muhhamed Essouy', 'mohamedelessouy77@gmail.com', NULL, '01062628000', '01201180760', 'الغربية', NULL, '$2y$10$ZyuJf1ArtUbunS1g8J4.kOC7V5glXfN8DSZaWwz8Q8eaMuBn2OMqO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-16 08:46:34', '2023-12-16 08:46:34'),
(329, 'عبدالرحمن عفيفي', 'Matrixbedo2008@gmail.com', NULL, '01008801550', '01200052772', 'الغربية', NULL, '$2y$10$6JNs4bQTcdygyDZ5Cck5ZuV/Y7AU5pr0XmPRoCPQWIzHgpaN.aPFK', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-16 09:57:49', '2023-12-16 09:57:49'),
(330, 'Khaled', 'lolotaha20008@gmail.com', NULL, '01068096770', '01068096770', 'الغربية', NULL, '$2y$10$qzqIzXFGs2lxEbHixivAgOAqttL3uRMYrZxKQX0t0VfZYTkxgiKHa', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-16 17:01:27', '2023-12-16 17:01:27'),
(331, 'Abdulrhman', 'boodyhussein99@gmail.com', NULL, '01551246300', '01029037710', 'الغربية', NULL, '$2y$10$Qvn93xwrEU93YzSItoxFyOF2kpyMtYQyf/CLKfk2SREPUC6m.cqii', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-16 17:36:44', '2023-12-16 17:36:44'),
(332, 'Safa ashraf', 'ashrafsafa136@gmail.com', NULL, '01030498842', '01003752748', 'الغربية', NULL, '$2y$10$TNvp7qlUD5djHpCYxNGOQe5IJIxQWl/Q4x/n/fm3ORrypc51./VeO', 0, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2023-12-16 19:50:20', '2023-12-16 19:50:20'),
(333, 'Ganna elrefaey', 'gannaelrefaey9@gmail.com', NULL, '01065305062', '01029844151', 'القاهرة', NULL, '$2y$10$EwvSQyq11WLsYF.fY2aBbuclafsLvNFPFn0DbwNRvhvT2gh9S2Xfq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-16 21:24:49', '2023-12-16 21:24:49'),
(334, 'mariam alsaid', 'mariamalsaid558@gmail.com', NULL, '01091182068', '01026872058', 'الغربية', NULL, '$2y$10$p1NAFsE9drbn6e5tIqVA3umw36X1Iim./9ZVKhh6Ck4s6MbBaUMni', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-17 05:00:26', '2023-12-17 05:00:26'),
(335, 'احمد عمرو رجب', 'ahmedyouns914@gmail.com', NULL, '01019259702', '01090626781', 'الغربية', NULL, '$2y$10$JzhIygHgYbqaj6uuBlssyOZbz8ZAfHiWIeGkrPKA3iQR8c6rzt/r2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-17 05:37:58', '2023-12-17 05:37:58'),
(336, 'مريم ابوريه', 'mariamaboraya77@gmail.com', NULL, '01220379582', '01281820549', 'الغربية', NULL, '$2y$10$olyPy20HBPsmfB49vYe9pukeoosF/LYRhZC87LMbkzmuWB467N.GS', 0, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2023-12-17 05:55:32', '2023-12-17 05:55:32'),
(337, 'سلمي حمدي يوسف', 'hamdysalma130@gmail.com', NULL, '01001380027', '01003867229', 'الغربية', NULL, '$2y$10$QASa1XeaCHQLPF4zDM3SP.8YT1bsI8SytgvzNw5Lbpl/p8NhXglPW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-17 09:39:06', '2023-12-17 09:39:06'),
(338, 'ملك غنيم', 'malakghonem9@gmail.con', NULL, '01271277989', '01201439633', 'الغربية', NULL, '$2y$10$AU0YNDaMJypN4NdJYWdLLOnS/DWFnrtgVhzq.T/3jDrmrA.Uo7NAW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-17 10:53:41', '2023-12-17 10:53:41'),
(339, 'Ganna Yaseen', 'gannayassen05@gmail.com', NULL, '01206170194', '01229794603', 'الغربية', NULL, '$2y$10$/k/M6AHFQa69p9SckcKxsu89mX./nAiyheAh9UR9dPJFAl634b9Je', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-17 19:13:16', '2023-12-17 19:13:16'),
(340, 'ردينه محمد', 'rdynhmhmd585@gmail.com', NULL, '01069015258', '01065517746', 'الغربية', NULL, '$2y$10$1FjIhGkwCatiNbwDKlYtCuONjjkAR5m5v4E/V.jnrhOgIyPsGdsjK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-17 23:11:05', '2023-12-17 23:11:05'),
(341, 'Shaza', 'shodytamer10@gmail.com', NULL, '01026455156', '01026455156', 'الغربية', NULL, '$2y$10$kdrSmknc89ZC1FRAFIMO1OAwktKf2mlW2OTc2X8Y44aPz41bm77Jm', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-18 06:38:15', '2023-12-18 06:38:15'),
(342, 'Salma', 'm_hennawy@yahoo.com', NULL, '01060060519', '01225593938', 'الغربية', NULL, '$2y$10$D9DUnTAZMxqpHL2RhB2s9.dkcw7aWcaYj3kbEde43YLYkGJyEdHJ.', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-12-18 08:58:59', '2023-12-18 08:58:59'),
(343, 'معاذ عماد', 'moazemad7001@gmail.com', NULL, '01060007001', '01101004462', 'الغربية', NULL, '$2y$10$Ha2/ZRALd9NFakqmH0YDoOBV/u2NbfVCEnbluunplJU6iMhyeXo3y', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-19 05:04:07', '2023-12-19 05:04:07'),
(344, '𝐍𝐚𝐡𝐥𝐚 𝐀𝐡𝐦𝐞𝐝', 'nhlhahmd379@gmail.com', NULL, '01205963933', '01280554299', 'الغربية', NULL, '$2y$10$FUwA3xLAm4veBGhOZNhKLeUIQFkrZ/PUSXgVIoG6Ly0TY3ecpKKeC', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-19 06:12:35', '2023-12-19 06:12:35'),
(345, 'محمد عاشور', 'pepoashor9@gmail.com', NULL, '01228387505', '01092697429', 'الغربية', NULL, '$2y$10$mYsTdbCgToWXoo8FLrlsWe3O3eXipSF5Vbid5YF/EnE2TLb/5BOdO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-19 20:42:45', '2023-12-19 20:42:45'),
(346, 'هبه الله هاني فاروق سعد', 'alihany7@outlook.com', NULL, '01145411207', '01281185008', 'الغربية', NULL, '$2y$10$.3jEhWNNTlQOOd8tuz.Une9JAtYn7klyY1WYcuJD6x9xwTEjjCq3y', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-12-20 02:27:16', '2023-12-20 02:27:16'),
(347, 'Khadija', 'khadijaehabshahin2007@gamil.com', NULL, '01080564536', '01002343016', 'الغربية', NULL, '$2y$10$gXdhc4PrUGdnpdMpABQ3Y.bWP.2bj85Y1ijc26yjgh5rPy0resPzS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-20 07:32:39', '2023-12-20 07:32:39'),
(348, 'الاء', 'alaaqutb874@gmail.com', NULL, '01150975907', '01020088906', 'الغربية', NULL, '$2y$10$bQV8RqP4Doa3d2ka4vXEl.fgpj93lMei5xsT/uBf8..xncWoKlg6S', 0, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2023-12-20 15:41:15', '2023-12-20 15:41:15'),
(349, 'Menna helal', 'ah7738553@gmail.com', NULL, '01554247185', '01227886417', 'الغربية', NULL, '$2y$10$zlsVJLPeRjYHxssT9NLAB.Rg/6ZF7WlApkQXQtyBYuHoh0uEFariu', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-21 05:42:02', '2023-12-21 05:42:02'),
(350, 'الاء احمد', 'nor.ahmed349@yahoo.com', NULL, '01060827111', '01060826663', 'الغربية', NULL, '$2y$10$a04EYjFlisqNtaTFhJm9QOrvSLMjLmBhZjl79c5Tzn8gYdTuZsnMS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-21 07:02:34', '2023-12-21 07:02:34'),
(351, 'فاطمه محمود', 'fatma2008mahmoud@gmail.com', NULL, '01022515263', '01012822722', 'الغربية', NULL, '$2y$10$DFA6lZ6Dh58668vP5bc3WOo81jGKeMbEuhcK7x5TvO.brhr9UGwNC', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2023-12-21 07:04:07', '2023-12-21 07:04:07'),
(352, 'Kareem elnady', 'kareemelnady3@gmail.com', NULL, '01158682144', '01204420182', 'الغربية', NULL, '$2y$10$Bk8GyTNQZPW5hfuVb6k2J.toBXqFu0iaMC6Gos1fzNIMAD6uDBmlq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-12-21 20:14:12', '2023-12-21 20:14:12'),
(353, 'Adham', 'adhamshehab26@gmail.com', NULL, '01277225909', '01220524959', 'الغربية', NULL, '$2y$10$wRk45BdBr10hIPbVJKgi5uHBerg4hNsRDvsq2/w5pq29wxFhMLMF2', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-22 00:26:28', '2023-12-22 00:26:28'),
(354, 'مهاب تامر أحمد توفيق', 'mohabtamer237@gmail.com', NULL, '01204241801', '01023636634', 'الغربية', NULL, '$2y$10$Cx5PetX0tb/bEUx5u3oKvu9dmHFgRb17WCqrj8tD6o2H65Ooh8TJ6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2023-12-23 15:26:30', '2023-12-23 15:26:30'),
(355, 'جومانه مصطفى فؤاد', 'gomanaelmetwaly@icloud.com', NULL, '01559069068', '01205044408', 'الغربية', NULL, '$2y$10$XE86fg0F00mnPg/RwbrEWuBiSXv00PIg4/75H3g.DigfuoM3kygeq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2023-12-31 07:47:31', '2023-12-31 07:47:31'),
(356, 'usama ragab elshnnawy', 'usamaelshnnawy@gmail.com', NULL, '01018808163', '01017018454', 'الغربية', NULL, '$2y$10$TyAtKkqSYgrnzivOXZL8qepTZMqNtHAeUK2sjyEkACuN62t05Mksi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-01-02 20:20:38', '2024-01-02 20:20:38'),
(357, 'Mohamed allam', 'engahmedgamal@gmail.com', NULL, '01088768899', '01016406670', 'الغربية', NULL, '$2y$10$NTWCcCcCJUF7dqhokPiFkOBkPLIwq.lIeV2XvkJ27VHmQMFSOB8GK', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-01-07 17:25:27', '2024-01-07 17:25:27'),
(358, 'Rahma', 'rahmaala2008@gmail.com', NULL, '01156869125', '01123346332', 'الغربية', NULL, '$2y$10$Hye9buDvDzHrtAyCqqk8AO7ElrQfnyzAiW7FEKrAaMBQxQg9nYeX.', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-01-10 03:56:51', '2024-01-10 03:56:51'),
(359, 'عمر  جاد', 'omarjad583@gmail.com', NULL, '01204083260', '01224569613', 'الغربية', NULL, '$2y$10$31XuxWqswaMbRuUHvjyv9ehLWigIJRPX0hoTBfEiLCAiz92l9X1LG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-01-15 10:21:09', '2024-01-15 10:21:09'),
(360, 'Fatma yasser', 'fatmayaseen549@yahoo.com', NULL, '01227322829', '01227322829', 'الغربية', NULL, '$2y$10$LEzXsyuzGEeWylkLraLYW.wjCD7frbkeaIeEPoPPvkHlqVJjJ4gWC', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-01-15 12:52:49', '2024-01-15 12:52:49'),
(361, 'شهد خالد العدلى', 'shahd6@gmail.com', NULL, '01023009966', '01024968696', 'الغربية', NULL, '$2y$10$gAdXaJDisotll1/9Pjlv7OsmbDmzG.edPyxS5PV/OmPoLnf0T4yQ2', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-01-26 20:18:41', '2024-01-26 20:18:41'),
(362, 'Mohamed masoud', 'mohamedmasoud522@gmail.com', NULL, '01169985473', '01016588223', 'الغربية', NULL, '$2y$10$PUYSHFpbkImDglT.VUvjRu/YxYLqCG87cX8bvDLUs4YUJ/j4TmS92', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-04 07:37:09', '2024-02-04 07:37:09'),
(363, 'Nour Osama', 'saramostafa5544@gmail.com', NULL, '01093660530', '01000961002', 'الغربية', NULL, '$2y$10$.oiU43Ne5AcBIpkd4JymW.ro3gCwcFruZQx56h/Ff081qGfPS3A3y', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-02-06 09:49:33', '2024-02-06 09:49:33'),
(364, 'يوسف مسعود', 'alaayosso45@gmail.com', NULL, '01554051985', '01125593778', 'الغربية', NULL, '$2y$10$r8Wb2D4smTJ4JmG8SoACo..kmlJbYeW6.1CWafeNe1y0iK/a6/0Rq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-07 05:19:01', '2024-02-07 05:19:01'),
(365, 'يوسف محمد فتح الله', 'youseffathala25@gmail.com', NULL, '01019978523', '01503929492', 'الغربية', NULL, '$2y$10$95zAAKnLpapkmFSR05wEf.9VKdqCsMwnaplOMP9Gbi6bpuYaavz6i', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-07 07:14:20', '2024-02-07 07:14:20'),
(366, 'Sama', 'sama.mostafa2069@gmail.com', NULL, '01226804929', '01228426674', 'الغربية', NULL, '$2y$10$xgeVVwM8cWR6tMZ70kT3BeBq2o3o24C4cxoiMo5XXtXI3JFMhoJ.2', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-07 08:42:27', '2024-02-07 08:42:27'),
(367, 'Mayar Elhawati', 'mayarelhawati@gmail.com', NULL, '01033552093', '01060789150', 'الغربية', NULL, '$2y$10$eqSjUBQRxMk2Al8h5WRYWe6N7ZMCqQs1AvqjiBVtk.UV116RrH08C', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-09 06:38:04', '2024-02-09 06:38:04'),
(368, 'احمد خالد عسل', 'ahmedasal217@gmail.com', NULL, '01228491829', '01277725106', 'الغربية', NULL, '$2y$10$8EEemR8sS3xwGGuOnPchoejH4bZTzElaeo1SOCqc2SKHQZCLvaD5a', 0, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2024-02-11 17:20:38', '2024-02-11 17:20:38'),
(369, 'زياد طارق البابلي', 'zeyadelbably693@gmail.com', NULL, '01206468463', '01222540272', 'الغربية', NULL, '$2y$10$JLMTpxUkX2vRW5Oa4WeKMeqccztbaIRh6XK7DTolQ0iZS5Y/FDlrO', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-13 04:19:37', '2024-02-13 04:19:37'),
(370, 'كنزي محمد ماهر', 'kenzymohamedmaher213@gmail.com', NULL, '01550653377', '01070063361', 'الغربية', NULL, '$2y$10$Vq22eGjFCsToYG4Ih50FbOgm4xmGthaSoV84/tCDzASFdZGgV6ZV6', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-13 06:28:34', '2024-02-13 06:28:34'),
(371, 'Yousef elbaradei', 'yousef2elbaradei2@gmail.com', NULL, '01204163402', '01282141223', 'الغربية', NULL, '$2y$10$3a7PUh.oSGLvQl.ieE18ieE50Y5Vm9CTr33bPpaqVL.BINtUE/aXi', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-13 22:20:28', '2024-02-13 22:20:28'),
(372, 'Kareem', 'ka0697918@gmail.com', NULL, '01203597624', '01224383032', 'الغربية', NULL, '$2y$10$fKPZEuSZ40FLm1G2fxn./epfEnMSSa.iklTWbsM8lP8YAP3eRPxyi', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-02-14 08:29:43', '2024-02-14 08:29:43'),
(373, 'نورهان عمرو', 'kim.ronnie.official.01@gmail.com', NULL, '01280150236', '01119150010', 'الغربية', NULL, '$2y$10$xK8cWGLbmbz1yaUn0f7ZBuvqTe159HUvFs.9rNnJZy.TWzMek/HJe', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-15 03:34:34', '2024-02-15 03:34:34'),
(374, 'بسمله محمد عزت', 'basmalamohammed909@gmail.com', NULL, '01006101752', '01015284607', 'الغربية', NULL, '$2y$10$Gk3iqhmlfVdqFiBDFQu3m.UbI.fT4b7xgCHvNDal2Yh2vvfehMhkm', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-15 05:36:35', '2024-02-15 05:36:35'),
(375, 'Ahmed Hussain', 'ahmedhadia370@gmail.com', NULL, '01113348573', '01113327481', 'الغربية', NULL, '$2y$10$2K.wwEShPpeJivTOWkjeWejrnVOYt7xXpXddqQS9T2mSZJspXeTfi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-17 06:42:03', '2024-02-17 06:42:03'),
(376, 'احمد ايهاب', 'aelbohofy206@gmail.com', NULL, '01098175187', '01002019309', 'الغربية', NULL, '$2y$10$pQ6IvSue3NkXHD2Zb7WWY.wxZbdLHD7Us2GP.qHa53oM1C4tjliYq', 0, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2024-02-17 08:11:27', '2024-02-17 08:11:27'),
(377, 'Haidy', 'haidy.elsamanody@icloud.com', NULL, '01066629291', '01224990133', 'الغربية', NULL, '$2y$10$5TtlhNgJ/sL4Bo7SYzpSLOAx9dAea9ZKd1Td7LqpIZVDIYFgCyeRu', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-18 01:02:26', '2024-02-18 01:02:26'),
(378, 'shahd', 'shahdkhaled@hotmail.com', NULL, '01099683841', '01019272096', 'الغربية', NULL, '$2y$10$e5beBqCZqrH6WRi5JZ.AVuEDDc4VVVZQe51ET1AZZaChfFUTX3kZ2', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-18 01:39:30', '2024-02-18 01:39:30');
INSERT INTO `users` (`id`, `name`, `email`, `gender`, `phonenumber`, `phone_parent`, `government`, `email_verified_at`, `password`, `all_points`, `active_points`, `profile`, `subject_id`, `school_grade_id`, `group_id`, `teacher_id`, `remember_token`, `status_exam`, `provider_id`, `provider`, `created_at`, `updated_at`) VALUES
(379, 'روضه على', 'faten.yasen@yahoo.com', NULL, '01503405419', '01270747169', 'الغربية', NULL, '$2y$10$03p.QcQ3aezaFctVBmHxy.NcxOAuUn438uqPedn5l4y1JIMeobHnW', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-18 03:36:10', '2024-02-18 03:36:10'),
(380, 'ياسمين الشاعر', 'Yasmeinabdelkadir@gmail.com', NULL, '01223513090', '01281687732', 'الغربية', NULL, '$2y$10$5RwO3c6ytt.iCvJVae0uX.ZDXAYgb4aVqaBeFcvZ..WvaSpOJi3cq', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-19 08:33:17', '2024-02-19 08:33:17'),
(381, 'Wadie magdy', 'wadiemagdy@gmail.com', NULL, '01271265433', '01271265433', 'الغربية', NULL, '$2y$10$XUC8Rc.n3pUyaXor4DJ8xOxXDfz4IZ/U31n1Y0qPg8p90HogXhLgy', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-20 03:07:03', '2024-02-20 03:07:03'),
(382, 'جوفانى جرجس', 'govanygergesmores@gmail.com', NULL, '01204771193', '01222731193', 'الغربية', NULL, '$2y$10$r8ch5O9buxle4JxR3XOfVOIOhvnwEyxv6ij6pawDIBJdghIB7un7G', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-21 11:46:17', '2024-02-21 11:46:17'),
(383, 'عبد الرحمن محمد', 'am814121@gmail.com', NULL, '01127762591', '01127762591', 'الغربية', NULL, '$2y$10$LR3MjrGeDr7W6vG4vf.pGeNa/4b9c/fjZXezka8baPnC7MUujAceq', 0, 0, NULL, NULL, 1, 2, NULL, NULL, 0, NULL, NULL, '2024-02-23 23:16:18', '2024-02-23 23:16:18'),
(384, 'هادي محمد', 'habem640@gmail.com', NULL, '01024595155', '01024595155', 'الغربية', NULL, '$2y$10$yeb/XNjuzoVE6aCX89kvye1vVQQP4EKciZlHJJVaSlGRZkjWGJG.i', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-25 02:43:46', '2024-02-25 02:43:46'),
(385, 'Abdullah Ibrahim', 'a67377624@gmail.com', NULL, '01507134479', '01508218472', 'الغربية', NULL, '$2y$10$x.HRrxQaORDwxUhi9FzaP.jQBDTiJ4moebZeuHhv8y/bPVg4jsqMO', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-02-25 03:51:10', '2024-02-25 03:51:10'),
(386, 'Alaa Elbarbary', 'loloelbarbary@gmail.com', NULL, '01552793234', '01225605105', 'الغربية', NULL, '$2y$10$NCxU4U9ewiriW0PhvKgAeudhU6KJrvBFWuCpE.aoeUk8N/hu3/rHa', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-26 06:25:04', '2024-02-26 06:25:04'),
(387, 'Malk Tayfour', 'MalokaTayfour21@gmail.com', NULL, '01141645176', '01279437732', 'الغربية', NULL, '$2y$10$Zko47GI4lJeu3xf3rX8Lauxxl9gMbkCfuRBVbtKT6rcjP9k40W.lG', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-02-27 04:14:03', '2024-02-27 04:14:03'),
(388, 'Abanoub Aziz', 'azizabanoub@gmail.com', NULL, '01284116516', '01273486754', 'الغربية', NULL, '$2y$10$f/wOewVjqvDLkjHzsVZrhehQo2LDKw2d.oSunxrLR046avUN5Jq2e', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-02-28 02:18:53', '2024-02-28 02:18:53'),
(389, 'fbvf', 'geoeltorigy@icloud.com', NULL, '01000763773', '01000763774', 'القاهرة', NULL, '$2y$10$LWhzngI9RFTGJ9DXfy.kjO99N.76ccX.jhlshOrrVcX41ei8.FN9O', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-02-28 04:46:19', '2024-02-28 04:46:19'),
(390, 'الاء عبد العزيز عشماوي امين ابو حجازي', '2l227egazy@gmail.com', NULL, '01015139952', '01069803781', 'الغربية', NULL, '$2y$10$MXtBSW/U1cyJ2wnbRCsqU.IbaxGn5MNng8OGHIkkfo4GV0KTqrv.K', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-02-29 03:10:31', '2024-02-29 03:10:31'),
(391, 'Ahmed Elmarhomy', 'eelmarhomy@gmail.com', NULL, '01004206887', '01220071865', 'الغربية', NULL, '$2y$10$V264Iz8BvaVDQX3y4kyxFeDUKL0HusQ/gJjR2cpPJxxfC5Vn7Bx6q', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-03-02 02:47:23', '2024-03-02 02:47:23'),
(392, 'نور محمد الحو', 'nourelhaw02@gmail.com', NULL, '01005126499', '01095604005', 'القاهرة', NULL, '$2y$10$GA2Rvv58K6izNVRdOz9mWe1wKE6atHLBu.rY5igKfNQCLAxFEV5q2', 0, 0, NULL, 1, 3, 4, 1, NULL, 0, NULL, NULL, '2024-03-02 18:34:57', '2024-05-29 22:20:37'),
(393, 'محمد نشأت', 'medonashat20@gmail.com', NULL, '01558961208', '01280214502', 'الغربية', NULL, '$2y$10$xe4MD9zBW55QvxtO6G02U.CD.To46Z6pURdE16zFp4gAS1pt3qX2O', 0, 0, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, '2024-03-03 04:59:42', '2024-03-03 04:59:42'),
(394, 'Amr Hossny', 'mandohossny7@gmail.com', NULL, '01011020253', '01065531369', 'الغربية', NULL, '$2y$10$EmeMbKdrY5/GFQYKLr07ueBQ.yF9cPYzioBVowH9Ep8H4jWGtKjSq', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-04 02:14:55', '2024-03-04 02:14:55'),
(395, 'علي عامر', 'alibabaamer56@gmail.com', NULL, '01281176686', '01226979422', 'الغربية', NULL, '$2y$10$M7jCHz.Bar0owQHLg.D1JOYeuIrpqOakBTtCGYfje9KP4oqbXB0zi', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-03-05 18:12:43', '2024-03-05 18:12:43'),
(396, 'مصطفى السيد مصطفى ياقوت', 'mostafayacout66@gmail.com', NULL, '01204301045', '01289331889', 'الغربية', NULL, '$2y$10$srnOyChBTWe9XbR2cI8hSea2w5PYEYHZ3LcKKoBaueDiVMFz4Z9om', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-06 04:58:14', '2024-03-06 04:58:14'),
(397, 'شذا خالد علي', 'shazakhalid31@gmail.com', NULL, '01091280631', '01067770277', 'الغربية', NULL, '$2y$10$7dU3ssKD8M6pn9QPvFnrou1XhgraxRAv9Avhcw8aXJtM3SX0Oq/mm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-07 01:44:55', '2024-03-07 01:44:55'),
(398, 'basmalamohamed', 'basmalamohamed@gmail.com', NULL, '01024613682', '01550647705', 'الغربية', NULL, '$2y$10$dkreBN7QImWvCtc3K0lqOOAyWjttCkW4hpJqtfnzYjvMC9WFbAyH6', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-11 21:26:32', '2024-03-11 21:26:32'),
(399, 'نهال احمد', 'nehal.ismeal@gmail.com', NULL, '01289887108', '01287415783', 'الغربية', NULL, '$2y$10$2yiDoKCgiQnXXKv8aluvgeR7l2LKGWgMsP5tnwYECbC8x5vsxBs5a', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-03-12 22:34:46', '2024-03-12 22:34:46'),
(400, 'علي محمد الليثي', 'l37668215@gmail.com', NULL, '01221159764', '01223735700', 'الغربية', NULL, '$2y$10$CIt5qM6m99Xak.NvSH4bH.seuPmyWcJGeZjDtvnWKtpnfoN6ssUaS', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-03-14 20:58:50', '2024-03-14 20:58:50'),
(401, 'تسنيم محمود', 'tasnimmahmoud2007@gmail.com', NULL, '01222521463', '01555406789', 'الغربية', NULL, '$2y$10$0KfLvOGUS5.CBl9E6d6i7.UZB4hxz7sea3UJm.MgK3N1x63jLmx0e', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-15 02:55:50', '2024-03-15 02:55:50'),
(402, 'محمد وليد شحاته محمود', 'mohamedwaleed111455@gmail.com', NULL, '01201218498', '01276490038', 'الغربية', NULL, '$2y$10$PPrh0cNTTujsfy2e3Y4lGO/8KxweVjbBQ1AOkCrNDePoC.ssH80Ym', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-03-16 05:55:53', '2024-03-16 05:55:53'),
(403, 'محمد بدر الدين حمدي محمود', 'mohamadbadr803@gmail.com', NULL, '01066407429', '01007528291', 'الغربية', NULL, '$2y$10$f3nhVn/Bt3FOhtcgfR8E/uYJqDm0TmDwb9L03BrXlbvR7pO1vWOpy', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-21 20:18:02', '2024-03-21 20:18:02'),
(404, 'khaled Elnger', 'khaledelnger1@gmail.com', NULL, '01096002655', '01117666600', 'الغربية', NULL, '$2y$10$3FqDqg5LXi1yib/ow79WFeRVcFd8Zo9oupG4zUfqj3J/zc.FMZcKm', 0, 0, NULL, NULL, 3, 4, NULL, NULL, 0, NULL, NULL, '2024-03-24 08:53:09', '2024-03-24 08:53:09'),
(405, 'نور فايد', 'n01091921026@gmail.com', NULL, '01091921026', '01550606573', 'الغربية', NULL, '$2y$10$SMtY.kqsX3zN47mmphCmr.aaKVNqzh8sy8gau4Z/7szHZNXsCwu56', 0, 0, NULL, NULL, 2, 3, NULL, NULL, 0, NULL, NULL, '2024-03-30 16:06:47', '2024-03-30 16:06:47'),
(406, 'Rodina Wael', 'rorowael111@gmail.com', NULL, '01555714810', '01205221525', 'القاهرة', NULL, '$2y$10$iYQnQCYkHzgep77VUhPz..cm.exw3Mlu.5cVW2cLy0Iuvpv5RkGru', 0, 0, NULL, 1, 3, 4, 1, NULL, 0, NULL, NULL, '2024-04-04 08:21:18', '2024-05-29 22:20:05'),
(407, 'Wesam', 'wesamabdin1@gmail.com', NULL, '01066570129', '01019133185', 'البحر الأحمر', NULL, '$2y$10$dC2hDq8uNso1QVg.DCtE9OoUsw5TREPROHV.VT3JY2G0yyBVGe27q', 0, 0, NULL, 1, 3, 4, 1, NULL, 0, NULL, NULL, '2024-04-22 07:21:57', '2024-05-31 08:14:19'),
(408, 'أحمد عادل', 'ag10880768@gmail.com', NULL, '01500121512', '01516204667', 'القاهرة', NULL, '$2y$10$ZtPaQaajW7INcopA5QoXB.FVMD9u8rkjK4mXPl39UKuVgiLIYJwZW', 1000, 600, NULL, 1, 3, 4, 1, NULL, 0, NULL, NULL, '2024-05-24 13:03:44', '2024-05-29 22:16:29'),
(409, 'أحمد خالد', 'ag10801@gmail.com', NULL, '01200121512', '01516204667', 'القاهرة', NULL, '$2y$10$YAjxHNVhHCI6cFZpLEM/Y.YzsNxD3rSW0J1SzmkCYfCVoXlorC6Ey', 0, 0, NULL, NULL, 3, 1, NULL, NULL, 0, NULL, NULL, '2024-05-29 23:36:48', '2024-05-29 23:36:48'),
(410, 'أحمد خالد', 'ah826416@gmail.com', NULL, '01900121512', '01156294667', 'القاهرة', NULL, '$2y$10$zdx.YvBiW.7yml/dqpj/2u/rp.XfTiALGU8muj4xJAVsB7U/pUBB.', 0, 0, NULL, NULL, 3, 1, NULL, NULL, 0, NULL, NULL, '2024-05-31 12:16:33', '2024-05-31 12:16:33'),
(411, 'أحمد خالد', 'ah822416@gmail.com', NULL, '01600121512', '01056294667', 'القاهرة', NULL, '$2y$10$5kp4jY6IsoYCxjMhjIYGQ.yRBeTaWYe5MvI4mB1bxGhykjgS7X/IS', 0, 0, NULL, NULL, 3, 1, NULL, NULL, 0, NULL, NULL, '2024-05-31 13:36:14', '2024-05-31 13:36:14'),
(412, 'mohamed hashim', 'ah82062416@gmail.com', NULL, '01020201510', '01056294667', 'القاهرة', '2024-05-31 14:06:39', '$2y$10$q9Dg6S8Ha8Bed1pugXbuIeajKMqhLDYqRldml05YsAnR0QlkU6NT.', 0, 0, 'users/1674075919800.jpg', NULL, 3, 1, NULL, NULL, 0, NULL, NULL, '2024-05-31 13:39:32', '2024-05-31 14:49:28'),
(413, 'nada youssery', 'ah8262416@gmail.com', NULL, '01019204667', '01056294667', 'القاهرة', '2024-06-01 23:22:18', '$2y$10$Q5aJqntcV1QWvzBwjp.sDeNUfGYJ6MTSPD/F6sJbc1URD0MoJW99S', 550, 300, 'users/340449380_189760030058369_252300388191378691_n.jpg', NULL, 3, 1, NULL, NULL, 0, NULL, NULL, '2024-06-01 23:09:00', '2024-06-02 19:21:02');

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `creds` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vr_services`
--

INSERT INTO `vr_services` (`id`, `name`, `description`, `creds`, `created_at`, `updated_at`) VALUES
(1, 'zoom', NULL, NULL, '2024-05-29 06:11:00', '2024-05-29 06:11:00'),
(2, 'google meet', NULL, NULL, '2024-05-29 06:11:01', '2024-05-29 06:11:01'),
(3, 'vconnect', NULL, NULL, '2024-05-29 06:11:01', '2024-05-29 06:11:01');

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
  ADD KEY `lessons_subject_id_foreign` (`subject_id`),
  ADD KEY `lessons_school_grade_id_foreign` (`school_grade_id`),
  ADD KEY `lessons_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
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
  ADD KEY `posts_subject_id_foreign` (`subject_id`),
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exam_student`
--
ALTER TABLE `exam_student`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `free_exams`
--
ALTER TABLE `free_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `free_videos`
--
ALTER TABLE `free_videos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `governments`
--
ALTER TABLE `governments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `month_student`
--
ALTER TABLE `month_student`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `question_exams`
--
ALTER TABLE `question_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `question_exam_students`
--
ALTER TABLE `question_exam_students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rechagre_balance`
--
ALTER TABLE `rechagre_balance`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `register_tokens`
--
ALTER TABLE `register_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `school_grades`
--
ALTER TABLE `school_grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sessionslive`
--
ALTER TABLE `sessionslive`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=414;

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
  ADD CONSTRAINT `posts_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
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
