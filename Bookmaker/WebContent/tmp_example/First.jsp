<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="test.css">
<title>1-st menu</title>
</head>
<body>
<c:import url="menuTest.jsp">
	<c:param name="firstMenu" value="true"/>
</c:import>
<p>some data from 1-st page</p>
</body>
</html>
