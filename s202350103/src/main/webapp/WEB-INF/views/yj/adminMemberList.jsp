<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>


      <div class="mb-8">
         <!-- heading -->
          <p class="fs-1 mb-3"><strong>회원조회</strong></p>
          <p class="fs-4 mb-5"><mark >총회원 : ${totalMember }</mark></p>
			
			<c:set var="num" value="${page.total-page.start+1 }"></c:set>
      </div>
  <div class="row justify-content-center">
  <div class="col-lg-12 col-md-12 col-12 d-block  container">
         <!-- table -->
         <div class="table-responsive">
            <table class="table text-nowrap">
               <thead class="table-light">
                     <tr>
					<th class="rounded-start">No. 가입일</th>
					<th class="rounded-0 ">회원번호</th>
					<th class="rounded-0 ">아이디</th>
					<th class="rounded-0 ">이름</th>
					<th class="rounded-0 ">보유포인트</th>
					<th class="rounded-end">상세조회</th>
					</tr>
               </thead>
               
               <tbody>
               		<c:forEach items="${adminMemberList }" var="member">
               
                  <tr>
                   		<td class="align-middle ">
                   		${num } / &nbsp;&nbsp;
                   		<fmt:formatDate value="${member.m_date }" pattern="yyyy-MM-dd" />
                   		</td>
						<td class="align-middle">${member.m_num }</td>
						<td class="align-middle ">${member.m_id }</td>
						<td class="align-middle ">${member.m_name }</td>
						<td class="align-middle ">${member.m_point } <span style="color: red;">P</span></td>
						<td class="align-middle ">
							<a href="adminMemberInfo?m_num=${member.m_num }" class="btn btn-soft-success mb-2">상세</a>
						</td>
                     	
                  </tr>
                      <c:set var="num" value="${num-1}"></c:set>
                  </c:forEach>
     </tbody>
   </table>
   
   
   </div>
 </div>
 </div>

  <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">

			 	<c:if test="${page.startPage > page.pageBlock }">
					 <li class="page-item justify-content-center">					
						<a class="page-link mx-1 text-body" href="adminMemberList?currentPage=${page.startPage-page.pageBlock}">이전</a>
					</li>
				</c:if>
 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					 <li class="page-item justify-content-center">
 						<a class="page-link mx-1 text-body" href="adminMemberList?currentPage=${i}">${i}</a>
					</li>
				</c:forEach>
					
				<c:if test="${page.endPage < page.totalPage }">
					 <li class="page-item justify-content-center">		 
						<a class="page-link mx-1 text-body" href="adminMemberList?currentPage=${page.startPage+page.pageBlock}">다음</a>
					</li>
				</c:if>
		</ul>
	</nav>
   


</body>
</html>