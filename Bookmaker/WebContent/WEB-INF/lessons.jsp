<!DOCTYPE html>	
<html lang="ru">
   <head>
      <!-- теги для индексации -->
      <title>Ответы на Ваши вопросы, которые помогут начать играть и выигрывать</title>      
      <meta name="Description" content="Ответы на Ваши вопросы про ставки на спорт. Оптимальные стратегии по ставкам. Стабильный выигрыш на ставках."/>      
      <meta name="Keywords" content="ставки спорт вопросы ответы букмекеры прогнозы экспрессы bet коэффициент регистрация выигрыш деньги карточка исход ординар информация знания теория FAQ"/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="all"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>
      <!-- конец тегов для индексации -->
      <link rel="shortcut icon" href="bootstrap/img/favicon.ico" type="image/x-icon">
      <meta charset="utf-8">
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">      
      <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
      <link href="bootstrap/css/main-${cssVersion}.css" rel="stylesheet">
      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
   </head>
   <body class="bgimage">   
      <c:import url="parts/nav.jsp">
         <c:param name="therdMenu" value="true"/>
      </c:import>
      <div class="container backing">
         <div class="row">
            <div class="loz" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">Найдите ответы на Ваши вопросы. Подберите оптимальную стратегию по ставкам. Начните стабильно выигрывать на ставках.</div>
         </div>
      </div>
      <div class="container">
         <div class="row mainHeight">
            <c:import url="parts/bmList.jsp"></c:import>            
            <c:import url="parts/textLessons.jsp"></c:import>
         </div>
      </div>
      <c:import url="parts/footer.jsp"></c:import>
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="bootstrap/js/bootstrap.js"></script>
   </body>
</html>