<!DOCTYPE html>
<html>
   <head>
      <title>Admin - Actual express</title>
      <link rel="shortcut icon" href="../bootstrap/img/favicon_a.ico" type="image/x-icon">
      <meta charset="utf-8">
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <style>
         td {
         padding: 7px;
         }
         table {
         width: 70%;
         }
      </style>
   </head>
   <body>
      <h1>ACTUAL EXPRESS</h1>
      <p>ExpressName: ${myExpress.name}</p>
      <p>ExpressData: ${myExpress.date}</p>
      <table border="1">
         <tr>
            <td>Name</td>
            <td>Bet</td>
            <td>Date</td>
            <td>Competition</td>
            <td>Coefficient</td>
         </tr>
         <c:forEach var="ivent" items="${myExpress.iventList}">
            <tr>
               <td>${ivent.name}</td>
               <td>${ivent.bet}</td>
               <td>${ivent.date}</td>
               <td>${ivent.competition}</td>
               <td>${ivent.coefficient}</td>
            </tr>
         </c:forEach>
      </table>
      <p>${myExpress.description}</p>
      <form action=MyExpressForm.spr method = "post">
         <input type="submit" value="Add Express">
      </form>
      <br>
      <form action=MyIventForm.spr method = "post">
         <input type="submit" value="Add Events">
      </form>
   </body>
</html>