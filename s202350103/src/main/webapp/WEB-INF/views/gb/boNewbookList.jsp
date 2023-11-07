<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- End Tag 금비 -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function search() {
		var search_type = $("#search_type").val();
		var search_keyword = $("#search_keyword").val();
		alert("내가 선택한 검색 조건 -> "+search_type + " 키워드는 "+search_keyword);
		
		location.href = "/boSearchNewbookList?search_type="+search_type+"&search_keyword="+search_keyword;
	}
	
</script>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
		    <!-- 상품목록 -->
		    <div class="mb-8">
		       <!-- heading -->
		       <h1 class="mb-1">새상품 목록</h1>
		       <p>There are 5 products in this wishlist.</p>
		    </div>
		    <div class="row mt-8">
		    	<!-- 검색 -->
		        <div class="input-group mb-3">
					<select id="search_type" class="w-20 rounded" style="border-color: rgb(223, 226, 225);" >
						<option value="title">도서제목</option>
						<option value="writer">지은이</option>
						<option value="publisher">출판사</option>
					</select>&nbsp;&nbsp;
		            <input id = "search_keyword" class="form-control rounded" type="search" placeholder="찾으실 도서를 검색해보세요." >
		            
		            <!-- 검색 버튼 -->
		            <div class="col-md-2 col-xxl-2 d-none d-lg-block" style="margin-left: 5px;">
		              <button type="button" class="btn  btn-outline-gray-400 text-muted" data-bs-toggle="modal"
		                	data-bs-target="#locationModal" onclick="search()">검색  </button>
		            </div>
		        </div>
			</div>
	            
		    <div>
		       <!-- table -->
		       <div class="table-responsive" style="text-align: center;">
		          <table class="table text-nowrap">
		             <thead class="table-light">
		                <tr>
		                   <th>순번</th>
		                   <th>제목</th>
		                   <th>지은이</th>
		                   <th>가격</th>
		                   <th>출판사</th>
		                   <th>출간일</th>
		                   <th>국내/해외</th>
		                   <th>카테고리</th>
		                   <th colspan='2'>수정/삭제</th>
		                </tr>
		             </thead>
		             <tbody>
		             	<c:forEach var="newbook" items="${listBoNewbook }">
			                <tr>
			                   <td class="align-middle">${startRow }</td>
			                   <td class="align-middle">
			                      <a href="#"><img src="${newbook.nb_image }" class="icon-shape icon-xxl" alt="도서이미지"></a>
			                   </td>
			                   <td class="align-middle">
			                      <div>
			                      <h5 class="fs-6 mb-0"><a href="#" class="text-inherit">${newbook.nb_title }</a></h5>
			                      </div>
			                   </td>
			                   <td class="align-middle">${newbook.nb_writer}</td>
			                   <td class="align-middle">${newbook.nb_price }</td>
			                   <td class="align-middle">${newbook.nb_publisher }</td>
			                   <td class="align-middle">${newbook.nb_publi_date }</td>
			                   <td class="align-middle">
			                   		<c:if test="${newbook.nb_category1 eq 1}">국내</c:if>
			                   		<c:if test="${newbook.nb_category1 eq 2}">해외</c:if>
			                   </td>
			                   <td class="align-middle">
									<c:choose>
										<c:when test="${newbook.nb_category2 eq 1}"> 경제/경영</c:when>
										<c:when test="${newbook.nb_category2 eq 2}"> 과학</c:when>
										<c:when test="${newbook.nb_category2 eq 3}"> 소설</c:when>
										<c:when test="${newbook.nb_category2 eq 4}"> 역사/문화</c:when>
										<c:when test="${newbook.nb_category2 eq 5}"> 인문</c:when>
										<c:when test="${newbook.nb_category2 eq 6}"> 과학/기술</c:when>
										<c:when test="${newbook.nb_category2 eq 7}"> 문학</c:when>
									</c:choose>
								</td>
			                   <td colspan='2' class="align-middle">
			                      <div class="btn btn-info mb-2">수정</div>
			                      <div class="btn btn-secondary mb-2">삭제</div>
			                   </td>
			                </tr>
			                <c:set var="startRow" value="${page.startRow +1}"/>
		              </c:forEach>
			    </tbody>
			  </table>
			  </div>
			</div>
		</div>
	</div>
	
	<!-- 페이징 처리 -->
	<div class="row mt-8">
	  <div class="d-flex justify-content-center">
	    <!-- nav -->
	    <nav>
	    	<c:choose>
		    	<c:when test="${search_Newbook.search_type == null }">
			      <ul class="pagination">
			        <!-- 이전버튼 -->
			        <c:if test="${page.startPage > page.pageLimit}">
				        <li class="page-item">
				          <a class="page-link  mx-1 " href="bonewbookList?currentPage=${page.startPage-page.pageLimit}" aria-label="Previous">
				            <i class="feather-icon icon-chevron-left"></i>
				          </a>
				        </li>
			        </c:if>
			        
			        <!-- 페이지 넘버 -->
			        <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
			        	<li class="page-item"><a class="page-link mx-1 text-body" href="bonewbookList?currentPage=${i }">${i }</a></li>
			        </c:forEach>
			         
			        <!-- 다음 버튼 -->
			        <c:if test="${page.endPage < page.totalPage}">
				        <li class="page-item">
				          <a class="page-link mx-1 text-body" href="bonewbookList?currentPage=${page.startPage+page.pageLimit }" aria-label="Next">
				            <i class="feather-icon icon-chevron-right"></i>
				          </a>
				        </li>
			        </c:if>
			       </ul>
			     </c:when>
			     <c:otherwise>
			      <ul class="pagination">
			        <!-- 이전버튼 -->
			        <c:if test="${page.startPage > page.pageLimit}">
				        <li class="page-item">
				          <a class="page-link  mx-1 " href="boSearchNewbookList?currentPage=${page.startPage-page.pageLimit}&search_type=${search_Newbook.search_type}&search_keyword=${search_Newbook.search_keyword}" aria-label="Previous">
				            <i class="feather-icon icon-chevron-left"></i>
				          </a>
				        </li>
			        </c:if>
			        
			        <!-- 페이지 넘버 -->
			        <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
			        	<li class="page-item"><a class="page-link mx-1 text-body" href="boSearchNewbookList?currentPage=${i }&search_type=${search_Newbook.search_type}&search_keyword=${search_Newbook.search_keyword}">${i }</a></li>
			        </c:forEach>
			         
			        <!-- 다음 버튼 -->
			        <c:if test="${page.endPage < page.totalPage}">
				        <li class="page-item">
				          <a class="page-link mx-1 text-body" href="boSearchNewbookList?currentPage=${page.startPage+page.pageLimit }&search_type=${search_Newbook.search_type}&search_keyword=${search_Newbook.search_keyword}" aria-label="Next">
				            <i class="feather-icon icon-chevron-right"></i>
				          </a>
				        </li>
			        </c:if>
			       </ul>
			     </c:otherwise>
		      </c:choose>
	    </nav>
	  </div>
	</div>

</body>
</html>