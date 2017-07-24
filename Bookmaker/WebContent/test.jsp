<!DOCTYPE html>
<html lang="ru">
   <head>
      <title>test</title>
      <meta charset="utf-8">
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
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
   <br><br><br><br>
   <h3><a href="MainList.spr">MainPageTest</a><h3>
   <h3><a href="FootballExpressesList.spr">FootballExpressTest</a><h3>
   <h3><a href="QuestionList.spr">Questions</a><h3>
   
   
      <div class="container">
         <div class="row">
            <c:import url="parts/bmList.jsp"></c:import>          
         </div>
      </div>
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="bootstrap/js/bootstrap.js"></script>    
   </body>
</html>