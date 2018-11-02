<!DOCTYPE html>	
<html lang="ru">
   <head>
      <title>${Table_T}</title>
      <meta name="Description" content="${Table_D}"/>
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
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
   </head>
   <body class="body">
      <c:import url="parts/nav.jsp"></c:import>
      <div class="hero_all_table center">
         <div id="w-node-e61cb80a12a6-bb78b9bf" class="header_content_block table_champ">
            <div class="rpl_img">
               <img src="/Static/bootstrap/img/leagueHeader/${leagueLower}.jpg" onerror="this.style.display='none'" />
            </div>
            <div class="rpl_description">
               <img class="myLeagueIcon" src="/Static/bootstrap/img/leagueIcon/${leagueLower}_dark.png" onerror="this.style.display='none'">
               <h1 class="champ_title">${Table_H1}</h1>
               <a href="${contextPath}/${leagueLower}_описание" class="button_description_grew table_champ w-button">Описание</a>
               <a href="${contextPath}/competitions" class="button_all_champ w-button">Все чемпионаты</a>
            </div>
         </div>
         <div class="myLeagueTable">
            <div class="myLeagueTableRow header">
               <div></div>
               <div class="full_table_command_name_text bold">Команды</div>
               <div class="full_table_points bold">И</div>
               <div class="full_table_points bold">В</div>
               <div class="full_table_points bold">Н</div>
               <div class="full_table_points bold">П</div>
               <div class="full_table_points bold">М</div>
               <div class="full_table_final_point bold">О</div>
            </div>
            <c:forEach var="LeagueTableRow" items="${table}">
            <div class="myLeagueTableRow row">
               <div class="full_table_num_text">${LeagueTableRow.place}</div>
               <div class="full_table_points_img"><img class="myLeagueTableTeamLogo" src="/Static/bootstrap/img/teamIcons/${LeagueTableRow.team}.png" onerror="this.style.display='none'"></div>
               <div class="full_table_command_name_text">${LeagueTableRow.team}</div>
               <div class="full_table_points">${LeagueTableRow.games}</div>
               <div class="full_table_points">${LeagueTableRow.win}</div>
               <div class="full_table_points">${LeagueTableRow.draw}</div>
               <div class="full_table_points">${LeagueTableRow.lose}</div>
               <div class="full_table_final_point">${LeagueTableRow.goals}</div>
               <div class="full_table_final_point">${LeagueTableRow.points}</div>
            </div>
            </c:forEach>
         </div>
         <div class="seoBlock tablepage">
            ${Table_Txt}
         </div>
      </div>
      <c:import url="parts/footer.jsp"></c:import>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
      <script src="/Static/bootstrap/js/script.js" type="text/javascript"></script>
      <script type="text/javascript" src="/Static/bootstrap/js/mail.js"></script>
      <script type="text/javascript">$(document).ready(function(){$('[href*="brandjs"]').attr('style', 'display:none !important');$('a[href="'+window.location.href+'"]').addClass('w--current');});</script>
   </body>
</html>