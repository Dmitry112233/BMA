<!DOCTYPE html>
<html>
   <head>
      <title>Admin - Add event page</title>
      <meta name="robots" content="none"/>
      <link rel="shortcut icon" href="../bootstrap/img/favicon_a.ico" type="image/x-icon">
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
      <style>
      	#evname, #evcomp {
      		width: 700px; 
      	}
      </style>
   </head>
   <body>
      <h1>ADD EVENT FORM</h1>
      <form action="AddMyIvent" method="post">
         <label for="evname">Name: </label><input id="evname" type="text" name="name" placeholder="Team A - Team B"> 
         <br><br> 
         <label for="evbet">Bet: </label><input id="evbet" type="text" name="bet" placeholder="P1">
         <br><br> 
         <label for="evdate">Date: </label><input id="evdate" type="text" name="date" placeholder="01.01.2017">
         <br><br> 
         <label for="evcomp">Competition: </label><input id="evcomp" type="text" name="competition"placeholder="Football. Champions league...">
         <br><br> 
         <label for="evcof">Coefficient: </label><input id="evcof" type="text" name="coefficient" placeholder="1.73">
         <br><br> 
         <input type="submit" value="OK">
      </form>
   </body>
</html>