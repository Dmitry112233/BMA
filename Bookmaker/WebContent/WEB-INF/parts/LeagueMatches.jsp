<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="EPLBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="EPL">
      <h1>АПЛ</h1>
      <br>
      <!-- вывод туров АПЛ в цикле -->			
		<table class="EPLtable">			
			<c:forEach var="EPLivent" items="${matchesList}">				
				<tr>
					<td>${EPLivent.dateStr}</td>
					<td>${EPLivent.team1}</td>
					<td>-</td>
					<td> ${EPLivent.team2}</td>
					<td><a href="PremierLeagueDetailsList.spr">перейти на подробности</a> <a href="PremierLeague/{team1}/{team2}/details.spr">testing</a></td>										
				</tr>
			</c:forEach>
		</table>	
      <br>
   </div>
</div>