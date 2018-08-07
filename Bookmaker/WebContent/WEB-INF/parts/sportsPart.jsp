<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div id="sports" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">   
   <br><br> 
   <table class="sportsListTable">
      <tr onclick="window.location.href='PremierLeague_${'Российская Примьер Лига'}_List.spr'; return false">
         <td><img class="leagueIconSmall" src="bootstrap/img/leagueIcon/Российская Примьер Лига.png"></td>
         <td><a href="PremierLeague_${'Российская Примьер Лига'}_List.spr">Премьер-Лига (Россия)</a></td>
      </tr>
      <tr onclick="window.location.href='PremierLeague_${'Английская Примьер Лига'}_List.spr'; return false">
         <td><img class="leagueIconSmall" src="bootstrap/img/leagueIcon/Английская Примьер Лига.png"></td>
         <td><a href="PremierLeague_${'Английская Примьер Лига'}_List.spr">Премьер-Лига (Англия)</a></td>
      </tr>
      <tr onclick="window.location.href='PremierLeague_${'Испанская Ла Лига'}_List.spr'; return false">
         <td><img class="leagueIconSmall" src="bootstrap/img/leagueIcon/Испанская Ла Лига.png"></td>
         <td><a href="PremierLeague_${'Испанская Ла Лига'}_List.spr">Ла Лига (Испания)</a></td>
      </tr>
      <tr onclick="window.location.href='PremierLeague_${'Итальянская серия А'}_List.spr'; return false">
         <td><img class="leagueIconSmall" src="bootstrap/img/leagueIcon/Итальянская серия А.png"></td>
         <td><a href="PremierLeague_${'Итальянская серия А'}_List.spr">Серия А (Италия)</a></td>
      </tr>
      <tr onclick="window.location.href='PremierLeague_${'Немецкая Бундеслига'}_List.spr'; return false">
         <td><img class="leagueIconSmall" src="bootstrap/img/leagueIcon/Немецкая Бундеслига.png"></td>
         <td><a href="PremierLeague_${'Немецкая Бундеслига'}_List.spr">Бундеслига (Германия)</a></td>
      </tr>
      <tr onclick="window.location.href='PremierLeague_${'Чемпионат Мира'}_List.spr'; return false">
         <td><img class="leagueIconSmall" src="bootstrap/img/leagueIcon/Чемпионат Мира.png"></td>
         <td><a href="PremierLeague_${'Чемпионат Мира'}_List.spr">Чемпионат Мира 2018</a></td>
      </tr>
   </table>
</div>