<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="textLessons" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">   
   <br>
   <c:forEach var="question" items="${questionsList}">
	   <input type="checkbox" id="hd-${question.questionID}" class="hide"/>
	   <label for="hd-${question.questionID}" >${question.question}</label>
	   <div>${question.answer}</div>
	   <a class="toEventDescription" href="${contextPath}/FAQList_${question.questionID}_details">Открыть ответ</a>
	   <br>
   </c:forEach>   
</div>