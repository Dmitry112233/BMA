<!DOCTYPE html>
<html>
   <head>
      <title>Admin - Add event page</title>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   </head>
   <body>
      <h1>ADD EVENT FORM</h1>
      <form action="AddMyIvent.spr" method="post">
         <label for="evname">Name: </label><textarea id="evname" rows="1" cols="100" name="name" placeholder="Team A - Team B"></textarea> 
         <br><br> 
         <label for="evbet">Bet: </label><input id="evbet" type="text" name="bet" placeholder="P1">
         <br><br> 
         <label for="evdate">Date: </label><input id="evdate" type="text" name="date" placeholder="01.01.2017">
         <br><br> 
         <label for="evcomp">Competition: </label><textarea id="evcomp" rows="1" cols="100" name="competition"placeholder="Football. Champions league..."></textarea>
         <br><br> 
         <label for="evcof">Coefficient: </label><input id="evcof" type="text" name="coefficient" placeholder="1.73">
         <br><br> 
         <input type="submit" value="OK">
      </form>
   </body>
</html>