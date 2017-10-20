<%@ page contentType="text/html;charset=utf-8" %>
<div id="header">
   <div class="container-fluid">
      <div class="row">
         <div class="n navbar navbar-inverse navbar-static-top">
            <div class="container">
               <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  </button>
                  <a href="Index.spr" class="navbar-brand">BestBet</a>
               </div>
               <div class="navbar-collapse collapse">
                  <ul class="nav navbar-nav navbar-right">
                  	<li class="${param.firstMenu == 'true'?'active':''}"><a href="Index.spr">Ставка дня</a></li>
                  	<li class="${param.secondMenu == 'true'?'active':''}"><a href="ExpressesList.spr">Экспрессы</a></li>
                  	<li class="${param.sixthMenu == 'true'?'active':''}"><a href="EventsList.spr">Прогнозы</a></li>
                  	<li class="${param.fourthMenu == 'true'?'active':''}"><a href="Bookmakers.spr">Букмекеры</a></li>
                  	<li class="${param.fifthMenu == 'true'?'active':''}"><a href="News.spr">Новости</a></li>
                  	<li class="${param.therdMenu == 'true'?'active':''}"><a href="FAQList.spr">Теория</a></li>                  	
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>