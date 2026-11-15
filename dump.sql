-- --------------------------------------------------------
-- Host:                         217.66.226.204
-- Server version:               8.0.21 - Source distribution
-- Server OS:                    Linux
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table bagisto.addresses
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.addresses: ~7 rows (approximately)
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` (`id`, `address_type`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address1`, `address2`, `postcode`, `city`, `state`, `country`, `email`, `phone`, `vat_id`, `default_address`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 'cart_billing', NULL, 1, NULL, 'Mohammad', 'Barhoush', NULL, NULL, 'Ramallah, Ein Musbah', NULL, '00970', 'Ramallah', 'West Bank', 'PS', 'mohammadbarhoush@gmail.com', '0599732856', NULL, 0, NULL, '2021-04-14 14:09:14', '2021-04-14 14:09:14'),
	(2, 'cart_shipping', NULL, 1, NULL, 'Mohammad', 'Barhoush', NULL, NULL, 'Ramallah, Ein Musbah', NULL, '00970', 'Ramallah', 'West Bank', 'PS', 'mohammadbarhoush@gmail.com', '0599732856', NULL, 0, NULL, '2021-04-14 14:09:14', '2021-04-14 14:09:14'),
	(3, 'order_shipping', NULL, NULL, 1, 'Mohammad', 'Barhoush', NULL, NULL, 'Ramallah, Ein Musbah', NULL, '00970', 'Ramallah', 'West Bank', 'PS', 'mohammadbarhoush@gmail.com', '0599732856', NULL, 0, NULL, '2021-04-14 14:09:59', '2021-04-14 14:09:59'),
	(4, 'order_billing', NULL, NULL, 1, 'Mohammad', 'Barhoush', NULL, NULL, 'Ramallah, Ein Musbah', NULL, '00970', 'Ramallah', 'West Bank', 'PS', 'mohammadbarhoush@gmail.com', '0599732856', NULL, 0, NULL, '2021-04-14 14:09:59', '2021-04-14 14:09:59'),
	(5, 'customer', 1, 8, NULL, 'Mohammad', 'Barhoush', NULL, NULL, 'شارع القدس، شركة حضارة، مقابل الفندق السياحي', NULL, '00970', 'البيرة', '', 'RM', 'mohammadbarhoush@gmail.com', '0599732856', NULL, 0, NULL, '2021-04-26 15:14:54', '2021-04-26 15:14:54'),
	(6, 'cart_billing', 1, 8, NULL, 'Mohammad', 'Barhoush', NULL, NULL, 'شارع القدس، شركة حضارة، مقابل الفندق السياحي', NULL, '00970', 'البيرة', '', 'RM', 'mohammadbarhoush@gmail.com', '0599732856', NULL, 0, NULL, '2021-04-26 15:14:54', '2021-04-26 15:14:54'),
	(7, 'cart_shipping', 1, 8, NULL, 'Mohammad', 'Barhoush', NULL, NULL, 'شارع القدس، شركة حضارة، مقابل الفندق السياحي', NULL, '00970', 'البيرة', '', 'RM', 'mohammadbarhoush@gmail.com', '0599732856', NULL, 0, NULL, '2021-04-26 15:14:54', '2021-04-26 15:14:54');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;

