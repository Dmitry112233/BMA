<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="LeagueMatchesBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="LeagueMatches">      
      <br>
      <a class="BackButton" href="Competishions"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Другие чемпионаты</a>
      <br>
      <c:if test="${matchesList.size() > 0}">         
         <br>
         <!-- вывод актуальных событий соревнования в цикле -->			
         <table class="LeagueMatchesTable">
            <c:forEach var="leagueEvent" items="${matchesList}">
               <tr onclick="window.location.href='PremierLeague_${leagueEvent.team1}_${leagueEvent.team2}_${leagueEvent.league}_details'; return false">
                  <td>${leagueEvent.dateStr}</td>
                  <td>${leagueEvent.team1}</td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${leagueEvent.team1}.png" onerror="this.style.display='none'"></td>
                  <td>-</td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${leagueEvent.team2}.png" onerror="this.style.display='none'"></td>
                  <td>${leagueEvent.team2}</td>
                  <td><a class="toDetailsButton" href="PremierLeague_${leagueEvent.team1}_${leagueEvent.team2}_${leagueEvent.league}_details">Подробности</a></td>
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
   </div>
</div>