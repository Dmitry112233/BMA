<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div data-w-tab="Tab ${TabNumber}" class="tab_panel w-tab-pane ${defTab}">
   <div class="tab_content_block">
      <div class="w-row">
         <div class="col_tab_content w-col w-col-4">
            <div class="championat_logo_block">
               <img src="/Static/bootstrap/img/leagueIcon/${legueTitleLower}_dark.png" onerror="this.style.display='none'" width="96" alt="${legueTitleLower} лого" />
            </div>
         </div>
         <div class="col_tab_content_2 w-col w-col-8 myChampShortDescr">
            <div class="championat_title_text">
               <p class="chemp_tab_title">${legueTitle}</p>
               <div class="champ_tab_text_info">Год основания: ${foundationYear}</div>
               <div class="champ_tab_text_info">Количество команд: ${teamCount}</div>
               <div class="champ_tab_text_info">Действующий победитель: ${currentChampion}</div>
               <div class="div-block-16">
                  <a href="${contextPath}/${legueTitleLower}_матчи" class="button_rate w-button">Матчи</a>
                  <a href="${contextPath}/${legueTitleLower}_таблица" class="button_table w-button">Таблица</a>
                  <a href="${contextPath}/${legueTitleLower}_описание" class="button_description w-button">Описание</a>
               </div>
            </div>
         </div>
      </div>
      <c:forEach var="events" items="${TabListName}">
         <div class="myLeagueMatchesWrapper">
            <div class="myLeagueMatches" onclick="window.location.href='${contextPath}/${events.url}'; return false">
               <div class="time_msk">
                  <fmt:formatDate pattern = "dd.MM.yyyy HH:mm" value = "${events.date}" />
                  МСК
               </div>
               <div class="command_name vs myLeagMatchesComandName">${events.team1} <span class="coefficient_matches">(${events.win1}) </span><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${events.team1}.png" onerror="this.style.display='none'" alt="${events.team1} лого"></div>
               <div class="draw_coef">ничья<span class="drow_coef_number"> (${events.x})</span></div>
               <div class="mobileCeffs">1: ${events.win1}<br>x: ${events.x}<br>2: ${events.win2}</div>
               <div class="command_name second_command_name myLeagMatchesComandName"><img class="teamIcon" src="/Static/bootstrap/img/teamIcons/${events.team2}.png" onerror="this.style.display='none'" alt="${events.team2} лого"> ${events.team2}<span class="coefficient_matches"> (${events.win2})</span></div>
               <div class="xceff"><a class="link_more" href="${contextPath}/${events.url}">Подробности</a></div>
            </div>
         </div>
      </c:forEach>
   </div>
</div>