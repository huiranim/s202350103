<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%> 
<%@ include file="../common/headerFo.jsp" %> 
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	#passwordToggler {
		border: 0px;
		background: none;
	}
</style>
<script type="text/javascript" src="../assets/js/jquery.js"></script>
<script type="text/javascript">
   function passwordChk(m_pw, m_pw2) {
      
      $.ajax({
         url:"<%=request.getContextPath()%>/changePwChk",
         data : {m_pw : m_pw,
                 m_pw2 : m_pw2},
         dataType : 'text',
         success : function(result) {
            if(result == 1) {
				$('#msg').html("비밀번호가 일치합니다.");
				$('#msg').css("color", "#0aad0a");
				$('#passwordSave').attr("disabled", false);
            } else if(result == 2) {
            	$('#msg').html("비밀번호는 영문, 숫자, 특수문자 조합으로 8자에서 20자 사이여야 합니다. 다시 입력해주세요");
				$('#msg').css("color", "red");
				$('#m_pw2').val('');
				$('#passwordSave').attr("disabled", true);
            } else {
            	$('#msg').html("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
				$('#msg').css("color", "red");
				$('#m_pw2').val('');
				$('#passwordSave').attr("disabled", true);
            }
         }
         
      });
   }
   
   function passwordSave(m_num, m_pw) {
		if (confirm("변경하시겠습니까?") == true){   
			location.href = "memberPwChange?m_num="+m_num+"&m_pw="+m_pw;
		 }else{   
		     return false;
		 }
	}
	
</script>

<body>		
<section class="my-lg-14 my-8" style="width: 150%; ">
    <div class="container">
      <!-- row -->
      <div class="row justify-content-center align-items-center">
        <!-- col -->
        
        <div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1" style="align-items: center;">
          <div class="mb-lg-9 mb-5">
            <h1 class="mb-1 h2 fw-bold" style="text-align: center;">비밀번호 변경</h1>
            <p></p>
          </div>
		  <div id="msg" style="text-align: center;"></div><p>
<!-- 		<form action="memberLogin" method="get" name="frm" onsubmit="loginChk(m_id.value, m_pw.value)"> -->
            <div class="row g-3">
              <!-- row -->
			  <div>새 비밀번호 </div>
              <div class="col-12">
                <!-- input -->
                <input type="password" placeholder="**********" id="m_pw" name="m_pw" required="required" class="form-control">
              </div>
              <div class="col-12">
	                <!-- input -->
	              <div>비밀번호 확인</div>
	              <div class="password-field position-relative">
	      			<input type="password" placeholder="**********" id="m_pw2" name="m_pw2" required="required" class="form-control">
	      			<input type="hidden" name="m_num" value="${m_num }" id="m_num">
	      			<span><button id="passwordToggler" class="bi bi-eye-slash"></button></span>
	    		  </div>
              </div>
     		  <div class="col-12 d-grid"> <button class="btn btn-primary" onclick="passwordChk(m_pw.value, m_pw2.value)" id="">비밀번호 확인</button>
             	 <!-- link -->
           	  </div>
			  <div id="msg" style="text-align: center;"></div>	
             
<!--               <div class="col-12 d-grid"><input type="submit" class="btn btn-primary"  value="로그인"></div> -->
              <!-- btn -->
             <div class="col-12 d-grid"> <button class="btn btn-primary" onclick="passwordSave(m_num.value, m_pw.value)" id="passwordSave" disabled="true">비밀번호 저장</button>
             	 <!-- link -->
           	 </div>
            
              
<!-- 		</form> -->
             
        
        </div>
       </div>
      </div>
   </div>
</section>


<%@ include file="../common/footerFo.jsp" %>
</body>
<script type="text/javascript">

	// 비밀번호 type 바꾸기
	const passwordToggler = document.getElementById("passwordToggler");
	const pwInput = document.getElementById("m_pw2");
	
	passwordToggler.addEventListener("click", function() {
	
	  const currentType = pwInput.type;
	
	  if (currentType === "text") {
		  pwInput.type = "password";
	  } else if (currentType === "password") {
		  pwInput.type = "text";
	  }
	});

</script>

</html>