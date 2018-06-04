<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="DetailsBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="details">
      <h1>Детали по матчу ${xBetList.get(0).team1} - ${xBetList.get(0).team2}</h1>
      <br>
      <a class="BackButton" href="PremierLeague_${xBetList.get(0).league}_List.spr"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> к списку игр</a>
      <br>
      <br>
      <div>
         <p>Начало события: <b>${xBetList.get(0).dateStr}</b></p>
      </div>
      <br>
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
         
         <!--
         <c:import url="parts/ceffCompareRow.jsp">
         	<c:param name="RowListName" value="xBetList"/>
         </c:import>
         <c:import url="parts/ceffCompareRow.jsp">
         	<c:param name="RowListName" value="leonCeff"/>
         </c:import>
         <c:import url="parts/ceffCompareRow.jsp">
         	<c:param name="RowListName" value="ligaCeff"/>
         </c:import>-->
         
         <c:forEach var="xBetCeff" items="${xBetList}">
            <tr onclick="window.open('Counter.spr?id=${xBetCeff.bookmakerBean.bookMakerId}', '_blank'); return false;">
               <td class="CoeffCompareTableBM">
                  <a rel="nofollow" href="Counter.spr?id=${xBetCeff.bookmakerBean.bookMakerId}" target="_blank">
                  <img src="${xBetCeff.bookmakerBean.image}" alt="${xBetCeff.bookmakerBean.name} logo">
                  </a>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${xBetCeff.win1 > 0}">${xBetCeff.win1}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${xBetCeff.x > 0}">${xBetCeff.x}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${xBetCeff.win2 > 0}">${xBetCeff.win2}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${xBetCeff.x1 > 0}">${xBetCeff.x1}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${xBetCeff.x12 > 0}">${xBetCeff.x12}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${xBetCeff.x2 > 0}">${xBetCeff.x2}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${xBetCeff.moreTotal > 0}">${xBetCeff.moreTotal}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${xBetCeff.total > 0}">${xBetCeff.total}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${xBetCeff.lessTotal > 0}">${xBetCeff.lessTotal}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${xBetCeff.hand1 > 0}">${xBetCeff.hand1}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${xBetCeff.hand != ''}">${xBetCeff.hand}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${xBetCeff.hand2 > 0}">${xBetCeff.hand2}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary2"><a rel="nofollow" href="Counter.spr?id=${xBetCeff.bookmakerBean.bookMakerId}" target="_blank">на сайт</a></td>
            </tr>
         </c:forEach>
         <c:forEach var="leonCeff" items="${leonList}">
            <tr onclick="window.open('Counter.spr?id=${leonCeff.bookmakerBean.bookMakerId}', '_blank'); return false;">
               <td class="CoeffCompareTableBM">
                  <a rel="nofollow" href="Counter.spr?id=${leonCeff.bookmakerBean.bookMakerId}" target="_blank">
                  <img src="${leonCeff.bookmakerBean.image}" alt="${leonCeff.bookmakerBean.name} logo">
                  </a>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${leonCeff.win1 > 0}">${leonCeff.win1}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${leonCeff.x > 0}">${leonCeff.x}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${leonCeff.win2 > 0}">${leonCeff.win2}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${leonCeff.x1 > 0}">${leonCeff.x1}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${leonCeff.x12 > 0}">${leonCeff.x12}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${leonCeff.x2 > 0}">${leonCeff.x2}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${leonCeff.moreTotal > 0}">${leonCeff.moreTotal}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${leonCeff.total > 0}">${leonCeff.total}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${leonCeff.lessTotal > 0}">${leonCeff.lessTotal}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${leonCeff.hand1 > 0}">${leonCeff.hand1}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${leonCeff.hand != ''}">${leonCeff.hand}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${leonCeff.hand2 > 0}">${leonCeff.hand2}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary2"><a rel="nofollow" href="Counter.spr?id=${leonCeff.bookmakerBean.bookMakerId}" target="_blank">на сайт</a></td>
            </tr>
         </c:forEach>
         <c:forEach var="ligaCeff" items="${ligaList}">
            <tr onclick="window.open('Counter.spr?id=${ligaCeff.bookmakerBean.bookMakerId}', '_blank'); return false;">
               <td class="CoeffCompareTableBM">
                  <a rel="nofollow" href="Counter.spr?id=${ligaCeff.bookmakerBean.bookMakerId}" target="_blank">
                  <img src="${ligaCeff.bookmakerBean.image}" alt="${ligaCeff.bookmakerBean.name} logo">
                  </a>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${ligaCeff.win1 > 0}">${ligaCeff.win1}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${ligaCeff.x > 0}">${ligaCeff.x}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${ligaCeff.win2 > 0}">${ligaCeff.win2}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${ligaCeff.x1 > 0}">${ligaCeff.x1}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${ligaCeff.x12 > 0}">${ligaCeff.x12}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${ligaCeff.x2 > 0}">${ligaCeff.x2}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${ligaCeff.moreTotal > 0}">${ligaCeff.moreTotal}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${ligaCeff.total > 0}">${ligaCeff.total}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${ligaCeff.lessTotal > 0}">${ligaCeff.lessTotal}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${ligaCeff.hand1 > 0}">${ligaCeff.hand1}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${ligaCeff.hand != ''}">${ligaCeff.hand}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary">
                  <c:choose>
                     <c:when test="${ligaCeff.hand2 > 0}">${ligaCeff.hand2}</c:when>
                     <c:otherwise>-</c:otherwise>
                  </c:choose>
               </td>
               <td class="CoeffCompareTableSecondary2"><a rel="nofollow" href="Counter.spr?id=${ligaCeff.bookmakerBean.bookMakerId}" target="_blank">на сайт</a></td>
            </tr>
         </c:forEach>
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
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${Team1Matches.team1}.png"></td>
                  <td>
                     ${Team1Matches.goalsTeam1}:${Team1Matches.goalsTeam2}
                     <c:if test="${(Team1Matches.penaltyTeam1 > 0) || (Team1Matches.penaltyTeam2 > 0)}"> (${Team1Matches.penaltyTeam1}:${Team1Matches.penaltyTeam2})</c:if>
                  </td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${Team1Matches.team2}.png"></td>
                  <td 
                  <c:if test="${xBetList.get(0).team1 eq Team1Matches.team2}">class="selected_cell"</c:if>
                  >${Team1Matches.team2}</td>
                  <td class="HistoryTableSecondary">${Team1Matches.championship}</td>
               </tr>
               <tr>
                  <td class="HistoryTableDisclosure" colspan="5">
                     Дата: ${Team1Matches.dateStr}<br>
                     Чемпионат: ${Team1Matches.championship}
                  </td>
               </tr>
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
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${Team2Matches.team1}.png"></td>
                  <td>
                     ${Team2Matches.goalsTeam1}:${Team2Matches.goalsTeam2}
                     <c:if test="${(Team2Matches.penaltyTeam1 > 0) || (Team2Matches.penaltyTeam2 > 0)}"> (${Team2Matches.penaltyTeam1}:${Team2Matches.penaltyTeam2})</c:if>
                  </td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${Team2Matches.team2}.png"></td>
                  <td 
                  <c:if test="${xBetList.get(0).team2 eq Team2Matches.team2}">class="selected_cell"</c:if>
                  >${Team2Matches.team2}</td>
                  <td class="HistoryTableSecondary">${Team2Matches.championship}</td>
               </tr>
               <tr>
                  <td class="HistoryTableDisclosure" colspan="5">
                     Дата: ${Team2Matches.dateStr}<br>
                     Чемпионат: ${Team2Matches.championship}
                  </td>
               </tr>
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
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${Team1Team2Matches.team1}.png"></td>
                  <td>
                     ${Team1Team2Matches.goalsTeam1}:${Team1Team2Matches.goalsTeam2}
                     <c:if test="${(Team1Team2Matches.penaltyTeam1 > 0) || (Team1Team2Matches.penaltyTeam2 > 0)}"> (${Team1Team2Matches.penaltyTeam1}:${Team1Team2Matches.penaltyTeam2})</c:if>
                  </td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${Team1Team2Matches.team2}.png"></td>
                  <td>${Team1Team2Matches.team2}</td>
                  <td class="HistoryTableSecondary">${Team1Team2Matches.championship}</td>
               </tr>
               <tr>
                  <td class="HistoryTableDisclosure" colspan="5">
                     Дата: ${Team1Team2Matches.dateStr}<br>
                     Чемпионат: ${Team1Team2Matches.championship}
                  </td>
               </tr>
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
                  <td colspan="2">Команда</td>
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
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${LeagueTableRow.team}.png"></td>
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
      <br>
   </div>
</div>