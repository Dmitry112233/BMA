<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
                  <a href="${contextPath}/bookmakers" class="navbar-brand"><img class="BMALogo" src="/Static/bootstrap/img/BMAlogo.png" alt="BestBet"></a>
               </div>
               <div class="navbar-collapse collapse">
                  <ul class="nav navbar-nav navbar-right">
                     <li class="${param.fourthMenu == 'true'?'active':''}"><a href="${contextPath}/bookmakers">Букмекеры</a></li>
                     <li class="${param.eighthMenu == 'true'?'active':''} dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">Ставки на футбол<span class="caret"></span></a>
                        <ul class="dropdown-menu dropdown-menu3">                           
						   <li class="${param.Menu == 'true'?'active':''}"><a href="${contextPath}/${'российская примьер лига'}_матчи">Премьер-Лига (Россия)</a></li>
						   <li class="${param.Menu == 'true'?'active':''}"><a href="${contextPath}/${'английская примьер лига'}_матчи">Премьер-Лига (Англия)</a></li>
						   <li class="${param.Menu == 'true'?'active':''}"><a href="${contextPath}/${'испанская ла лига'}_матчи">Ла Лига (Испания)</a></li>
						   <li class="${param.Menu == 'true'?'active':''}"><a href="${contextPath}/${'итальянская серия а'}_матчи">Серия А (Италия)</a></li>
						   <li class="${param.Menu == 'true'?'active':''}"><a href="${contextPath}/${'немецкая бундеслига'}_матчи">Бундеслига (Германия)</a></li>
                        </ul>
                     </li>            
                     <li class="${param.betMenu == 'true'?'active':''} dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">Прогнозы <span class="caret"></span></a>
                        <ul class="dropdown-menu dropdown-menu3">
                           <li class="${param.secondMenu == 'true'?'active':''}"><a href="${contextPath}/expresses_list_0">Экспрессы</a></li>
                           <li class="${param.sixthMenu == 'true'?'active':''}"><a href="${contextPath}/events_list">Одиночные прогнозы</a></li>                           
                        </ul>
                     </li>
                     <li class="${param.fifthMenu == 'true'?'active':''}"><a href="${contextPath}/news_0">Новости</a></li>
                     
                     <li class="${param.therdMenu == 'true'?'active':''}"><a href="${contextPath}/faq_list">Теория</a></li>
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