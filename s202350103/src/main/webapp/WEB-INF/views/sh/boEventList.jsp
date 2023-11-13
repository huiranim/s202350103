<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	function openPopUp(eNum){
		alert(eNum);
		window.open("boEventDetail?eNum="+eNum,"width=300,height=300");
	}
</script>
<body>
<h1>이벤트 목록</h1>
<table>
	<tr>
		<th>번호</th><th>이벤트 번호</th><th>제목</th><th>시작일</th><th>종료일</th><th>포인트</th><th>연속출석</th><th>관리</th>
	</tr>
		<c:forEach var="event" items="${event }">
			<tr>
				<td>${event.rn }	 </td>
				<td>${event.a_num }	 </td>
				<td>${event.a_title }</td>
				<td>${event.a_sdate }</td>
				<td>${event.a_edate }</td>
				<td>${event.a_point }</td>
				<td>${event.a_add }</td>
				<td><input type="button" value="상세정보" onclick="openPopUp(${event.a_num })"></td>
			</tr>
		</c:forEach>
</table>
</body>
</html>