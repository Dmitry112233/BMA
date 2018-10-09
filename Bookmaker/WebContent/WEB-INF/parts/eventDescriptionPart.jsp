<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="allEv" class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
   <br>
   <a class="BackButton" href="${contextPath}/events_list"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Список прогнозов</a>
   <br><br>
   <p>Дата события: <b>${ivent.dateStr}</b></p>
   <table class="evtable">
      <tr class="mainLine">
         <td colspan="4">                     
            ${ivent.competition}
         </td>
      </tr>
      <tr class="slaveLine">
         <td width="45%"><img class="sportIcon" src="${ivent.icon}"><b>&nbsp;${ivent.name}</b></td>
         <td width="20%" align="center"><b>${ivent.bet}</b></td>
         <td width="20%" align="center">
            <b>
               <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${ivent.coefficient}" />
            </b>
         </td>
         <c:if test="${ivent.result == NULL}"><td width="15%" align="center"><b>${ivent.time}</b></td></c:if>
         <c:if test="${ivent.result != NULL}"><td width="15%" align="center"><b <c:if test="${ivent.result == 'Прошел'}">class="greenText"</c:if><c:if test="${ivent.result == 'Не прошел'}">class="redText"</c:if>>${ivent.result}</b></td></c:if>
      </tr>
      <tr class="slaveLine">
         <td colspan="4" class="expDesc">
            <p>${ivent.description}</p>
         </td>
      </tr>
   </table>
   <br>
   <div id="randomBK">
      <!-- количество букмекеров c учетом веса -->
      <c:set var="countBK" value="${BookmakerWeightList.size()}" />
      <!-- лучший ID -->
      <jsp:useBean id="random" class="java.util.Random" scope="application"/>
      <c:set var="randID">${random.nextInt(countBK)}</c:set>
      <!-- вывод лучшего БК -->
      <a class="toBestBK" rel="nofollow" href="counter?id=${BookmakerWeightList.get(randID).bookMakerId}" target="_blank"><span class="toBestBKtxt">Повторить ставку </span><span class="toBestBKimg"><img src="${BookmakerWeightList.get(randID).image}" alt="${BookmakerWeightList.get(randID).name} logo"></span></a>                        
   </div>
   <br><br><br>
</div>