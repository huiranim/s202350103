<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	function checkDate(){
		alert("테스트");
		var curDate = new Date();
		var curDate1 = curDate.getFullYear()+"-"+(curDate.getMonth()+1)+"-"+curDate.getDate();
		alert(curDate1);
		var sdate = $('input[name=a_sdate]').val();
		var edate = $('input[name=a_edate]').val();
		alert("sdate->"+sdate);
		alert("edate->"+edate);
		if(sdate>edate){
			alert("이벤트 기간 설정을 잘 못 되었습니다.");
			return false;
		} else if(curDate1>=sdate&&curDate1<=edate){
			alert("이벤트 기간을 도중으로 생성할 수 없습니다.");
			return false;
		} else if(curDate1 >= edate){
			alert("기간이 종료된 이벤트는 생성하실 수 없습니다.");
			return false;
		} else if(curDate1 < edate){
			document.forms["createAttForm"].action;
			return true;
		} else {
			alert("오류 발생");
			return false;
		}
	}
	
	function convertToDate(dateStr) {
		var parts = dateStr.split('-');
		return new Date(parts[0], parts[1] - 1, parts[2]);
		}

</script>
<style>
	.title{
		font-size: 25px; 
		font-weight: bold;
	}
	
	form{
		width: 80%;
	}
	
	th {vertical-align: middle;}
	
</style>
<body>
<form id="createAttForm" action="createAtt" onsubmit="return checkDate()" method="post" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<th colspan="2" class="title">출석체크 설정</th>
		<tr>
		<tr>
			<th scope="col" class="table-active">이벤트 이름</th>
			<td><input type="text" name="a_title" style="width: 300px;" required="required"></td>
		</tr>
		<tr>
			<th scope="col" class="table-active">이벤트 기간</th>
			<td><input type="date" name="a_sdate" required="required"> ~ <input type="date" name="a_edate" required="required"></td>
		</tr>
		<tr>	
			<th scope="col" class="table-active">사진 등록</th>
			<td><input type="file" name="file1" required="required"></td>
		</tr>
		<tr>
			<th scope="row" class="table-active">출석 관리</th>
			<td>
				<table>
				<tr>
	              <th>포인트</th>
	              <td><input type="number" name="a_point" min="1" maxlength="3" style="margin-left: 10px; width: 80px;" required="required"> point</td>
	            </tr>
	        	</table>
	        </td>
		</tr>
		<tr>
			<th scope="row" class="table-active">연속 출석</th>
			<td>
				<table>
					<tr>
		              <th>조건</th>
		              <td><input type="text" name="a_add" min="1" maxlength="1" style="margin-left: 10px; width: 80px;" required="required"> 일 연속 출석 시</td>
		            </tr>
		            <tr>
		              <th>포인트</th>
		              <td><input type="number" name="a_addpoint" min="1" maxlength="5" style="margin-left: 10px; width: 80px;" required="required"> point</td>
		            </tr>
		        </table>
	        </td>
		</tr>
		<tr>
			<td></td>
			<td style="float: right; margin-top: 10px; margin-right: 40px;">
				<input type="submit" class="btn btn-soft-primary mb-2" value="생성">
				&nbsp;
				<input type="button" class="btn btn-soft-danger mb-2" value="취소">
			</td>	
		</tr>
	</table>
</form>
</body>
</html>