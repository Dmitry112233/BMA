<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="newsBlock" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">   
   <br>
   	<a class="BackButton" href="News.spr"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Другие новости</a>
   <br><br>
   <div class="newsComp">
   	<p>${news.sport}<br>${news.competition}</p>
   </div>
   <h3>${news.title}</h3>
   <p>${news.description}</p>
   <img class="newsPic" src="${news.image}" alt="${news.sport} ${news.competition} новости"></img>
</div>