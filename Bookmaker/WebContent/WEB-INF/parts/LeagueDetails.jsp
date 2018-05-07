<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="DetailsBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="details">
      <h1>Детали по матчу ${ceffList.get(0).team1} - ${ceffList.get(0).team2}</h1>
      <br>
      <a class="BackButton" href="PremierLeague_${'Английская Примьер Лига'}_List.spr"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> вернуться</a>
      <br>
      <br>
      <div>
         <p>Начало события: <b>${ceffList.get(0).dateStr}</b></p>
         <p>Стадион:</p>
         <p>Судья:</p>
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
         <c:forEach var="EPLivent" items="${ceffList}">
            <tr onclick="window.open('Counter.spr?id=${EPLivent.bookmakerBean.bookMakerId}', '_blank'); return false;">
               <td class="CoeffCompareTableBM">
                  <a rel="nofollow" href="Counter.spr?id=${EPLivent.bookmakerBean.bookMakerId}" target="_blank">
                  <img src="${EPLivent.bookmakerBean.image}" alt="${EPLivent.bookmakerBean.name} logo">
                  </a>
               </td>
               <td>${EPLivent.win1}</td>
               <td>${EPLivent.x}</td>
               <td>${EPLivent.win2}</td>
               <td>${EPLivent.x1}</td>
               <td>${EPLivent.x12}</td>
               <td>${EPLivent.x2}</td>
               <td class="CoeffCompareTableSecondary">${EPLivent.moreTotal}</td>
               <td class="CoeffCompareTableSecondary">${EPLivent.total}</td>
               <td class="CoeffCompareTableSecondary">${EPLivent.lessTotal}</td>
               <td class="CoeffCompareTableSecondary">${EPLivent.hand1}</td>
               <td class="CoeffCompareTableSecondary">${EPLivent.hand}</td>
               <td class="CoeffCompareTableSecondary">${EPLivent.hand2}</td>
               <td class="CoeffCompareTableSecondary2"><a rel="nofollow" href="Counter.spr?id=${EPLivent.bookmakerBean.bookMakerId}" target="_blank">на сайт</a></td>
            </tr>
         </c:forEach>
      </table>
      <c:if test="${lastMatchesTeam1.size() > 0}">
         <br>	
         <h3>История последних встреч команды ${ceffList.get(0).team1}:</h3>
         <table class="HistoryTable">
            <c:forEach var="Team1Matches" items="${lastMatchesTeam1}">
               <tr>
                  <td class="HistoryTableSecondary">${Team1Matches.dateStr}</td>
                  <td <c:if test="${ceffList.get(0).team1 eq Team1Matches.team1}">class="selected_cell"</c:if>>${Team1Matches.team1}</td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${Team1Matches.team1}.png"></td>
                  <td>${Team1Matches.score}</td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${Team1Matches.team2}.png"></td>
                  <td <c:if test="${ceffList.get(0).team1 eq Team1Matches.team2}">class="selected_cell"</c:if>>${Team1Matches.team2}</td>
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
         <h3>История последних встреч команды ${ceffList.get(0).team2}:</h3>
         <table class="HistoryTable">
            <c:forEach var="Team2Matches" items="${lastMatchesTeam2}">
               <tr>
                  <td class="HistoryTableSecondary">${Team2Matches.dateStr}</td>
                  <td <c:if test="${ceffList.get(0).team2 eq Team2Matches.team1}">class="selected_cell"</c:if>>${Team2Matches.team1}</td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${Team2Matches.team1}.png"></td>
                  <td>${Team2Matches.score}</td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${Team2Matches.team2}.png"></td>
                  <td <c:if test="${ceffList.get(0).team2 eq Team2Matches.team2}">class="selected_cell"</c:if>>${Team2Matches.team2}</td>
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
         <h3>История личных встреч между командами ${ceffList.get(0).team1} и ${ceffList.get(0).team2}:</h3>
         <table class="HistoryTable">
            <c:forEach var="Team1Team2Matches" items="${lastMatchesTeam1Team2}">
               <tr>
                  <td class="HistoryTableSecondary">${Team1Team2Matches.dateStr}</td>
                  <td>${Team1Team2Matches.team1}</td>
                  <td><img class="teamIcon" src="bootstrap/img/teamIcons/${Team1Team2Matches.team1}.png"></td>
                  <td>${Team1Team2Matches.score}</td>
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
                  <tr <c:if test="${LeagueTableRow.team eq ceffList.get(0).team1 or LeagueTableRow.team eq ceffList.get(0).team2}">class="selected_row"</c:if>>
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