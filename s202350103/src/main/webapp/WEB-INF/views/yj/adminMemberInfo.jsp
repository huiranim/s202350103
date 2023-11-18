<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
	function adminMemberupdate(){
		
		var con = confirm("수정하시겠습니까?");
		
		if(con == true ){
			alert("정상 수정 되었습니다.");
			return true;
		}else{
			return false;
		}
		
	}


</script>

<script type="text/javascript">
	
	function adminMemberDelete(){
		var delcon = confirm("해당 회원을 삭제하시겠습니까?");
		
		if(delcon == true){
			alert("삭제 처리 되었습니다.");
			return true;
		}else{
			return false;
		}
	}


</script>

<script type="text/javascript">
	
	// 회원 이미지 선택 팝업창
	function memberImageSelect() {

		// 화면 중앙 팝업창
		var width = 600;
		var height = 400;
		var left = (window.innerWidth - width) / 2;
		var top = (window.innerHeight - height) / 2;
		
		window.open("memberImageSelect", "이미지 선택", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	}

</script>

<script type="text/javascript">

	// 선택한 이미지로 변경
	function changeImage(imageUrl) {
	    var imageElement = document.getElementById("memberImage"); //  이미지의 ID를 가져옴
	    imageElement.src = imageUrl; // 이미지의 src 속성을 선택한 이미지의 url 로 변경
		
	    // 변경한 이미지 url 을 임시 저장
	    m_image = imageUrl;
	    
	    // input 태그에 이미지 url 노출
	    var inputElement = document.getElementById("m_image");	// input 태그의 ID를 가져옴
	    inputElement.value = m_image; // input 태그의 value 속성에 이미지 url 추가
	}

</script>


</head>
<body>
	
	    <div class="mb-8">
         <!-- heading -->
          <p class="fs-1 mb-3"><strong>${member.m_name} 님 (${member.m_id })</strong> 
          	<c:if test="${member.m_admin == 1}">
          		<span style="color: green; font-size: 18px;"> * 해당 회원은 관리자 입니다.*</span>
          	</c:if>
          </p>
			  <p class="fs-4 mb-5">회원번호 : <mark >${member.m_num}</mark></p>	
			  <p> 가입일 : 
			  <span class="mb-9" style="color: red;">
				 <fmt:formatDate value="${member.m_date }" pattern="yyyy-MM-dd 일  HH 시 ss 분"/>
			  </span>
			  </p>
		  
		  	<c:if test="${member.m_wd == 1}">
			  	<div class="fs-4 mb-5" style="color:#581313; font-size: 16px; font-weight: bold;">
			  	<i class="bi bi-exclamation-triangle"></i>&nbsp;
			    	탈퇴한 회원
			  	</div>
		  	</c:if>

		  	<c:if test="${member.m_wd == 0}">
			  	<div class="fs-4 mb-5" style="color:#581313; font-size: 16px; font-weight: bold;">
			  	<i class="bi bi-check-circle-fill"></i>&nbsp;
			    	활동중인 회원
			  	</div>
		  	</c:if>



      </div>
<div class="offset-lg-2 col-lg-8 col-12">
       
       
          <!-- form -->
          <form class="row" action="adminMemberUpdate" method="post" id="frm" onsubmit="return adminMemberupdate();">
         
          <input type="hidden" name="m_num" value="${member.m_num }">
   	      <input type="hidden" id="m_image" name="m_image" value="${member.m_image }">
   	      <input type="hidden" id="m_admin" name="m_admin" value="${member.m_admin }">
         
          <div class="col-md-12 mb-8 text-center">   
          
           <div class="mb-1">
            <div style="text-align: right;">
           		 <a href="adminMemberDelete?m_num=${member.m_num }" onclick="return adminMemberDelete();">
	            	<i style="font-size: 30px; color: #581313;" class="bi bi-x-circle"></i>
            	</a>
	          </div>
            </div>
           
		  <div class="mb-3">
        	  	<a onclick="memberImageSelect();">
    	            <img src="${member.m_image }" id="memberImage" alt="회원이미지" class="rounded-circle"  style="max-width: 100%; height: auto;">
				</a>
           </div>

            </div>
              <div class="col-md-12 mb-8">
           		 <div class="form-check form-switch">
				  <input class="form-check-input" name="m_wd" type="checkbox" id="flexSwitchCheckDefault" value=1 >
				  <input type="hidden" name="m_wd" value=0>
					  <label class="form-check-label" for="flexSwitchCheckDefault">
					  	탈퇴 처리
					  <span class="text-danger">*</span>&nbsp;&nbsp;
					  	<small style="color: red;">해당 회원의 로그인 제한</small>
					  </label>
				</div>
				</div>
             
             
              <!-- input -->
            <div class="col-md-6 mb-3">
              <label class="form-label" for="fname">아이디<span class="text-danger">*</span></label>
              <input type="text" id="m_id" class="form-control" name="m_id" value="${member.m_id }" >
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="lname">회원 이름<span class="text-danger">*</span></label>
              <input type="text" id="m_name" class="form-control" name="m_name" value="${member.m_name }" >
            </div>
            <div class="col-md-6 mb-3">
              <label class="form-label" for="emailContact">이메일<span class="text-danger">*</span></label>
              <input type="email" id="m_email" name="m_email" class="form-control" value="${member.m_email }" >
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="phone">연락처<span class="text-danger">*</span></label>
              <input type="text" id="m_ph" name="m_ph" class="form-control" value="${member.m_ph }">
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="company">주소<span class="text-danger">*</span></label>
              <input type="text" id="m_addr" name="m_addr" class="form-control" value="${member.m_addr }">
            </div>
     
            <div class="col-md-6 mb-3">
              <label class="form-label" for="fname">생년월일<span class="text-danger">*</span></label>
              <input type="text" id="m_birth" class="form-control" name="m_birth" value="${member.m_birth }" >
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="lname">보유 포인트
              <span class="text-danger">*</span>
              </label><p>
              	 ${member.m_point } <span style="color: red;">P</span>
					&nbsp;&nbsp;<a href="selectMemberPoint?m_num=${member.m_num }" class="btn btn-primary">포인트 조정</a>
            </div>
            
              <div class="col-md-12 mb-8">
              <!-- input -->
              <label class="form-label" for="company">PW<span class="text-danger">*</span></label>
              <input type="password" id="m_pw" name="m_pw" class="form-control" value="${member.m_pw }">
            </div>
            
            
				<!-- Button Block -->
				<div class="d-grid gap-2 col-6 mx-auto">
				  <button class="btn btn-primary mb-3" type="submit">수정</button>
				  <a class="btn btn-primary" href="adminMemberList">목록으로</a>
				</div>
	          </form>
            </div>


<%@ include file="../common/footerFo.jsp" %>

</body>
</html>