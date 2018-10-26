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
                     <div class="champ_tab_text">Премьер-Лига (Россия)</div>
                  </a>
                  <a data-w-tab="Tab 8" class="tab_links w-inline-block w-tab-link">
                     <div class="champ_tab_text england">Премьер-Лига (Англия)</div>
                  </a>
                  <a data-w-tab="Tab 9" class="tab_links w-inline-block w-tab-link">
                     <div class="champ_tab_text germany">Бундеслига (Германия)</div>
                  </a>
                  <a data-w-tab="Tab 10" class="tab_links w-inline-block w-tab-link">
                     <div class="champ_tab_text italy">Серия А (Италия)</div>
                  </a>
                  <a data-w-tab="Tab 11" class="tab_links w-inline-block w-tab-link">
                     <div class="champ_tab_text spain">Ла Лига (Испания)</div>
                  </a>
                  <a data-w-tab="Tab 12" class="tab_links w-inline-block w-tab-link">
                     <div class="champ_tab_text france">Франция Лига 1</div>
                  </a>
               </div>
               <div class="championats_tabs_content w-tab-content">
                  <div data-w-tab="Tab 7" class="tab_panel w-tab-pane w--tab-active">
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
                                    <a href="${contextPath}/${'российская премьер лига'}_матчи" class="button_rate w-button">Матчи</a>
                                    <a href="${contextPath}/${'российская премьер лига'}_таблица" class="button_table w-button">Таблица</a>
                                    <a href="${contextPath}/${'российская премьер лига'}_описание" class="button_description w-button">Описание</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="champ_description_text">Чемпионат России по футболу (официальное название по регламенту с сезона 2018/2019 «Российская Премьер-Лига (Чемпионат России по футболу среди команд клубов Премьер-Лиги)») — высший дивизион системы футбольных лиг России.</div>
                        <div class="champ_description_text">В соревновании участвуют 16 клубов Российской премьер-лиги. После каждого сезона клубы, занявшие 15 и 16 места, переводятся в ФНЛ, а их места занимают две сильнейшие команды этого первенства. Клубы занявшие 13 и 14 места, играют стыковые матчи с командами ФНЛ (3 и 4 места), победившие команды участвуют в РПЛ на следующий сезон.</div>
                     </div>
                  </div>
                  <div data-w-tab="Tab 8" class="tab_panel w-tab-pane">
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
                                    <a href="#" class="button_description w-button">Описание</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="champ_description_text">Чемпиона́т Росси́и по футбо́лу (официальное название по регламенту с сезона 2018/2019 «Российская Премьер-Лига (Чемпионат России по футболу среди команд клубов Премьер-Лиги)») — высший дивизион системы футбольных лиг России.</div>
                        <div class="champ_description_text">В соревновании участвуют 16 клубов Российской премьер-лиги. После каждого сезона клубы, занявшие 15 и 16 места, переводятся в ФНЛ, а их места занимают две сильнейшие команды этого первенства. Клубы занявшие 13 и 14 места, играют стыковые матчи с командами ФНЛ (3 и 4 места), победившие команды участвуют в РПЛ на следующий сезон.</div>
                     </div>
                  </div>
                  <div data-w-tab="Tab 9" class="tab_panel w-tab-pane">
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
                                    <a href="#" class="button_description w-button">Описание</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="champ_description_text">Чемпиона́т Росси́и по футбо́лу (официальное название по регламенту с сезона 2018/2019 «Российская Премьер-Лига (Чемпионат России по футболу среди команд клубов Премьер-Лиги)») — высший дивизион системы футбольных лиг России.</div>
                        <div class="champ_description_text">В соревновании участвуют 16 клубов Российской премьер-лиги. После каждого сезона клубы, занявшие 15 и 16 места, переводятся в ФНЛ, а их места занимают две сильнейшие команды этого первенства. Клубы занявшие 13 и 14 места, играют стыковые матчи с командами ФНЛ (3 и 4 места), победившие команды участвуют в РПЛ на следующий сезон.</div>
                     </div>
                  </div>
                  <div data-w-tab="Tab 10" class="tab_panel w-tab-pane">
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
                                    <a href="#" class="button_description w-button">Описание</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="champ_description_text">Чемпиона́т Росси́и по футбо́лу (официальное название по регламенту с сезона 2018/2019 «Российская Премьер-Лига (Чемпионат России по футболу среди команд клубов Премьер-Лиги)») — высший дивизион системы футбольных лиг России.</div>
                        <div class="champ_description_text">В соревновании участвуют 16 клубов Российской премьер-лиги. После каждого сезона клубы, занявшие 15 и 16 места, переводятся в ФНЛ, а их места занимают две сильнейшие команды этого первенства. Клубы занявшие 13 и 14 места, играют стыковые матчи с командами ФНЛ (3 и 4 места), победившие команды участвуют в РПЛ на следующий сезон.</div>
                     </div>
                  </div>
                  <div data-w-tab="Tab 11" class="tab_panel w-tab-pane">
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
                                    <a href="#" class="button_description w-button">Описание</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="champ_description_text">Чемпиона́т Росси́и по футбо́лу (официальное название по регламенту с сезона 2018/2019 «Российская Премьер-Лига (Чемпионат России по футболу среди команд клубов Премьер-Лиги)») — высший дивизион системы футбольных лиг России.</div>
                        <div class="champ_description_text">В соревновании участвуют 16 клубов Российской премьер-лиги. После каждого сезона клубы, занявшие 15 и 16 места, переводятся в ФНЛ, а их места занимают две сильнейшие команды этого первенства. Клубы занявшие 13 и 14 места, играют стыковые матчи с командами ФНЛ (3 и 4 места), победившие команды участвуют в РПЛ на следующий сезон.</div>
                     </div>
                  </div>
                  <div data-w-tab="Tab 12" class="tab_panel w-tab-pane">
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
                  </div>
               </div>
            </div>
         </div>
         <div class="seo_text_block">
            <div class="w-row">
               <div class="column-20 w-col w-col-8">
                  <div class="info_bookmakers col_info_competishons">
                     <h2 class="seo_h2_text">Матчи на футбол сегодня</h2>
                     <p id="w-node-bbbf061a43ce-707458d1" class="seo_text">Футбол во многих странах мира является спортом номер 1. Большой популярностью пользуются просмотры матчей ведущих лиг. Чемпионаты Италии, Англии, Франции, Германии и Испании смотрят повсеместно, а букмекерские конторы предлагают сделать Матчи на игры по футболу. Чемпионаты своих стран так же пользуются повышенным вниманием, а опытные игроки с удовольствием делают Матчи на результаты турниров в экзотических лигах. Какие футбольные матчи играются сегодня можно узнать на нашем портале.</p>
                     <h2 class="seo_h2_text">Ведущие чемпионаты по футболу: на что ставят сегодня</h2>
                     <p class="seo_text">Наиболее популярными лигами являются чемпионаты Англии, Испании, Германии и Италии. В этих странах играют лучшие клубы планеты, в каждом из которых созвездие звезд из самых разных государств.</p>
                     <p class="seo_text">Все игры Серии А, ЛаЛиге, Бундеслиге и АПЛ отличаются бескомпромиссной борьбой, непредсказуемостью результатов. Это приводит к возможности поставить высокие коэффициенты по Матчим. Хорошие варианты предлагаются даже на игры явных фаворитов с аутсайдерами, что делает сегодня привлекательными экспрессы с участием матчей лидеров. Кто из них играет сегодня?</p>
                     <p class="seo_text">Получить полную информацию об этом можно с помощью нашего ресурса. Достаточно перейти по ссылке на интересующий чемпионат и ближайшие игры с развернутой аналитикой предстанут вниманию пользователей.</p>
                     <div class="seo_bold_text">На что ставить в ведущих чемпионатах по футболу? Букмекерские конторы сегодня предлагают широкий выбор ставок:</div>
                     <ul class="unordered-list-5">
                        <li class="list_item_text">стандартные варианты по исходу матча и конкретному результату</li>
                     </ul>
                     <ul>
                        <li class="list_item_text">форы, в которых дается гандикап в несколько голов каждой команде</li>
                     </ul>
                     <ul>
                        <li class="list_item_text">тоталы – увлекательный вариант для тех, кто любит угадывать общее количество голов</li>
                     </ul>
                     <ul>
                        <li class="list_item_text">конкретные долгосрочные события – кто выиграет чемпионат по футболу, покинет лигу или забьет больше всего голов</li>
                     </ul>
                     <ul>
                        <li class="list_item_text">росписи – букмекеры предлагают Матчи на широкий перечень событий по каждому матчу, которые проходят сегодня. Это идеальный вариант для поклонников статистики, которые любят анализировать количество угловых, карточек, оффсайтов</li>
                     </ul>
                     <div class="info_text_block">Все эти виды ставок актуальны и для российского чемпионата по футболу.</div>
                     <h2 class="seo_h2_text">Какие коэффициенты предлагают сегодня на футбол</h2>
                     <p class="seo_text">Букмекеры предлагают интересные коэффициенты на все матчи, но стоит следить за рынком котировок. Коэффициенты меняются, как стоимость акций на бирже. Сегодня они могут резко вырасти или упасть, что делает Матчи еще более увлекательным занятием.</p>
                  </div>
               </div>
               <div class="col_info_competishons_2 w-col w-col-4">
                  <div class="banner_block">
                     <div class="w-row">
                        <div class="col_banner_logo w-col w-col-6">
                           <div class="banner_logo">
                           </div>
                        </div>
                        <div class="col_button w-col w-col-6">
                        </div>
                     </div>
                  </div>
               </div>
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