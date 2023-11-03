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
	<h1>hi</h1>
	<c:forEach var="attJoin" items="${attJoinList }">
		<h1>${attJoin.m_num }</h1>
		<h1>${attJoin.a_par_pdate }</h1>
		
	</c:forEach>
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>