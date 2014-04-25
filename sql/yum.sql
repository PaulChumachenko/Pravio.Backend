-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 25 2014 г., 13:41
-- Версия сервера: 5.5.37-log
-- Версия PHP: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `yum`
--

-- --------------------------------------------------------

--
-- Структура таблицы `yum_action`
--

CREATE TABLE IF NOT EXISTS `yum_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `comment` text,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `yum_action`
--

INSERT INTO `yum_action` (`id`, `title`, `comment`, `subject`) VALUES
(1, 'message_write', NULL, NULL),
(2, 'message_receive', NULL, NULL),
(3, 'user_create', NULL, NULL),
(4, 'user_update', NULL, NULL),
(5, 'user_remove', NULL, NULL),
(6, 'user_admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `yum_friendship`
--

CREATE TABLE IF NOT EXISTS `yum_friendship` (
  `inviter_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `acknowledgetime` int(11) DEFAULT NULL,
  `requesttime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`inviter_id`,`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yum_friendship`
--

INSERT INTO `yum_friendship` (`inviter_id`, `friend_id`, `status`, `acknowledgetime`, `requesttime`, `updatetime`, `message`) VALUES
(1, 17, 1, 0, 1398240710, 1398240710, 'woh-woh! Палехче!\r\n'),
(3, 4, 3, 0, 1390915118, 1390915223, 'add FRIEND AS TU2'),
(4, 7, 1, 0, 1390918970, 1390918970, 'fgdgsdfadsfbcgnbxcvzcSdfxc'),
(5, 4, 2, 1390915631, 1390915395, 1390915395, 'tu3 request Mimimi'),
(7, 3, 2, 1390917209, 1390917159, 1390917159, 'hgcfxdsAASDFGH');

-- --------------------------------------------------------

--
-- Структура таблицы `yum_membership`
--

CREATE TABLE IF NOT EXISTS `yum_membership` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_date` int(11) NOT NULL,
  `end_date` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `payment_date` int(11) DEFAULT NULL,
  `subscribed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10002 ;

--
-- Дамп данных таблицы `yum_membership`
--

INSERT INTO `yum_membership` (`id`, `membership_id`, `user_id`, `payment_id`, `order_date`, `end_date`, `name`, `street`, `zipcode`, `city`, `payment_date`, `subscribed`) VALUES
(10000, 4, 7, 2, 1390920285, 1393339529, NULL, NULL, NULL, NULL, 1390920329, -1),
(10001, 3, 7, 2, 1390920433, 1391525273, NULL, NULL, NULL, NULL, 1390920473, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `yum_message`
--

CREATE TABLE IF NOT EXISTS `yum_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `message_read` tinyint(1) NOT NULL,
  `answered` tinyint(1) DEFAULT NULL,
  `draft` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `yum_message`
--

