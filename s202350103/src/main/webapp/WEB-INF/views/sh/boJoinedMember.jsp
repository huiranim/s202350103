<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/none.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="assets/js/jquery.js"></script>
</head>
<body>
<p style="float: right; margin-right: 30px;">총 참여 인원 : ${joinedCount}</p>
<table class="table" style="text-align: center; margin: auto;">
	<thead class="table-light">
		<th>번호</th>
		<th>적립번호</th>
		<th>회원번호</th>
		<th>획득일자</th>
		<th>이벤트 유형</th>
		<th>포인트</th>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${joinedCount != 0 }">
			<c:forEach var="pl" items="${pointList}">
				<tr>
					<th scope="row">${pl.rn}</th>	
					<td>${pl.p_num}</td>
					<td>${pl.m_num}</td>
					<td><fmt:formatDate value="${pl.a_par_pdate}" pattern="yy-MM-dd"/></td>
					<td>${pl.p_list_type}</td>
					<td>${pl.m_point}</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="6">참여한 회원이 존재하지 않습니다.<td>
			</tr>
		</c:otherwise>
	</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="6"><button id="closeButton">닫기</button></td>
		</tr>
	</tfoot>
</table>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
	 	<c:if test="${page.startPage > page.pageBlock }">
			 <li class="page-item justify-content-center">					
				<a class="page-link mx-1 text-body"  href="boJoinedMember?currentPage=${page.startPge-page.pageBlocck }">이전</a>
			</li>
		</c:if>
			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
			 <li class="page-item justify-content-center">
					<a class="page-link mx-1 text-body"  href="boJoinedMember?currentPage=${i }&m_num=${memberPoint.m_num }">${i}</a>
			</li>
		</c:forEach>
			
			<c:if test="${page.endPage < page.totalPage }">
			 <li class="page-item justify-content-center">		 
				<a class="page-link mx-1 text-body"href="boJoinedMember?currentPage=${page.startPage+page.pageBlock }">다음</a>
			</li>
		</c:if>
	</ul>
</nav>	
<script type="text/javascript">
	var closeButton = document.getElementById("closeButton");
	closeButton.addEventListener('click',function(){
		window.close();
	});
</script>
</body>
</html>