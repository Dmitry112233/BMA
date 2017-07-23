<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
   <head>
      <title>Expresses of the day</title>
   </head>
   <body>
   	  <form action="admin.jsp" method="POST">
         <button type="submit">Log out</button>
      </form>
      <hr>   
      <h2>Express of the day</h2>
      <form action="expressAdd.jsp" method="POST">
         <button type="submit">Add new express</button>
      </form>
      <hr>
      <h3>express name</h3>
      <table border="1">
         <tr>
            <td colspan="4">sport/chempionship</td>
         </tr>
         <tr>
            <td>1</td>
            <td>event</td>
            <td>prediction</td>
            <td>kef</td>
         </tr>
         <tr>
            <td>2</td>
            <td>event</td>
            <td>prediction</td>
            <td>kef</td>
         </tr>
         <tr>
            <td>3</td>
            <td>event</td>
            <td>prediction</td>
            <td>kef</td>
         </tr>
      </table>
      <br>
      <p>global kef</p>
      <p>event starts</p>
      <br>
      <p>discription   </p>
      <form action="#" method="POST">
         <button type="submit">Edit</button>
      </form>
      <br>
      <form action="#" method="POST">
         <button type="submit">Delete</button>
      </form>
      <hr>
      <p>The number of entries depends on the content of the database (need a cycle)</p>
      <hr>
   </body>
</html>
