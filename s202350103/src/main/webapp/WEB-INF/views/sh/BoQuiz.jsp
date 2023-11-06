<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Quiz 이벤트</h1>
	<form action="location.href='boQuiz'" method="post">
		이벤트 이름 : <input type="text" name="q_title">
		이벤트 기간 : <input type="text" name="q_sdate">~<input type="text" name="q_edate">
		사진 등록 :  <input type="file" name="q_image">
		출석 혜택지급 : 지급 포인트 :	<input type="number" name="q_point">point
		질문
		<textarea name="q_question"></textarea>
		1.<input type="text" name="q_select1">
		2.<input type="text" name="q_select2">
		3.<input type="text" name="q_select3">
		4.<input type="text" name="q_select4">
		정답 : 
		<select name="q_answer" required="required">
			<option value="1" selected="selected">
			<option value="2">
			<option value="3">
			<option value="4">
		</select>
		<input type="submit" value="생성">
	</form>
</body>
</html>