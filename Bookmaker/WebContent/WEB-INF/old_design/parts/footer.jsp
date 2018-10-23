<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="footer" class="container">	
   <div class="icons">Icons designed by <a rel="nofollow" target="_blank" href="http://www.freepik.com" title="Freepik">Freepik</a> from <a rel="nofollow" target="_blank" href="https://www.flaticon.com/" title="Flaticon">Flaticon</a></div>
   <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
         <a href="${contextPath}/bookmakers" class="Alogo"><img class="BMAminiLogo" src="/Static/bootstrap/img/BMAlogo.png" alt="BestBet"></a>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">         
         <ul class="footerMenu">   
            <li class="menuName">Ставки на спорт</li>            
            <li><a href="${contextPath}/competishions">Чемпионаты</a></li>
            <li><a href="${contextPath}/expresses_list_0">Экспрессы</a></li>
            <li><a href="${contextPath}/events_list">Одиночные прогнозы</a></li>
         </ul>                  
      </div>
      <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
      	<ul class="footerMenu">            
            <li class="menuName">Информация</li>            
            <li><a href="${contextPath}/bookmakers">Сравнение букмекеров</a></li>
            <li><a href="${contextPath}/news_0">Новости спорта</a></li>
            <li><a href="${contextPath}/faq_list">Вопросы - ответы</a></li>
         </ul>
      </div>
   </div>      
</div>
<!--noindex-->
<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter45605802 = new Ya.Metrika({
                    id:45605802,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
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
<!-- /Google Analytics -->
<!--/noindex-->



