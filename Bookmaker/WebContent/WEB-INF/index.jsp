<!DOCTYPE html>
<html lang="ru">
   <head>
      <!-- теги для индексации -->
      <title>Экспресс дня - лучшая ставка на сегодня</title>      
      <meta name="Description" content="Лучший экспресс на сегодняшний день, подобранный группой аналитиков, напрямую связанных с букмекерами и спортом"/>      
      <meta name="Keywords" content="ставки на спорт букмекеры прогнозы экспресс дня bet лучшая прогноз букмекер футбол теннис хоккей"/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="all"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>
      <meta name="google-site-verification" content="zxpjmOEovT6ZSjOnOYmVyz0q1t-7QcqfxAd41aUkP8M" />
      <!-- конец тегов для индексации -->       
      <link rel="shortcut icon" href="bootstrap/img/favicon.ico" type="image/x-icon">      
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
      <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
      <link href="bootstrap/css/main-${cssVersion}.css" rel="stylesheet">
      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->      
   </head>
   <body>
      <div class="bg"></div>
      <c:import url="parts/nav.jsp">
         <c:param name="firstMenu" value="true"/>
      </c:import>
      <c:import url="parts/topAdBanner.jsp"></c:import>
      <div class="container backing">
         <div class="row">
            <div class="loz" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">Экспресс дня - лучший экспресс на сегодняшний день, подобранный группой аналитиков, напрямую связанных с букмекерами и спортом.</div>
         </div>
      </div>
      <div class="container">
         <div class="row mainHeight">
            <c:import url="parts/bmList.jsp"></c:import>
            <c:import url="parts/dayExpress.jsp"></c:import>
         </div>
      </div>
      <c:import url="parts/footer.jsp"></c:import>
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="bootstrap/js/bootstrap.js"></script>    
   </body>
</html>