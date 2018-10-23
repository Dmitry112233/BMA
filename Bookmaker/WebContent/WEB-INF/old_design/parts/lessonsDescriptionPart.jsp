<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="textLessons" class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
   <br>
   <a class="BackButton" href="${contextPath}/faq_list"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Другие вопросы</a>
   <br><br>
   <c:if test = "${Question_Txt != Null}">
      <div class="article">${Question_Txt}</div>
      <br>
   </c:if>
   <div>${question.answer}</div>
   <br>
</div>