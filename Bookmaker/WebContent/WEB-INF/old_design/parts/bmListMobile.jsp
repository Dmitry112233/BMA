<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="row mobileBK">
   <div id="bklistMobile" class="col-xs-12">
      <p class="BmListHeadlineMobile">Букмекеры</p>
      <ol>
         <c:forEach var="bookmaker" items="${bookmakerList.values()}">
            <li>
               <a rel="nofollow" href="counter?id=${bookmaker.bookMakerId}" target="_blank" class="bmlogo"><img class="tilt" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a>
               <a class="toBkDescr" href="${contextPath}/bookmaker_${bookmaker.bookMakerId}">Обзор</a>
               <a rel="nofollow" class="tobkbut" target="_blank" href="counter?id=${bookmaker.bookMakerId}">На сайт</a>        
            </li>
         </c:forEach>
      </ol>
   </div>
</div>