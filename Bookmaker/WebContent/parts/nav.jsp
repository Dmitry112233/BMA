<%@ page contentType="text/html;charset=utf-8" %>
<div id="header">
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
                  <a href="Index.spr" class="navbar-brand">BMA</a>
               </div>
               <div class="navbar-collapse collapse">
                  <ul class="nav navbar-nav navbar-right">
                  	<li class="${param.firstMenu == 'true'?'active':''}"><a href="Index.spr">Главная</a></li>
                  	<li class="${param.secondMenu == 'true'?'active':''}"><a href="ExpressesList.spr">Ставки на футбол</a></li>
                  	<li class="${param.therdMenu == 'true'?'active':''}"><a href="FAQList.spr">Уроки беттинга</a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>