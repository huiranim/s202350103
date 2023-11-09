<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%> 
<%@ include file="../common/headerFo.jsp" %> 
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	   alert("변경하시겠습니까?");
	   location.href = "memberPwChange?m_num="+m_num+"&m_pw="+m_pw;
   }
	
</script>

<body>		
<%@ include file="../common/sideFo.jsp" %>

		<hr class="my-10">
           <div class="container" style="text-align: center;">
             <h5 class="mb-4">비밀번호 변경하기</h5>
             <div class=" row row-cols-2 row-cols-lg-2" action="memberPwChange">
             	<div>
	               <div class="mb-3 col">
	                 <label class="form-label">새 비밀번호</label>
	                 <input type="password" class="form-control" placeholder="**********" id="m_pw" name="m_pw" required="required">
	               </div> <p>
	               <div class="mb-3 col">
	              	 <label class="form-label">비밀번호 확인</label>
	                 <input type="password" class="form-control" placeholder="**********" id="m_pw2" name="m_pw2" required="required"> 
	                 <input type="hidden" name="m_num" value="${m_num }" id="m_num"> 
	               </div>
	               <button class="btn btn btn-primary btn-sm" 
	                 		onclick="passwordChk(m_pw.value, m_pw2.value)" >비밀번호 확인</button>
	               <div id="msg" style="text-align: center;"></div>
	               <div class="col-12">
	                 <p class="mb-4">Can’t remember your current password?<a href="#"> Reset your password.</a></p>
	                 <button type="submit" class="btn btn btn-primary btn-sm" id="passwordSave" value="비밀번호 저장" disabled="true" onclick="passwordSave(m_num.value, m_pw.value)">비밀번호 저장</button>
	               </div>
             	</div>
             </div>
           </div>




<%@ include file="../common/footerFo.jsp" %>
</body>
</html>