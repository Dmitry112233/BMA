<!DOCTYPE html>	
<html lang="ru">
   <head>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <!-- теги для индексации -->
      <title>Сравнение коэффициентов, детали по матчу ${xBetList.get(0).team1}<c:if test = "${xBetList == Null}">${team1}</c:if> - ${xBetList.get(0).team2}<c:if test = "${xBetList == Null}">${team2}</c:if></title>
      <meta name="Description" content="Сравнение коэффициентов, детали по матчу ${xBetList.get(0).team1}<c:if test = "${xBetList == Null}">${team1}</c:if> - ${xBetList.get(0).team2}<c:if test = "${xBetList == Null}">${team2}</c:if> | findbestbet.ru ⚽ Актуальная информация о матчах, коэффициентах и ставках на спорт"/>
      <meta name="Keywords" content=""/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="all"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>
      <!-- конец тегов для индексации -->
      <link rel="shortcut icon" href="/Static/bootstrap/img/favicon.ico" type="image/x-icon">
      <%@ page contentType="text/html;charset=utf-8" %>       
      <link href="/Static/bootstrap/css/bootstrap.css" rel="stylesheet">
      <link href="/Static/bootstrap/css/main-${cssVersion}.css" rel="stylesheet">
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
         <c:param name="eighthMenu" value="true"/>
      </c:import>
      <c:import url="parts/topAdBanner.jsp"></c:import>
      <div class="container backing">
         <div class="pageNameBlock" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
         	<h1>Сравнение коэффициентов, детали по матчу ${xBetList.get(0).team1}<c:if test = "${xBetList == Null}">${team1}</c:if> - ${xBetList.get(0).team2}<c:if test = "${xBetList == Null}">${team2}</c:if></h1>
         </div>
      </div>
      <div class="container">
         <c:import url="parts/bmListMobile.jsp"></c:import>
         <div class="row mainHeight">
            <c:import url="parts/bmList.jsp"></c:import>
            <c:import url="parts/LeagueDetails.jsp"></c:import>
         </div>
      </div>
      <c:import url="parts/footer.jsp"></c:import>
      <c:import url="parts/topButton.jsp"></c:import>
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="/Static/bootstrap/js/bootstrap.js"></script>
   </body>
</html>