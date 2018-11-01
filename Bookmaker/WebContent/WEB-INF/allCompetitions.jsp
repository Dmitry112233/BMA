<!DOCTYPE html>	
<html lang="ru">
   <head>
      <title>${Competishions_T}</title>
      <meta name="Description" content="${Competishions_D}"/>
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
      <div class="hero_competishons_section">
         <div class="hero_championats_block">
            <div data-duration-in="300" data-duration-out="100" class="hero_championats_tab w-tabs">
               <div class="championats_tabs_menu w-tab-menu">
                  <a data-w-tab="Tab 7" class="tab_links w-inline-block w-tab-link w--current">
                     <div class="champ_tab_text"><img src="/Static/bootstrap/img/leagueIcon/российская премьер лига.png" onerror="this.style.display='none'" /> Премьер-Лига (Россия)</div>
                  </a>
                  <a data-w-tab="Tab 8" class="tab_links w-inline-block w-tab-link">
                     <div class="champ_tab_text england"><img src="/Static/bootstrap/img/leagueIcon/английская премьер лига_dark.png" onerror="this.style.display='none'" /> Премьер-Лига (Англия)</div>
                  </a>
                  <a data-w-tab="Tab 11" class="tab_links w-inline-block w-tab-link">
                     <div class="champ_tab_text spain"><img src="/Static/bootstrap/img/leagueIcon/испанская ла лига.png" onerror="this.style.display='none'" /> Ла Лига (Испания)</div>
                  </a>
                  <a data-w-tab="Tab 10" class="tab_links w-inline-block w-tab-link">
                     <div class="champ_tab_text italy"><img src="/Static/bootstrap/img/leagueIcon/итальянская серия а.png" onerror="this.style.display='none'" /> Серия А (Италия)</div>
                  </a>
                  <a data-w-tab="Tab 9" class="tab_links w-inline-block w-tab-link">
                     <div class="champ_tab_text germany"><img src="/Static/bootstrap/img/leagueIcon/немецкая бундеслига.png" onerror="this.style.display='none'" /> Бундеслига (Германия)</div>
                  </a>
                  <!-- <a data-w-tab="Tab 12" class="tab_links w-inline-block w-tab-link">
                     <div class="champ_tab_text france">Франция Лига 1</div>
                     </a> -->
               </div>
               <div class="championats_tabs_content w-tab-content">
                  <div data-w-tab="Tab 7" class="tab_panel w-tab-pane w--tab-active">
                     <div class="tab_content_block">
                        <div class="w-row">
                           <div class="col_tab_content w-col w-col-4">
                              <div class="championat_logo_block">
                                 <img src="/Static/bootstrap/img/leagueIcon/российская премьер лига.png" onerror="this.style.display='none'" width="96" alt="" />
                              </div>
                           </div>
                           <div class="col_tab_content_2 w-col w-col-8">
                              <div class="championat_title_text">
                                 <h1 class="chemp_tab_title">Российская Премьер-Лига</h1>
                                 <div class="champ_tab_text_info">Год основания: 1992</div>
                                 <div class="champ_tab_text_info">Количество команд: 16</div>
                                 <div class="champ_tab_text_info">Действующий победитель: Локомотив</div>
                                 <div class="div-block-16">
                                    <a href="${contextPath}/${'российская премьер лига'}_матчи" class="button_rate w-button">Матчи</a>
                                    <a href="${contextPath}/${'российская премьер лига'}_таблица" class="button_table w-button">Таблица</a>
                                    <a href="${contextPath}/${'российская премьер лига'}_описание" class="button_description w-button">Описание</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="champ_description_text">Чемпионат России по футболу — высший дивизион системы футбольных лиг России.<br>В соревновании участвуют 16 клубов Российской премьер-лиги. После каждого сезона клубы, занявшие 15 и 16 места, переводятся в ФНЛ, а их места занимают две сильнейшие команды этого первенства. Клубы занявшие 13 и 14 места, играют стыковые матчи с командами ФНЛ (3 и 4 места), победившие команды участвуют в РПЛ на следующий сезон.</div>
                     </div>
                  </div>
                  <div data-w-tab="Tab 8" class="tab_panel w-tab-pane">
                     <div class="tab_content_block">
                        <div class="w-row">
                           <div class="col_tab_content w-col w-col-4">
                              <div class="championat_logo_block">
                                 <img src="/Static/bootstrap/img/leagueIcon/английская премьер лига_dark.png" onerror="this.style.display='none'" width="96" alt="" />
                              </div>
                           </div>
                           <div class="col_tab_content_2 w-col w-col-8">
                              <div class="championat_title_text">
                                 <h1 class="chemp_tab_title">Английская Премьер-лига</h1>
                                 <div class="champ_tab_text_info">Год основания: 1992</div>
                                 <div class="champ_tab_text_info">Количество команд: 20</div>
                                 <div class="champ_tab_text_info">Действующий победитель: Манчестер Сити</div>
                                 <div class="div-block-16">
                                    <a href="${contextPath}/${'английская премьер лига'}_матчи" class="button_rate w-button">Матчи</a>
                                    <a href="${contextPath}/${'английская премьер лига'}_таблица" class="button_table w-button">Таблица</a>
                                    <a href="${contextPath}/${'английская премьер лига'}_описание" class="button_description w-button">Описание</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="champ_description_text">Чемпионат России по футболу — высший дивизион системы футбольных лиг России.<br>В соревновании участвуют 16 клубов Российской премьер-лиги. После каждого сезона клубы, занявшие 15 и 16 места, переводятся в ФНЛ, а их места занимают две сильнейшие команды этого первенства. Клубы занявшие 13 и 14 места, играют стыковые матчи с командами ФНЛ (3 и 4 места), победившие команды участвуют в РПЛ на следующий сезон.</div>
                     </div>
                  </div>
                  <div data-w-tab="Tab 11" class="tab_panel w-tab-pane">
                     <div class="tab_content_block">
                        <div class="w-row">
                           <div class="col_tab_content w-col w-col-4">
                              <div class="championat_logo_block">
                                 <img src="/Static/bootstrap/img/leagueIcon/испанская ла лига.png" onerror="this.style.display='none'" width="96" alt="" />
                              </div>
                           </div>
                           <div class="col_tab_content_2 w-col w-col-8">
                              <div class="championat_title_text">
                                 <h1 class="chemp_tab_title">Чемпионат Испании по футболу</h1>
                                 <div class="champ_tab_text_info">Год основания: 1929</div>
                                 <div class="champ_tab_text_info">Количество команд: 20</div>
                                 <div class="champ_tab_text_info">Действующий победитель: Барселона</div>
                                 <div class="div-block-16">
                                    <a href="${contextPath}/${'испанская ла лига'}_матчи" class="button_rate w-button">Матчи</a>
                                    <a href="${contextPath}/${'испанская ла лига'}_таблица" class="button_table w-button">Таблица</a>
                                    <a href="${contextPath}/${'испанская ла лига'}_описание" class="button_description w-button">Описание</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="champ_description_text">Чемпионат России по футболу — высший дивизион системы футбольных лиг России.<br>В соревновании участвуют 16 клубов Российской премьер-лиги. После каждого сезона клубы, занявшие 15 и 16 места, переводятся в ФНЛ, а их места занимают две сильнейшие команды этого первенства. Клубы занявшие 13 и 14 места, играют стыковые матчи с командами ФНЛ (3 и 4 места), победившие команды участвуют в РПЛ на следующий сезон.</div>
                     </div>
                  </div>
                  <div data-w-tab="Tab 10" class="tab_panel w-tab-pane">
                     <div class="tab_content_block">
                        <div class="w-row">
                           <div class="col_tab_content w-col w-col-4">
                              <div class="championat_logo_block">
                                 <img src="/Static/bootstrap/img/leagueIcon/итальянская серия а.png" onerror="this.style.display='none'" width="96" alt="" />
                              </div>
                           </div>
                           <div class="col_tab_content_2 w-col w-col-8">
                              <div class="championat_title_text">
                                 <h1 class="chemp_tab_title">Чемпионат Италии по футболу</h1>
                                 <div class="champ_tab_text_info">Год основания: 1898</div>
                                 <div class="champ_tab_text_info">Количество команд: 20</div>
                                 <div class="champ_tab_text_info">Действующий победитель: Ювентус</div>
                                 <div class="div-block-16">
                                    <a href="${contextPath}/${'итальянская серия а'}_матчи" class="button_rate w-button">Матчи</a>
                                    <a href="${contextPath}/${'итальянская серия а'}_таблица" class="button_table w-button">Таблица</a>
                                    <a href="${contextPath}/${'итальянская серия а'}_описание" class="button_description w-button">Описание</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="champ_description_text">Чемпионат России по футболу — высший дивизион системы футбольных лиг России.<br>В соревновании участвуют 16 клубов Российской премьер-лиги. После каждого сезона клубы, занявшие 15 и 16 места, переводятся в ФНЛ, а их места занимают две сильнейшие команды этого первенства. Клубы занявшие 13 и 14 места, играют стыковые матчи с командами ФНЛ (3 и 4 места), победившие команды участвуют в РПЛ на следующий сезон.</div>
                     </div>
                  </div>
                  <div data-w-tab="Tab 9" class="tab_panel w-tab-pane">
                     <div class="tab_content_block">
                        <div class="w-row">
                           <div class="col_tab_content w-col w-col-4">
                              <div class="championat_logo_block">
                                 <img src="/Static/bootstrap/img/leagueIcon/немецкая бундеслига.png" onerror="this.style.display='none'" width="96" alt="" />
                              </div>
                           </div>
                           <div class="col_tab_content_2 w-col w-col-8">
                              <div class="championat_title_text">
                                 <h1 class="chemp_tab_title">Чемпионат Германии по футболу</h1>
                                 <div class="champ_tab_text_info">Год основания: 1962</div>
                                 <div class="champ_tab_text_info">Количество команд: 18</div>
                                 <div class="champ_tab_text_info">Действующий победитель: Бавария</div>
                                 <div class="div-block-16">
                                    <a href="${contextPath}/${'немецкая бундеслига'}_матчи" class="button_rate w-button">Матчи</a>
                                    <a href="${contextPath}/${'немецкая бундеслига'}_таблица" class="button_table w-button">Таблица</a>
                                    <a href="${contextPath}/${'немецкая бундеслига'}_описание" class="button_description w-button">Описание</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="champ_description_text">Чемпионат России по футболу — высший дивизион системы футбольных лиг России.<br>В соревновании участвуют 16 клубов Российской премьер-лиги. После каждого сезона клубы, занявшие 15 и 16 места, переводятся в ФНЛ, а их места занимают две сильнейшие команды этого первенства. Клубы занявшие 13 и 14 места, играют стыковые матчи с командами ФНЛ (3 и 4 места), победившие команды участвуют в РПЛ на следующий сезон.</div>
                     </div>
                  </div>
                  <!-- <div data-w-tab="Tab 12" class="tab_panel w-tab-pane">
                     <div class="tab_content_block">
                        <div class="w-row">
                           <div class="col_tab_content w-col w-col-4">
                              <div class="championat_logo_block">
                                 <img src="images/5bc621b289d9f3d525073ecf_231px-Russian_Premier_League_Logo-1.png" width="96" alt="" />
                              </div>
                           </div>
                           <div class="col_tab_content_2 w-col w-col-8">
                              <div class="championat_title_text">
                                 <h1 class="chemp_tab_title">Российская Премьер-Лига</h1>
                                 <div class="champ_tab_text_info">Основан 8 февраля 1992</div>
                                 <div class="champ_tab_text_info">Количество команд: 16</div>
                                 <div class="champ_tab_text_info">Действующий победитель: Локомотив (Москва)</div>
                                 <div class="div-block-16">
                                    <a href="#" class="button_rate w-button">Матчи</a>
                                    <a href="#" class="button_table w-button">Таблица</a>
                                    <a href="/rossiyskaya-premer-liga.html" class="button_description w-button">Описание</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="champ_description_text">Чемпиона́т Росси́и по футбо́лу (официальное название по регламенту с сезона 2018/2019 «Российская Премьер-Лига (Чемпионат России по футболу среди команд клубов Премьер-Лиги)») — высший дивизион системы футбольных лиг России.</div>
                        <div class="champ_description_text">В соревновании участвуют 16 клубов Российской премьер-лиги. После каждого сезона клубы, занявшие 15 и 16 места, переводятся в ФНЛ, а их места занимают две сильнейшие команды этого первенства. Клубы занявшие 13 и 14 места, играют стыковые матчи с командами ФНЛ (3 и 4 места), победившие команды участвуют в РПЛ на следующий сезон.</div>
                     </div>
                     </div> -->
               </div>
            </div>
         </div>
         <div class="seo_text_block">
            <div class="w-row">
               <div class="column-20 w-col w-col-8">
                  <div class="seoBlock">
                     <div class="info_bookmakers col_info_competishons">
                        <h2 class="seo_h2_text">Ставки на футбол сегодня</h2>
                     </div>
                     ${Competishions_Txt}
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