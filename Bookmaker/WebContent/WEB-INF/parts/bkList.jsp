<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="col-1-rating w-col w-col-8 w-col-stack">
   <div class="bookmakers">
      <div class="columns w-row">
         <div class="w-clearfix w-col w-col-6">
            <h1 class="home_title_h1">${bookmakers_H1}</h1>
         </div>
         <div class="w-clearfix w-col w-col-6">
            <a href="${contextPath}/competitions" class="link toAllChampLink">Анализ ближайших матчей по футболу</a>
         </div>
      </div>
   </div>
   <c:forEach var="bookmaker" items="${bookmakerList.values()}">
   <div class="_1xbet bkCard">
      <div class="w-row">
         <div class="col-1 w-col w-col-3 w-col-stack">
            <div class="logo-1xbet">
               <a href="counter?id=${bookmaker.bookMakerId}" target="_blank" rel="nofollow"><img class="_1xbet-logo" src="${bookmaker.image}" width="106" onerror="this.style.display='none'" alt="${bookmaker.name} logo" /></a>
               <div class="rating w-clearfix">
                  <div class="text-block-2">ОБЩИЙ РЕЙТИНГ</div>
                  <div class="div-block">
                     <div class="text-block-3">${bookmaker.result}</div>
                  </div>
                  <div class="progress _3 progressBar">
                     <div class="processing _3 progressBarDone"><p class="progressValue">${bookmaker.result}</p></div>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-2 w-col w-col-7 w-col-stack">
            <div class="content-block-text">
               <p class="bonusesH4">
                  <strong class="bold-text">Бонусы</strong>
               </p>
               <div class="bonusShort">${bookmaker.bonus}</div>	
            </div>
         </div>
         <div class="col-3 w-col w-col-2 w-col-stack">
            <div class="bonus">
               <div class="bonus-block">
                  <div class="reg_bonus">
                     <div class="text-block-5">При регистрации</div>
                     <div class="text-block-6">БОНУС ${bookmaker.bonus_int}₽</div>
                  </div>
                  <a href="${contextPath}/bookmaker_${bookmaker.bookMakerId}" class="registration-btn _2 w-inline-block">
                     <div class="text-block-7">О БУКМЕКЕРЕ</div>
                  </a>
                  <a href="counter?id=${bookmaker.bookMakerId}" target="_blank" rel="nofollow" class="registration-btn w-inline-block">
                     <div class="text-block-7 reg">РЕГИСТРАЦИЯ</div>
                  </a>
               </div>
            </div>
         </div>
      </div>
   </div>
   </c:forEach>
</div>