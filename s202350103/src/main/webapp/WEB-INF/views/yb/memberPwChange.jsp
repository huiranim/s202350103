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
      alert("비밀번호 체크")
      
      $.ajax({
         url:"<%=request.getContextPath()%>/changePwChk",
         data : {m_pw : m_pw,
                 m_pw2 : m_pw2},
         dataType : 'text',
         success : function(result) {
            if(result == 1) {
            	alert("비밀번호 일치 -> 변경되었습니다.");
				$('#msg').html("비밀번호가 일치합니다.");
				$('#msg').css("color", "red");
             	location.href = "memberChangePw="+m_pw;
             	return true;
            } else {
            	alert("비밀번호 불일치");
            	$('#msg').html("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
				$('#msg').css("color", "red");
				$('#m_pw2').val('');
				return false;
            }
         }
         
      });
   }

</script>

<body>		
<%@ include file="../common/sideFo.jsp" %>

		<hr class="my-10">
           <div class="pe-lg-14" style="align-items: center;">
             <h5 class="mb-4">비밀번호 변경하기</h5>
             <form class=" row row-cols-1 row-cols-lg-2" style="text-align: center;">
             	<div>
	               <div class="mb-3 col">
	                 <label class="form-label">새 비밀번호</label>
	                 <input type="password" class="form-control" placeholder="**********" id="m_pw" name="m_pw">
	               </div> <p>
	               <div class="mb-3 col">
	                 <label class="form-label">비밀번호 확인</label>
	                 <input type="password" class="form-control" placeholder="**********" id="m_pw2" name="m_pw2">
	               </div>
	               <div id="msg" style="text-align: center;"></div>
	               <div class="col-12">
	                 <p class="mb-4">Can’t remember your current password?<a href="#"> Reset your password.</a></p>
	                 <a href="#" class="btn btn-primary" onclick="passwordChk(m_pw.value, m_pw2.value)">Save Password</a>
	               </div>
             	</div>
             </form>
           </div>




<%@ include file="../common/footerFo.jsp" %>
</body>
</html>