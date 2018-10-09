<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="sports" class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
   <div class="leaguesList">
      <div class="leaguesHeadline">
         <img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Российская Примьер Лига.png" onerror="this.style.display='none'"> Премьер-Лига (Россия)
      </div>
      <div class="leaguesbattonsLine">
         <a class= "toLeagueMatchesButton" href="${contextPath}/${'российская примьер лига'}_матчи">Аналитика</a>         
         <a class= "toLeagueTableButton" href="${contextPath}/${'российская примьер лига'}_таблица">Таблица</a>
         <a class= "toLeagueDescrButton" href="${contextPath}/${'российская примьер лига'}_описание">Описание</a>
      </div>
      <div class="leaguesHeadline">
         <img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Английская Примьер Лига_dark.png" onerror="this.style.display='none'"> Премьер-Лига (Англия)
      </div>
      <div class="leaguesbattonsLine">
         <a class= "toLeagueMatchesButton" href="${contextPath}/${'английская примьер лига'}_матчи">Аналитика</a>         
         <a class= "toLeagueTableButton" href="${contextPath}/${'английская примьер лига'}_таблица">Таблица</a>
         <a class= "toLeagueDescrButton" href="${contextPath}/${'английская примьер лига'}_описание">Описание</a>
      </div>
      <div class="leaguesHeadline">
         <img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Испанская Ла Лига.png" onerror="this.style.display='none'"> Ла Лига (Испания)
      </div>
      <div class="leaguesbattonsLine">
         <a class= "toLeagueMatchesButton" href="${contextPath}/${'испанская ла лига'}_матчи">Аналитика</a>         
         <a class= "toLeagueTableButton" href="${contextPath}/${'испанская ла лига'}_таблица">Таблица</a>
         <a class= "toLeagueDescrButton" href="${contextPath}/${'испанская ла лига'}_описание">Описание</a>
      </div>
      <div class="leaguesHeadline">
         <img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Итальянская серия А.png" onerror="this.style.display='none'"> Серия А (Италия)
      </div>
      <div class="leaguesbattonsLine">
         <a class= "toLeagueMatchesButton" href="${contextPath}/${'итальянская серия а'}_матчи">Аналитика</a>         
         <a class= "toLeagueTableButton" href="${contextPath}/${'итальянская серия а'}_таблица">Таблица</a>
         <a class= "toLeagueDescrButton" href="${contextPath}/${'итальянская серия а'}_описание">Описание</a>
      </div>
      <div class="leaguesHeadline">
         <img class="leagueIconSmall" src="/Static/bootstrap/img/leagueIcon/Немецкая Бундеслига.png" onerror="this.style.display='none'"> Бундеслига (Германия)
      </div>
      <div class="leaguesbattonsLine">
         <a class= "toLeagueMatchesButton" href="${contextPath}/${'немецкая бундеслига'}_матчи">Аналитика</a>         
         <a class= "toLeagueTableButton" href="${contextPath}/${'немецкая бундеслига'}_таблица">Таблица</a>
         <a class= "toLeagueDescrButton" href="${contextPath}/${'немецкая бундеслига'}_описание">Описание</a>
      </div>
   </div>
   <br>
   <div class="article">${Competishions_Txt}</div>
   <br>
</div>