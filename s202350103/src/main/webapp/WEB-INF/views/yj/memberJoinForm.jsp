<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 카카오  주소 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
		{
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress")
						.focus();
			}
		}).open();
	}
</script>


</head>
<body>

<div class="card -4mb bg-light border-0" style="font-size: 18px;">
<div class="row my-10">
 <!-- col -->
 <div class="offset-lg-1 col-lg-10 col-12">
    <div class="mb-8">
       <!-- heading -->
       <h1 class="h3">DADOK 회원가입</h1>
	       <div class="lead mb-0"  style="font-size: 15px;">
			      원활한 회원가입을 위해 <a href="#!">
	    	   	 본인 명의 휴대전화와 이메일 주소를 올바르게 입력 해주세요.</a>
	       </div>
    </div>
    
    
   <form action="memberJoinAction" method="post" id="frm" onsubmit="return valiForm();">
	 <div class="col-lg-7">
		<div class="input-group mb-1">
				아이디 &nbsp;&nbsp;
			 <input type="text"  class="form-control"  id="m_id" name="m_id" maxlength="13" placeholder="아이디를 입력해주세요" required="required" value="${m_id }">
			  <button class="btn btn-outline-secondary btn-rounded" type="button" id="button-addon2" onclick="chkId()">중복확인</button> &nbsp;&nbsp;&nbsp;&nbsp;

				<c:if test="${not empty no}">
					<small class="text-muted"  style="color: red;">${no}</small>
				</c:if>
		
				<c:if test="${not empty ok}">
					<small class="text-muted"  style="color: red;">${ok}</small>
				</c:if><p>
		</div>
	</div>
		<mark style="font-size: 13px;">(6자 ~ 12자라의 영문자, 숫자 / @,#,$ 등 특수문자는 제외)</mark><p>



 	<div class="col-lg-6">
		<div class="input-group mb-5 ">
				이름 &nbsp;&nbsp;
		 <input type="text" class="form-control" id="m_name" name="m_name" placeholder="이름을 입력해주세요." required="required"><p>

		</div>
	</div>

	
	<div class="col-lg-12">
	<div class="input-group mb-5">
			  	이메일 &nbsp;&nbsp;
	   <input type="text" class="form-control" id="m_email1" name="m_email1"  required="required">
	  	 <span class="input-group-text" style="background: #dfe2e1;">@</span>
	   	<input type="text" class="form-control" id="m_email2" name="m_email2" required="required"> 
 	
		<select name="m_email" class="form-select" >
			<option value="naver.com">naver.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="daum.com">daum.com</option>
			<option value="hanmail.com">hanmail.com</option>
			<option value="nate.com">nate.com</option>
			<option value="yahoo.com">yahoo.com</option>
			<option selected="selected" >직접 입력</option>
		</select><p>
 	</div>
	</div>
	
	
	<div class="col-lg-6">
		<div class="input-group mb-1 ">
				비밀번호 &nbsp;&nbsp;
		<input type="password" class="form-control" id="m_pw" name="m_pw" placeholder="비밀번호를 입력해주세요"  required="required"><p>

		</div>
	</div>	
	<mark style="font-size: 13px;">영문,숫자,특수문자 조합하여 8자~20자리</mark><p>
		
		
	<div class="col-lg-8">
		<div class="input-group mb-5 ">
				비밀번호 재입력  &nbsp;&nbsp;
		 <input type="password" class="form-control" id="pw_ck" placeholder="비밀번호를  다시 입력해 주세요"  required="required"><p>
		</div>
	</div>	
		

	 <div class="col-lg-7">
		<div class="input-group mb-5 ">
				휴대전화 &nbsp;&nbsp;
		<input type="text" class="form-control" size="3" maxlength="3" id="m_ph1" name="m_ph1" required="required" value="010"> &nbsp;&nbsp;
		-  &nbsp;&nbsp; <input type="text" class="form-control" size="4" maxlength="4" id="m_ph2" name="m_ph2" required="required">&nbsp;&nbsp;
		-  &nbsp;&nbsp; <input type="text" class="form-control" size="4" maxlength="4" id="m_ph3" name="m_ph3" required="required">
		</div>
	</div>		
	
	
	<div class="col-lg-7">
	  <div class="input-group mb-5">
			    생년월일 &nbsp;&nbsp;
	    <input type="text" class="form-control" id="m_birth" name="m_birth" maxlength="6" placeholder="ex) 201001"> &nbsp;&nbsp; 
	    -  &nbsp;&nbsp; 
	    	<div class="col-lg-1">
		      <input type="text" class="form-control" id="m_birth1" name="m_birth1" size="3" maxlength="1">&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*
	    	</div>
	    </div>
	  </div>
	</div>
	
	
		<small>생년월일 6 자리와 앞 1 자리 를 입력하세요</small><p>

		주소
		<input type="text" name="m_addr1" id="sample6_postcode" placeholder="주소검색 버튼을 이용해주세요" required="required" >
		<input type="button" onclick="sample6_execDaumPostcode()" value="주소 검색"><p>
		<input type="text" name="m_addr2" id="sample6_address" placeholder="주소" required="required">&nbsp;&nbsp;
		<input type="text" id="sample6_extraAddress" placeholder="참고항목" ><p>
		
		상세주소입력 <input type="text" name="m_addr" id="sample6_detailAddress" placeholder="상세주소를 입력해주세요"  required="required"><p>

		추천인 <input type="text" id="m_reid" name="m_reid" placeholder="추천인 아이디를 입력해주세요 : 선택 "><p>

		<input type="submit" value="회원 가입하기">
	
	</form>
   
   
   
 
 
  </div>
</div>
</div>


<%@ include file="../common/footerFo.jsp" %>

</body>
</html>