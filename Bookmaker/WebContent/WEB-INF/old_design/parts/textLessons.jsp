<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="textLessons" class="col-lg-9 col-md-9 col-sm-9 col-xs-12">   
   <br>
   <c:forEach var="question" items="${questionsList}">
	   <ul>
	   	<li> <a href="${contextPath}/faq_list_${question.questionID}_details">${question.question}</a></li>	   	
	   </ul>
   </c:forEach>   
   <div class="article">${FAQ_Txt}</div>
   <br>
</div>