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
<form id="attendanceForm" action="javascript:void(0)">
	이벤트 번호  : <input type="text" name="a_num"     value="${attendance.a_num}"   readonly="readonly">					<p>
	이벤트 이름  : <input type="text" name="a_title"   value="${attendance.a_title}" required="required">					<p>
	이벤트 기간  : <input type="date" name="a_sdate"   value="${attendance.a_sdate}" required="required">~
			  <input type="date" name="a_edate"   value="${attendance.a_edate}" required="required">					<p>
	사진 등록     : <input type="file" name="a_image"   value="${attendance.a_image}" required="required">					<p>
	출석 관리	:																											<p>
		지급 포인트 : <input type="text" name="a_point" value="${attendance.a_point}" required="required">point				<p>
	연속 출석 	:																											<p>
		조건   : <input type="text" name="a_add" value="${attendance.a_add}" required="required"> 연속 출석 시					<p>
		지금 포인트  : <input type="text" name="a_addpoint" value="${attendance.a_addpoint}" required="required">point		<p>
	<span><input type="button" onclick="updateAtt()" value="수정"></span>
</form>
	<button id="closeButton">취소</button>
 
 <script type="text/javascript">
	function updateAtt(){
		alert("updateAttendance start..");
		var attendanceForm = $("#attendanceForm");
		var attendanceData = {
				a_num	  :	attendanceForm.find("input[name='a_num']").val(),
				a_title	  :	attendanceForm.find("input[name='a_title']").val(),
				a_sdate	  :	attendanceForm.find("input[name='a_sdate']").val(),
				a_edate   :	attendanceForm.find("input[name='a_edate']").val(),
				a_image   : attendanceForm.find("input[name='a_image']").val(),
				a_point	  :	attendanceForm.find("input[name='a_point']").val(),
				a_add	  :	attendanceForm.find("input[name='a_add']").val(),
				a_addpoint: attendanceForm.find("input[name='a_addpoint']").val()
		};
		
		alert(JSON.stringify(attendanceData));
		
		$.ajax({
			url:"updateAttendance",
			data:JSON.stringify(attendanceData),
			contentType:"application/json",
			dataType: "json",
			type: "POST",
			success: function(result){
				if (result == 1){
					if(confirm("수정 성공, 창을 닫으시겠습니까?")){
					alert("수정 성공");	
					window.close();
					}
				}else{
					alert("수정 실패");
					return false;
				}
			}
		});
	}
 
 	var closeButton = document.getElementById("closeButton");
	closeButton.addEventListener('click',function(){
		window.close();
	});
 </script>

</body>
</html>