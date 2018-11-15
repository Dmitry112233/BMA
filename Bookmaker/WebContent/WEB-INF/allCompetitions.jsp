<!DOCTYPE html>	
<html lang="ru">
   <head>
      <title>${Competishions_T}</title>
      <meta name="Description" content="${Competishions_D}"/>
      <meta name="Keywords" content=""/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="all"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>
      <link rel="shortcut icon" href="/Static/bootstrap/img/favicon.ico" type="image/x-icon">
      <link href="/Static/bootstrap/css/style-${cssVersion}.css" rel="stylesheet">
      <link href="/Static/bootstrap/css/myStyle-${cssVersion}.css" rel="stylesheet">
      <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
   </head>
   <body class="body">
      <c:import url="parts/nav.jsp"></c:import>
      <div class="hero_competishons_section">
         <div class="hero_championats_block">
            <div data-duration-in="300" data-duration-out="100" class="hero_championats_tab w-tabs">
               <div class="championats_tabs_menu w-tab-menu">
                  <a data-w-tab="Tab 7" class="tab_links w-inline-block w-tab-link w--current">
                     <div class="myChampTabs champ_tab_text"><img src="/Static/bootstrap/img/leagueIcon/российская премьер лига.png" onerror="this.style.display='none'" alt="российская премьер лига лого" /><p>Премьер-Лига (Россия)</p></div>
                  </a>
                  <a data-w-tab="Tab 8" class="tab_links w-inline-block w-tab-link">
                     <div class="myChampTabs champ_tab_text england"><img src="/Static/bootstrap/img/leagueIcon/английская премьер лига_dark.png" onerror="this.style.display='none'" alt="английская премьер лига" /><p>Премьер-Лига (Англия)</p></div>
                  </a>
                  <a data-w-tab="Tab 11" class="tab_links w-inline-block w-tab-link">
                     <div class="myChampTabs champ_tab_text spain"><img src="/Static/bootstrap/img/leagueIcon/испанская ла лига.png" onerror="this.style.display='none'" alt="испанская ла лига лого" /><p>Ла Лига (Испания)</p></div>
                  </a>
                  <a data-w-tab="Tab 10" class="tab_links w-inline-block w-tab-link">
                     <div class="myChampTabs champ_tab_text italy"><img src="/Static/bootstrap/img/leagueIcon/итальянская серия а.png" onerror="this.style.display='none'" alt="итальянская серия а лого" /><p>Серия А (Италия)</p></div>
                  </a>
                  <a data-w-tab="Tab 9" class="tab_links w-inline-block w-tab-link">
                     <div class="myChampTabs champ_tab_text germany"><img src="/Static/bootstrap/img/leagueIcon/немецкая бундеслига.png" onerror="this.style.display='none'" alt="немецкая бундеслига лого" /><p>Бундеслига (Германия)</p></div>
                  </a>
                  <!-- <a data-w-tab="Tab 12" class="tab_links w-inline-block w-tab-link">
                     <div class="champ_tab_text france">Франция Лига 1</div>
                     </a> -->
               </div>
               <div class="championats_tabs_content w-tab-content">
                  <c:set var="TabListName" value="${rus_matches}" scope="request"/>
                  <c:set var="TabNumber" value="7" scope="request"/>
                  <c:set var="defTab" value="w--tab-active" scope="request"/>
                  <c:set var="legueTitle" value="Чемпионат России по футболу" scope="request"/>
                  <c:set var="foundationYear" value="1992" scope="request"/>
                  <c:set var="teamCount" value="16" scope="request"/>
                  <c:set var="currentChampion" value="Локомотив" scope="request"/>
                  <c:set var="legueTitleLower" value="российская премьер лига" scope="request"/>
                  <c:import url="parts/competitionsTabs.jsp"/>
                  
                  <c:set var="TabListName" value="${eng_matches}" scope="request"/>
                  <c:set var="TabNumber" value="8" scope="request"/>
                  <c:set var="defTab" value="" scope="request"/>
                  <c:set var="legueTitle" value="Чемпионат Англии по футболу" scope="request"/>
                  <c:set var="foundationYear" value="1992" scope="request"/>
                  <c:set var="teamCount" value="20" scope="request"/>
                  <c:set var="currentChampion" value="Манчестер Сити" scope="request"/>
                  <c:set var="legueTitleLower" value="английская премьер лига" scope="request"/>
                  <c:import url="parts/competitionsTabs.jsp"/>
                  
                  <c:set var="TabListName" value="${spa_matches}" scope="request"/>
                  <c:set var="TabNumber" value="11" scope="request"/>
                  <c:set var="defTab" value="" scope="request"/>
                  <c:set var="legueTitle" value="Чемпионат Испании по футболу" scope="request"/>
                  <c:set var="foundationYear" value="1929" scope="request"/>
                  <c:set var="teamCount" value="20" scope="request"/>
                  <c:set var="currentChampion" value="Барселона" scope="request"/>
                  <c:set var="legueTitleLower" value="испанская ла лига" scope="request"/>
                  
                  <c:import url="parts/competitionsTabs.jsp"/>
                  <c:set var="TabListName" value="${ita_matches}" scope="request"/>
                  <c:set var="TabNumber" value="10" scope="request"/>
                  <c:set var="defTab" value="" scope="request"/>
                  <c:set var="legueTitle" value="Чемпионат Италии по футболу" scope="request"/>
                  <c:set var="foundationYear" value="1898" scope="request"/>
                  <c:set var="teamCount" value="20" scope="request"/>
                  <c:set var="currentChampion" value="Ювентус" scope="request"/>
                  <c:set var="legueTitleLower" value="итальянская серия а" scope="request"/>
                  
                  <c:import url="parts/competitionsTabs.jsp"/>
                  <c:set var="TabListName" value="${ger_matches}" scope="request"/>
                  <c:set var="TabNumber" value="9" scope="request"/>
                  <c:set var="defTab" value="" scope="request"/>
                  <c:set var="legueTitle" value="Чемпионат Германии по футболу" scope="request"/>
                  <c:set var="foundationYear" value="1962" scope="request"/>
                  <c:set var="teamCount" value="18" scope="request"/>
                  <c:set var="currentChampion" value="Бавария" scope="request"/>
                  <c:set var="legueTitleLower" value="немецкая бундеслига" scope="request"/>
                  <c:import url="parts/competitionsTabs.jsp"/>
            </div>
         </div>
         <div class="seo_text_block">
            <div class="w-row">
               <div class="column-13 w-col w-col-8 w-col-stack myChampSeo">
                  <div class="seoBlock">
                     <div class="info_bookmakers col_info_competishons">
                        <h1 class="seo_h2_text">Ставки на футбол сегодня</h1>
                     </div>
                     ${Competishions_Txt}
                  </div>
               </div>
               <c:import url="parts/sideBanners/1xbetSideBanner.jsp"></c:import>
               <c:import url="parts/sideBanners/leonSideBanner.jsp"></c:import>
               <c:import url="parts/sideBanners/ligaSideBanner.jsp"></c:import>
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