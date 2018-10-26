<!DOCTYPE html>
<html lang="ru">
   <head>
      <title>${bookmakers_T}</title>
      <meta name="Description" content="${bookmakers_D}"/>
      <meta name="Keywords" content=""/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="all"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>
      <meta name="google-site-verification" content="zxpjmOEovT6ZSjOnOYmVyz0q1t-7QcqfxAd41aUkP8M" />
      <link rel="shortcut icon" href="/Static/bootstrap/img/favicon.ico" type="image/x-icon">
      <link href="/Static/bootstrap/css/style-${cssVersion}.css" rel="stylesheet">
      <script src="/Static/bootstrap/js/progressBarBkComparsion.js"></script>
      <script src="/Static/bootstrap/js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
      ${relCanonical}
   </head>
   <body class="body">
      <div class="wrapper">
         <c:import url="parts/nav.jsp"></c:import>
         <div class="container">
            <c:import url="parts/promoSlider.jsp"></c:import>
            <div class="col w-row">
               <c:import url="parts/bkList.jsp"></c:import>
               <c:import url="parts/sideNews.jsp"></c:import>
            </div>
            
            <div class="newsletter">
               <div class="w-row">
                  <div class="column-8 w-col w-col-8">
                     <h2 class="news-titl">Последние новости</h2>
                     <div class="news-block">
                        <div class="div-block-11">
                           <div class="text-block-20">Футбол. Чемпионат Англии</div>
                        </div>
                        <div class="news-titlee">
                           <h3 class="heading-6">Миллион тому, кто найдет Лукаку на поле – еще миллион за Лингарда
                              <a href="#" class="link-3">
                              <span class="news-link">читать полностью</span>
                              </a>
                           </h3>
                        </div>
                     </div>
                  </div>
                  <div class="column-7 w-col w-col-4">
                     <h2 class="news-titl">Новости одной строкой</h2>
                     <div class="news-1">
                        <div class="col-2-news w-row">
                           <div class="col-news-1 w-col w-col-2">
                              <div class="div-block-12">
                                 <div class="text-block-22">12:21</div>
                              </div>
                           </div>
                           <div class="w-col w-col-10">
                              <div class="text-block-21">
                                 <strong>У «Тоттенхэма» закончились вратари, и с «Брайтоном»</strong>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="news-1">
                        <div class="col-2-news w-row">
                           <div class="col-news-1 w-col w-col-2">
                              <div class="div-block-12">
                                 <div class="text-block-22">12:21</div>
                              </div>
                           </div>
                           <div class="w-col w-col-10">
                              <div class="text-block-21">Уикенд готовит много интересных матчей. У тебя есть шансы разбогатеть</div>
                           </div>
                        </div>
                     </div>
                     <div class="news-1">
                        <div class="col-2-news w-row">
                           <div class="col-news-1 w-col w-col-2">
                              <div class="div-block-12">
                                 <div class="text-block-22">21:21</div>
                              </div>
                           </div>
                           <div class="w-col w-col-10">
                              <div class="text-block-21">У «Атлетико» всего одна победа в четырех матчах. Эй, Симеоне, пора исправлять</div>
                           </div>
                        </div>
                     </div>
                     <div class="news-1">
                        <div class="col-2-news w-row">
                           <div class="col-news-1 w-col w-col-2">
                              <div class="div-block-12">
                                 <div class="text-block-22">18:20</div>
                              </div>
                           </div>
                           <div class="w-col w-col-10">
                              <div class="text-block-21">У «Атлетико» всего одна победа в четырех матчах. Эй, Симеоне, пора исправлять</div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="text-section">
         <div class="flex-text-block">
            <div class="w-row">
               <div class="column-13 w-col w-col-8 w-col-stack">               
                  <div class="seoBlock">
                     ${bookmakers_Txt}
                  </div>
               </div>
               <c:import url="parts/sideEvents.jsp"></c:import>
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