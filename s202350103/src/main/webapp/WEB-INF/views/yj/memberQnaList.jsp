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
	
	<div class="row">
<div class="col-lg-12">
      <div class="mb-8">
         <!-- heading -->
         <h1 class="mb-1">Q & A</h1>
         <p>요청 또는 문의 사항을 남겨주세요.</p>
      </div>
      
      <div>
         <!-- table -->
         <div class="table-responsive">
            <table class="table text-nowrap">
               <thead class="table-light">
                  <tr>
                     <th>No</th>
                     <th>제목</th>
                     <th>내용</th>
                     <th>작성일</th>
                  </tr>
               </thead>
               <tbody>
    	           <tr>
                    ${memberQnaList }
                    
                    
                 <%--    <c:forEach items=" ${memberQnaList }" var="mq">
    	                 <td class="align-middle">${mq.mq_title }</td>
    	                 <td class="align-middle">${mq.mq_content }</td>
    	                 <td class="align-middle">${mq.mq_date }</td>
                    </c:forEach> --%>
                     
                  </tr>
     </tbody>
   </table>
   </div>
 </div>
 </div>
 </div>

<%@ include file="../common/footerFo.jsp" %>

</body>
</html>