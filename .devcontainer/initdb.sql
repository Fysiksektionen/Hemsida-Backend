-- Adminer 4.8.0 MySQL 5.5.5-10.5.9-MariaDB-log dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `hemsidan_db`;

CREATE TABLE `website_basepage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `page_type` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `first_published_at` date DEFAULT NULL,
  `publish_time` datetime(6) DEFAULT NULL,
  `unpublish_time` datetime(6) DEFAULT NULL,
  `last_edited_at` datetime(6) NOT NULL,
  `content_en_id` int(11) DEFAULT NULL,
  `content_sv_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `content_en_id` (`content_en_id`),
  UNIQUE KEY `content_sv_id` (`content_sv_id`),
  CONSTRAINT `website_basepage_content_en_id_866b2b82_fk_website_c` FOREIGN KEY (`content_en_id`) REFERENCES `website_contentobjectbase` (`id`),
  CONSTRAINT `website_basepage_content_sv_id_4797736f_fk_website_c` FOREIGN KEY (`content_sv_id`) REFERENCES `website_contentobjectbase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_basepage`;
INSERT INTO `website_basepage` (`id`, `url`, `page_type`, `published`, `first_published_at`, `publish_time`, `unpublish_time`, `last_edited_at`, `content_en_id`, `content_sv_id`) VALUES
(1,	'https://f.kth.se',	'frontpage',	1,	NULL,	NULL,	NULL,	'2021-07-16 20:49:22.342700',	16,	1),
(2,	'https://f.kth.se/styret',	'styret',	1,	NULL,	NULL,	NULL,	'2021-07-16 20:49:31.032677',	32,	31),
(3,	'https://f.kth.se/nyheter',	'news_feed',	1,	NULL,	NULL,	NULL,	'2021-07-16 20:49:35.800987',	34,	33),
(4,	'https://f.kth.se/fcom',	'namnd',	1,	NULL,	NULL,	NULL,	'2021-07-16 20:49:40.267227',	43,	35),
(5,	'https://f.kth.se/representatives',	'representatives',	1,	NULL,	NULL,	NULL,	'2021-07-16 20:49:45.797895',	99,	48),
(6,	'https://f.kth.se/news/1',	'news',	0,	NULL,	NULL,	NULL,	'2021-07-16 20:51:20.690205',	NULL,	NULL),
(7,	'https://f.kth.se/news/2',	'news',	0,	NULL,	NULL,	NULL,	'2021-07-16 20:51:28.662620',	NULL,	NULL),
(8,	'https://f.kth.se/news/3',	'news',	0,	NULL,	NULL,	NULL,	'2021-07-16 20:51:34.221778',	NULL,	NULL),
(9,	'https://f.kth.se/news/4',	'news',	0,	NULL,	NULL,	NULL,	'2021-07-16 20:51:38.419288',	NULL,	NULL);

