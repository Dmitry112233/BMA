<!DOCTYPE html>	
<html lang="ru">
   <head>
      <!-- теги для индексации -->
      <title>Новости спорта - футбол, хоккей, теннис, баскетбол</title>
      <meta name="Description" content="Самые свежие новости мирового спорта с обзорами и фото"/>
      <meta name="Keywords" content="последние новости спорт футбол теннис хоккей баскетбол фигурное катание"/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="all"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>
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
         <c:param name="fifthMenu" value="true"/>
      </c:import>
      <c:import url="parts/topAdBanner.jsp"></c:import>
      <div class="container backing">
         <div class="row">
            <div class="loz" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">Самые свежие новости мирового спорта.</div>
         </div>
      </div>
      <div class="container">
         <div class="row mainHeight">
            <c:import url="parts/bmList.jsp"></c:import>
            <c:import url="parts/newsBlock.jsp"></c:import>
         </div>
      </div>
      <c:import url="parts/footer.jsp"></c:import>
      <c:import url="parts/topButton.jsp"></c:import>
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="bootstrap/js/bootstrap.js"></script>
   </body>
</html>