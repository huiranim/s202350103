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
			alert("포인트를 입력해주세요.");
			return false;
	}
	
	function minusPoint(){
		var point = $('#point').val();
		if(point>0){
			if(confirm(point+"만큼 차감하시겠습니까?")){
				alert(point + "포인트 차감 하셨습니다.");
				location.href="boMinusPoint?m_num="+${m_num}+"&point="+point;
			}else{
				alert("포인트 차감을 취소하셨습니다.");
				return false;
			}
		} else {
			alert("포인트를 입력해주세요.");
			return false;
		}
	}
</script>
</head>
<body>
<h2>포인트 수정</h2>
<table>
	<tr>
		<td colspan="6"/><th>총합</th><td>${sum}</td>
	</tr>
	<tr>
		<th>번호</th><th>포인트번호</th><th>회원번호</th><th>발행페이지 코드</th><th>발행일시</th><th>포인트유형</th><th>지급포인트</th>
	</tr>
	<c:forEach var="memberPoint" items="${memberPoint }">
		<tr>
			<td>${memberPoint.rn }</td>
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
</table>
<br>
	<h3>포인트 수정하기</h3>
	회원 아이디 : ${member.m_id }<p>
	회원 이름    :${member.m_name }<p>
	<input type="text" id="point"><p>
	<input type="button" onclick="plusPoint()" value="추가하기">	
	<input type="button" onclick="minusPoint()" value="차감하기">	
</body>
</html>