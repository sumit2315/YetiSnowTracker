-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2016 at 04:40 AM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yetisnowtracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_citys`
--

DROP TABLE IF EXISTS `active_citys`;
CREATE TABLE IF NOT EXISTS `active_citys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BCAAD2FA67B3B43D` (`users_id`),
  KEY `IDX_BCAAD2FA8BAC62AF` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charge_sub_types`
--

DROP TABLE IF EXISTS `charge_sub_types`;
CREATE TABLE IF NOT EXISTS `charge_sub_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_types_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_DCD4C7CB285A8FC4` (`charge_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charge_types`
--

DROP TABLE IF EXISTS `charge_types`;
CREATE TABLE IF NOT EXISTS `charge_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `citys`
--

DROP TABLE IF EXISTS `citys`;
CREATE TABLE IF NOT EXISTS `citys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `states_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3A9760BCB17973F` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countrys`
--

DROP TABLE IF EXISTS `countrys`;
CREATE TABLE IF NOT EXISTS `countrys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_equipments`
--

DROP TABLE IF EXISTS `driver_equipments`;
CREATE TABLE IF NOT EXISTS `driver_equipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) DEFAULT NULL,
  `equipments_id` int(11) DEFAULT NULL,
  `assign_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B28AF8FC3423909` (`driver_id`),
  KEY `IDX_B28AF8FBD251DD7` (`equipments_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_reports`
--

DROP TABLE IF EXISTS `driver_reports`;
CREATE TABLE IF NOT EXISTS `driver_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) DEFAULT NULL,
  `equipments_id` int(11) DEFAULT NULL,
  `sites_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `before_image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `after_image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_34E0C325C3423909` (`driver_id`),
  KEY `IDX_34E0C325BD251DD7` (`equipments_id`),
  KEY `IDX_34E0C3257838E496` (`sites_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipments`
--

DROP TABLE IF EXISTS `equipments`;
CREATE TABLE IF NOT EXISTS `equipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractor_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `equipment_types_id` int(11) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_6F6C2544B0265DC7` (`contractor_id`),
  KEY `IDX_6F6C2544EA000B10` (`class_id`),
  KEY `IDX_6F6C2544BE71B771` (`equipment_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_types`
--

DROP TABLE IF EXISTS `equipment_types`;
CREATE TABLE IF NOT EXISTS `equipment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_types_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_B069A8D4285A8FC4` (`charge_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

DROP TABLE IF EXISTS `service_types`;
CREATE TABLE IF NOT EXISTS `service_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_types_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_F04264D7285A8FC4` (`charge_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
CREATE TABLE IF NOT EXISTS `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `states_id` int(11) DEFAULT NULL,
  `salt_types_id` int(11) DEFAULT NULL,
  `service_types_id` int(11) DEFAULT NULL,
  `weather_zones_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `site_ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8_unicode_ci,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lane` int(11) DEFAULT NULL,
  `sidewalk` int(11) DEFAULT NULL,
  `salt_charge` int(11) DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_BC00AA6319EB6921` (`client_id`),
  KEY `IDX_BC00AA63B17973F` (`states_id`),
  KEY `IDX_BC00AA6358AA352B` (`salt_types_id`),
  KEY `IDX_BC00AA6377C4686A` (`service_types_id`),
  KEY `IDX_BC00AA6347404C81` (`weather_zones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_charge_types`
--

DROP TABLE IF EXISTS `site_charge_types`;
CREATE TABLE IF NOT EXISTS `site_charge_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sites_id` int(11) DEFAULT NULL,
  `charge_sub_types_id` int(11) DEFAULT NULL,
  `equipment_types_id` int(11) DEFAULT NULL,
  `charge` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_849E18AB7838E496` (`sites_id`),
  KEY `IDX_849E18ABFEBEEB09` (`charge_sub_types_id`),
  KEY `IDX_849E18ABBE71B771` (`equipment_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_drivers`
--

DROP TABLE IF EXISTS `site_drivers`;
CREATE TABLE IF NOT EXISTS `site_drivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) DEFAULT NULL,
  `contractor_id` int(11) DEFAULT NULL,
  `sites_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_1FB421CCC3423909` (`driver_id`),
  KEY `IDX_1FB421CCB0265DC7` (`contractor_id`),
  KEY `IDX_1FB421CC7838E496` (`sites_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_31C2774DF92F3E70` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) DEFAULT NULL,
  `user_types_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` longtext COLLATE utf8_unicode_ci,
  `address2` longtext COLLATE utf8_unicode_ci,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_carrier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_contact_first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_contact_last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_contact_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reset_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1483A5E95D83CC1` (`state_id`),
  KEY `IDX_1483A5E96E3FD757` (`user_types_id`),
  KEY `IDX_1483A5E9DE12AB56` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `state_id`, `user_types_id`, `created_by`, `firstname`, `lastname`, `address1`, `address2`, `city`, `postal_code`, `phone`, `mobile`, `mobile_carrier`, `username`, `password`, `email`, `notes`, `status`, `company_name`, `fax`, `additional_contact_first_name`, `additional_contact_last_name`, `additional_contact_email`, `updated_at`, `created_at`, `remember_token`, `reset_password`) VALUES
(34, NULL, NULL, NULL, 'Sumit', 'Kapoor', 'fgbfgh', 'gfhgfh', 'gfjghjg', 'hjghj', NULL, NULL, 'ghjghj', 'skumar5', '$2y$10$.vTRyZ6YJSuTbdACbspcmelpJmi0.ty5sDUWX9vHNL0A/Ua8mI6Lm', 'skumar5@seasiainfotech.com', 'ghjghghjghj', 1, 'jghjg', 'hjghj', NULL, NULL, NULL, '2016-08-17 12:41:20', '2016-08-16 12:36:59', 'OL8Fto5ms5LV7MiiDjdJZJIgGwZg9mEprUe8W97ZrisrU9SInFezwByd7Jf9', ''),
(35, NULL, NULL, NULL, 'Dabbu', 'Singh', '#4 abc', '#5 mohali', 'mohali', '104236', NULL, NULL, 'Air', 'Dabbusingh', '$2y$10$Z8Xqkbj1nQSUuhcbTuZ1AOA1cW8/Zy4Z33FUIbrD3dIEntcW3/d/q', 'Dabbu@yopmail.com', 'testing', 0, 'testing', '987654321', NULL, NULL, NULL, '2016-08-17 05:14:04', '2016-08-17 04:15:47', '', '57b3f29c3f14f'),
(36, NULL, NULL, NULL, 'mahasweta', 'Singh', '@mohali', '#mohali', 'mohali', 'Abcdefgh', NULL, NULL, 'voda', 'mahasweta', '$2y$10$toTEmfwsqHBi8E506Umkxu76YsTukppuL2hNR0SzVsE7v/VQ6ov6y', 'singhmahasweta@seasiainfotech.com', 'welcome', 1, 'mohali', 'hvhvbvbvb', NULL, NULL, NULL, '2016-08-18 12:38:25', '2016-08-17 04:29:35', '4FCjRWYOVW7QVevUYuw9QhdYu2JQdjF2iTwTxj0pMQPRcZnPuzzbKFM2mrYd', ''),
(37, NULL, NULL, NULL, 'navjot', 'singh', '# 301/24, vishnu nagar, jagadhri workshop, yamuna nagar(Haryana)', '# 301/24, vishnu nagar, jagadhri workshop, yamuna nagar(Haryana)', 'Yamunanagar', 'ab135002', NULL, NULL, 'airtel', 'Navjot', '$2y$10$lXqc9xBzZRjGAcSmh9/oeOdsOazKWTNGDxhaPEhAY.hAMXQxHbmH2', 'nsingh2@seasiainfotech.com', 'Testing this side', 1, 'seasia infotech', '3243242sdfsdf', NULL, NULL, NULL, '2016-08-17 08:50:54', '2016-08-17 04:54:50', '', ''),
(38, NULL, NULL, NULL, 'aadi', 'singh', 'zirakpur', 'zirakpur', 'chandigarh', '789456', NULL, NULL, 'voda', 'aadising', '$2y$10$ZZ9LGY0Nbem/C3vWI0PJruda/4nL8PW7IIDKhFsKMEHemZjW/J3Ki', 'aadi@yopmail.com', 'welcome', 0, 'seasia', '787997979', NULL, NULL, NULL, '2016-08-17 05:12:49', '2016-08-17 05:01:55', '', ''),
(39, NULL, NULL, NULL, 'sweta', 'singh', 'zirakpur', 'zirakpur', 'chandigarh', '3454576', NULL, NULL, 'voda', 'swetasingh', '$2y$10$Qp9NYgn.3uwNt7MMfyqIcOxRk.VYtGbMUdLdr7kbPjaoCOVv8gNE.', 'sweta@yopmail.com', 'welcome to the yeti', 0, 'welcome yeti', '789797', NULL, NULL, NULL, '2016-08-17 05:26:58', '2016-08-17 05:26:58', '', ''),
(40, NULL, NULL, NULL, 'shikha', 'singh', 'Zirakpur', 'mohali', 'chandigarh', '123455', NULL, NULL, 'voda', 'shikha', '$2y$10$A5KJyqgHCKA2GHyLqsXFku62aDf8srne/qKSVjLnhQzomTBXKGpne', 'shikha@yopmail.com', 'welcome to yeti', 1, 'yeti', '7894546', NULL, NULL, NULL, '2016-08-18 10:35:25', '2016-08-17 05:29:54', '', ''),
(41, NULL, NULL, NULL, 'bindu', 'sharma', 'zirakpur', 'chandigarh', 'mohali', '78787878', NULL, NULL, 'voda', 'bindusharma', '$2y$10$YhSvjfM0S.Iwuzb13CvUlu.N9DsoY9JjZGr//0j5cq1csf.3hVdji', 'bindu@yopmail.com', 'hsvdhsvah', 0, 'sfdgcgc', '6757575', NULL, NULL, NULL, '2016-08-17 05:32:28', '2016-08-17 05:32:28', '', ''),
(42, NULL, NULL, NULL, 'taani', 'singh', 'zirakpur', '', 'zirakpur', '234tert', NULL, NULL, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'taanis', '$2y$10$qEjG.IUUCtw1AvWEiQkic.tlUKYM.42x0U2YtN5cEX7Ap14B08ONS', 'taani@yopmail.com', 'weta singh sweta singh gsdhfhsdsweta singh sweta singh sweta singh ', 0, 'wcvnjdn', 'dfhcfhghgj', NULL, NULL, NULL, '2016-08-17 05:46:40', '2016-08-17 05:46:40', '', ''),
(43, NULL, NULL, NULL, 'taaniS', 'singh', 'zirakpur', '', 'zirakpur', '234tert', NULL, NULL, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'taanisgffdvbdjbfgnmdbgfbfbdfjbgdfjkgbjkdfhbfnbnbnbfnbgnfbnbnbfb', '$2y$10$9Dx9ytY6VSnlY6GtoiLKvOqYnD4yZq.tSixrDkCGrCapivWuTltFW', 'taanis@yopmail.com', 'weta singh sweta singh gsdhfhsdsweta singh sweta singh sweta singh ', 0, 'wcvnjdn', 'dfhcfhghgj', NULL, NULL, NULL, '2016-08-17 05:54:05', '2016-08-17 05:48:21', '', '57b3fbfd24798'),
(44, NULL, NULL, NULL, 'xfgg', 'ffgdf', 'fgjkbgjkbj', 'qjbfjgbj', 'jfbgjbj', 'nbjqbej', NULL, NULL, 'dbfgjsdjfgdjfgjdgfdgfjdfgj', 'sdfsdf', '$2y$10$k9cEaUnpDyo/sHMnkk.E6.H090uUxM6rLN1NzvcGL77VmXsN7uatO', 'abcdefg@yopmail.com', 'fjghjdhjdhfjdh', 0, 'jfghjdfhgjhgj', 'bjbvnbnmbnb', NULL, NULL, NULL, '2016-08-17 06:01:43', '2016-08-17 06:01:43', '', ''),
(45, NULL, NULL, NULL, 'Register', 'Register', 'Register', 'Register', 'Register', 'Register', NULL, NULL, 'Register', 'Register', '$2y$10$F2WXZ.6CfMfyAAfC60mNhewrdjvYg1v17QJTwkEB8ak3b6lAHH2Zy', 'Register@yopmail.com', 'Register', 0, 'Register Register', 'Register', NULL, NULL, NULL, '2016-08-18 12:37:01', '2016-08-17 06:03:49', '', '57b5abedf41d5'),
(46, NULL, NULL, NULL, 'registeration', 'registeration', 'registeration', 'registeration', 'registeration', 'registeration', NULL, NULL, 'registeration', 'registername123', '$2y$10$s2CliyAKJh8lzISKzuz63.sophas7c7gLdND9pbGj6Hg3p66FRxS.', 'registeration@yopmail.com', 'registeration', 0, 'registeration', 'registeration', NULL, NULL, NULL, '2016-08-17 06:34:13', '2016-08-17 06:34:13', '', ''),
(47, NULL, NULL, NULL, 'rahul', 'gupta', '# 301/24,  vishnu nagar,  jagadhri workshop,  yamuna nagar(Haryana)', '# 301/24, vishnu nagar, jagadhri workshop, yamuna nagar(Haryana)', 'ambala', '133332', NULL, NULL, 'tatadocomo', 'rahul1', '$2y$10$2MLMrbdLPYzazuag1fUtJu8AR160GjYzdLCbajPZUGhRFAs8T043i', 'guptarahul@seasiainfotech.com', 'Test message this  side from testing team Test message this  side from testing team Test message this  side from testing team Test message thTest mess', 1, 'Seasia infotech', '11111', NULL, NULL, NULL, '2016-08-17 09:27:18', '2016-08-17 06:35:59', 'mo1SyTGxeut5dCQ4anp87baTLtjD0EfVTrs4MeApHFZdj6MN8KWVnpqK7iLg', ''),
(57, NULL, NULL, NULL, 'ashish', 'shah', 'sdfgsdfg', 'fghjfghjfghj', 'fghjfghjfghj', 'fghjfghjfghj', NULL, NULL, 'dfhfghjfghj', 'ashish', '$2y$10$/xJvpV3iL61g0BxI1zscIe0nnBHpWyEIkto1TGoaNOMIZJnQI3wii', 'shahashish@seasiainfotech.com', 'fghjfghj', 1, 'fgjfgj', '34534', NULL, NULL, NULL, '2016-08-18 12:43:01', '2016-08-17 13:48:45', 'xzn9SuYxzp4P7Go6vhJeMElrM3kP7XEGgwqK68PzZRxOFIYGJNBqipUgQYhn', ''),
(58, NULL, NULL, NULL, 'bindu', 'Mehta', 'mehtabindu@seasiainfotech.com', 'mehtabindu@seasiainfotech.com', 'uttar presdesh', '123456', NULL, NULL, 'voda', 'mehtabindu', '$2y$10$k0pabY0qhLjtQgsdYDO2F.ZykLEiuKZKKfVRCIn2P2aJSc6FzvvGy', 'mehtabindu@seasiainfotech.com', 'mehtabindu@seasiainfotech.com', 0, 'easiainfotech.com', '789555', NULL, NULL, NULL, '2016-08-18 08:46:32', '2016-08-18 08:46:32', '', ''),
(59, NULL, NULL, NULL, 'Bindu', 'Mehta', 'mohlai city', '', 'mohali city', '567576', NULL, NULL, 'docomo', 'bindumehta', '$2y$10$wr2MBaH7YGl1/KDPS6l3kOYCluQc4gWZep/5phU00oIUL/VHbNNby', 'KumariShabnam@SEASIAINFOTECH.COM', 'docomo vodadocomo vodadocomo vodadocomo vodadocomo voda', 0, 'docomo voda', '54757847587', NULL, NULL, NULL, '2016-08-18 09:10:52', '2016-08-18 09:10:52', '', ''),
(60, NULL, NULL, NULL, 'deepak', 'singh', 'seasia', 'seasia ', 'mohali', '12345', NULL, NULL, 'voda', 'deepak', '$2y$10$GTOWBoFzh1bd7T9CIeXr3ucSa.iT1W4k3p36J6f993i0x2jFnkm5W', 'deepak@seasiainfotech.com', 'ghsgdhgh', 1, 'mohali', '67678676', NULL, NULL, NULL, '2016-08-18 09:54:19', '2016-08-18 09:13:27', 'wuGv6WlwaK34EVOC6EdRyDAISD54iohEQy0NzRszu1yz9iyjDDcnfQYs142G', ''),
(61, NULL, NULL, NULL, 'bindu', 'Mehta', 'mehtabindu@seasiainfotech.com', 'mehtabindu@seasiainfotech.com', 'mohali city', 'fjnxjn45454', NULL, NULL, 'dsfsdf dfgdfg edr', 'bindumehtaq', '$2y$10$24EAr7v.zAhCXmM9QoDXo.RM33u8ZXKllxGWSV4xYqbXXEz3eNiVS', 'Dabbuu@yopmail.com', 'rtyery', 1, 'docomo voda', '54757847587', NULL, NULL, NULL, '2016-08-18 10:04:43', '2016-08-18 10:02:58', '', ''),
(62, NULL, NULL, NULL, 'taani', 'singh', 'address mohali', '', 'mohali city', '1223698mohali', NULL, NULL, 'tata docomo', 'taanisingh', '$2y$10$EZaSmd9nFc.InZR5AjqKD.cQeOSrV4fbx4YJwAI2NE34QEys4WYvO', 'taanisingh@yopmail.com', 'vdvbsvhv', 1, 'mohali', '21212121', NULL, NULL, NULL, '2016-08-18 10:19:51', '2016-08-18 10:17:41', '', ''),
(63, NULL, NULL, NULL, 'shikha', 'singh', 'mohali', 'nagar', 'sas nagar', '7878787', NULL, NULL, 'tata', 'shikhasingh', '$2y$10$XEWTXhu9snwvE/IRNUIOU.Q1aTSSMx9/L3Jt6W8u4vDAKqnFRfGA.', 'shikhasingh@yopmail.com', 'gahshsffh', 1, 'voda', '86767', NULL, NULL, NULL, '2016-08-18 12:37:47', '2016-08-18 10:23:13', 'ZAMjpfcXVtFdVttV97WHw6TINWpDy8zq8N7RwJ0RqkUlFjrHw8sP6T9cTbas', '57b5ac1bb4765'),
(64, NULL, NULL, NULL, 'shikha', 'singh', 'shikha', 'sdfhsfdhfsdh', 'sas nagar', '4545454', NULL, NULL, 'vodaphone', 'shikhas', '$2y$10$eu5c4zYkmMWX2bCfo3Fum.Ca85OI6cZUc2lGBDg5w5nGiokRlxVmq', 'shikhas@yopmail.com', 'vdhfvsdhf', 0, 'dhgfsdhgfh', '66676767', NULL, NULL, NULL, '2016-08-18 10:36:43', '2016-08-18 10:36:43', '', ''),
(65, NULL, NULL, NULL, 'sweta', 'singh', 'bsdfgj', 'dbjkbj', 'bjkasbj', '6464646', NULL, NULL, 'hvhvbhvb', 'sweta', '$2y$10$7Q5jRFK4n.HkajSjAV4yY.rw3H7rY13C8ROwY4fDBqKPl9v1vgNd2', 'SWETASS@YOPMAIL.COM', 'bcgbgf', 1, 'fgdfgdfgf', '45646456', NULL, NULL, NULL, '2016-08-18 10:53:47', '2016-08-18 10:40:01', 'fSYLChk2CS6CxD4p2DrXXOsLH9pPYknFvr973i2XOw8DlbLAb254XVdRt9aN', ''),
(68, NULL, NULL, NULL, 'qq', 'qq', '11', '11', 'mohali nagar', '78786qq', NULL, NULL, 'tata docomo', 'qq', '$2y$10$0kjzrwXsh834ck/J1C/4J.3tTEWiAv1e8C1D7V3ZjGYqoqw.eE8Lq', 'qq1@yopmail.com', 'notes this side ', 1, 'seasia infotech.com', '123213123', NULL, NULL, NULL, '2016-08-18 11:48:10', '2016-08-18 11:31:40', 'pVpFNMzOuvZ9qwauR1sq2XLjD6fPYaq0O7vBVYD6D7KVn92nb5cNah9bbfAM', '57b5a07ade735'),
(69, NULL, NULL, NULL, 'qeqw', 'qwrqw', 'sdfgsdfgsdfg', 'dfdghdfh', 'fghdf', 'ghnjfgjh', NULL, NULL, 'dfghdfgh', 'alpha', '$2y$10$d6aVW/JJVsqQfe79jxPfN.4FfwcZQuC/IA9owoHXSpYAZRTTzO6Zy', 'asdasd@yopmail.com', 'ghfghtryu', 0, 'fghdfgh', '456456', NULL, NULL, NULL, '2016-08-18 12:03:03', '2016-08-18 12:03:03', '', ''),
(70, NULL, NULL, NULL, 'anant', 'kumar', '1', '1', 'yamuna nagar', '221ee', NULL, NULL, 'tata docomo', 'anant', '$2y$10$0Kn2XvzzrHeMJfgQSODMyepfaeqrnB5kuj8ZUM/ZHQhXYqqwr0OfK', 'anant@yopmail.com', '1111111', 1, 'seasia infotech', '234234234', NULL, NULL, NULL, '2016-08-18 12:15:31', '2016-08-18 12:13:00', '07HgOSl0RESHFFg5fAXcod5TjJQMG7QqDfwea1yEWiPHbPWV2YA3cx4DIrWN', ''),
(71, NULL, NULL, NULL, 'ashish', 'shah', 'sdfgsdfg', 'yurtyu', 'fghjfghjfghj', 'tyutyurt', NULL, NULL, 'Spangle', 'ashish1', '$2y$10$8RpzEvgqP3LqNhzeRHA7N.LafW.pXtov5tXM7U4tbcbRWcothtvNy', 'asdasd1@yopmail.com', 'dfg', 1, 'dfhg', '567567', NULL, NULL, NULL, '2016-08-18 12:18:59', '2016-08-18 12:18:59', '', ''),
(72, NULL, NULL, NULL, 'qq', 'qq', '1', '1', 'yamuna nagar', '13500', NULL, NULL, 'tata docomo', 'qq4', '$2y$10$tRlLmccu4uTaLwTybPJA5ulwSENbTL5HnkvZ9FBjWrpLt9mNOHrd.', 'qq4@yopmail.com', '11', 1, 'Anant retail store', '11111', NULL, NULL, NULL, '2016-08-18 12:27:01', '2016-08-18 12:19:08', 'vTBoVjK6IJIlb6xHT4KMT6sarhoBbNCiPUe6Kjjn6HQqhL3VK2JSWv5wUIIK', ''),
(73, NULL, NULL, NULL, 'fhjgh', 'jghjgh', 'fdgfd', 'gfdg', 'fdgdfgfd', '234234', NULL, NULL, 'gdgdf', 'fgjj', '$2y$10$Eaa2PP.TRzzdRdenDdU3qezUUhocpbPODdyb3UgYMa.pIcBw4fkry', 'abc@yopmail.com', 'fgfdgdfg', 1, 'dfgfdgfd', '4235345', NULL, NULL, NULL, '2016-08-18 12:30:54', '2016-08-18 12:29:24', 'aEQfTlQDT6QmXq3pSGiflKiip3f0cvNphmbALg4hf9TMlMoq5E9gcCYC3acQ', ''),
(74, NULL, NULL, NULL, 'sdasd', 'dfgdfg', 'sdfgsdfgs', 'dfgsdfgsdfg', 'sfgsdfgsdf', 'gsdfgsdfgsdfg', NULL, NULL, 'sdfgsdfgsdf', 'dghdfgdfg', '$2y$10$OAY3W89oRVUhzpZtBCodGu58gorCSh628oXkZVWfGjEmgArAOh5Ra', 'hahaha@yopmail.com', 'gsdfgsdfgsdfg', 1, 'sdfgsdfgsdfg', '345345', NULL, NULL, NULL, '2016-08-18 12:32:27', '2016-08-18 12:29:48', 'QkHAQbwJgTl5cHUFadeHYEDOJO1mQvP8WprFMl2AbNr1UglBoizYf3yG2XAf', ''),
(75, NULL, NULL, NULL, 'shikha', 'singh', 'hsvdhasvb', 'xzcbcvb', 'mohali', '54545', NULL, NULL, 'voda', 'shikhasinghs', '$2y$10$GMFBiA7A4ghudlwW48B90uM8i67w.K7z1aUAdRgmUNbDZ.MSJ6hg6', 'shikhasinghs@yopmail.com', 'sfdf', 0, 'dfhcsdghf', '45454445', NULL, NULL, NULL, '2016-08-18 12:34:11', '2016-08-18 12:34:11', '', ''),
(76, NULL, NULL, NULL, 'misha', 'misha', 'xvhDFGFG', 'GFHDFGDF', 'DHVFHDV', '67676', NULL, NULL, 'hjghjvhv', 'misha', '$2y$10$mZDgHzzoeUzqIeQDs5I4Gu3DnJfVb.imzn.tSb591ER9433RfWhH6', 'misha@yopmail.com', 'bjbjghjg', 0, 'ghghgh', '54455', NULL, NULL, NULL, '2016-08-18 12:35:05', '2016-08-18 12:35:05', '', ''),
(77, NULL, NULL, NULL, 'Register', 'Register', 'Register', 'Register', 'Register', 'Register', NULL, NULL, 'Register', 'registerr', '$2y$10$WDUooaeUBeFU5AJJ2ZcrAOTBQYyv.rowkGhitjaKQltYgFSQYtkQu', 'Registerr@yopmail.com', 'Register', 0, 'Register', '34324343434', NULL, NULL, NULL, '2016-08-18 12:36:02', '2016-08-18 12:36:02', '', ''),
(78, NULL, NULL, NULL, 'Narinder', 'Singh', '#3183 sector 70 Mohali', '', 'Mohali', '160071', NULL, NULL, 'abcd', 'nsingh3', '$2y$10$MuJWHhfMQDyLj8r.K9v1fe2O.3ZV6a37oeObQeSYTzme6AOO5iWF6', 'nsingh3@seasiainfotech.com', 'this is a test messages', 1, 'seasia infotech', '0172275010', NULL, NULL, NULL, '2016-08-18 12:39:37', '2016-08-18 12:38:17', 'TQmydxZSNNSEYuiHi0g26yW3v6BiqN1mriViqtTJz2U2ayqYj0397MSZ2ruP', ''),
(79, NULL, NULL, NULL, 'qq', 'qq', '1', '1', 'q', '1q', NULL, NULL, 'w', 'qq5', '$2y$10$7EADiPGPEUd4yC0utX3IputevvuHO2VqcAsaA6NPxAWnR8MH1r6HO', 'qq5@yopmail.com', '11', 1, '11', '111111', NULL, NULL, NULL, '2016-08-18 13:03:07', '2016-08-18 12:55:33', 'TTHGOZPpfMmSpBLlndd464UqGcQkXodJQwlKqW4aIS4QwdFl4pYwG3xBn0kX', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
CREATE TABLE IF NOT EXISTS `user_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weathers`
--

DROP TABLE IF EXISTS `weathers`;
CREATE TABLE IF NOT EXISTS `weathers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `temperature` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `humidity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wind` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weather_zones`
--

DROP TABLE IF EXISTS `weather_zones`;
CREATE TABLE IF NOT EXISTS `weather_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `active_citys`
--
ALTER TABLE `active_citys`
  ADD CONSTRAINT `FK_BCAAD2FA67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_BCAAD2FA8BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `citys` (`id`);

--
-- Constraints for table `charge_sub_types`
--
ALTER TABLE `charge_sub_types`
  ADD CONSTRAINT `FK_DCD4C7CB285A8FC4` FOREIGN KEY (`charge_types_id`) REFERENCES `charge_types` (`id`);

--
-- Constraints for table `citys`
--
ALTER TABLE `citys`
  ADD CONSTRAINT `FK_3A9760BCB17973F` FOREIGN KEY (`states_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `driver_equipments`
--
ALTER TABLE `driver_equipments`
  ADD CONSTRAINT `FK_B28AF8FBD251DD7` FOREIGN KEY (`equipments_id`) REFERENCES `equipments` (`id`),
  ADD CONSTRAINT `FK_B28AF8FC3423909` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `driver_reports`
--
ALTER TABLE `driver_reports`
  ADD CONSTRAINT `FK_34E0C3257838E496` FOREIGN KEY (`sites_id`) REFERENCES `sites` (`id`),
  ADD CONSTRAINT `FK_34E0C325BD251DD7` FOREIGN KEY (`equipments_id`) REFERENCES `equipments` (`id`),
  ADD CONSTRAINT `FK_34E0C325C3423909` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `equipments`
--
ALTER TABLE `equipments`
  ADD CONSTRAINT `FK_6F6C2544B0265DC7` FOREIGN KEY (`contractor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_6F6C2544BE71B771` FOREIGN KEY (`equipment_types_id`) REFERENCES `equipment_types` (`id`),
  ADD CONSTRAINT `FK_6F6C2544EA000B10` FOREIGN KEY (`class_id`) REFERENCES `charge_types` (`id`);

--
-- Constraints for table `equipment_types`
--
ALTER TABLE `equipment_types`
  ADD CONSTRAINT `FK_B069A8D4285A8FC4` FOREIGN KEY (`charge_types_id`) REFERENCES `charge_types` (`id`);

--
-- Constraints for table `service_types`
--
ALTER TABLE `service_types`
  ADD CONSTRAINT `FK_F04264D7285A8FC4` FOREIGN KEY (`charge_types_id`) REFERENCES `charge_types` (`id`);

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `FK_BC00AA6319EB6921` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_BC00AA6347404C81` FOREIGN KEY (`weather_zones_id`) REFERENCES `weather_zones` (`id`),
  ADD CONSTRAINT `FK_BC00AA6358AA352B` FOREIGN KEY (`salt_types_id`) REFERENCES `charge_sub_types` (`id`),
  ADD CONSTRAINT `FK_BC00AA6377C4686A` FOREIGN KEY (`service_types_id`) REFERENCES `service_types` (`id`),
  ADD CONSTRAINT `FK_BC00AA63B17973F` FOREIGN KEY (`states_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `site_charge_types`
--
ALTER TABLE `site_charge_types`
  ADD CONSTRAINT `FK_849E18AB7838E496` FOREIGN KEY (`sites_id`) REFERENCES `sites` (`id`),
  ADD CONSTRAINT `FK_849E18ABBE71B771` FOREIGN KEY (`equipment_types_id`) REFERENCES `equipment_types` (`id`),
  ADD CONSTRAINT `FK_849E18ABFEBEEB09` FOREIGN KEY (`charge_sub_types_id`) REFERENCES `charge_sub_types` (`id`);

--
-- Constraints for table `site_drivers`
--
ALTER TABLE `site_drivers`
  ADD CONSTRAINT `FK_1FB421CC7838E496` FOREIGN KEY (`sites_id`) REFERENCES `sites` (`id`),
  ADD CONSTRAINT `FK_1FB421CCB0265DC7` FOREIGN KEY (`contractor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_1FB421CCC3423909` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `FK_31C2774DF92F3E70` FOREIGN KEY (`country_id`) REFERENCES `countrys` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_1483A5E95D83CC1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  ADD CONSTRAINT `FK_1483A5E96E3FD757` FOREIGN KEY (`user_types_id`) REFERENCES `user_types` (`id`),
  ADD CONSTRAINT `FK_1483A5E9DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
