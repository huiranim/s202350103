<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table>
			<tr>
			<th>회원번호</th>
			<th>가입일</th>	
			<th>아이디</th>	
			<th>이름</th>	
			<th>연락처</th>	
			<th>주소</th>	
			<th>이메일</th>	
			<th>생년월일</th>	
			<th>보유포인트</th>	
			<th>탈퇴여부</th>
			</tr>

		<c:forEach items="${adminMemberList }" var="member">
			
			<tr>
			<td>${member.m_num }</td>	
			<td><fmt:formatDate value="${member.m_date }" pattern="yyyy-MM-dd"/></td>		
			<td>${member.m_id }</td>	
			<td>${member.m_name }</td>
			<td>${member.m_ph }</td>
			<td>${member.m_addr }</td>	
			<td>${member.m_email }</td>		
			<td>${member.m_birth }</td>		
			<td>${member.m_point }</td>	
			<td>${member.m_wd }</td>
			</tr>		
		
		</c:forEach>

		</table>

</body>
</html>