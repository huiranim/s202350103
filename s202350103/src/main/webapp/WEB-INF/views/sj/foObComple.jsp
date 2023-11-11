<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
   
       <!-- 완료하기 --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p class="text-center fs-1 ">중고 도서 판매 신청완료
			<br><br>
			<br>
			<br>
	
		회원번호 : ${oldBook.m_num }구현해야함	<br>
			
 </p>
 
			<p class="text-center fs-1 ">
			신청이 완료 되었습니다 . <br>
			이용해 주셔서 감사합니다 . <br>
			검수및 정산결과는 마이페이지에서 가능합니다.	
			</p>
		
	<div class="d-grid gap-2 col-6 mx-auto">
 		 <button class="btn btn-primary" type="submit" onclick="location.href='BodetailObFo?ob_num=${oldBook.ob_num}" >마이페이지 이동</button>
	</div>

</body>

<%@ include file="../common/footerFo.jsp" %>
</html>