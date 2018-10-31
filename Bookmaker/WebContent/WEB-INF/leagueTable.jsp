<!DOCTYPE html>	
<html lang="ru">
   <head>
      <title>${Table_T}</title>
      <meta name="Description" content="${Table_D}"/>
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
      <div class="hero_all_table center">
         <div id="w-node-e61cb80a12a6-bb78b9bf" class="header_content_block table_champ">
            <div class="rpl_img">
               <img src="/Static/bootstrap/img/leagueHeader/${leagueLower}.jpg" onerror="this.style.display='none'" />
            </div>
            <div class="rpl_description">
               <img class="myLeagueIcon" src="/Static/bootstrap/img/leagueIcon/${leagueLower}_dark.png" onerror="this.style.display='none'">
               <h1 class="champ_title">${Table_H1}</h1>
               <a href="${contextPath}/${leagueLower}_описание" class="button_description_grew table_champ w-button">Описание</a>
               <a href="${contextPath}/competitions" class="button_all_champ w-button">Все чемпионаты</a>
            </div>
         </div>
         <div class="container_table">
            <div id="w-node-36b328d8e39f-bb78b9bf" class="full_table_contents">
               <div id="w-node-e92c5437475e-bb78b9bf" class="full_table_command_name_text bold">Команды</div>
               <div id="w-node-a9f308478ac3-bb78b9bf" class="full_table_points bold">Н</div>
               <div id="w-node-f6c976b81a58-bb78b9bf" class="full_table_points bold">П</div>
               <div id="w-node-01912286d41a-bb78b9bf" class="full_table_points bold">В</div>
               <div id="w-node-45aade267186-bb78b9bf" class="full_table_points bold">И</div>
               <div id="w-node-f2c241ca5f11-bb78b9bf" class="full_table_final_point bold">О</div>
               <div id="w-node-ebb72f21accf-bb78b9bf" class="full_table_points bold">М</div>
            </div>
            <div id="w-node-5d5befe15cfa-bb78b9bf" class="full_table_contents">
               <div id="w-node-5d5befe15cfb-bb78b9bf" class="full_table_command_name_text">Зенит</div>
               <img src="images/5bc77111d4ae71d63b1c4aeb_CSKA.png" id="w-node-5d5befe15cfd-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-5d5befe15cfe-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-5d5befe15d00-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-5d5befe15d02-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-5d5befe15d04-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-5d5befe15d06-bb78b9bf" class="full_table_num_text">1</div>
               <div id="w-node-5d5befe15d08-bb78b9bf" class="full_table_final_point">25</div>
               <div id="w-node-928febf9d571-bb78b9bf" class="full_table_final_point">17-5</div>
            </div>
            <div id="w-node-151dbaab6a3c-bb78b9bf" class="full_table_contents">
               <div id="w-node-151dbaab6a3d-bb78b9bf" class="full_table_command_name_text">Краснодар</div>
               <img src="images/5bc771113d3815e27141654e_Rostov.png" id="w-node-151dbaab6a3f-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-151dbaab6a40-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-9416f3eebd51-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-151dbaab6a42-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-151dbaab6a44-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-151dbaab6a46-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-151dbaab6a48-bb78b9bf" class="full_table_num_text">2</div>
               <div id="w-node-151dbaab6a4a-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-38fce0d91a37-bb78b9bf" class="full_table_contents">
               <div id="w-node-38fce0d91a38-bb78b9bf" class="full_table_command_name_text">Ростов</div>
               <img src="images/5bc771113d3815e27141654e_Rostov.png" id="w-node-38fce0d91a3a-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-38fce0d91a3b-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-1a724e0f77a2-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-38fce0d91a3d-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-38fce0d91a3f-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-38fce0d91a41-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-38fce0d91a43-bb78b9bf" class="full_table_num_text">3</div>
               <div id="w-node-38fce0d91a45-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-0dc400da632d-bb78b9bf" class="full_table_contents">
               <div id="w-node-0dc400da632e-bb78b9bf" class="full_table_command_name_text">ЦСКА</div>
               <img src="images/5bc77111d4ae71d63b1c4aeb_CSKA.png" id="w-node-0dc400da6330-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-0dc400da6331-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-0dc400da6333-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-0dc400da6335-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-0dc400da6337-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-0dc400da6339-bb78b9bf" class="full_table_num_text">4</div>
               <div id="w-node-131748cfe8ab-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-0dc400da633b-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-920d460592a9-bb78b9bf" class="full_table_contents">
               <div id="w-node-920d460592aa-bb78b9bf" class="full_table_command_name_text">Спартак</div>
               <img src="images/5bc77111d4ae71d63b1c4aeb_CSKA.png" id="w-node-920d460592ac-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-920d460592ad-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-935b2c23e0cc-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-920d460592af-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-920d460592b1-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-920d460592b3-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-920d460592b5-bb78b9bf" class="full_table_num_text">5</div>
               <div id="w-node-920d460592b7-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-ee8c202fad80-bb78b9bf" class="full_table_contents">
               <div id="w-node-ee8c202fad81-bb78b9bf" class="full_table_command_name_text">Оренбург</div>
               <img src="images/5bc77111d4ae71d63b1c4aeb_CSKA.png" id="w-node-ee8c202fad83-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-ee8c202fad84-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-bdd4d7e69e03-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-ee8c202fad86-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-ee8c202fad88-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-ee8c202fad8a-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-ee8c202fad8c-bb78b9bf" class="full_table_num_text">6</div>
               <div id="w-node-ee8c202fad8e-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-d74fd360b02d-bb78b9bf" class="full_table_contents">
               <div id="w-node-d74fd360b02e-bb78b9bf" class="full_table_command_name_text">Рубин</div>
               <img src="images/5bc77111d4ae71d63b1c4aeb_CSKA.png" id="w-node-d74fd360b030-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-d74fd360b031-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-d74fd360b033-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-d74fd360b035-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-d74fd360b037-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-d74fd360b039-bb78b9bf" class="full_table_num_text">7</div>
               <div id="w-node-36aeeced1995-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-d74fd360b03b-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-747c120cfad7-bb78b9bf" class="full_table_contents">
               <div id="w-node-747c120cfad8-bb78b9bf" class="full_table_command_name_text">Локомотив</div>
               <img src="images/5bc77111cb651561c017a464_lokomotiv_png.png" id="w-node-747c120cfada-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-747c120cfadb-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-747c120cfadd-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-747c120cfadf-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-747c120cfae1-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-747c120cfae3-bb78b9bf" class="full_table_num_text">8</div>
               <div id="w-node-762a386d51b7-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-747c120cfae5-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-45f0927a3efa-bb78b9bf" class="full_table_contents">
               <div id="w-node-45f0927a3efb-bb78b9bf" class="full_table_command_name_text">Ахмат</div>
               <img src="images/5bc77111d4ae71d63b1c4aeb_CSKA.png" id="w-node-45f0927a3efd-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-45f0927a3efe-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-7e4c65ae9a2d-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-45f0927a3f00-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-45f0927a3f02-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-45f0927a3f04-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-45f0927a3f06-bb78b9bf" class="full_table_num_text">9</div>
               <div id="w-node-45f0927a3f08-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-a19e129e0400-bb78b9bf" class="full_table_contents">
               <div id="w-node-a19e129e0401-bb78b9bf" class="full_table_command_name_text">Урал</div>
               <img src="images/5bc77111d4ae71d63b1c4aeb_CSKA.png" id="w-node-a19e129e0403-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-a19e129e0404-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-a19e129e0406-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-a19e129e0408-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-a19e129e040a-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-a19e129e040c-bb78b9bf" class="full_table_num_text">10</div>
               <div id="w-node-8d890f4cac19-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-a19e129e040e-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-39b9f671dcaf-bb78b9bf" class="full_table_contents">
               <div id="w-node-39b9f671dcb0-bb78b9bf" class="full_table_command_name_text">Крылья Советов</div>
               <img src="images/5bc77111d4ae71d63b1c4aeb_CSKA.png" id="w-node-39b9f671dcb2-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-39b9f671dcb3-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-b2742953777c-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-39b9f671dcb5-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-39b9f671dcb7-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-39b9f671dcb9-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-39b9f671dcbb-bb78b9bf" class="full_table_num_text">11</div>
               <div id="w-node-39b9f671dcbd-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-8791a3ec1af9-bb78b9bf" class="full_table_contents">
               <div id="w-node-8791a3ec1afa-bb78b9bf" class="full_table_command_name_text">Арсенал Тула</div>
               <img src="images/5bc77111d4ae71d63b1c4aeb_CSKA.png" id="w-node-8791a3ec1afc-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-8791a3ec1afd-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-fad50fd623d6-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-8791a3ec1aff-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-8791a3ec1b01-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-8791a3ec1b03-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-8791a3ec1b05-bb78b9bf" class="full_table_num_text">12</div>
               <div id="w-node-8791a3ec1b07-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-b581c5d10c4b-bb78b9bf" class="full_table_contents">
               <div id="w-node-b581c5d10c4c-bb78b9bf" class="full_table_command_name_text">Динамо</div>
               <img src="images/5bc77111d4ae71d63b1c4aeb_CSKA.png" id="w-node-b581c5d10c4e-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-b581c5d10c4f-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-b581c5d10c51-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-b581c5d10c53-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-b581c5d10c55-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-b581c5d10c57-bb78b9bf" class="full_table_num_text">13</div>
               <div id="w-node-78832c110045-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-b581c5d10c59-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-070089d23519-bb78b9bf" class="full_table_contents">
               <div id="w-node-070089d2351a-bb78b9bf" class="full_table_command_name_text">Уфа</div>
               <img src="images/5bc77111d4ae71d63b1c4aeb_CSKA.png" id="w-node-070089d2351c-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-070089d2351d-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-070089d2351f-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-070089d23521-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-070089d23523-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-070089d23525-bb78b9bf" class="full_table_num_text">15</div>
               <div id="w-node-308631429d1c-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-070089d23527-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-7875eed766cb-bb78b9bf" class="full_table_contents">
               <div id="w-node-7875eed766cc-bb78b9bf" class="full_table_command_name_text">Енисей</div>
               <img src="images/5bc7711146f6356131f4fd1e_Enisey_logo.png" id="w-node-7875eed766ce-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-7875eed766cf-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-3a645bb4b409-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-7875eed766d1-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-7875eed766d3-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-7875eed766d5-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-7875eed766d7-bb78b9bf" class="full_table_num_text">16</div>
               <div id="w-node-7875eed766d9-bb78b9bf" class="full_table_final_point">25</div>
            </div>
            <div id="w-node-52c0bb3ae0d8-bb78b9bf" class="full_table_contents">
               <div id="w-node-52c0bb3ae0d9-bb78b9bf" class="full_table_command_name_text">Анжи</div>
               <img src="images/5bc77111829b4d14258ddad6_Anzhi.png" id="w-node-52c0bb3ae0db-bb78b9bf" alt="" class="full_table_command_icon" />
               <div id="w-node-52c0bb3ae0dc-bb78b9bf" class="full_table_points">1</div>
               <div id="w-node-52c0bb3ae0de-bb78b9bf" class="full_table_points">5</div>
               <div id="w-node-52c0bb3ae0e0-bb78b9bf" class="full_table_points">7</div>
               <div id="w-node-52c0bb3ae0e2-bb78b9bf" class="full_table_points">9</div>
               <div id="w-node-52c0bb3ae0e4-bb78b9bf" class="full_table_num_text">14</div>
               <div id="w-node-d77d58b83dea-bb78b9bf" class="full_table_final_point">17-5</div>
               <div id="w-node-52c0bb3ae0e6-bb78b9bf" class="full_table_final_point">25</div>
            </div>
         </div>
         <div class="seoBlock">
            ${Table_Txt}
         </div>
      </div>
      <c:import url="parts/footer.jsp"></c:import>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
      <script src="/Static/bootstrap/js/script.js" type="text/javascript"></script>
      <script type="text/javascript" src="/Static/bootstrap/js/mail.js"></script>
      <script type="text/javascript">$(document).ready(function(){$('[href*="brandjs"]').attr('style', 'display:none !important');$('a[href="'+window.location.href+'"]').addClass('w--current');});</script>
   </body>
</html>