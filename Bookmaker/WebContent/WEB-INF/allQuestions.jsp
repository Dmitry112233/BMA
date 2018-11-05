<!DOCTYPE html>	
<html lang="ru">
   <head>
      <title>${FAQ_T}</title>
      <meta name="Description" content="${FAQ_D}"/>
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
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
   </head>
   <body class="body">
      <c:import url="parts/nav.jsp"></c:import>
      <div class="questions_section">
         <div class="questions_container">
            <h1 class="heading-14">${FAQ_H1}</h1>
            <div class="questions_cards_block">
               <div class="columns-7 w-row">
                  <c:forEach var="question" items="${questionsList}">
                     <div class="column-22 w-col w-col-3 w-col-medium-6">
                        <div class="cards_item">
                           <div class="questions_cards_text">${question.question}</div>
                           <a href="${contextPath}/faq_list_${question.questionID}_details" class="button_questions w-button">Подробнее</a>
                        </div>
                     </div>
                  </c:forEach>
               </div>
            </div>
         </div>
      </div>
      <div class="bets_description-section">
         <div class="bets_description_block">
            <div class="bets_description-columns w-row">
               <div class="beta_desc_col1 w-col w-col-8 w-col-stack">
                  <div class="seoBlock tablepage">
                     ${FAQ_Txt}
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