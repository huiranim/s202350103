<%@page import="com.choongang.s202350103.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"  %>
<%@ include file="aboutLogin.jsp" %>


<!DOCTYPE html>
<html>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <!-- section -->
  <section class="my-lg-14 my-8" style="width: 150%; ">
    <div class="container">
      <!-- row -->
      <div class="row justify-content-center align-items-center">
        <!-- col -->
        
        <div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1" style="align-items: center;">
          <div class="mb-lg-9 mb-5">
            <h1 class="mb-1 h2 fw-bold" style="text-align: center;">LOGIN</h1>
            <p style="text-align: center;">다독에 오신걸 환영합니다.<br> 로그인하여 이용해주시길 바랍니다.</p>
          </div>
		  <div id="msg" style="text-align: center;"></div><p>
<!-- 		<form action="memberLogin" method="get" name="frm" onsubmit="loginChk(m_id.value, m_pw.value)"> -->
            <div class="row g-3">
              <!-- row -->
			
              <div class="col-12">
                <!-- input -->
                <input type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디를 입력하세요" required>
              </div>
              <div class="col-12">
                <!-- input -->
              <div class="password-field position-relative">
      			<input type="password" id="m_pw"  name="m_pw" placeholder="비밀번호를 입력하세요" class="form-control" required >
      			<span><i id="passwordToggler"class="bi bi-eye-slash"></i></span>
    		  </div>

              </div>
              <div class="d-flex justify-content-between">	
                <!-- form check -->
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="idSaveCheck" name="idSaveCheck" value="remember" >
                  <!-- label --> <label class="form-check-label" for="idSaveCheck">
                    	아이디 기억하기
                  </label>
                  
                </div>
                <div> 계정을 잊어버리셨나요? <a href="memberFindAccount">계정 찾기</a></div>
              </div>

             
<!--               <div class="col-12 d-grid"><input type="submit" class="btn btn-primary"  value="로그인"></div> -->
              <!-- btn -->
             <div class="col-12 d-grid"> <button id="btnSearch" class="btn btn-primary" onclick="loginChk(m_id.value, m_pw.value)">로그인</button>
             	 <!-- link -->
              <div>회원이 아니신가요? <a href="memberJoin">회원 가입하기</a></div>
           	 </div>
            
              
<!-- 		</form> -->
             
        
        </div>
      </div>
</section>
	

<%@ include file="../common/footerFo.jsp"  %>
</body>
</html>