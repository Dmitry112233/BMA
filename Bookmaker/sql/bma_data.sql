-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.1.41-community - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных bma_data
CREATE DATABASE IF NOT EXISTS `bma_data` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bma_data`;

-- Дамп структуры для таблица bma_data.bookmakers
CREATE TABLE IF NOT EXISTS `bookmakers` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `LINK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы bma_data.bookmakers: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `bookmakers` DISABLE KEYS */;
INSERT INTO `bookmakers` (`ID`, `NAME`, `LINK`) VALUES
	(1, '1xBET', 'google.com'),
	(2, 'PariMatch', 'google.com'),
	(3, 'WeedLines', 'google.com'),
	(4, 'adsfasf', 'asdfasd');
/*!40000 ALTER TABLE `bookmakers` ENABLE KEYS */;

-- Дамп структуры для таблица bma_data.expresses
CREATE TABLE IF NOT EXISTS `expresses` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) DEFAULT NULL,
  `DATE` date NOT NULL,
  `SOURCE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы bma_data.expresses: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `expresses` DISABLE KEYS */;
INSERT INTO `expresses` (`ID`, `NAME`, `DATE`, `SOURCE`) VALUES
	(1, 'first', '2017-07-15', 'link1'),
	(2, 'second', '2017-07-16', 'link2'),
	(3, 'third', '2017-07-17', 'link3'),
	(4, 'for', '2017-07-23', NULL);
/*!40000 ALTER TABLE `expresses` ENABLE KEYS */;

-- Дамп структуры для таблица bma_data.express_ivent
CREATE TABLE IF NOT EXISTS `express_ivent` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `IVENTS_ID` bigint(255) NOT NULL,
  `EXPRESSES_ID` bigint(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_express_ivent_ivents` (`IVENTS_ID`),
  KEY `FK_express_ivent_expresses` (`EXPRESSES_ID`),
  CONSTRAINT `FK_express_ivent_expresses` FOREIGN KEY (`EXPRESSES_ID`) REFERENCES `expresses` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_express_ivent_ivents` FOREIGN KEY (`IVENTS_ID`) REFERENCES `ivents` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы bma_data.express_ivent: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `express_ivent` DISABLE KEYS */;
INSERT INTO `express_ivent` (`ID`, `IVENTS_ID`, `EXPRESSES_ID`) VALUES
	(1, 1, 1),
	(3, 3, 3),
	(4, 2, 2),
	(5, 4, 4);
/*!40000 ALTER TABLE `express_ivent` ENABLE KEYS */;

-- Дамп структуры для таблица bma_data.ivents
CREATE TABLE IF NOT EXISTS `ivents` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  `BET` varchar(50) NOT NULL,
  `DATE` date NOT NULL,
  `COMPETITION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы bma_data.ivents: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `ivents` DISABLE KEYS */;
INSERT INTO `ivents` (`ID`, `NAME`, `DESCRIPTION`, `BET`, `DATE`, `COMPETITION`) VALUES
	(1, 'MU-RM', 'description1', '1X', '2017-07-15', 'La Liga'),
	(2, 'FCB-ATLETIC', 'description2', '1X', '2017-07-16', 'APL'),
	(3, 'Arsena-City', 'description3', '1X', '2017-07-17', 'Seria A'),
	(4, 'Juve - Milan', 'description4', 'P2', '2017-07-23', 'Seria A');
/*!40000 ALTER TABLE `ivents` ENABLE KEYS */;

-- Дамп структуры для таблица bma_data.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Дамп данных таблицы bma_data.questions: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- Дамп структуры для таблица bma_data.users
CREATE TABLE IF NOT EXISTS `users` (
  `ID` bigint(100) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Дамп данных таблицы bma_data.users: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
