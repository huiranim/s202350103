<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<body>
	<form action="updateQuiz">
		이번트 번호 : <input type="text" value="${quiz.q_num }" readonly="readonly">							<p>
		이벤트 이름 : <input type="text" value="${quiz.q_title}" required="required">						<p>
		이벤트 기간 : <input type="date" value="${quiz.q_sdate}" required="required">~<input type="date" value="${quiz.q_edate}" required="required"><p>
		사진 등록 :  <input type="file" value="${quiz.q_image}" required="required">						<p>
		출석 혜택지급 : 지급 포인트 :	<input type="number" value="${quiz.q_point}" required="required">point		<p>
		질문<br/>
		<textarea name="q_question" required="required">${quiz.q_question }</textarea>					<p>
		1.<input type="text" name="q_select1" value="${quiz.q_select1}"	required="required">			<p>
		2.<input type="text" name="q_select2" value="${quiz.q_select2}"	required="required">			<p>
		3.<input type="text" name="q_select3" value="${quiz.q_select3}" required="required">			<p>
		4.<input type="text" name="q_select4" value="${quiz.q_select4}" required="required">			<p>
		정답 : 																							<p>
		<select name="q_answer" required="required">
			<option id="select" value="1" selected="selected">1
			<option id="select" value="2">2
			<option id="select" value="3">3
			<option id="select" value="4">4
		</select>																						<p>
		<span><input type="submit" value="생성"></span>
		<span><input type="button" onclick="cancle()" value="취소"></span>																	
	</form>
<script type="text/javascript">
	function
</script>
</body>
</html>