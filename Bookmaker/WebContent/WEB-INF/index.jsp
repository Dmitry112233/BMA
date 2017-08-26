<!DOCTYPE html>
<html lang="ru">
   <head>
      <title>BestBet - Ставка дня</title>
      <link rel="shortcut icon" href="bootstrap/img/favicon.ico" type="image/x-icon">
      <meta charset="utf-8">
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      <c:import url="parts/nav.jsp">
         <c:param name="firstMenu" value="true"/>
      </c:import>
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