-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2021 at 06:07 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lar_djcoin`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  `test` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `interval` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capped_amount` decimal(8,2) DEFAULT NULL,
  `trial_days` int(11) DEFAULT NULL,
  `billing_on` timestamp NULL DEFAULT NULL,
  `activated_on` timestamp NULL DEFAULT NULL,
  `trial_ends_on` timestamp NULL DEFAULT NULL,
  `cancelled_on` timestamp NULL DEFAULT NULL,
  `expires_on` timestamp NULL DEFAULT NULL,
  `plan_id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_charge` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cron_schedule`
--

CREATE TABLE `cron_schedule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wallet_create` int(11) NOT NULL DEFAULT 0,
  `djc_bought` int(11) NOT NULL DEFAULT 0,
  `djc_transfer` int(11) NOT NULL DEFAULT 0,
  `djc_return` int(11) NOT NULL DEFAULT 0,
  `wallet_close` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE `email_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `free_wallets`
--

CREATE TABLE `free_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privatekey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `close` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laravel2step`
--

CREATE TABLE `laravel2step` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `authCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authCount` int(11) NOT NULL,
  `authStatus` tinyint(1) NOT NULL DEFAULT 0,
  `authDate` datetime DEFAULT NULL,
  `requestDate` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laravel_blocker`
--

CREATE TABLE `laravel_blocker` (
  `id` int(10) UNSIGNED NOT NULL,
  `typeId` int(10) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laravel_blocker`
--

