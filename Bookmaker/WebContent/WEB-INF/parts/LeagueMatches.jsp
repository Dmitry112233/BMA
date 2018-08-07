<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="LeagueMatchesBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="LeagueMatches">      
      <c:if test="${matchesList.size() > 0}">
         <h1><img class="leagueIcon" src="bootstrap/img/leagueIcon/${matchesList.get(0).league}.png">${matchesList.get(0).league}</h1>
         <br>
         <!-- вывод актуальных событий соревнования в цикле -->			
         <table class="LeagueMatchesTable">
            <c:forEach var="leagueEvent" items="${matchesList}">
               <tr onclick="window.location.href='PremierLeague_${leagueEvent.team1}_${leagueEvent.team2}_${leagueEvent.league}_details.spr'; return false">
                  <td>${leagueEvent.dateStr}</td>
                  <td>${leagueEvent.team1}</td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${leagueEvent.team1}.png" onerror="this.style.display='none'"></td>
                  <td>-</td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${leagueEvent.team2}.png" onerror="this.style.display='none'"></td>
                  <td>${leagueEvent.team2}</td>
                  <td><a class="toDetailsButton" href="PremierLeague_${leagueEvent.team1}_${leagueEvent.team2}_${leagueEvent.league}_details.spr">Подробности</a></td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${leagueEvent.team1}.png" onerror="this.style.display='none'"> ${leagueEvent.team1} - <img class="teamIcon" src="bootstrap/img/teamIcons/${leagueEvent.team2}.png" onerror="this.style.display='none'"> ${leagueEvent.team2}</td>
               </tr>
            </c:forEach>
         </table>         
      </c:if>
      <c:if test="${matchesList.size() == NULL}"> 
         <h1>Футбол</h1>
         <br>
         <p class="DataMissed">Соревнование не проходит в данный момент либо данные отсутствуют из-за технических проблем.</p>
      </c:if>
      <br>
      <a class="BackButton" href="Competishions.spr"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> выбрать другой чемпионат</a>
      <br><br>      
   </div>
</div>