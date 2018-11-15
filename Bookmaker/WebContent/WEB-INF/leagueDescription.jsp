<!DOCTYPE html>	
<html lang="ru">
   <head>
      <title>${league_T}</title>
      <meta name="Description" content="${league_D}"/>
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
      <div class="hero_rpl_section">
         <div class="hero_rpl_block">
            <div class="col_rpl w-row">
               <div class="leagueDescrBlock col_rpl_info w-col w-col-8 w-col-stack">
                  <div class="rpl_img_block">
                  		<div class="league_img" style="background-image: url('/Static/bootstrap/img/leagueHeader/${leagueLower}.jpg')"></div>
                  </div>
                  <div class="leagueMatchesTitleRow">
		            <div class="myLeagueIconBlock">
		            	<img class="myLeagueIcon" src="/Static/bootstrap/img/leagueIcon/${leagueLower}_dark.png" onerror="this.style.display='none'" alt="${leagueLower} лого">
		            </div>
		            <div class="myLeagueH1Block oneBtn">
		            	<h1 class="champ_title myLeagueH1">${league_H1}</h1>
		            </div>
		            <div class="btn_all-bets_block myS oneBtn">
		            	<a href="${contextPath}/competitions" class="allItemsBtn discr_title_button w-button">Все чемпионаты</a>
		            </div>                     
           		  </div>
                  <div class="seoBlock">
                     ${league_Descr}
                  </div>
               </div>
               <c:import url="parts/sideLeagueTable.jsp"></c:import>
               <c:import url="parts/sideBanners/1xbetSideBanner.jsp"></c:import>
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