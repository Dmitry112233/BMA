<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="general-slider">
   <div data-delay="6000" data-animation="outin" data-autoplay="1" data-easing="ease-in-out" data-nav-spacing="5" data-duration="500" data-infinite="1" class="slider w-clearfix w-slider">
      <div class="slide-nav-2 w-slider-nav w-round">
      </div>
      <div class="mask w-slider-mask">
         <div class="slider_liga-stavok w-slide">
            <a href="counter?id=${bookmakerList.get('1xBet').bookMakerId}" target="_blank" class="slider-link-leon _1xbet w-inline-block">
			<img src="/Static/bootstrap/img/promo/1xbetPromo.png" width="1220" alt="" />
			</a>
         </div>
         <div class="slide-2 w-slide">
            <a href="counter?id=${bookmakerList.get('БК ЛЕОН').bookMakerId}" target="_blank" class="slider-link-leon _1xbet w-inline-block">
			<img src="/Static/bootstrap/img/promo/leonPromo.png" width="1220" alt="" />
			</a>
         </div>         
         <div class="slider_liga-stavok w-slide">
            <a href="counter?id=${bookmakerList.get('Лига Ставок').bookMakerId}" target="_blank" class="slider-link-leon liga-stavok w-inline-block">
			<img src="/Static/bootstrap/img/promo/ligaPromo.png" width="1220" alt="" />
			</a>
         </div>
      </div>
      <div class="left-arrow-2 w-slider-arrow-left">
         <div class="slider-icon w-icon-slider-left">
         </div>
      </div>
      <div class="left-arrow-2 _1 w-slider-arrow-right">
         <div class="slider-icon w-icon-slider-right">
         </div>
      </div>
      
   </div>
</div>