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
	<h2>Quiz Event 수정</h2>
	<form id="quizForm" action="javascript:void(0)">
		이번트 번호 : <input type="text" name="q_num" 	value="${quiz.q_num }" readonly="readonly">				<p>
		이벤트 이름 : <input type="text" name="q_title" 	value="${quiz.q_title}" required="required">			<p>
		이벤트 기간 : <input type="date" name="q_sdate" 	value="${quiz.q_sdate}" required="required">~
				 <input type="date"  name="q_edate"	value="${quiz.q_edate}" required="required">			<p>
		사진 등록 :  <input type="file" name="q_image"	value="${quiz.q_image}" required="required">			<p>
		출석 혜택지급 : 지급 포인트 :	<input type="number" 	value="${quiz.q_point}" required="required">point		<p>
		질문<br/>
		<textarea name="q_question" required="required">${quiz.q_question }</textarea>						<p>
		1.<input type="text" name="q_select1" value="${quiz.q_select1}"	required="required">				<p>
		2.<input type="text" name="q_select2" value="${quiz.q_select2}"	required="required">				<p>
		3.<input type="text" name="q_select3" value="${quiz.q_select3}" required="required">				<p>
		4.<input type="text" name="q_select4" value="${quiz.q_select4}" required="required">				<p>
		정답 : 																								<p>
		<select name="q_answer" required="required">
			<option id="select" value="1" selected="selected">1
			<option id="select" value="2">2
			<option id="select" value="3">3
			<option id="select" value="4">4
		</select>						
		<input type="button" onclick="updateQuiz()" value="수정">												<p>																	
	</form>
	<button onclick="deleteQuiz(${quiz.q_num },${quiz.q_title})">삭제</button>
	<button id="closeButton">닫기</button>
	
	<script type="text/javascript">
	function updateQuiz(){
		var quizForm = $("#quizForm");
		var quizData = {
				q_num: 		quizForm.find("input[name='q_num']").val(),
				q_title: 	quizForm.find("input[name='q_title']").val(),
				q_sdate: 	quizForm.find("input[name='q_sdate']").val(),
				q_edate: 	quizForm.find("input[name='q_edate']").val(),
				q_image: 	quizForm.find("input[name='q_image']").val(),
				q_point: 	quizForm.find("input[name='q_point']").val(),
				q_question: quizForm.find("textarea[name='q_question']").val(),
				q_select1: 	quizForm.find("input[name='q_select1']").val(),
				q_select2: 	quizForm.find("input[name='q_select2']").val(),
				q_select3: 	quizForm.find("input[name='q_select3']").val(),
				q_select4: 	quizForm.find("input[name='q_select4']").val(),
				q_answer: 	quizForm.find("select[name='q_answer']").val()
		};
		
		$.ajax({
			url:"updateQuiz",
			data:JSON.stringify(quizData),
			contentType:"application/json",
			dataType: "json",
			type : "POST",
			success: function(result){
				if(result == 1){
					if(confirm("수정 성공, 창을 닫으시겠습니까?")){
					window.close();		
					}
				}else{
					alert("수정 실패");
					return false;
				}
			}
		});
	}
	
	function deleteQuiz(p_q_num, p_q_title){
		var confirmMessage = p_q_title +"을 삭제하시겠습니까?";
		if(confirm(confirmMessage)){
			$.ajax({
				url:"deleteQuiz",
				data:{q_num:p_q_num},
				dataType:"text",
				success:function(result){
					if(result == 1){
						alert("삭제하였습니다.");
						location.href="boEventList";
					}
				}
			});
		} else {
			alert("삭제를 취소하였습니다.");
			return false;
			}
		}
	
	var closeButton = document.getElementById("closeButton");
	closeButton.addEventListener('click',function(){
		window.close();
	});
	</script>
</body>
</html>