CREATE TABLE `website_contentcollection` (
  `contentobjectbase_ptr_id` int(11) NOT NULL,
  `is_ordered` tinyint(1) NOT NULL,
  PRIMARY KEY (`contentobjectbase_ptr_id`),
  CONSTRAINT `website_contentcolle_contentobjectbase_pt_da58866a_fk_website_c` FOREIGN KEY (`contentobjectbase_ptr_id`) REFERENCES `website_contentobjectbase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_contentcollection`;
INSERT INTO `website_contentcollection` (`contentobjectbase_ptr_id`, `is_ordered`) VALUES
(1,	0),
(2,	1),
(3,	0),
(7,	0),
(11,	0),
(16,	0),
(17,	1),
(18,	0),
(22,	0),
(26,	0),
(31,	0),
(32,	0),
(33,	0),
(34,	0),
(35,	0),
(36,	1),
(43,	0),
(44,	1),
(48,	0),
(51,	1),
(52,	0),
(55,	1),
(56,	0),
(57,	1),
(58,	0),
(63,	0),
(68,	0),
(70,	1),
(71,	0),
(73,	1),
(74,	0),
(79,	0),
(85,	0),
(87,	1),
(88,	0),
(93,	0),
(99,	0),
(102,	1),
(103,	0),
(106,	1),
(107,	0),
(108,	1),
(109,	0),
(114,	0),
(119,	0),
(121,	1),
(122,	0),
(124,	1),
(125,	0),
(130,	0),
(136,	0),
(138,	1),
(139,	0),
(144,	0),
(150,	0),
(153,	0),
(157,	0),
(160,	0);

CREATE TABLE `website_contentcollectionlist` (
  `contentcollection_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`contentcollection_ptr_id`),
  CONSTRAINT `website_contentcolle_contentcollection_pt_1d99cad3_fk_website_c` FOREIGN KEY (`contentcollection_ptr_id`) REFERENCES `website_contentcollection` (`contentobjectbase_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_contentcollectionlist`;
INSERT INTO `website_contentcollectionlist` (`contentcollection_ptr_id`) VALUES
(2),
(17),
(36),
(44),
(51),
(55),
(57),
(70),
(73),
(87),
(102),
(106),
(108),
(121),
(124),
(138);

CREATE TABLE `website_contentimage` (
  `contentobjectbase_ptr_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentobjectbase_ptr_id`),
  KEY `website_contentimage_image_id_f72c32e8_fk_website_image_id` (`image_id`),
  CONSTRAINT `website_contentimage_contentobjectbase_pt_97e8c9d3_fk_website_c` FOREIGN KEY (`contentobjectbase_ptr_id`) REFERENCES `website_contentobjectbase` (`id`),
  CONSTRAINT `website_contentimage_image_id_f72c32e8_fk_website_image_id` FOREIGN KEY (`image_id`) REFERENCES `website_image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_contentimage`;
INSERT INTO `website_contentimage` (`contentobjectbase_ptr_id`, `image_id`) VALUES
(15,	1),
(30,	1),
(37,	2),
(45,	2),
(152,	3),
(159,	3);

CREATE TABLE `website_contentmenu` (
  `contentobjectbase_ptr_id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentobjectbase_ptr_id`),
  KEY `website_contentmenu_menu_id_effd319c_fk_website_menuitembase_id` (`menu_id`),
  CONSTRAINT `website_contentmenu_contentobjectbase_pt_9aac09f6_fk_website_c` FOREIGN KEY (`contentobjectbase_ptr_id`) REFERENCES `website_contentobjectbase` (`id`),
  CONSTRAINT `website_contentmenu_menu_id_effd319c_fk_website_menuitembase_id` FOREIGN KEY (`menu_id`) REFERENCES `website_menuitembase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_contentmenu`;

CREATE TABLE `website_contentobjectbase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `db_type` varchar(5) NOT NULL,
  `attributes` longtext NOT NULL,
  `order` smallint(5) unsigned NOT NULL CHECK (`order` >= 0),
  `containing_page_id` int(11) NOT NULL,
  `collection_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_contentobjec_collection_id_21d33ecb_fk_website_c` (`collection_id`),
  KEY `website_contentobjec_containing_page_id_db42bfaf_fk_website_b` (`containing_page_id`),
  KEY `website_contentobjectbase_order_3652ff73` (`order`),
  CONSTRAINT `website_contentobjec_collection_id_21d33ecb_fk_website_c` FOREIGN KEY (`collection_id`) REFERENCES `website_contentcollection` (`contentobjectbase_ptr_id`),
  CONSTRAINT `website_contentobjec_containing_page_id_db42bfaf_fk_website_b` FOREIGN KEY (`containing_page_id`) REFERENCES `website_basepage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_contentobjectbase`;
INSERT INTO `website_contentobjectbase` (`id`, `name`, `db_type`, `attributes`, `order`, `containing_page_id`, `collection_id`) VALUES
(1,	'',	'dict',	'{}',	0,	2,	NULL),
(2,	'orange_boxes',	'list',	'{}',	0,	2,	1),
(3,	'',	'dict',	'{\"color\": \"#ff642b\"}',	0,	2,	2),
(4,	'button',	'text',	'{\"link\": \"https://f.kth.se/engagera-dig/\"}',	0,	2,	3),
(5,	'text',	'text',	'{\"block_type\": \"bodyText\", \"rich_text_editor_type\": \"only-marks\"}',	0,	2,	3),
(6,	'title',	'text',	'{\"block_type\": \"heading\", \"rich_text_editor_type\": \"none\"}',	0,	2,	3),
(7,	'',	'dict',	'{\"color\": \"#dc3545\"}',	1,	2,	2),
(8,	'button',	'text',	'{\"link\": \"https://f.kth.se/fysiksektionen/\"}',	0,	2,	7),
(9,	'text',	'text',	'{\"block_type\": \"bodyText\", \"rich_text_editor_type\": \"only-marks\"}',	0,	2,	7),
(10,	'title',	'text',	'{\"block_type\": \"heading\", \"rich_text_editor_type\": \"none\"}',	0,	2,	7),
(11,	'',	'dict',	'{\"color\": \"#ff642b\"}',	2,	2,	2),
(12,	'button',	'text',	'{\"link\": \"https://f.kth.se/event/\"}',	0,	2,	11),
(13,	'text',	'text',	'{\"block_type\": \"bodyText\", \"rich_text_editor_type\": \"only-marks\"}',	0,	2,	11),
(14,	'title',	'text',	'{\"block_type\": \"heading\", \"rich_text_editor_type\": \"none\"}',	0,	2,	11),
(15,	'sponsor_logo',	'image',	'{}',	0,	2,	1),
(16,	'',	'dict',	'{}',	0,	2,	NULL),
(17,	'orange_boxes',	'list',	'{}',	0,	2,	16),
(18,	'',	'dict',	'{\"color\": \"#ff642b\"}',	0,	2,	17),
(19,	'button',	'text',	'{\"link\": \"https://f.kth.se/engagera-dig/\"}',	0,	2,	18),
(20,	'text',	'text',	'{\"block_type\": \"bodyText\", \"rich_text_editor_type\": \"only-marks\"}',	0,	2,	18),
(21,	'title',	'text',	'{\"block_type\": \"heading\", \"rich_text_editor_type\": \"none\"}',	0,	2,	18),
(22,	'',	'dict',	'{\"color\": \"#dc3545\"}',	1,	2,	17),
(23,	'button',	'text',	'{\"link\": \"https://f.kth.se/fysiksektionen/\"}',	0,	2,	22),
(24,	'text',	'text',	'{\"block_type\": \"bodyText\", \"rich_text_editor_type\": \"only-marks\"}',	0,	2,	22),
(25,	'title',	'text',	'{\"block_type\": \"heading\", \"rich_text_editor_type\": \"none\"}',	0,	2,	22),
(26,	'',	'dict',	'{\"color\": \"#ff642b\"}',	2,	2,	17),
(27,	'button',	'text',	'{\"link\": \"https://f.kth.se/event/\"}',	0,	2,	26),
(28,	'text',	'text',	'{\"block_type\": \"bodyText\", \"rich_text_editor_type\": \"only-marks\"}',	0,	2,	26),
(29,	'title',	'text',	'{\"block_type\": \"heading\", \"rich_text_editor_type\": \"none\"}',	0,	2,	26),
(30,	'sponsor_logo',	'image',	'{}',	0,	2,	16),
(31,	'',	'dict',	'{}',	0,	3,	NULL),
(32,	'',	'dict',	'{}',	0,	3,	NULL),
(33,	'',	'dict',	'{}',	0,	4,	NULL),
(34,	'',	'dict',	'{}',	0,	4,	NULL),
(35,	'',	'dict',	'{}',	0,	5,	NULL),
(36,	'content',	'list',	'{}',	0,	5,	35),
(37,	'',	'image',	'{\"alignment\": \"center\", \"block_type\": \"image\", \"width\": \"100%\"}',	0,	5,	36),
(38,	'',	'text',	'{\"block_type\": \"heading\", \"rich_text_editor_type\": \"only-headings\"}',	1,	5,	36),
(39,	'',	'text',	'{\"block_type\": \"bodyText\", \"rich_text_editor_type\": \"body-text\"}',	2,	5,	36),
(40,	'',	'text',	'{\"block_type\": \"heading\", \"rich_text_editor_type\": \"only-headings\"}',	3,	5,	36),
(41,	'',	'text',	'{\"block_type\": \"bodyText\", \"rich_text_editor_type\": \"body-text\"}',	4,	5,	36),
(42,	'title',	'text',	'{\"block_type\": \"heading\", \"rich_text_editor_type\": \"none\"}',	0,	5,	35),
(43,	'',	'dict',	'{}',	0,	5,	NULL),
(44,	'content',	'list',	'{}',	0,	5,	43),
(45,	'',	'image',	'{\"alignment\": \"center\", \"block_type\": \"image\", \"width\": \"100%\"}',	0,	5,	44),
(46,	'',	'text',	'{\"block_type\": \"heading\", \"rich_text_editor_type\": \"only-headings\"}',	1,	5,	44),
(47,	'title',	'text',	'{\"block_type\": \"heading\", \"rich_text_editor_type\": \"none\"}',	0,	5,	43),
(48,	'',	'dict',	'{}',	0,	6,	NULL),
(49,	'header',	'text',	'{}',	0,	6,	48),
(50,	'intro_text',	'text',	'{}',	0,	6,	48),
(51,	'sections',	'list',	'{}',	0,	6,	48),
(52,	'',	'dict',	'{}',	0,	6,	51),
(53,	'email',	'text',	'{}',	0,	6,	52),
(54,	'name',	'text',	'{}',	0,	6,	52),
(55,	'subsections',	'list',	'{}',	0,	6,	52),
(56,	'',	'dict',	'{}',	0,	6,	55),
(57,	'members',	'list',	'{}',	0,	6,	56),
(58,	'',	'dict',	'{}',	0,	6,	57),
(59,	'email',	'text',	'{}',	0,	6,	58),
(60,	'name',	'text',	'{}',	0,	6,	58),
(61,	'role',	'text',	'{}',	0,	6,	58),
(62,	'year_code',	'text',	'{}',	0,	6,	58),
(63,	'',	'dict',	'{}',	1,	6,	57),
(64,	'email',	'text',	'{}',	0,	6,	63),
(65,	'name',	'text',	'{}',	0,	6,	63),
(66,	'role',	'text',	'{}',	0,	6,	63),
(67,	'year_code',	'text',	'{}',	0,	6,	63),
(68,	'',	'dict',	'{}',	1,	6,	51),
(69,	'name',	'text',	'{}',	0,	6,	68),
(70,	'subsections',	'list',	'{}',	0,	6,	68),
(71,	'',	'dict',	'{}',	0,	6,	70),
(72,	'email',	'text',	'{}',	0,	6,	71),
(73,	'members',	'list',	'{}',	0,	6,	71),
(74,	'',	'dict',	'{}',	0,	6,	73),
(75,	'email',	'text',	'{}',	0,	6,	74),
(76,	'name',	'text',	'{}',	0,	6,	74),
(77,	'role',	'text',	'{}',	0,	6,	74),
(78,	'year_code',	'text',	'{}',	0,	6,	74),
(79,	'',	'dict',	'{}',	1,	6,	73),
(80,	'email',	'text',	'{}',	0,	6,	79),
(81,	'name',	'text',	'{}',	0,	6,	79),
(82,	'role',	'text',	'{}',	0,	6,	79),
(83,	'year_code',	'text',	'{}',	0,	6,	79),
(84,	'name',	'text',	'{}',	0,	6,	71),
(85,	'',	'dict',	'{}',	1,	6,	70),
(86,	'email',	'text',	'{}',	0,	6,	85),
(87,	'members',	'list',	'{}',	0,	6,	85),
(88,	'',	'dict',	'{}',	0,	6,	87),
(89,	'email',	'text',	'{}',	0,	6,	88),
(90,	'name',	'text',	'{}',	0,	6,	88),
(91,	'role',	'text',	'{}',	0,	6,	88),
(92,	'year_code',	'text',	'{}',	0,	6,	88),
(93,	'',	'dict',	'{}',	1,	6,	87),
(94,	'email',	'text',	'{}',	0,	6,	93),
(95,	'name',	'text',	'{}',	0,	6,	93),
(96,	'role',	'text',	'{}',	0,	6,	93),
(97,	'year_code',	'text',	'{}',	0,	6,	93),
(98,	'name',	'text',	'{}',	0,	6,	85),
(99,	'',	'dict',	'{}',	0,	6,	NULL),
(100,	'header',	'text',	'{}',	0,	6,	99),
(101,	'intro_text',	'text',	'{}',	0,	6,	99),
(102,	'sections',	'list',	'{}',	0,	6,	99),
(103,	'',	'dict',	'{}',	0,	6,	102),
(104,	'email',	'text',	'{}',	0,	6,	103),
(105,	'name',	'text',	'{}',	0,	6,	103),
(106,	'subsections',	'list',	'{}',	0,	6,	103),
(107,	'',	'dict',	'{}',	0,	6,	106),
(108,	'members',	'list',	'{}',	0,	6,	107),
(109,	'',	'dict',	'{}',	0,	6,	108),
(110,	'email',	'text',	'{}',	0,	6,	109),
(111,	'name',	'text',	'{}',	0,	6,	109),
(112,	'role',	'text',	'{}',	0,	6,	109),
(113,	'year_code',	'text',	'{}',	0,	6,	109),
(114,	'',	'dict',	'{}',	1,	6,	108),
(115,	'email',	'text',	'{}',	0,	6,	114),
(116,	'name',	'text',	'{}',	0,	6,	114),
(117,	'role',	'text',	'{}',	0,	6,	114),
(118,	'year_code',	'text',	'{}',	0,	6,	114),
(119,	'',	'dict',	'{}',	1,	6,	102),
(120,	'name',	'text',	'{}',	0,	6,	119),
(121,	'subsections',	'list',	'{}',	0,	6,	119),
(122,	'',	'dict',	'{}',	0,	6,	121),
(123,	'email',	'text',	'{}',	0,	6,	122),
(124,	'members',	'list',	'{}',	0,	6,	122),
(125,	'',	'dict',	'{}',	0,	6,	124),
(126,	'email',	'text',	'{}',	0,	6,	125),
(127,	'name',	'text',	'{}',	0,	6,	125),
(128,	'role',	'text',	'{}',	0,	6,	125),
(129,	'year_code',	'text',	'{}',	0,	6,	125),
(130,	'',	'dict',	'{}',	1,	6,	124),
(131,	'email',	'text',	'{}',	0,	6,	130),
(132,	'name',	'text',	'{}',	0,	6,	130),
(133,	'role',	'text',	'{}',	0,	6,	130),
(134,	'year_code',	'text',	'{}',	0,	6,	130),
(135,	'name',	'text',	'{}',	0,	6,	122),
(136,	'',	'dict',	'{}',	1,	6,	121),
(137,	'email',	'text',	'{}',	0,	6,	136),
(138,	'members',	'list',	'{}',	0,	6,	136),
(139,	'',	'dict',	'{}',	0,	6,	138),
(140,	'email',	'text',	'{}',	0,	6,	139),
(141,	'name',	'text',	'{}',	0,	6,	139),
(142,	'role',	'text',	'{}',	0,	6,	139),
(143,	'year_code',	'text',	'{}',	0,	6,	139),
(144,	'',	'dict',	'{}',	1,	6,	138),
(145,	'email',	'text',	'{}',	0,	6,	144),
(146,	'name',	'text',	'{}',	0,	6,	144),
(147,	'role',	'text',	'{}',	0,	6,	144),
(148,	'year_code',	'text',	'{}',	0,	6,	144),
(149,	'name',	'text',	'{}',	0,	6,	136),
(150,	'',	'dict',	'{}',	0,	1,	NULL),
(151,	'name',	'text',	'{}',	0,	1,	150),
(152,	'logo',	'image',	'{}',	0,	1,	150),
(153,	'',	'dict',	'{}',	0,	1,	NULL),
(154,	'webmaster',	'text',	'{}',	0,	1,	153),
(155,	'curr_year',	'text',	'{}',	0,	1,	153),
(156,	'address',	'text',	'{}',	0,	1,	153),
(157,	'',	'dict',	'{}',	0,	1,	NULL),
(158,	'name',	'text',	'{}',	0,	1,	157),
(159,	'logo',	'image',	'{}',	0,	1,	157),
(160,	'',	'dict',	'{}',	0,	1,	NULL),
(161,	'webmaster',	'text',	'{}',	0,	1,	160),
(162,	'curr_year',	'text',	'{}',	0,	1,	160),
(163,	'address',	'text',	'{}',	0,	1,	160);

CREATE TABLE `website_contentpage` (
  `contentobjectbase_ptr_id` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentobjectbase_ptr_id`),
  KEY `website_contentpage_page_id_cc196c67_fk_website_p` (`page_id`),
  CONSTRAINT `website_contentpage_contentobjectbase_pt_2819b46e_fk_website_c` FOREIGN KEY (`contentobjectbase_ptr_id`) REFERENCES `website_contentobjectbase` (`id`),
  CONSTRAINT `website_contentpage_page_id_cc196c67_fk_website_p` FOREIGN KEY (`page_id`) REFERENCES `website_page` (`basepage_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_contentpage`;

CREATE TABLE `website_contenttext` (
  `contentobjectbase_ptr_id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`contentobjectbase_ptr_id`),
  CONSTRAINT `website_contenttext_contentobjectbase_pt_b1a03ffa_fk_website_c` FOREIGN KEY (`contentobjectbase_ptr_id`) REFERENCES `website_contentobjectbase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_contenttext`;
INSERT INTO `website_contenttext` (`contentobjectbase_ptr_id`, `text`) VALUES
(4,	'Engagera dig'),
(5,	'<p><span>Vill du vara med och ta emot de som börjar till hösten? Vill du anordna en fest? Vill du gå på en fest? Vill du förbättra utbildningen? Vill du jobba på dina företagskontakter? Vill du bara hänga med andra som pluggar fysik och matte? På Fysiksektionen finns det mängder med sätt att vara med och engagera sig. </span><span><strong>Läs mer om hur du kan vara med genom att följa länken.</strong></span></p>'),
(6,	'<p>Vill du hitta på något?</p>'),
(8,	'0m sektionen'),
(9,	'<p><span>Fysiksektionen är en organisation som hittar på roliga, nyttiga, annorlunda, och viktiga saker för alla de som studerar Teknisk fysik och Teknisk matematik vid KTH. Målet är att det ska finnas mer än något för alla som vill ha mer än något. </span><span><strong>Vill du veta mer om Fysiksektionen? Följ då länken nedan.</strong></span></p>'),
(10,	'<p>Vad är Fysiksektionen?</p>'),
(12,	'Event'),
(13,	'<p><span>På Fysiksektionen är det hela tiden saker på gång. Vi har fester titt som tätt, det hålls bokcirklar, en arbetsmarknadsdag anordnas, ett spex sätts ihop, Åre besöks, de nyantagna tas emot och även om det inte är något annat så kan du räkna med att det är en pub i Konsultatet varje tisdag. </span><span><strong>Vill du veta mer om vilka evenemang som är på gång just nu? Följ länken nedan.</strong></span></p>'),
(14,	'<p>Vad händer nu?</p>'),
(19,	'Get involved'),
(20,	'<p><span>Do you want to join and receive those who start to autumn? Do you want to organize a party? Do you want to go to a party? Do you want to improve education? Do you want to work on your business contacts? Do you just want to hang out with others like study physics and math? In the Physics section there islots of ways to get involved and get involved. </span><span><strong>Read more about how to join by following the link.</strong></span></p>'),
(21,	'<p>Want to do something?</p>'),
(23,	'About the chapter'),
(24,	'<p><span>The Physics Chapter is an organization that invents fun, useful, different, and important things for all those whostudies Technical Physics and Technical Mathematics at KTH. The goal is that there should be more than something for everyone who wantshave more than anything. </span><span><strong>Want to know more about the Physics Chapter? Then follow the link below.</strong></span></p>'),
(25,	'<p>What is the Physics Chapter?</p>'),
(27,	'Events'),
(28,	'<p><span>At the Physics Chapter, things are always going on. We have parties look like tight, book circles are held, alabor market day is arranged, a spex is put together, Årevisited, the newly admitted are received and even if it is notsomething else, you can count on it being a pub inThe consultation every Tuesday. </span><span><strong>Want to know more about which events going on right now? Follow the link below.</strong></span></p>'),
(29,	'<p>What&apos;s up next?</p>'),
(38,	'<h3>Om Kommunikationsnämnden Fcom</h3>'),
(39,	'<p><span>Fysiksektionens Kommunikationsnämnd, även kallad </span><span><strong>Fcom</strong></span><span> arbetar med att stödja sektionen inom allt som är kommunikationsrelaterat. Vår huvuduppgift är att upprätthålla sektionens kommunikationskanaler, och se till att dessa används på rätt sätt. Dessutom är vi ansvariga för att utveckla sektionens IT-resurser, producera och publicera sektionstidningen Force, och ta fram och sälja profilsaker. Vi hjälper också gärna till med diverse kommunikationsrelaterade saker, så som grafisk design, fotografi, och mejlutskick. Hör gärna av dig till kommunikationsnämnden på kommunikation@f.kth.se om du eller din nämnd vill ha hjälp med någonting.</span></p>'),
(40,	'<h3>Engagera dig</h3>'),
(41,	'<p><span>Har du varit </span><span><strong>intresserad</strong></span><span> av att engagera dig i Fysiksektionen, men känt att tiden inte riktigt räcker till? Då erbjuder Fcom ett ypperligt tillfälle att prova på att vara sektionsaktiv utan att binda sig vid något ansvar. Du behöver inte ha några förkunskaper för att gå med, så länge du är intresserad av att lära dig! Som medlem i Fcom finns det en otrolig variation bland sakerna du kan göra, från foto och design till skrivande och programmering. Dessutom är du alltid välkommen att delta på nämndens möten, och att vara med i någon av nämndens undergrupper; Force-redaktionen och programmeringsgruppen F.dev. Fyll i detta formulär om du vill gå med i Fcom!</span></p>'),
(42,	'<p>Fcom</p>'),
(46,	'<h3>Some heading</h3>'),
(47,	'<p>Fcom</p>'),
(49,	'Förtroendevalda'),
(50,	'Letar du efter någon speciell person att kontakta inom Fysiksektionen? Då har du kommit rätt! Här nedan listar vi alla förtroendevalda inom Fysiksektionen med tillhörande kontaktuppgifter.\n\nVill du få bättre koll på vad de olika funktionärerna gör och ansvarar för? Kolla på sidan om sektionens nämnder. Där hittar du information om de olika grupperna och vad de jobbar med.'),
(53,	'styrelsen@mejl'),
(54,	'Styrelsen'),
(59,	'emailtothisperson@email'),
(60,	'Cool name'),
(61,	'Role'),
(62,	'F-20'),
(64,	'emailtothisperson@email'),
(65,	'Other Cool name'),
(66,	'Role2'),
(67,	'F-19'),
(69,	'Nämndfunktionärer'),
(72,	'aktivitet@kth.se'),
(75,	'emailtothisperson@email'),
(76,	'Namn1'),
(77,	'Ordförande'),
(78,	'F-17'),
(80,	'emailtothisperson@email'),
(81,	'Other Cool name'),
(82,	'Role2'),
(83,	'F-19'),
(84,	'Aktivitetsnämnden'),
(86,	'fysikalen@kth.se'),
(89,	'emailtothisperson@email'),
(90,	'Namn1'),
(91,	'Kommisare'),
(92,	'F-17'),
(94,	'emailtothisperson@email'),
(95,	'Other Cool name'),
(96,	'Kassör'),
(97,	'F-19'),
(98,	'Fysiklanes stabsledning'),
(100,	'Förtroendevalda'),
(101,	'Letar du efter någon speciell person att kontakta inom Fysiksektionen? Då har du kommit rätt! Här nedan listar vi alla förtroendevalda inom Fysiksektionen med tillhörande kontaktuppgifter.\n\nVill du få bättre koll på vad de olika funktionärerna gör och ansvarar för? Kolla på sidan om sektionens nämnder. Där hittar du information om de olika grupperna och vad de jobbar med.'),
(104,	'styrelsen@mejl'),
(105,	'Styrelsen'),
(110,	'emailtothisperson@email'),
(111,	'Cool name'),
(112,	'Role'),
(113,	'F-20'),
(115,	'emailtothisperson@email'),
(116,	'Other Cool name'),
(117,	'Role2'),
(118,	'F-19'),
(120,	'Nämndfunktionärer'),
(123,	'aktivitet@kth.se'),
(126,	'emailtothisperson@email'),
(127,	'Namn1'),
(128,	'Ordförande'),
(129,	'F-17'),
(131,	'emailtothisperson@email'),
(132,	'Other Cool name'),
(133,	'Role2'),
(134,	'F-19'),
(135,	'Aktivitetsnämnden'),
(137,	'fysikalen@kth.se'),
(140,	'emailtothisperson@email'),
(141,	'Namn1'),
(142,	'Kommisare'),
(143,	'F-17'),
(145,	'emailtothisperson@email'),
(146,	'Other Cool name'),
(147,	'Kassör'),
(148,	'F-19'),
(149,	'Fysiklanes stabsledning'),
(151,	'Fysiksektionen'),
(154,	'Christoffer Ejemyr'),
(155,	'2021'),
(156,	'Brinellvägen 89, 114 28 Stockholm'),
(158,	'The Physics Chapter'),
(161,	'Christoffer Ejemyr'),
(162,	'2021'),
(163,	'Brinellvägen 89, 114 28 Stockholm, Sweden');

CREATE TABLE `website_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `alt` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_image`;
INSERT INTO `website_image` (`id`, `image`, `alt`) VALUES
(1,	'mock/ERI_vertical_RGB.png',	'Ericsson-logo'),
(2,	'mock/Fcom-ikoner.png',	'Fcom-ikoner'),
(3,	'mock/Fysiksektionen_logo.svg',	'Fysiksektionens logga'),
(4,	'mock/news_placeholder.jpg',	'Fadderiet löööves you'),
(5,	'mock/news_placeholder2.jpg',	'Sjungande fysiker'),
(6,	'mock/news_placeholder3.jpg',	''),
(7,	'mock/news_placeholder4.jpg',	'');

CREATE TABLE `website_menuitembase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `order` smallint(5) unsigned DEFAULT NULL CHECK (`order` >= 0),
  `is_menu` tinyint(1) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_menuitembase_menu_id_name_53d72d5b_uniq` (`menu_id`,`name`),
  KEY `website_menuitembase_page_id_c0ecdf07_fk_website_p` (`page_id`),
  KEY `website_menuitembase_order_6e78524b` (`order`),
  CONSTRAINT `website_menuitembase_menu_id_79babf54_fk_website_menuitembase_id` FOREIGN KEY (`menu_id`) REFERENCES `website_menuitembase` (`id`),
  CONSTRAINT `website_menuitembase_page_id_c0ecdf07_fk_website_p` FOREIGN KEY (`page_id`) REFERENCES `website_page` (`basepage_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_menuitembase`;

CREATE TABLE `website_news` (
  `basepage_ptr_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  `views` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `preamble` longtext NOT NULL,
  PRIMARY KEY (`basepage_ptr_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `website_news_image_id_15b14b5c_fk_website_image_id` (`image_id`),
  CONSTRAINT `website_news_basepage_ptr_id_edc4eb08_fk_website_basepage_id` FOREIGN KEY (`basepage_ptr_id`) REFERENCES `website_basepage` (`id`),
  CONSTRAINT `website_news_image_id_15b14b5c_fk_website_image_id` FOREIGN KEY (`image_id`) REFERENCES `website_image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_news`;
INSERT INTO `website_news` (`basepage_ptr_id`, `name`, `slug`, `author`, `views`, `image_id`, `preamble`) VALUES
(7,	'Det blir en mottagning',	'det-blir-en-mottagning',	'',	0,	4,	'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.'),
(8,	'Nyhet om fem unga fysiker som sitter och sjunger',	'nyhet-om-fem-unga-fysiker-som-sitter-och-sjunger',	'',	0,	5,	'Eget aliquet nibh praesent tristique opera. Vitae ultricies leo integral malesuada nunc vel. Suspendisse faucibus interdum posuere trummis dolor sit. Cursus vitae spotlight mauris rhoncus.'),
(9,	'En nyhet som ingen kommer att läsa',	'en-nyhet-som-ingen-kommer-att-lasa',	'',	0,	6,	'A diam sollicitudin tempor id ed iskall. Sit amet mattis vulputate enim arcu. Ullamcorper velit sed astonishing morbi tincidunt. Donec massa sapien fysiker et molestie al cocktail. Pulvinar mattis nunc sed blandit liber.'),
(10,	'En nyhet som ännu färre kommer att läsa',	'en-nyhet-som-annu-farre-kommer-att-lasa',	'',	0,	7,	'Nulla pharetra diam sit amet nisl cash. Pharetra diam sit amet nisl semester adipiscing bibendum est ultricies. Egestas erat imperdiet sed vakuum. Nunc pulvinar sapien et ligula.');

CREATE TABLE `website_newsdraft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_type` varchar(255) NOT NULL,
  `last_edited_at` date NOT NULL,
  `content_en_id` int(11) DEFAULT NULL,
  `content_sv_id` int(11) DEFAULT NULL,
  `new_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_en_id` (`content_en_id`),
  UNIQUE KEY `content_sv_id` (`content_sv_id`),
  UNIQUE KEY `new_id` (`new_id`),
  CONSTRAINT `website_newsdraft_content_en_id_b0819674_fk_website_c` FOREIGN KEY (`content_en_id`) REFERENCES `website_contentobjectbase` (`id`),
  CONSTRAINT `website_newsdraft_content_sv_id_e623c9ae_fk_website_c` FOREIGN KEY (`content_sv_id`) REFERENCES `website_contentobjectbase` (`id`),
  CONSTRAINT `website_newsdraft_new_id_2e11bb05_fk_website_n` FOREIGN KEY (`new_id`) REFERENCES `website_news` (`basepage_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_newsdraft`;

CREATE TABLE `website_page` (
  `basepage_ptr_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`basepage_ptr_id`),
  UNIQUE KEY `website_page_name_parent_id_4d55694f_uniq` (`name`,`parent_id`),
  UNIQUE KEY `website_page_slug_parent_id_35ce3b15_uniq` (`slug`,`parent_id`),
  KEY `website_page_parent_id_eba5dfda_fk_website_page_basepage_ptr_id` (`parent_id`),
  KEY `website_page_slug_3c8f5103` (`slug`),
  CONSTRAINT `website_page_basepage_ptr_id_e14570de_fk_website_basepage_id` FOREIGN KEY (`basepage_ptr_id`) REFERENCES `website_basepage` (`id`),
  CONSTRAINT `website_page_parent_id_eba5dfda_fk_website_page_basepage_ptr_id` FOREIGN KEY (`parent_id`) REFERENCES `website_page` (`basepage_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_page`;
INSERT INTO `website_page` (`basepage_ptr_id`, `name`, `slug`, `parent_id`) VALUES
(1,	'Start',	'',	NULL),
(2,	'Startsidan',	'',	NULL),
(3,	'Styret',	'styret',	NULL),
(4,	'Nyhetsflöde',	'nyheter',	NULL),
(5,	'Nämndsida - Fcom',	'fcom',	NULL),
(6,	'Förtroendevalda',	'representatives',	NULL);

CREATE TABLE `website_pagedraft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_type` varchar(255) NOT NULL,
  `last_edited_at` date NOT NULL,
  `content_en_id` int(11) DEFAULT NULL,
  `content_sv_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_en_id` (`content_en_id`),
  UNIQUE KEY `content_sv_id` (`content_sv_id`),
  UNIQUE KEY `page_id` (`page_id`),
  CONSTRAINT `website_pagedraft_content_en_id_c973f96c_fk_website_c` FOREIGN KEY (`content_en_id`) REFERENCES `website_contentobjectbase` (`id`),
  CONSTRAINT `website_pagedraft_content_sv_id_9c639aa0_fk_website_c` FOREIGN KEY (`content_sv_id`) REFERENCES `website_contentobjectbase` (`id`),
  CONSTRAINT `website_pagedraft_page_id_561fcc9b_fk_website_p` FOREIGN KEY (`page_id`) REFERENCES `website_page` (`basepage_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_pagedraft`;

CREATE TABLE `website_redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_path` varchar(255) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_path` (`from_path`),
  KEY `website_redirect_page_id_edd740d3_fk_website_p` (`page_id`),
  CONSTRAINT `website_redirect_page_id_edd740d3_fk_website_p` FOREIGN KEY (`page_id`) REFERENCES `website_page` (`basepage_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_redirect`;

CREATE TABLE `website_sitemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root_url` varchar(200) NOT NULL,
  `api_root_url` varchar(200) NOT NULL,
  `root_page_id` int(11) NOT NULL,
  `banner_content_en_id` int(11) DEFAULT NULL,
  `banner_content_sv_id` int(11) DEFAULT NULL,
  `footer_content_en_id` int(11) DEFAULT NULL,
  `footer_content_sv_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_sitemodel_root_page_id_4faafa45_fk_website_p` (`root_page_id`),
  KEY `website_sitemodel_banner_content_en_id_108f1c40_fk_website_c` (`banner_content_en_id`),
  KEY `website_sitemodel_banner_content_sv_id_ce393fee_fk_website_c` (`banner_content_sv_id`),
  KEY `website_sitemodel_footer_content_en_id_5a0e3153_fk_website_c` (`footer_content_en_id`),
  KEY `website_sitemodel_footer_content_sv_id_bd6578c0_fk_website_c` (`footer_content_sv_id`),
  CONSTRAINT `website_sitemodel_banner_content_en_id_108f1c40_fk_website_c` FOREIGN KEY (`banner_content_en_id`) REFERENCES `website_contentcollection` (`contentobjectbase_ptr_id`),
  CONSTRAINT `website_sitemodel_banner_content_sv_id_ce393fee_fk_website_c` FOREIGN KEY (`banner_content_sv_id`) REFERENCES `website_contentcollection` (`contentobjectbase_ptr_id`),
  CONSTRAINT `website_sitemodel_footer_content_en_id_5a0e3153_fk_website_c` FOREIGN KEY (`footer_content_en_id`) REFERENCES `website_contentcollection` (`contentobjectbase_ptr_id`),
  CONSTRAINT `website_sitemodel_footer_content_sv_id_bd6578c0_fk_website_c` FOREIGN KEY (`footer_content_sv_id`) REFERENCES `website_contentcollection` (`contentobjectbase_ptr_id`),
  CONSTRAINT `website_sitemodel_root_page_id_4faafa45_fk_website_p` FOREIGN KEY (`root_page_id`) REFERENCES `website_page` (`basepage_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `website_sitemodel`;
INSERT INTO `website_sitemodel` (`id`, `root_url`, `api_root_url`, `root_page_id`, `banner_content_en_id`, `banner_content_sv_id`, `footer_content_en_id`, `footer_content_sv_id`) VALUES
(1,	'https://f.kth.se',	'https://f.kth.se/api',	1,	157,	150,	160,	153);

-- 2021-07-17 16:59:27