<!DOCTYPE html>
<html lang="ru">
   <head>
      <title>Описание экспресса ${express.iventList.get(0).name}: ${express.iventList.get(0).bet}; ${express.iventList.get(express.iventList.size()-1).name}: ${express.iventList.get(express.iventList.size()-1).bet} | findbestbet.ru</title>
      <meta name="Description" content="Описание экспресса ${express.iventList.get(0).name}: ${express.iventList.get(0).bet}; ${express.iventList.get(express.iventList.size()-1).name}: ${express.iventList.get(express.iventList.size()-1).bet} | findbestbet.ru ⚽ Актуальная информация о матчах, коэффициентах и ставках на спорт"/>
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
               <div class="myExpressDescrBlock beta_desc_col1 w-col w-col-8 w-col-stack">
                  <div class="title_block eventDescr questionTitle">
                     <div class="discr_title_text_block">
                        <h1 class="discr_title_text">Описание экспресса ${express.iventList.get(0).name}: ${express.iventList.get(0).bet}; ${express.iventList.get(express.iventList.size()-1).name}: ${express.iventList.get(express.iventList.size()-1).bet}</h1>
                     </div>
                     <div class="btn_all-bets_block">
                        <a href="${contextPath}/expresses_list_${offset}" class="discr_title_button w-button">Все экспрессы</a>
                     </div>
                  </div>
                  <div class="exp_discr-content">
                     <div class="exp_discr-title w-clearfix">
                        <h3 class="exp_discr-h3">Экспресс</h3>
                        <div id="w-node-8374c0a44c1c-b178b9c7" class="div-block-17 position">
                           <div id="w-node-8374c0a44c1d-b178b9c7" class="date_block">Дата начала: ${express.dateStr}</div>
                        </div>
                     </div>
                     <div class="myExpressWrapper descr">
                        <c:set var="tableRow" value="0" />
                        <c:forEach var="ivent" items="${express.iventList}">
                           <div class="myExpressRows dark">
                              <div class="sportIconFr"><img class="sportIcon" src="${ivent.sportIcon}"></div>
                              <div class="exp_sports_text">${ivent.competition}</div>
                              <div></div>
                              <div></div>
                           </div>
                           <div class="myExpressRows light">
                              <div class="exp_matches_num">
                                 <c:out value="${tableRow=tableRow+1}" />
                              </div>
                              <div class="exp_matches">${ivent.name}</div>
                              <div class="exp_itm">${ivent.bet}</div>
                              <div class="exp_score">
                                 <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${ivent.coefficient}" />
                              </div>
                           </div>
                        </c:forEach>
                        <div class="myExpressFooter">
                           <div class="final_result_text">Итоговый коэффициент: <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${express.resultCoeff}" /></div>
                           <div class="exp_btn_replay_fr"></div>
                           <div></div>
                        </div>
                        <div class="seoBlock eventDescr">
                           <p>${express.description}</p>
                        </div>
                        <div class="replay_matches_block">
                      <div class="columns-4 w-row">
                        <div class="w-col w-col-8">
                          <div class="replay_bets-text">Хочешь повторить экспресс?</div>
                        </div>
                        <div class="w-clearfix w-col w-col-4">
                          <a class="replay_bets-button w-button" rel="nofollow" href="counter?id=${BookmakerWeightList.get(randID).bookMakerId}" target="_blank">Повторить экспресс</a>
                        </div>
                      </div>
                    </div>
                     </div>
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