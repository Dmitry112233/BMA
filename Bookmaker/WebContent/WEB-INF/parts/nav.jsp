<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js" type="text/javascript"></script>
<script type="text/javascript">WebFont.load({  google: {    families: ["Open Sans:300,300italic,400,400italic,600,600italic,700,700italic,800,800italic"]  }});</script>
<div data-collapse="medium" data-animation="default" data-duration="400" data-w-id="db9a7df6-37d1-925e-5aa6-efd7dadd119d" class="navbar w-nav">
   <div class="nav-container w-container">
      <a href="${contextPath}/bookmakers" class="brand w-nav-brand">
      <img src="/Static/bootstrap/img/BMAlogoNew.png" width="180" alt="findbestbet" />
      </a>
      <nav role="navigation" class="nav-menu w-nav-menu">
         <a href="${contextPath}/bookmakers" class="nav-link w-nav-link" data-ix="new-interaction">БУКМЕКЕРЫ</a>
         <div data-delay="0" class="w-dropdown">
            <div class="menu_dropdown w-dropdown-toggle">
               <div class="menu_dropdown-icon w-icon-dropdown-toggle">
               </div>
               <div class="menu_dropdown-text">СТАВКА НА ФУТБОЛ</div>
            </div>
            <nav class="menu_dropdown-list w-dropdown-list" data-ix="menu-dropdown-list">
               <a href="${contextPath}/${'российская премьер лига'}_матчи" class="menu_dropdown_link w-dropdown-link">Премьер-Лига (Россия)</a>
               <a href="${contextPath}/${'английская премьер лига'}_матчи" class="menu_dropdown_link w-dropdown-link">Премьер-Лига (Англия)</a>
               <a href="${contextPath}/${'испанская ла лига'}_матчи" class="menu_dropdown_link w-dropdown-link">Ла Лига (Испания)</a>
               <a href="${contextPath}/${'итальянская серия а'}_матчи" class="menu_dropdown_link w-dropdown-link">Серия А (Италия)</a>
               <a href="${contextPath}/${'немецкая бундеслига'}_матчи" class="menu_dropdown_link w-dropdown-link">Бундеслига (Германия)</a>
               <a href="${contextPath}/competitions" class="menu_dropdown_link w-dropdown-link">Все чемпионаты</a>
            </nav>
         </div>
         <div data-delay="0" class="w-dropdown">
            <div class="menu_dropdown w-dropdown-toggle">
               <div class="menu_dropdown-icon w-icon-dropdown-toggle">
               </div>
               <div class="menu_dropdown-text">ПРОГНОЗЫ</div>
            </div>
            <nav class="menu_dropdown-list w-dropdown-list" data-ix="menu-dropdown-list-2">
               <a href="${contextPath}/expresses_list_0" class="menu_dropdown_link w-dropdown-link">Экспрессы</a>
               <a href="${contextPath}/events_list" class="menu_dropdown_link w-dropdown-link">Одиночные прогнозы</a>
            </nav>
         </div>
         <a href="${contextPath}/news_0" class="nav-link w-nav-link" data-ix="new-interaction">НОВОСТИ</a>
         <a href="${contextPath}/faq_list" class="nav-link w-nav-link">ВОПРОСЫ</a>
      </nav>
      <div class="menu-btn w-nav-button">
         <div data-w-id="db9a7df6-37d1-925e-5aa6-efd7dadd11d9" class="burger-line">
         </div>
         <div data-w-id="db9a7df6-37d1-925e-5aa6-efd7dadd11da" class="burger-line">
         </div>
         <div data-w-id="db9a7df6-37d1-925e-5aa6-efd7dadd11db" class="burger-line">
         </div>
      </div>
   </div>
</div>