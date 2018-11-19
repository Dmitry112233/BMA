<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js" type="text/javascript"></script>
<script type="text/javascript">WebFont.load({  google: {    families: ["Open Sans:300,300italic,400,400italic,600,600italic,700,700italic,800,800italic"]  }});</script>
<div data-collapse="medium" data-animation="default" data-duration="400" data-w-id="db9a7df6-37d1-925e-5aa6-efd7dadd119d" class="navbar w-nav">
   <div class="nav-container w-container">
      <a href="${contextPath}/" class="brand w-nav-brand">
      <img src="/Static/bootstrap/img/BMAlogoNew.png" width="180" alt="findbestbet" class="fb_logo image-5" />
      </a>
      <nav role="navigation" class="nav-menu w-nav-menu">
         <a href="${contextPath}/" class="nav-link w-nav-link w--current" data-ix="new-interaction">БУКМЕКЕРЫ</a>
          <div data-delay="0" class="w-hidden-tiny w-dropdown">
            <div class="dropdown-toggle-2 w-dropdown-toggle">
              <div class="w-icon-dropdown-toggle">
              </div>
              <div class="menu_dropdown-text">СТАВКА НА СПОРТ</div>
            </div>
            <nav class="megamenu_dropdown_list w-dropdown-list">
              <div class="rotate_45 w-hidden-medium w-hidden-small w-hidden-tiny">
              </div>
              <div class="div-block-22 div-block-23 div-block-24 div-block-25 div-block-26 megamenu_block">
                <a id="w-node-e7e0b2f715d1-dadd119d" href="${contextPath}/${'российская премьер лига'}_матчи" class="megamenu_command_name w-inline-block">
                  <div class="megamenu_command_img _0" style="background-image: url('/Static/bootstrap/img/leagueIcon/российская премьер лига_dark.png')">
                  </div>
                  <div class="megamenu_command_name_text">Премьер-лига<br>(Россия)</div>
                </a>
                <a id="w-node-5b2fc1ac7db1-dadd119d" href="${contextPath}/${'английская премьер лига'}_матчи" class="megamenu_command_name w-inline-block">
                  <div class="megamenu_command_img _1" style="background-image: url('/Static/bootstrap/img/leagueIcon/английская премьер лига_dark.png')">
                  </div>
                  <div class="megamenu_command_name_text">Премьер-лига<br>(Англия)</div>
                </a>
                <a id="w-node-31ecdffc1bf2-dadd119d" href="${contextPath}/${'испанская ла лига'}_матчи" class="megamenu_command_name w-inline-block">
                  <div class="megamenu_command_img _3" style="background-image: url('/Static/bootstrap/img/leagueIcon/испанская ла лига_dark.png')">
                  </div>
                  <div class="megamenu_command_name_text">Ла Лига<br>(Испания)</div>
                </a>
                <a id="w-node-a26f25096494-dadd119d" href="${contextPath}/${'немецкая бундеслига'}_матчи" class="megamenu_command_name w-inline-block">
                  <div class="megamenu_command_img _4" style="background-image: url('/Static/bootstrap/img/leagueIcon/немецкая бундеслига_dark.png')">
                  </div>
                  <div class="megamenu_command_name_text">Бундеслига<br>(Германия)</div>
                </a>
                <a id="w-node-93172d138b0b-dadd119d" href="${contextPath}/${'итальянская серия а'}_матчи" class="megamenu_command_name w-inline-block">
                  <div class="megamenu_command_img" style="background-image: url('/Static/bootstrap/img/leagueIcon/итальянская серия а_dark.png')">
                  </div>
                  <div class="megamenu_command_name_text">Серия А<br>(Италия)</div>
                </a>
                <a id="w-node-fc029557e542-dadd119d" href="${contextPath}/competitions" class="megamenu_command_name w-inline-block">
                  <div class="megamenu_command_img _6" style="background-image: url('/Static/bootstrap/img/leagueIcon/ball.png')">
                  </div>
                  <div class="megamenu_command_name_text">Все<br>чемпионаты</div>
                </a>
              </div>
            </nav>
          </div>
         <div data-delay="0" class="w-dropdown">
            <div class="menu_dropdown w-hidden-main w-hidden-medium w-hidden-small w-dropdown-toggle">
               <div class="menu_dropdown-icon w-icon-dropdown-toggle">
               </div>
               <div class="menu_dropdown-text">ФУТБОЛ</div>
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