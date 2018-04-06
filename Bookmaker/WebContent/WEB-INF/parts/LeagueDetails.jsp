<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="DetailsBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="details">
      <h1>Детали по матчу ${ceffList.get(0).team1} - ${ceffList.get(0).team2}</h1>
      <br>
      <a class="BackButton" href="PremierLeagueList.spr"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> вернуться</a>
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
         </tr>
         <c:forEach var="EPLivent" items="${ceffList}">
            <tr onclick="window.location.href='Counter.spr?id=${EPLivent.bookmakerBean.bookMakerId}'; return false">
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
            </tr>
         </c:forEach>
      </table>
      <br>		
      <h3>История последних встреч ${ceffList.get(0).team1}:</h3>
      <table class="HistoryTable">
         <c:forEach var="lastMatchesTeam1" items="${lastMatchesTeam1}">
            <tr>
               <td>${lastMatchesTeam1.date}</td>
               <td>${lastMatchesTeam1.team1}</td>
               <td>${lastMatchesTeam1.score}</td>
               <td>${lastMatchesTeam1.team2}</td>
               <td>${lastMatchesTeam1.championship}</td>
            </tr>
         </c:forEach>
      </table>
      <br>		
      <h3>История последних встреч ${ceffList.get(0).team2}:</h3>
      <table class="HistoryTable">
         <c:forEach var="lastMatchesTeam2" items="${lastMatchesTeam2}">
            <tr>
               <td>${lastMatchesTeam2.date}</td>
               <td>${lastMatchesTeam2.team1}</td>
               <td>${lastMatchesTeam2.score}</td>
               <td>${lastMatchesTeam2.team2}</td>
               <td>${lastMatchesTeam2.championship}</td>
            </tr>
         </c:forEach>
      </table>
      <br>		
      <h3>История личных встреч межу ${ceffList.get(0).team1} и ${ceffList.get(0).team2}:</h3>
      <table class="HistoryTable">
         <c:forEach var="lastMatchesTeam1Team2" items="${lastMatchesTeam1Team2}">
            <tr>
               <td>${lastMatchesTeam1Team2.date}</td>
               <td>${lastMatchesTeam1Team2.team1}</td>
               <td>${lastMatchesTeam1Team2.score}</td>
               <td>${lastMatchesTeam1Team2.team2}</td>
               <td>${lastMatchesTeam1Team2.championship}</td>
            </tr>
         </c:forEach>
      </table>
      <br>
   </div>
</div>