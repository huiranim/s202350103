<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>출석체크</h1>
<form action="">
	이벤트 이름 : <input type="text" name="a_title" >
	이벤트 기간 : <input type="date" name="a_sdate">~<input type="date" name="a_edate">
	사진 등록    : <input type="file" name="a_image">	
	출석 관리
		지급 포인트 : <input type="text" name="a_point">point
	연속 출석 
		조건 : <input type="text" name="a_add"> 연속 출석 시
		지금 포인트  : <input type="text" name="a_addpoint">point
	<input type="submit" name="제출">
</form>
</body>
</html>