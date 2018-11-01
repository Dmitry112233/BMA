<!DOCTYPE html>
<html lang="ru">
   <head>
      <title>${Express_T}</title>      
      <meta name="Description" content="${Express_D}"/>      
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
      <link rel="canonical" href="https://findbestbet.ru/expresses_list_0"/>
   </head>
   <body class="body">
      <c:import url="parts/nav.jsp"></c:import>
      <div class="express_bets-section">
    <div class="express_bets-block">
      <div class="col_express-bets w-row">
        <div class="col-1_express_bets w-col w-col-8 w-col-stack">
          <div class="express_block_title">
            <h1 class="express_bets_title_text">${Express_H1}</h1>
          </div>
          
          
          <c:forEach var="express" items="${expressList}">
          <div class="sport_matches_item">
            <div class="exp_block w-clearfix">
              <h3 class="heading-12">Экспресс</h3>
              <div class="date__start_game">
                <div class="text-block-39">Дата начала: <span class="date_span">${express.dateStr}</span></div>
              </div>
            </div>
            
            <div class="myExpressWrapper">
            		<c:set var="tableRow" value="0" />
            		<c:forEach var="ivent" items="${express.iventList}">
		            <div class="myExpressRows dark">
		            	<div class="sportIconFr"><img class="sportIcon" src="${ivent.sportIcon}"></div>
		            	<div class="exp_sports_text">${ivent.competition}</div>
		            	<div></div>
		            	<div></div>
		            </div>
		            
		            <div class="myExpressRows light">
		            	<div class="exp_matches_num"><c:out value="${tableRow=tableRow+1}" /></div>
		            	<div class="exp_matches">${ivent.name}</div>
		            	<div class="exp_itm">${ivent.bet}</div>
		            	<div class="exp_score"><fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${ivent.coefficient}" /></div>
		            </div>
		            </c:forEach>
		            
		            <div class="myExpressFooter">
		            	<div class="final_result_text">Итоговый коэффициент: <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${express.resultCoeff}" /></div>		            	
		            	<div class="exp_btn_replay_fr">
		            		<a class="exp_btn_replay w-button" rel="nofollow" href="counter?id=${BookmakerWeightList.get(randID).bookMakerId}" target="_blank">Повторить ставку</a>
		            	</div>	
		            	<div class="exp_description_btn_fr">
		            		<a class="exp_description_btn w-button" href="${contextPath}/express_${express.expressID}_description">Описание экспресса</a>
		            	</div>
		            </div>
            </div>
              </div>          
                  </c:forEach>
                  
				      <ul >
				         <c:forEach var="button" items="${pageMass}">
				            <c:if test = "${button + 1 == currentPage}">
				               <li><a class="page-link" href="${contextPath}/expresses_list_${button * 20}">${button + 1}</a></li>
				            </c:if>
				            <c:if test = "${button + 1 != currentPage}">
				               <li><a class="page-link" href="${contextPath}/expresses_list_${button * 20}">${button + 1}</a></li>
				            </c:if>
				         </c:forEach>
				      </ul>
				        
          <c:if test = "${Express_Txt != Null}">
      		<div class="seoBlock">${Express_Txt}</div>
      		<br>
   		  </c:if>
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