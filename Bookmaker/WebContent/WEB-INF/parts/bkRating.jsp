<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="bkReitBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="bkReit">
      <h2>Описание, рейтинг...</h2>
      <c:forEach var="bookmaker" items="${bookmakerList}">
      	Якорь: <span id="bk_id_${bookmaker.bookMakerId}">#bk_id_${bookmaker.bookMakerId}</span><br>      	
      	Имя: ${bookmaker.name}<br>
      	Ссылка: <a rel="nofollow" target="_blank" href="${bookmaker.link}">${bookmaker.name}</a><br>
      	Лого: <a rel="nofollow" href="${bookmaker.link}" target="_blank"><img class="bmReitLogo" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a><br>
      	Описание: ${bookmaker.description}
      	<hr>         
      </c:forEach>      
   </div>
</div>