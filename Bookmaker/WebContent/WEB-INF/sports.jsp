<!DOCTYPE html>	
<html lang="ru">
   <head>
      <!-- теги для индексации -->
      <title>${Competishions_D}</title>
      <meta name="Description" content="${Bookmakers_D}"/>
      <meta name="Keywords" content=""/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="all"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>
      <!-- конец тегов для индексации -->
      <link rel="shortcut icon" href="/Static/bootstrap/img/favicon.ico" type="image/x-icon">
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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
         <c:param name="noneMenu" value="true"/>
      </c:import>      
      <c:import url="parts/topAdBanner.jsp"></c:import>
      <div class="container backing">
         <div class="pageNameBlock" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
         	<h1>${Competishions_H1}</h1>
         </div>
      </div>
      <div class="container">
         <div class="row mainHeight">
            <c:import url="parts/bmList.jsp"></c:import>
            <c:import url="parts/sportsPart.jsp"></c:import>
         </div>
      </div>
      <c:import url="parts/footer.jsp"></c:import>
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="/Static/bootstrap/js/bootstrap.js"></script>    
   </body>
</html>