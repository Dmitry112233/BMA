<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="allExp" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
	<h2>Все экспрессы</h2>
	<br>
	<!-- переменная для вывода полоски над каждым экспрессом, кроме первого -->
	<c:set var="separator" value="false" />
	<!-- вывод экспрессов в цикле -->
	<c:forEach var="express" items="${expressList}">
		<c:if test="${separator != false}">
			<hr>
		</c:if>
		<c:set var="separator" value="true" />
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
					<td width="25%" align="center"><b><fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${ivent.coefficient}" /></b></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<p>Итоговый коэф: <b><fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${express.resultCoeff}" /></b></p>		
		<p>Описание события: ${express.description}</p>		
	</c:forEach>
</div>