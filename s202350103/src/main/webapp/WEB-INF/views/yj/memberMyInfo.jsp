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


<script type="text/javascript">
	// 아이디 중복검사
	function chkId() {
		var m_id = document.getElementById("m_id").value;

		// 정규식 6~12자 + @, #, $ 제외 , 영문자와 숫자 허용
		var regex = /^[a-zA-Z0-9]{6,12}$/;

		// 정규표현식 유효성 검사
		if (!regex.test(m_id)) {
			alert("아이디는 6자에서 12자 사이의 영문자와 숫자로만 작성해주세요.");
			frm.m_id.value = "";
			return false;
		} else { // 중복검사 
			location.href = "idConfirm?m_id=" + m_id;
			return true;
		}
	}
</script>

<script type="text/javascript">
function valiForm() {

	var isValid = true;

	// 이름 유효성 검사
	function nameCk() {
		var m_name = document.getElementById("m_name").value;
		// 특수문자 제외, 영문 대소문자,한글, 공백 허용
		var regex = /^[a-zA-Z가-힣\s]+$/;

		if (!regex.test(m_name)) {
			alert("이름에는 특수문자가 포함 될 수 없습니다.");
			frm.m_name.value = "";
			isValid = false;
		}
	}

	// 이메일 유효성 검사
	function emailCk() {
		var m_email1 = document.getElementById("m_email1").value;
		var m_email2 = document.getElementById("m_email2").value;
		// 특문 제외 영문숫자와 마침표. 만 허용
		var regex = /^[a-zA-Z0-9.]+$/;

		if (!regex.test(m_email1) || !regex.test(m_email2)) {
			alert("이메일은 영문자와 숫자로만 작성해주세요.");
			isValid = false;
		}
	}

	// 비밀번호 유효성 검사 
	function pwCk() {
		var m_pw = document.getElementById("m_pw").value;
		//  영문, 숫자, 특수문자 조합으로 8자~20자
		var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&*!])[A-Za-z\d@#$%^&*!]{8,20}$/;

		if (!regex.test(m_pw)) {
			alert("비밀번호는 영문, 숫자, 특수문자 조합으로 8자에서 20자 사이여야 합니다.");
			frm.m_pw.value ="";
			isValid = false;
		}
	}

	// 비밀번 재확인
	function valiPwCk() {
		var m_pw = document.getElementById("m_pw").value;
		var pw_ck = document.getElementById("pw_ck").value;

		if (m_pw !== pw_ck) {
			alert("비밀번호가 일치하지 않습니다");
			frm.pw_ck.value = "";
			isValid = false;
		}
	}

	// 전화번호 유효성 검사
	function phCk() {
		var m_ph1 = document.getElementById("m_ph1").value;
		var m_ph2 = document.getElementById("m_ph2").value;
		var m_ph3 = document.getElementById("m_ph3").value;

		// 숫자만 
		// ph1 은 010 까지 이므로 3자리까지 허용
		var regex1 = /^(02|010|031|[0-9]{3})$/;
		// ph2, 3은 4자리
		var regex = /^[0-9]{4}$/;

		if (!regex1.test(m_ph1)) {
			alert("전화번호는 숫자로 입력하세요.");
			isValid = false;
		}

		if (!regex.test(m_ph2)) {
			alert("전화번호는 숫자로 입력하세요.");
			isValid = false;
		}

		if (!regex.test(m_ph3)) {
			alert("전화번호는 숫자로 입력하세요.");
			isValid = false;
		}
	}

	// 생년월일 유효성 검사
	function birthCk() {
		var m_birth = document.getElementById("m_birth").value;

		// 6자리 숫자
		var regex = /^[0-9]{6}$/;

		if (!regex.test(m_birth)) {
			alert("생년월일을 6자리 숫자로 입력하세요.");
			isValid = false;
		}

	}

	// 성별란 유효성 검사 
	function genCk() {
		var m_birth1 = document.getElementById("m_birth1").value;
		// 성별 1~4 숫자 1자리
		var regex1 = /^[1-4]{1}$/;

		if (!regex1.test(m_birth1)) {
			alert("성별란을 확인하세요.");
			isValid = false;
		}
	}

	// form 제출 시 각각 input 호출하여 유효성 검사 
	nameCk();
	emailCk();
	pwCk();
	valiPwCk();
	phCk();
	birthCk();
	genCk();
	
	
	// 폼 제출 여부 결정
    if (!isValid) {
        return false; // 유효성 검사에서 실패한 경우 폼 제출 중단
    }

    // 유효성 검사 통과 시  폼 제출
    return true;
	
}

</script>



</head>
<body>

