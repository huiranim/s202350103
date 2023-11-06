<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/none.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		function closeWindow(p_order_num, p_deliv, p_track) {
			alert("안녕");
			
			$.ajax(
					{
						url : "/statusExchange",
						data : {o_order_num : p_order_num,
								o_ex_deli : p_deliv,
								o_ex_track : p_track},
						dataType : 'text',
						success : function(data) {
							alert('statusExchange data -> '+ data);
							if(data == "1") {
								alert('교환 정보가 등록되었습니다.');
								opener.parent.location.reload();
								window.close();
							}
						}
					}
			)
		}
	</script>

</head>
<body>
<div class="py-6 p-md-6 p-lg-10">
   <div class="mb-6">
   
   
   
      <!-- heading -->
      <h2 class="mb-0">교환 처리</h2>
   </div>
   <div>
      <!-- heading -->
      <div class="row">
         <div class="col-lg-5">
            <!-- form -->
            <form name="frm">
	            <input type="hidden" name="o_order_num" value="${o_order_num}">
	               <!-- input -->
	               <div class="mb-3">
	                  <label class="form-label">택배사</label>
	                  <select class="form-select" aria-label="Default select example" id="deliv" required="required">
		                  <option selected>택배사를 선택하세요.</option>
		                  <option value="1">대한통운</option>
		                  <option value="2">우체국택배</option>
		                  <option value="3">로젠택배</option>
		                  <option value="4">한진택배</option>
		                  <option value="5">롯데택배</option>
	                  </select>
	               </div>
	               <!-- input -->
	               <div class="mb-3">
	                  <label class="form-label">송장번호</label>
	                  <input type="text" class="form-control" id="track" placeholder="송장번호를 입력하세요." required="required">
	               </div>
	               <!-- button -->
	               <div class="mb-3">
	                  <button class="btn btn-primary" onclick="closeWindow(${o_order_num}, deliv.value, track.value)">확인</button>
	               </div>
	        </form>
         </div>
      </div>
   </div>
 </div>
</body>
</html>