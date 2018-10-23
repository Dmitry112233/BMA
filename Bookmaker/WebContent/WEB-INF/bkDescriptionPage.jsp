<!DOCTYPE html>
<html lang="ru">
   <head>      
      <title>${Bookmaker_T}</title>
      <meta name="Description" content="${Bookmaker_D}"/>
      <meta name="Keywords" content=""/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="all"/>
      <meta http-equiv="Content-Type" content="type; charset=utf-8"/>      
      <link rel="shortcut icon" href="/Static/bootstrap/img/favicon.ico" type="image/x-icon">
      <%@ page contentType="text/html;charset=utf-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>     
      <link href="/Static/bootstrap/css/bootstrap.css" rel="stylesheet">
      <link href="/Static/bootstrap/css/main-${cssVersion}.css" rel="stylesheet">
      <link href="/Static/bootstrap/css/style-${cssVersion}.css" rel="stylesheet">
      <script src="/Static/bootstrap/js/lineSmall.js"></script>
      <script src="/Static/bootstrap/js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript">
         !function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);
      </script>   
   </head>
   <body class="body">
      <div data-collapse="medium" data-animation="default" data-duration="400" data-w-id="db9a7df6-37d1-925e-5aa6-efd7dadd119d" class="navbar w-nav">
         <div class="nav-container w-container">
            <a href="#" class="brand w-nav-brand">
            <img src="/Static/bootstrap/img/BMAlogoNew.png" width="160" alt="" />
            </a>
            <nav role="navigation" class="nav-menu w-nav-menu">
               <div data-delay="0" class="mega-menu w-dropdown">
                  <div class="dropdown-toggle w-dropdown-toggle">
                     <div class="text-block-29">БУКМЕКЕРЫ</div>
                  </div>
                  <nav class="drn-list w-dropdown-list">
                     <div class="mega-menu-drn">
                        <div class="div-block-14">
                        </div>
                        <div class="w-row">
                           <div class="column-11 w-col w-col-4">
                              <div class="dropdown-bet _1">
                              </div>
                           </div>
                           <div class="column-12 w-col w-col-4">
                              <div class="dropdown-2">
                              </div>
                              <div class="dropdown-2">
                              </div>
                           </div>
                           <div class="col-3-dropdown w-col w-col-4">
                              <div class="dropdown-2">
                              </div>
                              <div class="dropdown-2">
                              </div>
                           </div>
                        </div>
                     </div>
                  </nav>
               </div>
               <div data-delay="0" class="mega-menu w-dropdown">
                  <div class="dropdown-toggle w-dropdown-toggle">
                     <div class="text-block-31">
                        <a href="#" class="link-2">СТАВКА НА СПОРТ</a>
                     </div>
                  </div>
                  <nav class="drn-list w-dropdown-list">
                     <div class="mega-menu-drn">
                        <div class="div-block-14">
                        </div>
                        <div class="w-row">
                           <div class="column-11 w-col w-col-4">
                              <div class="dropdown-bet _1">
                              </div>
                           </div>
                           <div class="column-12 w-col w-col-4">
                              <div class="dropdown-2">
                              </div>
                              <div class="dropdown-2">
                              </div>
                           </div>
                           <div class="col-3-dropdown w-col w-col-4">
                              <div class="dropdown-2">
                              </div>
                              <div class="dropdown-2">
                              </div>
                           </div>
                        </div>
                     </div>
                  </nav>
               </div>
               <div data-delay="0" class="mega-menu w-dropdown">
                  <div class="dropdown-toggle w-dropdown-toggle">
                     <div class="text-block-30">
                        <a href="#" class="link-2">ПРОГНОЗЫ</a>
                     </div>
                  </div>
                  <nav class="drn-list w-dropdown-list">
                     <div class="mega-menu-drn">
                        <div class="div-block-14">
                        </div>
                        <div class="w-row">
                           <div class="column-11 w-col w-col-4">
                              <div class="dropdown-bet _1">
                              </div>
                           </div>
                           <div class="column-12 w-col w-col-4">
                              <div class="dropdown-2">
                              </div>
                              <div class="dropdown-2">
                              </div>
                           </div>
                           <div class="col-3-dropdown w-col w-col-4">
                              <div class="dropdown-2">
                              </div>
                              <div class="dropdown-2">
                              </div>
                           </div>
                        </div>
                     </div>
                  </nav>
               </div>
               <a href="#" class="nav-link w-nav-link" data-ix="new-interaction">НОВОСТИ</a>
               <a href="#" class="nav-link w-nav-link">ПРАВИЛА</a>
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
      <div class="hero_bookmaker_section">
         <div class="hero_wrapper_bookmaker">
            <div class="hero_wrapper_block">
               <div id="w-node-6a514ac2de5f" class="title-and-image-block">
                  <div id="w-node-b77efebebee1" class="title_bookmaker_block">
                     <a href="${contextPath}/bookmakers" id="w-node-3a7defcb2b8b" class="button-5 w-button">Все букмекеры</a>
                     <a href="counter?id=${bookmaker.bookMakerId}" target="_blank" id="w-node-fe17e119559d" class="btn_bookmaker_black w-button">Перейти на сайт</a>
                     <h1 id="w-node-379fc290d712" class="title_text_bookmaker">${Bookmaker_H1}</h1>
                  </div>
               </div>
               <div id="w-node-e810e40df812" class="criteria_bookmaker">
                  <div id="w-node-e810e40df813" class="columns-3 w-row">
                     <div class="column-rating-settings w-col w-col-10 w-col-small-6 w-col-tiny-6">
                        <div class="criteria-rating-text">НАДЕЖНОСТЬ</div>
                        <div class="criteria-rating-progress">
                           <div class="criteria-rating-progress dynamic">
                           </div>
                        </div>
                     </div>
                     <div class="column-rating-settings _2 w-col w-col-2 w-col-small-6 w-col-tiny-6">
                     </div>
                  </div>
                  <div id="w-node-e810e40df81a" class="criteria_title">
                     <div id="w-node-e810e40df81b" class="criteria-text">Критерии</div>
                     <img src="${bookmaker.image}" width="80" height="26" id="w-node-e810e40df81d" alt="${bookmaker.name} logo" />
                  </div>
                  <div id="w-node-e810e40df81e" class="columns-3 w-row">
                     <div class="column-rating-settings w-col w-col-10 w-col-small-6 w-col-tiny-6">
                        <div class="criteria-rating-text">ЛИНИЯ</div>
                        <div class="criteria-rating-progress">
                           <div class="criteria-rating-progress dynamic">
                           </div>
                        </div>
                     </div>
                     <div class="column-rating-settings _2 w-col w-col-2 w-col-small-6 w-col-tiny-6">
                     </div>
                  </div>
                  <div id="w-node-e810e40df825" class="rating-numeral">
                     <div class="criteria-rating-text numeral">1</div>
                  </div>
                  <div id="w-node-e810e40df828" class="rating_general">
                     <div id="w-node-e810e40df829" class="rating-numeral">
                        <div class="criteria-rating-text numeral">2</div>
                     </div>
                     <div id="w-node-e810e40df82c" class="columns-3 w-row">
                        <div class="column-rating-settings w-col w-col-10 w-col-small-6 w-col-tiny-6">
                           <div class="criteria-rating-text">ОБЩИЙ РЕЙТИНГ</div>
                           <div class="criteria-rating-progress">
                              <div class="criteria-rating-progress dynamic">
                              </div>
                           </div>
                        </div>
                        <div class="column-rating-settings _2 w-col w-col-2 w-col-small-6 w-col-tiny-6">
                        </div>
                     </div>
                  </div>
                  <div id="w-node-e810e40df833" class="columns-3 w-row">
                     <div class="column-rating-settings w-col w-col-10 w-col-small-6 w-col-tiny-6">
                        <div class="criteria-rating-text">УДОБСТВО РАБОТЫ</div>
                        <div class="criteria-rating-progress">
                           <div class="criteria-rating-progress dynamic">
                           </div>
                        </div>
                     </div>
                     <div class="column-rating-settings _2 w-col w-col-2 w-col-small-6 w-col-tiny-6">
                     </div>
                  </div>
                  <div id="w-node-e810e40df83a" class="rating-numeral">
                     <div class="criteria-rating-text numeral">1</div>
                  </div>
                  <div id="w-node-e810e40df83d" class="rating-numeral">
                     <div class="criteria-rating-text numeral">1</div>
                  </div>
               </div>
            </div>
         </div>
         <div class="info_wrapper_bookmaker">
            <div class="grid_payment_systems">
               <div id="w-node-9ed10d2520ae" class="pay_system">
                  <div id="w-node-823784ea8906" class="div-block-15">
                     <div class="plus_title">Платежные системы</div>
                  </div>
                  <div id="w-node-bac945923cfa" class="pay_block">
                     <img src="/Static/bootstrap/img/payment/5bc4640c9f9d5c1d966f6d20_visa-pay-logo.png" width="40" id="w-node-e7e47dcf821c" alt="" />
                  </div>
                  <div id="w-node-7d0c2031493a" class="pay_block">
                     <img src="/Static/bootstrap/img/payment/5bc46409e46b0e7f10614215_1280px-Tele2_logo.png" width="40" id="w-node-268c7c864271" alt="" />
                  </div>
                  <div id="w-node-20f90d51e24f" class="pay_block">
                     <img src="/Static/bootstrap/img/payment/5bc46409e46b0e05ee614214_7a9b882584c6ea6ed1f48e96be00a187.png" id="w-node-46d0587608ac" alt="" />
                  </div>
                  <div id="w-node-cffa07fd678b" class="pay_block">
                     <img src="/Static/bootstrap/img/payment/5bc4640a3ef47f114e3ab362_Euroset.png" id="w-node-97e46a5ce032" alt="" />
                  </div>
                  <div id="w-node-8fa912777b49" class="pay_block">
                     <img src="/Static/bootstrap/img/payment/5bc4640c898dcecdb4be2c55_mastercard.png" width="40" alt="" />
                  </div>
                  <div id="w-node-d68fa1371ab9" class="pay_block">
                     <img src="/Static/bootstrap/img/payment/5bc464093ef47fd2463ab361_1280px-MegaFon_sign2Blogo_horiz_green_RU_(RGB).png" id="w-node-7ef68a6e1b57" alt="" />
                  </div>
                  <div id="w-node-81d207787533" class="pay_block">
                     <img src="/Static/bootstrap/img/payment/5bc4640ce46b0e116a614217_QIWI_Wallet_logotype_main(1).png" width="63" alt="" />
                  </div>
                  <div id="w-node-145cf5e1746d" class="pay_block">
                     <img src="/Static/bootstrap/img/payment/5bc46409ca643a59242f54a9_logo-moneta-ru.png" alt="" />
                  </div>
                  <div id="w-node-0887a2a1d769" class="pay_block">
                     <img src="/Static/bootstrap/img/payment/5bc4640a5a68ee7acd1bdaa2_1453722747_9.png" id="w-node-df5dd0b351e2" alt="" />
                  </div>
                  <div id="w-node-77bb716a2638" class="pay_block">
                     <img src="/Static/bootstrap/img/payment/5bc464095b2ebf6a8b5337ba_1280px-MTS_logo.png" width="40" id="w-node-9901db660480" alt="" />
                  </div>
                  <div id="w-node-6d79a4d78cb4" class="pay_block">
                     <img src="/Static/bootstrap/img/payment/5bc464099f9d5ca8426f6d1f_hui4bjgw.png" id="w-node-2e92901e68bb" alt="" />
                  </div>
               </div>
               <div id="w-node-6e4e2e1f6acc" class="pluses">
                  <div class="plus_title">Минусы</div>
                  ${bookmaker.minuses}
               </div>
               <div id="w-node-438b71409009" class="pluses">
                  <div class="plus_title">Плюсы</div>
                  ${bookmaker.pluses}                  
               </div>
            </div>
         </div>
         <div class="col_general_seo_text">
            <div class="w-row">
               <div class="col_seo_text w-col w-col-8 w-col-stack">
                  <div class="info_bookmakers">
                     <p id="w-node-fa4941ef8e01" class="seo_text">Букмекерская контора 1xBet основана в 2007 году и быстро стала одним из лидеров рынка. Ставки можно делать как на официальном сайте, так и в одном из пунктов приема, которых у компании более 600. В линии – соревнования по 20 видов спорта с интересной росписью, что делает тотализатор максимально привлекательным. Кроме этого предлагается поучаствовать в различных азартных играх – в онлайн режиме ведущие букмекера приглашают сделать свои ставки в покер, лото, кости.</p>
                     <h2 class="seo_h2_text">Что учитывают рейтинги букмекеров</h2>
                     <p class="seo_text">Букмекерская контора приняла в 2014 году решение отказаться от лицензирования на территории РФ. Компания использует лицензию правительства Кюрасао, что позволяет снизить налоговую нагрузку и отказаться от высокой маржи, что и привлекает беттеров. Несмотря на отсутствие лицензии 1xBet активно сотрудничает с ведущими футбольными клубами России.</p>
                     <div class="seo_bold_text">Среди основных преимуществ букмекерской конторы:</div>
                     <ul class="unordered-list-5">
                        <li class="list_item_text">профессиональная служба поддержки – вопросы можно задать по телефону, в онлайн чате или по электронной почте</li>
                     </ul>
                     <ul>
                        <li class="list_item_text">широкая линия с большим количеством событий</li>
                     </ul>
                     <ul>
                        <li class="list_item_text">ориентация на региональные лиги</li>
                     </ul>
                     <ul>
                        <li class="list_item_text">широкая и интересная роспись, предлагающая до 5000 разных пари</li>
                     </ul>
                     <ul>
                        <li class="list_item_text">информативный ресурс и наличие приложений для мобильных устройств</li>
                     </ul>
                     <ul>
                        <li class="list_item_text">широкий ассортимент способов пополнения депозита и вывода выигрыша</li>
                     </ul>
                     <ul>
                        <li class="list_item_text">бесплатные видеотрансляции</li>
                     </ul>
                     <ul>
                        <li class="list_item_text">интересные акции и солидные бонусы</li>
                     </ul>
                     <ul>
                        <li class="list_item_text">высокие коэффициенты благодаря небольшой марже компании</li>
                     </ul>
                     <p class="seo_text">Среди недостатков 1xBet – отсутствие лицензии. Это является причиной снижения позиций букмекерской конторы в некоторых профессиональных рейтингах. Отсутствие лицензии – повод для систематических блокировок официального сайта, но у игроков всегда есть возможность получить рабочую ссылку. Ресурс в интернете у 1xBet максимально функционален, поэтому может оказаться «тяжелым» для тех, у кого медленный интернет.</p>
                  </div>
               </div>
               <div class="col_comments w-col w-col-4 w-col-stack">
                  <div class="comments_block">
                     <div id="w-node-fa354157dd43" class="comment_title_text w-clearfix">
                        <div id="w-node-fa354157dd44" class="comments_text">Отзывы</div>
                        <a href="#" id="w-node-2c63d4830e96" class="button_all_comments w-button">Все отзывы</a>
                     </div>
                     <div id="w-node-fa354157dd46" class="leave_comments">
                        <div id="w-node-fa354157dd47" class="comments_form w-form">
                           <form id="email-form" name="email-form" data-name="Email Form" class="w-clearfix">
                              <label for="name" class="field-label">Оставить отзыв</label>
                              <input type="email" class="comments_name_field email w-input" maxlength="256" name="name" data-name="Name" placeholder="email" id="name" />
                              <input type="text" class="comments_name_field _1 w-input" maxlength="256" name="name-2" data-name="Name 2" placeholder="Ваша имя" id="name-2" required="" />
                              <textarea id="field" name="field" maxlength="5000" placeholder="Ваш текст" data-name="Field" class="comments_textarea w-input"></textarea>
                              <select id="field-2" name="field-2" class="comments_select w-select">
                                 <option value="">Ваш статус</option>
                                 <option value="First">Новичок</option>
                                 <option value="Second">Профи</option>
                                 <option value="Third">Балбес</option>
                                 <option value="Another Choice">Эксперт</option>
                                 <option value="Another Choice">Средний</option>
                              </select>
                              <input type="submit" value="Оставить отзыв" data-wait="Please wait..." class="button_comment w-button" />
                           </form>
                           <div class="w-form-done">
                              <div>Thank you! Your submission has been received!</div>
                           </div>
                           <div class="w-form-fail">
                              <div>Oops! Something went wrong while submitting the form.</div>
                           </div>
                        </div>
                     </div>
                     <div id="w-node-fa354157dd57" class="comments_wrapper">
                        <div id="w-node-fa354157dd58" class="user_comment_text">
                           <div id="w-node-fa354157dd59" class="comments_user_text">Сегодня в лайве поставил ставку на то что след гол забьет команда  Событие произошло, сначало выигрыш поступил на</div>
                        </div>
                        <a href="#" id="w-node-fa354157dd5b" class="link_open_more">Показать полностью</a>
                        <div id="w-node-fa354157dd5d" class="comments_avatar expert">
                           <div id="w-node-fa354157dd5e" class="comments_avatar_text">Н</div>
                        </div>
                        <div id="w-node-fa354157dd60" class="comments_user_name_block">
                           <div id="w-node-fa354157dd61" class="text-block-37">Нурбол Жайлаубаев</div>
                           <div class="comments_user_status expert">
                              <div class="commsents_user_status_text">Эксперт</div>
                           </div>
                        </div>
                     </div>
                     <div id="w-node-fa354157dd66" class="comments_wrapper">
                        <div id="w-node-fa354157dd67" class="user_comment_text">
                           <div id="w-node-fa354157dd68" class="comments_user_text">Сегодня в лайве поставил ставку на то что след гол забьет команда  Событие произошло, сначало выигрыш поступил на</div>
                        </div>
                        <a href="#" id="w-node-fa354157dd6a" class="link_open_more">Показать полностью</a>
                        <div id="w-node-fa354157dd6c" class="comments_avatar">
                           <div id="w-node-fa354157dd6d" class="comments_avatar_text">Н</div>
                        </div>
                        <div id="w-node-fa354157dd6f" class="comments_user_name_block">
                           <div id="w-node-fa354157dd70" class="text-block-37">Нурбол Жайлаубаев</div>
                           <div class="comments_user_status">
                              <div class="commsents_user_status_text">Новичок</div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="footer-section">
         <div class="footer-block">
            <div class="w-row">
               <div class="column-3 w-col w-col-4">
                  <div class="footer-links">
                     <h4 class="heading-7">Меню</h4>
                     <div class="text-block-23">Букмекеры</div>
                     <div class="text-block-23">Ставка на спорт</div>
                     <div class="text-block-23">Прогнозы</div>
                     <div class="text-block-23">Новости</div>
                     <div class="text-block-23">Правила</div>
                  </div>
               </div>
               <div class="column-4 w-col w-col-4">
                  <div class="footer-links">
                     <h4 class="heading-7">Ставки на спорт</h4>
                     <div class="text-block-23">Чемпионаты</div>
                     <div class="text-block-23">Экспрессы</div>
                     <div class="text-block-23">Одиночные прогнозы</div>
                  </div>
               </div>
               <div class="column-5 w-col w-col-4">
                  <div class="footer-links">
                     <h4 class="heading-7">Информация</h4>
                     <div class="text-block-23">Сравнение букмекеров</div>
                     <div class="text-block-23">Новости спорта</div>
                     <div class="text-block-23">Вопросы-ответы</div>
                     <div class="logo-fooer">
                        <div class="w-row">
                           <div class="w-col w-col-6 w-col-medium-6 w-col-small-6 w-col-tiny-6">
                              <h3 class="heading-8">FindBestBet.ru</h3>
                           </div>
                           <div class="w-col w-col-6 w-col-medium-6 w-col-small-6 w-col-tiny-6">
                              <div class="text-block-24">Ставки на спорт</div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
      <script src="/Static/bootstrap/js/script.js" type="text/javascript"></script>
      <!--[if lte IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
      <script type="text/javascript" src="/Static/bootstrap/js/mail.js"></script>
      <script type="text/javascript">$(document).ready(function(){$('[href*="brandjs"]').attr('style', 'display:none !important');$('a[href="'+window.location.href+'"]').addClass('w--current');});</script>      
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="/Static/bootstrap/js/bootstrap.js"></script>    
   </body>
</html>