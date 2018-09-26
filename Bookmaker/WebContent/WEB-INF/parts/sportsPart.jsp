<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="sports" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">   
   <br><br> 
   <table class="sportsListTable">
      <tr onclick="window.location.href='${contextPath}/${'российская Примьер Лига'}_матчи'; return false">
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Российская Примьер Лига.png"></td>
         <td><a href="${contextPath}/${'российская примьер лига'}_матчи">Премьер-Лига (Россия)</a></td>
      </tr>
      <tr onclick="window.location.href='${contextPath}/${'английская примьер лига'}_матчи'; return false">
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Английская Примьер Лига.png"></td>
         <td><a href="${contextPath}/${'английская Примьер Лига'}_матчи">Премьер-Лига (Англия)</a></td>
      </tr>
      <tr onclick="window.location.href='${contextPath}/${'испанская ла лига'}_матчи'; return false">
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Испанская Ла Лига.png"></td>
         <td><a href="${contextPath}/${'испанская ла лига'}_матчи">Ла Лига (Испания)</a></td>
      </tr>
      <tr onclick="window.location.href='${contextPath}/${'итальянская серия а'}_матчи'; return false">
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Итальянская серия А.png"></td>
         <td><a href="${contextPath}/${'итальянская серия а'}_матчи">Серия А (Италия)</a></td>
      </tr>
      <tr onclick="window.location.href='${contextPath}/${'немецкая бундеслига'}_матчи'; return false">
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Немецкая Бундеслига.png"></td>
         <td><a href="${contextPath}/${'немецкая бундеслига'}_матчи">Бундеслига (Германия)</a></td>
      </tr>
   </table>
   <br>
   	<div class="article">${Competishions_Txt}</div>
   <br>
</div>