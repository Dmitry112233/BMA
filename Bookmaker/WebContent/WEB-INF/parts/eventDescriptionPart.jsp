<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="allEv" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <br>
   <a class="BackButton" href="EventsList.spr"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Список прогнозов</a>
   <br><br>
   <p>Дата события: ${ivent.dateStr}</p>
   <table class="evtable">
      <tr class="mainLine">
         <td colspan="3">                     
            ${ivent.competition}
         </td>
      </tr>
      <tr class="slaveLine">
         <td width="50%"><img class="sportIcon" src="${ivent.icon}"><b>&nbsp;${ivent.name}</b></td>
         <td width="25%" align="center"><b>${ivent.bet}</b></td>
         <td width="25%" align="center">
            <b>
               <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${ivent.coefficient}" />
            </b>
         </td>
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
      <a class="toBestBK" rel="nofollow" href="Counter.spr?id=${BookmakerWeightList.get(randID).bookMakerId}" target="_blank">Лучший коэффициент у <img src="${BookmakerWeightList.get(randID).image}" alt="${BookmakerWeightList.get(randID).name} logo"></a>                        
   </div>
</div>