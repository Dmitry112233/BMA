<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="newsBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-12">   
   <br>
   	<a class="BackButton" href="${contextPath}/news_${offset}"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Другие новости</a>
   <br><br>   
   <div class="listNewsComp">
   	<p>${news.sport}<br>${news.competition}</p>
   </div>
   <p>${news.description}</p>
   <img class="newsPic" src="${news.image}" alt="${news.sport} ${news.competition} новости"></img>
   <br>
</div>