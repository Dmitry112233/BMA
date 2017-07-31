<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<center>
		<h1>ACTUALY EXPRESS</h1>
	</center>
	<center>
		<br>ExpressName: ${myExpress.name} / ${myExpress.date}
	</center>
	<center><br>${myExpress.description}</center>
	<center>
		<form action="AddMyIvent.spr" method="post">
			Name: <input type="text" name="name"> <br> 
			Bet: <input type="text" name="bet"><br>
			Date: <input type="text" name="date"><br>
			Competition: <input type="text" name="competition"><br>
			Coefficient: <input type="text" name="coefficient"><br>
			<input type="submit" value="AddMyEvent">
		</form>
	</center>

</body>
</html>