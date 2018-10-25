<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<script type="text/javascript">

function doAjax(id) { 
	
	 $.ajax({
		  url : 'save_comment',
		  type: 'GET',
		  dataType: 'json',
		  contentType: 'application/json',
		     mimeType: 'application/json',
		  data : ({
		   id: id,
		   name: $("#name").val(),
		   comment: $("textarea[name='comment']").val(),
		   level: $("select[name='level']").val(),
		   email: $("#email").val()
		  }),
		  success: function (data) {    
		  }
		 });
	 
	 document.getElementById('name').value = "";
	 document.getElementById('email').value = "";
	 document.getElementsByClassName('comments_textarea w-input')[0].value = "";
	 document.getElementsByClassName('comments_select w-select')[0].value = "";
	 document.getElementById("message").style.color = "#4169E0"
	 document.getElementById('message').innerHTML="Комментарий отправлен модератору";	 
	}
	
	
</script>
</head>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="col_comments w-col w-col-4 w-col-stack">
   <div class="comments_block">
      <div id="w-node-fa354157dd43" class="comment_title_text w-clearfix">
         <div id="w-node-fa354157dd44" class="comments_text">Отзывы</div>
         <a href="#" id="w-node-2c63d4830e96" class="button_all_comments w-button">Все отзывы</a>
      </div>
      <div id="w-node-fa354157dd46" class="leave_comments">
         <div id="w-node-fa354157dd47" class="comments_form w-form">
            <form action="${contextPath}/save_comment" method="get" id="email-form" name="email-form" data-name="Email Form" class="w-clearfix">
               <label for="name" class="field-label">Оставить отзыв</label>
               <input type="email" name="email"  id="email" class="comments_name_field email w-input" maxlength="256" placeholder="email" />
               <input type="hidden" name = "id" value="${bookmaker.bookMakerId}" />
               <input type="text" id="name" name="name" class="comments_name_field _1 w-input" maxlength="256" placeholder="Ваша имя" />
               <textarea id="field" name="comment" maxlength="5000" placeholder="Ваш текст" class="comments_textarea w-input"></textarea>
               <select id="field-2" name="level" class="comments_select w-select">
                  <option value="">Ваш статус</option>                  
                  <option value="Любитель">Любитель</option>                 
                  <option value="Эксперт">Эксперт</option>
               </select>
               <input type="button" value="Оставить отзыв" onClick="doAjax(${bookmaker.bookMakerId})" class="button_comment w-button" />
               <div id= "message"></div>
            </form>
            
         </div>
      </div>
      <div id="w-node-fa354157dd57" class="comments_wrapper">
         <div id="w-node-fa354157dd58" class="user_comment_text">
            <div id="w-node-fa354157dd59" class="comments_user_text">${comments.get(1).comment}</div>
         </div>
         <!-- <a href="#" id="w-node-fa354157dd5b" class="link_open_more">Показать полностью</a> -->
         <div id="w-node-fa354157dd5d" class="comments_avatar expert">
            <div id="w-node-fa354157dd5e" class="comments_avatar_text">Д</div>
         </div>
         <div id="w-node-fa354157dd60" class="comments_user_name_block">
            <div id="w-node-fa354157dd61" class="text-block-37">${comments.get(1).name}</div>
            <div class="comments_user_status expert">
               <div class="commsents_user_status_text">${comments.get(1).level}</div>
            </div>
         </div>
      </div>
      <div id="w-node-fa354157dd66" class="comments_wrapper">
         <div id="w-node-fa354157dd67" class="user_comment_text">
            <div id="w-node-fa354157dd68" class="comments_user_text">${comments.get(0).comment}</div>
         </div>
         <!-- <a href="#" id="w-node-fa354157dd6a" class="link_open_more">Показать полностью</a> -->
         <div id="w-node-fa354157dd6c" class="comments_avatar">
            <div id="w-node-fa354157dd6d" class="comments_avatar_text">А</div>
         </div>
         <div id="w-node-fa354157dd6f" class="comments_user_name_block">
            <div id="w-node-fa354157dd70" class="text-block-37">${comments.get(0).name}</div>
            <div class="comments_user_status">
               <div class="commsents_user_status_text">${comments.get(0).level}</div>
            </div>
         </div>
      </div>
   </div>
</div>