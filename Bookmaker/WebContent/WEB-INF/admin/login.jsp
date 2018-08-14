<!DOCTYPE html>
<html>
   <head>
      <title>Admin - Authorization</title>
      <meta name="robots" content="none"/>
      <link rel="shortcut icon" href="/Static/bootstrap/img/favicon_a.ico" type="image/x-icon">
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   </head>
   <body>
      <h1>Administrator authorization</h1>
      ${message}
      <br>
      <form action = "Authenticate" method = "post">
         <label for="login">Login: </label><input id="login" type = "text" name = "login"> 
         <br><br>
         <label for="pass">Password: </label><input id="pass" type = "password" name = "password">
         <br><br>
         <input type = "submit" value="OK">
      </form>
   </body>
</html>