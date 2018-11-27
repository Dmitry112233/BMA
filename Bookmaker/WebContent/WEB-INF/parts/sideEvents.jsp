<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="singleforecasts">
   <div class="stavka-block w-clearfix">
      <div class="odinochnie-prognozy">Одиночные прогнозы</div>
      <div class="all_newstext">
         <a href="${contextPath}/events_list" class="all_newslink">Все прогнозы</a>
      </div>
   </div>
   <div class="express">
      <div data-duration-in="300" data-duration-out="100" data-easing="ease-in-out-quad" class="tabs w-tabs">
         <div class="tab-menu w-tab-menu">
            <a data-w-tab="football" class="tab_link_sport w-inline-block w-clearfix w-tab-link w--current">
               <div class="text-block-13">Футбол</div>
               <img src="/Static/bootstrap/img/sportsIcons/football.png" width="18" class="image sideEventsIcons" onerror="this.style.display='none'" />
            </a>
            <a data-w-tab="hockey" class="tab_link_sport w-inline-block w-clearfix w-tab-link">
               <div class="text-block-13">Хоккей</div>
               <img src="/Static/bootstrap/img/sportsIcons/icehockey.png" width="17" class="image-3 sideEventsIcons" onerror="this.style.display='none'" />
            </a>
            <a data-w-tab="tennis" class="tab_link_sport w-inline-block w-clearfix w-tab-link">
               <div class="text-block-13">Теннис</div>
               <img src="/Static/bootstrap/img/sportsIcons/tennis.png" width="18" class="image-4 sideEventsIcons" onerror="this.style.display='none'" />
            </a>
            <a data-w-tab="basketball" class="tab_link_sport w-inline-block w-clearfix w-tab-link">
               <div class="text-block-13">Баскетбол</div>
               <img src="/Static/bootstrap/img/sportsIcons/bascketball.png" width="18" class="image-2 sideEventsIcons" onerror="this.style.display='none'" />
            </a>
         </div>
         <div class="tabs-content w-tab-content sideEvevtsTabsContent">
            <c:set var="TabListName" value="${football}" scope="request"/>
            <c:set var="TabName" value="football" scope="request"/>
            <c:set var="defTab" value="tab-pane-tab-1 w--tab-active" scope="request"/>
            <c:import url="parts/sideEventsTab.jsp"/>
            <c:set var="TabListName" value="${hockey}" scope="request"/>
            <c:set var="TabName" value="hockey" scope="request"/>
            <c:set var="defTab" value="" scope="request"/>
            <c:import url="parts/sideEventsTab.jsp"/>
            <c:set var="TabListName" value="${tennis}" scope="request"/>
            <c:set var="TabName" value="tennis" scope="request"/>
            <c:set var="defTab" value="" scope="request"/>
            <c:import url="parts/sideEventsTab.jsp"/>
            <c:set var="TabListName" value="${basketball}" scope="request"/>
            <c:set var="TabName" value="basketball" scope="request"/>
            <c:set var="defTab" value="" scope="request"/>
            <c:import url="parts/sideEventsTab.jsp"/>
            <div class="express-content button-block">
               <div class="football-text">
                  <a href="${contextPath}/events_list" class="button_all w-button">Все прогнозы</a>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>