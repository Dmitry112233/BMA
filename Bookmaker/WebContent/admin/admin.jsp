<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
   <head>
      <title>Authorization</title>
   </head>
   <body>
      <form action="dayexpress.jsp" method="POST">
         <p>
            <label for="login">Username:</label>
            <input type="text" name="login" id="login">
         </p>
         <p>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password">
         </p>
         <p>
            <button type="submit">Log in</button>
         </p>
      </form>
   </body>
</html>
