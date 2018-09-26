<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="bkReitBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="bkReit">
      <br>
      <a class="BackButton" href="${contextPath}/bookmakers"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Другие букмекеры</a>
      <br><br>
      <br>
      <div class="container-fluid">
         <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <div class="bkName">
                  <a rel="nofollow" href="counter?id=${bookmaker.bookMakerId}" target="_blank"><img class="bmReitLogo" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a>	      		     		
               </div>
            </div>
         </div>
      </div>
      <br>
      <div id="desc1" class="container-fluid">
         <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               <p class="TextLikeHeadline2">Критерии</p>
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
               <p class="TextLikeHeadline2">Плюсы</p>
               <div>${bookmaker.pluses}</div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               <p class="TextLikeHeadline2">Минусы</p>
               <div>${bookmaker.minuses}</div>
            </div>
         </div>
      </div>
      <br>
      <div class="container-fluid">
         <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-0"></div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               <p class="TextLikeHeadline2">Валюты</p>
               <div>${bookmaker.currency}</div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               <p class="TextLikeHeadline2">Платежные системы</p>
               <div>${bookmaker.payments}</div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-0"></div>
         </div>
      </div>
      <div class="container-fluid">
         <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-0"></div>
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
               <p class="TextLikeHeadline2">Общий рейтинг</p>
               <div class="progressBar">
	               <div class="progressBarDone"><p>${bookmaker.result}</p></div>
               </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-0"></div>
         </div>
      </div>
      <br>
      <div class="bkReitLinkBlock"><a class="bkReitLink" rel="nofollow" target="_blank" href="counter?id=${bookmaker.bookMakerId}">Регистрация на сайте ${bookmaker.name}</a></div>
      <br>
      	<div class="article">${Bookmaker_Txt}</div>
      <br>         
   </div>    
</div>