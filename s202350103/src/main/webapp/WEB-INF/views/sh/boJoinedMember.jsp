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
	function checkSelect(){
		var eNum = $('input[name=eNum]').val();
		var m_num = $('input[name=m_num]').val();
		alert(eNum);
		alert(m_num);
		if(eNum==''||eNum==null) {
			alert("비정상 접근입니다.");
			return false;
		} else {
			if(isNaN(m_num) || m_num.trim() === ''){
				alert("숫자를 입력하세요.");
				return false;
			} else if (m_num == 0){
				alert("회원번호를 입력하세요");
				return false;
			} else {
				document.getElementById('searchForm').submit();
				return true;
			}
		}
	}
</script>
</head>
<body>
<form id="searchForm" action="boMemberSelect" method="get">
	<p class="fs-1 text-center">상세조회</p>
	<span>회원번호 : </span>
	<input type="hidden" name="eNum" value="${eNum}">
	<input type="number" name="m_num" min="1001" max="9999">
	<input type="button" value="검색" onclick="checkSelect()">
</form>

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
	</tbody>
	<tfoot>
		<tr>
			<td colspan="6"><button id="closeButton">닫기</button></td>
		</tr>
	</tfoot>
</table>
	
<script type="text/javascript">
	var closeButton = document.getElementById("closeButton");
	closeButton.addEventListener('click',function(){
		window.close();
	});
</script>
</body>
</html>