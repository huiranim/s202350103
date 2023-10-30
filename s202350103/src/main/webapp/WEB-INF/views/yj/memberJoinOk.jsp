<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
			<!-- 회원가입 완료 -->
		<c:if test="${joinResult > 0 }">
			<div class="card text-center">
			  <div class="card-header">
			    DADOK
			  </div>
			  <div class="card-body">
			    <h5 class="card-title">${member.m_name } 님 DADOK 회원이 되신 것을 환영합니다</h5>
			    <p class="card-text">다양한 국내/해외 도서를 만나보세요 ! </p>
			    <a href="#" class="btn btn-primary">로그인 하러가기</a>
			  </div>
			  <div class="card-footer text-muted">
			    1566-1142 고객센터 문의
			  </div>
			</div>
		</c:if>
		
		
			<!-- 회원가입 실패 -->
		<c:if test="${joinResult == 0 }">
			<div class="card text-center">
			  <div class="card-header">
			    DADOK
			  </div>
			  <div class="card-body">
			    <h5 class="card-title">회원가입이 정상적으로 이루어지지 않았습니다.</h5>
			    <p class="card-text">다시 진행해주세요</p>
			    <a href="#" class="btn btn-primary">로그인 하러가기</a>
			  </div>
			  <div class="card-footer text-muted">
			    1566-1142 고객센터 문의
			  </div>
			</div>
		</c:if>
				


<%@ include file="../common/footerFo.jsp" %>
</body>
</html>

