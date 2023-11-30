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
<style>
  .small-input {
    width: 100px; 
  }
</style>
<body>


<div class="offset-lg-2 col-lg-8 col-12">

	<div class="mb-8">
         <!-- heading -->
         <h1 class="mb-10">출석체크 수정</h1>
      </div>
      
<form id="attendanceForm">
	<table class="table table-striped table-bordered">
		<tr>
			<th scope="row">이벤트 번호  :</th>
			<td>
				<input type="text"   name="a_num"     value="${attendance.a_num}"   readonly="readonly" class="form-control ">
			</td>
		</tr>
		<tr>
			<th scope="row">이벤트 이름  : </th>
			<td>
				<input type="text"   name="a_title"   value="${attendance.a_title}" required="required" class="form-control ">
			</td>
		</tr>
		<tr>
			<th scope="row">이벤트 기간  : </th>
			 <td class="form-inline ">
	        <div class="input-group" style="width: 50%;">
				<input type="date"   name="a_sdate" id="a_sdate"  value="${attendance.a_sdate}" required="required" class="form-control "> &nbsp;~&nbsp;
			  	<input type="date"   name="a_edate" id="a_edate"  value="${attendance.a_edate}" required="required" readonly="readonly" class="form-control ">
			</div>
			</td>
		</tr>
		<script>
			$(document).ready(function() {
			    $('#a_sdate').on('change', function() {
			      // 시작일을 선택하면 종료일이 해당 달의 마지막 날짜로 자동 설정됩니다.
			      const startDate = new Date($(this).val());
			      const lastDay = new Date(startDate.getFullYear(), startDate.getMonth() + 1, 1);
			      const formattedLastDay = lastDay.toISOString().split('T')[0];
			      
			      console.log('formattedLastDay:', formattedLastDay);
			      
			      $('#a_edate').val(formattedLastDay);
			    });
			  });
		</script>
		<tr>
			<th scope="row" style="vertical-align: middle;">사진 등록	: </th>
			<td style="padding-top: 20px; padding-bottom: 4px;">
				<input type="hidden" name="a_image"   value="${attendance.a_image}" jdbcType="varchar"> <input type="file" name="file1" style="width:185px;" class="form-control">													<p>
			</td>
		</tr>
		
		<tr>
			<th scope="row">지급 포인트  : </th>
			 <td class="form-inline ">
	        <div class="input-group" style="width: 50%;">
			  	<input type="text" name="a_point" min="1" pattern="\d*" maxlength="3" value="${attendance.a_point}" required="required" class="form-control" >&nbsp;&nbsp; 
			  	<span >point</span>
			</div>
			</td>
		</tr>
		
		
			
		<tr>
			<th scope="row">연속 출석 	: </th>
			 <td class="form-inline ">
	        <div class="input-group" style="width: 50%;">
				<input type="text" name="a_add" min="1" maxlength="1" value="${attendance.a_add}" required="required" class="form-control">&nbsp;&nbsp; 일 연속 출석 시 &nbsp;&nbsp;
				<input type="text" name="a_addpoint" min="1" pattern="\d*" maxlength="5" value="${attendance.a_addpoint}" required="required" class="form-control small-input">&nbsp;&nbsp; point 지급

			</div>
			</td>
		</tr>
			
		<tr>
			<td colspan="3">
				<span style="background-color:yellow; color: red;">*포인트 수령 기록이 있으면 삭제가 되지 않습니다!</span><p>
				<span>이미지 교체는 선택사항이며, 선택 안할 시, 기존 이미지가 사용됩니다.</span>
			</td>
		</tr>
		
	</table>
	<div class="d-grid gap-2 d-md-flex justify-content-center" >
		<input type="button"  onclick="updateAtt()" class="btn btn-primary mb-2" value="수정" style="margin-right: 10px"> 
		<input type="button"  class="btn btn-primary mb-2" id="cancleButton"  value="삭제" onclick="deleteAtt(${attendance.a_num },'${attendance.a_title}')" >
	</div>
	
	
</form>
</div>	
	
	
	
 
<script type="text/javascript">
 function updateAtt() {
	 	var confirmMessage = "수정 하시겠습니까?";
	    var attendanceForm = $("#attendanceForm");
	    var formData = new FormData(attendanceForm[0]);
		if(confirm(confirmMessage)){
	    $.ajax({
	        url: "updateAttendance",
	        data: formData,
	        contentType: false,  // false로 설정
	        processData: false,  // false로 설정
	        type: "POST",
	        success: function (result) {
	            if (result == 1) {
	                if (confirm("수정 성공")) {
	                }
	            } else {
	                alert("수정 실패");
	                return false;
	            }
	        },
			error:function(result){
				alert('정보를 잘 못 입력하셨습니다.');
				return false;
			}
	    });
	}else{
		alert("수정을 취소하셨습니다.");
		return false;
		}
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
						opener.parent.location.reload();
						window.close();
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