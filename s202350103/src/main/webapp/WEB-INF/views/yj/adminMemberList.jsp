<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h4>회원 : ${totalMember }</h4>

	<c:set var="num" value="${page.total-page.start+1 }"></c:set>

	<table>
		<tr>
			<th>No.</th>
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
			<td>${num }</td>
			<td>${member.m_num }</td>
			<td><fmt:formatDate value="${member.m_date }" pattern="yyyy-MM-dd" /></td>
			<td>${member.m_id }</td>
			<td>${member.m_name }</td>
			<td>${member.m_ph }</td>
			<td>${member.m_addr }</td>
			<td>${member.m_email }</td>
			<td>${member.m_birth }</td>
			<td>${member.m_point }</td>
			<td>${member.m_wd }</td>
		</tr>
			<c:set var="num" value="${num-1 }"></c:set>

		</c:forEach>

	</table><p></p>
	

	 <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">

			 	<c:if test="${page.startPage > page.pageBlock }">
					 <li class="pagination justify-content-center">					
						<a class="page-link" href="adminMemberList?currentPage=${page.startPage-page.pageBlock}">이전</a>
					</li>
				</c:if>
 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					 <li class="pagination justify-content-center">
 						<a class="page-link" href="adminMemberList?currentPage=${i}">${i}</a>&nbsp;&nbsp;
					</li>
				</c:forEach>
					
				<c:if test="${page.endPage < page.totalPage }">
					 <li class="pagination justify-content-center">		 
						<a class="page-link" href="adminMemberList?currentPage=${page.startPage+page.pageBlock}">다음</a>
					</li>
				</c:if>
		</ul>
	</nav>

</body>
</html>