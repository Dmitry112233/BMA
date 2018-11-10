<!DOCTYPE html>	
<html lang="ru">
   <head>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <title>Сравнение коэффициентов, детали по матчу ${team1} - ${team2}</title>
      <meta name="Description" content="Сравнение коэффициентов, детали по матчу ${team1} - ${team2} | findbestbet.ru ⚽ Актуальная информация о матчах, коэффициентах и ставках на спорт"/>
      <meta name="Keywords" content=""/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="all"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>
      <link rel="shortcut icon" href="/Static/bootstrap/img/favicon.ico" type="image/x-icon">
      <link href="/Static/bootstrap/css/style-${cssVersion}.css" rel="stylesheet">
      <link href="/Static/bootstrap/css/myStyle-${cssVersion}.css" rel="stylesheet">
      <script src="/Static/bootstrap/js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
   </head>
   <body class="body">
      <c:import url="parts/nav.jsp"></c:import>
      <div class="hero_coefficient_section">
         <div class="container_coeff">
            <div class="header_content_block">
               <div class="rpl_img_block">
                  <div class="league_img" style="background-image: url('/Static/bootstrap/img/leagueHeader/${leagueLower}.jpg')"></div>
               </div>
               <div class="leagueMatchesTitleRow">
		            <div class="myLeagueIconBlock">
		            	<img class="myLeagueIcon" src="/Static/bootstrap/img/leagueIcon/${leagueLower}_dark.png" onerror="this.style.display='none'">
		            </div>
		            <div class="myLeagueH1Block oneBtn">
		            	<h1 class="champ_title myLeagueH1">Сравнение коэффициентов, детали по матчу ${team1} - ${team2}</h1>
		            </div>
		            <div class="btn_all-bets_block myS oneBtn">
		            	<a href="${contextPath}/${leagueLower}_матчи" class="allItemsBtn discr_title_button w-button">Все матчи</a>
		            </div>                     
       		   </div>
            </div>
            <div class="myMatchDetailesComands">
            	<div class="myStartmatchesBlock">
                  <c:if test="${xBetList.size() > 0}">
                  	<div class="start_matches">Начало события:<br><span class="start_matches_bold"><fmt:formatDate pattern = "dd.MM.yyyy | HH:mm" value = "${xBetList.get(0).date}" /> МСК</span></div>
                  </c:if>                  
                </div>
            	<div class="myHederTeamLogoBlock1">
            		<img class="myHederTeamLogo logo_command none" src="/Static/bootstrap/img/teamIcons/${team1}.png" alt="" />
            	</div>
            	<div class="match_game _t1">${team1}</div>
            	<div class="match_game"> - </div>
            	<div class="match_game _t2">${team2}</div>
            	<div class="myHederTeamLogoBlock2">
            		<img class="myHederTeamLogo logo_command none" src="/Static/bootstrap/img/teamIcons/${team2}.png" alt="" />
            	</div>
            </div>
         </div>
         <c:if test="${xBetList.size() > 0}">
         <div class="myBkCompareTable">
            <div class="myBkCompareRow header">
               <div class="bookmaker_points bold first">Букмекер</div>
               <div class="bookmaker_points bold">1</div>
               <div class="bookmaker_points bold">Х</div>
               <div class="bookmaker_points bold">2</div>
               <div class="bookmaker_points bold">1Х</div>
               <div class="bookmaker_points bold">12</div>
               <div class="bookmaker_points bold">2Х</div>
               <div class="bookmaker_points bold del">Б</div>
               <div class="bookmaker_points bold del">Тотал</div>
               <div class="bookmaker_points bold d">М</div>
               <div class="bookmaker_points bold d">1</div>
               <div class="bookmaker_points bold del">Фора</div>
               <div class="bookmaker_points bold d">2</div>
            </div>
            <c:set var="RowListName" value="${xBetList}" scope="request"/>
            <c:import url="parts/ceffCompareRow.jsp"/>
            <c:set var="RowListName" value="${leonList}" scope="request"/>
            <c:import url="parts/ceffCompareRow.jsp"/>
            <c:set var="RowListName" value="${ligaList}" scope="request"/>
            <c:import url="parts/ceffCompareRow.jsp"/>
         </div>
         </c:if>
         <div class="matches_tab-block">
            <div class="col_tab-and-table w-row">
               <div class="col_tab-matches w-col w-col-8 w-col-stack">
                  <div data-duration-in="300" data-duration-out="100" class="w-tabs">
                     <div class="tabs_control-menu w-tab-menu">
                        <a data-w-tab="Tab 1" class="tab_link w-inline-block w-tab-link w--current">
                           <div class="tabs_link-text">Последние встречи ${team1}</div>
                        </a>
                        <a data-w-tab="Tab 2" class="tab_link w-inline-block w-tab-link">
                           <div class="tabs_link-text">Последние встречи ${team2}</div>
                        </a>
                        <a data-w-tab="Tab 3" class="tab_link w-inline-block w-tab-link">
                           <div class="tabs_link-text">Личные встречи ${team1} и ${team2}</div>
                        </a>
                     </div>
                     <div class="w-tab-content">
                        <div data-w-tab="Tab 1" class="w-tab-pane w--tab-active">
                           <div class="myTeamHistoryTable">
                              <c:forEach var="Team1Matches" items="${lastMatchesTeam1}">
                                 <div class="myTeamHistoryRow">
                                    <div class="tab_matches-date">${Team1Matches.dateStr}</div>
                                    <div class="command_name vs">${Team1Matches.team1} <img class="myTeamLogo" src="/Static/bootstrap/img/teamIcons/${Team1Matches.team1}.png" onerror="this.style.display='none'"></div>
                                    <div class="matches_score-text">${Team1Matches.goalsTeam1} - ${Team1Matches.goalsTeam2}
                                       <c:if test="${(Team1Matches.penaltyTeam1 > 0) || (Team1Matches.penaltyTeam2 > 0)}"><br>(${Team1Matches.penaltyTeam1}:${Team1Matches.penaltyTeam2})</c:if>
                                    </div>
                                    <div class="command_name vs2"><img class="myTeamLogo" src="/Static/bootstrap/img/teamIcons/${Team1Matches.team2}.png" onerror="this.style.display='none'"> ${Team1Matches.team2}</div>
                                    <div class="championats_min-naming">
                                    	<img class="myTeamLogo" src="/Static/bootstrap/img/leagueIcon/${Team1Matches.championship}_det.png" onerror="this.style.display='none'">
                                    </div>
                                 </div>
                              </c:forEach>
                           </div>
                        </div>
                        <div data-w-tab="Tab 2" class="w-tab-pane">
                           <div class="myTeamHistoryTable">
                              <c:forEach var="Team2Matches" items="${lastMatchesTeam2}">
                                 <div class="myTeamHistoryRow">
                                    <div class="tab_matches-date">${Team2Matches.dateStr}</div>
                                    <div class="command_name vs">${Team2Matches.team1} <img class="myTeamLogo" src="/Static/bootstrap/img/teamIcons/${Team2Matches.team1}.png" onerror="this.style.display='none'"></div>
                                    <div class="matches_score-text">${Team2Matches.goalsTeam1} - ${Team2Matches.goalsTeam2}
                                       <c:if test="${(Team2Matches.penaltyTeam1 > 0) || (Team2Matches.penaltyTeam2 > 0)}"><br>(${Team2Matches.penaltyTeam1}:${Team2Matches.penaltyTeam2})</c:if>
                                    </div>
                                    <div class="command_name vs2"><img class="myTeamLogo" src="/Static/bootstrap/img/teamIcons/${Team2Matches.team2}.png" onerror="this.style.display='none'"> ${Team2Matches.team2}</div>
                                    <div class="championats_min-naming">
                                    	<img class="myTeamLogo" src="/Static/bootstrap/img/leagueIcon/${Team2Matches.championship}_det.png" onerror="this.style.display='none'">
                                    </div>
                                 </div>
                              </c:forEach>
                           </div>
                        </div>
                        <div data-w-tab="Tab 3" class="w-tab-pane">
                           <div class="myTeamHistoryTable">
                              <c:forEach var="Team1Team2Matches" items="${lastMatchesTeam1Team2}">
                                 <div class="myTeamHistoryRow">
                                    <div class="tab_matches-date">${Team1Team2Matches.dateStr}</div>
                                    <div class="command_name vs">${Team1Team2Matches.team1} <img class="myTeamLogo" src="/Static/bootstrap/img/teamIcons/${Team1Team2Matches.team1}.png" onerror="this.style.display='none'"></div>
                                    <div class="matches_score-text">${Team1Team2Matches.goalsTeam1} - ${Team1Team2Matches.goalsTeam2}
                                       <c:if test="${(Team1Team2Matches.penaltyTeam1 > 0) || (Team1Team2Matches.penaltyTeam2 > 0)}"><br>(${Team1Team2Matches.penaltyTeam1}:${Team1Team2Matches.penaltyTeam2})</c:if>
                                    </div>
                                    <div class="command_name vs2"><img class="myTeamLogo" src="/Static/bootstrap/img/teamIcons/${Team1Team2Matches.team2}.png" onerror="this.style.display='none'"> ${Team1Team2Matches.team2}</div>
                                    <div class="championats_min-naming">
                                    	<img class="myTeamLogo" src="/Static/bootstrap/img/leagueIcon/${Team1Team2Matches.championship}_det.png" onerror="this.style.display='none'">
                                    </div>
                                 </div>
                              </c:forEach>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <c:import url="parts/sideLeagueTable.jsp"></c:import>
            </div>
         </div>
      </div>
      <c:import url="parts/footer.jsp"></c:import>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
      <script src="/Static/bootstrap/js/script.js" type="text/javascript"></script>
      <script type="text/javascript" src="/Static/bootstrap/js/mail.js"></script>
      <script type="text/javascript">$(document).ready(function(){$('[href*="brandjs"]').attr('style', 'display:none !important');$('a[href="'+window.location.href+'"]').addClass('w--current');});</script>
   </body>
</html>