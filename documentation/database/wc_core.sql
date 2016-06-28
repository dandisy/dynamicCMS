-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2016 at 02:06 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wc_core`
--

-- --------------------------------------------------------

--
-- Table structure for table `field`
--

CREATE TABLE `field` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `type_id` int(11) UNSIGNED NOT NULL COMMENT 'type_id (text, multitext, etc)',
  `placeholder` varchar(255) DEFAULT NULL COMMENT 'standard / default value of this field',
  `value` varchar(255) DEFAULT NULL,
  `item_id` int(11) UNSIGNED NOT NULL COMMENT 'item_id behalf as parent of this field',
  `required` enum('0','1') NOT NULL DEFAULT '0',
  `readonly` enum('0','1') NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field`
--

INSERT INTO `field` (`id`, `title`, `type_id`, `placeholder`, `value`, `item_id`, `required`, `readonly`, `created_date`, `created_by`) VALUES
(1, 'As Navigation', 4, 'Choose whather this Item treated as navigation', NULL, 6, '1', '1', '2016-06-25 03:22:12', 1),
(2, 'Route', 1, 'SEO friendly url of this Item', NULL, 6, '1', '1', '2016-06-25 03:23:14', 1),
(3, 'View', 1, 'Which view file this Item must be rendered to', NULL, 6, '1', '1', '2016-06-25 05:08:01', 1),
(4, 'Title', 1, 'Subject of this Item', NULL, 7, '1', '1', '2016-06-25 05:11:39', 1),
(5, 'Slug', 1, 'Slug of this Item', NULL, 7, '1', '1', '2016-06-25 05:20:23', 1),
(6, 'Description', 2, 'Description of this Item', NULL, 7, '0', '0', '2016-06-25 06:03:51', 1),
(7, 'HTML Content', 8, 'HTML content of this Item', NULL, 8, '0', '0', '2016-06-25 06:05:06', 1),
(8, 'Image', 7, 'Image of this Item', NULL, 8, '0', '0', '2016-06-25 06:33:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `title`, `description`) VALUES
(1, 'Default', 'Default user group');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `type_id` int(11) UNSIGNED NOT NULL COMMENT 'type_id (item or folder)',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) UNSIGNED NOT NULL,
  `parent_id` int(11) UNSIGNED DEFAULT NULL,
  `domain` int(11) UNSIGNED DEFAULT NULL COMMENT 'Root item id',
  `inherit` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `title`, `icon`, `type_id`, `created_date`, `created_by`, `parent_id`, `domain`, `inherit`) VALUES
