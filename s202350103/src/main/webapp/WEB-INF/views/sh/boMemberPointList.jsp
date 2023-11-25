<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	function plusPoint(){
		var point = $('#point').val();
		if (point>0){
			if(confirm(point+"만큼 추가하시겠습니까?")){
				alert(point + "포인트 추가 하셨습니다.");
				location.href="boPlusPoint?m_num="+${m_num}+"&point="+point;
			} else {
				alert("포인트 추가를 취소하셨습니다.");
				return false;
			}
		} else
			alert("숫자를 입력해주세요.");
			return false;
	}
	
	function minusPoint(){
		var point = $('#point').val();
		var sum = ${sum};
		//alert("sum->"+sum);
		if(sum >= point){
			if(point>0){
				if(confirm(point+"만큼 차감하시겠습니까?")){
					alert(point + "포인트 차감 하셨습니다.");
					location.href="boMinusPoint?m_num="+${m_num}+"&point="+point;
				}else{
					alert("포인트 차감을 취소하셨습니다.");
					return false;
				}
			} else {
				alert("숫자를 입력해주세요.");
				return false;
			}
		}else{
			alert("보유한 포인트가 부족합니다.");
			return false
		}
	}
</script>
<style type="text/css">
	table{
		width: 80%;
	}
	
	h2{
		text-align: center;
	}
</style>
</head>
<body>
<p class="fs-1 text-center">회원 포인트 리스트</p>
<p>
<div style="margin: 0 15% 0 15%;">
	<label class="" style="margin-right:30px; ; float: right;"> 총합 : ${sum} 포인트</label>
<table class="table" style="text-align: center">
	<thead class="table-light">
		<tr>
			<th scope="col">번호</th>
			<th scope="col">포인트번호</th>
			<th scope="col">회원번호</th>
			<th scope="col">발행페이지 코드</th>
			<th scope="col">발행일시</th>
			<th scope="col">포인트유형</th>
			<th scope="col">지급포인트</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="memberPoint" items="${memberPoint }">
			<tr>
				<th scope="row">${memberPoint.rn }</th>
				<td>${memberPoint.p_num }</td>
				<td>${memberPoint.m_num }</td>
				<td>
				<c:choose>
					<c:when test="${memberPoint.o_order_num != 0}"> ${memberPoint.o_order_num}</c:when>
					<c:when test="${memberPoint.q_num != 0}">${memberPoint.q_num}</c:when>
					<c:when test="${memberPoint.a_num != 0}">${memberPoint.a_num}</c:when>
					<c:otherwise>00000</c:otherwise>
				</c:choose>
				</td>
				<td>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${memberPoint.a_par_pdate }"/>
				</td>
				<td>${memberPoint.p_list_type }</td>
				<td>${memberPoint.m_point }</td>		
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
	 	<c:if test="${page.startPage > page.pageBlock }">
			 <li class="page-item justify-content-center">					
				<a class="page-link mx-1 text-body"  href="selectMemberPoint?currentPage=${page.startPge-page.pageBlocck }">이전</a>
			</li>
		</c:if>
			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
			 <li class="page-item justify-content-center">
					<a class="page-link mx-1 text-body"  href="selectMemberPoint?currentPage=${i }">${i}</a>
			</li>
		</c:forEach>
			
			<c:if test="${page.endPage < page.totalPage }">
			 <li class="page-item justify-content-center">		 
				<a class="page-link mx-1 text-body"href="selectMemberPoint?currentPage=${page.startPage+page.pageBlock }">다음</a>
			</li>
		</c:if>
	</ul>
</nav>
<br>
<hr>
<br>
	<div style="margin-left: 30%; margin-right: 30%; text-align: center;">
		<h2>포인트 수정</h2>
		<table class="table text-nowrap">
    			<tr class="table-light">
    				<th>회원 아이디</th>
    			</tr>
    			<tr>
    				<td>${member.m_id}</td>
    			</tr>
    			<tr class="table-light">
    				<th>회원 이름</th>
    			</tr>
    			<tr>
    				<td>${member.m_name}</td>
    			</tr>
    			<tr class="table-light">
             		<td><input type="text"  id="point" placeholder="포인트를 입력하세요" style="width: 150px; border:none;" >point<p></td>
            	</tr>	
            	<tr>	
            		<td><button type="button" class="btn btn-ghost-primary mb-2" onclick="plusPoint()">추가하기 </button>
            			<button type="button" class="btn btn-ghost-danger mb-2"  onclick="minusPoint()">차감하기</button></td>
          		</tr>
    	</table>
	</div>
</body>
</html>