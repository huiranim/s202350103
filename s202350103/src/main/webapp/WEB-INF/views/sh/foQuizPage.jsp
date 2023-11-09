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
<title>Quiz이벤트</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript">
	var m_num = ${m_num};
	var q_num = ${eNum};

	function checkAnswer(){
		var selected = document.querySelector('input[name="select"]:checked');
	    if (!selected || selected === null) {
	        alert("정답을 선택하세요.");
	        return false;
	    } else{ 
				var select = selected.value;
				var answer = $('[name=answer]').val();
				if(select == answer){
					if(${chance} == 0){
						alert("정답입니다! 정말 대단하시군요~");
						location.href="checkQuiz?m_num="+m_num+"&eNum="+q_num;
						return true;
					} else{
						alert("이미 참여하셨습니다");
						return false;
					}
				} else {
					alert("오답입니다. 오달숩니다.");
					return false;
				}
			}
		}
</script>
<body>
	<h1>Quiz이벤트</h1>
	<p>${quiz.q_sdate}~${quiz.q_edate}</p>
	<br>
	<div>
		<div>
			<h3>Quiz</h3>
			<textarea>${quiz.q_question }</textarea>
		</div>
		<form onsubmit="checkAnswer()">
			<input type="hidden" name="m_num" value="${m_num}">
   			<input type="hidden" name="eNum" value="${eNum}">
			<input type="hidden" name="answer"   value="${quiz.q_answer}">
			<input type="radio"  name="select"   value="1">${quiz.q_select1 }<br>
			<input type="radio"  name="select"   value="2">${quiz.q_select2 }<br>
			<input type="radio"  name="select"   value="3">${quiz.q_select3 }<br>
			<input type="radio"  name="select"   value="4">${quiz.q_select4 }<br>
			<input type="submit" value="제출">
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