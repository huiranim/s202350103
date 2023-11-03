<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> ORDER FORM</h1>
	
	<form action="order" method="post">
		<table>
			<tr>
				<th>주문자</th>
				<td><input type="text" name="m_name" value="${member.m_name}">${member.m_name}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="m_email" value="${member.m_email}">${member.m_email}</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td><input type="text" name="m_ph" value="${member.m_ph}">${member.m_ph}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="m_ph" value="${member.m_ph}">${member.m_ph}</td>
			</tr>
			
			<tr>
				<th colspan="2"><input type="submit" value="결제하기"></th>
			</tr>
		</table>
	</form>

<%@ include file="../common/footerFo.jsp" %>

</body>
</html>