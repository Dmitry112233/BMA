<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="bkReitBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="bkReit">
      <h2>Описание, рейтинг...</h2>
      <c:forEach var="bookmaker" items="${bookmakerList.values()}">	
      
      <div class="progressBar">
		<div class="progressBarDone">${bookmaker.line}</div>
	 </div>	
      	<span id="bk_id_${bookmaker.bookMakerId}"></span><br><!-- якорь -->
      	<div class="bkName">
      		<a rel="nofollow" href="${bookmaker.link}" target="_blank"><img class="bmReitLogo" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a>
      		<h3><a rel="nofollow" target="_blank" href="${bookmaker.link}">${bookmaker.name}</a></h3>
      	</div>      	
      	<br>
      	<div id="desc1" class="container-fluid">
      		<div class="row">
      			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
      				<h4>Критерии</h4>
      				<p>надежность</p>
      				<div>полоска со значением ${bookmaker.reliability}</div>
      				<p>линия</p>
      				<div>полоска со значением ${bookmaker.line}</div>
      				<p>удобство работы</p>
      				<div>полоска со значением ${bookmaker.usability}</div>
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
      			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
      				<h4>Валюты</h4>
      				<div>${bookmaker.currency}</div>
      			</div>
      			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
      				<h4>Платежные системы</h4>
      				<div>${bookmaker.payments}</div>
      			</div>
      		</div> 
      	</div>
      	<br>
      	<h4>Общий рейтинг</h4>
      	<div>большая полоска со значением ${bookmaker.result}</div>
      	<div><a rel="nofollow" target="_blank" href="${bookmaker.link}">Перейти на сайт ${bookmaker.name}</a></div>
      </c:forEach>      
   </div>
</div>