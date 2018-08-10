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
                  <a href="Bookmakers" class="navbar-brand"><img class="BMALogo" src="bootstrap/img/BMAlogo.png" alt="BestBet"></a>
               </div>
               <div class="navbar-collapse collapse">
                  <ul class="nav navbar-nav navbar-right">
                     <li class="${param.fourthMenu == 'true'?'active':''}"><a href="Bookmakers">Букмекеры</a></li>      
                     <li class="${param.eighthMenu == 'true'?'active':''} dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">Ставки на футбол<span class="caret"></span></a>
                        <ul class="dropdown-menu dropdown-menu3">                           
						   <li class="${param.Menu == 'true'?'active':''}"><a href="PremierLeague_${'Российская Примьер Лига'}_List">Премьер-Лига (Россия)</a></li>
						   <li class="${param.Menu == 'true'?'active':''}"><a href="PremierLeague_${'Английская Примьер Лига'}_List">Премьер-Лига (Англия)</a></li>
						   <li class="${param.Menu == 'true'?'active':''}"><a href="PremierLeague_${'Испанская Ла Лига'}_List">Ла Лига (Испания)</a></li>
						   <li class="${param.Menu == 'true'?'active':''}"><a href="PremierLeague_${'Итальянская серия А'}_List">Серия А (Италия)</a></li>
						   <li class="${param.Menu == 'true'?'active':''}"><a href="PremierLeague_${'Немецкая Бундеслига'}_List">Бундеслига (Германия)</a></li>                                     
						   <li class="${param.Menu == 'true'?'active':''}"><a href="PremierLeague_${'Чемпионат Мира'}_List">Чемпионат Мира 2018</a></li>
                        </ul>
                     </li>            
                     <li class="${param.betMenu == 'true'?'active':''} dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">Ставки <span class="caret"></span></a>
                        <ul class="dropdown-menu dropdown-menu3">
                           <li class="${param.secondMenu == 'true'?'active':''}"><a href="ExpressesList_0">Экспрессы</a></li>
                           <li class="${param.sixthMenu == 'true'?'active':''}"><a href="EventsList">Одиночные прогнозы</a></li>                           
                        </ul>
                     </li>
                     <li class="${param.fifthMenu == 'true'?'active':''}"><a href="News_0">Новости</a></li>
                     
                     <li class="${param.therdMenu == 'true'?'active':''}"><a href="FAQList">Теория</a></li>
                     <li class="${param.noneMenu == 'true'?'fakeMenu':''}"></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<script >
  document.getElementById("football")
   .onclick = function(event) {
      event.preventDefault();
       event.stopPropagation();
       return false;
     };
</script>