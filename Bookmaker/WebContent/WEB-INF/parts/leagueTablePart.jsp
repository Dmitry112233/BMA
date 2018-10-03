<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="leagueTable" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <br>
   <a class="BackButton" href="${contextPath}/competishions"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Другие чемпионаты</a>
   <br><br>
   <div class="LeagueTableBlock">
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
         <c:forEach var="LeagueTableRow" items="${table}">
            <tr>
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
   <br> 
   <div class="article">${Table_Txt}</div>
   <br>
</div>