<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="EPLBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="EPL">
      <h1><img class="leagueIcon" src="bootstrap/img/leagueIcon/English Premier League.png">Английская Премьер-лига</h1>      
      <br>
      <c:if test="${matchesList.size() > 0}">
         <!-- вывод туров АПЛ в цикле -->			
         <table class="EPLtable">
            <c:forEach var="EPLivent" items="${matchesList}">
               <tr onclick="window.location.href='PremierLeague_${EPLivent.team1}_${EPLivent.team2}_${EPLivent.league}_details.spr'; return false">
                  <td>${EPLivent.dateStr}</td>
                  <td>${EPLivent.team1}</td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${EPLivent.team1}.png"></td>
                  <td>-</td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${EPLivent.team2}.png"></td>
                  <td>${EPLivent.team2}</td>
                  <td><a href="PremierLeague_${EPLivent.team1}_${EPLivent.team2}_${EPLivent.league}_details.spr">перейти на подробности</a></td>
                  <td>${EPLivent.team1} - ${EPLivent.team2}</td>
               </tr>
            </c:forEach>
         </table>
         <br>
      </c:if>
      <c:if test="${matchesList.size() == 0}">
         <p class="DataMissed">Данные отсутствуют по непонятной причине.<br>Приносим свои извинения за неудобства.<br>Мы работаем над устранением проблемы.<br>Попробуйте обновить страницу через несколько минут.</p>
      </c:if>
   </div>
</div>