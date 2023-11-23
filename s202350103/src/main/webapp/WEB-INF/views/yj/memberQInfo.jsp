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

<c:set value="${memberQInfo }" var="mq"/>
	<div class="card mb-8" style="border-left: none; border-right: none; border-top: none;" >
	  <div class="card-header">
		  <div class="mb-3">
			<span style="color: #024098;">Q&A</span>
		  </div>	
	
		<div class="mb-3" style="display: flex; align-items: center;">
		    <h2>${mq.mq_title}</h2>
		</div>
		
		<div class="mb-2">
		    <span style="font-size: 15px;">
		        <strong><fmt:formatDate value="${mq.mq_date}" pattern="yyyy 년 MM 월 dd 일 HH:mm"/></strong>
		    </span>
		</div>
	
		<div class="mb-3">
			<img alt="" src="${mq.m_image }" width="35px;" height="35px;" class="rounded-circle"> &nbsp;
		    	<span style="font-size: 20px;"> 
		    	<strong>${mq.m_id } <small>(${mq.m_name})</small></strong>
		    	</span>
		</div>
	
	  </div>
	</div>	

		<div class="mb-15">
		<p style="font-size: 18px;">${mq.mq_content }</p>
		</div>		

		<div class="mb-8">
			<hr>	 	
		</div>		
	
		<div class="d-grid gap-2 col-3 mx-auto mb-10">
		    <a href="memberQnaList" class="btn btn-primary btn-success">목록</a>
		</div>
		
		<i class="bi bi-exclamation-circle"></i> 답변을 등록하시려면 로그인 해주세요.<br>
		<i class="bi bi-exclamation-circle"></i> 개인정보가 포함된 글에 대한 법적 책임은 글쓴이에게 있으니 유의하시기 바랍니다.
		
		
		
		<div class="mb-5" >
			<hr style="border-color: #c1c7c6;">	 	
		</div>		
		
		
		
		<div class="mb-5" style="display: grid; grid-template-columns: 1fr auto;">
		    <span style="color: #002b63; font-size: 18px; font-weight: bold;" >답변 2</span>
		    <button class="btn btn-success mb-2">답변 등록</button>
		</div>
		<div class="mb-8" >
			<hr style="border-color: #c1c7c6;">	 	
		</div>		
		
<c:forEach items="${mqReplyList }" var="reply">
	<div class="mb-6">
		<img alt="" src="${reply.m_image }" width="30px;" height="30px;" class="rounded-circle"> 
			&nbsp;${reply.m_id } (${reply.m_name })  &nbsp; |  &nbsp;
			<fmt:formatDate value="${reply.mqr_date }" pattern="yyyy 년 MM 월 dd 일 HH:mm"/>
	</div>
	
	
			
		<div style="display: grid; grid-template-columns: 1fr auto;">
			<div class="mb-15">
				<p style="font-size: 19px;">${reply.mqr_content }</p>
			</div>
			
		<div class="mb-5" style="display: flex; justify-content: flex-end; align-items: flex-end;">
			    <button class="btn btn-success">${reply.mqr_recomen }</button>&nbsp;&nbsp; 
			    <button class="btn btn-success">${reply.mqr_decl }</button>
			</div>
		</div>
	
	<hr>		

</c:forEach>

<%@ include file="../common/footerFo.jsp" %>

</body>
</html>