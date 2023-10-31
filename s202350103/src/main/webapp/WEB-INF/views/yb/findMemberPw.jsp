<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
  <title>Forget Password eCommerce HTML Template - FreshCart </title>
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/favicon.ico">


<!-- Libs CSS -->
<link href="../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
<link href="../assets/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
<link href="../assets/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">


<!-- Theme CSS -->
<link rel="stylesheet" href="../assets/css/theme.min.css">
<!-- Google tag (gtag.js) -->


<script language="javascript">
	function view(arg) {
		var t1 = document.getElementById("tb1");
		var t2 = document.getElementById("tb2");
		

		
		if(arg == 1) {
			t1.style.display="block";
			t2.style.display="none";
		}
		else if(arg == 2){
			t2.style.display="block";
			t1.style.display="none";
		} else {
			t1.style.display="block";
			t2.style.display="none";
		}
	}
</script>
<style type="text/css">
	#kindBtn {
		background: #0aad0a; 
		color: white;
		border: 0px; 
		margin: 10px;
	}
	#kindBtn:active {
		background: white;
		color: #0aad0a; 
	}
</style>
<!-- End Tag -->
</head>

<body>

  <!-- navigation -->
<div class="border-bottom shadow-sm">
  <nav class="navbar navbar-light py-2">
    <div class="container justify-content-center justify-content-lg-between">
      <a class="navbar-brand" href="../index.html">
        <img src="../assets/images/logo/freshcart-logo.svg" alt="" class="d-inline-block align-text-top">
      </a>
      <span class="navbar-text">
        이미 계정이 있으신가요? <a href="loginForm">로그인</a>
      </span>
    </div>
  </nav>
</div>

 
  <main>
<!-- section -->
  <section class="my-lg-14 my-8">
    <!-- container -->
    <div class="container" align="center">
      <!-- row -->
      <div class="row justify-content-center align-items-center">

        <div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1 d-flex align-items-center">
        	<div class="mb-lg-9 mb-5">
              <!-- heading -->
              <h1 class="mb-2 h2 fw-bold">비밀번호 찾기</h1>
              <p>이메일 또는 문자를 통해 인증번호 받고 비밀번호 찾으세요</p>
                
                <div class="row justify-content-center align-items-center" align="center">
                <input type="button" value="이메일로 찾기"	id="kindBtn"  onClick="view(1)">
				<input type="button" value="번호로 찾기"	id="kindBtn"  onClick="view(2)"><p>	
				<form>
	         		<table id="tb1" cellpadding="10px" >
	   
						<tr><td>
								<div class="col-12">
		                 			<!-- input -->
		                 			<input type="email" class="form-control" id="inputEmail4" placeholder="Email을 입력하세요" required>
		               			</div>
		               		</td>
		               	</tr>
						<tr><td>
								<div class="row g-3">
		               				<div class="col-12 d-grid gap-2"> <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
		                 			<a href="signup.html" class="btn btn-light">Back</a>
		               				</div>
		             			</div>
		             		</td></tr>
					</table>
				</form>	
				</div>
				<div class="row justify-content-center align-items-center" align="center" >
				<form>
	         		<table id="tb2" cellpadding="10px" style="display: none">
						<tr><td>
								<div class="col-12">
		                 			<!-- input -->
		                 			<input type="email" class="form-control" id="inputEmail4" placeholder="전화번호를 입력하세요" required>
		               			</div>
		               		</td>
		               	</tr>
						<tr><td>
								<div class="row g-3">
		               				<div class="col-12 d-grid gap-2"> <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
		                 			<a href="signup.html" class="btn btn-light">Back</a>
		               				</div>
		             			</div>
		             		</td></tr>
					</table>			
				</form>	
				</div>
          </div>
        </div>
      </div>
    </div>

  </section>
</main>






</body>
<%@ include file="../common/footerFo.jsp" %>
</html>