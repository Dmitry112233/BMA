<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="col_table_champ w-col w-col-4 w-col-stack">
   <div class="championat_table">
      <div class="title_table_champ">Таблица чемпионата</div>
      <div class="w-form">
         <form id="email-form" name="email-form" data-name="Email Form">
            <select id="field" name="field" class="select_all_champ w-select">
               <option value="">Выберите чемпионат</option>
               <option value="RPL">Россия. Премьер-Лига</option>
               <option value="England">Англия. Премьер-Лига</option>
               <option value="Germany">Германия. Бундеслига</option>
               <option value="Italy">Италия. Серия А</option>
               <option value="Spain">Испания. Ла Лига</option>
               <option value="France">Франция. Лига 1</option>
            </select>
         </form>
         <div class="w-form-done">
            <div>Thank you! Your submission has been received!</div>
         </div>
         <div class="w-form-fail">
            <div>Oops! Something went wrong while submitting the form.</div>
         </div>
      </div>
      <div class="champ_ratings">
         <div id="w-node-87ab8cf3e7aa-2fd5234c" class="table_first_block1">
            <div id="w-node-7b007faf971a-2fd5234c" class="table_commands_text">Команды</div>
            <div id="w-node-7dc20375f125-2fd5234c" class="table_commands_text">И</div>
            <div id="w-node-ab042cbcd237-2fd5234c" class="table_commands_text">О</div>
         </div>
         <div id="w-node-def0542ffe8f-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-ad4659a866a6-2fd5234c" class="table_name_command">1</div>
            <div id="w-node-e93e357becc2-2fd5234c">25</div>
            <div id="w-node-fbf5831bcf73-2fd5234c">10</div>
            <div id="w-node-9c3a53e90676-2fd5234c" class="text_rating_up">+1</div>
            <div id="w-node-f307cbab3834-2fd5234c" class="table_name_command">Зенит</div>
         </div>
         <div id="w-node-4e1752beaf09-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-4e1752beaf0a-2fd5234c" class="table_name_command">3</div>
            <div id="w-node-4e1752beaf0c-2fd5234c">23</div>
            <div id="w-node-4e1752beaf0e-2fd5234c">12</div>
            <div id="w-node-b6288f1e87a4-2fd5234c" class="text_rating_up">+1</div>
            <div id="w-node-4e1752beaf10-2fd5234c" class="table_name_command">Ростов</div>
         </div>
         <div id="w-node-aa4ecc4c741e-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-aa4ecc4c741f-2fd5234c" class="table_name_command">5</div>
            <div id="w-node-aa4ecc4c7421-2fd5234c">21</div>
            <div id="w-node-aa4ecc4c7423-2fd5234c">10</div>
            <div id="w-node-aa4ecc4c7425-2fd5234c" class="text_rating_up down">-1</div>
            <div id="w-node-aa4ecc4c7427-2fd5234c" class="table_name_command">Спартак</div>
         </div>
         <div id="w-node-1178e74c5cbf-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-1178e74c5cc0-2fd5234c" class="table_name_command">12</div>
            <div id="w-node-1178e74c5cc2-2fd5234c">15</div>
            <div id="w-node-1178e74c5cc4-2fd5234c">10</div>
            <div id="w-node-1178e74c5cc6-2fd5234c" class="text_rating_up down">-1</div>
            <div id="w-node-1178e74c5cc8-2fd5234c" class="table_name_command">Арсенал Тула</div>
         </div>
         <div id="w-node-cc5c7ea14646-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-cc5c7ea14647-2fd5234c" class="table_name_command">16</div>
            <div id="w-node-cc5c7ea14649-2fd5234c">10</div>
            <div id="w-node-cc5c7ea1464b-2fd5234c">10</div>
            <div id="w-node-cc5c7ea1464d-2fd5234c" class="text_rating_up down">-1</div>
            <div id="w-node-cc5c7ea1464f-2fd5234c" class="table_name_command">Енисей</div>
         </div>
         <div id="w-node-4d555df339ac-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-4d555df339ad-2fd5234c" class="table_name_command">14</div>
            <div id="w-node-4d555df339af-2fd5234c">10</div>
            <div id="w-node-4d555df339b1-2fd5234c">10</div>
            <div id="w-node-4d555df339b5-2fd5234c" class="table_name_command">Анжи</div>
         </div>
         <div id="w-node-e295fc4b7e70-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-e295fc4b7e71-2fd5234c" class="table_name_command">15</div>
            <div id="w-node-e295fc4b7e73-2fd5234c">11</div>
            <div id="w-node-e295fc4b7e75-2fd5234c">10</div>
            <div id="w-node-e295fc4b7e79-2fd5234c" class="table_name_command">Уфа</div>
         </div>
         <div id="w-node-735960b36d38-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-735960b36d39-2fd5234c" class="table_name_command">13</div>
            <div id="w-node-735960b36d3b-2fd5234c">12</div>
            <div id="w-node-735960b36d3d-2fd5234c">10</div>
            <div id="w-node-735960b36d41-2fd5234c" class="table_name_command">Динамо</div>
         </div>
         <div id="w-node-056c5cb1ac5c-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-056c5cb1ac5d-2fd5234c" class="table_name_command">11</div>
            <div id="w-node-056c5cb1ac5f-2fd5234c">17</div>
            <div id="w-node-056c5cb1ac61-2fd5234c">10</div>
            <div id="w-node-056c5cb1ac63-2fd5234c" class="text_rating_up down">-1</div>
            <div id="w-node-056c5cb1ac65-2fd5234c" class="table_name_command">Крылья Советов</div>
         </div>
         <div id="w-node-9112392875e0-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-9112392875e1-2fd5234c" class="table_name_command">10</div>
            <div id="w-node-9112392875e3-2fd5234c">17</div>
            <div id="w-node-9112392875e5-2fd5234c">9</div>
            <div id="w-node-9112392875e9-2fd5234c" class="table_name_command">Урал</div>
         </div>
         <div id="w-node-8252854893f4-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-8252854893f5-2fd5234c" class="table_name_command">9</div>
            <div id="w-node-8252854893f7-2fd5234c">17</div>
            <div id="w-node-8252854893f9-2fd5234c">10</div>
            <div id="w-node-8252854893fd-2fd5234c" class="table_name_command">Ахмат</div>
         </div>
         <div id="w-node-ff8a10dbc7d4-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-ff8a10dbc7d5-2fd5234c" class="table_name_command">8</div>
            <div id="w-node-ff8a10dbc7d7-2fd5234c">18</div>
            <div id="w-node-ff8a10dbc7d9-2fd5234c">10</div>
            <div id="w-node-dc64abff16bd-2fd5234c" class="text_rating_up">+1</div>
            <div id="w-node-ff8a10dbc7dd-2fd5234c" class="table_name_command">Локомотив</div>
         </div>
         <div id="w-node-a9d7f456a237-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-a9d7f456a238-2fd5234c" class="table_name_command">7</div>
            <div id="w-node-a9d7f456a23a-2fd5234c">18</div>
            <div id="w-node-a9d7f456a23c-2fd5234c">12</div>
            <div id="w-node-a9d7f456a240-2fd5234c" class="table_name_command">Рубин</div>
         </div>
         <div id="w-node-5c413b896b12-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-5c413b896b13-2fd5234c" class="table_name_command">6</div>
            <div id="w-node-5c413b896b15-2fd5234c">20</div>
            <div id="w-node-5c413b896b17-2fd5234c">10</div>
            <div id="w-node-5c413b896b1b-2fd5234c" class="table_name_command">Оренбург</div>
         </div>
         <div id="w-node-33abe2f4f4bc-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-33abe2f4f4bd-2fd5234c" class="table_name_command">4</div>
            <div id="w-node-33abe2f4f4bf-2fd5234c">22</div>
            <div id="w-node-33abe2f4f4c1-2fd5234c">10</div>
            <div id="w-node-eeaeed86ba9b-2fd5234c" class="text_rating_up down">-1</div>
            <div id="w-node-33abe2f4f4c3-2fd5234c" class="table_name_command">ЦСКА</div>
         </div>
         <div id="w-node-ad1c58610255-2fd5234c" class="table_first_block1 commands_second">
            <div id="w-node-ad1c58610256-2fd5234c" class="table_name_command">2</div>
            <div id="w-node-ad1c58610258-2fd5234c">24</div>
            <div id="w-node-ad1c5861025a-2fd5234c">11</div>
            <div id="w-node-ad1c5861025c-2fd5234c" class="table_name_command">Краснодар</div>
         </div>
      </div>
      <div class="full_table_block w-clearfix">
         <a href="#" class="full_table_link">Полная таблица</a>
      </div>
   </div>
   <a href="#" class="banner_link_block w-inline-block"></a>
</div>