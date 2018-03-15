<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="videoPart" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <h1>Видео...</h1>
   <br>
   <!-- переменная для вывода полоски над каждой новостью, кроме первой -->
   <c:set var="separatorVideos" value="false" />
   <c:forEach var="question" items="${videoList}">      
      <c:if test="${separatorVideos != false}">
         <hr>
      </c:if>
      <c:set var="separatorVideos" value="true" />
      <h3>${question.question}</h3>      
      <iframe class="video"
         src="${question.video}"> 
      </iframe>
      <br>
   </c:forEach>
   <br><p>Так же смотрите <a href="FAQList.spr">текстовые-уроки</a>.</p>
</div>