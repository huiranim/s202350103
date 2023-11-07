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

<div class="row">
<div class="col-lg-12">
      <div class="mb-8">
         <!-- heading -->
         <h1 class="mb-1">회원조회</h1>
			<h4>총회원 : ${totalMember }</h4>
			
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
                  <tr>
                     <td class="align-middle">
                     </td>
                    
                     <td class="align-middle">
                     </td>
                   
                     <td class="align-middle">
                   
                     </td>
                     <td class="align-middle">$35.00</td>
                     <td class="align-middle"><span class="badge bg-success">In Stock</span></td>
                     <td class="align-middle">
                        <div class="btn btn-primary btn-sm">Add to Cart</div>
                     </td>
                     <td class="align-middle "><a href="#" class="text-muted" data-bs-toggle="tooltip" data-bs-placement="top" aria-label="Delete">
                        <i class="feather-icon icon-trash-2"></i>
                        </a>
                     </td>
                  </tr>
                  <tr>
                     <td class="align-middle">
                        <!-- form check -->
                        <div class="form-check">
                        <!-- input --><input class="form-check-input" type="checkbox" value="" id="chechboxThree">
                        <!-- label --><label class="form-check-label" for="chechboxThree">
                        </label>
                        </div>
                     </td>
                     <td class="align-middle">
                        <a href="#"><img src="../../assets/images/products/product-img-17.jpg" class="icon-shape icon-xxl" alt=""></a>
                     </td>
                     <td class="align-middle">
                        <div>
                        <h5 class="fs-6 mb-0"><a href="#" class="text-inherit">Fresh Kiwi</a></h5>
                        <small>4 no</small>
                        </div>
                     </td>
                     <td class="align-middle">$20.97</td>
                     <td class="align-middle"><span class="badge bg-danger">Out of Stock</span></td>
                     <td class="align-middle">
                        <div class="btn btn-dark btn-sm">Contact us</div>
                     </td>
                     <td class="align-middle "><a href="#" class="text-muted" data-bs-toggle="tooltip" data-bs-placement="top" aria-label="Delete">
                        <i class="feather-icon icon-trash-2"></i>
                        </a>
                     </td>
                  </tr>
                  <tr>
                     <td class="align-middle">
                        <!-- form check -->
                        <div class="form-check">
                         <!-- input --><input class="form-check-input" type="checkbox" value="" id="chechboxFour">
                          <!-- label --><label class="form-check-label" for="chechboxFour">
                     </label>
                        </div>
                     </td>
                     <td class="align-middle">
                        <a href="#"><img src="../../assets/images/products/product-img-16.jpg" class="icon-shape icon-xxl" alt=""></a>
                     </td>
                     <td class="align-middle">
                        <div>
                           <h5 class="fs-6 mb-0"><a href="#" class="text-inherit">Golden Pineapple</a></h5>
                             <small>2 no</small>
                        </div>
                     </td>
                     <td class="align-middle">$35.00</td>
                     <td class="align-middle"><span class="badge bg-success">In Stock</span></td>
                     <td class="align-middle">
                        <div class="btn btn-primary btn-sm">Add to Cart</div>
                     </td>
                     <td class="align-middle "><a href="#" class="text-muted" data-bs-toggle="tooltip" data-bs-placement="top" aria-label="Delete">
                        <i class="feather-icon icon-trash-2"></i>
                        </a>
                     </td>
                  </tr>
                  <tr>
                     <td class="align-middle">
                        <!-- form check -->
                        <div class="form-check">
                            <!-- input --><input class="form-check-input" type="checkbox" value="" id="chechboxFive">
                            <!-- label --><label class="form-check-label" for="chechboxFive">
                          </label>
                        </div>
                     </td>
                     <td class="align-middle">
                        <a href="#"><img src="../../assets/images/products/product-img-19.jpg" class="icon-shape icon-xxl" alt=""></a>
                     </td>
                     <td class="align-middle">
                        <div>
                         <h5 class="fs-6 mb-0"><a href="#" class="text-inherit">BeatRoot</a></h5>
                         <small>1 kg</small>
                        </div>
                     </td>
                     <td class="align-middle">$29.00</td>
                     <td class="align-middle"><span class="badge bg-success">In Stock</span></td>
                     <td class="align-middle">
                        <div class="btn btn-primary btn-sm">Add to Cart</div>
                     </td>
                     <td class="align-middle "><a href="#" class="text-muted" data-bs-toggle="tooltip" data-bs-placement="top" aria-label="Delete">
                        <i class="feather-icon icon-trash-2"></i>
                        </a>
                     </td>
                  </tr>
                  <tr>
                     <td class="align-middle">
                        <!-- form check -->
                        <div class="form-check">
                      <!-- input --><input class="form-check-input" type="checkbox" value="" id="chechboxSix">
                     <!-- label --><label class="form-check-label" for="chechboxSix">
                     </label>
                        </div>
                     </td>
                     <td class="align-middle">
                        <a href="#"><img src="../../assets/images/products/product-img-15.jpg" class="icon-shape icon-xxl" alt=""></a>
                     </td>
                     <td class="align-middle">
                        <div>
                     <h5 class="fs-6 mb-0"><a href="#" class="text-inherit">Fresh Apple</a></h5>
                        <small>2 kg</small>
                        </div>
                     </td>
                     <td class="align-middle">$70.00</td>
                     <td class="align-middle"><span class="badge bg-success">In Stock</span></td>
                     <td class="align-middle">
                        <div class="btn btn-primary btn-sm">Add to Cart</div>
                     </td>
                     <td class="align-middle "><a href="#" class="text-muted" data-bs-toggle="tooltip" data-bs-placement="top" aria-label="Delete">
                        <i class="feather-icon icon-trash-2"></i>
                        </a>
                     </td>
                  </tr>
     </tbody>
   </table>
   </div>
 </div>
 </div>
 </div>







	
	<p><a href="kakao">결제테스트</a><p>
			
	<c:set var="num" value="${page.total-page.start+1 }"></c:set>
	
	<table border="1">
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

		<c:forEach items="${adminMemberList }" var="member">

		<tr >
			<td class="border border-success">${num }</td>
			<td class="border border-success">${member.m_num }</td>
			<td class="border border-success" ><fmt:formatDate value="${member.m_date }" pattern="yyyy-MM-dd" /></td>
			<td class="border border-success">${member.m_id }</td>
			<td class="border border-success">${member.m_name }</td>
			<td class="border border-success">${member.m_ph }</td>
			<td class="border border-success">${member.m_addr }</td>
			<td class="border border-success">${member.m_email }</td>
			<td class="border border-success">${member.m_birth }</td>
			<td class="border border-success">${member.m_point }</td>
			<td class="border border-success">${member.m_wd }</td>
		</tr>
			<c:set var="num" value="${num-1 }"></c:set>

		</c:forEach>

	</table><p></p>
	

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