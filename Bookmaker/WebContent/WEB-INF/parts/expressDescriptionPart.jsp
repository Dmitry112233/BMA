<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="allExp" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <br>
   <a class="BackButton" href="${contextPath}/ExpressesList_${offset}"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Список экспрессов</a>
   <br><br>
   <div>
      <p>Экспресс. Дата начала: <b>${express.dateStr}</b></p>
   </div>
   <table class="dayexptable">
      <!-- переменная для увеличивающегося номера строки в таблице с эвентами -->
      <c:set var="tableRow" value="0" />
      <c:forEach var="ivent" items="${express.iventList}">
         <tr class="mainLine">
            <td colspan="4"><img class="sportIcon" src="${ivent.sportIcon}">&nbsp;${ivent.competition}</td>
         </tr>
         <tr class="slaveLine">
            <td width="5%" align="center">
               <c:out value="${tableRow=tableRow+1}" />
            </td>
            <td width="45%"><b>&nbsp;${ivent.name}</b></td>
            <td width="25%" align="center"><b>${ivent.bet}</b></td>
            <td width="25%" align="center">
               <b>
                  <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${ivent.coefficient}" />
               </b>
            </td>
         </tr>
      </c:forEach>
   </table>
   <br>
   <div>
      <p>
         Итоговый коэффициент: 
         <b>
            <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${express.resultCoeff}" />
         </b>
      </p>
   </div>
   <p>${express.description}</p>
   <br>
   <div id="randomBK">
      <!-- количество букмекеров c учетом веса -->
      <c:set var="countBK" value="${BookmakerWeightList.size()}" />
      <!-- лучший ID -->
      <jsp:useBean id="random" class="java.util.Random" scope="application"/>
      <c:set var="randID">${random.nextInt(countBK)}</c:set>
      <!-- вывод лучшего БК -->      
      <a class="toBestBK" rel="nofollow" href="Counter?id=${BookmakerWeightList.get(randID).bookMakerId}" target="_blank"><span class="toBestBKtxt">Повторить ставку </span><span class="toBestBKimg"><img src="${BookmakerWeightList.get(randID).image}" alt="${BookmakerWeightList.get(randID).name} logo"></span></a>                 
   </div>
   <br><br><br>
</div>