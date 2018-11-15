<!DOCTYPE html>	
<html lang="ru">
   <head>
      <title>${League_T}</title>
      <meta name="Description" content="${League_D}"/>
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
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
   </head>
   <body class="body">
      <c:import url="parts/nav.jsp"></c:import>
      <div class="rpl_bet_section">
         <div class="rpl_bet_container">
            <div class="col_rpl w-row">
               <div class="col_rpl_info w-col w-col-8 w-col-stack">
                  <div class="rpl_img_block">
                     <div class="league_img" style="background-image: url('/Static/bootstrap/img/leagueHeader/${leagueLower}.jpg')"></div>
                  </div>
                  <div class="leagueMatchesTitleRow">
                     <div class="myLeagueIconBlock">
                     	<img class="myLeagueIcon" src="/Static/bootstrap/img/leagueIcon/${leagueLower}_dark.png" onerror="this.style.display='none'" alt="${leagueLower} лого">
                     </div>
                     <div class="myLeagueH1Block">
                     	<h1 class="champ_title myLeagueH1">${League_H1}</h1>
                     </div>
                     <div class="descrButtonBlock">
                     	<a href="${contextPath}/${leagueLower}_описание" class="descrButton">Описание</a>
                     </div>
                     <div class="btn_all-bets_block myS">
                     	<a href="${contextPath}/competitions" class="allItemsBtn discr_title_button w-button">Все чемпионаты</a>
                     </div>                     
                  </div>
                  <div class="rpl_matches_block">
                     <c:forEach var="date" items="${dates}">
                        <div class="date_matches"><fmt:formatDate pattern = "dd.MM.yyyy" value = "${mapMatch.get(date).get(0).date}" /></div>
                        <div class="myLeagueMatchesTopWrapper">
	                        <c:forEach var="events" items="${mapMatch.get(date)}">
	                           <div class="myLeagueMatchesWrapper">
	                              <div class="myLeagueMatches" onclick="window.location.href='${contextPath}/${events.url}'; return false">
	                                 <div class="time_msk"><fmt:formatDate pattern = "HH:mm" value = "${events.date}" /> МСК</div>
	                                 <div class="command_name vs myLeagMatchesComandName">${events.team1} <span class="coefficient_matches">(${events.win1}) </span><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${events.team1}.png" onerror="this.style.display='none'" alt="${events.team1} лого"></div>
	                                 <div class="draw_coef">ничья<span class="drow_coef_number"> (${events.x})</span></div>
	                                 <div class="mobileCeffs">1: ${events.win1}<br>x: ${events.x}<br>2: ${events.win2}</div>
	                                 <div class="command_name second_command_name myLeagMatchesComandName"><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${events.team2}.png" onerror="this.style.display='none'" alt="${events.team2} лого"> ${events.team2}<span class="coefficient_matches"> (${events.win2})</span></div>
	                                 <div class="xceff"><a class="link_more" href="${contextPath}/${events.url}">Подробности</a></div>
	                              </div>
	                           </div>
	                        </c:forEach>
                        </div>
                     </c:forEach>
                  </div>
               </div>
               <c:import url="parts/sideLeagueTable.jsp"></c:import>
               <c:import url="parts/sideBanners/1xbetSideBanner.jsp"></c:import>
               <c:import url="parts/sideBanners/leonSideBanner.jsp"></c:import>
               <c:import url="parts/sideBanners/ligaSideBanner.jsp"></c:import>
               <div class="col_rpl_info w-col w-col-8 w-col-stack">    
                  <div class="seoBlock">
                     ${League_Txt}
                  </div>
               </div>
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