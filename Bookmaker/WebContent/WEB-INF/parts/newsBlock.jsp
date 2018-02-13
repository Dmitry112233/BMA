<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="newsBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <h1>Новости</h1>
   <br>
   <!-- переменная для вывода полоски над каждой новостью, кроме первой -->
   <c:set var="separatorNews" value="false" />
   <!-- вывод новостей в цикле -->
   <c:forEach var="newsItem" items="${newsList}">
      <c:if test="${separatorNews != false}">
         <hr>
      </c:if>
      <c:set var="separatorNews" value="true" />      
      <div class="newsComp">
      	<p>${newsItem.sport}<br>${newsItem.competition}</p>   
      </div>   
      <h3>${newsItem.title}</h3>
      <p>${newsItem.description}</p>
      <img class="newsPic" src="${newsItem.image}" alt="${newsItem.sport} ${newsItem.competition} новости"></img>
   </c:forEach>
</div>