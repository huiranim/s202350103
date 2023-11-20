<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<thead>
		<th>번호</th><th>이벤트번호</th><th>회원번호</th><th>이벤트 번호</th><th>획득일자</th><th>이벤트 유형</th><th>획득 포인트</th>
	</thead>
	<tbody>
		<c:forEach var="pl" items="${pointList }">
		<tr>
			<td>${pl.rn}</td>	
			<td>${pl.p_num}</td>
			<td>${pl.m_num}</td>
			<c:choose>
				<c:when test="${pl.a_num!=0}">
					<td>${pl.a_num}</td>
				</c:when>
				<c:otherwise>
					<td>${pl.q_num}</td>
				</c:otherwise>
			</c:choose>
			<td>${pl.a_par_pdate}</td>
			<td>${pl.p_list_type}</td>
			<td>${pl.m_point}</td>
		</tr>
		</c:forEach>
	</tbody>

</table>
</body>
</html>