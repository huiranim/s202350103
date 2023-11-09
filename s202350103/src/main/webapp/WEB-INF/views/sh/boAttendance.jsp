<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>출석체크</h1>
<form action="createAtt()" method="post">
	이벤트 이름 : <input type="text" name="a_title" required="required">
	이벤트 기간 : <input type="date" name="a_sdate" required="required">~<input type="date" name="a_edate" required="required">
	사진 등록    : <input type="file" name="a_image" required="required">	
	출석 관리
		지급 포인트 : <input type="text" name="a_point" required="required">point
	연속 출석 
		조건 : <input type="text" name="a_add" required="required"> 연속 출석 시
		지금 포인트  : <input type="text" name="a_addpoint" required="required">point
	<input type="submit" value="생성">
</form>
</body>
</html>