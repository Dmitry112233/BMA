<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="sports" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">   
   <br><br> 
   <table class="sportsListTable">
      <tr>
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Российская Примьер Лига.png" onerror="this.style.display='none'"></td>
         <td><a href="${contextPath}/${'российская примьер лига'}_матчи">Премьер-Лига (Россия)</a></td>
         <td><a href="${contextPath}/${'российская примьер лига'}_описание">Описание чемпионата</a></td>
         <td><a href="${contextPath}/${'российская примьер лига'}_таблица">Таблица чемпионата</a></td>
      </tr>
      <tr>
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Английская Примьер Лига.png" onerror="this.style.display='none'"></td>
         <td><a href="${contextPath}/${'английская примьер лига'}_матчи">Премьер-Лига (Англия)</a></td>
         <td><a href="${contextPath}/${'английская примьер лига'}_описание">Описание чемпионата</a></td>
         <td><a href="${contextPath}/${'английская примьер лига'}_таблица">Таблица чемпионата</a></td>
      </tr>
      <tr>
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Испанская Ла Лига.png" onerror="this.style.display='none'"></td>
         <td><a href="${contextPath}/${'испанская ла лига'}_матчи">Ла Лига (Испания)</a></td>
         <td><a href="${contextPath}/${'испанская ла лига'}_описание">Описание чемпионата</a></td>
         <td><a href="${contextPath}/${'испанская ла лига'}_таблица">Таблица чемпионата</a></td>
      </tr>
      <tr>
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Итальянская серия А.png" onerror="this.style.display='none'"></td>
         <td><a href="${contextPath}/${'итальянская серия а'}_матчи">Серия А (Италия)</a></td>
         <td><a href="${contextPath}/${'итальянская серия а'}_описание">Описание чемпионата</a></td>
         <td><a href="${contextPath}/${'итальянская серия а'}_таблица">Таблица чемпионата</a></td>
      </tr>
      <tr>
         <td><img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Немецкая Бундеслига.png" onerror="this.style.display='none'"></td>
         <td><a href="${contextPath}/${'немецкая бундеслига'}_матчи">Бундеслига (Германия)</a></td>
         <td><a href="${contextPath}/${'немецкая бундеслига'}_описание">Описание чемпионата</a></td>
         <td><a href="${contextPath}/${'немецкая бундеслига'}_таблица">Таблица чемпионата</a></td>
      </tr>
   </table>
   <br>
   	<div class="article">${Competishions_Txt}</div>
   <br>
</div>