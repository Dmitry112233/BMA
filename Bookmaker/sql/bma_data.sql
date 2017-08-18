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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы bma_data.bookmakers: ~7 rows (приблизительно)
/*!40000 ALTER TABLE `bookmakers` DISABLE KEYS */;
INSERT INTO `bookmakers` (`ID`, `NAME`, `LINK`, `IMAGE`) VALUES
	(1, '1xBET', 'https://www.1xbet.com/', 'https://www.1xbet.com/xbet/img/logo.png'),
	(2, 'PariMatch', 'https://www.parimatch.com/', 'https://bookmaker-ratings.ru/wp-content/uploads/2014/12/parimatch-logo-156-1.png'),
	(3, 'Winline', 'https://winline.ru/', 'https://winline.ru/assets/img/logo-header.png'),
	(4, 'Winline', 'https://winline.ru/', 'https://winline.ru/assets/img/logo-header.png'),
	(5, 'Winline', 'https://winline.ru/', 'https://winline.ru/assets/img/logo-header.png'),
	(6, 'Winline', 'https://winline.ru/', 'https://winline.ru/assets/img/logo-header.png'),
	(7, 'Winline', 'https://winline.ru/', 'https://winline.ru/assets/img/logo-header.png');
/*!40000 ALTER TABLE `bookmakers` ENABLE KEYS */;

-- Дамп структуры для таблица bma_data.expresses
CREATE TABLE IF NOT EXISTS `expresses` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) DEFAULT NULL,
  `DATE` date NOT NULL,
  `SOURCE` varchar(200) DEFAULT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы bma_data.expresses: ~8 rows (приблизительно)
