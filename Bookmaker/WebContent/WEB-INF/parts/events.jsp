<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="allEv" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <h2>Прогнозы на спорт</h2>
   <!-- 
      <br>-->
   <!-- переменная для вывода полоски над каждым экспрессом, кроме первого -->
   <!-- <c:set var="separator" value="false" />-->
   <!-- вывод экспрессов в цикле -->
   <!-- <c:forEach var="express" items="${expressList}">
      <c:if test="${separator != false}">
      	<hr>
      </c:if>
      <c:set var="separator" value="true" />			
      </c:forEach>
      -->	
      
      
      
      
   <p>servtest</p>
   <c:forEach var="sport" items="${allEvents.keySet()}">
      <h3>Прогнозы на ${sport.sport} xx xxxxxx 20xx</h3>
      <c:forEach var="ivent" items="${allEvants.get(sport)}">
         ${ivent.name}
      </c:forEach>
   </c:forEach>
   <p>servtest</p>
   
   
   
   <h3>Прогнозы на футбол 23 октября 2017</h3>
   <table class="evtable">
      <tr class="mainLine">
         <td colspan="4"><img class="sportIcon" src="${ivent.sportIcon}">&nbsp;${ivent.competition}спортиконка - (Футбол?) - Испания - Ла Лига</td>
      </tr>
      <tr class="slaveLine">
         <td width="5%" align="center">
            <c:out value="${tableRow=tableRow+1}" />
         </td>
         <td width="45%"><b>&nbsp;${ivent.name}Депортиво - Гирона</b></td>
         <td width="25%" align="center"><b>${ivent.bet}1х</b></td>
         <td width="25%" align="center">
            <b>
               <!--<fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${ivent.coefficient}" />-->1.3
            </b>
         </td>
      </tr>
      <tr class="slaveLine">
         <td colspan="4" class="evDesc">
            <input type="checkbox" id="1d" class="hide"/>
            <label for="1d" >описание прогноза</label>
            <div>Большое описание описание описание описание описание описание описание</div>
         </td>
      </tr>
   </table>
   <div class="dataSourse">
      <p>Источник: <a rel="nofollow" target="_blank" href="#">betfaq.ru</a></p>
   </div>
</div>