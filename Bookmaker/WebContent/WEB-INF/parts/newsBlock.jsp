<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="newsBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <h2>Новости...</h2>
   <br>
   <!-- переменная для вывода полоски над каждой новостью, кроме первой -->
   <c:set var="separatorNews" value="false" />
   <!-- вывод новостей в цикле -->
   <c:forEach var="newsItem" items="${newsList}">
      <c:if test="${separatorNews != false}">
         <hr>
      </c:if>
      <c:set var="separatorNews" value="true" />
      <h3>${newsItem.title}</h3>
      <p>${newsItem.sport} ${newsItem.competition}</p>
      <p><img class="newsPic" src="${newsItem.image}"></img></p>
      <p>${newsItem.description}</p>
   </c:forEach>
</div>