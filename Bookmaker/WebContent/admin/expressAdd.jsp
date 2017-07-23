<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
   <head>
      <title>Replase express</title>
   </head>
   <body>   
      <form action="admin.jsp" method="POST">
         <button type="submit">Log out</button>
      </form>
      <hr>
      <h2>Add new express of the day</h2>
     
      <form action="dayexpress.jsp" method="POST">
         <p>
            <label>express name:</label>
            <input type="text">
         </p>
         <p>
            <label>sport:</label>
            <input type="text">
            <label>championship:</label>
            <input type="text">
         </p>
         <p>
            <label>event 1:</label>
            <input type="text">
            <label>predoction 1:</label>
            <input type="text">
            <label>kef 1:</label>
            <input type="text">
         </p>
         <p>
            <label>event 2:</label>
            <input type="text">
            <label>predoction 2:</label>
            <input type="text">
            <label>kef 2:</label>
            <input type="text">
         </p>
         <p>
            <label>event 3:</label>
            <input type="text">
            <label>predoction 3:</label>
            <input type="text">
            <label>kef 3:</label>
            <input type="text">
         </p>
         <p>
            <label>event 4:</label>
            <input type="text">
            <label>predoction 4:</label>
            <input type="text">
            <label>kef 4:</label>
            <input type="text">
         </p>
         <p>
            <label>event 5:</label>
            <input type="text">
            <label>predoction 5:</label>
            <input type="text">
            <label>kef 5:</label>
            <input type="text">
         </p>
         <p>
            <label>start time:</label>
            <input type="text">
         </p>
         <p>
            <label>discription:</label>
            <input type="text">
         </p>
         <p>
            <button type="submit">Save changes</button>
         </p>
      </form>
   </body>
</html>
