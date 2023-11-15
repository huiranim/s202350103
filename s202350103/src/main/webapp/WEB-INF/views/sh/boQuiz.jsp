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
	<h1>Quiz 이벤트</h1>
	<form action="createQuiz" enctype="multipart/form-data" method="post">
		이벤트 이름 : <input type="text" name="q_title" required="required">						<p>
		이벤트 기간 : <input type="date" name="q_sdate" required="required">~<input type="date" name="q_edate" required="required"><p>
		사진 등록 :  <input type="file" name="file1" required="required">						<p>
		출석 혜택지급 : 지급 포인트 :	<input type="number" name="q_point" required="required">point	<p>
		질문<br/>
		<textarea name="q_question" required="required"></textarea>							<p>
		1.<input type="text" name="q_select1" required="required">							<p>
		2.<input type="text" name="q_select2" required="required">							<p>
		3.<input type="text" name="q_select3" required="required">							<p>
		4.<input type="text" name="q_select4" required="required">							<p>
		정답 : 																				<p>
		<select name="q_answer" required="required">
			<option id="select" value="1" selected="selected">1
			<option id="select" value="2">2
			<option id="select" value="3">3
			<option id="select" value="4">4
		</select>																			<p>
		<input type="submit" value="생성">													<p>
	</form>
</body>
</html>