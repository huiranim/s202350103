<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<table border="1">
	<h1 colspan="7">${month}월 출석 이벤트</h1>
	<tr>
		<c:forEach var="dayOfWeek" begin="1" end="7">
	    		<c:choose>
			        <c:when test="${dayOfWeek eq 1}">일요일</c:when>
			        <c:when test="${dayOfWeek eq 2}">월요일</c:when>
			        <c:when test="${dayOfWeek eq 3}">화요일</c:when>
			        <c:when test="${dayOfWeek eq 4}">수요일</c:when>
			        <c:when test="${dayOfWeek eq 5}">목요일</c:when>
			        <c:when test="${dayOfWeek eq 6}">금요일</c:when>
			        <c:when test="${dayOfWeek eq 7}">토요일</c:when>
			    </c:choose>
		</c:forEach>
	</tr>
	<c:forEach var="i" begin="1" end="${lastday}" step="1">
		<td border="1">
			<span>${i }</span>
			<div class="calDate" >
				hi
			</div>
		</td>
		<c:if test="${dayOfWeek} % 7 == 0">
			</tr><tr>
		</c:if>
	</c:forEach>
</table>	


	<h1>hi</h1>
	<c:forEach var="attJoin" items="${attJoin }">
		<p>${attJoin.a_num }</p>
		<p>${attJoin.a_par_pdate }</p>
		<p>${attJoin.m_num }</p><br>	
	</c:forEach>
			
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>