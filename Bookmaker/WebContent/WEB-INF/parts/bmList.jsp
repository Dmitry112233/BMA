<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="bklist" class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
   <div class="bkListContent">
      <h2>Букмекеры</h2>
      <ol>
         <c:forEach var="bookmaker" items="${bookmakerList}">
            <li>
               <a rel="nofollow" href="${bookmaker.link}" target="_blank" class="bmlogo"><img class="tilt" src="${bookmaker.image}" alt="${bookmaker.name}"></a>
               <a rel="nofollow" class="tobkbut" target="_blank" href="${bookmaker.link}">На сайт</a>        
            </li>
         </c:forEach>
      </ol>
   </div>
</div>