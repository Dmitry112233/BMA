<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="allEv" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">   
   <br>
   <c:if test="${allEvents.sports.size() > 0}">
      <c:forEach var="sport" items="${allEvents.sports}">
         <p class="TextLikeHeadline">Прогнозы на ${sport} на ${allEvents.get(sport).get(0).dateStr}</p>
         <table class="evtable">
            <c:set var="tableRow" value="0" />
            <c:forEach var="ivent" items="${allEvents.get(sport)}">
               <tr class="mainLine">
                  <td colspan="5">
                     <c:out value="${tableRow=tableRow+1}." />
                     &nbsp;${ivent.competition}
                  </td>
               </tr>
               <tr class="slaveLine slaveLineEvents" onclick="window.location.href='event_description_${ivent.iventID}_details'; return false">
                  <td width="45%"><img class="sportIcon" src="${ivent.icon}"><b>&nbsp;${ivent.name}</b></td>
                  <td width="15%" align="center"><b>${ivent.bet}</b></td>
                  <td width="15%" align="center">
                     <b>
                        <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${ivent.coefficient}" />
                     </b>
                  </td>
                  <c:if test="${ivent.result == NULL}"><td width="15%" align="center"><b>${ivent.time}</b></td></c:if>
                  <c:if test="${ivent.result != NULL}"><td width="15%" align="center"><b <c:if test="${ivent.result == 'Прошел'}">class="greenText"</c:if><c:if test="${ivent.result == 'Не прошел'}">class="redText"</c:if>>${ivent.result}</b></td></c:if>
                  <td width="10%" align="right"><a class="toEventDescription" href="${contextPath}/event_description_${ivent.iventID}_details">Описание</a></td>
               </tr>
            </c:forEach>
         </table>
         <div class="dataSourse">
            <p>Источник: <a rel="nofollow" target="_blank" href="${allEvents.get(sport).get(0).source}">betfaq.ru</a></p>
         </div>
         <br>
      </c:forEach>
   </c:if>
   <c:if test="${allEvents.sports.size() == 0}">
      <p class="DataMissed">Данные отсутствуют по непонятной причине.<br>Приносим свои извинения за неудобства.<br>Мы работаем над устранением проблемы.<br>Попробуйте обновить страницу через несколько минут.</p>
   </c:if>   
   <div class="article">${Event_Txt}</div>
   <br>
</div>