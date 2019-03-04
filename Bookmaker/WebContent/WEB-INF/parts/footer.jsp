<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="footer-section">
   <div class="footer-block">
      <div class="w-row">
         <div class="column-3 w-col w-col-4">
            <c:if test = "${linkMap.size() > 0}">
            <div class="footer-links">
               <p class="heading-7">Страницы</p>
               <c:forEach var="links" items="${linkMap}">
                  <div><a class="myFooterLink" href="${contextPath}/${links.value}">${links.key}</a></div>
               </c:forEach>
            </div>            	
            </c:if>
            <c:if test = "${linkMap.size() == Null}">
            	<div class="footer-links">
               <p class="heading-7">Чемпионаты</p>
               <div><a class="myFooterLink" href="${contextPath}/${'российская премьер лига'}_матчи">Российская Премьер-Лига</a></div>
               <div><a class="myFooterLink" href="${contextPath}/${'английская премьер лига'}_матчи">Английская Премьер-лига</a></div>
               <div><a class="myFooterLink" href="${contextPath}/${'испанская ла лига'}_матчи">Испанская ЛаЛига</a></div>
               <div><a class="myFooterLink" href="${contextPath}/${'итальянская серия а'}_матчи">Итальянская Серия А</a></div>
               <div><a class="myFooterLink" href="${contextPath}/${'немецкая бундеслига'}_матчи">Немецкая Бундеслига</a></div>
            </div>
            </c:if>            
         </div>
         <div class="column-4 w-col w-col-4">
            <div class="footer-links">
               <p class="heading-7">Меню</p>
               <div><a class="myFooterLink" href="${contextPath}/">Букмекеры</a></div>
               <div><a class="myFooterLink" href="${contextPath}/news_0">Новости</a></div>
               <div><a class="myFooterLink" href="${contextPath}/faq_list">Популярные вопросы</a></div>
            </div>
         </div>
         <div class="column-5 w-col w-col-4">
            <div class="footer-links">
               <p class="heading-7">Ставки на спорт</p>
               <div><a class="myFooterLink" href="${contextPath}/competitions">Чемпионаты</a></div>
               <div><a class="myFooterLink" href="${contextPath}/expresses_list_0">Экспрессы</a></div>
               <div><a class="myFooterLink" href="${contextPath}/events_list">Ординары</a></div>
               <div class="logo-fooer">
                  <div class="w-row">
                     <div class="w-col w-col-6 w-col-medium-6 w-col-small-6 w-col-tiny-6">
                        <p class="heading-8">5bets.ru</p>
                     </div>
                     <div class="w-col w-col-6 w-col-medium-6 w-col-small-6 w-col-tiny-6">
                        <div class="text-block-24">Ставки<br>на спорт</div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<!--noindex-->
<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
   (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
   m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
   (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

   ym(45605802, "init", {
        id:45605802,
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true,
        webvisor:true
   });
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/45605802" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
<!--/noindex-->
<!--noindex-->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-108802252-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-108802252-1');
</script>
<!--/noindex-->