<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="textLessons" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <h2>Новости...</h2>      
   <c:forEach var="newsItem" items="${newsList}">
   	<p>title: ${newsItem.title}</p>
   	<p>img: <img src="${newsItem.image}"></img></p>   	
   	   </c:forEach>   
</div>