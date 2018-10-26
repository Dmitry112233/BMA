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
      <link href="/Static/bootstrap/css/style-${cssVersion}.css" rel="stylesheet">      
      <script src="/Static/bootstrap/js/progressBarBkDescription.js"></script>
      <script src="/Static/bootstrap/js/comments.js"></script>      
      <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
   </head>
   <body class="body">
      <c:import url="parts/nav.jsp"></c:import>
      <div class="hero_bookmaker_section">
         <div class="hero_wrapper_bookmaker">
            <div class="hero_wrapper_block">
               <div id="w-node-6a514ac2de5f-0f967a12" class="title-and-image-block">
                  <div id="w-node-b77efebebee1-0f967a12" class="title_bookmaker_block">
                     <a href="${contextPath}/bookmakers" id="w-node-3a7defcb2b8b-0f967a12" class="button-5 w-button">Все букмекеры</a>
                     <a href="counter?id=${bookmaker.bookMakerId}" target="_blank" id="w-node-fe17e119559d-0f967a12" class="btn_bookmaker_black w-button">Перейти на сайт</a>
                     <h1 id="w-node-379fc290d712-0f967a12" class="title_text_bookmaker">${Bookmaker_H1}</h1>
                  </div>
               </div>
               <div id="w-node-e810e40df812-0f967a12" class="criteria_bookmaker">
                  <div id="w-node-e810e40df81a-0f967a12" class="criteria_title">
                     <div id="w-node-e810e40df81b-0f967a12" class="criteria-text">Критерии</div>
                     <img src="/Static/bootstrap/img/bkLogo/${bookmaker.name}.png" onerror="this.style.display='none'" width="80" height="26" id="w-node-e810e40df81d-0f967a12" alt="${bookmaker.name} logo" />                     
                  </div>
                  <div id="w-node-e810e40df813-0f967a12" class="columns-3 w-row">
                     <div class="column-rating-settings w-col w-col-10 w-col-small-6 w-col-tiny-6">
                        <div class="criteria-rating-text">НАДЕЖНОСТЬ</div>
                        <div class="criteria-rating-progress progressBar">
                           <div class="criteria-rating-progress dynamic progressBarDone"><p class="progressValue">${bookmaker.reliability}</p></div>
                        </div>
                     </div>
                     <div class="column-rating-settings _2 w-col w-col-2 w-col-small-6 w-col-tiny-6">
                     </div>
                  </div>
                  <div id="w-node-e810e40df83a-0f967a12" class="rating-numeral">
                     <div class="criteria-rating-text numeral">${bookmaker.reliability}</div>
                  </div>
                  <div id="w-node-e810e40df81e-0f967a12" class="columns-3 w-row">
                     <div class="column-rating-settings w-col w-col-10 w-col-small-6 w-col-tiny-6">
                        <div class="criteria-rating-text">ЛИНИЯ</div>
                        <div class="criteria-rating-progress progressBar">
                           <div class="criteria-rating-progress dynamic progressBarDone"><p class="progressValue">${bookmaker.line}</p></div>
                        </div>
                     </div>
                     <div class="column-rating-settings _2 w-col w-col-2 w-col-small-6 w-col-tiny-6">
                     </div>
                  </div>
                  <div id="w-node-e810e40df83d-0f967a12" class="rating-numeral">
                     <div class="criteria-rating-text numeral">${bookmaker.line}</div>
                  </div>
                  <div id="w-node-e810e40df833-0f967a12" class="columns-3 w-row">
                     <div class="column-rating-settings w-col w-col-10 w-col-small-6 w-col-tiny-6">
                        <div class="criteria-rating-text">УДОБСТВО РАБОТЫ</div>
                        <div class="criteria-rating-progress progressBar">
                           <div class="criteria-rating-progress dynamic progressBarDone"><p class="progressValue">${bookmaker.usability}</p></div>
                        </div>
                     </div>
                     <div class="column-rating-settings _2 w-col w-col-2 w-col-small-6 w-col-tiny-6">
                     </div>
                  </div>
                  <div id="w-node-e810e40df825-0f967a12" class="rating-numeral">
                     <div class="criteria-rating-text numeral">${bookmaker.usability}</div>
                  </div>
                  <div id="w-node-e810e40df828-0f967a12" class="rating_general">
                     <div id="w-node-e810e40df829-0f967a12" class="rating-numeral">
                        <div class="criteria-rating-text numeral">${bookmaker.result}</div>
                     </div>
                     <div id="w-node-e810e40df82c-0f967a12" class="columns-3 w-row">
                        <div class="column-rating-settings w-col w-col-10 w-col-small-6 w-col-tiny-6">
                           <div class="criteria-rating-text">ОБЩИЙ РЕЙТИНГ</div>
                           <div class="criteria-rating-progress progressBar">
                              <div class="criteria-rating-progress dynamic progressBarDone"><p class="progressValue">${bookmaker.result}</p></div>
                           </div>
                        </div>
                        <div class="column-rating-settings _2 w-col w-col-2 w-col-small-6 w-col-tiny-6">
                        </div>
                     </div>
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
               <div id="w-node-6e4e2e1f6acc-0f967a12" class="pluses">
                  <div class="blockTitle">Минусы</div>
                  ${bookmaker.minuses}
               </div>
               <div id="w-node-438b71409009-0f967a12" class="pluses">
                  <div class="blockTitle">Плюсы</div>
                  ${bookmaker.pluses}                  
               </div>
            </div>
         </div>
         <div class="col_general_seo_text">
            <div class="w-row">
               <div class="col_seo_text w-col w-col-8 w-col-stack">
                  <div class="seoBlock">
                     ${Bookmaker_Txt}
                  </div>
               </div>
               <c:import url="parts/comments.jsp"></c:import>
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