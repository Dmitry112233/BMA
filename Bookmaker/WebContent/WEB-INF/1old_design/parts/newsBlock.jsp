<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="newsBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
   <br>
   <c:if test="${newsList.size() > 0}">
      <!-- переменная для вывода полоски над каждой новостью, кроме первой -->
      <c:set var="separatorNews" value="false" />
      <!-- вывод новостей в цикле -->
      <c:forEach var="newsItem" items="${newsList}">
         <c:if test="${separatorNews != false}">
            <hr>
         </c:if>
         <c:set var="separatorNews" value="true" />
         <div class="newsTitle">
            <a href="${contextPath}/${newsItem.id}_news_${currentPage}">${newsItem.title}</a>
         </div>
         <a href="${contextPath}/${newsItem.id}_news_${currentPage}"><img class="newsPic" src="${newsItem.image}" alt="${newsItem.sport} ${newsItem.competition} новости"></img></a>
      </c:forEach>
   </c:if>
   <br>
   <c:if test="${newsList.size() == 0}">
      <p class="DataMissed">Данные отсутствуют по непонятной причине.<br>Приносим свои извинения за неудобства.<br>Мы работаем над устранением проблемы.<br>Попробуйте обновить страницу через несколько минут.</p>
   </c:if>
   <nav class="paginationBlock">
      <ul class="pagination">
         <c:forEach var="button" items="${pageMass}">
            <c:if test = "${button + 1 == currentPage}">
               <li class="page-item active"><a class="page-link" href="${contextPath}/news_${button * 10}">${button + 1}</a></li>
            </c:if>
            <c:if test = "${button + 1 != currentPage}">
               <li class="page-item"><a class="page-link" href="${contextPath}/news_${button * 10}">${button + 1}</a></li>
            </c:if>
         </c:forEach>
      </ul>
   </nav>
</div>