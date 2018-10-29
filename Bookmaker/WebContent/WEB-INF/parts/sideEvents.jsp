<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="column-14 w-col w-col-4 w-col-stack">
<div class="singleforecasts">
   <div class="stavka-block w-clearfix">
      <div class="odinochnie-prognozy">Одиночные прогнозы</div>
      <div class="text-block-27">
         <a href="#" class="link-4">Все прогнозы</a>
      </div>
   </div>
   <div class="express">
      <div data-duration-in="300" data-duration-out="100" data-easing="ease-in-out-quad" class="tabs w-tabs">
         <div class="tab-menu w-tab-menu">
            <a data-w-tab="football" class="tab_link_sport w-inline-block w-clearfix w-tab-link w--current">
               <div class="text-block-13">Футбол</div>
               <img src="/Static/bootstrap/img/sportsIconsNew/soccer-ball.svg" width="18" alt="" class="image" />
            </a>
            <a data-w-tab="basketball" class="tab_link_sport w-inline-block w-clearfix w-tab-link">
               <div class="text-block-13">Баскетбол</div>
               <img src="/Static/bootstrap/img/sportsIconsNew/volley-ball.svg" width="18" alt="" class="image-2" />
            </a>
            <a data-w-tab="hockey" class="tab_link_sport w-inline-block w-clearfix w-tab-link">
               <div class="text-block-13">Хоккей</div>
               <img src="/Static/bootstrap/img/sportsIconsNew/hockey.svg" width="17" alt="" class="image-3" />
            </a>
            <a data-w-tab="tennis" class="tab_link_sport w-inline-block w-clearfix w-tab-link">
               <div class="text-block-13">Теннис</div>
               <img src="/Static/bootstrap/img/sportsIconsNew/tennis-ball.svg" width="18" alt="" class="image-4" />
            </a>
         </div>
         <div class="tabs-content w-tab-content">
            <div data-w-tab="football" class="tab-pane-tab-1 w-tab-pane w--tab-active">
               <c:forEach var="footballIvents" items="${football}">
               <div class="express-content">
                  <div class="football-text">
                     <div class="w-row">
                        <div class="column-16 w-col w-col-9 w-col-small-6">
                           <img src="/Static/bootstrap/img/sportsIconsNew/soccer-ball.svg" width="20" alt="" class="ball-img" />
                           <div class="text-block-14">${footballIvents.competition}</div>
                        </div>
                        <div class="w-clearfix w-col w-col-3 w-col-small-6">
                           <a href="${contextPath}/event_description_${footballIvents.iventID}_details" class="link-5">Подробнее</a>
                        </div>
                     </div>
                  </div>
                  <div class="columns-2 w-row">
                     <div class="w-clearfix w-col w-col-6 w-col-small-6">
                        <div class="text-block-17">${footballIvents.name}</div>
                     </div>
                     <div class="column-15 w-clearfix w-col w-col-6 w-col-small-6">
                        <div class="text-block-16 _2">
                           <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${footballIvents.coefficient}" />
                        </div>
                        <div class="text-block-16">${footballIvents.bet}</div>
                     </div>
                  </div>
               </div>
               </c:forEach>
            </div>
            <div data-w-tab="basketball" class="w-tab-pane">
               <c:forEach var="basketballIvents" items="${basketball}">
                  <div class="express-content">
                     <div class="football-text">
                        <div class="w-row">
                           <div class="column-16 w-col w-col-9 w-col-small-6">
                              <img src="/Static/bootstrap/img/sportsIconsNew/volley-ball.svg" width="20" alt="" class="ball-img" />
                              <div class="text-block-14">${basketballIvents.competition}</div>
                           </div>
                           <div class="w-clearfix w-col w-col-3 w-col-small-6">
                              <a href="${contextPath}/event_description_${basketballIvents.iventID}_details" class="link-5">Подробнее</a>
                           </div>
                        </div>
                     </div>
                     <div class="columns-2 w-row">
                        <div class="w-clearfix w-col w-col-6 w-col-small-6">
                           <div class="text-block-17">${basketballIvents.name}</div>
                        </div>
                        <div class="column-15 w-clearfix w-col w-col-6 w-col-small-6">
                           <div class="text-block-16 _2">
                              <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${basketballIvents.coefficient}" />
                           </div>
                           <div class="text-block-16">${basketballIvents.bet}</div>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div>
            <div data-w-tab="hockey" class="w-tab-pane">
               <c:forEach var="hockeyIvents" items="${hockey}">
                  <div class="express-content">
                     <div class="football-text">
                        <div class="w-row">
                           <div class="column-16 w-col w-col-9 w-col-small-6">
                              <img src="/Static/bootstrap/img/sportsIconsNew/hockey.svg" width="20" alt="" class="ball-img" />
                              <div class="text-block-14">${hockeyIvents.competition}</div>
                           </div>
                           <div class="w-clearfix w-col w-col-3 w-col-small-6">
                              <a href="${contextPath}/event_description_${hockeyIvents.iventID}_details" class="link-5">Подробнее</a>
                           </div>
                        </div>
                     </div>
                     <div class="columns-2 w-row">
                        <div class="w-clearfix w-col w-col-6 w-col-small-6">
                           <div class="text-block-17">${hockeyIvents.name}</div>
                        </div>
                        <div class="column-15 w-clearfix w-col w-col-6 w-col-small-6">
                           <div class="text-block-16 _2">
                              <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${hockeyIvents.coefficient}" />
                           </div>
                           <div class="text-block-16">${hockeyIvents.bet}</div>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div>
            <div data-w-tab="tennis" class="w-tab-pane">
               <c:forEach var="tennisIvents" items="${tennis}">
                  <div class="express-content">
                     <div class="football-text">
                        <div class="w-row">
                           <div class="column-16 w-col w-col-9 w-col-small-6">
                              <img src="/Static/bootstrap/img/sportsIconsNew/tennis-ball.svg" width="20" alt="" class="ball-img" />
                              <div class="text-block-14">${tennisIvents.competition}</div>
                           </div>
                           <div class="w-clearfix w-col w-col-3 w-col-small-6">
                              <a href="${contextPath}/event_description_${tennisIvents.iventID}_details" class="link-5">Подробнее</a>
                           </div>
                        </div>
                     </div>
                     <div class="columns-2 w-row">
                        <div class="w-clearfix w-col w-col-6 w-col-small-6">
                           <div class="text-block-17">${tennisIvents.name}</div>
                        </div>
                        <div class="column-15 w-clearfix w-col w-col-6 w-col-small-6">
                           <div class="text-block-16 _2">
                              <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${tennisIvents.coefficient}" />
                           </div>
                           <div class="text-block-16">${tennisIvents.bet}</div>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div>
            <div class="express-content button-block">
               <div class="football-text">
                  <a href="${contextPath}/events_list" class="button_all w-button">Все прогнозы</a>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>