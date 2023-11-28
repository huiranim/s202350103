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
	function checkDetail(){
		var date = $('input[name=date]').val();
		var status = $('input[name=status]:checked').val();
		// 체크박스가 체크되었을 때 실행
		if($('input[name=date]').is(':checked')){
			$.ajax({
				url:"boSearchDetail1",
				data:{status:status},
				dataType: "json",  
				success: function(response){
					console.log("성공");
				},
				error : function(){
					console.log("실패");
				}
			});
		} else{
			var sdate = $('input[name=e_sdate]').val();
			var edate = $('input[name=e_edate]').val();
			var curDate = new Date();
			var curDate1 = curDate.getFullYear() +"-"+(curDate.getMonth()+1)+"-"+curDate.getDate();
			if(new Date(sdate) > new Date(edate)){
				alert("이벤트 기간 설정을 잘 못 하셨습니다.");
				return false;
			} else {
				location.href='searchDetail'
			}
		}
	}
</script>

<style>
	table{
		text-align: center; 
		margin: auto;
	}

	.btn-group {
    display: flex;
    justify-content: center;
	}

	.btn-back, .btn-page, .btn-go {
    text-align: center;
	}
</style>
<body>
<form action="javascript:void(0);">
<table class="table" style="float: left; width: 40%;">
	<tr>
		<th scope="row">이벤트</th>
	</tr>
	<tr>
		<th scope="row">이벤트 기간 :</th> 
		<td><input type="checkbox" name="date" 	   id="dateCheckbox" checked>전체기간 
			<input type="date"	   name="e_sdate"  id="sdate"> ~ 
			<input type="date"	   name="e_edate"  id="edate"></td>
	</tr>
	<tr>
		<th scope="row">이벤트 상태</th>
		<td>
			<input type="radio" name="status" value="all" checked="checked"> 전체
			<input type="radio" name="status" value="keep"> 진행 중
			<input type="radio" name="status" value="stop"> 종료
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" class="btn btn-outline-dark mb-2" value="검색" onclick="checkDetail()">
		<input type="reset" class="btn btn-outline-primary mb-2 value="초기화"></td>
	</tr>
</table>
</form>
<div class="tab	le-responsive" >
	<p>이벤트 목록</p>
<table class="table">
  <thead class="table-light">
    <tr>
      <th scope="col">번호</th>
      <th scope="col">이벤트 번호</th>
      <th scope="col">제목</th>
      <th scope="col">시작일</th>
      <th scope="col">종료일</th>
      <th scope="col">포인트</th>
      <th scope="col">연속출석 유무</th>
      <th scope="col">관리</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="event" items="${event }">
		<tr style="vertical-align: middle;">
			<th scope="row">${event.rn }</th>
			<td>${event.a_num }	 </td>
			<td>${event.a_title }</td>
			<td>${event.a_sdate }</td>
			<td>${event.a_edate }</td>
			<td>${event.a_point }</td>
			<td>${event.a_add }일</td>
			<td><input type="button" class="btn btn-soft-primary mb-2" value="수정" onclick="openPopUp(${event.a_num})">  
				<input type="button" class="btn btn-soft-success mb-2" value="내역" onclick="openDetail(${event.a_num})"> </td>
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
	
	//이벤트 리스터 세팅
	document.getElementById('sdate').addEventListener('input', handleDateInput);
	document.getElementById('edate').addEventListener('input', handleDateInput);
	//날짜 입력란에 입력시 호출되는 함수
	function handleDateInput() {
		//체크박스 해제
		document.getElementById('dateCheckbox').checked = false;
	}
	
	document.getElementById('dateCheckbox').addEventListener('change',function(){
		var sdate = document.getElementById("sdate");
		var edate = document.getElementById("edate");
		
		if(this.checked){
			sdate.value="";
			edate.value="";
		} 
	});

</script>

</body>
</html>