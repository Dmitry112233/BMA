<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="DetailsBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="details">
      <h1>Details</h1>
      <br>
      <!-- вывод туров АПЛ в цикле -->			
		<table class="CoeffCompareTable">			
			<c:forEach var="EPLivent" items="${matchesList}">				
				<tr>
					<td>${EPLivent.win1}</td>
					<td>${EPLivent.win2}</td>
					<td>${EPLivent.x}</td>
				</tr>
			</c:forEach>
		</table>	
      <br>
   </div>
</div>