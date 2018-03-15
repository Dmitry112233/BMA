<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="bklist" class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
   <div class="bkListContent">
      <h1>Букмекеры</h1>
      <ol>
         <c:forEach var="bookmaker" items="${bookmakerList.values()}">
            <li>
               <a rel="nofollow" href="Counter.spr?id=${bookmaker.bookMakerId}" target="_blank" class="bmlogo"><img class="tilt" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a>
               <a class="toBkDescr" href="Bookmakers.spr#bk_id_${bookmaker.bookMakerId}">Обзор</a> 				
               <a rel="nofollow" class="tobkbut" target="_blank" href="Counter.spr?id=${bookmaker.bookMakerId}">На сайт</a>        
            </li>
         </c:forEach>
      </ol>
   </div>
</div>