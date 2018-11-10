<!DOCTYPE html>
<html lang="ru">
   <head>
      <title>${Event_T}</title>
      <meta name="Description" content="${Event_D}"/>
      <meta name="Keywords" content=""/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="all"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>
      <link rel="shortcut icon" href="/Static/bootstrap/img/favicon.ico" type="image/x-icon">
      <link href="/Static/bootstrap/css/style-${cssVersion}.css" rel="stylesheet">
      <link href="/Static/bootstrap/css/myStyle-${cssVersion}.css" rel="stylesheet">
      <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
   </head>
   <body class="body">
      <c:import url="parts/nav.jsp"></c:import>
      <div class="bets_description-section">
         <div class="bets_description_block">
            <div class="bets_description-columns w-row">
               <div class="beta_desc_col1 w-col w-col-8 w-col-stack">
                  <div class="bets_discr_tabs">
                     <div class="title_block w-clearfix">
                        <h1 class="discr_title_text">${Event_H1}</h1>
                     </div>
                  </div>
                  <div class="exp_discr-content">
                     <div class="exp_discr-title w-clearfix">
                        <div id="w-node-35fb8bf332ba-29184134" class="div-block-17 position">
                           <div id="w-node-35fb8bf332bb-29184134" class="date_block">Дата начала: ${allEvents.get('футбол').get(0).dateStr}</div>
                        </div>
                     </div>
                     <div data-duration-in="300" data-duration-out="100" class="bets_discription-tabs w-tabs">
                        <div class="discr_tabs-menu _2 w-tab-menu">
                           <a data-w-tab="Tab 1" class="discr_tab-link w-inline-block w-tab-link w--current">
                              <div class="discr_tab-linktext">Футбол</div>
                           </a>
                           <a data-w-tab="Tab 8" class="discr_tab-link w-inline-block w-tab-link">
                              <div class="discr_tab-linktext">
                                 <strong>Хоккей</strong>
                              </div>
                           </a>
                           <a data-w-tab="Tab 9" class="discr_tab-link w-inline-block w-tab-link">
                              <div class="discr_tab-linktext">
                                 <strong>Теннис</strong>
                              </div>
                           </a>
                           <a data-w-tab="Tab 10" class="discr_tab-link w-inline-block w-tab-link">
                              <div class="discr_tab-linktext">
                                 <strong>Баскетбол</strong>
                              </div>
                           </a>
                        </div>
                        <div class="express_discription-tabs_content w-tab-content">
                           <c:set var="TabListName" value="${football}" scope="request"/>
                           <c:set var="TabListNumber" value="1" scope="request"/>
                           <c:set var="defTab" value="w--tab-active" scope="request"/>
                           <c:import url="parts/eventsTabs.jsp"/>
                           <c:set var="TabListName" value="${hockey}" scope="request"/>
                           <c:set var="TabListNumber" value="8" scope="request"/>
                           <c:set var="defTab" value="" scope="request"/>
                           <c:import url="parts/eventsTabs.jsp"/>
                           <c:set var="TabListName" value="${tennis}" scope="request"/>
                           <c:set var="TabListNumber" value="9" scope="request"/>
                           <c:set var="defTab" value="" scope="request"/>
                           <c:import url="parts/eventsTabs.jsp"/>
                           <c:set var="TabListName" value="${bascketball}" scope="request"/>
                           <c:set var="TabListNumber" value="10" scope="request"/>
                           <c:set var="defTab" value="" scope="request"/>
                           <c:import url="parts/eventsTabs.jsp"/>
                        </div>
                     </div>
                  </div>
                  <div class="seoBlock">
                     ${Event_Txt}
                  </div>
               </div>
               <c:import url="parts/sideBanners/1xbetSideBanner.jsp"></c:import>
               <c:import url="parts/sideBanners/leonSideBanner.jsp"></c:import>
               <c:import url="parts/sideBanners/ligaSideBanner.jsp"></c:import>
            </div>
         </div>
      </div>
      <c:import url="parts/footer.jsp"></c:import>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
      <script src="/Static/bootstrap/js/script.js" type="text/javascript"></script>
      <script type="text/javascript" src="/Static/bootstrap/js/mail.js"></script>
      <script type="text/javascript">$(document).ready(function(){$('[href*="brandjs"]').attr('style', 'display:none !important');$('a[href="'+window.location.href+'"]').addClass('w--current');});</script>   	
   </body>
</html>