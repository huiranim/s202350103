<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	form {
		width:60%;
	}
	
	.button{
		text-align: center;
	}
</style>
<body>
	<h1>Quiz 이벤트</h1>
	<form action="createQuiz" enctype="multipart/form-data" method="post">
	<table class="table">
		<tr>
			<td></td><td></td><td></td>
		</tr>
		<tr>
			<th class="table-active">이벤트 이름 :</th>
			<td><input type="text" name="q_title" required="required"></td>	
		</tr>
		<tr>
			<th class="table-active">이벤트 기간 :</th>
			<td><input type="date" name="q_sdate" required="required">~<input type="date" name="q_edate" required="required"></td>
		</tr>
		<tr>
			<th class="table-active">사진 등록 :</th>
			<td><input type="file" name="file1" required="required"></td>
		</tr>
		<tr>
			<th class="table-active">출석 혜택지급 :</th>
			<td></td>
		</tr>
		<tr>
			<td colspan="3">
				<table class="table mb-0">
				<tr>
					<th>포인트 :</th>
					<td><input type="number" name="q_point" required="required">point</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<th class="table-active">질문</th>
			<td><textarea name="q_question" required="required"></textarea></td>
		</tr>
		<tr>
			<th class="table-active">선택 :</th>
			<td></td>
		</tr>
		<tr>
			<td colspan="3">
				<table class="table mb-0">
				<tr>
					<th>1.</th><td><input type="text" name="q_select1" required="required"></td>
				</tr>
				<tr>
					<th>2.</th><td><input type="text" name="q_select2" required="required"></td>
				</tr>
				<tr>
					<th>3.</th><td><input type="text" name="q_select3" required="required"></td>
				</tr>
				<tr>
					<th>4.</th><td><input type="text" name="q_select4" required="required"></td>
				</tr>
				</table>
			</td>						
		</tr>
		<tr>
			<th scope="row" class="table-active">정답 :</th>
			<td>
				<select name="q_answer" required="required">
					<option id="select" value="1" selected="selected">1
					<option id="select" value="2">2
					<option id="select" value="3">3
					<option id="select" value="4">4
				</select>
			</td>
		</tr>
	</table>
		<input type="submit" value="생성" id="button">
		<input type="button" value="취소" id="button">
	</form>
</body>
</html>