<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="textLessons" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <h2>Вопросы - ответы</h2>   
   <c:forEach var="question" items="${questionsList}">
	   <input type="checkbox" id="hd-${question.questionID}" class="hide"/>
	   <label for="hd-${question.questionID}" >${question.question}</label>
	   <div>${question.answer}</div>
	   <br>
   </c:forEach>
   <br><p>Так же смотрите <a href="VideoList.spr">видео-уроки</a>.</p>
</div>