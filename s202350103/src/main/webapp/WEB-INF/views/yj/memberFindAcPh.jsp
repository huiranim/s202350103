<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"%>
<%@ include file="../common/sideFo.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 컨텐츠 중간으로 -->
	<div class="row justify-content-center">
		<div class="mb-8">
       <!-- heading -->
       <h1 class="h3">아이디 찾기</h1>
    	</div>
	
		<div class="col-lg-8 col-12">
			<div class="py-6">
				<h4 class="fs-6 mb-4">본인 명의 휴대전화로 인증하여 주세요</h4>
				
				<form action="memberAuthPhone" method="post">
					<div class="input-phone mb-2">
						<input type="tel" maxlength="11" class="form-control"
							 required placeholder="01024846160" name="m_ph">
					</div>
					<h4 class="fs-6 mb-4"><mark>- 생략하고 번호만 입력해주세요</mark></h4>

					<div class="d-grid mb-8" >
						<button type="submit" class="btn btn-primary">
						인증 번호전송
						</button>
					</div>
				</form>	
					
					<h4 class="fs-6 mb-2">인증번호 입력</h4>
					 <div class="mb-4">
                         <input type="tel" maxlength="11" class="form-control" 
                         pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}"
                         required name="inputCode">
                     </div>
                	
                	<div class="d-grid">
						<button type="button" class="btn btn-primary">확인</button>
					</div>
                     
					<div class="mt-4">
						<small> <a href="#">인증번호가 오지 않으세요?</a> <a href="#"
							class="ms-3">1544-1125 고객센터 문의</a>
						</small>
					</div>
			</div>
		</div>
	</div>



	<%@ include file="../common/footerFo.jsp"%>

</body>
</html>