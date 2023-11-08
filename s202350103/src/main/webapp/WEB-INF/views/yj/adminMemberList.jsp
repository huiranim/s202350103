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

<div class="row mb-10">
<div class="col-lg-12">
      <div class="mb-8">
         <!-- heading -->
          <p class="fs-1 mb-3"><strong>회원조회</strong></p>
          <p class="fs-4 mb-5"><mark>총회원 : ${totalMember }</mark></p>
			
			<c:set var="num" value="${page.total-page.start+1 }"></c:set>
      </div>
      <div>
         <!-- table -->
         <div class="table-responsive">
            <table class="table text-nowrap">
               <thead class="table-light">
                     <tr >
					<th class="border border-success">No.</th>
					<th class="border border-success">회원번호</th>
					<th class="border border-success" >가입일</th>
					<th class="border border-success">아이디</th>
					<th class="border border-success">이름</th>
					<th class="border border-success">연락처</th>
					<th class="border border-success">주소</th>
					<th class="border border-success">이메일</th>
					<th class="border border-success">생년월일</th>
					<th class="border border-success">보유포인트</th>
					<th class="border border-success">탈퇴여부</th>
					</tr>
               </thead>
               
               <tbody>
               		<c:forEach items="${adminMemberList }" var="member">
               
                  <tr>
                   		<td class="align-middle ">${num }</td>
						<td class="align-middle">${member.m_num }</td>
						<td class="align-middle " ><fmt:formatDate value="${member.m_date }" pattern="yyyy-MM-dd" /></td>
						<td class="align-middle ">${member.m_id }</td>
						<td class="align-middle ">${member.m_name }</td>
						<td class="align-middle ">${member.m_ph }</td>
						<td class="align-middle ">${member.m_addr }</td>
						<td class="align-middle ">${member.m_email }</td>
						<td class="align-middle ">${member.m_birth }</td>
						<td class="align-middle ">${member.m_point }</td>
						<td class="align-middle ">${member.m_wd }</td>
                     	
                  </tr>
                      <c:set var="num" value="${num-1}"></c:set>
                  </c:forEach>
     </tbody>
   </table>
   
   
   </div>
 </div>
 </div>
 </div>

  <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">

			 	<c:if test="${page.startPage > page.pageBlock }">
					 <li class="pagination justify-content-center">					
						<a class="page-link" href="adminMemberList?currentPage=${page.startPage-page.pageBlock}">이전</a>
					</li>
				</c:if>
 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					 <li class="pagination justify-content-center">
 						<a class="page-link" href="adminMemberList?currentPage=${i}">${i}</a>&nbsp;&nbsp;
					</li>
				</c:forEach>
					
				<c:if test="${page.endPage < page.totalPage }">
					 <li class="pagination justify-content-center">		 
						<a class="page-link" href="adminMemberList?currentPage=${page.startPage+page.pageBlock}">다음</a>
					</li>
				</c:if>
		</ul>
	</nav>
   



</body>
</html>