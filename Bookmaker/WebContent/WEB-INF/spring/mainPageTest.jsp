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

	<h1>BOOKMAKER</h1>
	<table>
		<tr>
			<td>Name</td>
			<td>(link)</td>
		</tr>

		<c:forEach var="bookmaker" items="${bookmakerList}">
			<tr>
				<td>${bookmaker.name}</td>
				<td><a href="${bookmaker.link}">google</a></td>
			</tr>
		</c:forEach>
	</table>


	<h1>MY EXPRESS</h1>
	<br>ExpressName: ${myExpress.name}
	<br>ExpressDate: ${myExpress.date}
	<br>ExpressSource: ${myExpress.source}
	<br>
	<table>
		<tr>
			<td>Name</td>
			<td>Bet</td>
			<td>Date</td>
			<td>Competition</td>
		</tr>
		<c:forEach var="ivent" items="${myExpress.iventList}">
			<tr>
				<td>${ivent.name}</td>
				<td>${ivent.bet}</td>
				<td>${ivent.date}</td>
				<td>${ivent.competition}</td>
			</tr>
			<b>DESCRIBTION:</b> <br> 
		</c:forEach>
	</table>


	<h1>ALL EXPRESS</h1>
	<c:forEach var="express" items="${expressList}">
		<br>ExpressName: ${express.name}  
		<br>ExpressDate: ${express.date} 
		<br>ExpressSource: ${express.source}
		<br>
		<table>
			<tr>
				<td>Name</td>
				<td>Bet</td>
				<td>Date</td>
				<td>Competition</td>
			</tr>
			<c:forEach var="ivent" items="${express.iventList}">
				<tr>
					<td>${ivent.name}</td>
					<td>${ivent.bet}</td>
					<td>${ivent.date}</td>
					<td>${ivent.competition}</td>
				</tr>
			</c:forEach>
		</table>
		<b>DESCRIBTION:</b> <br>
	</c:forEach>
</body>
</html>