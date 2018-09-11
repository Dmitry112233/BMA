<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="sports" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">   
   <br><br> 
   <table class="sportsListTable">
      <tr onclick="window.location.href='${contextPath}/PremierLeague_${'Российская Примьер Лига'}_List'; return false">
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Российская Примьер Лига.png"></td>
         <td><a href="${contextPath}/PremierLeague_${'Российская Примьер Лига'}_List">Премьер-Лига (Россия)</a></td>
      </tr>
      <tr onclick="window.location.href='${contextPath}/PremierLeague_${'Английская Примьер Лига'}_List'; return false">
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Английская Примьер Лига.png"></td>
         <td><a href="${contextPath}/PremierLeague_${'Английская Примьер Лига'}_List">Премьер-Лига (Англия)</a></td>
      </tr>
      <tr onclick="window.location.href='${contextPath}/PremierLeague_${'Испанская Ла Лига'}_List'; return false">
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Испанская Ла Лига.png"></td>
         <td><a href="${contextPath}/PremierLeague_${'Испанская Ла Лига'}_List">Ла Лига (Испания)</a></td>
      </tr>
      <tr onclick="window.location.href='${contextPath}/PremierLeague_${'Итальянская серия А'}_List'; return false">
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Итальянская серия А.png"></td>
         <td><a href="${contextPath}/PremierLeague_${'Итальянская серия А'}_List">Серия А (Италия)</a></td>
      </tr>
      <tr onclick="window.location.href='${contextPath}/PremierLeague_${'Немецкая Бундеслига'}_List'; return false">
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Немецкая Бундеслига.png"></td>
         <td><a href="${contextPath}/PremierLeague_${'Немецкая Бундеслига'}_List">Бундеслига (Германия)</a></td>
      </tr>
   </table>
   <br>
   	<div class="article">${Competishions_Txt}</div>
   <br>
</div>