INSERT INTO `yum_message` (`id`, `timestamp`, `from_user_id`, `to_user_id`, `title`, `message`, `message_read`, `answered`, `draft`) VALUES
(1, 1390909292, 4, 1, 'New friendship request from testUser2', 'A new friendship request from testUser2 has been made: Friend ADD status=deleted <a href="/YUM/index.php?r=friendship/friendship/index">Manage my friends</a><br /><a href="/YUM/index.php?r=profile/profile/view">To the profile</a>', 1, NULL, NULL),
(2, 1390909349, 1, 4, 'Your friendship request has been accepted', 'Your friendship request to testUser2 has been accepted', 1, NULL, NULL),
(3, 1390909382, 1, 4, 'You delete now', 'status testUser2 = deleted\r\nrequest = confirm', 1, 0, NULL),
(4, 1390915118, 3, 4, 'New friendship request from testUser', 'A new friendship request from testUser has been made: add FRIEND AS TU2 <a href="/YUM/index.php?r=friendship/friendship/index">Manage my friends</a><br /><a href="/YUM/index.php?r=profile/profile/view">To the profile</a>', 1, NULL, NULL),
(5, 1390915631, 4, 5, 'Your friendship request has been accepted', 'Your friendship request to testUser3 has been accepted', 0, NULL, NULL),
(6, 1390916971, 7, 3, 'New friendship request from testUser4', 'A new friendship request from testUser4 has been made: khjgfxdsadfghj <a href="/YUM/index.php?r=friendship/friendship/index">Manage my friends</a><br /><a href="/YUM/index.php?r=profile/profile/view">To the profile</a>', 1, NULL, NULL),
(7, 1390917159, 7, 3, 'New friendship request from testUser4', 'A new friendship request from testUser4 has been made: hgcfxdsAASDFGH <a href="/YUM/index.php?r=friendship/friendship/index">Manage my friends</a><br /><a href="/YUM/index.php?r=profile/profile/view">To the profile</a>', 1, NULL, NULL),
(8, 1390917209, 3, 7, 'Your friendship request has been accepted', 'Your friendship request to testUser4 has been accepted', 1, NULL, NULL),
(9, 1390917318, 7, 3, 'TEST email', 'ghjdksl\r\n;sladkjf\r\nnmk,l;', 1, 0, NULL),
(10, 1390917535, 3, 7, 'Re: TEST email', 'Email done. Now should not exist. Check it\r\n', 1, 9, NULL),
(11, 1390919290, 7, 4, 'test test', 'qwerty', 1, 0, NULL),
(12, 1390920329, 1, 7, 'Payment arrived', 'The payment of order 10000 has been arrived at 01-28-2014 18:45:29', 0, NULL, NULL),
(13, 1390920473, 1, 7, 'Payment arrived', 'The payment of order 10001 has been arrived at 01-28-2014 18:47:53', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `yum_payment`
--

CREATE TABLE IF NOT EXISTS `yum_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `yum_payment`
--

INSERT INTO `yum_payment` (`id`, `title`, `text`) VALUES
(1, 'Prepayment', NULL),
(2, 'Paypal', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `yum_permission`
--

CREATE TABLE IF NOT EXISTS `yum_permission` (
  `principal_id` int(11) NOT NULL,
  `subordinate_id` int(11) NOT NULL DEFAULT '0',
  `type` enum('user','role') NOT NULL,
  `action` int(11) NOT NULL,
  `template` tinyint(1) NOT NULL,
  `comment` text,
  PRIMARY KEY (`principal_id`,`subordinate_id`,`type`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yum_permission`
--

INSERT INTO `yum_permission` (`principal_id`, `subordinate_id`, `type`, `action`, `template`, `comment`) VALUES
(1, 0, 'role', 4, 0, ''),
(1, 0, 'role', 5, 0, ''),
(1, 0, 'role', 6, 0, ''),
(1, 0, 'role', 7, 0, ''),
(2, 0, 'role', 1, 0, 'Users can write messages'),
(2, 0, 'role', 2, 0, 'Users can receive messages'),
(2, 0, 'role', 3, 0, 'Users are able to view visits of his profile');

-- --------------------------------------------------------

--
-- Структура таблицы `yum_privacysetting`
--

CREATE TABLE IF NOT EXISTS `yum_privacysetting` (
  `user_id` int(10) unsigned NOT NULL,
  `message_new_friendship` tinyint(1) NOT NULL DEFAULT '1',
  `message_new_message` tinyint(1) NOT NULL DEFAULT '1',
  `message_new_profilecomment` tinyint(1) NOT NULL DEFAULT '1',
  `appear_in_search` tinyint(1) NOT NULL DEFAULT '1',
  `show_online_status` tinyint(1) NOT NULL DEFAULT '1',
  `log_profile_visits` tinyint(1) NOT NULL DEFAULT '1',
  `ignore_users` varchar(255) DEFAULT NULL,
  `public_profile_fields` bigint(15) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yum_privacysetting`
--

INSERT INTO `yum_privacysetting` (`user_id`, `message_new_friendship`, `message_new_message`, `message_new_profilecomment`, `appear_in_search`, `show_online_status`, `log_profile_visits`, `ignore_users`, `public_profile_fields`) VALUES
(1, 1, 1, 1, 1, 1, 1, '', 4079),
(2, 1, 1, 1, 1, 1, 1, NULL, NULL),
(3, 1, 1, 1, 1, 1, 0, 'admin', 358),
(4, 0, 1, 1, 1, 1, 1, '', 62),
(5, 1, 1, 1, 1, 1, 1, '', NULL),
(6, 1, 1, 1, 1, 1, 1, '', NULL),
(7, 1, 1, 1, 1, 1, 1, 'testUser,testUser2', 27),
(8, 1, 1, 1, 1, 1, 1, '', NULL),
(9, 1, 1, 1, 1, 1, 1, '', NULL),
(10, 1, 1, 1, 1, 1, 1, '', 47),
(11, 1, 1, 1, 1, 1, 1, '', 127),
(12, 1, 1, 1, 1, 1, 1, '', NULL),
(13, 1, 1, 1, 1, 1, 1, '', NULL),
(14, 1, 1, 1, 1, 1, 1, '', NULL),
(15, 1, 1, 1, 1, 1, 1, '', NULL),
(17, 1, 1, 1, 1, 1, 1, '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `yum_profile`
--

CREATE TABLE IF NOT EXISTS `yum_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `privacy` enum('protected','private','public') NOT NULL,
  `lastname` varchar(50) DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `show_friends` tinyint(1) DEFAULT '1',
  `allow_comments` tinyint(1) DEFAULT '1',
  `email` varchar(255) NOT NULL DEFAULT '',
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `about` text,
  `sex` int(1) NOT NULL DEFAULT '0',
  `skype` varchar(255) NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `phone` varchar(10) NOT NULL DEFAULT '',
  `additional_email` varchar(255) NOT NULL DEFAULT '',
  `region` varchar(255) NOT NULL DEFAULT '',
  `specialization` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `yum_profile`
--

INSERT INTO `yum_profile` (`id`, `user_id`, `timestamp`, `privacy`, `lastname`, `firstname`, `show_friends`, `allow_comments`, `email`, `street`, `city`, `about`, `sex`, `skype`, `birthday`, `phone`, `additional_email`, `region`, `specialization`) VALUES
(1, 1, '2014-04-22 10:28:39', 'protected', 'admin', 'Such Admin', 0, 1, 'admin@admin.com', 'Streetus', 'Citi', 'SOMETHING wrong <>', 0, 'admin4eg', '2014-04-11', '0001234567', 'my@admin.com', 'Lviv', 'not now'),
(2, 2, '2014-01-28 10:17:24', 'protected', 'demo', 'demo', 1, 1, 'demo@example.com', NULL, NULL, NULL, 0, '', '0000-00-00', '', '', '', ''),
(3, 3, '2014-04-22 08:28:49', 'protected', 'User', 'Test User', 2, 1, 'test@user.com', '', '', 'Lorem ipsum — dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suLorem ipsum — dolor sit cipit lobortis nisl ut aliquip ex ea commodo consequat.[1] Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint ', 0, '', '1992-04-23', '', '', '', ''),
(4, 4, '0000-00-00 00:00:00', 'protected', 'User2', 'Ibrahim', 0, 1, 'test2@user.com', 'Massachussets', 'Ogayo', '''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting', 0, '', '0000-00-00', '', '', '', ''),
(5, 5, '0000-00-00 00:00:00', 'protected', 'User', 'Test3', 1, 1, 'test3@user.com', NULL, NULL, NULL, 0, '', '0000-00-00', '', '', '', ''),
(6, 6, '0000-00-00 00:00:00', 'protected', 'ldslf', 'R', 1, 1, 'user2@test.com', NULL, NULL, NULL, 0, '', '0000-00-00', '', '', '', ''),
(7, 7, '0000-00-00 00:00:00', 'protected', 'User 4 ', 'Test', 0, 0, 'test4@user.com', 'Хуёк-макарёк, 4а, 55/13', 'Днище ебанное', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen', 0, '', '0000-00-00', '', '', '', ''),
(8, 8, '0000-00-00 00:00:00', 'protected', 'Gitya', 'Adik ', 1, 1, 'kilo.oms@sido.net', NULL, NULL, NULL, 0, '', '0000-00-00', '', '', '', ''),
(9, 9, '0000-00-00 00:00:00', 'protected', '', 'U0101 Git', 1, 1, 'm-y.site.u-01_0-1@doh.what.ua', NULL, NULL, NULL, 0, '', '0000-00-00', '', '', '', ''),
(10, 10, '0000-00-00 00:00:00', 'protected', '', 'Fe Male', 0, 1, 'female@user.com', NULL, NULL, NULL, 1, '', '0000-00-00', '', '', '', ''),
(11, 11, '0000-00-00 00:00:00', 'protected', '', 'Fe Fo', 0, 1, 'test@zone.com', '', '', '', 1, '', '0000-00-00', '', '', '', ''),
(12, 12, '0000-00-00 00:00:00', 'protected', '', 'Testing from HELL', 1, 1, 'some@thing.com', '', '', '', 1, '', '0000-00-00', '', '', '', ''),
(14, 17, '0000-00-00 00:00:00', 'protected', '', 'Vovan Koleso', 1, 1, 'new@user.com', 'Chornovola', 'Zagreb', 'Not now', 0, '', '0000-00-00', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `yum_profile_comment`
--

CREATE TABLE IF NOT EXISTS `yum_profile_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `yum_profile_comment`
--

INSERT INTO `yum_profile_comment` (`id`, `user_id`, `profile_id`, `comment`, `createtime`) VALUES
(2, 3, 1, 'jyhgfvdc', 1390909782),
(5, 3, 7, 'jhfgdgdfd', 1390917769),
(8, 7, 3, 'xdf cxfz', 1390918255);

-- --------------------------------------------------------

--
-- Структура таблицы `yum_profile_field`
--

CREATE TABLE IF NOT EXISTS `yum_profile_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `varname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `hint` text NOT NULL,
  `field_type` varchar(50) NOT NULL DEFAULT '',
  `field_size` int(3) NOT NULL DEFAULT '0',
  `field_size_min` int(3) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `match` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `other_validator` varchar(255) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `position` int(3) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  `related_field_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `varname` (`varname`,`visible`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `yum_profile_field`
--

INSERT INTO `yum_profile_field` (`id`, `varname`, `title`, `hint`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `position`, `visible`, `related_field_name`) VALUES
(1, 'email', 'E-mail', '', 'VARCHAR', 255, 0, 1, '', '', '', 'CEmailValidator', '', 5, 3, ''),
(2, 'firstname', 'Name & Surname', '', 'VARCHAR', 255, 0, 1, '', '', '', '', '', 0, 3, ''),
(3, 'lastname', 'Lastname', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 3, ''),
(4, 'street', 'Street', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 91, 3, ''),
(5, 'city', 'City', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 90, 3, ''),
(6, 'sex', 'Sex', '', 'INTEGER', 1, 1, 1, '', '', '', '', '', 2, 3, ''),
(7, 'about', 'About', '', 'TEXT', 2000, 0, 0, '', '', '', '', '', 3, 3, ''),
(8, 'skype', 'Skype', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 8, 3, ''),
(9, 'birthday', 'Birthday', '', 'DATE', 0, 0, 0, '', '', '', '', '', 1, 3, ''),
(10, 'phone', 'Phone', '', 'VARCHAR', 10, 0, 0, '', '', '', '', '', 7, 3, ''),
(11, 'additional_email', 'Additional e-mail', '', 'VARCHAR', 255, 0, 0, '', '', '', 'CEmailValidator', '', 6, 3, ''),
(12, 'region', 'Region', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 9, 3, ''),
(13, 'specialization', 'Specialization', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 4, 3, '');

-- --------------------------------------------------------

--
-- Структура таблицы `yum_profile_visit`
--

CREATE TABLE IF NOT EXISTS `yum_profile_visit` (
  `visitor_id` int(11) NOT NULL,
  `visited_id` int(11) NOT NULL,
  `timestamp_first_visit` int(11) NOT NULL,
  `timestamp_last_visit` int(11) NOT NULL,
  `num_of_visits` int(11) NOT NULL,
  PRIMARY KEY (`visitor_id`,`visited_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yum_profile_visit`
--

INSERT INTO `yum_profile_visit` (`visitor_id`, `visited_id`, `timestamp_first_visit`, `timestamp_last_visit`, `num_of_visits`) VALUES
(1, 3, 1397553586, 1398411019, 18),
(1, 4, 1390908747, 1398163731, 9),
(1, 5, 1398241736, 1398242501, 2),
(1, 6, 1390916431, 1390916431, 1),
(1, 12, 1398241606, 1398241626, 2),
(1, 13, 1398162929, 1398162929, 1),
(1, 17, 1398240683, 1398240710, 2),
(3, 1, 1390909775, 1390909783, 2),
(3, 4, 1390915096, 1390915298, 4),
(3, 7, 1390917762, 1390918477, 5),
(4, 1, 1390909270, 1398162064, 6),
(4, 3, 1390915646, 1398162063, 6),
(4, 5, 1398162051, 1398162058, 3),
(4, 7, 1390918959, 1398162066, 6),
(5, 4, 1390915380, 1390915426, 3),
(7, 3, 1390916961, 1390918498, 13),
(7, 4, 1390918898, 1390918898, 1),
(11, 9, 1397827014, 1397827014, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `yum_role`
--

CREATE TABLE IF NOT EXISTS `yum_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `membership_priority` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL COMMENT 'Price (when using membership module)',
  `duration` int(11) DEFAULT NULL COMMENT 'How long a membership is valid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `yum_role`
--

INSERT INTO `yum_role` (`id`, `title`, `description`, `membership_priority`, `price`, `duration`) VALUES
(1, 'UserManager', 'These users can manage Users', 0, 0, 0),
(2, 'Demo', 'Users having the demo role', 0, 0, 0),
(3, 'Business', 'Example Business account', 1, 9.99, 7),
(4, 'Premium', 'Example Premium account', 2, 19.99, 28);

-- --------------------------------------------------------

--
-- Структура таблицы `yum_translation`
--

CREATE TABLE IF NOT EXISTS `yum_translation` (
  `message` varbinary(255) NOT NULL,
  `translation` varchar(255) NOT NULL,
  `language` varchar(5) NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`message`,`language`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yum_translation`
--

INSERT INTO `yum_translation` (`message`, `translation`, `language`, `category`) VALUES
('', 'переклад', 'uk', 'model');

-- --------------------------------------------------------

--
-- Структура таблицы `yum_user`
--

CREATE TABLE IF NOT EXISTS `yum_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL,
  `activationKey` varchar(128) NOT NULL DEFAULT '',
  `createtime` int(10) NOT NULL DEFAULT '0',
  `lastvisit` int(10) NOT NULL DEFAULT '0',
  `lastaction` int(10) NOT NULL DEFAULT '0',
  `lastpasswordchange` int(10) NOT NULL DEFAULT '0',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  `notifyType` enum('None','Digest','Instant','Threshold') DEFAULT 'Instant',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `status` (`status`),
  KEY `superuser` (`superuser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Дамп данных таблицы `yum_user`
--

INSERT INTO `yum_user` (`id`, `username`, `password`, `salt`, `activationKey`, `createtime`, `lastvisit`, `lastaction`, `lastpasswordchange`, `superuser`, `status`, `avatar`, `notifyType`) VALUES
(1, 'admin', '6f94b9bd0b3fa9696eecc63312f585981249389b667aad49edbf708af99b2b529163243a9b29ffaa5847cc90caa7031ddca233b661e495a946b459dfaf0874cb', 'jvXwkXE8QyHnCvLOTyS0LFYOsA3H86nyjoeDjk3kItWWF5Z9XwHNE2k1JRY7f4truLQEihdkyWYhVznzILBhjw==', 'c5ef323e1f8bf2c2aa33fe9fd75dcfb94edac971f3cd221d08442a4d2a54ad617fff7aa6698021bc607b4f7957821cff0fae60517b7996b06ee541bcb5e655cb', 1390904244, 1398237765, 1398413399, 0, 1, 1, 'images/1_angry computer.jpg', 'Instant'),
(2, 'demo', '5b5f2366185a765000353bad7b7a8b27330bd07b994c6392e2d3eb867d2c58b7183056a6c886fc111ae527fb0159aace1e77eabe72f7b8775a704fa96647c6e3', 'N9tLO4Dy5baKECC//0RrzTYCSWuKQOQZCeE6JPghm8/h/DvVDziNcdPB7AaTspnItECxmMSIZU69ytdEvlXNJg==', '', 1390904244, 1390905917, 1390907049, 0, 0, -2, NULL, 'Instant'),
(3, 'testUser', '76d0d8839116ddf70c9716b34d083af1696e7ff84eae7088ce7a18ebfaef51b370908917c184537cc8432206c38b4c790e6445afe838767c1b75e67e5e801990', 'aTqpDd+lnuYGQTum8R2Z6hNqYosPpGTxhv68Sj1atdTC7OsOPtBd1XUQ0AA9S5STTe4+9A6LRbqyFz8Iy9I9pg==', 'a8e7ebad80b200e033a2b379e388dbd32d76062581201902c78e30517146a416ab30e5d8d8a88d83a619388f3f8a10f040bcb6cdd2578f58f3549ead43359338', 1390908022, 1398259734, 1398265410, 1398169215, 0, 1, 'images/3_why not.jpg', 'Instant'),
(4, 'testUser2', '3cb3b828a5f9675350e6d058f1067603081f942e63d36d993bf94e94c6113292cef8ed4c4803a1f7d015d03d1c0b81728733c2b21894e187c080fa8fc7a5d2fd', 'CFAorWu6uVtu1BB7KbLpSmrKt3Y03IBTa3GQ8bPG8hMul9FZel4b3tPx7bX+fM0LTmGrBsQ7RDU2g4m/HCTpJg==', '5d69e6898e2c33185820bbe735f6c99decea438a56689fa1972614e63908ea5c5fc8ea4f221e6248938faab3a16b2674b5b1443dab39a69008f61d71fff42e56', 1390908195, 1398161759, 1398162287, 1390908195, 0, 1, '', 'Instant'),
(5, 'testUser3', 'e6d6df0f4ac768132ddabfb128d6c250e39839400a5bda1ff784251d3115175b77fb9d621f06e109e945b4cc00039be729d56b5de672cc97412fd11e8749ddef', 'SADvilr4l1Zii1WfuHOg5Uclafl5h/O4w6PZ7MYPLzl17KY5pZ0kBjuC9O21pq0QhqsNYvTbzrBW5SFm8eTyQA==', '2e9741db445f22f3deb5295a3f0ca72c10fcf57552622569eebdc81b15294991d15674f1df0dfc393a8978ec6d16d45401747c68ef72154b39f013e3d8d7bb88', 1390908355, 1390916769, 1390916616, 1390916676, 0, 1, 'images/5_helloween.jpg', 'Instant'),
(6, 'testUserROM', '87c3498cd9c3306156e1c40a90f67e0581a0c33d6905f72543320467f35b8317295380472b23fc3413638cfb75357b0305687e4f9dcdc91c2df84757bae9e80d', 'MGzwVxfARbeG+gJnZkhfsNaaTnNl1I2aAeZoG1gGE0utHfnbtiO10+sjC3lqW7JhZFhvavhu/hdnw9YjI0+9Yg==', '5c67b4f47bd42dc3d9424821c6c847f4d515f589d83b1e39b35407d82bb82c31a5f47c1b6e7cb1292aec25b8cec7c918a2ab9f50154d2ecdc64ef16e90375de9', 1390911161, 0, 0, 1390916497, 0, -2, 'gravatar', 'Instant'),
(7, 'testUser4', '70ffb4f4e2781568084bc18da79a05ebd91df921c6ef316b82624b233f9c2ca7956ff132d9d4080de44cc2f5bd07602952ec734a490f628dc3a762ac89d3e733', 'Tir7E7CKI0VaL2HvPJmBVKgmwxTJyKLYgp+jGlXMOUgeFGd7zkgcCUv14+0kjJmDCkPNz98+13HtfTMRHvNjyQ==', '1', 1390916868, 1390916892, 1390920433, 1390916868, 0, 1, 'gravatar', 'Instant'),
(8, 'kilooms', '964946d43918fece2e4fadf349888c8910d11d123cf70a6ea76806b9d2acf7a8d8571deae8aba6c544ee11d85cf19d396e3f03a7959afe28fdc19e8227cc8154', 'S3Rs0iXYBZfcC8JMk63Fo2WfueQTdINTLGsoythlyYACmgU4gQyRUVPSG2BnKmDmjQe1GpD9XoKe4PtL2jp3kw==', 'b5a4971b087ec0518da59df667cde9ee30168c551aafe50fd473a7827abfe5c9e111d6fbade37f34bfd931181d2ed551087d1b683865dea2d258fff4c4cf21bf', 1397506120, 0, 0, 1397506120, 0, 0, 'gravatar', 'Instant'),
(9, 'mysiteu0101dohwhatua', '662a3e7dab741533904ddccb1416b8af7807aa08964a72c5c929f6093d14c8bfca78ce9dd676acfb1abf3cba90f87c9770cadbd13c488b1e6c3765bc08a97ef3', 'rN2vRONuZMU3b+4T1dgFfjKfT9NyehrUlG9yBSu60o3bF0VTuB9gjz+CWpIRsmhVfljpkvFXdiSz59X86nWqyg==', '1', 1397812867, 1397813170, 1397813171, 1397812867, 0, 1, 'gravatar', 'Instant'),
(10, 'femaleusercom', '9b29cc6cf629abd12ef59b0bcd4156538c094627e535f278347de1e637a564f9a2a735eabc8e286cdea248bcaf8e0c5f45031ece6de601d5baf24af8f1a183b6', 'I1MbruMlkzQySq9SoFe9E+ymhyg+vHatgMlW9ef1fWwQrKfwwCYn7I9V/lw4lK1/c8QQcE/RrkXPMuyUCRl8mA==', '1', 1397820656, 1397827090, 1397829598, 1397820656, 0, 1, 'gravatar', 'Instant'),
(11, 'testzonecom', '51271535e86d3534df241d539a82ce7db8f612bbe61f9776c04447c88643f9e8daba73975050ee3c995620c7e3ec1bf3942b8efb6e9adc3b93506366928ee542', 'lhzfiHt6X16WfNX9pP0PxqXQCSWlhEXzFlkIUarXJfSDC4tmlbk2aHMBL6uHkD/eMXi+nPW/qyc1JPfRk4Vpvw==', '1', 1397821709, 1397824454, 1397830374, 1397821709, 0, 1, 'gravatar', 'Instant'),
(12, 'somethingcom', '04913e17255cda80838144a8e4fe96baaddbfdfe7c3a1d2d32af1e52fa01494e959bcac1d0a6b4130503db8da06baf34780e6363cba31a5cbb775d6c643bdcb3', 'zZnk+2BjLjdhrM+QKpVWHYncgRCsNEA3aoap/24ZTxHXWdJuqfgWNnLQ6JvY5rpGk97JrT5/pmCqxyMEIkmRYQ==', '72c8638458bd4afbff29086ee33be5d948b5a8b2e790c95b7de9dcfa8ecd7e91d4d2debe259b3504ff026472bf4236d5afe1ba6e299750ed9667d4add8c854f4', 1397821920, 0, 0, 1397821920, 0, 1, '', 'Instant'),
(17, 'newusercom', 'e8f4ac3bbc080d754faa0f39fceb799249f9cd8e1851eed145ae3ba332d4ca0e4f307db9e156740ae0c058e6ee590ea4f4570360b57f788461bb2b815aa4d22d', 'S4edWqnNbhEXTramlE/UE3tEPfZYE+CS3yCS+CAE74WvyLQfTCy92Fo6vrABZ6zJgrLrpFwJBnMqvsN2rrvhaw==', 'c73ce2b12f47d758f76fe599adcfd7cf525af4cbc03cc32955866dc722c377f16a806e45eeed22184b1e9d6ef200fdc4e5bdcffdc3d45ce9e33b32ce578d4064', 1398240476, 0, 0, 1398240476, 0, 1, NULL, 'Instant');

-- --------------------------------------------------------

--
-- Структура таблицы `yum_usergroup`
--

CREATE TABLE IF NOT EXISTS `yum_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `participants` text,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `yum_usergroup`
--

INSERT INTO `yum_usergroup` (`id`, `owner_id`, `participants`, `title`, `description`) VALUES
(1, 4, '["4"]', 'Public public', 'Somewhere in the space');

-- --------------------------------------------------------

--
-- Структура таблицы `yum_user_group_message`
--

CREATE TABLE IF NOT EXISTS `yum_user_group_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `yum_user_group_message`
--

INSERT INTO `yum_user_group_message` (`id`, `author_id`, `group_id`, `createtime`, `title`, `message`) VALUES
(1, 4, 1, 1398162272, 'First message', 'My test message');

-- --------------------------------------------------------

--
-- Структура таблицы `yum_user_role`
--

CREATE TABLE IF NOT EXISTS `yum_user_role` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yum_user_role`
--

INSERT INTO `yum_user_role` (`user_id`, `role_id`) VALUES
(2, 3),
(13, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
