<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/none.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="assets/js/jquery.js"></script>

<body>
	<p class="fs-1 text-center">Quiz Event 수정</p>
	<form id="quizForm" action="javascript:void(0)">
		<table class="table table-striped table-bordered">
			<tr>
				<th scope="row">이벤트 번호 :</th>
				<td>
					<input type="text" name="q_num" 	value="${quiz.q_num }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th scope="row">이벤트 이름 : </th>
				<td>
					<input type="text" name="q_title" 	value="${quiz.q_title}" required="required">
				</td>
			</tr>
			<tr>
				<th scope="row">이벤트 기간 :</th> 
				<td>
					<input type="date" name="q_sdate" 	value="${quiz.q_sdate}" required="required">~
					<input type="date"  name="q_edate"	value="${quiz.q_edate}" required="required">
				</td>
			</tr>
			<tr>
				<th scope="row">사진 등록 : </th>
				<td>
					<input type="hidden" name="q_image"   value="${quiz.q_image}" jdbcType="varchar"><input type="file" name="file1">
				</td>
			</tr>
			<tr>
				<th scope="row">출석 혜택지급 :</th>
			</tr>
			<tr>
				<td colspan="2">
				<table class="table mb-0">
         			<thead>
         				<tr>
				 			<th scope="row">지급 포인트 :</th>
				 			<td>
				 				<input type="number"  name="q_point"	 value="${quiz.q_point}" required="required">point
							</td>
						</tr>
					</thead>
				</table>
				</td>
			</tr>
			<tr>
				<th scope="row">질문</th>
				<td>
					<textarea name="q_question" required="required">${quiz.q_question }</textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">선택지</th>
			</tr>
			<tr>
				<td colspan="2">
				<table class="table mb-0">
         			<tbody>
         				<tr>
							<th>1.</th>
							<td>
								<input type="text" name="q_select1" value="${quiz.q_select1}"	required="required">
							</td>
						</tr>
					</tbody>
					<tbody>
						<tr>	
							<th>2.</th>
							<td>
								<input type="text" name="q_select2" value="${quiz.q_select2}"	required="required">
							</td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>3.</th>
							<td>
								<input type="text" name="q_select3" value="${quiz.q_select3}" required="required">
							</td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>4.</th>
							<td>
								<input type="text" name="q_select4" value="${quiz.q_select4}" required="required">
							</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<th scope="row">정답 :</th>
				<td>
					<select name="q_answer" required="required">
						<option id="select" value="1" selected="selected">1
						<option id="select" value="2">2
						<option id="select" value="3">3
						<option id="select" value="4">4
					</select>						
				</td>
			</tr>
			<tr>
				<td colspan="2">	
					<input type="button" onclick="updateQuiz()" value="수정">																	
					<input type="button" onclick="deleteQuiz(${quiz.q_num },'${quiz.q_title}')" value="삭제">
					<button id="closeButton">닫기</button>
				</td>
			</tr>	
		</table>	
	</form>
	
	<script type="text/javascript">
	function updateQuiz(){
		alert("updateQuiz start..");
		var quizForm = $("#quizForm");
		var formData = new FormData(quizForm[0]);
		
		$.ajax({
			url:"updateQuiz",
			data:formData,
			contentType: false,  // false로 설정
	        processData: false,  // false로 설정
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
	};
	
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