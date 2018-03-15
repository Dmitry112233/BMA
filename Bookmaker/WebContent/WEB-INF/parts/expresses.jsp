<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="allExp" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
	<h1>Все экспрессы</h1>
	<br>
	<!-- переменная для вывода полоски над каждым экспрессом, кроме первого -->
	<c:set var="separator" value="false" />
	<!-- вывод экспрессов в цикле -->
	<c:forEach var="express" items="${expressList}">
		<c:if test="${separator != false}">
			<hr>
		</c:if>
		<c:set var="separator" value="true" />
		<div>
			<p>Экспресс. Дата начала: <b>${express.dateStr}</b></p>
		</div>
		
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
		<div class="dataSourse">
			<p>Источник: <a rel="nofollow" target="_blank" href="${express.source}">vprognoze.ru</a></p>
		</div>		
		<div>
			<p>Итоговый коэффициент: <b><fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${express.resultCoeff}" /></b></p>
		</div>
		<div id="randomBK">			
		   <!-- количество букмекеров c учетом веса -->
		   <c:set var="countBK" value="${BookmakerWeightList.size()}" />
		   <!-- лучший ID -->
		   <jsp:useBean id="random" class="java.util.Random" scope="application"/>		   
		   <c:set var="randID">${random.nextInt(countBK)}</c:set>
		   <!-- вывод лучшего БК -->
		   <p>Наилучший коэффициент у </p> 
           <a rel="nofollow" href="Counter.spr?id=${BookmakerWeightList.get(randID).bookMakerId}" target="_blank"><img src="${BookmakerWeightList.get(randID).image}" alt="${BookmakerWeightList.get(randID).name} logo"></a>           
		</div>		
		<div class="expDesc">
			<input type="checkbox" id="hd-${express.expressID}" class="hide"/>
			<label for="hd-${express.expressID}" >Описание события</label>
			<div>${express.description}</div>
		</div>		
	</c:forEach>
</div>