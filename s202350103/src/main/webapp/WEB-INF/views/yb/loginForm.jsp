<%@page import="com.choongang.s202350103.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"  %>



<!DOCTYPE html>
<html>

<script type="text/javascript" src="../assets/js/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">

	
$(function(){
	fn_login();
	fn_displayRememberId();
});

function fn_login() {
	$('#frm_login').submit(function(event){ // submit을 취소할 수 있게끔 event 객체를 잡아준다.
		
		// 아이디 저장
		if($('#rememberId').is(':checked')) {
			alert("아이디 저장 실행")// Java에서 쿠키를 처리하려면 Service단에서 Cookie 클래스를 이용하여 request에 저장해주는 방식을 사용했다.
			$.cookie('rememberId', $('#m_id').val()); // 쿠키ID, 값 순으로 저장을 하면 편리
		} else {
			$.cookie('rememberId', '');
		}											
		
	});
}

function fn_displayRememberId() {
	// 아이디저장 쿠키 불러오기
	let rememberId = $.cookie('rememberId');
	if(rememberId == '') {
		$('#m_id').val('');
		$('#rememberId').prop('checked', false); // check 해제
	} else {
		$('#m_id').val(rememberId);
		$('#rememberId').prop('checked', true); // check 해제
	}
	
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
            <p style="text-align: center;">다독에 오신걸 환영합니다.<br> 로그인하여 이용해주시길 바랍니다.</p>
          </div>

          <form action="memberLogin" method="post" name="frm" onsubmit="member_chk()">                  
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
                  <input class="form-check-input" type="checkbox" id="rememberId" name="rememberId" >
                  <!-- label --> <label class="form-check-label" for="rememberId">
                    	아이디 기억하기
                  </label>
                  
                </div>
                <div> 계정을 잊어버리셨나요? <a href="memberFindAccount">계정 찾기</a></div>
              </div>

             
              <!-- btn -->
              <div class="col-12 d-grid"> <button type="submit" class="btn btn-primary">로그인</button>
              </div>
              <!-- link -->
              <div>회원이 아니신가요? <a href="memberJoin">회원 가입하기</a></div>
            </div>
          </form>
        </div>
      </div>
    </div>
</section>
	

<%@ include file="../common/footerFo.jsp"  %>
</body>
</html>