<!DOCTYPE html>	
<html lang="ru">
   <head>
      <title>Новости спорта для ставок у букмекеров | findbestbet.ru</title>
      <meta name="Description" content="Новости спорта для ставок у букмекеров | findbestbet.ru ⚽ Актуальная информация о матчах, коэффициентах и ставках на спорт"/>
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
      <link rel="canonical" href="https://findbestbet.ru/news_0"/>
   </head>
   <body class="body">
      <c:import url="parts/nav.jsp"></c:import>
      <div class="bets_description-section">
         <div class="bets_description_block">
            <div class="bets_description-columns w-row">
               <div class="beta_desc_col1 w-col w-col-8 w-col-stack">
                  <div class="bets_discr_tabs">
                     <div class="title_block w-clearfix">
                        <h1 class="discr_title_text news">Новости спорта для ставок</h1>
                     </div>
                  </div>
                  <div class="news_container">
                     <c:forEach var="newsItem" items="${newsList}">
                        <div class="new_1">
                           <div class="w-row">
                              <div class="column-21 w-col w-col-4">
                                 <div class="news_bg_img myNewsBGImg" style="background-image: url('${newsItem.image}')" onclick="window.location.href='${contextPath}/${newsItem.id}_news_${currentPage}'; return false">
                                 </div>
                              </div>
                              <div class="w-col w-col-8">
                                 <div class="news_title-block">
                                    <a href="${contextPath}/${newsItem.id}_news_${currentPage}">${newsItem.title}</a>
                                    <div class="text-block-42">${newsItem.description}</div>
                                    <div class="col_news-tags w-row">
                                       <div class="w-col w-col-8 w-col-medium-6 w-col-small-6 w-col-tiny-12">
                                          <div class="news-tags tags">${newsItem.sport}</div>
                                          <div class="news-tags _2nd tags">${newsItem.competition}</div>
                                       </div>
                                       <div class="w-clearfix w-col w-col-4 w-col-medium-6 w-col-small-6 w-col-tiny-12 allNewsDateBlock">
                                          <div class="added-date all">Добавлено: ${newsItem.dateStr}</div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                      <nav class="myPaginationBlock">
					      <ul class="pagination">
					         <c:forEach var="button" items="${pageMass}">
					            <c:if test = "${button + 1 == currentPage}">
					               <li class="page-item active"><a class="page-link" href="${contextPath}/news_${button * 10}">${button + 1}</a></li>
					            </c:if>
					            <c:if test = "${button + 1 != currentPage}">
					               <li class="page-item"><a class="page-link" href="${contextPath}/news_${button * 10}">${button + 1}</a></li>
					            </c:if>
					         </c:forEach>
					      </ul>
					  </nav>
                  </div>
               </div>
               <div class="bets_desc-col2 w-col w-col-4 w-col-stack">
                  <c:import url="parts/sidePopularNews.jsp"></c:import>
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