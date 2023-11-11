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
 <p class="fs-2 mb-8">${mq.mq_title }</p>	 
  
<div class="card mb-10">
  <div class="card-header">
    <h6 class="card-title">작성자</h6>
    	<span style="font-size: 15px;"> 
    	<strong>${mq.m_id } <small>(${mq.m_name })</small> </strong>
    	</span>

  </div>
	
  <div class="card-header">
    <h6 class="card-title">작성일</h6>
    	<span style="font-size: 15px;"> 
    	<strong><fmt:formatDate value="${mq.mq_date }" pattern="yyyy-MM-dd 일 HH:mm 분"/></strong>
    	</span>

  </div>
</div>	

<hr>
		<div class="mb-15">
		<p class="fw-bold">${mq.mq_content }</p>
		</div>		
	
<div class="d-grid gap-2 col-6 mx-auto">
    <a href="memberQnaList" class="btn btn-primary">목록으로</a>
</div>

<%@ include file="../common/footerFo.jsp" %>

</body>
</html>