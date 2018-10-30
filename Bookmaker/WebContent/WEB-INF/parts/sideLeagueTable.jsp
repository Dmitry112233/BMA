<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="col_table_champ w-col w-col-4 w-col-stack">
   <div class="myChampionatTable">
      <div class="myChampTableTitle">
         <div class="title_table_champ">Таблица чемпионата</div>
      </div>
      <div class="myChampTableHeader">
         <div></div>
         <div class="table_commands_text">Команды</div>
         <div class="table_commands_text myTeamGames">И</div>
         <div class="table_commands_text myTeamPoints">О</div>
      </div>
      <c:forEach var="LeagueTableRow" items="${leagueTable}">
         <div class="myChampTableRowWrapper">
            <div class="myChampTableRow">
               <div class="table_name_command myTeamPlace">${LeagueTableRow.place}</div>
               <div class="table_name_command">${LeagueTableRow.team}</div>
               <div class="myTeamGames">${LeagueTableRow.games}</div>
               <div class="myTeamPoints">${LeagueTableRow.points}</div>
            </div>
         </div>
      </c:forEach>
      <div class="myChampTableFooter">
         <div><a class="fullTableLink" href="${contextPath}/${leagueLower}_таблица">Полная таблица</a></div>
      </div>
   </div>
</div>