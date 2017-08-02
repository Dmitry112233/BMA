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
		<h1>ADD EXPRESS FORM</h1>
	</center>
	<br>
	<center>
		<form action="AddMyExpress.spr" method="post">
			Name: <input type="text" name="name" value=""> <br>
			Date: <input type="text" name="date" value=""><br>
			Description: <input type="text" name="description" value=""><br>
			<input type="submit" value="OK">
		</form>
	</center>

</body>
</html>