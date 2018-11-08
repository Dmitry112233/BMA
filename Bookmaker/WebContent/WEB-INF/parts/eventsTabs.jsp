<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div data-w-tab="Tab ${TabListNumber}" class="discr_tabs_content w-tab-pane ${defTab}">
   <c:set var="tableRow" value="0" />
   <c:forEach var="Events" items="${TabListName}">
      <div class="sport_matches_item event" onclick="window.location.href='event_description_${Events.iventID}_details'; return false">
         <div class="eventRowHeader">
            <div class="exp_sports_text event">${Events.competition}</div>
            <c:if test="${Events.result == NULL}">
               <div class="bets_status white">
                  <div class="bets_status_text white">Начало ${Events.time}</div>
               </div>
            </c:if>
         </div>
         <div class="eventRowData">
            <div class="exp_matches_num events">
               <c:out value="${tableRow=tableRow+1}" />
            </div>
            <div class="exp_matches"><a href="${contextPath}/event_description_${Events.iventID}_details">${Events.name}</a></div>
            <div class="exp_itm">${Events.bet}</div>
            <div class="exp_score">
               <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${Events.coefficient}" />
            </div>
            <c:if test="${Events.result == NULL}"><a href="counter?id=${BookmakerWeightList.get(randID).bookMakerId}" class="replay_bets-link">Повторить ставку</a></c:if>
            <c:if test="${Events.result != NULL}">
               <div class="bets_status <c:if test="${Events.result == 'Не прошел'}">red</c:if>">
               		<div class="bets_status_text <c:if test="${Events.result == 'Не прошел'}">red</c:if>">${Events.result}</div>
               </div>
            </c:if>                      
		 </div>
	  </div>
   </c:forEach>
</div>