/*!40000 ALTER TABLE `expresses` DISABLE KEYS */;
INSERT INTO `expresses` (`ID`, `NAME`, `DATE`, `SOURCE`, `DESCRIPTION`) VALUES
	(1, 'first', '2017-07-15', 'link1', 'OPISANIE:<br>\r\n1) THE BETTER BET YO. Man it\'s realy nice bet, folow me, take attention nigga.<br>\r\n2) IM THE BEST MAN FROM THE BEST WORLD. This bet give you a chacnce to win.<br>\r\n3) YO YO. What r u think about me nigga?<br>'),
	(2, 'second', '2017-07-16', 'link2', 'OPISANIE:<br>\r\n1) THE BETTER BET YO. Man it\'s realy nice bet, folow me, take attention nigga.<br>\r\n2) IM THE BEST MAN FROM THE BEST WORLD. This bet give you a chacnce to win.<br>\r\n3) YO YO. What r u think about me nigga?<br>'),
	(3, 'third', '2017-07-17', 'link3', 'OPISANIE:<br>\r\n1) THE BETTER BET YO. Man it\'s realy nice bet, folow me, take attention nigga.<br>\r\n2) IM THE BEST MAN FROM THE BEST WORLD. This bet give you a chacnce to win.<br>\r\n3) YO YO. What r u think about me nigga?<br>'),
	(4, 'new express for test', '2017-07-23', NULL, 'OPISANIE NAH'),
	(35, 'TEST', '2017-08-03', NULL, '1) Win<br> 2) Win'),
	(36, 'new express 1', '2017-08-09', NULL, '1/Xnj ckexbkjcm c Rfhefyjq d gjcktlytv neht&!!E vtyz ghjcnj ytn ckjd/Rfr nfr vj;yj buhfnm?if[vfnbcne?rjnjhsq gj htqnbyue d[jlbn d gzn`hre?tckb z yt jib,f.cm!!!Buhfk ghjcnj yf ehjdyt nhtnmtuj hfphzlf/Yj ctujlyz yflt.cm jy cj,th`ncz b gjrf;tn ljcnjqye. buhe ghjnbd kblthf nehybhf/Cnfdk. yf ybxm./2/Ghtlgjkj;e?xnj Dbib pfceibn buhe b ,eltn cgjrjqyfz ybxtqrf/3/Tckb d yfxfkt nehybhf Zyxbr ,sk gjcnfdobrjv jxrjd?nj d gjcktlyb[ nh`[ nehf[ jy yf,hfk ldf jxrf!Yflt.cm ctujlyz jy ghjljk;bn edthtyyj buhfnm?b djpvj;yj lf;t j,suhftn Gtnhf Cdblkthf/'),
	(42, '4', '2017-07-17', 'link3', 'OPISANIE:<br>\r\n1) THE BETTER BET YO. Man it\'s realy nice bet, folow me, take attention nigga.<br>\r\n2) IM THE BEST MAN FROM THE BEST WORLD. This bet give you a chacnce to win.<br>\r\n3) YO YO. What r u think about me nigga?<br>'),
	(43, '5', '2017-07-17', 'link3', 'OPISANIE:<br>\r\n1) THE BETTER BET YO. Man it\'s realy nice bet, folow me, take attention nigga.<br>\r\n2) IM THE BEST MAN FROM THE BEST WORLD. This bet give you a chacnce to win.<br>\r\n3) YO YO. What r u think about me nigga?<br>');
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы bma_data.express_ivent: ~18 rows (приблизительно)
/*!40000 ALTER TABLE `express_ivent` DISABLE KEYS */;
INSERT INTO `express_ivent` (`ID`, `IVENTS_ID`, `EXPRESSES_ID`) VALUES
	(1, 1, 1),
	(3, 32, 3),
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
	(32, 34, 36),
	(39, 33, 42),
	(40, 22, 42),
	(41, 1, 43);
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
  `question` varchar(2000) NOT NULL,
  `answer` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы bma_data.questions: ~16 rows (приблизительно)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`ID`, `question`, `answer`) VALUES
	(1, 'Как выбрать букмекера?', 'Подробное <a><b>описание и рейтинг букмекеров</b></a> - составлено на основе объективной оценки по четырем основным критериям: надежность букмекера, \r\nлиния, удобству работы и отношению к профессиональной игре. Все баллы детализированы в описаниях. \r\nСсылки ведут только на разрешенные в РФ сайты букмекерских контор.'),
	(2, 'Как зарегистрироваться?', 'Раcсмотрим на примере регистрации в <a>1xBET</a> по номеру телефона.\r\n<br><br>\r\n<b>1) Переходим на сайт <a>1xBET</a>, в правом верхнем угла кнопка "регистрация".</b><br><br>\r\n<img src="bootstrap/img/registration/registration.jpg"  width="100%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>\r\n<b>2) В появившемся окошке выбираем "по номеру телефона" и указываем свой номер мобильного телефона.</b><br><br>\r\n<img src="bootstrap/img/registration/phone.jpg" width="100%" alt="Упс, картинка временно недоступна, приносим свои извинения">  \r\n<br><br>\r\n<b>3) Данные с вашим логином и паролем отправлены SMS сообщением:</b><br><br>\r\n<img src="bootstrap/img/registration/result.jpg" width="100%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>\r\n<b>4) Осталось только залогиниться, используя Ваш логин и пороль.</b> \r\n<br><br>\r\nИнформацию для регистрации в конкретной букмекерской конторе Вы сможете найти в подробном <a><b>описании букмекеров</b></a>  '),
	(3, 'Как пополнить счет с банковской карты?', 'Рассмотрим на примере поплнения счета в <a>1xBET</a>.\r\n<br><br>\r\n<center><b><span id="bank">Банковская карта</center></b></span>\r\n<br>\r\n<b>1) Для того, чтобы пополнить счёт с помощью банковской карты Вам необходимо зайти на\r\nстраницу пополнения счёта нажав на кнопку «Пополнить» в верхней правой части страницы.</b>\r\n<br><br>\r\n<img src="bootstrap/img/bankCard/popolnit.jpg" width="100%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>\r\n<b>2) В зависимости от типа Вашей карты выберите нужную иконку</b>\r\n<br><br>\r\n<img src="bootstrap/img/bankCard/card.jpg" width="50%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br> \r\n<b>3) Заполните все необходимые поля и нажмите «Пополнить»</b>\r\n<br><br>\r\n<img src="bootstrap/img/bankCard/fields.jpg" width="100%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>\r\n<b>4) Далее Вы будете перенаправлены на платёжную страницу Вашего банка, где Вам нужно\r\nбудет подтвердить платёж. Это нужно для обеспечения безопасности Ваших денежных\r\nсредств.</b>\r\n<br><br>\r\n<b>5) В качестве подтверждения платежа обычно нужно ввести код из смс-сообщения, которое\r\nприходит на телефон, привязанный к Вашей банковской карте.</b>\r\n<br><br>\r\n<img src="bootstrap/img/bankCard/bank.jpg" width="100%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>  \r\n<b>Вскоре Ваш счёт будет пополнен</b>\r\n<br><br>\r\n'),
	(4, 'Как пополнить счет с интернет кошелька?', 'Рассмотрим на примере поплнения счета в <a>1xBET</a>.\r\n<br><br>\r\n<center><b><span id="qiwi">Интернет кошелек</center></b></span>\r\n<br>\r\n<b>1) Для того, чтобы пополнить счёт с кошелька Qiwi, Вам необходимо зайти на страницу\r\nпополнения счёта, нажав на кнопку «Пополнить» в верхней правой части страницы.</b>\r\n<br><br>\r\n<img src="bootstrap/img/qiwi/popolnit.jpg" width="100%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>\r\n<b>2) Выбрать иконку Qiwi, ввести желаемую сумму пополнения, номер телефона и нажать\r\n«Пополнить».</b>\r\n<br><br>\r\n<img src="bootstrap/img/qiwi/qiwi.jpg" width="50%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>\r\n<b>3) Подтвердить платёж.</b>\r\n<br><br>\r\n<img src="bootstrap/img/qiwi/prove.jpg" width="50%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>\r\n<b>4) Далее Вы будете перенаправлены на сайт Qiwi, где будет нужно подтвердить оплату кодом,\r\nкоторый придёт на телефон, привязанный к Вашему кошельку.</b>\r\n<br><br>\r\n<img src="bootstrap/img/qiwi/code.jpg" width="50%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>    \r\n<b>5)  Вскоре Ваш счёт будет пополнен.</b>\r\n<br><br>\r\n<img src="bootstrap/img/qiwi/result.jpg" width="50%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n'),
	(5, 'Как пополнить счет мобильным платежём?', 'Рассмотрим на примере поплнения счета в <a>1xBET</a>.\r\n<br><br>\r\n<center><b><span id="qiwi">Мобильный платеж</center></b></span>\r\n<br>\r\n<b>1) Для того, чтобы пополнить счёт с помощью мобильного телефона, Вам необходимо зайти\r\nна страницу пополнения счёта, нажав на кнопку «Пополнить» в верхней правой части страницы.</b>\r\n<br><br>\r\n<img src="bootstrap/img/mobile/popolnit.jpg" width="100%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>\r\n<b>2) Далее, в зависимости от Вашего мобильного оператора, нужно выбрать иконку.</b>\r\n<br><br>\r\n<img src="bootstrap/img/mobile/2.jpg" width="50%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>\r\n<b>Ввести желаемую сумму пополнения, номер телефона и нажать «Подтвердить»</b>\r\n<br><br>\r\n<img src="bootstrap/img/mobile/2-1.jpg" width="50%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>\r\n<b>3) На ваш номер телефона поступит сообщение, где нужно будет подтвердить списание\r\nсредств со счёта мобильного.</b>\r\n<br><br>\r\n<img src="bootstrap/img/mobile/3.jpg" width="50%" alt="Упс, картинка временно недоступна, приносим свои извинения">\r\n<br><br>\r\n<b>5)  Вскоре Ваш счёт будет пополнен.</b>\r\n<br><br>\r\n<img src="bootstrap/img/mobile/result.jpg" width="50%" alt="Упс, картинка временно недоступна, приносим свои извинения">'),
	(6, 'Как сделать ставку?', ''),
	(7, 'Как узнать результат ставки?', ''),
	(8, 'Как снять деньги?', ''),
	(9, 'Основные термины, используемые букмекерскими конторами.', '<ul>\r\n<li><b>Ставка</b> – деньги, с помощью которых вы заключаете пари на какое-либо событие, на которое букмекерской конторой выставлен коэффициент.</li>\r\n<li><b>Коэффициент</b> – числовое измерение вероятности наступления события, его выставляют букмекеры. Как правило, он бывает дробным и десятичным – этот вид более привычный и понятный нам.</li>\r\n<li><b>Исход</b> – результат события, который рассчитан букмекерской конторой.</li>\r\n<li><b>Выигрыш</b> – та сумма, которая начисляется на ваш счет в букмекерской конторе в случае, если ваша ставка оказалась верной, т.е. событие, на которое вы заключили пари,  произошло.</li>\r\n<li><b>Проигрыш</b> – та сумма, которую вы теряете  если  ваша ставка оказалась неверной, т.е. событие, на которое вы заключили пари,  не произошло.</li>\r\n<li><b>Ординар</b> – одиночная ставка, т.е. ставка на одно событие.  В случае выигрыша, ставка рассчитывается как произведение суммы вашей ставки на предложенный коэффициент. \r\nНапример, вы поставили 2 доллара на событие, оцененное букмекером коэффициентом 1,9. В случае выигрыша, сумма, на которую пополнится ваш счет будет 3,8 доллара, \r\nчистая прибыль 3,8 – 2 (сумма ставки)= 1,8 доллара.</li>\r\n<li><b>Экспресс</b> –  комбинирование одиночных ставок – ординаров на исходы нескольких событий. Для экспресса  можно выбрать любые события, которые не зависят друг от друга. \r\nКоэффициент по экспрессу будет равен произведению коэффициентов на те события, которые вы выбрали. Для выигрыша по экспрессу необходимо чтобы все входящие в него события были не проиграны \r\n(т.е. если по какому-то событию будет возврат с коэффициентом 1, то это будет считаться выигрышем). Если хотя бы 1 из событий, объединенных в экспресс, проиграет, то весь экспресс \r\nсчитается проигранным.</li>\r\n<li><b>Линия букмекерской конторы</b> – это список оценок (котировок) спортивных событий. Каждому игроку важно понимать, что эти оценки выставляются на основе различных \r\nпараметров, но ни в коем случае не известно как пойдет дело в реальной встрече в реальном времени, нередки случаи когда проигрывают заведомо \r\nболее сильные и мастеровитые спортсмены.</li>\r\n<li><b>Маржа</b> букмекерской конторы – прибыль, закладываемая букмекером в предлагаемые коэффициенты. Например, William’s Hill, выставляя в футбольном\r\nматче на событие четное/нечетное количество голов  коэффициенты 1,91/1,91 в каждый коэффициент закладывает свою маржу 4,5%.</li>\r\n</ul>'),
	(10, 'Основные варианты исходов ставок и их обозначения.', '<ul>\r\n<li><b>1</b> – победа первой команды.</li>\r\n<li><b>Х</b> – ничья.</li>\r\n<li><b>2</b> – победа второй команды.</li>\r\n<li><b>1Х</b> – победа первой команды или ничья.</li>\r\n<li><b>Х2</b> – победа второй команды или ничья.</li>\r\n<li><b>12</b> – победа 1 или 2 команды, если будет ничья, то ставка проиграна.</li>\r\n<li><b>Ф1</b> – фора относится только к голам первой команды.</li>\r\n<li><b>Ф2</b> – фора относится только к голам второй команды.</li>\r\n<li><b>Тб 2,5</b> — тотал забитых голов в матче больше 2,5 голов.</li>\r\n<li><b>Тм 3</b> - тотал забитых голов в матче меньше 3 голов.</li>\r\n<li><b>Итб1 (1,5)</b> - индивидуальный тотал, означающий общее количество забитых голов первой командой больше величины, указанной в скобках (в нашем примере — больше 1,5).</li>\r\n<li><b>Итм2 (2,5)</b> — индивидуальный тотал, означающий общее количество забитых голов второй командой (в нашем примере — меньше 2,5).</li>\r\n<li><b>Расчет ставки с форой (гандикапом).</b> После обозначения форы Ф и указания на кого (1или2) идет указание того, какая фора. Она может быть со знаками «+» или «-». «+» означает, \r\nчто следующее за ним число надо прибавить к счету со стороны той команды, на которую стоит фора, «-» соответственно отнять эту фору. Например, возьмем выдуманный матч Зенит — Волга.\r\nФ1 (-1,5) – ставка на то, что 1-я команда (в данном случае, Зенит) выиграет с разницей 2 и больше мячей. Т.е. допустим, что итоговый результат  3:1, то мы от мячей первой команды (от 3) \r\nвычитаем 1,5, получаем счет 1,5:1 – по нему первая команда выигрывает, значит и ваша ставка тоже выигрывает. Аналогично счет 2:0, 3:0, 4:2 и т.д. для этой ставки нас устраивает. \r\nАналогично если бы у нас была ставка Ф2 (+1,5) , то к голам второй команды вам надо будет прибавить 1,5, если полученный результат будет верным (в  нашем примере подошел бы счет, например, 2:1), \r\nто и ваша ставка будет выигрышной. Таким образом, в данном примере, ставки Ф1(-1,5) и Ф2(+1,5) – идентичны.</li>\r\n\r\n<li><b>Азиатская фора (азиатский гандикап).</b> Фора, кратная 0,25. Принимая такую ставку, фактически букмекер принимает 2 ставки, например Ф (+1,25) разбивается на Ф (+1)и Ф (+1,5),\r\nсоответственно, на каждую из фор идет половина суммы ставки. Результатом может быть выигрыш/ проигрыш по обеим ставкам, а также можно одну ставку выиграть, а по другой получить возврат.</li>\r\n\r\n<li><b>Тотал (от английского total – общий, суммарный)</b> – общее за матч количество забитых голов, шайб и т.п.  У каждой букмекерской конторы свои правила подсчета тоталов – в некоторых \r\nсчитается только голы (шайбы и т.п.), забитые в основное время, в некоторых учитывается все, что было забито и в добавленное время. При подсчете количества голов в футбольных матчах счет \r\n0:0 считается четным.</li>\r\n</ul>');
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