-- Dumping structure for table bagisto.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.admins: ~0 rows (approximately)
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`id`, `name`, `email`, `password`, `api_token`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Example', 'admin@example.com', '$2y$10$jqp92UN16D9bm1VK81vTSeHxFhPZzDqarcKvjYr0ZomtZ.zvfUCwW', '4GdCgUcZCYSnEVIhadI9GublmRtxj1hPQ0P8ttWFBHzZAotlei3ZlVxtQsM8UgbxfFPYVA6fOyqWUOAI', 1, 1, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Dumping structure for table bagisto.admin_password_resets
CREATE TABLE IF NOT EXISTS `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.admin_password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;

-- Dumping structure for table bagisto.attributes
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `swatch_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_in_flat` tinyint(1) NOT NULL DEFAULT '1',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.attributes: ~31 rows (approximately)
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `validation`, `position`, `is_required`, `is_unique`, `value_per_locale`, `value_per_channel`, `is_filterable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `created_at`, `updated_at`, `swatch_type`, `use_in_flat`, `is_comparable`) VALUES
	(1, 'sku', 'SKU', 'text', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(2, 'name', 'Name', 'text', NULL, 3, 1, 0, 1, 1, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 1),
	(3, 'url_key', 'URL Key', 'text', NULL, 4, 1, 1, 0, 0, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(4, 'tax_category_id', 'Tax Category', 'select', NULL, 5, 0, 0, 0, 1, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(5, 'new', 'New', 'boolean', NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(6, 'featured', 'Featured', 'boolean', NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(7, 'visible_individually', 'Visible Individually', 'boolean', NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(8, 'status', 'Status', 'boolean', NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(9, 'short_description', 'Short Description', 'textarea', NULL, 11, 1, 0, 1, 1, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(10, 'description', 'Description', 'textarea', NULL, 12, 1, 0, 1, 1, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 1),
	(11, 'price', 'Price', 'price', 'decimal', 13, 1, 0, 0, 0, 1, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 1),
	(12, 'cost', 'Cost', 'price', 'decimal', 14, 0, 0, 0, 1, 0, 0, 1, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(13, 'special_price', 'Special Price', 'price', 'decimal', 15, 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(14, 'special_price_from', 'Special Price From', 'date', NULL, 16, 0, 0, 0, 1, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(15, 'special_price_to', 'Special Price To', 'date', NULL, 17, 0, 0, 0, 1, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(16, 'meta_title', 'Meta Title', 'textarea', NULL, 18, 0, 0, 1, 1, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(17, 'meta_keywords', 'Meta Keywords', 'textarea', NULL, 20, 0, 0, 1, 1, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(18, 'meta_description', 'Meta Description', 'textarea', NULL, 21, 0, 0, 1, 1, 0, 0, 1, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(19, 'width', 'Width', 'text', 'decimal', 22, 0, 0, 0, 0, 0, 0, 1, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(20, 'height', 'Height', 'text', 'decimal', 23, 0, 0, 0, 0, 0, 0, 1, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(21, 'depth', 'Depth', 'text', 'decimal', 24, 0, 0, 0, 0, 0, 0, 1, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(22, 'weight', 'Weight', 'text', 'decimal', 25, 1, 0, 0, 0, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(23, 'color', 'Color', 'select', '', 26, 0, 0, 0, 0, 1, 1, 1, 0, '2021-04-13 17:03:57', '2021-04-14 13:55:55', 'dropdown', 1, 0),
	(24, 'size', 'Size', 'select', NULL, 27, 0, 0, 0, 0, 1, 1, 1, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(25, 'brand', 'Brand', 'select', '', 28, 0, 0, 0, 0, 1, 0, 1, 0, '2021-04-13 17:03:57', '2021-04-21 13:58:32', 'dropdown', 1, 0),
	(26, 'guest_checkout', 'Guest Checkout', 'boolean', NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(27, 'product_number', 'Product Number', 'text', NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, '2021-04-13 17:03:57', '2021-04-13 17:03:57', NULL, 1, 0),
	(28, 'watchsize', 'Watch Size', 'select', '', NULL, 1, 0, 0, 0, 1, 1, 1, 1, '2021-04-14 13:54:51', '2021-04-14 13:54:51', 'dropdown', 1, 1),
	(31, 'shoessize', 'Shoes Size', 'select', '', NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2021-04-20 14:18:43', '2021-04-21 13:58:03', 'dropdown', 1, 0),
	(32, 'LaptopBrands', 'Laptop Brands', 'text', '', NULL, 1, 1, 0, 0, 0, 1, 1, 0, '2021-04-21 14:01:18', '2021-04-21 14:01:18', NULL, 1, 1),
	(33, 'wash_care', 'Wash Care', 'textarea', '', NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2021-04-21 15:17:19', '2021-04-21 15:17:19', NULL, 1, 1);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;

-- Dumping structure for table bagisto.attribute_families
CREATE TABLE IF NOT EXISTS `attribute_families` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.attribute_families: ~5 rows (approximately)
/*!40000 ALTER TABLE `attribute_families` DISABLE KEYS */;
INSERT INTO `attribute_families` (`id`, `code`, `name`, `status`, `is_user_defined`) VALUES
	(1, 'default', 'Default', 0, 1),
	(2, 'watches', 'Watches Family', 0, 1),
	(5, 'shoesfamily', 'Shoes Family', 0, 1),
	(6, 'electronics', 'الكترونيات', 0, 1),
	(7, 'washcarefamily', 'Wash family', 0, 1);
/*!40000 ALTER TABLE `attribute_families` ENABLE KEYS */;

-- Dumping structure for table bagisto.attribute_groups
CREATE TABLE IF NOT EXISTS `attribute_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `attribute_family_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.attribute_groups: ~25 rows (approximately)
/*!40000 ALTER TABLE `attribute_groups` DISABLE KEYS */;
INSERT INTO `attribute_groups` (`id`, `name`, `position`, `is_user_defined`, `attribute_family_id`) VALUES
	(1, 'General', 1, 0, 1),
	(2, 'Description', 2, 0, 1),
	(3, 'Meta Description', 3, 0, 1),
	(4, 'Price', 4, 0, 1),
	(5, 'Shipping', 5, 0, 1),
	(6, 'General', 1, 0, 2),
	(7, 'Description', 2, 0, 2),
	(8, 'Meta Description', 3, 0, 2),
	(9, 'Price', 4, 0, 2),
	(10, 'Shipping', 5, 0, 2),
	(21, 'General', 1, 0, 5),
	(22, 'Description', 2, 0, 5),
	(23, 'Meta Description', 3, 0, 5),
	(24, 'Price', 4, 0, 5),
	(25, 'Shipping', 5, 0, 5),
	(26, 'General', 1, 0, 6),
	(27, 'Description', 2, 0, 6),
	(28, 'Meta Description', 3, 0, 6),
	(29, 'Price', 4, 0, 6),
	(30, 'Shipping', 5, 0, 6),
	(31, 'General', 1, 0, 7),
	(32, 'Description', 2, 0, 7),
	(33, 'Meta Description', 3, 0, 7),
	(34, 'Price', 4, 0, 7),
	(35, 'Shipping', 5, 0, 7);
/*!40000 ALTER TABLE `attribute_groups` ENABLE KEYS */;

-- Dumping structure for table bagisto.attribute_group_mappings
CREATE TABLE IF NOT EXISTS `attribute_group_mappings` (
  `attribute_id` int unsigned NOT NULL,
  `attribute_group_id` int unsigned NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.attribute_group_mappings: ~127 rows (approximately)
/*!40000 ALTER TABLE `attribute_group_mappings` DISABLE KEYS */;
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES
	(1, 1, 1),
	(1, 6, 1),
	(1, 21, 1),
	(1, 26, 1),
	(1, 31, 1),
	(2, 1, 3),
	(2, 6, 3),
	(2, 21, 3),
	(2, 26, 3),
	(2, 31, 3),
	(3, 1, 4),
	(3, 6, 4),
	(3, 21, 4),
	(3, 26, 4),
	(3, 31, 4),
	(4, 1, 5),
	(4, 6, 5),
	(4, 21, 5),
	(4, 26, 5),
	(4, 31, 5),
	(5, 1, 6),
	(5, 6, 6),
	(5, 21, 6),
	(5, 26, 6),
	(5, 31, 6),
	(6, 1, 7),
	(6, 6, 7),
	(6, 21, 7),
	(6, 26, 7),
	(6, 31, 7),
	(7, 1, 8),
	(7, 6, 8),
	(7, 21, 8),
	(7, 26, 8),
	(7, 31, 8),
	(8, 1, 10),
	(8, 6, 10),
	(8, 21, 10),
	(8, 26, 10),
	(8, 31, 10),
	(9, 2, 1),
	(9, 7, 1),
	(9, 22, 1),
	(9, 27, 1),
	(9, 32, 1),
	(10, 2, 2),
	(10, 7, 2),
	(10, 22, 2),
	(10, 27, 2),
	(10, 32, 2),
	(11, 4, 1),
	(11, 9, 1),
	(11, 24, 1),
	(11, 29, 1),
	(11, 34, 1),
	(12, 4, 2),
	(12, 9, 2),
	(12, 24, 2),
	(12, 29, 2),
	(13, 4, 3),
	(13, 9, 3),
	(13, 24, 3),
	(13, 29, 3),
	(13, 34, 2),
	(14, 4, 4),
	(14, 9, 4),
	(14, 24, 4),
	(14, 29, 4),
	(14, 34, 3),
	(15, 4, 5),
	(15, 9, 5),
	(15, 24, 5),
	(15, 29, 5),
	(15, 34, 4),
	(16, 3, 1),
	(16, 8, 1),
	(16, 23, 1),
	(16, 28, 1),
	(16, 33, 1),
	(17, 3, 2),
	(17, 8, 2),
	(17, 23, 2),
	(17, 28, 2),
	(17, 33, 2),
	(18, 3, 3),
	(18, 8, 3),
	(18, 23, 3),
	(18, 28, 3),
	(18, 33, 3),
	(19, 5, 1),
	(19, 10, 1),
	(19, 25, 1),
	(19, 30, 1),
	(20, 5, 2),
	(20, 10, 2),
	(20, 25, 2),
	(20, 30, 2),
	(21, 5, 3),
	(21, 10, 3),
	(21, 25, 3),
	(21, 30, 3),
	(22, 5, 4),
	(22, 10, 4),
	(22, 25, 4),
	(22, 30, 4),
	(22, 35, 1),
	(23, 1, 11),
	(23, 6, 11),
	(23, 21, 11),
	(24, 1, 12),
	(25, 1, 13),
	(25, 6, 12),
	(25, 21, 12),
	(26, 1, 9),
	(26, 6, 9),
	(26, 21, 9),
	(26, 26, 9),
	(26, 31, 9),
	(27, 1, 2),
	(27, 6, 2),
	(27, 21, 2),
	(27, 26, 2),
	(27, 31, 2),
	(28, 6, 13),
	(31, 21, 13),
	(32, 26, 11),
	(33, 31, 11);
/*!40000 ALTER TABLE `attribute_group_mappings` ENABLE KEYS */;

-- Dumping structure for table bagisto.attribute_options
CREATE TABLE IF NOT EXISTS `attribute_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `attribute_id` int unsigned NOT NULL,
  `swatch_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.attribute_options: ~21 rows (approximately)
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` (`id`, `admin_name`, `sort_order`, `attribute_id`, `swatch_value`) VALUES
	(1, 'Red', 1, 23, NULL),
	(2, 'Green', 2, 23, NULL),
	(3, 'Yellow', 3, 23, NULL),
	(4, 'Black', 4, 23, NULL),
	(5, 'White', 5, 23, NULL),
	(6, 'S', 1, 24, NULL),
	(7, 'M', 2, 24, NULL),
	(8, 'L', 3, 24, NULL),
	(9, 'XL', 4, 24, NULL),
	(10, '46 mm', 1, 28, NULL),
	(11, '45 mm', 2, 28, NULL),
	(12, '44 mm', 3, 28, NULL),
	(13, '42 mm', 3, 28, NULL),
	(14, '40 mm', 4, 28, NULL),
	(15, 'Brown', 6, 23, NULL),
	(22, 'Adidas', 1, 25, NULL),
	(23, 'Nike', 2, 25, NULL),
	(24, 'Zara', 3, 25, NULL),
	(27, '41', 1, 31, NULL),
	(28, '42', 2, 31, NULL),
	(29, '43', 3, 31, NULL);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;

-- Dumping structure for table bagisto.attribute_option_translations
CREATE TABLE IF NOT EXISTS `attribute_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `attribute_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.attribute_option_translations: ~38 rows (approximately)
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` (`id`, `locale`, `label`, `attribute_option_id`) VALUES
	(1, 'en', 'Red', 1),
	(2, 'en', 'Green', 2),
	(3, 'en', 'Yellow', 3),
	(4, 'en', 'Black', 4),
	(5, 'en', 'White', 5),
	(6, 'en', 'S', 6),
	(7, 'en', 'M', 7),
	(8, 'en', 'L', 8),
	(9, 'en', 'XL', 9),
	(10, 'en', '45 mm', 10),
	(11, 'ar', '45 mm', 10),
	(12, 'en', '45 mm', 11),
	(13, 'ar', '45 mm', 11),
	(14, 'en', '44 mm', 12),
	(15, 'ar', '44 mm', 12),
	(16, 'en', '42 mm', 13),
	(17, 'ar', '42 mm', 13),
	(18, 'en', '40 mm', 14),
	(19, 'ar', '40 mm', 14),
	(20, 'ar', '', 1),
	(21, 'ar', '', 2),
	(22, 'ar', '', 3),
	(23, 'ar', '', 4),
	(24, 'ar', '', 5),
	(25, 'en', 'Brown', 15),
	(26, 'ar', '', 15),
	(39, 'en', 'Adidas', 22),
	(40, 'ar', 'Adidas', 22),
	(41, 'en', 'Nike', 23),
	(42, 'ar', 'Nike', 23),
	(43, 'en', 'Zara', 24),
	(44, 'ar', 'Zara', 24),
	(49, 'en', '41', 27),
	(50, 'ar', '41', 27),
	(51, 'en', '42', 28),
	(52, 'ar', '42', 28),
	(53, 'en', '43', 29),
	(54, 'ar', '43', 29);
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.attribute_translations
CREATE TABLE IF NOT EXISTS `attribute_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `attribute_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.attribute_translations: ~37 rows (approximately)
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` (`id`, `locale`, `name`, `attribute_id`) VALUES
	(1, 'en', 'SKU', 1),
	(2, 'en', 'Name', 2),
	(3, 'en', 'URL Key', 3),
	(4, 'en', 'Tax Category', 4),
	(5, 'en', 'New', 5),
	(6, 'en', 'Featured', 6),
	(7, 'en', 'Visible Individually', 7),
	(8, 'en', 'Status', 8),
	(9, 'en', 'Short Description', 9),
	(10, 'en', 'Description', 10),
	(11, 'en', 'Price', 11),
	(12, 'en', 'Cost', 12),
	(13, 'en', 'Special Price', 13),
	(14, 'en', 'Special Price From', 14),
	(15, 'en', 'Special Price To', 15),
	(16, 'en', 'Meta Description', 16),
	(17, 'en', 'Meta Keywords', 17),
	(18, 'en', 'Meta Description', 18),
	(19, 'en', 'Width', 19),
	(20, 'en', 'Height', 20),
	(21, 'en', 'Depth', 21),
	(22, 'en', 'Weight', 22),
	(23, 'en', 'Color', 23),
	(24, 'en', 'Size', 24),
	(25, 'en', 'Brand', 25),
	(26, 'en', 'Allow Guest Checkout', 26),
	(27, 'en', 'Product Number', 27),
	(28, 'en', 'Watch Size', 28),
	(29, 'ar', 'مقاس الساعة', 28),
	(30, 'ar', '', 23),
	(33, 'ar', '', 25),
	(36, 'en', 'Shoes Size', 31),
	(37, 'ar', 'نمرة الحذاء', 31),
	(38, 'en', 'Brand', 32),
	(39, 'ar', 'العلامة التجارية', 32),
	(40, 'en', 'Wash Care', 33),
	(41, 'ar', 'العناية بالغسيل', 33);
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.bookings
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int DEFAULT '0',
  `from` int DEFAULT NULL,
  `to` int DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `booking_product_event_ticket_id` int unsigned DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_order_id_foreign` (`order_id`),
  KEY `bookings_product_id_foreign` (`product_id`),
  CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.bookings: ~0 rows (approximately)
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;

-- Dumping structure for table bagisto.booking_products
CREATE TABLE IF NOT EXISTS `booking_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int DEFAULT '0',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT '0',
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_products_product_id_foreign` (`product_id`),
  CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.booking_products: ~0 rows (approximately)
/*!40000 ALTER TABLE `booking_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_products` ENABLE KEYS */;

-- Dumping structure for table bagisto.booking_product_appointment_slots
CREATE TABLE IF NOT EXISTS `booking_product_appointment_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.booking_product_appointment_slots: ~0 rows (approximately)
/*!40000 ALTER TABLE `booking_product_appointment_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_appointment_slots` ENABLE KEYS */;

-- Dumping structure for table bagisto.booking_product_default_slots
CREATE TABLE IF NOT EXISTS `booking_product_default_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `booking_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.booking_product_default_slots: ~0 rows (approximately)
/*!40000 ALTER TABLE `booking_product_default_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_default_slots` ENABLE KEYS */;

-- Dumping structure for table bagisto.booking_product_event_tickets
CREATE TABLE IF NOT EXISTS `booking_product_event_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int DEFAULT '0',
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` datetime DEFAULT NULL,
  `special_price_to` datetime DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.booking_product_event_tickets: ~0 rows (approximately)
/*!40000 ALTER TABLE `booking_product_event_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_event_tickets` ENABLE KEYS */;

-- Dumping structure for table bagisto.booking_product_event_ticket_translations
CREATE TABLE IF NOT EXISTS `booking_product_event_ticket_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `booking_product_event_ticket_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_product_event_ticket_translations_locale_unique` (`booking_product_event_ticket_id`,`locale`),
  CONSTRAINT `booking_product_event_ticket_translations_locale_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.booking_product_event_ticket_translations: ~0 rows (approximately)
/*!40000 ALTER TABLE `booking_product_event_ticket_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_event_ticket_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.booking_product_rental_slots
CREATE TABLE IF NOT EXISTS `booking_product_rental_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `renting_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12,4) DEFAULT '0.0000',
  `hourly_price` decimal(12,4) DEFAULT '0.0000',
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.booking_product_rental_slots: ~0 rows (approximately)
/*!40000 ALTER TABLE `booking_product_rental_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_rental_slots` ENABLE KEYS */;

-- Dumping structure for table bagisto.booking_product_table_slots
CREATE TABLE IF NOT EXISTS `booking_product_table_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int NOT NULL DEFAULT '0',
  `duration` int NOT NULL,
  `break_time` int NOT NULL,
  `prevent_scheduling_before` int NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.booking_product_table_slots: ~0 rows (approximately)
/*!40000 ALTER TABLE `booking_product_table_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_table_slots` ENABLE KEYS */;

-- Dumping structure for table bagisto.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `checkout_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `conversion_time` datetime DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cart: ~9 rows (approximately)
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `checkout_method`, `is_guest`, `is_active`, `conversion_time`, `customer_id`, `channel_id`, `created_at`, `updated_at`, `applied_cart_rule_ids`) VALUES
	(1, 'mohammadbarhoush@gmail.com', 'Mohammad', 'Barhoush', 'flatrate_flatrate', NULL, 0, 1, 2.0000, NULL, 'USD', 'USD', 'NIS', 'NIS', 420.0000, 420.0000, 400.0000, 400.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 0, NULL, NULL, 1, '2021-04-14 14:08:05', '2021-04-14 14:09:59', ''),
	(2, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'NIS', 'NIS', 250.0000, 250.0000, 250.0000, 250.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-04-18 12:24:40', '2021-04-18 12:24:40', ''),
	(3, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'NIS', 'NIS', 600.0000, 600.0000, 600.0000, 600.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-04-19 16:26:27', '2021-04-19 16:26:36', ''),
	(4, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'NIS', 'NIS', 250.0000, 250.0000, 250.0000, 250.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-04-20 17:04:48', '2021-04-20 17:04:49', ''),
	(5, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'NIS', 'NIS', 4750.0000, 4750.0000, 4750.0000, 4750.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-04-25 14:37:17', '2021-04-25 14:37:17', ''),
	(7, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'NIS', 'NIS', 4750.0000, 4750.0000, 4750.0000, 4750.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-04-26 08:43:46', '2021-04-26 09:38:37', ''),
	(8, 'mohammadbarhoush@gmail.com', 'Mohammad', 'Barhoush', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'NIS', 'NIS', 500.0000, 500.0000, 500.0000, 500.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 1, NULL, 1, 1, '2021-04-26 14:42:52', '2021-04-26 18:12:48', ''),
	(9, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'NIS', 'NIS', 4750.0000, 4750.0000, 4750.0000, 4750.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-04-26 15:33:49', '2021-04-26 15:33:49', ''),
	(10, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'NIS', 'NIS', 250.0000, 250.0000, 250.0000, 250.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-04-27 14:39:56', '2021-04-27 14:40:05', '');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Dumping structure for table bagisto.cart_items
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `additional` json DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `cart_id` int unsigned NOT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cart_items: ~4 rows (approximately)
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `additional`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `created_at`, `updated_at`, `custom_price`, `applied_cart_rule_ids`) VALUES
	(7, 1, 'asus-1', 'simple', 'Asus Zenbook-2021', NULL, 0.0000, 0.0000, 0.0000, 4750.0000, 4750.0000, 4750.0000, 4750.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{"_token": "eZGpao1yhhgas0Wgw0o5MPqMOK7nFWXDV6vtZmyr", "quantity": "1", "product_id": "46"}', NULL, 46, 5, NULL, '2021-04-25 14:37:17', '2021-04-25 14:37:17', NULL, ''),
	(8, 1, 'asus-1', 'simple', 'Asus Zenbook-2021', NULL, 0.0000, 0.0000, 0.0000, 4750.0000, 4750.0000, 4750.0000, 4750.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{"_token": "Mdr6ogt0Q1fab0RR1Tbs49cMl9XLFXWpJXwuAfLK", "quantity": "1", "product_id": "46"}', NULL, 46, 7, NULL, '2021-04-26 08:43:46', '2021-04-26 09:38:37', NULL, ''),
	(9, 1, 'keyboard-hp', 'simple', 'HP Keyboard', NULL, 1.0000, 1.0000, 1.0000, 500.0000, 500.0000, 500.0000, 500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{"_token": "UX5shwh2C1K3OTyNowlGQls6F33yIaMf59XsnsnO", "quantity": "1", "is_buy_now": "0", "product_id": "47"}', NULL, 47, 8, NULL, '2021-04-26 14:42:52', '2021-04-26 18:12:48', NULL, ''),
	(10, 1, 'asus-1', 'simple', 'Asus Zenbook-2021', NULL, 0.0000, 0.0000, 0.0000, 4750.0000, 4750.0000, 4750.0000, 4750.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{"_token": "LvWoAgdsaIN5TprsNjCpbO9nWCSJPFxORhuzTyma", "quantity": "1", "product_id": "46"}', NULL, 46, 9, NULL, '2021-04-26 15:33:49', '2021-04-26 15:33:49', NULL, '');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;

-- Dumping structure for table bagisto.cart_item_inventories
CREATE TABLE IF NOT EXISTS `cart_item_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned DEFAULT NULL,
  `cart_item_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cart_item_inventories: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart_item_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item_inventories` ENABLE KEYS */;

-- Dumping structure for table bagisto.cart_payment
CREATE TABLE IF NOT EXISTS `cart_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cart_payment: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart_payment` DISABLE KEYS */;
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES
	(1, 'cashondelivery', NULL, 1, '2021-04-14 14:09:23', '2021-04-14 14:09:23');
/*!40000 ALTER TABLE `cart_payment` ENABLE KEYS */;

-- Dumping structure for table bagisto.cart_rules
CREATE TABLE IF NOT EXISTS `cart_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int NOT NULL DEFAULT '0',
  `uses_per_coupon` int NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int NOT NULL DEFAULT '1',
  `discount_step` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cart_rules: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rules` ENABLE KEYS */;

-- Dumping structure for table bagisto.cart_rule_channels
CREATE TABLE IF NOT EXISTS `cart_rule_channels` (
  `cart_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cart_rule_channels: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_channels` ENABLE KEYS */;

-- Dumping structure for table bagisto.cart_rule_coupons
CREATE TABLE IF NOT EXISTS `cart_rule_coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int unsigned NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cart_rule_coupons: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart_rule_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupons` ENABLE KEYS */;

-- Dumping structure for table bagisto.cart_rule_coupon_usage
CREATE TABLE IF NOT EXISTS `cart_rule_coupon_usage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cart_rule_coupon_usage: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart_rule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` ENABLE KEYS */;

-- Dumping structure for table bagisto.cart_rule_customers
CREATE TABLE IF NOT EXISTS `cart_rule_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint unsigned NOT NULL DEFAULT '0',
  `cart_rule_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cart_rule_customers: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart_rule_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customers` ENABLE KEYS */;

-- Dumping structure for table bagisto.cart_rule_customer_groups
CREATE TABLE IF NOT EXISTS `cart_rule_customer_groups` (
  `cart_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cart_rule_customer_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customer_groups` ENABLE KEYS */;

-- Dumping structure for table bagisto.cart_rule_translations
CREATE TABLE IF NOT EXISTS `cart_rule_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cart_rule_translations: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart_rule_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.cart_shipping_rates
CREATE TABLE IF NOT EXISTS `cart_shipping_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `cart_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_address_id_foreign` (`cart_address_id`),
  CONSTRAINT `cart_shipping_rates_cart_address_id_foreign` FOREIGN KEY (`cart_address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cart_shipping_rates: ~4 rows (approximately)
/*!40000 ALTER TABLE `cart_shipping_rates` DISABLE KEYS */;
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `cart_address_id`, `created_at`, `updated_at`, `discount_amount`, `base_discount_amount`, `is_calculate_tax`) VALUES
	(1, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 20, 20, 2, '2021-04-14 14:09:14', '2021-04-14 14:09:58', 0.0000, 0.0000, 1),
	(2, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 2, '2021-04-14 14:09:14', '2021-04-14 14:09:14', 0.0000, 0.0000, 1),
	(3, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 7, '2021-04-26 15:14:55', '2021-04-26 15:14:55', 0.0000, 0.0000, 1),
	(4, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 7, '2021-04-26 15:14:55', '2021-04-26 18:12:48', 0.0000, 0.0000, 1);
/*!40000 ALTER TABLE `cart_shipping_rates` ENABLE KEYS */;

-- Dumping structure for table bagisto.catalog_rules
CREATE TABLE IF NOT EXISTS `catalog_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.catalog_rules: ~1 rows (approximately)
/*!40000 ALTER TABLE `catalog_rules` DISABLE KEYS */;
INSERT INTO `catalog_rules` (`id`, `name`, `description`, `starts_from`, `ends_till`, `status`, `condition_type`, `conditions`, `end_other_rules`, `action_type`, `discount_amount`, `sort_order`, `created_at`, `updated_at`) VALUES
	(1, 'Discount on watches for 1 week', '', '2021-04-20', '2021-04-30', 1, 1, '[{"value": ["4"], "operator": "{}", "attribute": "product|category_ids", "attribute_type": "multiselect"}, {"value": "500", "operator": "<=", "attribute": "product|price", "attribute_type": "price"}]', 1, 'by_percent', 40.0000, 0, '2021-04-21 14:29:04', '2021-04-21 14:29:40');
/*!40000 ALTER TABLE `catalog_rules` ENABLE KEYS */;

-- Dumping structure for table bagisto.catalog_rule_channels
CREATE TABLE IF NOT EXISTS `catalog_rule_channels` (
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.catalog_rule_channels: ~1 rows (approximately)
/*!40000 ALTER TABLE `catalog_rule_channels` DISABLE KEYS */;
INSERT INTO `catalog_rule_channels` (`catalog_rule_id`, `channel_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `catalog_rule_channels` ENABLE KEYS */;

-- Dumping structure for table bagisto.catalog_rule_customer_groups
CREATE TABLE IF NOT EXISTS `catalog_rule_customer_groups` (
  `catalog_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.catalog_rule_customer_groups: ~4 rows (approximately)
/*!40000 ALTER TABLE `catalog_rule_customer_groups` DISABLE KEYS */;
INSERT INTO `catalog_rule_customer_groups` (`catalog_rule_id`, `customer_group_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4);
/*!40000 ALTER TABLE `catalog_rule_customer_groups` ENABLE KEYS */;

-- Dumping structure for table bagisto.catalog_rule_products
CREATE TABLE IF NOT EXISTS `catalog_rule_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.catalog_rule_products: ~0 rows (approximately)
/*!40000 ALTER TABLE `catalog_rule_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_products` ENABLE KEYS */;

-- Dumping structure for table bagisto.catalog_rule_product_prices
CREATE TABLE IF NOT EXISTS `catalog_rule_product_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.catalog_rule_product_prices: ~0 rows (approximately)
/*!40000 ALTER TABLE `catalog_rule_product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_product_prices` ENABLE KEYS */;

-- Dumping structure for table bagisto.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT '0',
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `_lft` int unsigned NOT NULL DEFAULT '0',
  `_rgt` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_mode` varchar(191) DEFAULT 'products_and_description',
  `category_icon_path` text,
  `additional` json DEFAULT NULL,
  `category_product_in_pwa` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.categories: ~5 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `position`, `image`, `status`, `_lft`, `_rgt`, `parent_id`, `created_at`, `updated_at`, `display_mode`, `category_icon_path`, `additional`, `category_product_in_pwa`) VALUES
	(1, 1, NULL, 1, 1, 22, NULL, '2021-04-13 17:03:56', '2021-04-14 13:11:32', 'products_and_description', NULL, NULL, 1),
	(5, 1, 'category/5/1YeJjm2KOBFM10vlNFplq3lGkQ9DsHcbecV8Bpo5.png', 1, 14, 15, 1, '2021-04-15 14:48:46', '2021-04-15 14:56:12', 'products_only', 'velocity/category_icon_path/5/R5VQp70WxCiqMSRAwMBVCKxaeZAiUG97cj1zEqD7.jpg', NULL, 1),
	(9, 1, 'category/9/4WLpUUUc9Cs3KUuU0STC8h5aK2Aonk0CgDI8TRGF.jpg', 1, 16, 19, 1, '2021-04-20 14:34:30', '2021-04-20 14:34:30', 'products_and_description', NULL, NULL, 1),
	(10, 1, NULL, 1, 17, 18, 9, '2021-04-20 14:55:05', '2021-04-20 14:55:05', 'products_and_description', NULL, NULL, 1),
	(11, 1, 'category/11/Yv79PUw9m3HJdlN7F673tVWfQW7ixbFiDty9li17.jpg', 1, 20, 21, 1, '2021-04-21 15:28:28', '2021-04-21 16:52:15', 'products_and_description', NULL, NULL, 1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table bagisto.categories3
CREATE TABLE IF NOT EXISTS `categories3` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `_lft` int unsigned NOT NULL DEFAULT '0',
  `_rgt` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `category_icon_path` text COLLATE utf8mb4_unicode_ci,
  `additional` json DEFAULT NULL,
  `category_product_in_pwa` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.categories3: ~2 rows (approximately)
/*!40000 ALTER TABLE `categories3` DISABLE KEYS */;
INSERT INTO `categories3` (`id`, `position`, `image`, `status`, `_lft`, `_rgt`, `parent_id`, `created_at`, `updated_at`, `display_mode`, `category_icon_path`, `additional`, `category_product_in_pwa`) VALUES
	(1, 1, NULL, 1, 1, 14, NULL, '2021-04-13 17:03:56', '2021-04-13 17:03:56', 'products_and_description', NULL, NULL, 0),
	(2, 1, NULL, 1, 15, 16, NULL, '2021-04-13 18:07:38', '2021-04-13 18:07:38', 'products_and_description', NULL, NULL, 0);
/*!40000 ALTER TABLE `categories3` ENABLE KEYS */;

-- Dumping structure for table bagisto.category_filterable_attributes
CREATE TABLE IF NOT EXISTS `category_filterable_attributes` (
  `category_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  KEY `FK_category_filterable_attributes_categories` (`category_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_category_filterable_attributes_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.category_filterable_attributes: ~15 rows (approximately)
/*!40000 ALTER TABLE `category_filterable_attributes` DISABLE KEYS */;
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES
	(1, 11),
	(5, 11),
	(5, 23),
	(5, 24),
	(5, 25),
	(5, 28),
	(9, 11),
	(9, 23),
	(9, 25),
	(9, 31),
	(10, 11),
	(10, 23),
	(10, 25),
	(10, 31),
	(11, 11);
/*!40000 ALTER TABLE `category_filterable_attributes` ENABLE KEYS */;

-- Dumping structure for table bagisto.category_translations
CREATE TABLE IF NOT EXISTS `category_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `category_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale_id` int unsigned DEFAULT NULL,
  `url_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'maintained by database triggers',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_category_translations_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.category_translations: ~10 rows (approximately)
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` (`id`, `name`, `slug`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `category_id`, `locale`, `locale_id`, `url_path`) VALUES
	(1, 'Root', 'root', 'Root', '', '', '', 1, 'en', NULL, ''),
	(4, 'Root', 'root', '<p>&nbsp;&nbsp;</p>', '', '', '', 1, 'ar', NULL, ''),
	(8, 'test', 'test', '<p>test</p>', '', '', '', 5, 'en', 1, 'test'),
	(9, 'test', 'test', '<p>test</p>', '', '', '', 5, 'ar', 5, 'test'),
	(16, 'SHOES', 'shoes', '<p><span style="color: #202124; font-family: arial, sans-serif; font-size: 16px;">A stock-keeping unit (</span><strong style="color: #202124; font-family: arial, sans-serif; font-size: 16px;">SKU</strong><span style="color: #202124; font-family: arial, sans-serif; font-size: 16px;">) is a scannable bar code, most often seen printed on product labels in a retail store.&nbsp;</span></p>', '', '', '', 9, 'en', 1, 'shoes'),
	(17, 'SHOES', 'shoes', '<p><span style="color: #202124; font-family: arial, sans-serif; font-size: 16px;">A stock-keeping unit (</span><strong style="color: #202124; font-family: arial, sans-serif; font-size: 16px;">SKU</strong><span style="color: #202124; font-family: arial, sans-serif; font-size: 16px;">) is a scannable bar code, most often seen printed on product labels in a retail store.&nbsp;</span></p>', '', '', '', 9, 'ar', 5, 'shoes'),
	(18, 'Men', 'men', '<p>White black</p>', '', '', '', 10, 'en', 1, 'shoes/men'),
	(19, 'Men', 'men', '<p>White black</p>', '', '', '', 10, 'ar', 5, 'shoes/men'),
	(20, 'Men T-shirt ', 'men-t-shirt', '<p>testtt ffee</p>', '', '', '', 11, 'en', 1, 'men-t-shirt'),
	(21, 'Men T-shirt ', 'men-t-shirt', '<p>testtt ffee</p>', '', '', '', 11, 'ar', 5, 'men-t-shirt');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.channels
CREATE TABLE IF NOT EXISTS `channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text COLLATE utf8mb4_unicode_ci,
  `default_locale_id` int unsigned NOT NULL,
  `base_currency_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `root_category_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories3` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.channels: ~0 rows (approximately)
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` (`id`, `code`, `timezone`, `theme`, `hostname`, `logo`, `favicon`, `is_maintenance_on`, `allowed_ips`, `default_locale_id`, `base_currency_id`, `created_at`, `updated_at`, `root_category_id`) VALUES
	(1, 'default', NULL, 'jawwal0', 'http://217.66.226.204/bagisto/public', 'channel/1/wcoC0XInn8X1jvmhvEiBV09VoLZUoHJjanr1cjNc.png', NULL, 0, '', 5, 3, NULL, '2021-04-26 08:10:27', 1);
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;

-- Dumping structure for table bagisto.channel_currencies
CREATE TABLE IF NOT EXISTS `channel_currencies` (
  `channel_id` int unsigned NOT NULL,
  `currency_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.channel_currencies: ~2 rows (approximately)
/*!40000 ALTER TABLE `channel_currencies` DISABLE KEYS */;
INSERT INTO `channel_currencies` (`channel_id`, `currency_id`) VALUES
	(1, 1),
	(1, 3);
/*!40000 ALTER TABLE `channel_currencies` ENABLE KEYS */;

-- Dumping structure for table bagisto.channel_inventory_sources
CREATE TABLE IF NOT EXISTS `channel_inventory_sources` (
  `channel_id` int unsigned NOT NULL,
  `inventory_source_id` int unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.channel_inventory_sources: ~0 rows (approximately)
/*!40000 ALTER TABLE `channel_inventory_sources` DISABLE KEYS */;
INSERT INTO `channel_inventory_sources` (`channel_id`, `inventory_source_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `channel_inventory_sources` ENABLE KEYS */;

-- Dumping structure for table bagisto.channel_locales
CREATE TABLE IF NOT EXISTS `channel_locales` (
  `channel_id` int unsigned NOT NULL,
  `locale_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.channel_locales: ~2 rows (approximately)
/*!40000 ALTER TABLE `channel_locales` DISABLE KEYS */;
INSERT INTO `channel_locales` (`channel_id`, `locale_id`) VALUES
	(1, 1),
	(1, 5);
/*!40000 ALTER TABLE `channel_locales` ENABLE KEYS */;

-- Dumping structure for table bagisto.channel_translations
CREATE TABLE IF NOT EXISTS `channel_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `home_page_content` text COLLATE utf8mb4_unicode_ci,
  `footer_content` text COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.channel_translations: ~4 rows (approximately)
/*!40000 ALTER TABLE `channel_translations` DISABLE KEYS */;
INSERT INTO `channel_translations` (`id`, `channel_id`, `locale`, `name`, `description`, `home_page_content`, `footer_content`, `maintenance_mode_text`, `home_seo`, `created_at`, `updated_at`) VALUES
	(1, 1, 'en', 'Default', '', '<p>@include("shop::home.slider") @include("shop::home.featured-products") @include("shop::home.new-products")</p>\r\n<div class="banner-container">\r\n<div class="left-banner"><img src="http://localhost/themes/default/assets/images/1.webp" data-src="http://localhost/themes/default/assets/images/1.webp" class="lazyload" alt="test" width="720" height="720" /></div>\r\n<div class="right-banner"><img src="http://localhost/themes/default/assets/images/2.webp" data-src="http://localhost/themes/default/assets/images/2.webp" class="lazyload" alt="test" width="460" height="330" /> <img src="http://localhost/themes/default/assets/images/3.webp" data-src="http://localhost/themes/default/assets/images/3.webp" class="lazyload" alt="test" width="460" height="330" /></div>\r\n</div>', '<div class="list-container"><span class="list-heading">Quick Links</span>\r\n<ul class="list-group">\r\n<li><a href="@php echo route(\'shop.cms.page\', \'about-us\') @endphp">About Us</a></li>\r\n<li><a href="@php echo route(\'shop.cms.page\', \'return-policy\') @endphp">Return Policy</a></li>\r\n<li><a href="@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp">Refund Policy</a></li>\r\n<li><a href="@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp">Terms and conditions</a></li>\r\n<li><a href="@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp">Terms of Use</a></li>\r\n<li><a href="@php echo route(\'shop.cms.page\', \'contact-us\') @endphp">Contact Us</a></li>\r\n</ul>\r\n</div>\r\n<div class="list-container"><span class="list-heading">Connect With Us</span>\r\n<ul class="list-group">\r\n<li><a href="#"><span class="icon icon-facebook"></span>Facebook </a></li>\r\n<li><a href="#"><span class="icon icon-twitter"></span> Twitter </a></li>\r\n<li><a href="#"><span class="icon icon-instagram"></span> Instagram </a></li>\r\n<li><a href="#"> <span class="icon icon-google-plus"></span>Google+ </a></li>\r\n<li><a href="#"> <span class="icon icon-linkedin"></span>LinkedIn </a></li>\r\n</ul>\r\n</div>', '', '{"meta_title": "Demo store", "meta_keywords": "Demo store meta keyword", "meta_description": "Demo store meta description"}', NULL, '2021-04-13 18:03:51'),
	(2, 1, 'fr', 'Default', NULL, '\n                    <p>@include("shop::home.slider") @include("shop::home.featured-products") @include("shop::home.new-products")</p>\n                        <div class="banner-container">\n                        <div class="left-banner">\n                            <img src=http://localhost/themes/default/assets/images/1.webp data-src=http://localhost/themes/default/assets/images/1.webp class="lazyload" alt="test" width="720" height="720" />\n                        </div>\n                        <div class="right-banner">\n                            <img src=http://localhost/themes/default/assets/images/2.webp data-src=http://localhost/themes/default/assets/images/2.webp class="lazyload" alt="test" width="460" height="330" />\n                            <img src=http://localhost/themes/default/assets/images/3.webp data-src=http://localhost/themes/default/assets/images/3.webp  class="lazyload" alt="test" width="460" height="330" />\n                        </div>\n                    </div>\n                ', '\n                    <div class="list-container">\n                        <span class="list-heading">Quick Links</span>\n                        <ul class="list-group">\n                            <li><a href="@php echo route(\'shop.cms.page\', \'about-us\') @endphp">About Us</a></li>\n                            <li><a href="@php echo route(\'shop.cms.page\', \'return-policy\') @endphp">Return Policy</a></li>\n                            <li><a href="@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp">Refund Policy</a></li>\n                            <li><a href="@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp">Terms and conditions</a></li>\n                            <li><a href="@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp">Terms of Use</a></li><li><a href="@php echo route(\'shop.cms.page\', \'contact-us\') @endphp">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class="list-container">\n                        <span class="list-heading">Connect With Us</span>\n                            <ul class="list-group">\n                                <li><a href="#"><span class="icon icon-facebook"></span>Facebook </a></li>\n                                <li><a href="#"><span class="icon icon-twitter"></span> Twitter </a></li>\n                                <li><a href="#"><span class="icon icon-instagram"></span> Instagram </a></li>\n                                <li><a href="#"> <span class="icon icon-google-plus"></span>Google+ </a></li>\n                                <li><a href="#"> <span class="icon icon-linkedin"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ', NULL, '{"meta_title": "Demo store", "meta_keywords": "Demo store meta keyword", "meta_description": "Demo store meta description"}', NULL, NULL),
	(3, 1, 'nl', 'Default', NULL, '\n                    <p>@include("shop::home.slider") @include("shop::home.featured-products") @include("shop::home.new-products")</p>\n                        <div class="banner-container">\n                        <div class="left-banner">\n                            <img src=http://localhost/themes/default/assets/images/1.webp data-src=http://localhost/themes/default/assets/images/1.webp class="lazyload" alt="test" width="720" height="720" />\n                        </div>\n                        <div class="right-banner">\n                            <img src=http://localhost/themes/default/assets/images/2.webp data-src=http://localhost/themes/default/assets/images/2.webp class="lazyload" alt="test" width="460" height="330" />\n                            <img src=http://localhost/themes/default/assets/images/3.webp data-src=http://localhost/themes/default/assets/images/3.webp  class="lazyload" alt="test" width="460" height="330" />\n                        </div>\n                    </div>\n                ', '\n                    <div class="list-container">\n                        <span class="list-heading">Quick Links</span>\n                        <ul class="list-group">\n                            <li><a href="@php echo route(\'shop.cms.page\', \'about-us\') @endphp">About Us</a></li>\n                            <li><a href="@php echo route(\'shop.cms.page\', \'return-policy\') @endphp">Return Policy</a></li>\n                            <li><a href="@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp">Refund Policy</a></li>\n                            <li><a href="@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp">Terms and conditions</a></li>\n                            <li><a href="@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp">Terms of Use</a></li><li><a href="@php echo route(\'shop.cms.page\', \'contact-us\') @endphp">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class="list-container">\n                        <span class="list-heading">Connect With Us</span>\n                            <ul class="list-group">\n                                <li><a href="#"><span class="icon icon-facebook"></span>Facebook </a></li>\n                                <li><a href="#"><span class="icon icon-twitter"></span> Twitter </a></li>\n                                <li><a href="#"><span class="icon icon-instagram"></span> Instagram </a></li>\n                                <li><a href="#"> <span class="icon icon-google-plus"></span>Google+ </a></li>\n                                <li><a href="#"> <span class="icon icon-linkedin"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ', NULL, '{"meta_title": "Demo store", "meta_keywords": "Demo store meta keyword", "meta_description": "Demo store meta description"}', NULL, NULL),
	(4, 1, 'tr', 'Default', NULL, '\n                    <p>@include("shop::home.slider") @include("shop::home.featured-products") @include("shop::home.new-products")</p>\n                        <div class="banner-container">\n                        <div class="left-banner">\n                            <img src=http://localhost/themes/default/assets/images/1.webp data-src=http://localhost/themes/default/assets/images/1.webp class="lazyload" alt="test" width="720" height="720" />\n                        </div>\n                        <div class="right-banner">\n                            <img src=http://localhost/themes/default/assets/images/2.webp data-src=http://localhost/themes/default/assets/images/2.webp class="lazyload" alt="test" width="460" height="330" />\n                            <img src=http://localhost/themes/default/assets/images/3.webp data-src=http://localhost/themes/default/assets/images/3.webp  class="lazyload" alt="test" width="460" height="330" />\n                        </div>\n                    </div>\n                ', '\n                    <div class="list-container">\n                        <span class="list-heading">Quick Links</span>\n                        <ul class="list-group">\n                            <li><a href="@php echo route(\'shop.cms.page\', \'about-us\') @endphp">About Us</a></li>\n                            <li><a href="@php echo route(\'shop.cms.page\', \'return-policy\') @endphp">Return Policy</a></li>\n                            <li><a href="@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp">Refund Policy</a></li>\n                            <li><a href="@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp">Terms and conditions</a></li>\n                            <li><a href="@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp">Terms of Use</a></li><li><a href="@php echo route(\'shop.cms.page\', \'contact-us\') @endphp">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class="list-container">\n                        <span class="list-heading">Connect With Us</span>\n                            <ul class="list-group">\n                                <li><a href="#"><span class="icon icon-facebook"></span>Facebook </a></li>\n                                <li><a href="#"><span class="icon icon-twitter"></span> Twitter </a></li>\n                                <li><a href="#"><span class="icon icon-instagram"></span> Instagram </a></li>\n                                <li><a href="#"> <span class="icon icon-google-plus"></span>Google+ </a></li>\n                                <li><a href="#"> <span class="icon icon-linkedin"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ', NULL, '{"meta_title": "Demo store", "meta_keywords": "Demo store meta keyword", "meta_description": "Demo store meta description"}', NULL, NULL),
	(5, 1, 'ar', 'Default', '', '<p>@include("shop::home.slider")</p>\r\n<p>@include("shop::home.featured-products")</p>\r\n<p>@include("shop::home.new-products")</p>\r\n<p>@include("shop::home.top-rated-products")</p>\r\n<div class="banner-container">\r\n<div class="left-banner"></div>\r\n</div>\r\n<div class="banner-container">\r\n<div class="left-banner"></div>\r\n<div class="right-banner"></div>\r\n</div>', '<div class="list-container"><span class="list-heading">Quick Links</span>\r\n<ul class="list-group">\r\n<li><a href="@php echo route(\'shop.cms.page\', \'about-us\') @endphp">About Us</a></li>\r\n<li><a href="@php echo route(\'shop.cms.page\', \'return-policy\') @endphp">Return Policy</a></li>\r\n<li><a href="@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp">Refund Policy</a></li>\r\n<li><a href="@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp">Terms and conditions</a></li>\r\n<li><a href="@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp">Terms of Use</a></li>\r\n<li><a href="@php echo route(\'shop.cms.page\', \'contact-us\') @endphp">Contact Us</a></li>\r\n</ul>\r\n</div>\r\n<div class="list-container"><span class="list-heading">Connect With Us</span>\r\n<ul class="list-group">\r\n<li><a href="#"><span class="icon icon-facebook"></span>Facebook </a></li>\r\n<li><a href="#"><span class="icon icon-twitter"></span> Twitter </a></li>\r\n<li><a href="#"><span class="icon icon-instagram"></span> Instagram </a></li>\r\n<li><a href="#"> <span class="icon icon-google-plus"></span>Google+ </a></li>\r\n<li><a href="#"> <span class="icon icon-linkedin"></span>LinkedIn </a></li>\r\n</ul>\r\n</div>', '', '{"meta_title": "Demo store", "meta_keywords": "Demo store meta keyword", "meta_description": "Demo store meta description"}', '2021-04-14 13:13:45', '2021-04-26 08:10:27');
/*!40000 ALTER TABLE `channel_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.cms_pages
CREATE TABLE IF NOT EXISTS `cms_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cms_pages: ~11 rows (approximately)
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES
	(1, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(2, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(3, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(4, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(5, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(6, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(7, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(8, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(9, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(10, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(11, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(12, NULL, '2021-04-15 16:53:30', '2021-04-15 16:53:30'),
	(13, NULL, '2021-04-18 13:12:07', '2021-04-18 13:12:07');
/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;

-- Dumping structure for table bagisto.cms_page_channels
CREATE TABLE IF NOT EXISTS `cms_page_channels` (
  `cms_page_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cms_page_channels: ~2 rows (approximately)
/*!40000 ALTER TABLE `cms_page_channels` DISABLE KEYS */;
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES
	(12, 1),
	(13, 1);
/*!40000 ALTER TABLE `cms_page_channels` ENABLE KEYS */;

-- Dumping structure for table bagisto.cms_page_translations
CREATE TABLE IF NOT EXISTS `cms_page_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.cms_page_translations: ~14 rows (approximately)
/*!40000 ALTER TABLE `cms_page_translations` DISABLE KEYS */;
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES
	(1, 'About Us', 'about-us', '<div class="static-container"><div class="mb-5">About us page content</div></div>', 'about us', '', 'aboutus', 'en', 1),
	(2, 'Return Policy', 'return-policy', '<div class="static-container"><div class="mb-5">Return policy page content</div></div>', 'return policy', '', 'return, policy', 'en', 2),
	(3, 'Refund Policy', 'refund-policy', '<div class="static-container"><div class="mb-5">Refund policy page content</div></div>', 'Refund policy', '', 'refund, policy', 'en', 3),
	(4, 'Terms & Conditions', 'terms-conditions', '<div class="static-container"><div class="mb-5">Terms & conditions page content</div></div>', 'Terms & Conditions', '', 'term, conditions', 'en', 4),
	(5, 'Terms of use', 'terms-of-use', '<div class="static-container"><div class="mb-5">Terms of use page content</div></div>', 'Terms of use', '', 'term, use', 'en', 5),
	(6, 'Contact Us', 'contact-us', '<div class="static-container"><div class="mb-5">Contact us page content</div></div>', 'Contact Us', '', 'contact, us', 'en', 6),
	(7, 'Customer Service', 'cutomer-service', '<div class="static-container"><div class="mb-5">Customer service  page content</div></div>', 'Customer Service', '', 'customer, service', 'en', 7),
	(8, 'What\'s New', 'whats-new', '<div class="static-container"><div class="mb-5">What\'s New page content</div></div>', 'What\'s New', '', 'new', 'en', 8),
	(9, 'Payment Policy', 'payment-policy', '<div class="static-container"><div class="mb-5">Payment Policy page content</div></div>', 'Payment Policy', '', 'payment, policy', 'en', 9),
	(10, 'Shipping Policy', 'shipping-policy', '<div class="static-container"><div class="mb-5">Shipping Policy  page content</div></div>', 'Shipping Policy', '', 'shipping, policy', 'en', 10),
	(11, 'Privacy Policy', 'privacy-policy', '<div class="static-container"><div class="mb-5">Privacy Policy  page content</div></div>', 'Privacy Policy', '', 'privacy, policy', 'en', 11),
	(12, 'Hi', 'test', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام "هنا يوجد محتوى نصي، هنا يوجد محتوى نصي" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل افتراضي كنموذج عن النص، وإذا قمت بإدخال "lorem ipsum" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.</p>\r\n<p></p>', '', 'test', 'test', 'en', 12),
	(13, 'Hi', 'test', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام "هنا يوجد محتوى نصي، هنا يوجد محتوى نصي" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل افتراضي كنموذج عن النص، وإذا قمت بإدخال "lorem ipsum" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.</p>\r\n<p></p>', '', 'test', 'test', 'ar', 12),
	(14, 'اسئلة وأجوبة', 'questions-and-answers', '<p>&nbsp;&nbsp;</p>', '', '', '', 'en', 13),
	(15, 'اسئلة وأجوبة', 'questions-and-answers', '<div class="wrap-collabsible"><input id="collapsible1" class="toggle" type="checkbox" /> <label for="collapsible1" class="lbl-toggle">هناك حقيقة مثبتة منذ زمن طويل</label>\r\n<div class="collapsible-content">\r\n<div class="content-inner">\r\n<p>وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.</p>\r\n</div>\r\n</div>\r\n<input id="collapsible2" class="toggle" type="checkbox" /> <label for="collapsible2" class="lbl-toggle">هناك حقيقة مثبتة منذ زمن طويل</label>\r\n<div class="collapsible-content">\r\n<div class="content-inner">\r\n<p>وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.</p>\r\n</div>\r\n</div>\r\n<input id="collapsible3" class="toggle" type="checkbox" /> <label for="collapsible3" class="lbl-toggle">هناك حقيقة مثبتة منذ زمن طويل</label>\r\n<div class="collapsible-content">\r\n<div class="content-inner">\r\n<p>وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.</p>\r\n</div>\r\n</div>\r\n</div>', '', '', '', 'ar', 13);
/*!40000 ALTER TABLE `cms_page_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.core_config
CREATE TABLE IF NOT EXISTS `core_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_config_channel_id_foreign` (`channel_code`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.core_config: ~128 rows (approximately)
/*!40000 ALTER TABLE `core_config` DISABLE KEYS */;
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES
	(1, 'catalog.products.guest-checkout.allow-guest-checkout', '1', NULL, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(2, 'emails.general.notifications.emails.general.notifications.verification', '1', NULL, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(3, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(4, 'emails.general.notifications.emails.general.notifications.customer', '1', NULL, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(5, 'emails.general.notifications.emails.general.notifications.new-order', '1', NULL, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(6, 'emails.general.notifications.emails.general.notifications.new-admin', '1', NULL, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(7, 'emails.general.notifications.emails.general.notifications.new-invoice', '1', NULL, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(8, 'emails.general.notifications.emails.general.notifications.new-refund', '1', NULL, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(9, 'emails.general.notifications.emails.general.notifications.new-shipment', '1', NULL, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(10, 'emails.general.notifications.emails.general.notifications.new-inventory-source', '1', NULL, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(11, 'emails.general.notifications.emails.general.notifications.cancel-order', '1', NULL, NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(12, 'catalog.products.homepage.out_of_stock_items', '0', NULL, NULL, '2021-04-13 17:03:57', '2021-04-14 14:42:17'),
	(13, 'customer.settings.social_login.enable_facebook', '1', 'default', NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(14, 'customer.settings.social_login.enable_twitter', '1', 'default', NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(15, 'customer.settings.social_login.enable_google', '1', 'default', NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(16, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(17, 'customer.settings.social_login.enable_github', '1', 'default', NULL, '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(18, 'general.content.shop.compare_option', '1', 'default', 'en', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(19, 'general.content.shop.compare_option', '1', 'default', 'fr', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(20, 'general.content.shop.compare_option', '1', 'default', 'ar', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(21, 'general.content.shop.compare_option', '1', 'default', 'de', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(22, 'general.content.shop.compare_option', '1', 'default', 'es', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(23, 'general.content.shop.compare_option', '1', 'default', 'fa', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(24, 'general.content.shop.compare_option', '1', 'default', 'it', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(25, 'general.content.shop.compare_option', '1', 'default', 'ja', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(26, 'general.content.shop.compare_option', '1', 'default', 'nl', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(27, 'general.content.shop.compare_option', '1', 'default', 'pl', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(28, 'general.content.shop.compare_option', '1', 'default', 'pt_BR', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(29, 'general.content.shop.compare_option', '1', 'default', 'tr', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(30, 'general.content.shop.wishlist_option', '1', 'default', 'en', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(31, 'general.content.shop.wishlist_option', '1', 'default', 'fr', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(32, 'general.content.shop.wishlist_option', '1', 'default', 'ar', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(33, 'general.content.shop.wishlist_option', '1', 'default', 'de', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(34, 'general.content.shop.wishlist_option', '1', 'default', 'es', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(35, 'general.content.shop.wishlist_option', '1', 'default', 'fa', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(36, 'general.content.shop.wishlist_option', '1', 'default', 'it', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(37, 'general.content.shop.wishlist_option', '1', 'default', 'ja', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(38, 'general.content.shop.wishlist_option', '1', 'default', 'nl', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(39, 'general.content.shop.wishlist_option', '1', 'default', 'pl', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(40, 'general.content.shop.wishlist_option', '1', 'default', 'pt_BR', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(41, 'general.content.shop.wishlist_option', '1', 'default', 'tr', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(42, 'general.content.shop.image_search', '1', 'default', 'en', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(43, 'general.content.shop.image_search', '1', 'default', 'fr', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(44, 'general.content.shop.image_search', '1', 'default', 'ar', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(45, 'general.content.shop.image_search', '1', 'default', 'de', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(46, 'general.content.shop.image_search', '1', 'default', 'es', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(47, 'general.content.shop.image_search', '1', 'default', 'fa', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(48, 'general.content.shop.image_search', '1', 'default', 'it', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(49, 'general.content.shop.image_search', '1', 'default', 'ja', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(50, 'general.content.shop.image_search', '1', 'default', 'nl', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(51, 'general.content.shop.image_search', '1', 'default', 'pl', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(52, 'general.content.shop.image_search', '1', 'default', 'pt_BR', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(53, 'general.content.shop.image_search', '1', 'default', 'tr', '2021-04-13 17:03:57', '2021-04-13 17:03:57'),
	(54, 'pwa.settings.general.name', 'Jawwal E-Commerce', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(55, 'pwa.settings.general.short_name', 'Jawwal', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(56, 'pwa.settings.general.theme_color', '#6abf4b', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(57, 'pwa.settings.general.background_color', '#efefef', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(58, 'pwa.settings.general.enable_new', '1', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(59, 'pwa.settings.general.enable_featured', '1', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(60, 'pwa.settings.general.enable_slider', '1', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(61, 'pwa.settings.general.enable_categories_home_page_listing', '1', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(62, 'pwa.settings.general.redirect_to_pwa_if_mobile', '0', 'default', NULL, '2021-04-14 13:26:41', '2021-04-21 15:17:30'),
	(63, 'pwa.settings.seo.seo_author', '', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(64, 'pwa.settings.seo.seo_title', '', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(65, 'pwa.settings.seo.seo_description', '', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(66, 'pwa.settings.seo.seo_keywords', '', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(67, 'pwa.settings.push-notification.topic', '', 'default', 'ar', '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(68, 'pwa.settings.push-notification.messaging-id', '', 'default', 'ar', '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(69, 'pwa.settings.push-notification.api-key', '', 'default', NULL, '2021-04-14 13:26:41', '2021-04-14 13:26:41'),
	(70, 'pwa.settings.media.small', 'configuration/F9WPam4QSrhz9DzRb0JKn1HcJ3Ntmq5olzoD8Cv7.png', NULL, NULL, '2021-04-14 13:26:41', '2021-04-14 13:29:40'),
	(71, 'pwa.settings.media.medium', 'configuration/G07KuFquJKSG4e7GajG8ZbVmZsIVKg885JZpcuPh.png', NULL, NULL, '2021-04-14 13:26:41', '2021-04-14 13:29:40'),
	(72, 'pwa.settings.media.large', 'configuration/5BQ9tHM2IC8wtRvLOXWojb2OtdKmBQufqBlfbgdR.png', NULL, NULL, '2021-04-14 13:26:41', '2021-04-14 13:29:40'),
	(73, 'pwa.settings.media.extra_large', 'configuration/CZSzkBlz5V29dSUTbmEQrKIun3asCGVJUIQGvrp3.png', NULL, NULL, '2021-04-14 13:26:41', '2021-04-14 13:29:40'),
	(74, 'catalog.inventory.stock_options.backorders', '1', 'default', NULL, '2021-04-14 14:41:57', '2021-04-14 14:41:57'),
	(75, 'catalog.products.homepage.no_of_new_product_homepage', '16', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 16:26:32'),
	(76, 'catalog.products.homepage.no_of_featured_product_homepage', '16', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 16:26:32'),
	(77, 'catalog.products.storefront.mode', 'grid', 'default', NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(78, 'catalog.products.storefront.products_per_page', '', 'default', NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(79, 'catalog.products.storefront.sort_by', 'name-desc', 'default', NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(80, 'catalog.products.storefront.buy_now_button_display', '0', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(81, 'catalog.products.review.guest_review', '1', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 14:57:31'),
	(82, 'catalog.products.attribute.image_attribute_upload_size', '', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(83, 'catalog.products.attribute.file_attribute_upload_size', '', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(84, 'catalog.products.social_share.enabled', '0', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(85, 'catalog.products.social_share.facebook', '0', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(86, 'catalog.products.social_share.twitter', '0', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(87, 'catalog.products.social_share.pinterest', '0', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(88, 'catalog.products.social_share.whatsapp', '0', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(89, 'catalog.products.social_share.linkedin', '0', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(90, 'catalog.products.social_share.email', '0', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(91, 'catalog.products.social_share.share_message', '', NULL, NULL, '2021-04-14 14:42:17', '2021-04-14 14:42:17'),
	(92, 'catalog.rich_snippets.products.enable', '1', NULL, NULL, '2021-04-15 14:21:22', '2021-04-15 14:21:22'),
	(93, 'catalog.rich_snippets.products.show_sku', '1', NULL, NULL, '2021-04-15 14:21:22', '2021-04-15 14:21:22'),
	(94, 'catalog.rich_snippets.products.show_weight', '1', NULL, NULL, '2021-04-15 14:21:22', '2021-04-15 14:21:22'),
	(95, 'catalog.rich_snippets.products.show_categories', '1', NULL, NULL, '2021-04-15 14:21:22', '2021-04-15 14:21:22'),
	(96, 'catalog.rich_snippets.products.show_images', '1', NULL, NULL, '2021-04-15 14:21:22', '2021-04-15 14:21:22'),
	(97, 'catalog.rich_snippets.products.show_reviews', '1', NULL, NULL, '2021-04-15 14:21:22', '2021-04-15 14:21:22'),
	(98, 'catalog.rich_snippets.products.show_ratings', '1', NULL, NULL, '2021-04-15 14:21:22', '2021-04-15 14:21:22'),
	(99, 'catalog.rich_snippets.products.show_offers', '1', NULL, NULL, '2021-04-15 14:21:22', '2021-04-15 14:21:22'),
	(100, 'catalog.rich_snippets.categories.enable', '1', NULL, NULL, '2021-04-15 14:21:22', '2021-04-15 14:21:22'),
	(101, 'catalog.rich_snippets.categories.show_search_input_field', '1', NULL, NULL, '2021-04-15 14:21:22', '2021-04-15 14:21:22'),
	(102, 'customer.settings.address.street_lines', '', 'default', NULL, '2021-04-20 15:35:46', '2021-04-20 15:35:46'),
	(103, 'customer.settings.newsletter.subscription', '1', NULL, NULL, '2021-04-20 15:35:46', '2021-04-20 15:35:46'),
	(104, 'customer.settings.email.verification', '0', NULL, NULL, '2021-04-20 15:35:46', '2021-04-20 15:35:46'),
	(105, 'sales.paymentmethods.paypal_smart_button.title', 'PayPal Smart Button', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(106, 'sales.paymentmethods.paypal_smart_button.description', 'PayPal', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(107, 'sales.paymentmethods.paypal_smart_button.client_id', 'sb', NULL, NULL, '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(108, 'sales.paymentmethods.paypal_smart_button.client_secret', '', NULL, NULL, '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(109, 'sales.paymentmethods.paypal_smart_button.accepted_currencies', '', NULL, NULL, '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(110, 'sales.paymentmethods.paypal_smart_button.active', '0', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(111, 'sales.paymentmethods.paypal_smart_button.sandbox', '1', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(112, 'sales.paymentmethods.paypal_smart_button.sort', '1', NULL, NULL, '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(113, 'sales.paymentmethods.cashondelivery.title', 'Cash On Delivery', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(114, 'sales.paymentmethods.cashondelivery.description', 'الدفع عند الاستلام', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:31'),
	(115, 'sales.paymentmethods.cashondelivery.active', '1', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(116, 'sales.paymentmethods.cashondelivery.instructions', '', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(117, 'sales.paymentmethods.cashondelivery.sort', '1', NULL, NULL, '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(118, 'sales.paymentmethods.moneytransfer.title', 'Money Transfer', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(119, 'sales.paymentmethods.moneytransfer.description', 'Money Transfer', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(120, 'sales.paymentmethods.moneytransfer.active', '0', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(121, 'sales.paymentmethods.moneytransfer.mailing_address', '', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(122, 'sales.paymentmethods.moneytransfer.sort', '2', NULL, NULL, '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(123, 'sales.paymentmethods.paypal_standard.title', 'PayPal Standard', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(124, 'sales.paymentmethods.paypal_standard.description', 'PayPal Standard', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(125, 'sales.paymentmethods.paypal_standard.business_account', 'test@webkul.com', NULL, NULL, '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(126, 'sales.paymentmethods.paypal_standard.active', '0', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(127, 'sales.paymentmethods.paypal_standard.sandbox', '1', NULL, 'ar', '2021-04-26 14:42:15', '2021-04-26 14:42:15'),
	(128, 'sales.paymentmethods.paypal_standard.sort', '3', NULL, NULL, '2021-04-26 14:42:15', '2021-04-26 14:42:15');
/*!40000 ALTER TABLE `core_config` ENABLE KEYS */;

-- Dumping structure for table bagisto.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.countries: ~12 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `code`, `name`) VALUES
	(256, 'RM', 'Ramallah'),
	(257, 'NA', 'Nablus'),
	(258, 'TU', 'Tulkarm'),
	(259, 'HE', 'Hebron'),
	(260, 'JN', 'Jenin'),
	(261, 'BE', 'Bethlehem'),
	(262, 'GZ', 'Gaza'),
	(263, 'QA', 'Qalqilia'),
	(264, 'SA', 'Salfit'),
	(265, 'JR', 'Jericho'),
	(266, 'TB', 'Tubas'),
	(267, 'JE', 'Jerusalem');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping structure for table bagisto.country_states
CREATE TABLE IF NOT EXISTS `country_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.country_states: ~0 rows (approximately)
/*!40000 ALTER TABLE `country_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_states` ENABLE KEYS */;

-- Dumping structure for table bagisto.country_state_translations
CREATE TABLE IF NOT EXISTS `country_state_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text COLLATE utf8mb4_unicode_ci,
  `country_state_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1705 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.country_state_translations: ~0 rows (approximately)
/*!40000 ALTER TABLE `country_state_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_state_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.country_translations
CREATE TABLE IF NOT EXISTS `country_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `country_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=778 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.country_translations: ~12 rows (approximately)
/*!40000 ALTER TABLE `country_translations` DISABLE KEYS */;
INSERT INTO `country_translations` (`id`, `locale`, `name`, `country_id`) VALUES
	(766, 'ar', 'رام الله والبيرة', 256),
	(767, 'ar', 'الخليل', 259),
	(768, 'ar', 'القدس', 267),
	(769, 'ar', 'طولكرم', 258),
	(770, 'ar', 'نابلس', 257),
	(771, 'ar', 'بيت لحم', 261),
	(772, 'ar', 'طوباس', 266),
	(773, 'ar', 'غزة', 262),
	(774, 'ar', 'جنين', 260),
	(775, 'ar', 'اريحا', 265),
	(776, 'ar', 'قلقيلية', 263),
	(777, 'ar', 'سلفيت', 264);
/*!40000 ALTER TABLE `country_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.currencies: ~2 rows (approximately)
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` (`id`, `code`, `name`, `created_at`, `updated_at`, `symbol`) VALUES
	(1, 'USD', 'US Dollar', NULL, NULL, '$'),
	(3, 'NIS', 'شيكل', '2021-04-14 13:13:21', '2021-04-21 14:10:41', '₪');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;

-- Dumping structure for table bagisto.currency_exchange_rates
CREATE TABLE IF NOT EXISTS `currency_exchange_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.currency_exchange_rates: ~0 rows (approximately)
/*!40000 ALTER TABLE `currency_exchange_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_exchange_rates` ENABLE KEYS */;

-- Dumping structure for table bagisto.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.customers: ~1 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `status`, `password`, `api_token`, `customer_group_id`, `subscribed_to_news_letter`, `remember_token`, `created_at`, `updated_at`, `is_verified`, `token`, `notes`, `phone`) VALUES
	(1, 'Mohammad', 'Barhoush', NULL, NULL, 'mohammadbarhoush@gmail.com', 1, '$2y$10$e5n0TqeOPxgBli7ktAOh6OK64udPRcD5VKM01lrtT2RsqFQJxMSSq', '6n7psWglbxutHH5O0TmzabcTtM7A5Qq7133NfBTgAYpTyc4hVMCY9OBV2YVRdZuSdHRDoiua6bPmp1x1', 2, 1, NULL, '2021-04-20 15:36:29', '2021-04-20 15:36:29', 1, '8c6b08a74e8483079eba8ade24114f5f', NULL, NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for table bagisto.customer_groups
CREATE TABLE IF NOT EXISTS `customer_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.customer_groups: ~4 rows (approximately)
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
INSERT INTO `customer_groups` (`id`, `name`, `is_user_defined`, `created_at`, `updated_at`, `code`) VALUES
	(1, 'Guest', 0, NULL, NULL, 'guest'),
	(2, 'General', 0, NULL, NULL, 'general'),
	(3, 'Wholesale', 0, NULL, NULL, 'wholesale'),
	(4, 'Paltel Group Employees', 1, '2021-04-21 14:04:21', '2021-04-21 14:04:21', 'paltelgroupemployees');
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;

-- Dumping structure for table bagisto.customer_password_resets
CREATE TABLE IF NOT EXISTS `customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.customer_password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_password_resets` ENABLE KEYS */;

-- Dumping structure for table bagisto.customer_social_accounts
CREATE TABLE IF NOT EXISTS `customer_social_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.customer_social_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `customer_social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_social_accounts` ENABLE KEYS */;

-- Dumping structure for table bagisto.downloadable_link_purchased
CREATE TABLE IF NOT EXISTS `downloadable_link_purchased` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT '0',
  `download_used` int NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `order_item_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `download_canceled` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.downloadable_link_purchased: ~0 rows (approximately)
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;

-- Dumping structure for function bagisto.get_url_path_of_category
DELIMITER //
//
DELIMITER ;

-- Dumping structure for table bagisto.inventory_sources
CREATE TABLE IF NOT EXISTS `inventory_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.inventory_sources: ~0 rows (approximately)
/*!40000 ALTER TABLE `inventory_sources` DISABLE KEYS */;
INSERT INTO `inventory_sources` (`id`, `code`, `name`, `description`, `contact_name`, `contact_email`, `contact_number`, `contact_fax`, `country`, `state`, `city`, `street`, `postcode`, `priority`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'default', 'Default', NULL, 'Detroit Warehouse', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);
/*!40000 ALTER TABLE `inventory_sources` ENABLE KEYS */;

-- Dumping structure for table bagisto.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `order_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  KEY `invoices_order_address_id_foreign` (`order_address_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.invoices: ~0 rows (approximately)
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;

-- Dumping structure for table bagisto.invoice_items
CREATE TABLE IF NOT EXISTS `invoice_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `invoice_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.invoice_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;

-- Dumping structure for table bagisto.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table bagisto.locales
CREATE TABLE IF NOT EXISTS `locales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `locale_image` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.locales: ~2 rows (approximately)
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` (`id`, `code`, `name`, `created_at`, `updated_at`, `direction`, `locale_image`) VALUES
	(1, 'en', 'English', NULL, NULL, 'ltr', NULL),
	(5, 'ar', 'Arabic', '2021-04-13 18:03:15', '2021-04-13 18:03:15', 'rtl', 'velocity/locale_image/5/AR3gLYmFFeCqj3yUmj1DugNIOfyVuOBQyEzaxYM6.jpg');
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;

-- Dumping structure for table bagisto.marketing_campaigns
CREATE TABLE IF NOT EXISTS `marketing_campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `marketing_template_id` int unsigned DEFAULT NULL,
  `marketing_event_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.marketing_campaigns: ~0 rows (approximately)
/*!40000 ALTER TABLE `marketing_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_campaigns` ENABLE KEYS */;

-- Dumping structure for table bagisto.marketing_events
CREATE TABLE IF NOT EXISTS `marketing_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.marketing_events: ~0 rows (approximately)
/*!40000 ALTER TABLE `marketing_events` DISABLE KEYS */;
INSERT INTO `marketing_events` (`id`, `name`, `description`, `date`, `created_at`, `updated_at`) VALUES
	(1, 'Birthday', 'Birthday', NULL, NULL, NULL);
/*!40000 ALTER TABLE `marketing_events` ENABLE KEYS */;

-- Dumping structure for table bagisto.marketing_templates
CREATE TABLE IF NOT EXISTS `marketing_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.marketing_templates: ~1 rows (approximately)
/*!40000 ALTER TABLE `marketing_templates` DISABLE KEYS */;
INSERT INTO `marketing_templates` (`id`, `name`, `status`, `content`, `created_at`, `updated_at`) VALUES
	(1, 'test', 'active', '<p>test</p>', '2021-04-20 15:37:50', '2021-04-20 15:37:50');
/*!40000 ALTER TABLE `marketing_templates` ENABLE KEYS */;

-- Dumping structure for table bagisto.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.migrations: ~192 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_admin_password_resets_table', 1),
	(3, '2014_10_12_100000_create_password_resets_table', 1),
	(4, '2018_06_12_111907_create_admins_table', 1),
	(5, '2018_06_13_055341_create_roles_table', 1),
	(6, '2018_07_05_130148_create_attributes_table', 1),
	(7, '2018_07_05_132854_create_attribute_translations_table', 1),
	(8, '2018_07_05_135150_create_attribute_families_table', 1),
	(9, '2018_07_05_135152_create_attribute_groups_table', 1),
	(10, '2018_07_05_140832_create_attribute_options_table', 1),
	(11, '2018_07_05_140856_create_attribute_option_translations_table', 1),
	(12, '2018_07_05_142820_create_categories_table', 1),
	(13, '2018_07_10_055143_create_locales_table', 1),
	(14, '2018_07_20_054426_create_countries_table', 1),
	(15, '2018_07_20_054502_create_currencies_table', 1),
	(16, '2018_07_20_054542_create_currency_exchange_rates_table', 1),
	(17, '2018_07_20_064849_create_channels_table', 1),
	(18, '2018_07_21_142836_create_category_translations_table', 1),
	(19, '2018_07_23_110040_create_inventory_sources_table', 1),
	(20, '2018_07_24_082635_create_customer_groups_table', 1),
	(21, '2018_07_24_082930_create_customers_table', 1),
	(22, '2018_07_24_083025_create_customer_addresses_table', 1),
	(23, '2018_07_27_065727_create_products_table', 1),
	(24, '2018_07_27_070011_create_product_attribute_values_table', 1),
	(25, '2018_07_27_092623_create_product_reviews_table', 1),
	(26, '2018_07_27_113941_create_product_images_table', 1),
	(27, '2018_07_27_113956_create_product_inventories_table', 1),
	(28, '2018_08_03_114203_create_sliders_table', 1),
	(29, '2018_08_30_064755_create_tax_categories_table', 1),
	(30, '2018_08_30_065042_create_tax_rates_table', 1),
	(31, '2018_08_30_065840_create_tax_mappings_table', 1),
	(32, '2018_09_05_150444_create_cart_table', 1),
	(33, '2018_09_05_150915_create_cart_items_table', 1),
	(34, '2018_09_11_064045_customer_password_resets', 1),
	(35, '2018_09_19_092845_create_cart_address', 1),
	(36, '2018_09_19_093453_create_cart_payment', 1),
	(37, '2018_09_19_093508_create_cart_shipping_rates_table', 1),
	(38, '2018_09_20_060658_create_core_config_table', 1),
	(39, '2018_09_27_113154_create_orders_table', 1),
	(40, '2018_09_27_113207_create_order_items_table', 1),
	(41, '2018_09_27_113405_create_order_address_table', 1),
	(42, '2018_09_27_115022_create_shipments_table', 1),
	(43, '2018_09_27_115029_create_shipment_items_table', 1),
	(44, '2018_09_27_115135_create_invoices_table', 1),
	(45, '2018_09_27_115144_create_invoice_items_table', 1),
	(46, '2018_10_01_095504_create_order_payment_table', 1),
	(47, '2018_10_03_025230_create_wishlist_table', 1),
	(48, '2018_10_12_101803_create_country_translations_table', 1),
	(49, '2018_10_12_101913_create_country_states_table', 1),
	(50, '2018_10_12_101923_create_country_state_translations_table', 1),
	(51, '2018_11_15_153257_alter_order_table', 1),
	(52, '2018_11_15_163729_alter_invoice_table', 1),
	(53, '2018_11_16_173504_create_subscribers_list_table', 1),
	(54, '2018_11_17_165758_add_is_verified_column_in_customers_table', 1),
	(55, '2018_11_21_144411_create_cart_item_inventories_table', 1),
	(56, '2018_11_26_110500_change_gender_column_in_customers_table', 1),
	(57, '2018_11_27_174449_change_content_column_in_sliders_table', 1),
	(58, '2018_12_05_132625_drop_foreign_key_core_config_table', 1),
	(59, '2018_12_05_132629_alter_core_config_table', 1),
	(60, '2018_12_06_185202_create_product_flat_table', 1),
	(61, '2018_12_21_101307_alter_channels_table', 1),
	(62, '2018_12_24_123812_create_channel_inventory_sources_table', 1),
	(63, '2018_12_24_184402_alter_shipments_table', 1),
	(64, '2018_12_26_165327_create_product_ordered_inventories_table', 1),
	(65, '2018_12_31_161114_alter_channels_category_table', 1),
	(66, '2019_01_11_122452_add_vendor_id_column_in_product_inventories_table', 1),
	(67, '2019_01_25_124522_add_updated_at_column_in_product_flat_table', 1),
	(68, '2019_01_29_123053_add_min_price_and_max_price_column_in_product_flat_table', 1),
	(69, '2019_01_31_164117_update_value_column_type_to_text_in_core_config_table', 1),
	(70, '2019_02_21_145238_alter_product_reviews_table', 1),
	(71, '2019_02_21_152709_add_swatch_type_column_in_attributes_table', 1),
	(72, '2019_02_21_153035_alter_customer_id_in_product_reviews_table', 1),
	(73, '2019_02_21_153851_add_swatch_value_columns_in_attribute_options_table', 1),
	(74, '2019_03_15_123337_add_display_mode_column_in_categories_table', 1),
	(75, '2019_03_28_103658_add_notes_column_in_customers_table', 1),
	(76, '2019_04_24_155820_alter_product_flat_table', 1),
	(77, '2019_05_13_024320_remove_tables', 1),
	(78, '2019_05_13_024321_create_cart_rules_table', 1),
	(79, '2019_05_13_024322_create_cart_rule_channels_table', 1),
	(80, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1),
	(81, '2019_05_13_024324_create_cart_rule_translations_table', 1),
	(82, '2019_05_13_024325_create_cart_rule_customers_table', 1),
	(83, '2019_05_13_024326_create_cart_rule_coupons_table', 1),
	(84, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1),
	(85, '2019_05_22_165833_update_zipcode_column_type_to_varchar_in_cart_address_table', 1),
	(86, '2019_05_23_113407_add_remaining_column_in_product_flat_table', 1),
	(87, '2019_05_23_155520_add_discount_columns_in_invoice_items_table', 1),
	(88, '2019_05_23_184029_rename_discount_columns_in_cart_table', 1),
	(89, '2019_06_04_114009_add_phone_column_in_customers_table', 1),
	(90, '2019_06_06_195905_update_custom_price_to_nullable_in_cart_items', 1),
	(91, '2019_06_15_183412_add_code_column_in_customer_groups_table', 1),
	(92, '2019_06_17_180258_create_product_downloadable_samples_table', 1),
	(93, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1),
	(94, '2019_06_17_180325_create_product_downloadable_links_table', 1),
	(95, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1),
	(96, '2019_06_19_162817_remove_unique_in_phone_column_in_customers_table', 1),
	(97, '2019_06_21_130512_update_weight_column_deafult_value_in_cart_items_table', 1),
	(98, '2019_06_21_202249_create_downloadable_link_purchased_table', 1),
	(99, '2019_07_02_180307_create_booking_products_table', 1),
	(100, '2019_07_05_114157_add_symbol_column_in_currencies_table', 1),
	(101, '2019_07_05_154415_create_booking_product_default_slots_table', 1),
	(102, '2019_07_05_154429_create_booking_product_appointment_slots_table', 1),
	(103, '2019_07_05_154440_create_booking_product_event_tickets_table', 1),
	(104, '2019_07_05_154451_create_booking_product_rental_slots_table', 1),
	(105, '2019_07_05_154502_create_booking_product_table_slots_table', 1),
	(106, '2019_07_11_151210_add_locale_id_in_category_translations', 1),
	(107, '2019_07_23_033128_alter_locales_table', 1),
	(108, '2019_07_23_174708_create_velocity_contents_table', 1),
	(109, '2019_07_23_175212_create_velocity_contents_translations_table', 1),
	(110, '2019_07_29_142734_add_use_in_flat_column_in_attributes_table', 1),
	(111, '2019_07_30_153530_create_cms_pages_table', 1),
	(112, '2019_07_31_143339_create_category_filterable_attributes_table', 1),
	(113, '2019_08_02_105320_create_product_grouped_products_table', 1),
	(114, '2019_08_12_184925_add_additional_cloumn_in_wishlist_table', 1),
	(115, '2019_08_20_170510_create_product_bundle_options_table', 1),
	(116, '2019_08_20_170520_create_product_bundle_option_translations_table', 1),
	(117, '2019_08_20_170528_create_product_bundle_option_products_table', 1),
	(118, '2019_08_21_123707_add_seo_column_in_channels_table', 1),
	(119, '2019_09_11_184511_create_refunds_table', 1),
	(120, '2019_09_11_184519_create_refund_items_table', 1),
	(121, '2019_09_26_163950_remove_channel_id_from_customers_table', 1),
	(122, '2019_10_03_105451_change_rate_column_in_currency_exchange_rates_table', 1),
	(123, '2019_10_21_105136_order_brands', 1),
	(124, '2019_10_24_173358_change_postcode_column_type_in_order_address_table', 1),
	(125, '2019_10_24_173437_change_postcode_column_type_in_cart_address_table', 1),
	(126, '2019_10_24_173507_change_postcode_column_type_in_customer_addresses_table', 1),
	(127, '2019_11_21_194541_add_column_url_path_to_category_translations', 1),
	(128, '2019_11_21_194608_add_stored_function_to_get_url_path_of_category', 1),
	(129, '2019_11_21_194627_add_trigger_to_category_translations', 1),
	(130, '2019_11_21_194648_add_url_path_to_existing_category_translations', 1),
	(131, '2019_11_21_194703_add_trigger_to_categories', 1),
	(132, '2019_11_25_171136_add_applied_cart_rule_ids_column_in_cart_table', 1),
	(133, '2019_11_25_171208_add_applied_cart_rule_ids_column_in_cart_items_table', 1),
	(134, '2019_11_30_124437_add_applied_cart_rule_ids_column_in_orders_table', 1),
	(135, '2019_11_30_165644_add_discount_columns_in_cart_shipping_rates_table', 1),
	(136, '2019_12_03_175253_create_remove_catalog_rule_tables', 1),
	(137, '2019_12_03_184613_create_catalog_rules_table', 1),
	(138, '2019_12_03_184651_create_catalog_rule_channels_table', 1),
	(139, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1),
	(140, '2019_12_06_101110_create_catalog_rule_products_table', 1),
	(141, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1),
	(142, '2019_12_30_155256_create_velocity_meta_data', 1),
	(143, '2020_01_02_201029_add_api_token_columns', 1),
	(144, '2020_01_06_173505_alter_trigger_category_translations', 1),
	(145, '2020_01_06_173524_alter_stored_function_url_path_category', 1),
	(146, '2020_01_06_195305_alter_trigger_on_categories', 1),
	(147, '2020_01_09_154851_add_shipping_discount_columns_in_orders_table', 1),
	(148, '2020_01_09_202815_add_inventory_source_name_column_in_shipments_table', 1),
	(149, '2020_01_10_122226_update_velocity_meta_data', 1),
	(150, '2020_01_10_151902_customer_address_improvements', 1),
	(151, '2020_01_13_131431_alter_float_value_column_type_in_product_attribute_values_table', 1),
	(152, '2020_01_13_155803_add_velocity_locale_icon', 1),
	(153, '2020_01_13_192149_add_category_velocity_meta_data', 1),
	(154, '2020_01_14_191854_create_cms_page_translations_table', 1),
	(155, '2020_01_14_192206_remove_columns_from_cms_pages_table', 1),
	(156, '2020_01_15_130209_create_cms_page_channels_table', 1),
	(157, '2020_01_15_145637_add_product_policy', 1),
	(158, '2020_01_15_152121_add_banner_link', 1),
	(159, '2020_01_28_102422_add_new_column_and_rename_name_column_in_customer_addresses_table', 1),
	(160, '2020_01_29_124748_alter_name_column_in_country_state_translations_table', 1),
	(161, '2020_02_18_165639_create_bookings_table', 1),
	(162, '2020_02_21_121201_create_booking_product_event_ticket_translations_table', 1),
	(163, '2020_02_24_190025_add_is_comparable_column_in_attributes_table', 1),
	(164, '2020_02_25_181902_propagate_company_name', 1),
	(165, '2020_02_26_163908_change_column_type_in_cart_rules_table', 1),
	(166, '2020_02_28_105104_fix_order_columns', 1),
	(167, '2020_02_28_111958_create_customer_compare_products_table', 1),
	(168, '2020_03_23_201431_alter_booking_products_table', 1),
	(169, '2020_04_13_224524_add_locale_in_sliders_table', 1),
	(170, '2020_04_16_130351_remove_channel_from_tax_category', 1),
	(171, '2020_04_16_185147_add_table_addresses', 1),
	(172, '2020_05_06_171638_create_order_comments_table', 1),
	(173, '2020_05_21_171500_create_product_customer_group_prices_table', 1),
	(174, '2020_06_08_161708_add_sale_prices_to_booking_product_event_tickets', 1),
	(175, '2020_06_10_201453_add_locale_velocity_meta_data', 1),
	(176, '2020_06_25_162154_create_customer_social_accounts_table', 1),
	(177, '2020_06_25_162340_change_email_password_columns_in_customers_table', 1),
	(178, '2020_06_30_163510_remove_unique_name_in_tax_categories_table', 1),
	(179, '2020_07_31_142021_update_cms_page_translations_table_field_html_content', 1),
	(180, '2020_08_01_132239_add_header_content_count_velocity_meta_data_table', 1),
	(181, '2020_08_12_114128_removing_foriegn_key', 1),
	(182, '2020_08_17_104228_add_channel_to_velocity_meta_data_table', 1),
	(183, '2020_09_07_120413_add_unique_index_to_increment_id_in_orders_table', 1),
	(184, '2020_09_07_195157_add_additional_to_category', 1),
	(185, '2020_11_10_174816_add_product_number_column_in_product_flat_table', 1),
	(186, '2020_11_19_112228_create_product_videos_table', 1),
	(187, '2020_11_20_105353_add_columns_in_channels_table', 1),
	(188, '2020_11_26_141455_create_marketing_templates_table', 1),
	(189, '2020_11_26_150534_create_marketing_events_table', 1),
	(190, '2020_11_26_150644_create_marketing_campaigns_table', 1),
	(191, '2020_12_18_122826_add_is_tax_calculation_column_to_cart_shipping_rates_table', 1),
	(192, '2020_12_21_000200_create_channel_translations_table', 1),
	(193, '2020_12_21_140151_remove_columns_from_channels_table', 1),
	(194, '2020_12_24_131004_add_customer_id_column_in_subscribers_list_table', 1),
	(195, '2020_12_27_121950_create_jobs_table', 1),
	(196, '2021_02_03_104907_add_adittional_data_to_order_payment_table', 1),
	(197, '2021_02_04_150033_add_download_canceled_column_in_downloadable_link_purchased_table', 1),
	(198, '2019_07_02_121434_create_push_notifications_table', 2),
	(199, '2020_11_05_114057_add_category_product_pwa_in_categories', 2),
	(200, '2020_11_10_090451_create_pwa_layout_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table bagisto.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int DEFAULT NULL,
  `total_qty_ordered` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `channel_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `customer_company_name`, `customer_vat_id`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `created_at`, `updated_at`, `cart_id`, `applied_cart_rule_ids`, `shipping_discount_amount`, `base_shipping_discount_amount`) VALUES
	(1, '1', 'pending', 'Default', 1, 'mohammadbarhoush@gmail.com', 'Mohammad', 'Barhoush', NULL, NULL, 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 2, 'USD', 'NIS', 'NIS', 420.0000, 420.0000, 0.0000, 0.0000, 0.0000, 0.0000, 400.0000, 400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', '2021-04-14 14:09:59', '2021-04-14 14:09:59', 1, '', 0.0000, 0.0000);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table bagisto.order_brands
CREATE TABLE IF NOT EXISTS `order_brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `brand` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_brands_order_id_foreign` (`order_id`),
  KEY `order_brands_order_item_id_foreign` (`order_item_id`),
  KEY `order_brands_product_id_foreign` (`product_id`),
  KEY `order_brands_brand_foreign` (`brand`),
  CONSTRAINT `order_brands_brand_foreign` FOREIGN KEY (`brand`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.order_brands: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_brands` ENABLE KEYS */;

-- Dumping structure for table bagisto.order_comments
CREATE TABLE IF NOT EXISTS `order_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.order_comments: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_comments` ENABLE KEYS */;

-- Dumping structure for table bagisto.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int DEFAULT '0',
  `qty_shipped` int DEFAULT '0',
  `qty_invoiced` int DEFAULT '0',
  `qty_canceled` int DEFAULT '0',
  `qty_refunded` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.order_items: ~2 rows (approximately)
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `product_id`, `product_type`, `order_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 'coat-1', 'configurable', NULL, NULL, 0.0000, 0.0000, 2, 0, 0, 0, 0, 200.0000, 200.0000, 400.0000, 400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 2, 'Webkul\\Product\\Models\\Product', 1, NULL, '{"locale": "en", "quantity": 2, "attributes": {"size": {"option_id": 6, "option_label": "S", "attribute_name": "Size"}, "color": {"option_id": 4, "option_label": "Black", "attribute_name": "Color"}}, "is_buy_now": 0, "product_id": "2", "super_attribute": {"23": 4, "24": 6}, "selected_configurable_option": 3}', '2021-04-14 14:09:59', '2021-04-14 14:09:59'),
	(2, 'coat-1-variant-4-6', 'simple', '', NULL, 0.0000, 0.0000, 0, 0, 0, 0, 0, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3, 'Webkul\\Product\\Models\\Product', 1, 1, '{"locale": "en", "parent_id": 2, "product_id": 3}', '2021-04-14 14:09:59', '2021-04-14 14:09:59');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;

-- Dumping structure for table bagisto.order_payment
CREATE TABLE IF NOT EXISTS `order_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.order_payment: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
INSERT INTO `order_payment` (`id`, `method`, `method_title`, `order_id`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 'cashondelivery', NULL, 1, NULL, '2021-04-14 14:09:59', '2021-04-14 14:09:59');
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;

-- Dumping structure for table bagisto.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table bagisto.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.products: ~8 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `sku`, `type`, `created_at`, `updated_at`, `parent_id`, `attribute_family_id`) VALUES
	(34, '1254f', 'configurable', '2021-04-20 14:42:55', '2021-04-20 14:42:55', NULL, 5),
	(35, '1254f-variant-1-27', 'simple', '2021-04-20 14:42:55', '2021-04-20 14:42:55', 34, 5),
	(36, '1254f-variant-4-27', 'simple', '2021-04-20 14:42:55', '2021-04-20 14:42:55', 34, 5),
	(42, '1254f-variant-5-28', 'simple', '2021-04-20 14:42:56', '2021-04-20 14:42:56', 34, 5),
	(46, 'asus-1', 'simple', '2021-04-21 14:01:55', '2021-04-21 14:01:55', NULL, 6),
	(47, 'keyboard-hp', 'simple', '2021-04-21 14:12:38', '2021-04-21 14:15:56', NULL, 6),
	(48, 'keyboard-and-laptop-1', 'bundle', '2021-04-21 14:16:51', '2021-04-21 14:16:51', NULL, 6),
	(49, 'wash12', 'simple', '2021-04-21 16:42:31', '2021-04-21 16:42:31', NULL, 7);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_attribute_values
CREATE TABLE IF NOT EXISTS `product_attribute_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=571 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_attribute_values: ~127 rows (approximately)
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`) VALUES
	(376, NULL, NULL, '1254f-variant-1-27', NULL, NULL, NULL, NULL, NULL, NULL, 35, 1),
	(377, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 35, 2),
	(378, 'ar', 'default', '1254f-Red-41', NULL, NULL, NULL, NULL, NULL, NULL, 35, 2),
	(379, NULL, NULL, NULL, NULL, NULL, 200.0000, NULL, NULL, NULL, 35, 11),
	(380, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, 35, 22),
	(381, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 35, 8),
	(382, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 35, 23),
	(383, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, 35, 31),
	(384, NULL, NULL, '1254f-variant-4-27', NULL, NULL, NULL, NULL, NULL, NULL, 36, 1),
	(385, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 36, 2),
	(386, 'ar', 'default', '1254f-Black-41', NULL, NULL, NULL, NULL, NULL, NULL, 36, 2),
	(387, NULL, NULL, NULL, NULL, NULL, 200.0000, NULL, NULL, NULL, 36, 11),
	(388, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, 36, 22),
	(389, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 36, 8),
	(390, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 36, 23),
	(391, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, 36, 31),
	(432, NULL, NULL, '1254f-variant-5-28', NULL, NULL, NULL, NULL, NULL, NULL, 42, 1),
	(433, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 42, 2),
	(434, 'ar', 'default', '1254f-White-42', NULL, NULL, NULL, NULL, NULL, NULL, 42, 2),
	(435, NULL, NULL, NULL, NULL, NULL, 350.0000, NULL, NULL, NULL, 42, 11),
	(436, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, 42, 22),
	(437, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 42, 8),
	(438, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 42, 23),
	(439, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, 42, 31),
	(448, 'ar', 'default', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 34, 9),
	(449, 'ar', 'default', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. اسامة</p>', NULL, NULL, NULL, NULL, NULL, NULL, 34, 10),
	(450, NULL, NULL, '1254f', NULL, NULL, NULL, NULL, NULL, NULL, 34, 1),
	(451, 'ar', 'default', 'Nike Blazer', NULL, NULL, NULL, NULL, NULL, NULL, 34, 2),
	(452, NULL, NULL, 'nike-blazer', NULL, NULL, NULL, NULL, NULL, NULL, 34, 3),
	(453, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 34, 4),
	(454, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 34, 5),
	(455, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 34, 6),
	(456, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 34, 7),
	(457, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 34, 8),
	(458, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, 34, 25),
	(459, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 34, 26),
	(460, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 34, 27),
	(461, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 34, 16),
	(462, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 34, 17),
	(463, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 34, 18),
	(482, 'ar', 'default', '<p>هناك حقيقة مثبتة</p>', NULL, NULL, NULL, NULL, NULL, NULL, 46, 9),
	(483, 'ar', 'default', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام "ه</p>', NULL, NULL, NULL, NULL, NULL, NULL, 46, 10),
	(484, NULL, NULL, 'asus-1', NULL, NULL, NULL, NULL, NULL, NULL, 46, 1),
	(485, 'ar', 'default', 'Asus Zenbook-2021', NULL, NULL, NULL, NULL, NULL, NULL, 46, 2),
	(486, NULL, NULL, 'asus-zenbook-2021', NULL, NULL, NULL, NULL, NULL, NULL, 46, 3),
	(487, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 46, 4),
	(488, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 46, 5),
	(489, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 46, 6),
	(490, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 46, 7),
	(491, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 46, 8),
	(492, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 46, 26),
	(493, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 46, 27),
	(494, NULL, NULL, 'Asus', NULL, NULL, NULL, NULL, NULL, NULL, 46, 32),
	(495, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 46, 16),
	(496, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 46, 17),
	(497, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 46, 18),
	(498, NULL, NULL, NULL, NULL, NULL, 5000.0000, NULL, NULL, NULL, 46, 11),
	(499, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, 12),
	(500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, 13),
	(501, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, 14),
	(502, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, 15),
	(503, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 46, 19),
	(504, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 46, 20),
	(505, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 46, 21),
	(506, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, 46, 22),
	(507, 'ar', 'default', '<p>هناك حقيقة مثبتة&nbsp;</p>', NULL, NULL, NULL, NULL, NULL, NULL, 47, 9),
	(508, 'ar', 'default', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها</p>', NULL, NULL, NULL, NULL, NULL, NULL, 47, 10),
	(509, NULL, NULL, 'keyboard-hp', NULL, NULL, NULL, NULL, NULL, NULL, 47, 1),
	(510, 'ar', 'default', 'HP Keyboard', NULL, NULL, NULL, NULL, NULL, NULL, 47, 2),
	(511, NULL, NULL, 'hp-keyboard', NULL, NULL, NULL, NULL, NULL, NULL, 47, 3),
	(512, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 47, 4),
	(513, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 47, 5),
	(514, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 47, 6),
	(515, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 47, 7),
	(516, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 47, 8),
	(517, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 47, 26),
	(518, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 47, 27),
	(519, NULL, NULL, 'HP', NULL, NULL, NULL, NULL, NULL, NULL, 47, 32),
	(520, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 47, 16),
	(521, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 47, 17),
	(522, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 47, 18),
	(523, NULL, NULL, NULL, NULL, NULL, 500.0000, NULL, NULL, NULL, 47, 11),
	(524, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, 12),
	(525, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, 13),
	(526, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, 14),
	(527, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, 15),
	(528, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 47, 19),
	(529, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 47, 20),
	(530, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 47, 21),
	(531, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 47, 22),
	(532, 'ar', 'default', '<p>هناك حقيقة مثبتة</p>', NULL, NULL, NULL, NULL, NULL, NULL, 48, 9),
	(533, 'ar', 'default', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها</p>', NULL, NULL, NULL, NULL, NULL, NULL, 48, 10),
	(534, NULL, NULL, 'keyboard-and-laptop-1', NULL, NULL, NULL, NULL, NULL, NULL, 48, 1),
	(535, 'ar', 'default', 'Asus Laptop And HP Keyboard', NULL, NULL, NULL, NULL, NULL, NULL, 48, 2),
	(536, NULL, NULL, 'asus-laptop-and-hp-keyboard', NULL, NULL, NULL, NULL, NULL, NULL, 48, 3),
	(537, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 48, 4),
	(538, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 48, 5),
	(539, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 48, 6),
	(540, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 48, 7),
	(541, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 48, 8),
	(542, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 48, 26),
	(543, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 48, 27),
	(544, NULL, NULL, 'Asus and HP', NULL, NULL, NULL, NULL, NULL, NULL, 48, 32),
	(545, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 48, 16),
	(546, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 48, 17),
	(547, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 48, 18),
	(550, 'ar', 'default', '<p>testtt</p>', NULL, NULL, NULL, NULL, NULL, NULL, 49, 9),
	(551, 'ar', 'default', '<p>testnrmw osama</p>', NULL, NULL, NULL, NULL, NULL, NULL, 49, 10),
	(552, NULL, NULL, 'wash12', NULL, NULL, NULL, NULL, NULL, NULL, 49, 1),
	(553, 'ar', 'default', 'Osama T-shert', NULL, NULL, NULL, NULL, NULL, NULL, 49, 2),
	(554, NULL, NULL, 'osama-t-shert', NULL, NULL, NULL, NULL, NULL, NULL, 49, 3),
	(555, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 49, 4),
	(556, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 49, 5),
	(557, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 49, 6),
	(558, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 49, 7),
	(559, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 49, 8),
	(560, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 49, 26),
	(561, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 49, 27),
	(562, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 49, 33),
	(563, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 49, 16),
	(564, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 49, 17),
	(565, 'ar', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 49, 18),
	(566, NULL, NULL, NULL, NULL, NULL, 400.0000, NULL, NULL, NULL, 49, 11),
	(567, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, 13),
	(568, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, 14),
	(569, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, 15),
	(570, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, 49, 22);
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_bundle_options
CREATE TABLE IF NOT EXISTS `product_bundle_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_bundle_options: ~1 rows (approximately)
/*!40000 ALTER TABLE `product_bundle_options` DISABLE KEYS */;
INSERT INTO `product_bundle_options` (`id`, `type`, `is_required`, `sort_order`, `product_id`) VALUES
	(1, 'radio', 1, 0, 48);
/*!40000 ALTER TABLE `product_bundle_options` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_bundle_option_products
CREATE TABLE IF NOT EXISTS `product_bundle_option_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `product_bundle_option_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`),
  KEY `product_bundle_option_products_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_bundle_option_products: ~2 rows (approximately)
/*!40000 ALTER TABLE `product_bundle_option_products` DISABLE KEYS */;
INSERT INTO `product_bundle_option_products` (`id`, `qty`, `is_user_defined`, `is_default`, `sort_order`, `product_bundle_option_id`, `product_id`) VALUES
	(1, 1, 1, 1, 1, 1, 46),
	(2, 1, 1, 0, 2, 1, 47);
/*!40000 ALTER TABLE `product_bundle_option_products` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_bundle_option_translations
CREATE TABLE IF NOT EXISTS `product_bundle_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `product_bundle_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_bundle_option_translations: ~1 rows (approximately)
/*!40000 ALTER TABLE `product_bundle_option_translations` DISABLE KEYS */;
INSERT INTO `product_bundle_option_translations` (`id`, `locale`, `label`, `product_bundle_option_id`) VALUES
	(1, 'ar', 'كيبورد مع لابتوب', 1);
/*!40000 ALTER TABLE `product_bundle_option_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_categories
CREATE TABLE IF NOT EXISTS `product_categories` (
  `product_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `product_categories_product_id_foreign` (`product_id`),
  KEY `FK_product_categories_categories` (`category_id`),
  CONSTRAINT `FK_product_categories_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_categories: ~4 rows (approximately)
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
	(34, 10),
	(46, 1),
	(48, 1),
	(49, 11);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_cross_sells
CREATE TABLE IF NOT EXISTS `product_cross_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  KEY `product_cross_sells_parent_id_foreign` (`parent_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_cross_sells: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_cross_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cross_sells` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_customer_group_prices
CREATE TABLE IF NOT EXISTS `product_customer_group_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `value_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_customer_group_prices: ~3 rows (approximately)
/*!40000 ALTER TABLE `product_customer_group_prices` DISABLE KEYS */;
INSERT INTO `product_customer_group_prices` (`id`, `qty`, `value_type`, `value`, `product_id`, `customer_group_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 'discount', 20.0000, 46, 3, '2021-04-21 14:09:15', '2021-04-21 14:09:15'),
	(2, 1, 'discount', 10.0000, 46, 2, '2021-04-21 14:09:15', '2021-04-21 14:09:15'),
	(3, 1, 'discount', 5.0000, 46, 1, '2021-04-21 14:09:15', '2021-04-21 14:09:15');
/*!40000 ALTER TABLE `product_customer_group_prices` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_downloadable_links
CREATE TABLE IF NOT EXISTS `product_downloadable_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_downloadable_links: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_downloadable_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_links` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_downloadable_link_translations
CREATE TABLE IF NOT EXISTS `product_downloadable_link_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `product_downloadable_link_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_downloadable_link_translations: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_downloadable_link_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_link_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_downloadable_samples
CREATE TABLE IF NOT EXISTS `product_downloadable_samples` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_downloadable_samples: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_downloadable_samples` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_samples` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_downloadable_sample_translations
CREATE TABLE IF NOT EXISTS `product_downloadable_sample_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `product_downloadable_sample_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_downloadable_sample_translations: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_downloadable_sample_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_flat
CREATE TABLE IF NOT EXISTS `product_flat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `cost` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `color` int DEFAULT NULL,
  `color_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `size_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `width` decimal(12,4) DEFAULT NULL,
  `height` decimal(12,4) DEFAULT NULL,
  `depth` decimal(12,4) DEFAULT NULL,
  `watchsize` int DEFAULT NULL,
  `watchsize_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` int DEFAULT NULL,
  `brand_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shoessize` int DEFAULT NULL,
  `shoessize_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LaptopBrands` text COLLATE utf8mb4_unicode_ci,
  `wash_care` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_flat: ~16 rows (approximately)
/*!40000 ALTER TABLE `product_flat` DISABLE KEYS */;
INSERT INTO `product_flat` (`id`, `sku`, `product_number`, `name`, `description`, `url_key`, `new`, `featured`, `status`, `thumbnail`, `price`, `cost`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `color`, `color_label`, `size`, `size_label`, `created_at`, `locale`, `channel`, `product_id`, `updated_at`, `parent_id`, `visible_individually`, `min_price`, `max_price`, `short_description`, `meta_title`, `meta_keywords`, `meta_description`, `width`, `height`, `depth`, `watchsize`, `watchsize_label`, `brand`, `brand_label`, `shoessize`, `shoessize_label`, `LaptopBrands`, `wash_care`) VALUES
	(67, '1254f', '1', NULL, NULL, 'nike-blazer', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 14:42:55', 'en', 'default', 34, '2021-04-20 14:42:55', NULL, 1, 200.0000, 350.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, 'Nike', NULL, NULL, NULL, NULL),
	(68, '1254f', '1', 'Nike Blazer', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. اسامة</p>', 'nike-blazer', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 14:42:55', 'ar', 'default', 34, '2021-04-20 14:42:55', NULL, 1, 200.0000, 350.0000, '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.</p>', '', '', '', NULL, NULL, NULL, NULL, NULL, 23, 'Nike', NULL, NULL, NULL, NULL),
	(69, '1254f-variant-1-27', NULL, '', NULL, NULL, NULL, NULL, 1, NULL, 200.0000, NULL, NULL, NULL, NULL, 0.0000, 1, 'Red', NULL, NULL, '2021-04-20 14:42:55', 'en', 'default', 35, '2021-04-20 14:42:55', 67, NULL, 200.0000, 200.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, '41', NULL, NULL),
	(70, '1254f-variant-1-27', NULL, '1254f-Red-41', NULL, NULL, NULL, NULL, 1, NULL, 200.0000, NULL, NULL, NULL, NULL, 0.0000, 1, '', NULL, NULL, '2021-04-20 14:42:55', 'ar', 'default', 35, '2021-04-20 14:42:55', 68, NULL, 200.0000, 200.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, '41', NULL, NULL),
	(71, '1254f-variant-4-27', NULL, '', NULL, NULL, NULL, NULL, 1, NULL, 200.0000, NULL, NULL, NULL, NULL, 0.0000, 4, 'Black', NULL, NULL, '2021-04-20 14:42:55', 'en', 'default', 36, '2021-04-20 14:42:55', 67, NULL, 200.0000, 200.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, '41', NULL, NULL),
	(72, '1254f-variant-4-27', NULL, '1254f-Black-41', NULL, NULL, NULL, NULL, 1, NULL, 200.0000, NULL, NULL, NULL, NULL, 0.0000, 4, '', NULL, NULL, '2021-04-20 14:42:55', 'ar', 'default', 36, '2021-04-20 14:42:55', 68, NULL, 200.0000, 200.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, '41', NULL, NULL),
	(83, '1254f-variant-5-28', NULL, '', NULL, NULL, NULL, NULL, 1, NULL, 350.0000, NULL, NULL, NULL, NULL, 0.0000, 5, 'White', NULL, NULL, '2021-04-20 14:42:56', 'en', 'default', 42, '2021-04-20 14:42:56', 67, NULL, 350.0000, 350.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, '42', NULL, NULL),
	(84, '1254f-variant-5-28', NULL, '1254f-White-42', NULL, NULL, NULL, NULL, 1, NULL, 350.0000, NULL, NULL, NULL, NULL, 0.0000, 5, '', NULL, NULL, '2021-04-20 14:42:56', 'ar', 'default', 42, '2021-04-20 14:42:56', 68, NULL, 350.0000, 350.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, '42', NULL, NULL),
	(91, 'asus-1', '', NULL, NULL, 'asus-zenbook-2021', 1, 1, 1, NULL, 5000.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, '2021-04-21 14:01:55', 'en', 'default', 46, '2021-04-21 14:01:55', NULL, 1, 4750.0000, 4750.0000, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 'Asus', NULL),
	(92, 'asus-1', '', 'Asus Zenbook-2021', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام "ه</p>', 'asus-zenbook-2021', 1, 1, 1, NULL, 5000.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, '2021-04-21 14:01:55', 'ar', 'default', 46, '2021-04-21 14:01:55', NULL, 1, 4750.0000, 4750.0000, '<p>هناك حقيقة مثبتة</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 'Asus', NULL),
	(93, 'keyboard-hp', '', NULL, NULL, 'hp-keyboard', 1, 1, 1, NULL, 500.0000, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, NULL, '2021-04-21 14:12:38', 'en', 'default', 47, '2021-04-21 14:15:56', NULL, 1, 500.0000, 500.0000, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 'HP', NULL),
	(94, 'keyboard-hp', '', 'HP Keyboard', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها</p>', 'hp-keyboard', 1, 1, 1, NULL, 500.0000, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, NULL, '2021-04-21 14:12:38', 'ar', 'default', 47, '2021-04-21 14:15:56', NULL, 1, 500.0000, 500.0000, '<p>هناك حقيقة مثبتة&nbsp;</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 'HP', NULL),
	(95, 'keyboard-and-laptop-1', '', NULL, NULL, 'asus-laptop-and-hp-keyboard', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 14:16:51', 'en', 'default', 48, '2021-04-21 14:16:51', NULL, 1, 500.0000, 4750.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Asus and HP', NULL),
	(96, 'keyboard-and-laptop-1', '', 'Asus Laptop And HP Keyboard', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها</p>', 'asus-laptop-and-hp-keyboard', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 14:16:51', 'ar', 'default', 48, '2021-04-21 14:16:51', NULL, 1, 500.0000, 4750.0000, '<p>هناك حقيقة مثبتة</p>', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Asus and HP', NULL),
	(97, 'wash12', '', NULL, NULL, 'osama-t-shert', 1, 1, 1, NULL, 400.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, '2021-04-21 16:42:31', 'en', 'default', 49, '2021-04-21 16:42:31', NULL, 1, 400.0000, 400.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
	(98, 'wash12', '', 'Osama T-shert', '<p>testnrmw osama</p>', 'osama-t-shert', 1, 1, 1, NULL, 400.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, '2021-04-21 16:42:31', 'ar', 'default', 49, '2021-04-21 16:42:31', NULL, 1, 400.0000, 400.0000, '<p>testtt</p>', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
/*!40000 ALTER TABLE `product_flat` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_grouped_products
CREATE TABLE IF NOT EXISTS `product_grouped_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `associated_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_grouped_products_product_id_foreign` (`product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_grouped_products: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_grouped_products` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_images
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_images: ~7 rows (approximately)
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`) VALUES
	(17, NULL, 'product/34/ZQY3prJJswkILRRRjWwFYB6tG58FPTrDDlYlCobt.jpg', 34),
	(18, NULL, 'product/34/mPJNJfN9lIT2PcUyrZYK9SL6Bi0Rtpm5CVailgTa.jpg', 34),
	(20, NULL, 'product/46/heEaFHheivklK8bjfTAewLnbF28HukjBlK3kk78s.jpg', 46),
	(21, NULL, 'product/47/UvsYKkCVav7x0aCMiBLxtLnNJR3067mEULrwf6hH.png', 47),
	(22, NULL, 'product/48/o2gDMcjfUCeE9X33JuOvkHibJtS6ENP8oexWqswc.jpg', 48),
	(23, NULL, 'product/48/QKjJuNRpSRAHRXarElYVWOypIaOCV715lWfgEdRe.png', 48),
	(24, NULL, 'product/49/NyhLkFmG8rM94WIt7RWABeuoNRuI9XdRlHKVivb7.png', 49);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_inventories
CREATE TABLE IF NOT EXISTS `product_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `inventory_source_id` int unsigned NOT NULL,
  `vendor_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_inventories: ~6 rows (approximately)
/*!40000 ALTER TABLE `product_inventories` DISABLE KEYS */;
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `inventory_source_id`, `vendor_id`) VALUES
	(18, 5, 35, 1, 0),
	(19, 4, 36, 1, 0),
	(20, 6, 42, 1, 0),
	(21, 50, 46, 1, 0),
	(22, 0, 47, 1, 0),
	(23, 10, 49, 1, 0);
/*!40000 ALTER TABLE `product_inventories` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_ordered_inventories
CREATE TABLE IF NOT EXISTS `product_ordered_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_ordered_inventories: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_ordered_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_ordered_inventories` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_relations
CREATE TABLE IF NOT EXISTS `product_relations` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  KEY `product_relations_parent_id_foreign` (`parent_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_relations: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_relations` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_reviews
CREATE TABLE IF NOT EXISTS `product_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  KEY `product_reviews_customer_id_foreign` (`customer_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_reviews: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_super_attributes
CREATE TABLE IF NOT EXISTS `product_super_attributes` (
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  KEY `product_super_attributes_product_id_foreign` (`product_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_super_attributes: ~2 rows (approximately)
/*!40000 ALTER TABLE `product_super_attributes` DISABLE KEYS */;
INSERT INTO `product_super_attributes` (`product_id`, `attribute_id`) VALUES
	(34, 23),
	(34, 31);
/*!40000 ALTER TABLE `product_super_attributes` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_up_sells
CREATE TABLE IF NOT EXISTS `product_up_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  KEY `product_up_sells_parent_id_foreign` (`parent_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_up_sells: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_up_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_up_sells` ENABLE KEYS */;

-- Dumping structure for table bagisto.product_videos
CREATE TABLE IF NOT EXISTS `product_videos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_videos_product_id_foreign` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.product_videos: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_videos` ENABLE KEYS */;

-- Dumping structure for table bagisto.push_notifications
CREATE TABLE IF NOT EXISTS `push_notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `targeturl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageurl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.push_notifications: ~0 rows (approximately)
/*!40000 ALTER TABLE `push_notifications` DISABLE KEYS */;
INSERT INTO `push_notifications` (`id`, `title`, `description`, `targeturl`, `imageurl`, `created_at`, `updated_at`) VALUES
	(1, 'test', 'this is a test ', 'http://217.66.226.204/bagisto/public/skirt-1', 'notification/1/0ZCldTaANIG4bBrcqTRdRsTwv4XDrlaxO2SpoO2V.jpg', '2021-04-14 13:22:31', '2021-04-14 13:22:31');
/*!40000 ALTER TABLE `push_notifications` ENABLE KEYS */;

-- Dumping structure for table bagisto.pwa_layout
CREATE TABLE IF NOT EXISTS `pwa_layout` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `home_page_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.pwa_layout: ~0 rows (approximately)
/*!40000 ALTER TABLE `pwa_layout` DISABLE KEYS */;
INSERT INTO `pwa_layout` (`id`, `home_page_content`, `created_at`, `updated_at`) VALUES
	(1, 'test', '2021-04-14 13:23:25', '2021-04-14 13:23:25');
/*!40000 ALTER TABLE `pwa_layout` ENABLE KEYS */;

-- Dumping structure for table bagisto.refunds
CREATE TABLE IF NOT EXISTS `refunds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.refunds: ~0 rows (approximately)
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;

-- Dumping structure for table bagisto.refund_items
CREATE TABLE IF NOT EXISTS `refund_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `refund_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.refund_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `refund_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_items` ENABLE KEYS */;

-- Dumping structure for table bagisto.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', 'Administrator role', 'all', NULL, NULL, NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table bagisto.shipments
CREATE TABLE IF NOT EXISTS `shipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_weight` int DEFAULT NULL,
  `carrier_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `order_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `inventory_source_id` int unsigned DEFAULT NULL,
  `inventory_source_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  KEY `shipments_order_address_id_foreign` (`order_address_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.shipments: ~0 rows (approximately)
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;

-- Dumping structure for table bagisto.shipment_items
CREATE TABLE IF NOT EXISTS `shipment_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `shipment_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.shipment_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `shipment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment_items` ENABLE KEYS */;

-- Dumping structure for table bagisto.sliders
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slider_path` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sliders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `sliders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.sliders: ~2 rows (approximately)
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` (`id`, `title`, `path`, `content`, `channel_id`, `created_at`, `updated_at`, `slider_path`, `locale`) VALUES
	(2, '1', 'slider_images/Default/E2zIfK0zbQc9L9r426NeScnH0wkw9vTOzcq0hwWl.jpg', '', 1, '2021-04-21 16:34:17', '2021-04-26 09:14:47', '', 'ar'),
	(3, 'test', 'slider_images/Default/yFfCwwAmCWBiXdDwX3z8zjoW7yWUcLWTrvtOceRp.jpg', '', 1, '2021-04-26 09:23:06', '2021-04-26 09:23:06', '', 'ar');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;

-- Dumping structure for table bagisto.subscribers_list
CREATE TABLE IF NOT EXISTS `subscribers_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.subscribers_list: ~1 rows (approximately)
/*!40000 ALTER TABLE `subscribers_list` DISABLE KEYS */;
INSERT INTO `subscribers_list` (`id`, `email`, `is_subscribed`, `token`, `channel_id`, `created_at`, `updated_at`, `customer_id`) VALUES
	(1, 'mohammadbarhoush@gmail.com', 1, '607ea7a5a99fd', 1, '2021-04-20 15:36:29', '2021-04-20 15:36:29', 1);
/*!40000 ALTER TABLE `subscribers_list` ENABLE KEYS */;

-- Dumping structure for table bagisto.tax_categories
CREATE TABLE IF NOT EXISTS `tax_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.tax_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `tax_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories` ENABLE KEYS */;

-- Dumping structure for table bagisto.tax_categories_tax_rates
CREATE TABLE IF NOT EXISTS `tax_categories_tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int unsigned NOT NULL,
  `tax_rate_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.tax_categories_tax_rates: ~0 rows (approximately)
/*!40000 ALTER TABLE `tax_categories_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories_tax_rates` ENABLE KEYS */;

-- Dumping structure for table bagisto.tax_rates
CREATE TABLE IF NOT EXISTS `tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.tax_rates: ~0 rows (approximately)
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;

-- Dumping structure for table bagisto.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table bagisto.velocity_contents
CREATE TABLE IF NOT EXISTS `velocity_contents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.velocity_contents: ~0 rows (approximately)
/*!40000 ALTER TABLE `velocity_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_contents` ENABLE KEYS */;

-- Dumping structure for table bagisto.velocity_contents_translations
CREATE TABLE IF NOT EXISTS `velocity_contents_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int unsigned DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_heading` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_target` tinyint(1) NOT NULL DEFAULT '0',
  `catalog_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_contents_translations_content_id_foreign` (`content_id`),
  CONSTRAINT `velocity_contents_translations_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `velocity_contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.velocity_contents_translations: ~0 rows (approximately)
/*!40000 ALTER TABLE `velocity_contents_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_contents_translations` ENABLE KEYS */;

-- Dumping structure for table bagisto.velocity_customer_compare_products
CREATE TABLE IF NOT EXISTS `velocity_customer_compare_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_flat_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_customer_compare_products_product_flat_id_foreign` (`product_flat_id`),
  KEY `velocity_customer_compare_products_customer_id_foreign` (`customer_id`),
  CONSTRAINT `velocity_customer_compare_products_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `velocity_customer_compare_products_product_flat_id_foreign` FOREIGN KEY (`product_flat_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.velocity_customer_compare_products: ~0 rows (approximately)
/*!40000 ALTER TABLE `velocity_customer_compare_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_customer_compare_products` ENABLE KEYS */;

-- Dumping structure for table bagisto.velocity_meta_data
CREATE TABLE IF NOT EXISTS `velocity_meta_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `home_page_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_left_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_middle_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT '0',
  `advertisement` json DEFAULT NULL,
  `sidebar_category_count` int NOT NULL DEFAULT '9',
  `featured_product_count` int NOT NULL DEFAULT '10',
  `new_products_count` int NOT NULL DEFAULT '10',
  `subscription_bar_content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_view_images` json DEFAULT NULL,
  `product_policy` text COLLATE utf8mb4_unicode_ci,
  `locale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_content_count` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.velocity_meta_data: ~1 rows (approximately)
/*!40000 ALTER TABLE `velocity_meta_data` DISABLE KEYS */;
INSERT INTO `velocity_meta_data` (`id`, `home_page_content`, `footer_left_content`, `footer_middle_content`, `slider`, `advertisement`, `sidebar_category_count`, `featured_product_count`, `new_products_count`, `subscription_bar_content`, `created_at`, `updated_at`, `product_view_images`, `product_policy`, `locale`, `channel`, `header_content_count`) VALUES
	(1, '<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>', '<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>', '<div class="col-lg-6 col-md-12 col-sm-12 no-padding"><ul type="none"><li><a href="{!! url(\'page/about-us\') !!}">About Us</a></li><li><a href="{!! url(\'page/cutomer-service\') !!}">Customer Service</a></li><li><a href="{!! url(\'page/whats-new\') !!}">What&rsquo;s New</a></li><li><a href="{!! url(\'page/contact-us\') !!}">Contact Us </a></li></ul></div><div class="col-lg-6 col-md-12 col-sm-12 no-padding"><ul type="none"><li><a href="{!! url(\'page/return-policy\') !!}"> Order and Returns </a></li><li><a href="{!! url(\'page/payment-policy\') !!}"> Payment Policy </a></li><li><a href="{!! url(\'page/shipping-policy\') !!}"> Shipping Policy</a></li><li><a href="{!! url(\'page/privacy-policy\') !!}"> Privacy and Cookies Policy </a></li></ul></div>', 1, NULL, 9, 10, 10, '<div class="social-icons col-lg-6"><a href="https://webkul.com" target="_blank" class="unset" rel="noopener noreferrer"><i class="fs24 within-circle rango-facebook" title="facebook"></i> </a> <a href="https://webkul.com" target="_blank" class="unset" rel="noopener noreferrer"><i class="fs24 within-circle rango-twitter" title="twitter"></i> </a> <a href="https://webkul.com" target="_blank" class="unset" rel="noopener noreferrer"><i class="fs24 within-circle rango-linked-in" title="linkedin"></i> </a> <a href="https://webkul.com" target="_blank" class="unset" rel="noopener noreferrer"><i class="fs24 within-circle rango-pintrest" title="Pinterest"></i> </a> <a href="https://webkul.com" target="_blank" class="unset" rel="noopener noreferrer"><i class="fs24 within-circle rango-youtube" title="Youtube"></i> </a> <a href="https://webkul.com" target="_blank" class="unset" rel="noopener noreferrer"><i class="fs24 within-circle rango-instagram" title="instagram"></i></a></div>', NULL, NULL, NULL, '<div class="row col-12 remove-padding-margin"><div class="col-lg-4 col-sm-12 product-policy-wrapper"><div class="card"><div class="policy"><div class="left"><i class="rango-van-ship fs40"></i></div> <div class="right"><span class="font-setting fs20">Free Shipping on Order $20 or More</span></div></div></div></div> <div class="col-lg-4 col-sm-12 product-policy-wrapper"><div class="card"><div class="policy"><div class="left"><i class="rango-exchnage fs40"></i></div> <div class="right"><span class="font-setting fs20">Product Replace &amp; Return Available </span></div></div></div></div> <div class="col-lg-4 col-sm-12 product-policy-wrapper"><div class="card"><div class="policy"><div class="left"><i class="rango-exchnage fs40"></i></div> <div class="right"><span class="font-setting fs20">Product Exchange and EMI Available </span></div></div></div></div></div>', 'en', 'default', '5'),
	(2, '<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>', '<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>', '<div class="col-lg-6 col-md-12 col-sm-12 no-padding"><ul type="none"><li><a href="{!! url(\'page/about-us\') !!}">About Us</a></li><li><a href="{!! url(\'page/cutomer-service\') !!}">Customer Service</a></li><li><a href="{!! url(\'page/whats-new\') !!}">What&rsquo;s New</a></li><li><a href="{!! url(\'page/contact-us\') !!}">Contact Us </a></li></ul></div><div class="col-lg-6 col-md-12 col-sm-12 no-padding"><ul type="none"><li><a href="{!! url(\'page/return-policy\') !!}"> Order and Returns </a></li><li><a href="{!! url(\'page/payment-policy\') !!}"> Payment Policy </a></li><li><a href="{!! url(\'page/shipping-policy\') !!}"> Shipping Policy</a></li><li><a href="{!! url(\'page/privacy-policy\') !!}"> Privacy and Cookies Policy </a></li></ul></div>', 1, NULL, 9, 10, 10, '<div class="social-icons col-lg-6"><a href="https://webkul.com" target="_blank" class="unset" rel="noopener noreferrer"><i class="fs24 within-circle rango-facebook" title="facebook"></i> </a> <a href="https://webkul.com" target="_blank" class="unset" rel="noopener noreferrer"><i class="fs24 within-circle rango-twitter" title="twitter"></i> </a> <a href="https://webkul.com" target="_blank" class="unset" rel="noopener noreferrer"><i class="fs24 within-circle rango-linked-in" title="linkedin"></i> </a> <a href="https://webkul.com" target="_blank" class="unset" rel="noopener noreferrer"><i class="fs24 within-circle rango-pintrest" title="Pinterest"></i> </a> <a href="https://webkul.com" target="_blank" class="unset" rel="noopener noreferrer"><i class="fs24 within-circle rango-youtube" title="Youtube"></i> </a> <a href="https://webkul.com" target="_blank" class="unset" rel="noopener noreferrer"><i class="fs24 within-circle rango-instagram" title="instagram"></i></a></div>', NULL, NULL, NULL, '<div class="row col-12 remove-padding-margin"><div class="col-lg-4 col-sm-12 product-policy-wrapper"><div class="card"><div class="policy"><div class="left"><i class="rango-van-ship fs40"></i></div> <div class="right"><span class="font-setting fs20">Free Shipping on Order $20 or More</span></div></div></div></div> <div class="col-lg-4 col-sm-12 product-policy-wrapper"><div class="card"><div class="policy"><div class="left"><i class="rango-exchnage fs40"></i></div> <div class="right"><span class="font-setting fs20">Product Replace &amp; Return Available </span></div></div></div></div> <div class="col-lg-4 col-sm-12 product-policy-wrapper"><div class="card"><div class="policy"><div class="left"><i class="rango-exchnage fs40"></i></div> <div class="right"><span class="font-setting fs20">Product Exchange and EMI Available </span></div></div></div></div></div>', 'ar', 'default', '5');
/*!40000 ALTER TABLE `velocity_meta_data` ENABLE KEYS */;

-- Dumping structure for table bagisto.wishlist
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `additional` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bagisto.wishlist: ~0 rows (approximately)
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;

-- Dumping structure for trigger bagisto.trig_categories_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trig_categories_insert` AFTER INSERT ON `categories3` FOR EACH ROW BEGIN
                            DECLARE urlPath VARCHAR(255);
            DECLARE localeCode VARCHAR(255);
            DECLARE done INT;
            DECLARE curs CURSOR FOR (SELECT category_translations.locale
                    FROM category_translations
                    WHERE category_id = NEW.id);
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


            IF EXISTS (
                SELECT *
                FROM category_translations
                WHERE category_id = NEW.id
            )
            THEN

                OPEN curs;

            	SET done = 0;
                REPEAT
                	FETCH curs INTO localeCode;

                    SELECT get_url_path_of_category(NEW.id, localeCode) INTO urlPath;

                    IF NEW.parent_id IS NULL
                    THEN
                        SET urlPath = '';
                    END IF;

                    UPDATE category_translations
                    SET url_path = urlPath
                    WHERE
                        category_translations.category_id = NEW.id
                        AND category_translations.locale = localeCode;

                UNTIL done END REPEAT;

                CLOSE curs;

            END IF;
            END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger bagisto.trig_categories_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trig_categories_update` AFTER UPDATE ON `categories3` FOR EACH ROW BEGIN
                            DECLARE urlPath VARCHAR(255);
            DECLARE localeCode VARCHAR(255);
            DECLARE done INT;
            DECLARE curs CURSOR FOR (SELECT category_translations.locale
                    FROM category_translations
                    WHERE category_id = NEW.id);
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


            IF EXISTS (
                SELECT *
                FROM category_translations
                WHERE category_id = NEW.id
            )
            THEN

                OPEN curs;

            	SET done = 0;
                REPEAT
                	FETCH curs INTO localeCode;

                    SELECT get_url_path_of_category(NEW.id, localeCode) INTO urlPath;

                    IF NEW.parent_id IS NULL
                    THEN
                        SET urlPath = '';
                    END IF;

                    UPDATE category_translations
                    SET url_path = urlPath
                    WHERE
                        category_translations.category_id = NEW.id
                        AND category_translations.locale = localeCode;

                UNTIL done END REPEAT;

                CLOSE curs;

            END IF;
            END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger bagisto.trig_category_translations_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trig_category_translations_insert` BEFORE INSERT ON `category_translations` FOR EACH ROW BEGIN
                            DECLARE parentUrlPath varchar(255);
            DECLARE urlPath varchar(255);

            IF NOT EXISTS (
                SELECT id
                FROM categories
                WHERE
                    id = NEW.category_id
                    AND parent_id IS NULL
            )
            THEN

                SELECT
                    GROUP_CONCAT(parent_translations.slug SEPARATOR '/') INTO parentUrlPath
                FROM
                    categories AS node,
                    categories AS parent
                    JOIN category_translations AS parent_translations ON parent.id = parent_translations.category_id
                WHERE
                    node._lft >= parent._lft
                    AND node._rgt <= parent._rgt
                    AND node.id = (SELECT parent_id FROM categories WHERE id = NEW.category_id)
                    AND node.parent_id IS NOT NULL
                    AND parent.parent_id IS NOT NULL
                    AND parent_translations.locale = NEW.locale
                GROUP BY
                    node.id;

                IF parentUrlPath IS NULL
                THEN
                    SET urlPath = NEW.slug;
                ELSE
                    SET urlPath = concat(parentUrlPath, '/', NEW.slug);
                END IF;

                SET NEW.url_path = urlPath;

            END IF;
            END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger bagisto.trig_category_translations_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trig_category_translations_update` BEFORE UPDATE ON `category_translations` FOR EACH ROW BEGIN
                            DECLARE parentUrlPath varchar(255);
            DECLARE urlPath varchar(255);

            IF NOT EXISTS (
                SELECT id
                FROM categories
                WHERE
                    id = NEW.category_id
                    AND parent_id IS NULL
            )
            THEN

                SELECT
                    GROUP_CONCAT(parent_translations.slug SEPARATOR '/') INTO parentUrlPath
                FROM
                    categories AS node,
                    categories AS parent
                    JOIN category_translations AS parent_translations ON parent.id = parent_translations.category_id
                WHERE
                    node._lft >= parent._lft
                    AND node._rgt <= parent._rgt
                    AND node.id = (SELECT parent_id FROM categories WHERE id = NEW.category_id)
                    AND node.parent_id IS NOT NULL
                    AND parent.parent_id IS NOT NULL
                    AND parent_translations.locale = NEW.locale
                GROUP BY
                    node.id;

                IF parentUrlPath IS NULL
                THEN
                    SET urlPath = NEW.slug;
                ELSE
                    SET urlPath = concat(parentUrlPath, '/', NEW.slug);
                END IF;

                SET NEW.url_path = urlPath;

            END IF;
            END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
