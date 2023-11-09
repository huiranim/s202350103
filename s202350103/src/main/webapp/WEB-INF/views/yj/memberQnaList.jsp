<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function adminCon(){
		
		alert("관리자만 접근가능한 게시물 입니다. ");
		
	}


</script>

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
 	                 
 	                 <c:choose>
 						<c:when test="${mq.mq_hidden == 1}">
 					      <td class="align-middle">
 					      	<i class="bi bi-lock-fill"></i>  &nbsp;
 					      	 <c:if test="${sessionScope.member != null }">
                 			 	  <c:if test="${member.m_admin == 1 }">
            	          			  <a href="memberQInfo?mq_num=${mq.mq_num }" style="color: #5c6c75;">비밀 글 입니다.</a>
                   				 </c:if>


                  				  <c:if test="${member.m_admin != 1 }">
			                        <a href="javascript:void(0);" style="color: #5c6c75;" onclick="adminCon();">비밀 글 입니다.</a>
        			            </c:if>
                			</c:if>
                			
			                <c:if test="${sessionScope.member == null }">
			                    <a href="javascript:void(0);" style="color: #5c6c75;" onclick="adminCon();">비밀 글 입니다.</a>
			                </c:if>
 	
 					      </td>
 							 <td class="align-middle">
 							 	<c:set var="maskId" value="${fn:substring(mq.m_id,0,3) }****"/>
								<c:out value="${maskId }"/>
 							 </td>
 							
 						</c:when>	                 
	 	                 
	 	                 <c:otherwise>
	 	                 
	 	                 <td class="align-middle">
	 	                 <a href="memberQInfo?mq_num=${mq.mq_num }" style="color: #5c6c75;">
	 	                 	<strong>${mq.mq_title }</strong>
	 	                </a> 	
 	                 	</td>
 	                 	
 	                 			
	 	                 <td class="align-middle">${mq.m_id }</td>
 	                 
	 	                 </c:otherwise>
 	                 
 	                 
 	                 </c:choose>
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