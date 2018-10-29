<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="col_comments w-col w-col-4 w-col-stack">
   <div class="myCommentsBlock">
      <div class="myCommentTitleBlock">
         <div class="comments_text">Отзывы</div>
      </div>
      <c:if test="${comments.size() > 0}">
         <div class="allComments">
            <c:forEach var="comment" items="${comments}">
               <div class="myCommentsWrapper">
                  <div class="comments_avatar expert">
                     <div class="comments_avatar_text">${comment.firstLetter}</div>
                  </div>
                  <div class="comments_user_name_block">
                     <div class="text-block-37">${comment.name}</div>
                     <div class="comments_user_status expert">
                        <div class="commsents_user_status_text">${comment.level}</div>
                     </div>
                  </div>
                  <div class="user_comment_text">
                     <div class="comments_user_text">${comment.comment}</div>
                  </div>
                  <div class="user_comment_text">
                     <div class="myCommentsDate"><fmt:formatDate pattern = "dd.MM.yyyy HH:mm" value = "${comment.date}" /></div>
                  </div>
               </div>
            </c:forEach>
         </div>
      </c:if>
      <div class="leave_comments">
         <div id="w-node-fa354157dd47-0f967a12" class="comments_form w-form">
            <form action="${contextPath}/save_comment" method="get" id="email-form" name="email-form" data-name="Email Form" class="w-clearfix">
               <label for="name" class="field-label">Оставить отзыв</label>
               <input type="email" name="email"  id="email" class="comments_name_field email w-input" maxlength="256" placeholder="Email" />
               <input type="hidden" name = "id" value="${bookmaker.bookMakerId}" />
               <input type="text" id="name" name="name" class="comments_name_field _1 w-input" maxlength="256" placeholder="Имя" />
               <textarea id="field" name="comment" maxlength="5000" placeholder="Комментарий" class="comments_textarea w-input"></textarea>
               <select id="field-2" name="level" class="comments_select w-select">
                  <option value="">Статус</option>
                  <option value="Любитель">Любитель</option>
                  <option value="Эксперт">Эксперт</option>
               </select>
               <input type="button" value="Оставить отзыв" onClick="doAjax(${bookmaker.bookMakerId})" class="button_comment w-button" />
               <div id="message"></div>
            </form>
         </div>
      </div>
   </div>
</div>