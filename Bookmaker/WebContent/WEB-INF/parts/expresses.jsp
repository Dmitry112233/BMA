<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="allExp" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <br>
   <c:if test="${expressList.size() > 0}">
      <!-- переменная для вывода полоски над каждым экспрессом, кроме первого -->
      <c:set var="separator" value="false" />
      <!-- вывод экспрессов в цикле -->
      <c:forEach var="express" items="${expressList}">
         <c:if test="${separator != false}">
            <hr>
         </c:if>
         <c:set var="separator" value="true" />
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
         <div class="dataSourse">
            <p>Источник: <a rel="nofollow" target="_blank" href="${express.source}">vprognoze.ru</a></p>
         </div>
         <div>
            <p>
               Итоговый коэффициент: 
               <b>
                  <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2" value = "${express.resultCoeff}" />
               </b>
            </p>
         </div>
         <a class="toEventDescription" href="${contextPath}/ExpressDescription_${express.expressID}_details_${currentPage}">Описание экспресса</a>
         <br>                
      </c:forEach>
      <br>
   </c:if>
   <c:if test="${expressList.size() == 0}">
      <p class="DataMissed">Данные отсутствуют по непонятной причине.<br>Приносим свои извинения за неудобства.<br>Мы работаем над устранением проблемы.<br>Попробуйте обновить страницу через несколько минут.</p>
   </c:if>
   <nav class="paginationBlock">
      <ul class="pagination">
         <c:forEach var="button" items="${pageMass}">
            <c:if test = "${button + 1 == currentPage}">
               <li class="page-item active"><a class="page-link" href="${contextPath}/ExpressesList_${button * 20}">${button + 1}</a></li>
            </c:if>
            <c:if test = "${button + 1 != currentPage}">
               <li class="page-item"><a class="page-link" href="${contextPath}/ExpressesList_${button * 20}">${button + 1}</a></li>
            </c:if>
         </c:forEach>
      </ul>
   </nav>
   <c:if test = "${Express_Txt != Null}">
      <div class="article">${Express_Txt}</div>
      <br>
   </c:if>
</div>