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
	
	<div class="offset-lg-2 col-lg-8 col-12">
          <div class="mb-8">
              <!-- heading -->
            <h1 class="h3"><p>요청 또는 문의 사항을 남겨주시면</p>
            	<span style="color: #6699FF;">신속하게 연락 드리겠습니다.</span> </h1>
            <p class="lead mb-0"><strong>상담이 필요하세요? 친절하게 답변드립니다.</strong> </p>
          </div>
        <div class="mb-4">
        	<img alt="QnA" class="img-fluid"  src="../assets/images/memberImage/QnA.jpg" width="600px" height="228px">
        </div>
          <!-- form -->
          <form class="row">
              <!-- input -->
            <div class="col-md-6 mb-3">
              <label class="form-label" for="fname">아이디<span class="text-danger">*</span></label>
              <input type="text" id="fname" class="form-control" name="fname" placeholder="아이디를 입력하세요" required>
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="lname">회원 이름<span class="text-danger">*</span></label>
              <input type="text" id="lname" class="form-control" name="lname" placeholder="회원이름을 입력하세요 " required>
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="company">제목<span class="text-danger">*</span></label>
              <input type="text" id="company" name="company" class="form-control" placeholder="문의 제목을 입력하세요" required>
            </div>
            <div class="col-md-6 mb-3">
              <label class="form-label" for="emailContact">이메일<span class="text-danger">*</span></label>
              <input type="email" id="emailContact" name="emailContact" class="form-control" placeholder="연락받을 이메일을 입력하세요" required >
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="phone">연락처<span class="text-danger">*</span></label>
              <input type="text" id="phone" name="phone" class="form-control" placeholder="연락받을 연락처를 입력하세요" required>
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="comments">문의사항<span class="text-danger">*</span></label>
              <textarea rows="5" id="comments" class="form-control" placeholder="문의 내용을 입력하세요"></textarea>
            </div>
				<!-- Button Block -->
				<div class="d-grid gap-2 col-6 mx-auto">
				  <button class="btn btn-primary" type="button">전송</button>
				</div>
	          </form>
            </div>



	
	

<%@ include file="../common/footerFo.jsp" %>

</body>
</html>