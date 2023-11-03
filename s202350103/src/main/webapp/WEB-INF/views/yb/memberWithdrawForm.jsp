<%@page import="com.choongang.s202350103.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	function chk_pw(m_pw) {
		alert("비밀번호 확인 하자");
		alert(m_pw);
		
		<%-- var m_pw = $("#m_pw").val();
		$.ajax(
				{
					url:"<%=request.getContextPath()%>/memberChkPw",
					data : {m_pw : m_pw},
					dataType : 'text',
					success : function(memberPw) {
						alert('memberChkPw -> '+memberPw);
						if(m_pw == memberPw){
							$('#msg').val("비밀번호가 일치합니다.");
						} else {
							$('#msg').val("비밀번호가 일치합니다.");
						}
					}
				}	 --%>
		)
	}



	
	
</script>
</head>
<body>
<%@ include file="../common/headerFo.jsp" %>
<body>
<div class="container" style="text-align: center;">
	<form class="row" action="memberWithdrow" method="post">
	
	      <div class="mb-8">
       		<!-- heading -->
       		<h1 class="h3">DADOK 회원탈퇴</h1>
    	  </div>
          <!-- input -->
          <label class="form-label" for="comments"> 
          	<strong >탈퇴 시 유의사항</strong>
          </label><p>
     	  <div style="text-align: left;  margin-left: 200px;" >
- 회원 탈퇴시 포인트, 주문내역 등 일부 개인정보가 자동 삭제 됩니다.<br>
- 현재 배송중이거나 출고 이전의 주문이 있을 경우 상품 배송처리 문제로 탈퇴 불가합니다 (주문 취소 혹은 배송완료 후 탈퇴 가능)<p>
- 회원님의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률 제 6조 및 동법 시행령 제 6조에 의거하여 표시 및 광고에 관한 기록은  6개월,<br>
   계약 또는 청약 철회 등에 관한 기록은 5년, 대금결제 및 재화 공급 등의 공급에 관한 기록은 5년, 소비자 불만 또는 분쟁처리에 관한 기록은 3년간 기록됩니다. 
		  </div>	
      		<p><p>
      		<hr>
      		<p><p>
 			<div class="container">
 				<label class="form-label" for="comments"> 
          			<strong >비밀번호 입력</strong> <input type="password" name="m_pw" required="required" id="m_pw">
          			<button onclick="chk_pw(m_pw.value)">비밀번호 확인</button>
          			Message :  <span id="msg"></span><p>
          		</label><p>
 					개인정보 삭제 및 보유 포인트 소멸에 대한 안내를 모두 숙지하고 회원탈퇴에 대해 동의하여 주시기 바랍니다.<p>
 				<input class="form-check-input"  type="checkbox" value="ck1" id="ck1" required="required">
 				위 내용을 모두 숙지하였으며, 이에 동의합니다.
 			</div>
		
		<hr>
			<div class="d-grid gap-2 col-6 mx-auto ">
			 <button type="submit" class="btn btn-primary">확인</button>
			</div>
			
	
		</form>
	</div>
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>