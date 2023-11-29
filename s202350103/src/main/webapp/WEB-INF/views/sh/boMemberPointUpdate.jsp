<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/none.jsp" %>
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
</head>
<body>
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
    				<th>회원 이름</th>
    			</tr>
    			<tr>
    				<td>${sum}</td>
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