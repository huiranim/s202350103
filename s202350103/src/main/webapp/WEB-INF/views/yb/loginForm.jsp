<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"  %>



<!DOCTYPE html>
<html>

<script type="text/javascript">
	function mem_check() {
		if(frm.m_id.value != member.m_id) {
			alert("아이디 혹은 비밀번호를 다시 입력하세요.")
			return false;
		} else
		
	}
</script>
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
            <p style="text-align: center;">다독다독에 오신걸 환영합니다.<br> 로그인하여 이용해주시길 바랍니다.</p>
          </div>

          <form action="memberLogin" method="post" name="frm" onsubmit="member_chk()">                  
            <div class="row g-3">
              <!-- row -->
			
              <div class="col-12">
                <!-- input -->
                <input type="text" class="form-control" name="m_id" placeholder="아이디를 입력하세요" required>
              </div>
              <div class="col-12">
                <!-- input -->
              <div class="password-field position-relative">
      			<input type="password" name="m_pw" placeholder="비밀번호를 입력하세요" class="form-control" required >
      			<span><i id="passwordToggler"class="bi bi-eye-slash"></i></span>
    		  </div>

              </div>
              <div class="d-flex justify-content-between">
                <!-- form check -->
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="memberCheck" name="memberCheck" value="true" ${checked}>
                  <!-- label --> <label class="form-check-label" for="memberCheck">
                    	아이디 기억하기
                  </label>
                  
                </div>
                <div> 비밀번호를 잊으셨나요? <a href="findMemberPw">비밀번호 찾기</a></div>
              </div>

             
              <!-- btn -->
              <div class="col-12 d-grid"> <button type="submit" class="btn btn-primary">로그인</button>
              </div>
              <!-- link -->
              <div>이미 계정이 있으신가요? <a href="signup"> 회원가입</a></div>
            </div>
          </form>
        </div>
      </div>
    </div>
</section>
	

<%@ include file="../common/footerFo.jsp"  %>
</body>
</html>