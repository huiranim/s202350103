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
<h2>Attendance Event 수정</h2>
<form id="attendanceForm" action="javascript:void(0)">
	이벤트 번호  : <input type="text" name="a_num"     value="${attendance.a_num}"   readonly="readonly">					<p>
	이벤트 이름  : <input type="text" name="a_title"   value="${attendance.a_title}" required="required">					<p>
	이벤트 기간  : <input type="date" name="a_sdate"   value="${attendance.a_sdate}" required="required">~
			  <input type="date" name="a_edate"   value="${attendance.a_edate}" required="required">					<p>
	사진 등록     : ${attendance.a_image }<input type="file" name="file1">					<p>
	출석 관리	:																											<p>
		지급 포인트 : <input type="text" name="a_point" value="${attendance.a_point}" required="required">point				<p>
	연속 출석 	:																											<p>
		조건   : <input type="text" name="a_add" value="${attendance.a_add}" required="required"> 연속 출석 시					<p>
		지금 포인트  : <input type="text" name="a_addpoint" value="${attendance.a_addpoint}" required="required">point		<p>
	<span><input type="button" onclick="updateAtt()" value="수정"></span>
</form>
	<button onclick="deleteAtt(${attendance.a_num },${attendance.a_title})">삭제</button>
	<button id="closeButton">취소</button>
	
 
 <script type="text/javascript">
 function updateAtt() {
	    alert("updateAttendance start..");
	    var attendanceForm = $("#attendanceForm");
	    
	    // 파일이 선택되었는지 여부 확인
	    var fileInput = attendanceForm.find("input[name='file1']");
	    var isFileSelected = fileInput[0].files.length > 0;

	    // 파일 정보 설정
	    var fileValue = isFileSelected ? fileInput.val() : null;

	    var attendanceData = {
	        a_num: parseInt(attendanceForm.find("input[name='a_num']").val(), 10),
	        a_title: attendanceForm.find("input[name='a_title']").val(),
	        a_sdate: attendanceForm.find("input[name='a_sdate']").val(),
	        a_edate: attendanceForm.find("input[name='a_edate']").val(),
	        file1: fileValue,
	        a_point: parseInt(attendanceForm.find("input[name='a_point']").val(), 10),
	        a_add: parseInt(attendanceForm.find("input[name='a_add']").val(), 10),
	        a_addpoint: parseInt(attendanceForm.find("input[name='a_addpoint']").val(), 10),
	        a_image: "${attendance.a_image}" // 기존 값 가져오기
	    };

	    alert(JSON.stringify(attendanceData));

	    $.ajax({
	        url: "updateAttendance",
	        data: JSON.stringify(attendanceData),
	        contentType: "application/json",
	        type: "POST",
	        success: function (result) {
	            if (result == 1) {
	                if (confirm("수정 성공, 창을 닫으시겠습니까?")) {
	                    alert("수정 성공");
	                    window.close();
	                }
	            } else {
	                alert("수정 실패");
	                return false;
	            }
	        }
	    });
	}
	
	function deleteAtt(p_a_num, p_a_title){
		var confirmMessage = p_a_title +"을 삭제하시겠습니까?";
		if(confirm(confirmMessage)){
			$.ajax({
				url:"deleteAtt",
				data:{a_num:p_a_num},
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