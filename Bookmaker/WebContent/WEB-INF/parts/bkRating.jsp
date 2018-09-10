<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="bkReitBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <div class="bkReit">
      <br><br>
      <!-- переменная для вывода полоски над каждым описанием букмекера, кроме первого -->
      <c:set var="separatorBk" value="false" />
      <!-- вывод описаний букмекеров в цикле -->
      <table class="bkReitTable">
         <c:forEach var="bookmaker" items="${bookmakerList.values()}">
            <tr>
               <td colspan="3">
                  <c:if test="${separatorBk != false}">
                     <hr>
                  </c:if>
                  <c:set var="separatorBk" value="true" />
               </td>
            </tr>
            <tr class="bkReitTableMainRow">
               <td width="26%" align="right"><a rel="nofollow" href="Counter?id=${bookmaker.bookMakerId}" target="_blank"><img class="bmReitLogo" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a></td>
               <td width="24%"><a class="toBkDescrPage" href="${contextPath}/Bookmaker_${bookmaker.bookMakerId}"><span class="toDescrMain">Описание букмекера</span><span class="toDescrSecondary">Описание</span></a></td>
               <td width="50%"><a class="bkReitLink" rel="nofollow" target="_blank" href="Counter?id=${bookmaker.bookMakerId}"><span class="toBKMain">Регистрация на сайте ${bookmaker.name}</span><span class="toBKSecondary">Регистрация</span></a></td>
            </tr>
            <tr class="bkReitTableSecondaryRow">
               <td colspan="3"><a rel="nofollow" href="Counter?id=${bookmaker.bookMakerId}" target="_blank"><img class="bmReitLogo" src="${bookmaker.image}" alt="${bookmaker.name} logo"></a></td>
            </tr>
            <tr class="bkReitTableSecondaryRow">               
               <td colspan="3"><a class="toBkDescrPage" href="${contextPath}/Bookmaker_${bookmaker.bookMakerId}">Описание букмекера</a></td>               
            </tr>
            <tr class="bkReitTableSecondaryRow">               
               <td colspan="3"><a class="bkReitLink" rel="nofollow" target="_blank" href="Counter?id=${bookmaker.bookMakerId}">Регистрация на сайте ${bookmaker.name}</a></td>
            </tr>
            <tr>
            	<td colspan="3">            	
	            	<br>
	            	<h4>Бонусы:</h4>
	            	<p>${bookmaker.bonus}</p>  
	            	<br>          	
            	</td>            
            </tr>
            <tr>
               <td colspan="3">
                  <h4>Общий рейтинг</h4>
                  <div class="progressBar">
                     <div class="progressBarDone"><p>${bookmaker.result}</p></div>
                  </div>
               </td>
           </tr>                        
         </c:forEach>
      </table>
      <br><br>
      	<div class="article">
      		<p>Сделать ставку на различные виды спорта можно в десятках букмекерских контор. Многие из них приглашают к игре на своих официальных сайтах, где предоставлена не только аналитическая информация. Пользователи могут познакомиться с деятельностью компании, изучить о ней отзывы, зарегистрироваться в личном кабинете и воспользоваться службой поддержке. Как среди многочисленных предложений выбрать надежного букмекера? Для этого существуют экспертные рейтинги. Они составляются специализированными компания или крупными спортивными порталами.</p>
      		<h2>Что учитывают рейтинги букмекеров</h2>
      		<p>Критерии при составлении рейтинга могут быть разными, но чаще всего анализируют следующие параметры:</p>
      		<ul>
      			<li>вариативность ставок</li>
      			<li>уровень коэффициентов</li>
      			<li>удобство пользования официальным сайтом</li>
      			<li>наличие онлайн-поддержки и качество ее работы</li>
      			<li>надежность</li>
      			<li>санкции против игроков</li>
      			<li>удобство пополнения и оперативность вывода средств</li>
      		</ul>
      		<p>Для попадания в ТОП букмекер обязательно должен обладать лицензию и иметь продолжительную историю. Так, высшие позиции занимают компании, работающие на рынке не менее 5 лет.</p>
      		<p>Чем больше доматчевых и лайв ставок, чем шире роспись, тем серьезнее букмекерская контора. У лидеров чартов обязательно есть официальные сайты с эффективной службой поддержки, сотрудники которой должны корректно общаться с игроками и оперативно отвечать на тематические вопросы. Служба поддержки должна руководствоваться правилами букмекера, напоминать их игрокам, выдавать только точную информацию. Санкции против игроков допускаются, но они обязательно должны быть обоснованными. Учитывается при составлении рейтингов и величина бонусов, простота их получения и использования.</p>
      		<h2>Как меняется рейтинг букмекеров</h2>     
      		<p>Вернуться в ТОП рейтинга может даже та контора, которая угодила в черный список. Для этого она должна выполнить все правила составителей рейтинга, закрыть все жалобы. Понижение позиций возможно при наличии обоснованных жалоб, которые остались без ответа. Увеличение сроков по выплатам выигрышей и необоснованные блокировки игроков так же ведут к снижению рейтинга. Важную роль играют отзывы, но они обязательно должны детально и внимательно рассматриваться для исключения заказных реакций. В итоге – чем меньше риск игрока, чем комфортнее ему на официальном сайте букмекера, тем выше контора в ТОПе.</p> 		
      	</div>
      <br>
   </div>
   <p>${Bookmakers_T}/${Bookmakers_H1}/${Bookmakers_D}</p>
</div>