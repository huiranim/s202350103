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
	<table>
	<thead>
		<tr>
			<c:forEach var="day" items="${weekDay }">
				<td>${day }</td>
			</c:forEach>
		</tr>
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