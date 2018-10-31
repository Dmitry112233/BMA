<!DOCTYPE html>	
<html lang="ru">
   <head>
      <title>${League_T}</title>
      <meta name="Description" content="${League_D}"/>
      <meta name="Keywords" content=""/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="all"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>
      <link rel="shortcut icon" href="/Static/bootstrap/img/favicon.ico" type="image/x-icon">
      <link href="/Static/bootstrap/css/style-${cssVersion}.css" rel="stylesheet">
      <link href="/Static/bootstrap/css/myStyle-${cssVersion}.css" rel="stylesheet">
      <script src="/Static/bootstrap/js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
   </head>
   <body class="body">
      <c:import url="parts/nav.jsp"></c:import>
      <div class="rpl_bet_section">
         <div class="rpl_bet_container">
            <div class="col_rpl w-row">
               <div class="col_rpl_info w-col w-col-8 w-col-stack">
                  <div class="rpl_img_block">
                     <div class="rpl_img">
                     	<img src="/Static/bootstrap/img/leagueHeader/${leagueLower}.jpg" onerror="this.style.display='none'" />
                     </div>
                  </div>
                  <div class="rpl_description">
                     <img class="myLeagueIcon" src="/Static/bootstrap/img/leagueIcon/${leagueLower}_dark.png" onerror="this.style.display='none'">
                     <h1 class="champ_title">${League_H1}</h1>
                     <a href="${contextPath}/${leagueLower}_описание" class="button_description_grew position w-button">Описание</a>
                     <a href="${contextPath}/competitions" class="button_all_champ w-button">Все чемпионаты</a>
                  </div>
                  <div class="rpl_matches_block">
                  <c:forEach var="date" items="${dates}">
                     <div class="date_matches">${date}</div>
                     <c:forEach var="events" items="${mapMatch.get(date)}">
                     <div class="rpl_matches">
                        <a id="w-node-9b9f6705a1fb-4478b9c4" href="#" class="link_matches_block w-inline-block">
                           <div id="w-node-39f36a58cf74-4478b9c4" class="time_msk">${events.date}<!-- 23:00 МСК --></div>
                           <div id="w-node-c3fc39d24acc-4478b9c4" class="link_more">Подробности</div>
                           <div id="w-node-e3c86e1cfb61-4478b9c4" class="command_name vs">${events.team1}
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                           <div id="w-node-6581d923a8a4-4478b9c4" class="draw_coef">ничья
                              <span class="drow_coef_number">(5.0)</span>
                           </div>
                           <div id="w-node-fe7ec344c575-4478b9c4" class="command_name">${events.team2}
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                        </a>
                        </div>
                        </c:forEach>
                        </c:forEach>
                        <!-- <a id="w-node-6d8045f16adf-4478b9c4" href="#" class="link_matches_block w-inline-block">
                           <div id="w-node-6d8045f16ae0-4478b9c4" class="time_msk">22:00 МСК</div>
                           <div id="w-node-6d8045f16ae2-4478b9c4" class="link_more">Подробности</div>
                           <div id="w-node-6d8045f16ae4-4478b9c4" class="command_name vs">ЦСКА
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                           <div id="w-node-6d8045f16ae8-4478b9c4" class="draw_coef">ничья
                              <span class="drow_coef_number">(5.0)</span>
                           </div>
                           <div id="w-node-6d8045f16aec-4478b9c4" class="command_name">Анжи
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                        </a>
                        <a id="w-node-b9cd04d4b70b-4478b9c4" href="#" class="link_matches_block w-inline-block">
                           <div id="w-node-b9cd04d4b70c-4478b9c4" class="time_msk">19:00 МСК</div>
                           <div id="w-node-b9cd04d4b70e-4478b9c4" class="link_more">Подробности</div>
                           <div id="w-node-b9cd04d4b710-4478b9c4" class="command_name vs">Енисей
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                           <div id="w-node-b9cd04d4b714-4478b9c4" class="draw_coef">ничья
                              <span class="drow_coef_number">(5.0)</span>
                           </div>
                           <div id="w-node-b9cd04d4b718-4478b9c4" class="command_name">Оренбург
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                        </a>
                        <a id="w-node-a3b6a847a096-4478b9c4" href="#" class="link_matches_block w-inline-block">
                           <div id="w-node-a3b6a847a097-4478b9c4" class="time_msk">18:00 МСК</div>
                           <div id="w-node-a3b6a847a099-4478b9c4" class="link_more">Подробности</div>
                           <div id="w-node-a3b6a847a09b-4478b9c4" class="command_name vs">Крылья Советов
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                           <div id="w-node-a3b6a847a09f-4478b9c4" class="draw_coef">ничья
                              <span class="drow_coef_number">(5.0)</span>
                           </div>
                           <div id="w-node-a3b6a847a0a3-4478b9c4" class="command_name">Локомотив
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                        </a>
                     </div>
                     <div id="w-node-af7e9464c514-4478b9c4" class="date_matches">19.10.2018</div>
                     <div class="rpl_matches">
                        <a id="w-node-e746b9d5629e-4478b9c4" href="#" class="link_matches_block w-inline-block">
                           <div id="w-node-e746b9d5629f-4478b9c4" class="time_msk">18:00 МСК</div>
                           <div id="w-node-e746b9d562a1-4478b9c4" class="link_more">Подробности</div>
                           <div id="w-node-e746b9d562a3-4478b9c4" class="command_name vs">ЦСКА
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                           <div id="w-node-e746b9d562a7-4478b9c4" class="draw_coef">ничья
                              <span class="drow_coef_number">(5.0)</span>
                           </div>
                           <div id="w-node-e746b9d562ab-4478b9c4" class="command_name">Анжи
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                        </a>
                        <a id="w-node-e746b9d562af-4478b9c4" href="#" class="link_matches_block w-inline-block">
                           <div id="w-node-e746b9d562b0-4478b9c4" class="time_msk">18:00 МСК</div>
                           <div id="w-node-e746b9d562b2-4478b9c4" class="link_more">Подробности</div>
                           <div id="w-node-e746b9d562b4-4478b9c4" class="command_name vs">ЦСКА
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                           <div id="w-node-e746b9d562b8-4478b9c4" class="draw_coef">ничья
                              <span class="drow_coef_number">(5.0)</span>
                           </div>
                           <div id="w-node-e746b9d562bc-4478b9c4" class="command_name">Анжи
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                        </a>
                        <a id="w-node-e746b9d562c0-4478b9c4" href="#" class="link_matches_block w-inline-block">
                           <div id="w-node-e746b9d562c1-4478b9c4" class="time_msk">18:00 МСК</div>
                           <div id="w-node-e746b9d562c3-4478b9c4" class="link_more">Подробности</div>
                           <div id="w-node-e746b9d562c5-4478b9c4" class="command_name vs">Енисей
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                           <div id="w-node-e746b9d562c9-4478b9c4" class="draw_coef">ничья
                              <span class="drow_coef_number">(5.0)</span>
                           </div>
                           <div id="w-node-e746b9d562cd-4478b9c4" class="command_name">Оренбург
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                        </a>
                        <a id="w-node-e746b9d562d1-4478b9c4" href="#" class="link_matches_block w-inline-block">
                           <div id="w-node-e746b9d562d2-4478b9c4" class="time_msk">18:00 МСК</div>
                           <div id="w-node-e746b9d562d4-4478b9c4" class="link_more">Подробности</div>
                           <div id="w-node-e746b9d562d6-4478b9c4" class="command_name vs">Крылья Советов
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                           <div id="w-node-e746b9d562da-4478b9c4" class="draw_coef">ничья
                              <span class="drow_coef_number">(5.0)</span>
                           </div>
                           <div id="w-node-e746b9d562de-4478b9c4" class="command_name">Локомотив
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                        </a>
                     </div>
                     <div id="w-node-494a4d4db26a-4478b9c4" class="date_matches">19.10.2018</div>
                     <div class="rpl_matches">
                        <a id="w-node-6d28f9f31adb-4478b9c4" href="#" class="link_matches_block w-inline-block">
                           <div id="w-node-6d28f9f31adc-4478b9c4" class="time_msk">18:00 МСК</div>
                           <div id="w-node-6d28f9f31ade-4478b9c4" class="link_more">Подробности</div>
                           <div id="w-node-6d28f9f31ae0-4478b9c4" class="command_name vs">ЦСКА
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                           <div id="w-node-6d28f9f31ae4-4478b9c4" class="draw_coef">ничья
                              <span class="drow_coef_number">(5.0)</span>
                           </div>
                           <div id="w-node-6d28f9f31ae8-4478b9c4" class="command_name">Анжи
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                        </a>
                        <a id="w-node-6d28f9f31aec-4478b9c4" href="#" class="link_matches_block w-inline-block">
                           <div id="w-node-6d28f9f31aed-4478b9c4" class="time_msk">18:00 МСК</div>
                           <div id="w-node-6d28f9f31aef-4478b9c4" class="link_more">Подробности</div>
                           <div id="w-node-6d28f9f31af1-4478b9c4" class="command_name vs">ЦСКА
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                           <div id="w-node-6d28f9f31af5-4478b9c4" class="draw_coef">ничья
                              <span class="drow_coef_number">(5.0)</span>
                           </div>
                           <div id="w-node-6d28f9f31af9-4478b9c4" class="command_name">Анжи
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                        </a>
                        <a id="w-node-6d28f9f31afd-4478b9c4" href="#" class="link_matches_block w-inline-block">
                           <div id="w-node-6d28f9f31afe-4478b9c4" class="time_msk">18:00 МСК</div>
                           <div id="w-node-6d28f9f31b00-4478b9c4" class="link_more">Подробности</div>
                           <div id="w-node-6d28f9f31b02-4478b9c4" class="command_name vs">Енисей
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                           <div id="w-node-6d28f9f31b06-4478b9c4" class="draw_coef">ничья
                              <span class="drow_coef_number">(5.0)</span>
                           </div>
                           <div id="w-node-6d28f9f31b0a-4478b9c4" class="command_name">Оренбург
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                        </a>
                        <a id="w-node-6d28f9f31b0e-4478b9c4" href="#" class="link_matches_block w-inline-block">
                           <div id="w-node-6d28f9f31b0f-4478b9c4" class="time_msk">18:00 МСК</div>
                           <div id="w-node-6d28f9f31b11-4478b9c4" class="link_more">Подробности</div>
                           <div id="w-node-6d28f9f31b13-4478b9c4" class="command_name vs">Крылья Советов
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                           <div id="w-node-6d28f9f31b17-4478b9c4" class="draw_coef">ничья
                              <span class="drow_coef_number">(5.0)</span>
                           </div>
                           <div id="w-node-6d28f9f31b1b-4478b9c4" class="command_name">Локомотив
                              <span class="coefficient_matches">(9.0)</span>
                           </div>
                        </a>
                     </div> -->
                  </div>
                  <div class="seoBlock">
                     ${League_Txt}
                  </div>
               </div>
               <c:import url="parts/sideLeagueTable.jsp"></c:import>
            </div>
         </div>
      </div>
      <c:import url="parts/footer.jsp"></c:import>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
      <script src="/Static/bootstrap/js/script.js" type="text/javascript"></script>
      <script type="text/javascript" src="/Static/bootstrap/js/mail.js"></script>
      <script type="text/javascript">$(document).ready(function(){$('[href*="brandjs"]').attr('style', 'display:none !important');$('a[href="'+window.location.href+'"]').addClass('w--current');});</script>
   </body>
</html>