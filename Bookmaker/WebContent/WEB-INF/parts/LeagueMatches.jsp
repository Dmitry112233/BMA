<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="EPLBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="EPL">
      <h2>АПЛ</h2>
      <br>
      <!-- вывод туров АПЛ в цикле -->
	<c:forEach var="express" items="${matchesList}">		
		<table class="dayexptable">
			<!-- переменная для увеличивающегося номера строки в таблице с эвентами -->
			<c:set var="tableRow" value="0" />
			<c:forEach var="ivent" items="${express.iventList}">
				<tr class="mainLine">
					<td colspan="4"><img class="sportIcon" src="${ivent.sportIcon}">&nbsp;${ivent.competition}</td>
				</tr>
				<tr class="slaveLine">
					<td width="5%" align="center"><c:out value="${tableRow=tableRow+1}" /></td>
					<td width="45%"><b>&nbsp;${ivent.name}</b></td>
					<td width="25%" align="center"><b>${ivent.bet}</b></td>
					<td width="25%" align="center"><b><fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${ivent.coefficient}" /></b></td>
				</tr>
			</c:forEach>
		</table>
	</c:forEach>     
      <br>
   </div>
</div>