<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="col-2-new w-col w-col-4 w-col-stack">
   <div class="mySideNewsBlock">
      <div class="stavka-block w-clearfix">
         <div class="odinochnie-prognozy">Новости</div>
         <div class="text-block-27">
            <a href="${contextPath}/news_0" class="link-4">Все новости</a>
         </div>
      </div>
      <div class="myNewsItems">
         <c:forEach var="newsItem" items="${news}">
            <div class="myNewsItem">
               <div class="myNewsImg">
                  <img src="${newsItem.image}" alt="${newsItem.sport} ${newsItem.competition} новости"></img>
               </div>
               <div class="news-text-block">${newsItem.title}</div>
               <div class="text-block-25">Опубликовано</div>
               <div class="text-block-26">Сегодня ${newsItem.time}</div>
            </div>
         </c:forEach>
      </div>
   </div>
</div>