INSERT INTO `laravel_blocker` (`id`, `typeId`, `value`, `note`, `userId`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'test.com', 'Block all domains/emails @test.com', NULL, '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL),
(2, 3, 'test.ca', 'Block all domains/emails @test.ca', NULL, '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL),
(3, 3, 'fake.com', 'Block all domains/emails @fake.com', NULL, '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL),
(4, 3, 'example.com', 'Block all domains/emails @example.com', NULL, '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL),
(5, 3, 'mailinator.com', 'Block all domains/emails @mailinator.com', NULL, '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laravel_blocker_types`
--

CREATE TABLE `laravel_blocker_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laravel_blocker_types`
--

INSERT INTO `laravel_blocker_types` (`id`, `slug`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'email', 'E-mail', '2021-01-15 23:49:29', '2021-01-15 23:49:29', NULL),
(2, 'ipAddress', 'IP Address', '2021-01-15 23:49:29', '2021-01-15 23:49:29', NULL),
(3, 'domain', 'Domain Name', '2021-01-15 23:49:29', '2021-01-15 23:49:29', NULL),
(4, 'user', 'User', '2021-01-15 23:49:29', '2021-01-15 23:49:29', NULL),
(5, 'city', 'City', '2021-01-15 23:49:29', '2021-01-15 23:49:29', NULL),
(6, 'state', 'State', '2021-01-15 23:49:29', '2021-01-15 23:49:29', NULL),
(7, 'country', 'Country', '2021-01-15 23:49:29', '2021-01-15 23:49:29', NULL),
(8, 'countryCode', 'Country Code', '2021-01-15 23:49:29', '2021-01-15 23:49:29', NULL),
(9, 'continent', 'Continent', '2021-01-15 23:49:29', '2021-01-15 23:49:29', NULL),
(10, 'region', 'Region', '2021-01-15 23:49:29', '2021-01-15 23:49:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laravel_logger_activity`
--

CREATE TABLE `laravel_logger_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `route` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `methodType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laravel_logger_activity`
--

INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Logged In', 'Registered', 1, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/login', 'POST', '2021-01-15 23:51:40', '2021-01-15 23:51:40', NULL),
(2, 'Viewed home', 'Registered', 1, 'http://127.0.0.1:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/login', 'GET', '2021-01-15 23:51:40', '2021-01-15 23:51:40', NULL),
(3, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/home', 'GET', '2021-01-15 23:51:49', '2021-01-15 23:51:49', NULL),
(4, 'Viewed credentials', 'Registered', 1, 'http://127.0.0.1:8000/credentials', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/wallets', 'GET', '2021-01-15 23:51:52', '2021-01-15 23:51:52', NULL),
(5, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/credentials', 'GET', '2021-01-15 23:53:25', '2021-01-15 23:53:25', NULL),
(6, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-15 23:56:35', '2021-01-15 23:56:35', NULL),
(7, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-15 23:56:36', '2021-01-15 23:56:36', NULL),
(8, 'Logged In', 'Registered', 1, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/login', 'POST', '2021-01-17 07:03:35', '2021-01-17 07:03:35', NULL),
(9, 'Viewed home', 'Registered', 1, 'http://127.0.0.1:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/login', 'GET', '2021-01-17 07:03:36', '2021-01-17 07:03:36', NULL),
(10, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/home', 'GET', '2021-01-17 07:03:47', '2021-01-17 07:03:47', NULL),
(11, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 07:04:19', '2021-01-17 07:04:19', NULL),
(12, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 07:04:20', '2021-01-17 07:04:20', NULL),
(13, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 07:14:28', '2021-01-17 07:14:28', NULL),
(14, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 07:14:28', '2021-01-17 07:14:28', NULL),
(15, 'Viewed config', 'Registered', 1, 'http://127.0.0.1:8000/config', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:12:41', '2021-01-17 08:12:41', NULL),
(16, 'Viewed credentials', 'Registered', 1, 'http://127.0.0.1:8000/credentials', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/config', 'GET', '2021-01-17 08:13:12', '2021-01-17 08:13:12', NULL),
(17, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/credentials', 'GET', '2021-01-17 08:13:15', '2021-01-17 08:13:15', NULL),
(18, 'Viewed config', 'Registered', 1, 'http://127.0.0.1:8000/config', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/wallets', 'GET', '2021-01-17 08:13:19', '2021-01-17 08:13:19', NULL),
(19, 'Created updatePriceRule', 'Registered', 1, 'http://127.0.0.1:8000/updatePriceRule', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/config', 'POST', '2021-01-17 08:13:24', '2021-01-17 08:13:24', NULL),
(20, 'Viewed config', 'Registered', 1, 'http://127.0.0.1:8000/config', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/config', 'GET', '2021-01-17 08:13:27', '2021-01-17 08:13:27', NULL),
(21, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/config', 'GET', '2021-01-17 08:16:33', '2021-01-17 08:16:33', NULL),
(22, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/config', 'GET', '2021-01-17 08:18:07', '2021-01-17 08:18:07', NULL),
(23, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 08:18:14', '2021-01-17 08:18:14', NULL),
(24, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:18:15', '2021-01-17 08:18:15', NULL),
(25, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:19:04', '2021-01-17 08:19:04', NULL),
(26, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 08:19:09', '2021-01-17 08:19:09', NULL),
(27, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:19:10', '2021-01-17 08:19:10', NULL),
(28, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:19:40', '2021-01-17 08:19:40', NULL),
(29, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 08:19:45', '2021-01-17 08:19:45', NULL),
(30, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:19:45', '2021-01-17 08:19:45', NULL),
(31, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:20:48', '2021-01-17 08:20:48', NULL),
(32, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 08:20:53', '2021-01-17 08:20:53', NULL),
(33, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:20:54', '2021-01-17 08:20:54', NULL),
(34, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:21:18', '2021-01-17 08:21:18', NULL),
(35, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 08:21:23', '2021-01-17 08:21:23', NULL),
(36, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:21:23', '2021-01-17 08:21:23', NULL),
(37, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:23:37', '2021-01-17 08:23:37', NULL),
(38, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 08:23:47', '2021-01-17 08:23:47', NULL),
(39, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:23:47', '2021-01-17 08:23:47', NULL),
(40, 'Viewed config', 'Registered', 1, 'http://127.0.0.1:8000/config', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:24:54', '2021-01-17 08:24:54', NULL),
(41, 'Viewed credentials', 'Registered', 1, 'http://127.0.0.1:8000/credentials', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/config', 'GET', '2021-01-17 08:26:31', '2021-01-17 08:26:31', NULL),
(42, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/credentials', 'GET', '2021-01-17 08:26:32', '2021-01-17 08:26:32', NULL),
(43, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 08:26:47', '2021-01-17 08:26:47', NULL),
(44, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:26:48', '2021-01-17 08:26:48', NULL),
(45, 'Viewed config', 'Registered', 1, 'http://127.0.0.1:8000/config', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:30:07', '2021-01-17 08:30:07', NULL),
(46, 'Created updatePriceRule', 'Registered', 1, 'http://127.0.0.1:8000/updatePriceRule', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/config', 'POST', '2021-01-17 08:30:16', '2021-01-17 08:30:16', NULL),
(47, 'Viewed config', 'Registered', 1, 'http://127.0.0.1:8000/config', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/config', 'GET', '2021-01-17 08:30:18', '2021-01-17 08:30:18', NULL),
(48, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/config', 'GET', '2021-01-17 08:30:51', '2021-01-17 08:30:51', NULL),
(49, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 08:30:58', '2021-01-17 08:30:58', NULL),
(50, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:30:58', '2021-01-17 08:30:58', NULL),
(51, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:32:28', '2021-01-17 08:32:28', NULL),
(52, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 08:32:34', '2021-01-17 08:32:34', NULL),
(53, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:32:35', '2021-01-17 08:32:35', NULL),
(54, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:33:06', '2021-01-17 08:33:06', NULL),
(55, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 08:33:11', '2021-01-17 08:33:11', NULL),
(56, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:33:12', '2021-01-17 08:33:12', NULL),
(57, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-17 08:38:38', '2021-01-17 08:38:38', NULL),
(58, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-17 08:38:39', '2021-01-17 08:38:39', NULL),
(59, 'Logged In', 'Registered', 1, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/login', 'POST', '2021-01-17 19:32:29', '2021-01-17 19:32:29', NULL),
(60, 'Viewed home', 'Registered', 1, 'http://127.0.0.1:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/login', 'GET', '2021-01-17 19:32:33', '2021-01-17 19:32:33', NULL),
(61, 'Logged In', 'Registered', 1, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/login', 'POST', '2021-01-18 05:39:27', '2021-01-18 05:39:27', NULL),
(62, 'Viewed home', 'Registered', 1, 'http://127.0.0.1:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/login', 'GET', '2021-01-18 05:39:29', '2021-01-18 05:39:29', NULL),
(63, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/home', 'GET', '2021-01-18 05:40:22', '2021-01-18 05:40:22', NULL),
(64, 'Viewed credentials', 'Registered', 1, 'http://127.0.0.1:8000/credentials', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 05:41:41', '2021-01-18 05:41:41', NULL),
(65, 'Created updateshopifykey', 'Registered', 1, 'http://127.0.0.1:8000/updateshopifykey', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/credentials', 'POST', '2021-01-18 05:43:04', '2021-01-18 05:43:04', NULL),
(66, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/updateshopifykey', 'GET', '2021-01-18 05:58:42', '2021-01-18 05:58:42', NULL),
(67, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 05:58:59', '2021-01-18 05:58:59', NULL),
(68, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 06:01:50', '2021-01-18 06:01:50', NULL),
(69, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 06:02:31', '2021-01-18 06:02:31', NULL),
(70, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 06:02:34', '2021-01-18 06:02:34', NULL),
(71, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 06:03:22', '2021-01-18 06:03:22', NULL),
(72, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 06:04:01', '2021-01-18 06:04:01', NULL),
(73, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 06:04:34', '2021-01-18 06:04:34', NULL),
(74, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 06:05:11', '2021-01-18 06:05:11', NULL),
(75, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 06:05:28', '2021-01-18 06:05:28', NULL),
(76, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 06:07:22', '2021-01-18 06:07:22', NULL),
(77, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 06:07:49', '2021-01-18 06:07:49', NULL),
(78, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 06:08:22', '2021-01-18 06:08:22', NULL),
(79, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/', 'GET', '2021-01-18 06:08:33', '2021-01-18 06:08:33', NULL),
(80, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-18 06:11:21', '2021-01-18 06:11:21', NULL),
(81, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 06:11:22', '2021-01-18 06:11:22', NULL),
(82, 'Created set_wallet_setting', 'Registered', 1, 'http://127.0.0.1:8000/set_wallet_setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'POST', '2021-01-18 06:25:44', '2021-01-18 06:25:44', NULL),
(83, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 06:25:45', '2021-01-18 06:25:45', NULL),
(84, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 06:28:48', '2021-01-18 06:28:48', NULL),
(85, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 06:44:13', '2021-01-18 06:44:13', NULL),
(86, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 06:44:16', '2021-01-18 06:44:16', NULL),
(87, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 06:44:19', '2021-01-18 06:44:19', NULL),
(88, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 06:47:10', '2021-01-18 06:47:10', NULL),
(89, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 06:47:34', '2021-01-18 06:47:34', NULL),
(90, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 06:47:40', '2021-01-18 06:47:40', NULL),
(91, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 06:47:53', '2021-01-18 06:47:53', NULL),
(92, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 06:48:13', '2021-01-18 06:48:13', NULL),
(93, 'Viewed setting', 'Registered', 1, 'http://127.0.0.1:8000/setting', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/wallets', 'GET', '2021-01-18 06:48:21', '2021-01-18 06:48:21', NULL),
(94, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 06:48:25', '2021-01-18 06:48:25', NULL),
(95, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:02:07', '2021-01-18 07:02:07', NULL),
(96, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:02:20', '2021-01-18 07:02:20', NULL),
(97, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:02:34', '2021-01-18 07:02:34', NULL),
(98, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:02:59', '2021-01-18 07:02:59', NULL),
(99, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:04:02', '2021-01-18 07:04:02', NULL),
(100, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:04:13', '2021-01-18 07:04:13', NULL),
(101, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:04:48', '2021-01-18 07:04:48', NULL),
(102, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:05:50', '2021-01-18 07:05:50', NULL),
(103, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:06:29', '2021-01-18 07:06:29', NULL),
(104, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:06:37', '2021-01-18 07:06:37', NULL),
(105, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:06:48', '2021-01-18 07:06:48', NULL),
(106, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:08:01', '2021-01-18 07:08:01', NULL),
(107, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:08:23', '2021-01-18 07:08:23', NULL),
(108, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:10:37', '2021-01-18 07:10:37', NULL),
(109, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:12:19', '2021-01-18 07:12:19', NULL),
(110, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:21:00', '2021-01-18 07:21:00', NULL),
(111, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:21:09', '2021-01-18 07:21:09', NULL),
(112, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:21:19', '2021-01-18 07:21:19', NULL),
(113, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:23:38', '2021-01-18 07:23:38', NULL),
(114, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:24:03', '2021-01-18 07:24:03', NULL),
(115, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:24:16', '2021-01-18 07:24:16', NULL),
(116, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:24:23', '2021-01-18 07:24:23', NULL),
(117, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:38:29', '2021-01-18 07:38:29', NULL),
(118, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:39:04', '2021-01-18 07:39:04', NULL),
(119, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:39:57', '2021-01-18 07:39:57', NULL),
(120, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:40:31', '2021-01-18 07:40:31', NULL),
(121, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:41:03', '2021-01-18 07:41:03', NULL),
(122, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:44:50', '2021-01-18 07:44:50', NULL),
(123, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:45:15', '2021-01-18 07:45:15', NULL),
(124, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:45:26', '2021-01-18 07:45:26', NULL),
(125, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:46:17', '2021-01-18 07:46:17', NULL),
(126, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:47:18', '2021-01-18 07:47:18', NULL),
(127, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:48:12', '2021-01-18 07:48:12', NULL),
(128, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:48:19', '2021-01-18 07:48:19', NULL),
(129, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:49:39', '2021-01-18 07:49:39', NULL),
(130, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:52:25', '2021-01-18 07:52:25', NULL),
(131, 'Viewed wallets', 'Registered', 1, 'http://127.0.0.1:8000/wallets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'en-US,en;q=0.9,ru;q=0.8,ko;q=0.7', 'http://127.0.0.1:8000/setting', 'GET', '2021-01-18 07:57:21', '2021-01-18 07:57:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_07_31_1_email_log', 1),
(4, '2016_01_15_105324_create_roles_table', 1),
(5, '2016_01_15_114412_create_role_user_table', 1),
(6, '2016_01_26_115212_create_permissions_table', 1),
(7, '2016_01_26_115523_create_permission_role_table', 1),
(8, '2016_02_09_132439_create_permission_user_table', 1),
(9, '2016_09_21_001638_add_bcc_column_email_log', 1),
(10, '2017_03_09_082449_create_social_logins_table', 1),
(11, '2017_03_09_082526_create_activations_table', 1),
(12, '2017_03_20_213554_create_themes_table', 1),
(13, '2017_03_21_042918_create_profiles_table', 1),
(14, '2017_11_04_103444_create_laravel_logger_activity_table', 1),
(15, '2017_11_10_001638_add_more_mail_columns_email_log', 1),
(16, '2017_12_09_070937_create_two_step_auth_table', 1),
(17, '2018_05_11_115355_use_longtext_for_attachments', 1),
(18, '2019_02_19_032636_create_laravel_blocker_types_table', 1),
(19, '2019_02_19_045158_create_laravel_blocker_table', 1),
(20, '2019_08_19_000000_create_failed_jobs_table', 1),
(21, '2020_01_29_010501_create_plans_table', 1),
(22, '2020_01_29_230905_create_shops_table', 1),
(23, '2020_01_29_231006_create_charges_table', 1),
(24, '2020_07_03_211514_add_interval_column_to_charges_table', 1),
(25, '2020_07_03_211854_add_interval_column_to_plans_table', 1),
(26, '2020_12_30_141546_create_shopifykey_table', 1),
(27, '2021_01_12_083520_create_fakewallets_table', 1),
(28, '2021_01_12_092619_create_transaction_history_table', 1),
(29, '2021_01_15_094757_create_cron_schedule_table', 1),
(30, '2021_01_18_153102_create_free_wallets_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `model`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Can View Users', 'view.users', 'Can view users', 'Permission', '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL),
(2, 'Can Create Users', 'create.users', 'Can create new users', 'Permission', '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL),
(3, 'Can Edit Users', 'edit.users', 'Can edit users', 'Permission', '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL),
(4, 'Can Delete Users', 'delete.users', 'Can delete users', 'Permission', '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL),
(2, 2, 1, '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL),
(3, 3, 1, '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL),
(4, 4, 1, '2021-01-15 23:49:34', '2021-01-15 23:49:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `interval` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capped_amount` decimal(8,2) DEFAULT NULL,
  `terms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_days` int(11) DEFAULT NULL,
  `test` tinyint(1) NOT NULL DEFAULT 0,
  `on_install` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `theme_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `theme_id`, `location`, `bio`, `twitter_username`, `github_username`, `avatar`, `avatar_status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-15 23:49:35', '2021-01-15 23:49:35'),
(2, 2, 1, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-15 23:49:35', '2021-01-15 23:49:35');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin', 'Admin Role', 5, '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL),
(2, 'User', 'user', 'User Role', 1, '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL),
(3, 'Unverified', 'unverified', 'Unverified Role', 0, '2021-01-15 23:49:33', '2021-01-15 23:49:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2021-01-15 23:49:35', '2021-01-15 23:49:35', NULL),
(2, 2, 2, '2021-01-15 23:49:35', '2021-01-15 23:49:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shopifykey`
--

CREATE TABLE `shopifykey` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apikey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shopifykey`
--

INSERT INTO `shopifykey` (`id`, `domain`, `token`, `apikey`, `secret`, `created_at`) VALUES
(1, 'dev.djcoin.com', '5d5fbb5d1c2471e1a876b17757c3b761', '5d5fbb5d1c2471e1a876b17757c3b761', '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', '2021-01-18 14:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `social_logins`
--

CREATE TABLE `social_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `link`, `notes`, `status`, `taggable_type`, `taggable_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Default', 'null', NULL, 1, 'theme', 1, '2021-01-15 23:49:34', '2021-01-15 23:49:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` smallint(6) NOT NULL,
  `hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privatekey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signup_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_confirmation_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_sm_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `shopify_grandfathered` tinyint(1) NOT NULL DEFAULT 0,
  `shopify_namespace` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopify_freemium` tinyint(1) NOT NULL DEFAULT 0,
  `plan_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `wallet_address`, `privatekey`, `txid`, `from_address`, `to_address`, `amount`, `remember_token`, `activated`, `token`, `signup_ip_address`, `signup_confirmation_ip_address`, `signup_sm_ip_address`, `admin_ip_address`, `updated_ip_address`, `deleted_ip_address`, `created_at`, `updated_at`, `deleted_at`, `shopify_grandfathered`, `shopify_namespace`, `shopify_freemium`, `plan_id`) VALUES
(1, 'Admin', 'Admin', 'Admin', 'webserver@djcoin.net', NULL, '$2y$10$lBZvKmW1U53RQXtI15bEy.55mXog0qTVhfemX0/7HtZwHZ6mYQsdy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'gLBZvcHK3u1VPe7tp66Obrj8w5nNPoZWUyMasP5ikFxoyRq6eB2a4v1ebkhNEiuB', NULL, '127.0.0.1', NULL, '127.0.0.1', NULL, NULL, '2021-01-15 23:49:35', '2021-01-15 23:49:35', NULL, 0, NULL, 0, NULL),
(2, 'User', 'Anton', 'Anton', 'phoenixdeveloper0909@gmail.com', NULL, '$2y$10$v7tifyYpWp3nTvaUaKn3h.fS/9rHOpoA08yrpJ0yPujA66eWyvmZu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '8dEdEN4LaCrag7OO7UU0IIqXsShaYmZex0lmqaVpVOmphXdi8W1VJx6m3bZwxnbf', '127.0.0.1', '127.0.0.1', NULL, NULL, NULL, NULL, '2021-01-15 23:49:35', '2021-01-15 23:49:35', NULL, 0, NULL, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `charges_user_id_foreign` (`user_id`),
  ADD KEY `charges_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `cron_schedule`
--
ALTER TABLE `cron_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_log`
--
ALTER TABLE `email_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `free_wallets`
--
ALTER TABLE `free_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laravel2step`
--
ALTER TABLE `laravel2step`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laravel2step_userid_index` (`userId`);

--
-- Indexes for table `laravel_blocker`
--
ALTER TABLE `laravel_blocker`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `laravel_blocker_value_unique` (`value`),
  ADD KEY `laravel_blocker_typeid_index` (`typeId`),
  ADD KEY `laravel_blocker_userid_index` (`userId`);

--
-- Indexes for table `laravel_blocker_types`
--
ALTER TABLE `laravel_blocker_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `laravel_blocker_types_slug_unique` (`slug`);

--
-- Indexes for table `laravel_logger_activity`
--
ALTER TABLE `laravel_logger_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_user_permission_id_index` (`permission_id`),
  ADD KEY `permission_user_user_id_index` (`user_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_theme_id_foreign` (`theme_id`),
  ADD KEY `profiles_user_id_index` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_index` (`role_id`),
  ADD KEY `role_user_user_id_index` (`user_id`);

--
-- Indexes for table `shopifykey`
--
ALTER TABLE `shopifykey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_logins`
--
ALTER TABLE `social_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_logins_user_id_index` (`user_id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `themes_name_unique` (`name`),
  ADD UNIQUE KEY `themes_link_unique` (`link`),
  ADD KEY `themes_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`),
  ADD KEY `themes_id_index` (`id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_name_unique` (`name`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_plan_id_foreign` (`plan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_schedule`
--
ALTER TABLE `cron_schedule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `email_log`
--
ALTER TABLE `email_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `free_wallets`
--
ALTER TABLE `free_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `laravel2step`
--
ALTER TABLE `laravel2step`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laravel_blocker`
--
ALTER TABLE `laravel_blocker`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `laravel_blocker_types`
--
ALTER TABLE `laravel_blocker_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `laravel_logger_activity`
--
ALTER TABLE `laravel_logger_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permission_user`
--
ALTER TABLE `permission_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shopifykey`
--
ALTER TABLE `shopifykey`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_logins`
--
ALTER TABLE `social_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activations`
--
ALTER TABLE `activations`
  ADD CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `charges`
--
ALTER TABLE `charges`
  ADD CONSTRAINT `charges_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  ADD CONSTRAINT `charges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `laravel2step`
--
ALTER TABLE `laravel2step`
  ADD CONSTRAINT `laravel2step_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `laravel_blocker`
--
ALTER TABLE `laravel_blocker`
  ADD CONSTRAINT `laravel_blocker_typeid_foreign` FOREIGN KEY (`typeId`) REFERENCES `laravel_blocker_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`),
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_logins`
--
ALTER TABLE `social_logins`
  ADD CONSTRAINT `social_logins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
