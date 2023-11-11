<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:choose>
	<c:when test="${result == 1 }">
		선물 성공
	</c:when>
	<c:otherwise>
		선물 실패
	</c:otherwise>
</c:choose>

<%@ include file="../common/footerFo.jsp" %>
</body>
</html>