<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!-- 운송장 -->    
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

		function calcul(){
		var totalCal1 = (${oldBook.nb_price*0.6});
		
		$("#Calcul1").val(totalCal1);
		}

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="writeOb" method="post">
<p class="text-center fs-1 ">중고 도서 운송장 등록 </p>
	<div class="text-center  position-relative ">
	<img src="assets/images/png/trans.png" alt="판매신청"
                      class="mb-3 img-fluid">
	
	</div>
		<input type="hidden" name="m_num" value="${member.m_num }">
		<input type="hidden" name="nb_num" value="${oldBook.nb_num }">
		<input type="hidden" name="ob_status" value="1">
		<input type="hidden" name="ob_pur_price" id="Calcul1" value="0">
		<input type="hidden" name="ob_acc_num" value="${oldBook.ob_acc_num }">
		<input type="hidden" name="ob_acc_name" value="${oldBook.ob_acc_name }">
<%-- 	<input type="hidden" name="ob_report_date" value="${oldBook.ob_report_date }" >
 --%>		
         <input type="hidden" name="nb_num" value="${oldBook.nb_num }">
		


<hr>
<p class="text-center fs-1 "> 발송 운송장 정보  </p>
 <div class="input-group mb-3">
 

  <select name="ob_trans_com" >
				<option value="1">CJ 대한통운 </option>
				<option value="2">우체국    택배</option>
				<option value="3">로젠     택배</option>
				<option value="4">한진     택배</option>
				<option value="5">롯데     택배</option>		
		</select> 
 


     <input type="text"   name="ob_trans_num"  maxlength="12" pattern="[0-9]+" class="form-control" placeholder="운송장 번호를 입력해주세요" title="숫자만 입력해주세요"
	    	 required/>
 </div> 
 
<br>
<br>
 <br>
 <hr>
	 <div class="d-grid gap-2">
	    <button class="btn btn-success mb-2" type="submit" onclick="calcul()">중고 판매 등록</button>
	 
	 </div>
 
 </form>
</body>

<%@ include file="../common/footerFo.jsp" %>
</html>