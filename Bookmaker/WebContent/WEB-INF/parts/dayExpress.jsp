<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div id="dayexp" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <h1>Ставка дня</h1>
   <br>
   <c:if test="${myExpress != NULL}">   
   <!-- вывод одного экспресса дня -->   
   <table class="dayexptable">
      <!-- переменная для увеличивающегося номера строки в таблице с эвентами -->
      <c:set var="tableRow" value="0"/>
      <c:forEach var="ivent" items="${myExpress.iventList}">
      <tr class="mainLine">
      	<td colspan="4"><img class="sportIcon" src="${ivent.sportIcon}">&nbsp;${ivent.competition}</td>
      </tr>
      <tr class="slaveLine">
         <td align="center"><c:out value="${tableRow=tableRow+1}" /></td>
         <td ><b>&nbsp;${ivent.name}</b></td>
         <td width="25%" align="center"><b>${ivent.bet}</b></td>
         <td width="25%" align="center"><b><fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${ivent.coefficient}" /></b></td>
      </tr>
      </c:forEach>
   </table>
   <br>
   <p>Итоговый коэф: <b><fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${myExpress.resultCoeff}" /></b></p>
   <p>Дата начала: <b>${myExpress.dateStr}</b></p>
   <p>Описание события:<br>${myExpress.description}</p>   
   </c:if>   
   <c:if test="${myExpress == NULL}">
      <p class="DataMissed">Данные отсутствуют по непонятной причине.<br>Приносим свои извинения за неудобства.<br>Мы работаем над устранением проблемы.<br>Попробуйте обновить страницу через несколько минут.</p>
   </c:if>   
</div>