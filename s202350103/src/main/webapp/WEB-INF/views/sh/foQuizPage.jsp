<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Quiz 이벤트</h1>
	<p>${quiz.q_sdate}~${quiz.q_edate}</p>
	<br>
	<div>
		<div>
			<h3>Quiz</h3>
			<textarea>${quiz.q_question }</textarea>
		</div>
		<form action="quizAnswer()">
			<input type="radio" name="select1" value="${quiz.q_select1 }">${quiz.q_select1 }
			<input type="radio" name="select2" value="${quiz.q_select2 }">${quiz.q_select2 }
			<input type="radio" name="select3" value="${quiz.q_select3 }">${quiz.q_select3 }
			<input type="radio" name="select4" value="${quiz.q_select4 }">${quiz.q_select4 }
			<input type="button" name="submit" value="제출">
		</form>
	</div>
	<div>
		<div>
			보상안내
		</div>
		<div>
			유의사항
		</div>
	</div>
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>