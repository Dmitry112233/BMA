<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="allExp" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
	<h2>Все экспрессы</h2>
	<!-- вывод экспрессов в цикле -->
	<c:forEach var="express" items="${expressList}">
		<h3>${express.name} / ${express.date}</h3>
		<table border="1" class="dayexptable">
			<!-- переменная для увеличивающегося номера строки в таблице с эвентами -->
			<c:set var="tableRow" value="0" />
			<c:forEach var="ivent" items="${express.iventList}">
				<tr>
					<td align="center"><c:out value="${tableRow=tableRow+1}" /></td>
					<td>&nbsp;${ivent.competition}</td>
					<td>&nbsp;${ivent.name}</td>
					<td width="15%" align="center">${ivent.bet}</td>
					<td width="15%" align="center">${ivent.coefficient}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<p>Итоговый коэф: ${express.resultCoeff}</p>
		<p>${express.description}</p>
	</c:forEach>
</div>