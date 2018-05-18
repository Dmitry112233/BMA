<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="LeagueMatchesBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="LeagueMatches">      
      <c:if test="${matchesList.size() > 0}">
         <h1><img class="leagueIcon" src="bootstrap/img/leagueIcon/${matchesList.get(0).league}.png">${matchesList.get(0).league}</h1>
         <br>
         <!-- вывод туров АПЛ в цикле -->			
         <table class="LeagueMatchesTable">
            <c:forEach var="leagueEvent" items="${matchesList}">
               <tr onclick="window.location.href='PremierLeague_${leagueEvent.team1}_${leagueEvent.team2}_${leagueEvent.league}_details.spr'; return false">
                  <td>${leagueEvent.dateStr}</td>
                  <td>${leagueEvent.team1}</td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${leagueEvent.team1}.png"></td>
                  <td>-</td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${leagueEvent.team2}.png"></td>
                  <td>${leagueEvent.team2}</td>
                  <td><a href="PremierLeague_${leagueEvent.team1}_${leagueEvent.team2}_${leagueEvent.league}_details.spr">перейти на подробности</a></td>
                  <td>${leagueEvent.team1} - ${leagueEvent.team2}</td>
               </tr>
            </c:forEach>
         </table>
         <br>
      </c:if>
      <c:if test="${matchesList.size() == NULL}">      
         <h1>Футбол</h1>
         <br>
         <p class="DataMissed">Данные отсутствуют по непонятной причине.<br>Приносим свои извинения за неудобства.<br>Мы работаем над устранением проблемы.<br>Попробуйте обновить страницу через несколько минут.</p>
      </c:if>
   </div>
</div>