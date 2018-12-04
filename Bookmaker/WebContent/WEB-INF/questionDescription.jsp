<!DOCTYPE html>	
<html lang="ru">
   <head>
      <title>${Question_T}</title>
      <meta name="Description" content="${Question_D}"/>
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
      <div class="bets_description-section">
         <div class="bets_description_block">
            <div class="bets_description-columns w-row">
               <div class="beta_desc_col1 w-col w-col-8 w-col-stack">
                  <div class="title_block eventDescr questionTitle">
                     <div class="discr_title_text_block">
                        <h1 class="discr_title_text">${Question_H1}</h1>
                     </div>
                     <div class="btn_all-bets_block">
                        <a href="${contextPath}/faq_list" class="btn_all-bets w-button">Все вопросы</a>
                     </div>
                  </div>
                  <c:if test = "${Question_Txt != Null}">
	                  <div class="seoBlock tablepage">
	                  	<div class="article">${Question_Txt}</div>
	                  </div>
                  </c:if>
                  <c:if test = "${question.answer != ''}">
	                  <div class="seoBlock tablepage questionAnswer">
	                     <div>${question.answer}</div>
	                  </div>
                  </c:if>
               </div>
               <div class="col_table_champ w-col w-col-4 w-col-stack sideLeagueTablePart">
               		<div class="sideBannersBlock leagueMatchesPage">
	               		<c:set var="bkName" value="1xBet" scope="request"/>
		               <c:set var="bkLink" value="counter?id=${bookmakerList.get('1xBet').bookMakerId}" scope="request"/>
		               <c:import url="parts/sideBanner.jsp"></c:import>
		               <c:set var="bkName" value="БК ЛЕОН" scope="request"/>
		               <c:set var="bkLink" value="counter?id=${bookmakerList.get('БК ЛЕОН').bookMakerId}" scope="request"/>
		               <c:import url="parts/sideBanner.jsp"></c:import>
		               <c:set var="bkName" value="Лига Ставок" scope="request"/>
		               <c:set var="bkLink" value="counter?id=${bookmakerList.get('Лига Ставок').bookMakerId}" scope="request"/>
		               <c:import url="parts/sideBanner.jsp"></c:import>
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