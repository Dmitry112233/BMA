<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:if test="${popularNews.size() > 0}">
   <div class="best_week_news">
      <div class="best_week-news_block">
         <h2 class="best_week_news-text">Популярные за неделю</h2>
      </div>
      <c:forEach var="popularNewsItems" items="${popularNews}">
         <div class="best_week_news-links">
            <div class="best-week-news-link">
               <a href="${contextPath}/${popularNewsItems.id}_news_1" class="link-6">${popularNewsItems.title}</a>
            </div>
         </div>
      </c:forEach>
   </div>
</c:if>