<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div data-w-tab="Tab ${TabListNumber}" class="w-tab-pane ${defTab}">
   <div class="myTeamHistoryTable">
      <c:forEach var="Events" items="${TabListName}">
         <div class="myTeamHistoryRow">
            <div class="tab_matches-date">${Events.dateStr}</div>
            <div class="command_name vs myDetComandName team1">${Events.team1}</div>
            <div class="detTeamLogos"><img class="myTeamLogo" src="/Static/bootstrap/img/teamIcons/${Events.team1}.png" onerror="this.src='/Static/bootstrap/img/teamIcons/ball.png'"></div>
            <div class="matches_score-text">${Events.goalsTeam1} - ${Events.goalsTeam2}<c:if test="${(Events.penaltyTeam1 > 0) || (Events.penaltyTeam2 > 0)}"><br>(${Events.penaltyTeam1}:${Events.penaltyTeam2})</c:if></div>
            <div class="detTeamLogos"><img class="myTeamLogo" src="/Static/bootstrap/img/teamIcons/${Events.team2}.png" onerror="this.src='/Static/bootstrap/img/teamIcons/ball.png'"></div>
            <div class="command_name vs2 myDetComandName team2">${Events.team2}</div>
            <div class="championats_min-naming">
               <img class="myTeamLogo" src="/Static/bootstrap/img/leagueIcon/${Events.championship}_det.png" onerror="this.style.display='none'">
            </div>
         </div>
      </c:forEach>
   </div>
</div>