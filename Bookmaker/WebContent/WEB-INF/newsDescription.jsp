<!DOCTYPE html>	
<html lang="ru">
   <head>
      <title>${news.title} | findbestbet.ru</title>
      <meta name="Description" content=""/>
      <meta name="Keywords" content=""/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="noindex"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>
      <link rel="shortcut icon" href="/Static/bootstrap/img/favicon.ico" type="image/x-icon">
      <link href="/Static/bootstrap/css/style-${cssVersion}.css" rel="stylesheet">
      <link href="/Static/bootstrap/css/myStyle-${cssVersion}.css" rel="stylesheet">
      <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
   </head>
   <body class="body">
      <c:import url="parts/nav.jsp"></c:import>
      <div class="bets_description-section">
         <div class="bets_description_block">
            <div class="bets_description-columns w-row">
               <div class="beta_desc_col1 w-col w-col-8 w-col-stack">
                  <div class="bets_discr_tabs">
                     <div class="title_block w-clearfix">
                        <h1 class="discr_title_text news">Новости</h1>
                        <a href="${contextPath}/news_${offset}" class="all_news-button w-button">Все новости</a>
                     </div>
                  </div>
                  <div class="news_container new">
                     <div class="new_bg-image">
                     </div>
                     <div class="new_tags">
                        <div class="text-block-44">тег 1</div>
                        <div class="text-block-44">тег 2</div>
                        <div class="added-date new">Добавлено: ${news.dateStr}</div>
                     </div>
                     <div class="new_text-block">
                        <h2 class="new_title">${news.title}</h2>
                        <h3 class="heading-13">${news.sport}. ${news.competition}. ${news.description}</h3>
                        <a class="source_link" rel="nofollow" href="https://www.eurosport.ru/" target="_blank">Источник: Eurosport.ru</a>
                     </div>
                  </div>
               </div>
               <div class="bets_desc-col2 w-col w-col-4 w-col-stack">
                  <c:import url="parts/sidePopularNews.jsp"></c:import>
               </div>
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