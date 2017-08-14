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
	<center>
		<table>
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
	</center>
	<center>
		<br>${myExpress.description}</center> 

	<center>
		<input type="button" value="AddExpress"
			onclick="document.location = 'expressAddPage.jsp'">
	</center>

	<center>
		<input type="button" value="AddEvent"
			onclick="document.location = 'eventAddPage.jsp'">
	</center>

</body>
</html>