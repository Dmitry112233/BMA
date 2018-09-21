<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="bklist" class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
   <div class="bkListContent">
      <p class="BmListHeadline">Букмекеры</p>
      <ol>
         <c:forEach var="bookmaker" items="${bookmakerList.values()}">
            <li>
               <a rel="nofollow" href="Counter?id=${bookmaker.bookMakerId}" target="_blank" class="bmlogo"><img class="tilt" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a>
               <a class="toBkDescr" href="${contextPath}/Bookmaker_${bookmaker.bookMakerId}">Обзор</a>
               <a rel="nofollow" class="tobkbut" target="_blank" href="Counter?id=${bookmaker.bookMakerId}">На сайт</a>        
            </li>
         </c:forEach>
      </ol>
   </div>
</div>