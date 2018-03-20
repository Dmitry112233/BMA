<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="EPLBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="EPL">
      <h1>АПЛ</h1>
      <br>
      <!-- вывод туров АПЛ в цикле -->			
		<table class="EPLtable">			
			<c:forEach var="EPLivent" items="${matchesList}">				
				<tr class="EPLTableLine">
					<td>${EPLivent.date}</td>
					<td>${EPLivent.team1} - ${EPLivent.team2}</td>
					<td><a href="#">перейти на подробности</a></td>										
				</tr>
			</c:forEach>
		</table>	
      <br>
   </div>
</div>