<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="test.css">
<title>1-st menu</title>
</head>

<body>
<c:import url="/test/menuTest.jsp">
	<c:param name="fistMenu" value="true"/>
</c:import>

some data from 1-st page

</body>
</html>