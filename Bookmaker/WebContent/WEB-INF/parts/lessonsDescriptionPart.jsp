<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="textLessons" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">   
<br>
   	<a class="BackButton" href="FAQList"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Другие вопросы</a>
   <br><br>
	   <p>${question.question}</p>
	   <div>${question.answer}</div>
	   <br>
   
</div>