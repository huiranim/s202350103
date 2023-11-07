<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
	function Con(){
		
		var con = confirm("문의 사항을 등록 하시겠습니까 ?");
		
		if(con == true){
			
			alert("정상 등록 되었습니다.");
		    return true;
		}else{
			return false;
		}
		
	}



</script>

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
          <form class="row" action="memberQInsert" method="post" id="frm" onsubmit="return Con();">
         
          <input type="hidden" name="m_num" value="${member.m_num }">
           
              <div class="col-md-12 mb-8">
           		 <div class="form-check form-switch">
				  <input class="form-check-input" name="mq_hidden" type="checkbox" id="flexSwitchCheckDefault" value=1 >
				  <input type="hidden" name="mq_hidden" value=0>
					  <label class="form-check-label" for="flexSwitchCheckDefault">
					  	비밀글로 작성하기 
					  <span class="text-danger">*</span>&nbsp;&nbsp;
					  	<small style="color: red;">나 와 관리자만 조회 할수 있습니다</small>
					  </label>
				</div>
				</div>

             
              <!-- input -->
            <div class="col-md-6 mb-3">
              <label class="form-label" for="fname">아이디<span class="text-danger">*</span></label>
              <input type="text" id="m_id" class="form-control" name="m_id" value="${member.m_id }" disabled="disabled">
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="lname">회원 이름<span class="text-danger">*</span></label>
              <input type="text" id="m_name" class="form-control" name="m_name" value="${member.m_name }" disabled="disabled">
            </div>
            <div class="col-md-6 mb-3">
              <label class="form-label" for="emailContact">이메일<span class="text-danger">*</span></label>
              <input type="email" id="m_email" name="m_email" class="form-control" value="${member.m_email }" disabled="disabled" >
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="phone">연락처<span class="text-danger">*</span></label>
              <input type="text" id="m_ph" name="m_ph" class="form-control" value="${member.m_ph }" disabled="disabled">
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="company">제목<span class="text-danger">*</span></label>
              <input type="text" id="mq_title" name="mq_title" class="form-control" placeholder="문의 제목을 입력하세요" required>
            </div>
     
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="comments">문의사항<span class="text-danger">*</span></label>
              <textarea rows="5" id="mq_content" name="mq_content" class="form-control" placeholder="문의 내용을 입력하세요" required="required"></textarea>
            </div>
				<!-- Button Block -->
				<div class="d-grid gap-2 col-6 mx-auto">
				  <button class="btn btn-primary" type="submit">전송</button>
				</div>
	          </form>
            </div>



	
	

<%@ include file="../common/footerFo.jsp" %>

</body>
</html>