<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="col-2-new w-col w-col-4 w-col-stack">
   <div class="mySideNewsBlock">
      <div class="stavka-block w-clearfix mySideNewsHeader">
         <div class="odinochnie-prognozy">Новости</div>
         <div class="all_newstext">
            <a href="${contextPath}/news_0" class="all_newslink">Все новости</a>
         </div>
      </div>
      <div class="myNewsItems">
         <c:forEach var="newsItem" items="${news}">
            <div class="myNewsItem">
               <a href="${contextPath}/${newsItem.id}_news_1"><div class="news-bg" style="background-image: url('${newsItem.image}')"></div></a>
               <a class="news-text-block" href="${contextPath}/${newsItem.id}_news_1"><div class="news-text-block">${newsItem.title}</div></a>
               <div class="text-block-25">Опубликовано</div>
               <div class="text-block-26">Сегодня ${newsItem.time}</div>
            </div>
         </c:forEach>
      </div>
   </div>
</div>