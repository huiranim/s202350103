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
<p class="fs-1 text-center">Attendance Event 수정</p>
<form id="attendanceForm">
	<table class="table table-striped table-bordered">
		<tr>
			<th scope="row">이벤트 번호  :</th>
			<td>
				<input type="text"   name="a_num"     value="${attendance.a_num}"   readonly="readonly">
			</td>
		</tr>
		<tr>
			<th scope="row">이벤트 이름  : </th>
			<td>
				<input type="text"   name="a_title"   value="${attendance.a_title}" required="required">
			</td>
		</tr>
		<tr>
			<th scope="row">이벤트 기간  : </th>
			<td>
				<input type="date"   name="a_sdate"   value="${attendance.a_sdate}" required="required">~
			  	<input type="date"   name="a_edate"   value="${attendance.a_edate}" required="required">
			</td>
		</tr>
		<tr>
			<th scope="row">사진 등록	: </th>
			<td>
				<input type="hidden" name="a_image"   value="${attendance.a_image}" jdbcType="varchar"> <input type="file" name="file1">													<p>
			</td>
		</tr>
		<tr>
			<th scope="row">출석 관리	:</th>
		</tr>
		<tr>
			<td colspan="2">
				<table class="table mb-0">
         			<thead>
         				<tr>
							<th scope="row">지급 포인트 :</th>
							<td>	
								<input type="text" name="a_point" value="${attendance.a_point}" required="required"> point
							</td>
						</tr>
					</thead>
				</table>
			</td>
		</tr>	
		<tr>
			<th scope="row">연속 출석 	:</th>
		</tr>
		<tr>
			<td colspan="2">
				<table class="table mb-0">
         			<thead>
         				<tr>
							<th scope="row">조건   : </th>
							<td>
								<input type="text" name="a_add" value="${attendance.a_add}" required="required"> 연속 출석 시
							</td>
						</tr>
					</thead>
					<tbody>	
						<tr>
							<th scope="row">지금 포인트  :</th>
							<td>
								<input type="text" name="a_addpoint" value="${attendance.a_addpoint}" required="required"> point
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="button" onclick="updateAtt()" value="수정">
				<input type="button" onclick="deleteAtt(${attendance.a_num },'${attendance.a_title}')" value="삭제">
				<button id="closeButton">취소</button>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<span style="background-color:yellow; color: red;">*포인트 수령 기록이 있으면 삭제가 되지 않습니다!</span>
			</td>
		</tr>
	</table>
</form>
	
	
	
	
 
<script type="text/javascript">
 function updateAtt() {
	    alert("updateAttendance start..");
	    var attendanceForm = $("#attendanceForm");
	    var formData = new FormData(attendanceForm[0]);

	    $.ajax({
	        url: "updateAttendance",
	        data: formData,
	        contentType: false,  // false로 설정
	        processData: false,  // false로 설정
	        type: "POST",
	        success: function (result) {
	            if (result == 1) {
	                if (confirm("수정 성공, 창을 닫으시겠습니까?")) {
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
					} else {
						alert("삭제가 불가능한 상태입니다.")
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