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
		width: 60%;
 	}
 	
	.button {
		text-align: center;
	}
</style>
<body>
<h1>출석체크</h1>
<form action="createAtt" method="post" enctype="multipart/form-data">
	<table class="table">
	<tr>
		<th colspan="1"></th><th colspan="1"></th><th colspan="1"></th>
	</tr>
	<tr>
		<th scope="col" class="table-active">이벤트 이름  : </th>
		<td><input type="text" name="a_title" required="required"></td>
		<td colspan="1">
	</tr>
	<tr>
		<th scope="col" class="table-active">이벤트 기간  : </th>
		<td><input type="date" name="a_sdate" required="required">~<input type="date" name="a_edate" required="required"></td>
		<td colspan="1">
	</tr>
	<tr>	
		<th scope="col" class="table-active">사진 등록     : </th>
		<td><input type="file" name="file1" required="required"></td>
		<td colspan="1">
	</tr>
	<tr>
		<th scope="row" class="table-active">출석 관리:</th>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="3">
			<table class="table mb-0">
			<tr>
              <td></td>
              <th scope="row">지급 포인트 :</th>
              <td><input type="text" name="a_point" required="required">point</td>
            </tr>
        	</table>
        </td>
	</tr>
	<tr>
		<th scope="row" class="table-active">연속 출석 	:</th>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="3">
		<table class="table mb-0">
			<tr>
              <td></td>
              <th scope="row">지급 포인트 :</th>
              <td><input type="text" name="a_add" required="required">point</td>
            </tr>
            <tr>
              <td scope="row"></td>
              <th>조건   :</th>
              <td><input type="text" name="a_addpoint" required="required">일 연속 출석 시</td>
            </tr>
        	</table>
        </td>
	</tr>	
	</table>
	<input type="submit" id="button" value="생성">
	<input type="button" id="button" value="취소">
</form>
</body>
</html>