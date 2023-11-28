<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/none.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
	<p class="fs-1 text-center">상세조회</p>
	<span>회원번호 : </span>
	<input type="text" name="">
	<input type="button" onclick="" value="검색">
</form>
<label style="float: right; margin-right: 30px;">총 참여 인원 : ${joinedCount}</label>
<table class="table" style="text-align: center; margin: auto;">
	<thead class="table-light">
		<th>번호</th>
		<th>적립번호</th>
		<th>회원번호</th
		><th>획득일자</th>
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
			<td><div title="안녕	">${pl.p_list_type}</div></td>
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