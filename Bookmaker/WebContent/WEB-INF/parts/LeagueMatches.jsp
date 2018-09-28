<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="LeagueMatchesBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="LeagueMatches">      
      <br>
      <a class="BackButton" href="${contextPath}/competishions"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Другие чемпионаты</a>
      <br>
      <c:if test="${matchesList.size() > 0}">         
         <br>
         <!-- вывод актуальных событий соревнования в цикле -->			
         <table class="LeagueMatchesTable">
            <c:forEach var="leagueEvent" items="${matchesList}">
               <tr onclick="window.location.href='${contextPath}/${leagueEvent.url}'; return false">
                  <td><fmt:formatDate pattern = "dd.MM.yyyy | HH:mm" value = "${leagueEvent.date}" /> МСК</td>
                  <td><b>${leagueEvent.team1}</b> (${leagueEvent.win1})</td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${leagueEvent.team1}.png" onerror="this.style.display='none'"></td>
                  <td>ничья: ${leagueEvent.x}</td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${leagueEvent.team2}.png" onerror="this.style.display='none'"></td>
                  <td>(${leagueEvent.win2}) <b>${leagueEvent.team2}</b></td>
                  <td><a class="toDetailsButton" href="${contextPath}/${leagueEvent.url}">Подробности</a></td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${leagueEvent.team1}.png" onerror="this.style.display='none'"> ${leagueEvent.team1} - <img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${leagueEvent.team2}.png" onerror="this.style.display='none'"> ${leagueEvent.team2}</td>                  
               </tr>
            </c:forEach>
         </table>         
      </c:if>
      <c:if test="${matchesList.size() == NULL}">         
         <br>
         <p class="DataMissed">Соревнование не проходит в данный момент либо данные отсутствуют из-за технических проблем.</p>
      </c:if>
      <br>
      	<div class="article">${League_Txt}</div>
      <br>
   </div>   
</div>