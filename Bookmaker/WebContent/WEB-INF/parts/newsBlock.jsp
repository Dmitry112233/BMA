<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="newsBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">   
   <br>
   <c:if test="${newsList.size() > 0}">
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
         <div class="newsTitle">
         	<a href="NewsDescription_${newsItem.id}_details.spr">${newsItem.title}</a>
         </div>
         <a href="NewsDescription_${newsItem.id}_details.spr"><img class="newsPic" src="${newsItem.image}" alt="${newsItem.sport} ${newsItem.competition} новости"></img></a>
      </c:forEach>
   </c:if>
   <br>
   <c:if test="${newsList.size() == 0}">
      <p class="DataMissed">Данные отсутствуют по непонятной причине.<br>Приносим свои извинения за неудобства.<br>Мы работаем над устранением проблемы.<br>Попробуйте обновить страницу через несколько минут.</p>
   </c:if>
   
   <c:forEach var="button" items="${pageMass}">
   <a class="BackButton" href="News_${button * 10}.spr"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>${button + 1}</a>
   </c:forEach>
     
</div>


