<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="bkReitBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="bkReit">      
      <br>
      <!-- переменная для вывода полоски над каждым описанием букмекера, кроме первого -->
      <c:set var="separatorBk" value="false" />
      <!-- вывод описаний букмекеров в цикле -->
      <c:forEach var="bookmaker" items="${bookmakerList.values()}">
         <c:if test="${separatorBk != false}">
            <hr>
         </c:if>
         <c:set var="separatorBk" value="true" />
         <div class="container-fluid">
            <div class="row">
               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <span id="bk_id_${bookmaker.bookMakerId}"></span><br><!-- якорь -->
                  <div class="bkName">
                     <a rel="nofollow" href="Counter?id=${bookmaker.bookMakerId}" target="_blank"><img class="bmReitLogo" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a>	      		     		
                  </div>
               </div>
            </div>
         </div>
         <br>
         <div id="desc1" class="container-fluid">
            <div class="row">
               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <h4>Критерии</h4>
                  <p>надежность</p>
                  <div class="progressBar">
                     <div class="progressBarDone"><p>${bookmaker.reliability}</p></div>
                  </div>
                  <p>линия</p>
                  <div class="progressBar">
                     <div class="progressBarDone"><p>${bookmaker.line}</p></div>
                  </div>
                  <p>удобство работы</p>
                  <div class="progressBar">
                     <div class="progressBarDone"><p>${bookmaker.usability}</p></div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <h4>Плюсы</h4>
                  <div>${bookmaker.pluses}</div>
               </div>
               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <h4>Минусы</h4>
                  <div>${bookmaker.minuses}</div>
               </div>
            </div>
         </div>
         <br>
         <div class="container-fluid">
            <div class="row">
               <div class="col-lg-2 col-md-2 col-sm-2 col-xs-0"></div>
               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <h4>Валюты</h4>
                  <div>${bookmaker.currency}</div>
               </div>
               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <h4>Платежные системы</h4>
                  <div>${bookmaker.payments}</div>
               </div>
               <div class="col-lg-2 col-md-2 col-sm-2 col-xs-0"></div>
            </div>
         </div>
         <div class="container-fluid">
            <div class="row">
               <div class="col-lg-2 col-md-2 col-sm-2 col-xs-0"></div>
               <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                  <h4>Общий рейтинг</h4>
                  <div class="progressBar">
                     <div class="progressBarDone"><p>${bookmaker.result}</p></div>
                  </div>
               </div>
               <div class="col-lg-2 col-md-2 col-sm-2 col-xs-0"></div>
            </div>
         </div>
         <br>
         <div class="bkReitLinkBlock"><a class="bkReitLink" rel="nofollow" target="_blank" href="Counter?id=${bookmaker.bookMakerId}">Регистрация на сайте ${bookmaker.name}</a></div>
      </c:forEach>
      <br>      
   </div>
</div>