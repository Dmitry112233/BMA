<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="CeffSource" items="${RowListName}">
   <tr onclick="window.open('Counter?id=${CeffSource.bookmakerBean.bookMakerId}', '_blank'); return false;">
      <td class="CoeffCompareTableBM">
         <a rel="nofollow" href="Counter?id=${CeffSource.bookmakerBean.bookMakerId}" target="_blank">
         <img src="${CeffSource.bookmakerBean.image}" alt="${CeffSource.bookmakerBean.name} logo">
         </a>
      </td>
      <td>
         <c:choose>
            <c:when test="${CeffSource.win1 > 0}">${CeffSource.win1}</c:when>
            <c:otherwise>-</c:otherwise>
         </c:choose>
      </td>
      <td>
         <c:choose>
            <c:when test="${CeffSource.x > 0}">${CeffSource.x}</c:when>
            <c:otherwise>-</c:otherwise>
         </c:choose>
      </td>
      <td>
         <c:choose>
            <c:when test="${CeffSource.win2 > 0}">${CeffSource.win2}</c:when>
            <c:otherwise>-</c:otherwise>
         </c:choose>
      </td>
      <td>
         <c:choose>
            <c:when test="${CeffSource.x1 > 0}">${CeffSource.x1}</c:when>
            <c:otherwise>-</c:otherwise>
         </c:choose>
      </td>
      <td>
         <c:choose>
            <c:when test="${CeffSource.x12 > 0}">${CeffSource.x12}</c:when>
            <c:otherwise>-</c:otherwise>
         </c:choose>
      </td>
      <td>
         <c:choose>
            <c:when test="${CeffSource.x2 > 0}">${CeffSource.x2}</c:when>
            <c:otherwise>-</c:otherwise>
         </c:choose>
      </td>
      <td class="CoeffCompareTableSecondary">
         <c:choose>
            <c:when test="${CeffSource.moreTotal > 0}">${CeffSource.moreTotal}</c:when>
            <c:otherwise>-</c:otherwise>
         </c:choose>
      </td>
      <td class="CoeffCompareTableSecondary">
         <c:choose>
            <c:when test="${CeffSource.total > 0}">${CeffSource.total}</c:when>
            <c:otherwise>-</c:otherwise>
         </c:choose>
      </td>
      <td class="CoeffCompareTableSecondary">
         <c:choose>
            <c:when test="${CeffSource.lessTotal > 0}">${CeffSource.lessTotal}</c:when>
            <c:otherwise>-</c:otherwise>
         </c:choose>
      </td>
      <td class="CoeffCompareTableSecondary">
         <c:choose>
            <c:when test="${CeffSource.hand1 > 0}">${CeffSource.hand1}</c:when>
            <c:otherwise>-</c:otherwise>
         </c:choose>
      </td>
      <td class="CoeffCompareTableSecondary">
         <c:choose>
            <c:when test="${CeffSource.hand != null}">${CeffSource.hand}</c:when>
            <c:otherwise>-</c:otherwise>
         </c:choose>
      </td>
      <td class="CoeffCompareTableSecondary">
         <c:choose>
            <c:when test="${CeffSource.hand2 > 0}">${CeffSource.hand2}</c:when>
            <c:otherwise>-</c:otherwise>
         </c:choose>
      </td>
      <td class="CoeffCompareTableSecondary2"><a class="detailToBKButton" rel="nofollow" href="Counter?id=${CeffSource.bookmakerBean.bookMakerId}" target="_blank">На сайт</a></td>
   </tr>
</c:forEach>