<div class="card -4mb bg-light border-0" style="font-size: 18px;">
<div class="row my-10">
 <!-- col -->
 <div class="offset-lg-1 col-lg-10 col-12">
    <div class="mb-10">
       <!-- heading -->
       <h1 class="h3">개인정보 수정</h1>
    </div>
    
    
   <form action="memberJoinAction" method="post" id="frm" onsubmit="return valiForm();">
	 <div class="col-lg-6">
		<div class="input-group mb-8">
				아이디 &nbsp;&nbsp;
			 <input type="text"  class="form-control"  id="m_id" name="m_id" maxlength="13" placeholder="아이디를 입력해주세요" required="required" value="${member.m_id }">
		</div>
	</div>



 	<div class="col-lg-6">
		<div class="input-group mb-8 ">
				이름 &nbsp;&nbsp;
		 <input type="text" class="form-control" id="m_name" name="m_name" placeholder="이름을 입력해주세요." required="required" value="${member.m_name }"><p>

		</div>
	</div>

		
	<div class="col-lg-11">
	    <div class="input-group mb-8">
	        이메일 &nbsp;&nbsp;
	        <input type="text" class="form-control" id="m_email1" name="m_email1" required="required">
	        <span class="input-group-text" style="background: #dfe2e1;">@</span>
	        <input type="text" class="form-control" id="m_email2" name="m_email2" required="required">
	        &nbsp;
	        <div class="col-lg-3">
	            <select name="m_email" class="form-select" id="emailSelect">
	                <option value="naver.com">naver.com</option>
	                <option value="gmail.com">gmail.com</option>
	                <option value="daum.com">daum.com</option>
	                <option value="hanmail.com">hanmail.com</option>
	                <option value="nate.com">nate.com</option>
	                <option value="yahoo.com">yahoo.com</option>
	                <option value="직접 입력" selected="selected">직접 입력</option>
	            </select>
	        </div>
	    </div>
	</div>
	

	 <div class="col-lg-7">
		<div class="input-group mb-8">
				휴대전화 &nbsp;&nbsp;
		<input type="text" class="form-control" size="3" maxlength="3" id="m_ph1" name="m_ph1" required="required" value="010"> &nbsp;&nbsp;
		-  &nbsp;&nbsp; <input type="text" class="form-control" size="4" maxlength="4" id="m_ph2" name="m_ph2" required="required">&nbsp;&nbsp;
		-  &nbsp;&nbsp; <input type="text" class="form-control" size="4" maxlength="4" id="m_ph3" name="m_ph3" required="required">
		</div>
	</div>		
	
	
	<div class="col-lg-8">
		<div class="input-group mb-2">
				주소  &nbsp;&nbsp;
			<input type="text" class="form-control"  name="m_addr1" id="sample6_postcode" placeholder="주소검색 버튼을 이용해주세요" required="required" readonly="readonly" >
				<div class="col-lg-3">
					<input type="button" class="form-control"  onclick="sample6_execDaumPostcode()" value="주소 변경" style="background: #d1e7dd;">
				</div>
		</div>
		
		<div class="input-group mb-2 ">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" class="form-control"  name="m_addr2" id="sample6_address" placeholder="주소" required="required" readonly="readonly">
		</div>	
		
		<div class="input-group mb-3 ">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목"  readonly="readonly"><p>
		</div>	
		
		
	<div class="col-lg-15">
		<div class="input-group mb-10 ">
				상세주소입력  &nbsp;&nbsp;
		 <input type="text" class="form-control"  name="m_addr" id="sample6_detailAddress" placeholder="상세주소를 입력해주세요"  required="required"><p>
		</div>
	</div>	
		
	
		
</div>
<hr>

	<div class="btn btn-ghost-primary mb-2 d-grid gap-2 col-6 mx-auto ">
		<button class="btn btn-primary" type="submit">회원 정보변경</button>
	</div>
</form>
   
   
 
  </div>
</div>
</div>


<script type="text/javascript">
	// ********* 이메일 처리 *********
	// 이메일 select 요소
	var emailSelect = document.getElementById("emailSelect");
	
	// m_email2 input 요소
	var mEmail2 = document.getElementById("m_email2");
	
	// select 요소의 change 이벤트 핸들러
	emailSelect.addEventListener("change", function() {
	    // 선택된 옵션의 값을 가져옴
	    var selectedOption = emailSelect.value;
	
	    // "직접 입력" 옵션을 선택한 경우 m_email2 입력 필드를 활성화하고 포커스를 설정
	    if (selectedOption === "직접 입력") {
	        mEmail2.removeAttribute("disabled");
	        mEmail2.value = ""; // 입력 필드 초기화
	        mEmail2.focus();
	    } else {
	        // 다른 옵션을 선택한 경우 m_email2 입력 필드를 비활성화하고 선택한 옵션 값이 설정됩니다.
	        mEmail2.setAttribute("disabled", "disabled");
	        mEmail2.value = selectedOption;
	    }
	});
	
	// 직접 입력시 폼 제출 
	document.getElementById("frm").addEventListener("submit", function(e) {
	    // 직접 입력 옵션이 선택되었을 때 m_email2 input 태그의 값을 설정
	    if (emailSelect.value === "직접 입력") {
	        mEmail2.removeAttribute("disabled");
	        mEmail2.value = mEmail2.value; // 직접 입력한 값을 그대로 설정
	    }
	    // 폼 제출
	    // e.preventDefault(); // 이 줄을 주석 처리하면 폼이 제출됨.
	});
	
	
</script>

<script type="text/javascript">
	// ********* 전화번호 처리 *********
	// 각 입력 필드의 최대 길이 지정
	var maxLength = 4;

	// 각 입력 필드의 이벤트 리스너 추가
	document.getElementById("m_ph1").addEventListener("input", function() {
		// this 키워드로 현재객체를 가르킴 
		// 현재 입력필드 값의 길이 > 지정최대값(4) 일때 
		// 현재 입력필드의  값 = 0 부터 지정최대값(4) 
		// 이후 현재 값이 최대값일 때 다음으로 포커스 이동
		if (this.value.length > maxLength) {
			this.value = this.value.slice(0, maxLength);
		}
		// 입력이 최대값에 도달하면 두 번째 입력 필드로 포커스를 이동
		if (this.value.length === maxLength) {
			document.getElementById("m_ph2").focus();
		}
	});

	document.getElementById("m_ph2").addEventListener("input", function() {
		if (this.value.length > maxLength) {
			this.value = this.value.slice(0, maxLength);
		}
		if (this.value.length === maxLength) {
			document.getElementById("m_ph3").focus();
		}
	});

	document.getElementById("m_ph3").addEventListener("input", function() {
		if (this.value.length > maxLength) {
			this.value = this.value.slice(0, maxLength);
		}
	});
</script>




<%@ include file="../common/footerFo.jsp" %>

</body>
</html>