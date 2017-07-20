<%@ page contentType="text/html;charset=utf-8" %>
<div id="header">
   <div class="container">
      <div class="row">
         <h1>Выигрывай на ставках</h1>
      </div>
   </div>
   <div class="container">
      <div class="row">
         <div class="n navbar navbar-inverse">
            <div class="container">
               <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  </button>
                  <a href="index.jsp" class="navbar-brand">BMA</a>
               </div>
               <div class="navbar-collapse collapse">
                  <ul class="nav navbar-nav navbar-right">
                  	<li class="${param.firstMenu == 'true'?'active':''}"><a href="index.jsp">Главная</a></li>
                  	<li class="${param.secondMenu == 'true'?'active':''}"><a href="football.jsp">Ставки на футбол</a></li>
                  	<li class="${param.therdMenu == 'true'?'active':''}"><a href="lessons.jsp">Уроки беттинга</a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>