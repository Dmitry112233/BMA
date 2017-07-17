<!DOCTYPE html>
<html lang="ru">
  <head>
  	<title>BookMaker Aggregator</title>
    <meta charset="utf-8">
    <%@ page contentType="text/html;charset=utf-8" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/main.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
  	<div id="page">
		<div id="header">
            <div class="container">
                <h1>выигрывай на ставках</h1>
            </div>

            <div class="container">
                <div class="n navbar navbar-inverse">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapde-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a href="index.jsp" class="navbar-brand">BKA</a>
                        </div>
    	                <div class="collapse navbar-collapse" id="bs-example-navbar-collapde-1">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="index.jsp">Главная<span class="sr-only"></span></a></li>
    	                        <li><a href="football.jsp">Ставки на футбол</a></li>
    	                        <li><a href="lessons.jsp">Уроки беттинга</a></li>
    	                    </ul>
                        </div>
    	            </div>
                </div>
    	    </div>
	    <div class="container backing">
	      <div class="row">
	        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">Мы помогаем сделать ставки на спорт, которые приведут к выигрышу</div>
	      </div>
	    </div>
	    <div class="container">
	      <div class="row">
	      	<div id="bklist" class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
            <p><strong>Список букмейкеров</strong></p>
            <ol class="bknumlist">
              <li>
                  <div class="tilt">
                      <a href="https://winline.ru" target="_blank"><img src="bootstrap/img/logo_wl.png" width="80" alt="Winline"> на сайт</a>
                  </div>
              </li>
              <li>
                  <div class="tilt">
                      <a href="https://www.leon.ru" target="_blank"><img src="bootstrap/img/logo_leon.png" width="80" alt="Leon"> на сайт</a>
                  </div>
              </li>
              <li>
                  <div class="tilt">
                      <a href="https://www.fonbet.ru" target="_blank"><img src="bootstrap/img/logo_fb.png" width="80" alt="Фонбет"> на сайт</a>
                  </div>
              </li>
            </ol>
	      	</div>
	      	<div id="dayexp" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
            <h2>Экспресс дня</h2>
            <h3>Васко да Гама-РЖ - Сантос | Атлетико-ГО - Атлетико Минейро | Гремио - Понте Прета от Dmitry112233</h3>
            <table border="1" class="dayexptable">
              <tr>
                <td colspan="4"  align="center">Футбол/  Бразилия. Серия A</td>
              </tr>
              <tr>
                <td align="center">1</td>
                <td>Васко да Гама-РЖ - Сантос</td>
                <td align="center">ИТБ2(0.5)</td>
                <td align="center">1.33</td>
              </tr>
              <tr>
                <td align="center">2</td>
                <td>Атлетико-ГО - Атлетико Минейро</td>
                <td align="center">ИТБ2(0.5)</td>
                <td align="center">1.24</td>
              </tr>
              <tr>
                <td align="center">3</td>
                <td>Гремио - Понте Прета</td>
                <td align="center">ИТБ1(0.5)</td>
                <td align="center">1.14</td>
              </tr>
            </table><br>
            <p>Итоговый коэф: 1.88</p>
            <p>Начало события: 22.00 16-07-2017</p><br>
            <p>Доброго времени суток! Футбол. Бразилия.Экспресс на тотал.
              <br>1.По логике Сантос сильнее и не должны проиграть,идёт серия из трьох побед,пропускают мало.
              <br>2.Обе команды в последних играх показывают плохие результаты,хозяева на дне турнирной таблицы, думаю Минейро не проиграет.
              <br>3.Гремиу вырвался из трьохигровой проиграшнной серии в чемпионате, играл на два фронта,одна из более забивных команд лиги.
              <br>Удачи.
            </p>
          </div>
	      </div>
	    </div>
      <div id="footer" class="container">
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">подвал</div>
        </div>
      </div>

	    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	    <!-- Include all compiled plugins (below), or include individual files as needed -->
	    <script src="bootstrap/js/bootstrap.js"></script>
    </div>
  </body>
</html>
