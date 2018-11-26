<!DOCTYPE html>
<html lang="ru">
   <head>
      <title>Описание прогноза ${ivent.name} (${ivent.sport}) | findbestbet.ru</title>
      <meta name="Description" content="Описание прогноза ${ivent.name} (${ivent.sport}) | findbestbet.ru ⚽ Актуальная информация о матчах, коэффициентах и ставках на спорт"/>
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
      <div class="bets_description-section">
         <div class="bets_description_block">
            <div class="bets_description-columns w-row">
               <div class="beta_desc_col1 w-col w-col-8 w-col-stack">
                  <div class="bets_discr_tabs">
                     <div class="title_block eventDescr">
                        <div class="discr_title_text_block">
                           <h1 class="discr_title_text">Описание прогноза ${ivent.name} (${ivent.sport})</h1>
                        </div>
                        <div class="btn_all-bets_block">
                           <a href="${contextPath}/events_list" class="btn_all-bets w-button">Все прогнозы</a>
                        </div>
                     </div>
                  </div>
                  <div class="exp_discr-content">
                     <div class="div-block-19">
                        <div class="columns-5 w-row">
                           <div class="w-col w-col-8 w-col-small-6">
                              <p class="myEventDescrCompetition">${ivent.competition}</p>
                           </div>
                           <div class="w-clearfix w-col w-col-4 w-col-small-6">
                              <div class="text-block-40">Дата события: ${ivent.dateStr} ${ivent.time}</div>
                           </div>
                        </div>
                        <div class="columns-6 w-row">
                           <div class="w-col w-col-5">
                              <div class="text-block-41">${ivent.name}</div>
                           </div>
                           <div class="w-col w-col-7">
                              <div class="coeff_p1">${ivent.bet}</div>
                              <div class="coeff_p1 num">
                                 <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${ivent.coefficient}" />
                              </div>
                              <c:if test="${ivent.result != NULL}">
                                 <div class="coeff_red-status <c:if test="${ivent.result == 'Прошел'}">green</c:if>">${ivent.result}</div>
                              </c:if>
                        </div>
                     </div>
                     <div class="eventImageBlock">
                     	<img class="eventImage" src="${ivent.image}" onerror="this.style.display='none'" />
                     </div>
                     <div>${ivent.description}</div>
                     <div class="replay_matches_block">
                        <div class="columns-4 w-row">
                           <div class="w-col w-col-8">
                              <div class="replay_bets-text">Хочешь повторить ставку на событие?</div>
                           </div>
                           <div class="w-clearfix w-col w-col-4">
                              <a class="replay_bets-button w-button" rel="nofollow" href="counter?id=${BookmakerWeightList.get(randID).bookMakerId}" target="_blank">Повторить ставку</a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col_table_champ w-col w-col-4 w-col-stack sideLeagueTablePart leagueMatchesPage">
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