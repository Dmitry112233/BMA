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
CREATE DATABASE IF NOT EXISTS `bma_data` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bma_data`;

-- Дамп структуры для таблица bma_data.bookmakers
CREATE TABLE IF NOT EXISTS `bookmakers` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `LINK` varchar(250) DEFAULT NULL,
  `IMAGE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы bma_data.bookmakers: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `bookmakers` DISABLE KEYS */;
INSERT INTO `bookmakers` (`ID`, `NAME`, `LINK`, `IMAGE`) VALUES
	(1, '1xBET', 'https://www.1xbet.com/', 'https://www.1xbet.com/xbet/img/logo.png'),
	(2, 'PariMatch', 'https://www.parimatch.com/', 'https://bookmaker-ratings.ru/wp-content/uploads/2014/12/parimatch-logo-156-1.png'),
	(3, 'Winline', 'https://winline.ru/', 'https://winline.ru/assets/img/logo-header.png');
/*!40000 ALTER TABLE `bookmakers` ENABLE KEYS */;

-- Дамп структуры для таблица bma_data.expresses
CREATE TABLE IF NOT EXISTS `expresses` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) DEFAULT NULL,
  `DATE` date NOT NULL,
  `SOURCE` varchar(200) DEFAULT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы bma_data.expresses: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `expresses` DISABLE KEYS */;
INSERT INTO `expresses` (`ID`, `NAME`, `DATE`, `SOURCE`, `DESCRIPTION`) VALUES
	(1, 'first', '2017-07-15', 'link1', 'OPISANIE:<br>\r\n1) THE BETTER BET YO. Man it\'s realy nice bet, folow me, take attention nigga.<br>\r\n2) IM THE BEST MAN FROM THE BEST WORLD. This bet give you a chacnce to win.<br>\r\n3) YO YO. What r u think about me nigga?<br>'),
	(2, 'second', '2017-07-16', 'link2', 'OPISANIE:<br>\r\n1) THE BETTER BET YO. Man it\'s realy nice bet, folow me, take attention nigga.<br>\r\n2) IM THE BEST MAN FROM THE BEST WORLD. This bet give you a chacnce to win.<br>\r\n3) YO YO. What r u think about me nigga?<br>'),
	(3, 'third', '2017-07-17', 'link3', 'OPISANIE:<br>\r\n1) THE BETTER BET YO. Man it\'s realy nice bet, folow me, take attention nigga.<br>\r\n2) IM THE BEST MAN FROM THE BEST WORLD. This bet give you a chacnce to win.<br>\r\n3) YO YO. What r u think about me nigga?<br>'),
	(4, 'new express for test', '2017-07-23', NULL, 'OPISANIE NAH'),
	(35, 'TEST', '2017-08-03', NULL, '1) Win<br> 2) Win'),
	(36, 'new express 1', '2017-08-09', NULL, '1/Xnj ckexbkjcm c Rfhefyjq d gjcktlytv neht&!!E vtyz ghjcnj ytn ckjd/Rfr nfr vj;yj buhfnm?if[vfnbcne?rjnjhsq gj htqnbyue d[jlbn d gzn`hre?tckb z yt jib,f.cm!!!Buhfk ghjcnj yf ehjdyt nhtnmtuj hfphzlf/Yj ctujlyz yflt.cm jy cj,th`ncz b gjrf;tn ljcnjqye. buhe ghjnbd kblthf nehybhf/Cnfdk. yf ybxm./2/Ghtlgjkj;e?xnj Dbib pfceibn buhe b ,eltn cgjrjqyfz ybxtqrf/3/Tckb d yfxfkt nehybhf Zyxbr ,sk gjcnfdobrjv jxrjd?nj d gjcktlyb[ nh`[ nehf[ jy yf,hfk ldf jxrf!Yflt.cm ctujlyz jy ghjljk;bn edthtyyj buhfnm?b djpvj;yj lf;t j,suhftn Gtnhf Cdblkthf/');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы bma_data.express_ivent: ~15 rows (приблизительно)
/*!40000 ALTER TABLE `express_ivent` DISABLE KEYS */;
INSERT INTO `express_ivent` (`ID`, `IVENTS_ID`, `EXPRESSES_ID`) VALUES
	(1, 1, 1),
	(3, 3, 3),
	(4, 2, 2),
	(5, 4, 4),
	(6, 1, 4),
	(7, 2, 4),
	(11, 2, 1),
	(19, 20, 4),
	(20, 21, 4),
	(21, 22, 4),
	(28, 30, 35),
	(29, 31, 35),
	(30, 32, 35),
	(31, 33, 36),
	(32, 34, 36);
/*!40000 ALTER TABLE `express_ivent` ENABLE KEYS */;

-- Дамп структуры для таблица bma_data.ivents
CREATE TABLE IF NOT EXISTS `ivents` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  `BET` varchar(50) NOT NULL,
  `DATE` date NOT NULL,
  `COMPETITION` varchar(2000) DEFAULT NULL,
  `COEFFICIENT` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы bma_data.ivents: ~12 rows (приблизительно)
/*!40000 ALTER TABLE `ivents` DISABLE KEYS */;
INSERT INTO `ivents` (`ID`, `NAME`, `DESCRIPTION`, `BET`, `DATE`, `COMPETITION`, `COEFFICIENT`) VALUES
	(1, 'MU-RM', 'description1', '1X', '2017-07-15', 'Football / La Liga', 1.1),
	(2, 'FCB-ATLETIC', 'description2', '1X', '2017-07-16', 'Football / APL', 3),
	(3, 'Arsena-City', 'description3', '1X', '2017-07-17', 'Football / Seria A', 1),
	(4, 'Juve - Milan', 'description4', 'P2', '2017-07-23', 'Football / Seria A', 2.2),
	(20, 'TEST', NULL, '1P', '2017-08-02', 'APL', 1.6),
	(21, 'TEST2', NULL, '1P', '2017-08-01', 'APL', 1.4),
	(22, 'go', 'go', '1X', '2017-08-03', 'APL', 1.2),
	(30, 'TEST', NULL, '1P', '2017-08-04', 'APL', 1.4),
	(31, 'TEST2', NULL, '1P', '2017-08-04', 'APL', 1.9),
	(32, 'art_test', NULL, '1x', '2015-08-08', 'lohi kakieto', 1.5),
	(33, 'evil geniuses - team empire', NULL, 'P1', '2015-08-08', 'Kibersport/ Dota 2. The International. Play-off (match is 3 maps).', 1.2),
	(34, 'super drochers - mega soski', NULL, '3x', '2015-08-08', 'Kibersport/ Dota 2. The International. Play-off (match is 3 maps).', 1.5);
/*!40000 ALTER TABLE `ivents` ENABLE KEYS */;

-- Дамп структуры для таблица bma_data.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `question` varchar(50) NOT NULL,
  `answer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы bma_data.questions: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`ID`, `question`, `answer`) VALUES
	(1, 'ываывавыа', 'ываываыв'),
	(2, 'asdfadsf', 'adsfasdf'),
	(3, 'adsfa', 'asdfa');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- Дамп структуры для таблица bma_data.users
CREATE TABLE IF NOT EXISTS `users` (
  `ID` bigint(100) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы bma_data.users: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`ID`, `LOGIN`, `PASSWORD`) VALUES
	(1, 'Admin', '123123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