(1, 'Content', 'file-text-o', 2, '2016-06-24 09:10:44', 1, NULL, NULL, NULL),
(2, 'Asset', 'folder-open-o', 2, '2016-06-24 09:25:15', 1, NULL, NULL, NULL),
(3, 'Object', 'puzzle-piece', 2, '2016-06-24 09:25:39', 1, NULL, NULL, NULL),
(4, 'Schema', 'th-list', 2, '2016-06-24 09:25:58', 1, NULL, NULL, NULL),
(5, 'Web', NULL, 2, '2016-06-24 09:31:46', 1, 4, 4, NULL),
(6, 'Web Presentation', NULL, 1, '2016-06-24 09:32:41', 1, 5, 4, NULL),
(7, 'Standard Page', NULL, 1, '2016-06-25 03:43:51', 1, 5, 4, 6),
(8, 'Landing Page', NULL, 1, '2016-06-25 03:45:50', 1, 4, 4, 7),
(9, 'Web', NULL, 2, '2016-06-25 04:57:21', 1, 1, 1, NULL),
(10, 'Home', NULL, 1, '2016-06-25 05:30:48', 1, 9, 1, NULL),
(11, 'Component', NULL, 2, '2016-06-25 18:46:42', 1, 3, 3, NULL),
(12, 'Standard Component', NULL, 1, '2016-06-25 18:48:10', 1, 11, 3, NULL),
(13, 'Member', NULL, 1, '2016-06-25 18:50:38', 1, 11, 3, 12),
(14, 'Shop', NULL, 2, '2016-06-28 10:04:45', 1, 1, 1, NULL),
(15, 'Image', NULL, 2, '2016-06-28 10:05:09', 1, 2, 2, NULL),
(16, 'Video', NULL, 2, '2016-06-28 10:05:35', 1, 2, 2, NULL),
(17, 'Document', NULL, 2, '2016-06-28 10:05:52', 1, 2, 2, NULL),
(18, 'Member', NULL, 2, '2016-06-28 10:09:36', 1, 3, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE `item_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`id`, `title`, `description`) VALUES
(1, 'Item', 'Item type'),
(2, 'Folder', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` blob NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `avatar`, `created_date`, `created_by`) VALUES
(1, 'Admin', 'Redbuzz', 'admin@redbuzz.co.id', '+62-21-53661705', 'Jakarta Barat', 0x6176617461722d312e706e67, '2016-06-25 07:37:01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_type_id` int(11) UNSIGNED NOT NULL,
  `privilage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `user_type_id`, `privilage`) VALUES
(1, 1, 'all'),
(2, 2, 'content item'),
(3, 2, 'content data field'),
(4, 2, 'content presentation'),
(5, 2, 'content version'),
(6, 3, 'content item'),
(7, 3, 'content data field'),
(8, 3, 'content version'),
(9, 4, 'dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `standard_asset`
--

CREATE TABLE `standard_asset` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` tinytext,
  `file` blob NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL COMMENT 'id of asset item that behalf as parent of this data',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `standard_component_object`
--

CREATE TABLE `standard_component_object` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `description` tinytext,
  `style` varchar(255) DEFAULT NULL COMMENT 'to styling this ui component using css syntax',
  `item_id` int(11) UNSIGNED NOT NULL COMMENT 'id of object item that behalf as parent of this component',
  `type_id` int(11) UNSIGNED NOT NULL COMMENT 'type of ui component: panel, tabs, accordion, etc',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='for storing ui component definition of object item';

-- --------------------------------------------------------

--
-- Table structure for table `standard_page_schema`
--

CREATE TABLE `standard_page_schema` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` tinytext,
  `item_id` int(11) UNSIGNED NOT NULL,
  `schema_item_id` int(11) UNSIGNED NOT NULL,
  `version_id` int(11) UNSIGNED NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard_page_schema`
--

INSERT INTO `standard_page_schema` (`id`, `title`, `slug`, `description`, `item_id`, `schema_item_id`, `version_id`, `created_date`, `created_by`) VALUES
(1, 'Home', 'home', 'Home page website Tanggo', 10, 7, 1, '2016-06-24 09:27:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL COMMENT 'item or folder, text or multitext or rte or image or option or multioption or check or radio or link or datasource, language or history, layout or module',
  `description` tinytext,
  `category` int(11) UNSIGNED DEFAULT '1' COMMENT '1 for basic, 2 for advance, 3 for other and 0 for uncategory'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `title`, `description`, `category`) VALUES
(1, 'Text', 'Single line plain text', 1),
(2, 'Textarea', 'Multi line plain text', 1),
(3, 'Radio', 'Single choise', 1),
(4, 'Checkbox', 'Multi choise', 1),
(5, 'Option', 'Dropdown option', 1),
(6, 'Multi Option', 'Dropdown multi option', 1),
(7, 'File', 'Single file upload', 1),
(8, 'Text Editor', 'Multi text html support', 2),
(9, 'Date', 'Date picker', 2),
(10, 'Time', 'Time picker', 2),
(11, 'Datetime', 'Datetime picker', 2),
(12, 'Color', 'Color picker', 2),
(13, 'Tags', 'Tags input', 2),
(14, 'Include Option', 'Left include vs right exclude', 2),
(15, 'Media Gallery', 'Multi file upload', 2),
(16, 'Data Source', 'Data from other Item', 2),
(17, 'Data Grid', 'Dynamic table based from data source', 2),
(18, 'Geo Location', 'Geo coordinate picker from maps', 2),
(19, 'Tabs', 'Tabs with data source', 3),
(20, 'Panel', 'Panel window can filled with data field', 3),
(21, 'Accordion', 'Collapsabel panel can fill with data field', 3),
(22, 'Step Panel', 'Staped panel can fill with data field in each step', 3);

-- --------------------------------------------------------

--
-- Table structure for table `type_category`
--

CREATE TABLE `type_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_category`
--

INSERT INTO `type_category` (`id`, `title`, `description`) VALUES
(1, 'Basic', 'Basic html input type'),
(2, 'Advanced', 'UI plugin type'),
(3, 'Layout', 'UI layout type');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `profile_id` int(11) UNSIGNED NOT NULL,
  `user_type_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`, `profile_id`, `user_type_id`, `group_id`) VALUES
