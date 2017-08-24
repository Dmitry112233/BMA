<!DOCTYPE html>
<html>
   <head>
      <title>Admin - Add express page</title>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   </head>
   <body>
      <h1>ADD EXPRESS FORM</h1>
      <form action="AddMyExpress.spr" method="post">
         <label for="exname">Name: </label><input id="exname" type="text" name="name" placeholder="Invisible to the user"> 
         <br><br>
         <label for="exdata">Data: </label><input id="exdata" type="text" name="date" placeholder="01.01.2017">
         <br><br>
         <label for="exdesc">Desc: </label><textarea rows="7" cols="100" id="exdesc" name="description" placeholder="<br>1. First event description. <br>2. Second event description "></textarea>
         <br><br>
         <input type="submit" value="OK">
      </form>
   </body>
</html>