-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2016 at 02:07 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wc_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `landing_page_schema`
--

CREATE TABLE `landing_page_schema` (
  `id` int(11) UNSIGNED NOT NULL,
  `html_content` text,
  `image` text,
  `item_id` int(11) UNSIGNED NOT NULL,
  `schema_item_id` int(11) UNSIGNED NOT NULL,
  `published_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `landing_page_schema`
--

INSERT INTO `landing_page_schema` (`id`, `html_content`, `image`, `item_id`, `schema_item_id`, `published_date`, `created_by`) VALUES
(1, 'Test <b>Webcore</b>', NULL, 10, 8, '2016-06-25 06:45:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `member_object`
--

CREATE TABLE `member_object` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(40) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` tinytext,
  `role_id` int(11) UNSIGNED NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `thumbnail_asset`
--

CREATE TABLE `thumbnail_asset` (
  `id` int(11) UNSIGNED NOT NULL,
  `thumbnail` blob NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `landing_page_schema`
--
ALTER TABLE `landing_page_schema`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `landing_page_schema_id_uindex` (`id`),
  ADD KEY `landing_page_schema_wc_core_item_id_1_fk` (`schema_item_id`),
  ADD KEY `landing_page_schema_wc_core_item_id_fk` (`item_id`),
  ADD KEY `landing_page_schema_wc_core_user_id_fk` (`created_by`);

--
-- Indexes for table `member_object`
--
ALTER TABLE `member_object`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `member_object_id_uindex` (`id`);

--
-- Indexes for table `thumbnail_asset`
--
ALTER TABLE `thumbnail_asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `thumbnail_asset_id_uindex` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `landing_page_schema`
--
ALTER TABLE `landing_page_schema`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `member_object`
--
ALTER TABLE `member_object`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `thumbnail_asset`
--
ALTER TABLE `thumbnail_asset`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `landing_page_schema`
--
ALTER TABLE `landing_page_schema`
  ADD CONSTRAINT `landing_page_schema_wc_core_item_id_1_fk` FOREIGN KEY (`schema_item_id`) REFERENCES `wc_core`.`item` (`id`),
  ADD CONSTRAINT `landing_page_schema_wc_core_item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `wc_core`.`item` (`id`),
  ADD CONSTRAINT `landing_page_schema_wc_core_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `wc_core`.`user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
