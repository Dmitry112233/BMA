<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="dayexp" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
   <h2>Экспресс дня</h2>
   <!-- вывод одного экспресса дня -->      
   <h3>${myExpress.name}</h3>
   <table border="1" class="dayexptable">
      <!-- переменная для увеличивающегося номера строки в таблице с эвентами -->
      <c:set var="tableRow" value="0"/>
      <c:forEach var="ivent" items="${myExpress.iventList}">
      <tr>
         <td align="center"><c:out value="${tableRow=tableRow+1}" /></td>
         <td>&nbsp;${ivent.competition}</td>
         <td>&nbsp;${ivent.name}</td>
         <td width="15%" align="center">${ivent.bet}</td>
         <td width="15%" align="center">1.33</td>
      </tr>
      </c:forEach>
   </table>
   <br>
   <p>Итоговый коэф: !!!!как это рассчитать?!!!</p>
   <p>Начало события: ${myExpress.date}</p>
   <br>
   <p>описание события, пока нет инфы на беке</p>
</div>