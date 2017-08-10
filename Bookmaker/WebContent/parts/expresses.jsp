<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="allExp" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
	<h2>Все экспрессы</h2>
	<br>
	<!-- вывод экспрессов в цикле -->
	<c:forEach var="express" items="${expressList}">
		<p>Экспресс. Дата начала: ${express.date}</p>
		<table class="dayexptable">
			<!-- переменная для увеличивающегося номера строки в таблице с эвентами -->
			<c:set var="tableRow" value="0" />
			<c:forEach var="ivent" items="${express.iventList}">
				<tr class="mainLine">
					<td colspan="4">&nbsp;${ivent.competition}</td>
				</tr>
				<tr class="slaveLine">
					<td align="center"><c:out value="${tableRow=tableRow+1}" /></td>
					<td><b>&nbsp;${ivent.name}</b></td>
					<td width="25%" align="center"><b>${ivent.bet}</b></td>
					<td width="25%" align="center"><b>${ivent.coefficient}</b></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<p>Итоговый коэф: <b>${express.resultCoeff}</b></p>
		<p>Описание события: ${express.description}</p>
		<hr>
	</c:forEach>
</div>