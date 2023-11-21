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
<style>
	h1{
		text-align: center;
	}

	.btn-group {
    display: flex;
    justify-content: center;
	

	.btn-back, .btn-page, .btn-go {
    text-align: center;
	}
</style>
<body>
<h1>이벤트 목록</h1>
<p>
<div class="tab	le-responsive" >
<table class="table" style="text-align: center;">
  <thead class="table-light">
    <tr>
      <th scope="col">번호</th>
      <th scope="col">이벤트 번호</th>
      <th scope="col">제목</th>
      <th scope="col">시작일</th>
      <th scope="col">종료일</th>
      <th scope="col">포인트</th>
      <th scope="col">이벤트 유형</th>
      <th scope="col">관리</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="event" items="${event }">
		<tr>
			<th scope="row">${event.rn }</th>
			<td>${event.a_num }	 </td>
			<td>${event.a_title }</td>
			<td>${event.a_sdate }</td>
			<td>${event.a_edate }</td>
			<td>${event.a_point }</td>
			<td>${event.a_add }</td>
			<td><input type="button" class="btn btn-soft-primary mb-2" value="수정" onclick="openPopUp(${event.a_num})">  <input type="button" class="btn btn-soft-success mb-2" value="조회" onclick="openDetail(${event.a_num})"> </td>
		</tr>
	</c:forEach>
  </tbody>
</table>
</div>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
	 	<c:if test="${page.startPage > page.pageBlock }">
			 <li class="page-item justify-content-center">					
				<a class="page-link mx-1 text-body"  href="boEventList?currentPage=${page.startPge-page.pageBlocck }">이전</a>
			</li>
		</c:if>
			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
			 <li class="page-item justify-content-center">
					<a class="page-link mx-1 text-body"  href="boEventList?currentPage=${i }">${i}</a>
			</li>
		</c:forEach>
			
			<c:if test="${page.endPage < page.totalPage }">
			 <li class="page-item justify-content-center">		 
				<a class="page-link mx-1 text-body"href="boEventList?currentPage=${page.startPage+page.pageBlock }">다음</a>
			</li>
		</c:if>
	</ul>
</nav>
<script type="text/javascript">
	function openPopUp(eNum){
		window.open("boEventDetail?eNum="+eNum,"eventUpdate","width=500,height=700");
	}
	
	function openDetail(eNum){
		window.open("boJoinedMember?eNum="+eNum,"이벤트 상세조회","width=800,height=600");
	}
</script>

</body>
</html>