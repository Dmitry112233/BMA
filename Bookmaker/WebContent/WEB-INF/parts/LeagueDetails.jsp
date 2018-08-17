<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="DetailsBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="details">      
      <br>
      <a class="BackButton" href="${contextPath}/PremierLeague_${xBetList.get(0).league}_List"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Список игр</a>
      <br>
      <br>
      <div>
         <p>Начало события: <b>${xBetList.get(0).dateStr}</b></p>
      </div>
      <h3>Сравнение коэффициентов лучших букмекеров:</h3>
      <table class="CoeffCompareTable">
         <tr class="CoeffCompareTableHeader">
            <td class="CoeffCompareTableBM"><b>Букмекер</b></td>
            <td><b>1</b></td>
            <td><b>X</b></td>
            <td><b>2</b></td>
            <td><b>1X</b></td>
            <td><b>12</b></td>
            <td><b>2X</b></td>
            <td class="CoeffCompareTableSecondary"><b>Б</b></td>
            <td class="CoeffCompareTableSecondary"><b>ТОТАЛ</b></td>
            <td class="CoeffCompareTableSecondary"><b>М</b></td>
            <td class="CoeffCompareTableSecondary"><b>1</b></td>
            <td class="CoeffCompareTableSecondary"><b>ФОРА</b></td>
            <td class="CoeffCompareTableSecondary"><b>2</b></td>
            <td class="CoeffCompareTableSecondary2"></td>
         </tr>
         <c:set var="RowListName" value="${xBetList}" scope="request"/>
         <c:import url="parts/ceffCompareRow.jsp"/>
         <c:set var="RowListName" value="${leonList}" scope="request"/>
         <c:import url="parts/ceffCompareRow.jsp"/>
         <c:set var="RowListName" value="${ligaList}" scope="request"/>
         <c:import url="parts/ceffCompareRow.jsp"/>
      </table>
      <c:if test="${lastMatchesTeam1.size() > 0}">
         <br>	
         <h3>История последних встреч команды ${xBetList.get(0).team1}:</h3>
         <table class="HistoryTable">
            <c:forEach var="Team1Matches" items="${lastMatchesTeam1}">
               <tr>
                  <td class="HistoryTableSecondary">${Team1Matches.dateStr}</td>
                  <td 
                  <c:if test="${xBetList.get(0).team1 eq Team1Matches.team1}">class="selected_cell"</c:if>
                  >${Team1Matches.team1}</td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${Team1Matches.team1}.png" onerror="this.style.display='none'"></td>
                  <td>
                     ${Team1Matches.goalsTeam1}:${Team1Matches.goalsTeam2}
                     <c:if test="${(Team1Matches.penaltyTeam1 > 0) || (Team1Matches.penaltyTeam2 > 0)}"> (${Team1Matches.penaltyTeam1}:${Team1Matches.penaltyTeam2})</c:if>
                  </td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${Team1Matches.team2}.png" onerror="this.style.display='none'"></td>
                  <td 
                  <c:if test="${xBetList.get(0).team1 eq Team1Matches.team2}">class="selected_cell"</c:if>
                  >${Team1Matches.team2}</td>
                  <td class="HistoryTableSecondary">${Team1Matches.championship}</td>
               </tr>
               <!-- 
               <tr>
                  <td class="HistoryTableDisclosure" colspan="5">
                     Дата: ${Team1Matches.dateStr}<br>
                     Чемпионат: ${Team1Matches.championship}
                  </td>
               </tr>
                -->
            </c:forEach>
         </table>
      </c:if>
      <c:if test="${lastMatchesTeam2.size() > 0}">
         <br>		
         <h3>История последних встреч команды ${xBetList.get(0).team2}:</h3>
         <table class="HistoryTable">
            <c:forEach var="Team2Matches" items="${lastMatchesTeam2}">
               <tr>
                  <td class="HistoryTableSecondary">${Team2Matches.dateStr}</td>
                  <td 
                  <c:if test="${xBetList.get(0).team2 eq Team2Matches.team1}">class="selected_cell"</c:if>
                  >${Team2Matches.team1}</td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${Team2Matches.team1}.png" onerror="this.style.display='none'"></td>
                  <td>
                     ${Team2Matches.goalsTeam1}:${Team2Matches.goalsTeam2}
                     <c:if test="${(Team2Matches.penaltyTeam1 > 0) || (Team2Matches.penaltyTeam2 > 0)}"> (${Team2Matches.penaltyTeam1}:${Team2Matches.penaltyTeam2})</c:if>
                  </td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${Team2Matches.team2}.png" onerror="this.style.display='none'"></td>
                  <td 
                  <c:if test="${xBetList.get(0).team2 eq Team2Matches.team2}">class="selected_cell"</c:if>
                  >${Team2Matches.team2}</td>
                  <td class="HistoryTableSecondary">${Team2Matches.championship}</td>
               </tr>
               <!--
               <tr>
                  <td class="HistoryTableDisclosure" colspan="5">
                     Дата: ${Team2Matches.dateStr}<br>
                     Чемпионат: ${Team2Matches.championship}
                  </td>
               </tr>
                -->
            </c:forEach>
         </table>
      </c:if>
      <c:if test="${lastMatchesTeam1Team2.size() > 0}">
         <br>		
         <h3>История личных встреч между командами ${xBetList.get(0).team1} и ${xBetList.get(0).team2}:</h3>
         <table class="HistoryTable">
            <c:forEach var="Team1Team2Matches" items="${lastMatchesTeam1Team2}">
               <tr>
                  <td class="HistoryTableSecondary">${Team1Team2Matches.dateStr}</td>
                  <td>${Team1Team2Matches.team1}</td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${Team1Team2Matches.team1}.png" onerror="this.style.display='none'"></td>
                  <td>
                     ${Team1Team2Matches.goalsTeam1}:${Team1Team2Matches.goalsTeam2}
                     <c:if test="${(Team1Team2Matches.penaltyTeam1 > 0) || (Team1Team2Matches.penaltyTeam2 > 0)}"> (${Team1Team2Matches.penaltyTeam1}:${Team1Team2Matches.penaltyTeam2})</c:if>
                  </td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${Team1Team2Matches.team2}.png" onerror="this.style.display='none'"></td>
                  <td>${Team1Team2Matches.team2}</td>
                  <td class="HistoryTableSecondary">${Team1Team2Matches.championship}</td>
               </tr>
               <!--
               <tr>
                  <td class="HistoryTableDisclosure" colspan="5">
                     Дата: ${Team1Team2Matches.dateStr}<br>
                     Чемпионат: ${Team1Team2Matches.championship}
                  </td>
               </tr>
                -->
            </c:forEach>
         </table>
      </c:if>
      <c:if test="${leagueTable.size() > 0}">
         <br>		
         <div class="LeagueTableBlock">
            <h3>Таблица чемпионата:</h3>
            <table class="LeagueTable">
               <tr class="LeagueTableHeader">
                  <td></td>
                  <td></td>
                  <td align="left">Команда</td>
                  <td>И</td>
                  <td class="LeagueTableSecondary">В</td>
                  <td class="LeagueTableSecondary">Н</td>
                  <td class="LeagueTableSecondary">П</td>
                  <td class="LeagueTableSecondary">М</td>
                  <td>О</td>
               </tr>
               <c:forEach var="LeagueTableRow" items="${leagueTable}">
                  <tr 
                  <c:if test="${LeagueTableRow.team eq xBetList.get(0).team1 or LeagueTableRow.team eq xBetList.get(0).team2}">class="selected_row"</c:if>
                  >
                  <td>${LeagueTableRow.place}</td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${LeagueTableRow.team}.png" onerror="this.style.display='none'"></td>
                  <td>${LeagueTableRow.team}</td>
                  <td>${LeagueTableRow.games}</td>
                  <td class="LeagueTableSecondary">${LeagueTableRow.win}</td>
                  <td class="LeagueTableSecondary">${LeagueTableRow.draw}</td>
                  <td class="LeagueTableSecondary">${LeagueTableRow.lose}</td>
                  <td class="LeagueTableSecondary">${LeagueTableRow.goals}</td>
                  <td>${LeagueTableRow.points}</td>
                  </tr>
               </c:forEach>
            </table>
         </div>
      </c:if>
      <c:if test="${groupTeam1.size() > 0}">      
         <br>		
         <div class="GroupTableBlock">
            <h3>Группа ${groupTeam1.get(0).group}:</h3>
            <table class="GroupTable">
               <tr class="GroupTableHeader">
                  <td></td>
                  <td colspan="2">Команда</td>
                  <td>И</td>
                  <td class="GroupTableSecondary">В</td>
                  <td class="GroupTableSecondary">Н</td>
                  <td class="GroupTableSecondary">П</td>
                  <td class="GroupTableSecondary">М</td>
                  <td>О</td>
               </tr>
               <c:forEach var="GroupTableRow" items="${groupTeam1}">
                  <tr 
                  <c:if test="${GroupTableRow.team eq xBetList.get(0).team1 or GroupTableRow.team eq xBetList.get(0).team2}">class="selected_row"</c:if>
                  >
                  <td>${GroupTableRow.place}</td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${GroupTableRow.team}.png" onerror="this.style.display='none'"></td>
                  <td>${GroupTableRow.team}</td>
                  <td>${GroupTableRow.games}</td>
                  <td class="GroupTableSecondary">${GroupTableRow.wins}</td>
                  <td class="GroupTableSecondary">${GroupTableRow.draw}</td>
                  <td class="GroupTableSecondary">${GroupTableRow.lose}</td>
                  <td class="GroupTableSecondary">${GroupTableRow.goal}</td>
                  <td>${GroupTableRow.points}</td>
                  </tr>
               </c:forEach>
            </table>
         </div>
      </c:if>
      <br>
      <c:if test="${groupTeam2.size() > 0}">      
         <br>		
         <div class="GroupTableBlock">
            <h3>Группа ${groupTeam2.get(0).group}:</h3>
            <table class="GroupTable">
               <tr class="GroupTableHeader">
                  <td></td>
                  <td colspan="2">Команда</td>
                  <td>И</td>
                  <td class="GroupTableSecondary">В</td>
                  <td class="GroupTableSecondary">Н</td>
                  <td class="GroupTableSecondary">П</td>
                  <td class="GroupTableSecondary">М</td>
                  <td>О</td>
               </tr>
               <c:forEach var="GroupTableRow" items="${groupTeam2}">
                  <tr 
                  <c:if test="${GroupTableRow.team eq xBetList.get(0).team1 or GroupTableRow.team eq xBetList.get(0).team2}">class="selected_row"</c:if>
                  >
                  <td>${GroupTableRow.place}</td>
                  <td><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${GroupTableRow.team}.png" onerror="this.style.display='none'"></td>
                  <td>${GroupTableRow.team}</td>
                  <td>${GroupTableRow.games}</td>
                  <td class="GroupTableSecondary">${GroupTableRow.wins}</td>
                  <td class="GroupTableSecondary">${GroupTableRow.draw}</td>
                  <td class="GroupTableSecondary">${GroupTableRow.lose}</td>
                  <td class="GroupTableSecondary">${GroupTableRow.goal}</td>
                  <td>${GroupTableRow.points}</td>
                  </tr>
               </c:forEach>
            </table>
         </div>
      </c:if>
      <br>      
   </div>
</div>