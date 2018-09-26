<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="bkReitBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="bkReit">
      <br><br>
      <!-- переменная для вывода полоски над каждым описанием букмекера, кроме первого -->
      <c:set var="separatorBk" value="false" />
      <!-- вывод описаний букмекеров в цикле -->
      <table class="bkReitTable">
         <c:forEach var="bookmaker" items="${bookmakerList.values()}">
            <tr>
               <td colspan="3">
                  <c:if test="${separatorBk != false}">
                     <hr>
                  </c:if>
                  <c:set var="separatorBk" value="true" />
               </td>
            </tr>
            <tr class="bkReitTableMainRow">
               <td width="26%" align="right"><a rel="nofollow" href="counter?id=${bookmaker.bookMakerId}" target="_blank"><img class="bmReitLogo" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a></td>
               <td width="24%"><a class="toBkDescrPage" href="${contextPath}/bookmaker_${bookmaker.bookMakerId}"><span class="toDescrMain">Описание букмекера</span><span class="toDescrSecondary">Описание</span></a></td>
               <td width="50%"><a class="bkReitLink" rel="nofollow" target="_blank" href="counter?id=${bookmaker.bookMakerId}"><span class="toBKMain">Регистрация на сайте ${bookmaker.name}</span><span class="toBKSecondary">Регистрация</span></a></td>
            </tr>
            <tr class="bkReitTableSecondaryRow">
               <td colspan="3"><a rel="nofollow" href="counter?id=${bookmaker.bookMakerId}" target="_blank"><img class="bmReitLogo" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a></td>
            </tr>
            <tr class="bkReitTableSecondaryRow">               
               <td colspan="3"><a class="toBkDescrPage" href="${contextPath}/bookmaker_${bookmaker.bookMakerId}">Описание букмекера</a></td>               
            </tr>
            <tr class="bkReitTableSecondaryRow">               
               <td colspan="3"><a class="bkReitLink" rel="nofollow" target="_blank" href="counter?id=${bookmaker.bookMakerId}">Регистрация на сайте ${bookmaker.name}</a></td>
            </tr>
            <tr>
            	<td colspan="3">	            	
	            	<p class="TextLikeHeadline2">Бонусы:</p>	            	
	            	<p>${bookmaker.bonus}</p>	            	          	
            	</td>            
            </tr>
            <tr>
               <td colspan="3">
                  <p class="TextLikeHeadline2">Общий рейтинг:</p>
                  <div class="progressBar">
                     <div class="progressBarDone"><p>${bookmaker.result}</p></div>
                  </div>
               </td>
           </tr>                        
         </c:forEach>
      </table>
      <br><br>
      	<div class="article">${Bookmakers_Txt}</div>
      <br>
   </div>   
</div>