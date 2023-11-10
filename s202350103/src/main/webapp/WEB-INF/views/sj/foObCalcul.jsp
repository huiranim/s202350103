<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
   <!-- 정산하기 --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="writeFormObTrans" method="get">
<p class="text-center fs-1 ">중고 도서 정산 안내 </p>
					<input type="hidden" name="nb_num" value="${oldBook.nb_num }">	
<br>
<hr>
	<p class="text-center fs-1 ">중고 도서 정산 기준 </p>
			<p class="text-end fs-5 ">원본 책 가격 	<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price}"/>원    </p> 
			<p class="text-end fs-5 ">A등급 		<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price *0.6}"/>원    </p>
			<p class="text-end fs-5 ">B등급 		<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price *0.5}"/>원   </p>
			<p class="text-end fs-5 ">C등급 		<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price *0.4}"/>원   </p>
			<p class="text-end fs-5 ">D등급		<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price *0.3}"/>원   </p>
			
	  <br>
  <hr>
  <p class="text-start fs-4 ">정산 계좌    </p>
 <div class="input-group mb-3">
  <select name="ob_acc_name" >
				<option value="1">기업은행</option>
				<option value="2">우리은행</option>
				<option value="3">하나은행</option>
				<option value="4">제일은행</option>
				<option value="5">농      협</option>
				<option value="6">신한은행</option>
				<option value="7">국민은행</option>
				<option value="8">카카오뱅크</option>
				<option value="9">토스    뱅크</option>
		</select> 
 


  <input type="number" name="ob_acc_num" class="form-control" placeholder="계좌 번호를 입력해주세요" aria-label="Text input with dropdown button">
 </div> 
 
 <br>
 <hr>
 <div class="d-grid gap-2">
	    <button class="btn btn-dark" type="submit">판매 계속</button>
	 
	 </div>
 </form>
</body>
<%@ include file="../common/footerFo.jsp" %>
</html>