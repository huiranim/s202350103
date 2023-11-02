<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
  <title>Forget Password eCommerce HTML Template - DaDok </title>
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/favicon.ico">


<!-- Libs CSS -->
<link href="../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
<link href="../assets/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
<link href="../assets/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">


<!-- Theme CSS -->
<link rel="stylesheet" href="../assets/css/theme.min.css">
<!-- Google tag (gtag.js) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    function sendNumber(){
        $("#mail_number").css("display","block");
        $.ajax({
            url:"/mail",
            type:"post",
            dataType:"json",
            data:{"mail" : $("#mail").val()},
            success: function(data){
                alert("인증번호 발송");
                $("#Confirm").attr("value",data);
            }
        });
    }

    function confirmNumber(){
        var number1 = $("#number").val();
        var number2 = $("#Confirm").val();

        if(number1 == number2){
            alert("인증되었습니다.");
        }else{
            alert("번호가 다릅니다.");
        }
    }
    
    function view(arg) {
		var tb1 = document.getElementById("tb1");
		var tb2 = document.getElementById("tb2");
		

		
		if(arg == 1) {
			tb1.style.display="block";
			tb2.style.display="none";
		}
		else {
			tb2.style.display="block";
			tb1.style.display="none";
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
              <h1 class="mb-2 h2 fw-bold" style="margin-bottom: 30px;">비밀번호 찾기</h1>
              <p>이메일 또는 문자를 통해 인증번호 받고 비밀번호 찾으세요.</p>
              <input type="button" value="이메일로 찾기"  id="kindBtn"  onClick="view(1)" class="btn btn-primary">
			  <input type="button" value="번호로 찾기"	  id="kindBtn"  onClick="view(2)" class="btn btn-primary"><p>	
              <div class="row justify-content-center align-items-center" align="center" style="margin-right: 20px;">             
	         		<form method="post" action="/mail">
	         		<table id="tb1" cellpadding="10px" style="margin-left: 50px; " >	   
						<tr><td>
								<div class="col-12">
		                 			<div id="mail_input" name="mail_input">
		                 			<input type="text" class="form-control" name="mail" id="mail" placeholder="Email을 입력하세요" required>
		               				<button type="button" id="sendBtn" name="sendBtn" onclick="sendNumber()">인증번호</button>
		               				</div>
		               			</div>
		               		</td>
		               	</tr>
						<tr>
							<td>
								<div class="row g-3">
		               				<div class="col-12 d-grid gap-2">
		               				 <div id="mail_number" name="mail_number" style="display: none">
    									<input type="text" name="number" id="number" placeholder="인증번호 입력">
    									<button type="button" name="confirmBtn" id="confirmBtn" onclick="confirmNumber()">이메일 인증</button>
  									</div>
  									<input type="text" id="Confirm" name="Confirm" style="display: none" value="">
		                 			<a href="loginForm" class="btn btn-light">Back</a>
		               				</div>
		             			</div>
		             		</td>
		             	</tr>
					</table>
					</form>
	         		<table id="tb2" cellpadding="10px" style="display: none; margin-left: 35px; ">
						<tr>
							<td>
		                 			<input type="email" class="form-control" id="inputPassword" placeholder="전화번호를 입력하세요" required>
		   
		               		</td>
		               	</tr>
						<tr>
							<td>
								<div class="row g-3">
		               				<div class="col-12 d-grid gap-2"> <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
		                 			<a href="loginForm" class="btn btn-light">Back</a>
		               				</div>
		             			</div>
		             		</td>
		             	</tr>
					</table>			

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