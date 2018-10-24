<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="col_comments w-col w-col-4 w-col-stack">
   <div class="comments_block">
      <div id="w-node-fa354157dd43" class="comment_title_text w-clearfix">
         <div id="w-node-fa354157dd44" class="comments_text">Отзывы</div>
         <a href="#" id="w-node-2c63d4830e96" class="button_all_comments w-button">Все отзывы</a>
      </div>
      <div id="w-node-fa354157dd46" class="leave_comments">
         <div id="w-node-fa354157dd47" class="comments_form w-form">
            <form id="email-form" name="email-form" data-name="Email Form" class="w-clearfix">
               <label for="name" class="field-label">Оставить отзыв</label>
               <input type="email" class="comments_name_field email w-input" maxlength="256" name="name" data-name="Name" placeholder="email" id="name" />
               <input type="text" class="comments_name_field _1 w-input" maxlength="256" name="name-2" data-name="Name 2" placeholder="Ваша имя" id="name-2" required="" />
               <textarea id="field" name="field" maxlength="5000" placeholder="Ваш текст" data-name="Field" class="comments_textarea w-input"></textarea>
               <select id="field-2" name="field-2" class="comments_select w-select">
                  <option value="">Ваш статус</option>
                  <option value="First">Новичок</option>
                  <option value="Second">Профи</option>
                  <option value="Third">Балбес</option>
                  <option value="Another Choice">Эксперт</option>
                  <option value="Another Choice">Средний</option>
               </select>
               <input type="submit" value="Оставить отзыв" data-wait="Please wait..." class="button_comment w-button" />
            </form>
            <div class="w-form-done">
               <div>Thank you! Your submission has been received!</div>
            </div>
            <div class="w-form-fail">
               <div>Oops! Something went wrong while submitting the form.</div>
            </div>
         </div>
      </div>
      <div id="w-node-fa354157dd57" class="comments_wrapper">
         <div id="w-node-fa354157dd58" class="user_comment_text">
            <div id="w-node-fa354157dd59" class="comments_user_text">Сегодня в лайве поставил ставку на то что след гол забьет команда  Событие произошло, сначало выигрыш поступил на</div>
         </div>
         <a href="#" id="w-node-fa354157dd5b" class="link_open_more">Показать полностью</a>
         <div id="w-node-fa354157dd5d" class="comments_avatar expert">
            <div id="w-node-fa354157dd5e" class="comments_avatar_text">Н</div>
         </div>
         <div id="w-node-fa354157dd60" class="comments_user_name_block">
            <div id="w-node-fa354157dd61" class="text-block-37">Нурбол Жайлаубаев</div>
            <div class="comments_user_status expert">
               <div class="commsents_user_status_text">Эксперт</div>
            </div>
         </div>
      </div>
      <div id="w-node-fa354157dd66" class="comments_wrapper">
         <div id="w-node-fa354157dd67" class="user_comment_text">
            <div id="w-node-fa354157dd68" class="comments_user_text">Сегодня в лайве поставил ставку на то что след гол забьет команда  Событие произошло, сначало выигрыш поступил на</div>
         </div>
         <a href="#" id="w-node-fa354157dd6a" class="link_open_more">Показать полностью</a>
         <div id="w-node-fa354157dd6c" class="comments_avatar">
            <div id="w-node-fa354157dd6d" class="comments_avatar_text">Н</div>
         </div>
         <div id="w-node-fa354157dd6f" class="comments_user_name_block">
            <div id="w-node-fa354157dd70" class="text-block-37">Нурбол Жайлаубаев</div>
            <div class="comments_user_status">
               <div class="commsents_user_status_text">Новичок</div>
            </div>
         </div>
      </div>
   </div>
</div>