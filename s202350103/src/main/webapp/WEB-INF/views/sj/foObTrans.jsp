<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!-- 운송장 -->    
<!DOCTYPE html>
<html>
<script type="text/javascript">



</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="writeOb" method="post">
<p class="text-center fs-1 ">중고 도서 운송장 등록 </p>
		<input type="hidden" name="m_num" value="${oldBook.m_num }">
		<input type="hidden" name="nb_num" value="${oldBook.nb_num }">

		<input type="hidden" name="ob_acc_num" value="${oldBook.ob_acc_num }">
		<input type="hidden" name="ob_acc_name" value="${oldBook.ob_acc_name }">
<%-- 	<input type="date" name="ob_report_date" value="${oldBook.ob_report_date }" >
 --%>		
         <input type="hidden" name="nb_num" value="${oldBook.nb_num }">
		

</p>
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
 

  <input type="number" name="ob_trans_num" class="form-control" placeholder="운송장 번호를 입력해주세요" aria-label="Text input with dropdown button">
 </div> 
 
<br>
<br>
 <br>
 <hr>
	 <div class="d-grid gap-2">
	    <button class="btn btn-dark" type="submit">중고 판매 등록</button>
	 
	 </div>
 
 </form>
</body>

<%@ include file="../common/footerFo.jsp" %>
</html>