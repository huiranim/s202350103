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
    <c:set var="num" value="${page.total-page.start+1 }"></c:set>
	  
      <div>
         <!-- table -->
         <div class="table-responsive">
            <table class="table text-nowrap">
               <thead class="table-light">
                  <tr>
                     <th>No. 작성일</th>
                     <th>제목</th>
                     <th>내용</th>
                     <th>글쓴이</th>
                  </tr>
               </thead>
               <tbody>
    	           <tr>
                    
                 <c:forEach items="${memberQnaList }" var="mq">
                    <tr> 
 	                 <td class="align-middle">
 	                 ${num } &nbsp;&nbsp;
 	                 <fmt:formatDate value="${mq.mq_date }" pattern="yyyy-MM-dd / HH:mm"/></td>
 	                 <td class="align-middle">${mq.mq_title }</td>
 	                 <td class="align-middle">${mq.mq_content }</td>
 	                 <td class="align-middle">${mq.m_id }</td>
 	                 
                  </tr>
                  <c:set var="num" value="${num-1}"></c:set>
                 </c:forEach>  
     </tbody>
   </table>
   
    <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">

			 	<c:if test="${page.startPage > page.pageBlock }">
					 <li class="pagination justify-content-center">					
						<a class="page-link" href="memberQnaList?currentPage=${page.startPage-page.pageBlock}">이전</a>
					</li>
				</c:if>
 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					 <li class="pagination justify-content-center">
 						<a class="page-link" href="memberQnaList?currentPage=${i}">${i}</a>&nbsp;&nbsp;
					</li>
				</c:forEach>
					
				<c:if test="${page.endPage < page.totalPage }">
					 <li class="pagination justify-content-center">		 
						<a class="page-link" href="memberQnaList?currentPage=${page.startPage+page.pageBlock}">다음</a>
					</li>
				</c:if>
		</ul>
	</nav>
   
   
   </div>
 </div>
 </div>
 </div>

<%@ include file="../common/footerFo.jsp" %>

</body>
</html>