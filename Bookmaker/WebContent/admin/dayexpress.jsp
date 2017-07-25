<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
   <head>
      <title>Expresses of the day</title>
   </head>
   <body>
   	  <form action="admin.jsp" method="POST">
         <button type="submit">Log out</button>
      </form>
      <hr>
      <form action="expressAdd.jsp" method="POST">
         <button type="submit">Add actual express</button>
      </form>
      <br>
      <form action="#" method="POST">
         <button type="submit">Edit current express</button>
      </form>
      <hr>
      <c:import url="../MainList.spr"></c:import>
   </body>
</html>
