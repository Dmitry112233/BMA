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
               <td width="25%"><a rel="nofollow" href="Counter?id=${bookmaker.bookMakerId}" target="_blank"><img class="bmReitLogo" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a></td>
               <td width="25%"><a class="toBkDescrPage" href="${contextPath}/Bookmaker_${bookmaker.bookMakerId}"><span class="toDescrMain">Описание букмекера</span><span class="toDescrSecondary">Описание</span></a></td>
               <td width="50%"><a class="bkReitLink" rel="nofollow" target="_blank" href="Counter?id=${bookmaker.bookMakerId}"><span class="toBKMain">Регистрация на сайте ${bookmaker.name}</span><span class="toBKSecondary">Регистрация</span></a></td>
            </tr>
            <tr class="bkReitTableSecondaryRow">
               <td colspan="3"><a rel="nofollow" href="Counter?id=${bookmaker.bookMakerId}" target="_blank"><img class="bmReitLogo" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a></td>
            </tr>
            <tr class="bkReitTableSecondaryRow">               
               <td colspan="3"><a class="toBkDescrPage" href="${contextPath}/Bookmaker_${bookmaker.bookMakerId}">Описание букмекера</a></td>               
            </tr>
            <tr class="bkReitTableSecondaryRow">               
               <td colspan="3"><a class="bkReitLink" rel="nofollow" target="_blank" href="Counter?id=${bookmaker.bookMakerId}">Регистрация на сайте ${bookmaker.name}</a></td>
            </tr>
            <tr>
               <td colspan="3">
                  <h4>Общий рейтинг</h4>
                  <div class="progressBar">
                     <div class="progressBarDone"><p>${bookmaker.result}</p></div>
                  </div>
               </td>
            </tr>
         </c:forEach>
      </table>
      <br>      
   </div>
</div>