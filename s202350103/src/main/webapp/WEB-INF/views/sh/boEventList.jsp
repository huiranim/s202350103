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
<div class="table-responsive">
<table class="table">
  <thead class="table-light">
    <tr>
      <th scope="col">번호</th>
      <th scope="col">이벤트 번호</th>
      <th scope="col">제목</th>
      <th scope="col">시작일</th>
      <th scope="col">종료일</th>
      <th scope="col">포인트</th>
      <th scope="col">연속출석</th>
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
			<td><input type="button" value="상세정보" onclick="openPopUp(${event.a_num })"></td>
		</tr>
	</c:forEach>
  </tbody>
</table>
</div>
	<div class="btn-group">
		<span id="btn-back">
			<c:if test="${page.startPage > page.pageBlock }">
				<a href="boEventList?currentPage=${page.startPge-page.pageBlocck }">[이전]</a>
			</c:if>
		</span>	
		<span class="btn-page">	
			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
				<a href="boEventList?currentPage=${i }">[${i }]</a>
			</c:forEach>
		</span>
		<span class="btn-go">	
			<c:if test="${page.endPage < page.totalPage }">
				<a href="boEventList?currentPage=${page.startPage+page.pageBlock }">[다음]</a>
			</c:if>
		</span>
	</div>
<script type="text/javascript">
	function openPopUp(eNum){
		window.open("boEventDetail?eNum="+eNum,"width=300,height=300");
	}
</script>

</body>
</html>