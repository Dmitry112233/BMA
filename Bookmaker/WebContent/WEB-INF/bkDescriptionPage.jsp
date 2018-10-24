<!DOCTYPE html>
<html lang="ru">
   <head>      
      <title>${Bookmaker_T}</title>
      <meta name="Description" content="${Bookmaker_D}"/>
      <meta name="Keywords" content=""/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="all"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>      
      <link rel="shortcut icon" href="/Static/bootstrap/img/favicon.ico" type="image/x-icon">
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>     
      <link href="/Static/bootstrap/css/bootstrap.css" rel="stylesheet">      
      <link href="/Static/bootstrap/css/style-${cssVersion}.css" rel="stylesheet">
      <script src="/Static/bootstrap/js/lineSmall.js"></script>
      <script src="/Static/bootstrap/js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript">
         !function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);
      </script>
   </head>
   <body class="body">
      <c:import url="parts/nav.jsp"></c:import>
      <div class="hero_bookmaker_section">
         <div class="hero_wrapper_bookmaker">
            <div class="hero_wrapper_block">
               <div id="w-node-6a514ac2de5f" class="title-and-image-block">
                  <div id="w-node-b77efebebee1" class="title_bookmaker_block">
                     <a href="${contextPath}/bookmakers" id="w-node-3a7defcb2b8b" class="button-5 w-button">Все букмекеры</a>
                     <a href="counter?id=${bookmaker.bookMakerId}" target="_blank" id="w-node-fe17e119559d" class="btn_bookmaker_black w-button">Перейти на сайт</a>
                     <h1 id="w-node-379fc290d712" class="title_text_bookmaker">${Bookmaker_H1}</h1>
                  </div>
               </div>
               <div id="w-node-e810e40df812" class="criteria_bookmaker">
                  <div id="w-node-e810e40df813" class="columns-3 w-row">
                     <div class="column-rating-settings w-col w-col-10 w-col-small-6 w-col-tiny-6">
                        <div class="criteria-rating-text">НАДЕЖНОСТЬ</div>
                        <div class="criteria-rating-progress">
                           <div class="criteria-rating-progress dynamic">
                           </div>
                        </div>
                     </div>
                     <div class="column-rating-settings _2 w-col w-col-2 w-col-small-6 w-col-tiny-6">
                     </div>
                  </div>
                  <div id="w-node-e810e40df81a" class="criteria_title">
                     <div id="w-node-e810e40df81b" class="criteria-text">Критерии</div>
                     <img src="${bookmaker.image}" width="80" height="26" id="w-node-e810e40df81d" alt="${bookmaker.name} logo" />
                  </div>
                  <div id="w-node-e810e40df81e" class="columns-3 w-row">
                     <div class="column-rating-settings w-col w-col-10 w-col-small-6 w-col-tiny-6">
                        <div class="criteria-rating-text">ЛИНИЯ</div>
                        <div class="criteria-rating-progress">
                           <div class="criteria-rating-progress dynamic">
                           </div>
                        </div>
                     </div>
                     <div class="column-rating-settings _2 w-col w-col-2 w-col-small-6 w-col-tiny-6">
                     </div>
                  </div>
                  <div id="w-node-e810e40df825" class="rating-numeral">
                     <div class="criteria-rating-text numeral">1</div>
                  </div>
                  <div id="w-node-e810e40df828" class="rating_general">
                     <div id="w-node-e810e40df829" class="rating-numeral">
                        <div class="criteria-rating-text numeral">2</div>
                     </div>
                     <div id="w-node-e810e40df82c" class="columns-3 w-row">
                        <div class="column-rating-settings w-col w-col-10 w-col-small-6 w-col-tiny-6">
                           <div class="criteria-rating-text">ОБЩИЙ РЕЙТИНГ</div>
                           <div class="criteria-rating-progress">
                              <div class="criteria-rating-progress dynamic">
                              </div>
                           </div>
                        </div>
                        <div class="column-rating-settings _2 w-col w-col-2 w-col-small-6 w-col-tiny-6">
                        </div>
                     </div>
                  </div>
                  <div id="w-node-e810e40df833" class="columns-3 w-row">
                     <div class="column-rating-settings w-col w-col-10 w-col-small-6 w-col-tiny-6">
                        <div class="criteria-rating-text">УДОБСТВО РАБОТЫ</div>
                        <div class="criteria-rating-progress">
                           <div class="criteria-rating-progress dynamic">
                           </div>
                        </div>
                     </div>
                     <div class="column-rating-settings _2 w-col w-col-2 w-col-small-6 w-col-tiny-6">
                     </div>
                  </div>
                  <div id="w-node-e810e40df83a" class="rating-numeral">
                     <div class="criteria-rating-text numeral">1</div>
                  </div>
                  <div id="w-node-e810e40df83d" class="rating-numeral">
                     <div class="criteria-rating-text numeral">1</div>
                  </div>
               </div>
            </div>
         </div>
         <div class="info_wrapper_bookmaker">
            <div class="grid_payment_systems">
               <c:if test = "${bookmaker.bookMakerId == 1}">
               	<c:import url="parts/payments/1xbetPayments.jsp"></c:import>
               </c:if>
               <c:if test = "${bookmaker.bookMakerId == 2}">
               	<c:import url="parts/payments/LeonPayments.jsp"></c:import>
               </c:if>
               <c:if test = "${bookmaker.bookMakerId == 3}">
               	<c:import url="parts/payments/LigaStavokPayments.jsp"></c:import>
               </c:if>
               <div id="w-node-6e4e2e1f6acc" class="pluses">
                  <div class="blockTitle">Минусы</div>
                  ${bookmaker.minuses}
               </div>
               <div id="w-node-438b71409009" class="pluses">
                  <div class="blockTitle">Плюсы</div>
                  ${bookmaker.pluses}                  
               </div>
            </div>
         </div>
         <div class="col_general_seo_text">
            <div class="w-row">
               <c:import url="parts/seoArticle.jsp"></c:import>
               <c:import url="parts/comments.jsp"></c:import>
            </div>
         </div>
      </div>
      <c:import url="parts/footer.jsp"></c:import>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
      <script src="/Static/bootstrap/js/script.js" type="text/javascript"></script>
      <!--[if lte IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
      <script type="text/javascript" src="/Static/bootstrap/js/mail.js"></script>
      <script type="text/javascript">$(document).ready(function(){$('[href*="brandjs"]').attr('style', 'display:none !important');$('a[href="'+window.location.href+'"]').addClass('w--current');});</script>      
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="/Static/bootstrap/js/bootstrap.js"></script>    
   </body>
</html>