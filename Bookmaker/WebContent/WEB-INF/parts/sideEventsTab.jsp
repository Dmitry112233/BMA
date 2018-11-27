<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div data-w-tab="${TabName}" class="w-tab-pane ${defTab}">
   <c:forEach var="Events" items="${TabListName}">
      <div class="express-content">
         <div class="football-text">
            <div class="w-row">
               <div class="column-16 w-col w-col-9 w-col-small-6 sideEventMobileBlocks">
                  <img src="/Static/bootstrap/img/sportsIcons/${TabName}.png" width="20" class="ball-img" onerror="this.style.display='none'" />
                  <div class="tab-command_name">${Events.competition}</div>
               </div>
               <div class="w-clearfix w-col w-col-3 w-col-small-6 sideEventMobileBlocks">
                  <a href="${contextPath}/event_description_${Events.iventID}_details" class="more_link">Подробнее</a>
               </div>
            </div>
         </div>
         <div class="columns-2 w-row">
            <div class="w-clearfix w-col w-col-6 w-col-small-6 sideEventMobileBlocks">
               <div class="text-block-17">${Events.name}</div>
            </div>
            <div class="column-15 w-clearfix w-col w-col-6 w-col-small-6 sideEventMobileBlocks">
               <div class="text-block-16 _2">
                  <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${Events.coefficient}" />
               </div>
               <div class="text-block-16">${Events.bet}</div>
            </div>
         </div>
      </div>
   </c:forEach>
   <c:if test="${TabListName.size() == 0}">
      <div class="dataMissed sideEvents">Ординары по данному виду спора отсутствуют в данный момент</div>
   </c:if>
</div>