<!DOCTYPE html>
<html lang="ru">
   <head>
      <title>${Event_T}</title>      
      <meta name="Description" content="${Event_D}"/>      
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
            <div class="title_block w-clearfix">
              <h1 class="discr_title_text">${Event_H1}</h1>
            </div>
          </div>
          <div class="exp_discr-content">
            <div class="exp_discr-title w-clearfix">
              <div id="w-node-35fb8bf332ba-29184134" class="div-block-17 position">
                <div id="w-node-35fb8bf332bb-29184134" class="date_block">Дата начала: ${allEvents.get('футбол').get(0).dateStr}</div>
              </div>
            </div>
            <div data-duration-in="300" data-duration-out="100" class="bets_discription-tabs w-tabs">

<div class="discr_tabs-menu _2 w-tab-menu">
                <a data-w-tab="Tab 1" class="discr_tab-link w-inline-block w-tab-link w--current">
                  <div class="discr_tab-linktext">Футбол</div>
                </a>
                <a data-w-tab="Tab 8" class="discr_tab-link w-inline-block w-tab-link">
                  <div class="discr_tab-linktext">
                    <strong>Хоккей</strong>
                  </div>
                </a>
                <a data-w-tab="Tab 9" class="discr_tab-link w-inline-block w-tab-link">
                  <div class="discr_tab-linktext">
                    <strong>Теннис</strong>
                  </div>
                </a>
                <a data-w-tab="Tab 10" class="discr_tab-link w-inline-block w-tab-link">
                  <div class="discr_tab-linktext">
                    <strong>Баскетбол</strong>
                  </div>
                </a>
              </div>

		              
					              
               					<div class="express_discription-tabs_content w-tab-content">
					                <div data-w-tab="Tab 1" class="discr_tabs_content w-tab-pane w--tab-active">
					                  <c:set var="tableRow" value="0" />
					                  <c:forEach var="footballEvents" items="${football}">
					                  <div class="sport_matches_item event" onclick="window.location.href='event_description_${footballEvents.iventID}_details'; return false">
					                      <div class="eventRowHeader">
					                        <div class="exp_sports_text event">${footballEvents.competition}</div>
					                        <c:if test="${footballEvents.result == NULL}">
						                        <div class="bets_status white">
						                        	<div class="bets_status_text white">Начало ${footballEvents.time}</div>
						                        </div>
					                        </c:if>
					                      </div>
					                      <div class="eventRowData">
					                        <div class="exp_matches_num"><c:out value="${tableRow=tableRow+1}" /></div>
					                        <div class="exp_matches"><a href="${contextPath}/event_description_${footballEvents.iventID}_details">${footballEvents.name}</a></div>
					                        <div class="exp_itm">${footballEvents.bet}</div>
					                        <div class="exp_score"><fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${footballEvents.coefficient}" /></div>
					                        <c:if test="${footballEvents.result == NULL}"><a href="counter?id=${BookmakerWeightList.get(randID).bookMakerId}" class="replay_bets-link">Повторить ставку</a></c:if>
					                        <c:if test="${footballEvents.result != NULL}">  
					                        		<div class="bets_status <c:if test="${footballEvents.result == 'Не прошел'}">red</c:if>">
					                        			<div class="bets_status_text <c:if test="${footballEvents.result == 'Не прошел'}">red</c:if>">${footballEvents.result}</div>
					                        		</div>
					                        	</c:if>                      
					                      </div>
					                  </div>
					                  </c:forEach>
					                </div>
					                
					                
					                <div data-w-tab="Tab 8" class="discr_tabs_content w-tab-pane">
					                	<c:set var="tableRow" value="0" />
					                  <c:forEach var="hockeyEvents" items="${hockey}">
					                  <div class="sport_matches_item event" onclick="window.location.href='event_description_${hockeyEvents.iventID}_details'; return false">
					                      <div class="eventRowHeader">
					                        <div class="exp_sports_text event">${hockeyEvents.competition}</div>
					                        <c:if test="${hockeyEvents.result == NULL}">
						                        <div class="bets_status white">
						                        	<div class="bets_status_text white">Начало ${hockeyEvents.time}</div>
						                        </div>
					                        </c:if>
					                      </div>
					                      <div class="eventRowData">
					                        <div class="exp_matches_num"><c:out value="${tableRow=tableRow+1}" /></div>
					                        <div class="exp_matches"><a href="${contextPath}/event_description_${hockeyEvents.iventID}_details">${hockeyEvents.name}</a></div>
					                        <div class="exp_itm">${hockeyEvents.bet}</div>
					                        <div class="exp_score"><fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${hockeyEvents.coefficient}" /></div>
					                        <c:if test="${hockeyEvents.result == NULL}"><a href="counter?id=${BookmakerWeightList.get(randID).bookMakerId}" class="replay_bets-link">Повторить ставку</a></c:if>
					                        <c:if test="${hockeyEvents.result != NULL}">  
					                        		<div class="bets_status <c:if test="${hockeyEvents.result == 'Не прошел'}">red</c:if>">
					                        			<div class="bets_status_text <c:if test="${hockeyEvents.result == 'Не прошел'}">red</c:if>">${hockeyEvents.result}</div>
					                        		</div>
					                        	</c:if>                      
					                      </div>
					                  </div>
					                  </c:forEach>
					                </div>
					                
					                <div data-w-tab="Tab 9" class="discr_tabs_content w-tab-pane">
					                	<c:set var="tableRow" value="0" />
					                  <c:forEach var="tennisEvents" items="${tennis}">
					                  <div class="sport_matches_item event" onclick="window.location.href='event_description_${tennisEvents.iventID}_details'; return false">
					                      <div class="eventRowHeader">
					                        <div class="exp_sports_text event">${tennisEvents.competition}</div>
					                        <c:if test="${tennisEvents.result == NULL}">
						                        <div class="bets_status white">
						                        	<div class="bets_status_text white">Начало ${tennisEvents.time}</div>
						                        </div>
					                        </c:if>
					                      </div>
					                      <div class="eventRowData">
					                        <div class="exp_matches_num"><c:out value="${tableRow=tableRow+1}" /></div>
					                        <div class="exp_matches"><a href="${contextPath}/event_description_${tennisEvents.iventID}_details">${tennisEvents.name}</a></div>
					                        <div class="exp_itm">${tennisEvents.bet}</div>
					                        <div class="exp_score"><fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${tennisEvents.coefficient}" /></div>
					                        <c:if test="${tennisEvents.result == NULL}"><a href="counter?id=${BookmakerWeightList.get(randID).bookMakerId}" class="replay_bets-link">Повторить ставку</a></c:if>
					                        <c:if test="${tennisEvents.result != NULL}">  
					                        		<div class="bets_status <c:if test="${tennisEvents.result == 'Не прошел'}">red</c:if>">
					                        			<div class="bets_status_text <c:if test="${tennisEvents.result == 'Не прошел'}">red</c:if>">${tennisEvents.result}</div>
					                        		</div>
					                        	</c:if>                      
					                      </div>
					                  </div>
					                  </c:forEach>
					                </div>
					                
					                <div data-w-tab="Tab 10" class="discr_tabs_content w-tab-pane">
					                <c:set var="tableRow" value="0" />
					                  <c:forEach var="bascketballEvents" items="${bascketball}">
					                  <div class="sport_matches_item event" onclick="window.location.href='event_description_${bascketballEvents.iventID}_details'; return false">
					                      <div class="eventRowHeader">
					                        <div class="exp_sports_text event">${bascketballEvents.competition}</div>
					                        <c:if test="${bascketballEvents.result == NULL}">
						                        <div class="bets_status white">
						                        	<div class="bets_status_text white">Начало ${bascketballEvents.time}</div>
						                        </div>
					                        </c:if>
					                      </div>
					                      <div class="eventRowData">
					                        <div class="exp_matches_num"><c:out value="${tableRow=tableRow+1}" /></div>
					                        <div class="exp_matches"><a href="${contextPath}/event_description_${bascketballEvents.iventID}_details">${bascketballEvents.name}</a></div>
					                        <div class="exp_itm">${bascketballEvents.bet}</div>
					                        <div class="exp_score"><fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${bascketballEvents.coefficient}" /></div>
					                        <c:if test="${bascketballEvents.result == NULL}"><a href="counter?id=${BookmakerWeightList.get(randID).bookMakerId}" class="replay_bets-link">Повторить ставку</a></c:if>
					                        <c:if test="${bascketballEvents.result != NULL}">  
					                        		<div class="bets_status <c:if test="${bascketballEvents.result == 'Не прошел'}">red</c:if>">
					                        			<div class="bets_status_text <c:if test="${bascketballEvents.result == 'Не прошел'}">red</c:if>">${bascketballEvents.result}</div>
					                        		</div>
					                        	</c:if>                      
					                      </div>
					                  </div>
					                  </c:forEach>					                
					                </div>
					                
					              </div>
              
            </div>
          </div>
          <div class="seoBlock">
                     ${Event_Txt}
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