(1, 'admin', 'webcore', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `title`, `description`) VALUES
(1, 'Admin', 'Admin page administrator'),
(2, 'Editor', 'Editor of admin page'),
(3, 'Author', 'Author of admin page'),
(4, 'Analyst', 'Analyst of admin page'),
(5, 'Member', 'Member of front page');

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE `version` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` tinytext,
  `type_id` int(11) UNSIGNED NOT NULL COMMENT 'type_id (language or history)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `version`
--

INSERT INTO `version` (`id`, `title`, `description`, `type_id`) VALUES
(1, 'English', 'English version of this Content Item', 2);

-- --------------------------------------------------------

--
-- Table structure for table `version_type`
--

CREATE TABLE `version_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `version_type`
--

INSERT INTO `version_type` (`id`, `title`, `description`) VALUES
(1, 'History', 'Revition versioning'),
(2, 'Language', 'Language versioning');

-- --------------------------------------------------------

--
-- Table structure for table `web_presentation_schema`
--

CREATE TABLE `web_presentation_schema` (
  `id` int(11) UNSIGNED NOT NULL,
  `as_navigation` enum('0','1') NOT NULL DEFAULT '0',
  `route` varchar(45) DEFAULT NULL,
  `view` varchar(45) DEFAULT NULL,
  `item_id` int(11) UNSIGNED NOT NULL,
  `schema_item_id` int(11) UNSIGNED NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_presentation_schema`
--

INSERT INTO `web_presentation_schema` (`id`, `as_navigation`, `route`, `view`, `item_id`, `schema_item_id`, `created_date`, `created_by`) VALUES
(1, '1', '/', 'home', 10, 6, '2016-06-25 04:21:15', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `field_id_uindex` (`id`),
  ADD KEY `field_type_id_fk` (`type_id`),
  ADD KEY `field_item_id_fk` (`item_id`),
  ADD KEY `field_user_id_fk` (`created_by`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id_uindex` (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_id_uindex` (`id`),
  ADD KEY `item_user_id_fk` (`created_by`),
  ADD KEY `item_item_id_fk` (`parent_id`),
  ADD KEY `item_item_type_id_fk` (`type_id`);

--
-- Indexes for table `item_type`
--
ALTER TABLE `item_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_type_id_uindex` (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profile_id_uindex` (`id`),
  ADD KEY `profile_user_id_fk` (`created_by`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_id_uindex` (`id`),
  ADD KEY `role_user_type_id_fk` (`user_type_id`);

--
-- Indexes for table `standard_asset`
--
ALTER TABLE `standard_asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `standard_asset_id_uindex` (`id`),
  ADD KEY `standard_asset_item_id_fk` (`item_id`),
  ADD KEY `standard_asset_user_id_fk` (`created_by`);

--
-- Indexes for table `standard_component_object`
--
ALTER TABLE `standard_component_object`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `standard_object_id_uindex` (`id`),
  ADD KEY `standard_object_item_id_fk` (`item_id`),
  ADD KEY `standard_object_type_id_fk` (`type_id`),
  ADD KEY `standard_object_user_id_fk` (`created_by`);

--
-- Indexes for table `standard_page_schema`
--
ALTER TABLE `standard_page_schema`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `standard_page_schema_id_uindex` (`id`),
  ADD KEY `standard_page_schema_item_id_fk` (`item_id`),
  ADD KEY `standard_page_schema_item_id_1_fk` (`schema_item_id`),
  ADD KEY `standard_page_schema_user_id_fk` (`created_by`),
  ADD KEY `standard_page_schema_version_id_fk` (`version_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type_id_uindex` (`id`);

--
-- Indexes for table `type_category`
--
ALTER TABLE `type_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `field_type_category_id_uindex` (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_uindex` (`id`),
  ADD KEY `user_profile_id_fk` (`profile_id`),
  ADD KEY `user_group_id_fk` (`group_id`),
  ADD KEY `user_user_type_id_fk` (`user_type_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_type_id_uindex` (`id`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `version_id_uindex` (`id`),
  ADD KEY `version_version_type_id_fk` (`type_id`);

--
-- Indexes for table `version_type`
--
ALTER TABLE `version_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `version_type_id_uindex` (`id`);

--
-- Indexes for table `web_presentation_schema`
--
ALTER TABLE `web_presentation_schema`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `web_presentation_schema_id_uindex` (`id`),
  ADD KEY `web_presentation_schema_item_id_fk` (`item_id`),
  ADD KEY `web_presentation_schema_item_id_1_fk` (`schema_item_id`),
  ADD KEY `web_presentation_schema_user_id_fk` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `field`
--
ALTER TABLE `field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `item_type`
--
ALTER TABLE `item_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `standard_asset`
--
ALTER TABLE `standard_asset`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `standard_component_object`
--
ALTER TABLE `standard_component_object`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `standard_page_schema`
--
ALTER TABLE `standard_page_schema`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `type_category`
--
ALTER TABLE `type_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `version`
--
ALTER TABLE `version`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `version_type`
--
ALTER TABLE `version_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `web_presentation_schema`
--
ALTER TABLE `web_presentation_schema`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `field`
--
ALTER TABLE `field`
  ADD CONSTRAINT `field_item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `field_type_id_fk` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `field_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_item_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `item_item_type_id_fk` FOREIGN KEY (`type_id`) REFERENCES `item_type` (`id`),
  ADD CONSTRAINT `item_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_user_type_id_fk` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`);

--
-- Constraints for table `standard_asset`
--
ALTER TABLE `standard_asset`
  ADD CONSTRAINT `standard_asset_item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `standard_asset_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `standard_component_object`
--
ALTER TABLE `standard_component_object`
  ADD CONSTRAINT `standard_object_item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `standard_object_type_id_fk` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `standard_object_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `standard_page_schema`
--
ALTER TABLE `standard_page_schema`
  ADD CONSTRAINT `standard_page_schema_item_id_1_fk` FOREIGN KEY (`schema_item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `standard_page_schema_item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `standard_page_schema_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `standard_page_schema_version_id_fk` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`),
  ADD CONSTRAINT `user_profile_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`),
  ADD CONSTRAINT `user_user_type_id_fk` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`);

--
-- Constraints for table `version`
--
ALTER TABLE `version`
  ADD CONSTRAINT `version_type_id_fk` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `version_version_type_id_fk` FOREIGN KEY (`type_id`) REFERENCES `version_type` (`id`);

--
-- Constraints for table `web_presentation_schema`
--
ALTER TABLE `web_presentation_schema`
  ADD CONSTRAINT `web_presentation_schema_item_id_1_fk` FOREIGN KEY (`schema_item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `web_presentation_schema_item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `web_presentation_schema_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
