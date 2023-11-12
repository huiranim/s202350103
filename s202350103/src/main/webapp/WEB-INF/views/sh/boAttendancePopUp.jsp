<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<form action=updateAtt" method="post">
	이벤트 번호 : <input type="text" value="${attendance.a_num}" readonly="readonly">					<p>
	이벤트 이름  : <input type="text" value="${attendance.a_title}" required="required" >				<p>
	이벤트 기간  : <input type="date" value="${attendance.a_sdate}" required="required">~<input type="date" value="${attendance.a_edate}" required="required"><p>
	사진 등록     : <input type="file" value="${attendance.a_image}" required="required">					<p>
	출석 관리	:																						<p>
		지급 포인트 : <input type="text" value="${attendance.a_point}" required="required">point			<p>
	연속 출석 	:																						<p>
		조건   : <input type="text" value="${attendance.a_add}" required="required"> 연속 출석 시			<p>
		지금 포인트  : <input type="text" value="${attendance.a_addpoint}" required="required">point		<p>
	<span><input type="submit" value="수정"></span>
	<span><input type="button" value="취소" onclick="cancle()"></span>
</form>
</body>
</html>