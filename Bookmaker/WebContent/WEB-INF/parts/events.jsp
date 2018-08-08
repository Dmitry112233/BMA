<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="allEv" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">   
   <br>
   <c:if test="${allEvents.sports.size() > 0}">
      <c:forEach var="sport" items="${allEvents.sports}">
         <h3>Прогнозы на ${sport} на ${allEvents.get(sport).get(0).dateStr}</h3>
         <table class="evtable">
            <c:set var="tableRow" value="0" />
            <c:forEach var="ivent" items="${allEvents.get(sport)}">
               <tr class="mainLine">
                  <td colspan="4">
                     <c:out value="${tableRow=tableRow+1}." />
                     &nbsp;${ivent.competition}
                  </td>
               </tr>
               <tr class="slaveLine slaveLineEvents" onclick="window.location.href='EventDescription_${ivent.iventID}_details.spr'; return false">
                  <td width="50%"><img class="sportIcon" src="${ivent.icon}"><b>&nbsp;${ivent.name}</b></td>
                  <td width="20%" align="center"><b>${ivent.bet}</b></td>
                  <td width="20%" align="center">
                     <b>
                        <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${ivent.coefficient}" />
                     </b>
                  </td>
                  <td width="10%" align="right"><a class="toEventDescription" href="EventDescription_${ivent.iventID}_details.spr">Описание</a></td>
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
</div>