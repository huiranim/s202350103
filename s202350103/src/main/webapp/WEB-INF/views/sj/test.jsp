<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
/* 	
	function category2Click() {
		// 클릭한 카테고리명
		var category2Value = $("#category2").val();
		var orderTypeValue = $("#orderType").val();
		alert("내가 선택한 카테고리 + 정렬 -> " + category2Value + "+" + orderTypeValue);
		
		location.href = "/innewbookList?nb_category2="+category2Value +"&orderType="+orderTypeValue;
	
	} */
	
</script>
</head>
<body>

<p class="fs-4">현재 : ${page.currentPage } 페이지</p>

<div class="row py-5 mb-3" style="background-color: #EBEBEB">
 <div class="col-12">
    <div class="d-lg-flex justify-content-between align-items-center">
       <div class="mb-3 mb-lg-0">
          <p class="mb-0"> <span class="text-dark">${totObCnt} </span> 중고 도서 </p>  
       </div>
           <div class="d-md-flex justify-content-between align-items-center">
          <div class="d-flex align-items-center justify-content-between">
             
             <!-- 반응형 시 사이드 바 -->
             <div class="ms-2 d-lg-none">
                <a class="btn btn-outline-gray-400 text-muted" data-bs-toggle="offcanvas" href="#offcanvasCategory" role="button" aria-controls="offcanvasCategory">
                   <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                      stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                      class="feather feather-filter me-2">
                      <polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"></polygon>
                   </svg>
                   Filters
                </a>
             </div>
          </div>
           <%--      <div class="d-flex mt-2 mt-lg-0">
             <div class="me-2 flex-grow-1">
               <!-- 카테고리 검색 -->
                <select id="category2" class="form-select" aria-label="Default select example" onchange = "category2Click()">
                   <option value=0 <c:if test ="${newbook.nb_category2 eq '0'}"> selected="selected"</c:if>>전체</option>
                   <option value=1 <c:if test ="${newbook.nb_category2 eq '1'}"> selected="selected"</c:if>>경제/경영</option>
                   <option value=2 <c:if test ="${newbook.nb_category2 eq '2'}"> selected="selected"</c:if>>과학</option>
                   <option value=3 <c:if test ="${newbook.nb_category2 eq '3'}"> selected="selected"</c:if>>소설</option>
                   <option value=4 <c:if test ="${newbook.nb_category2 eq '4'}"> selected="selected"</c:if>>역사/문화</option>
                   <option value=5 <c:if test ="${newbook.nb_category2 eq '5'}"> selected="selected"</c:if>>인문</option>
     			</select>
             </div>
             
             <div>
                <!-- 정렬 조건 -->
                <select id="orderType" class="form-select" aria-label="Default select example" onchange="category2Click()">
                   <option value="recently" <c:if test ="${newbook.orderType eq 'recently'}"> selected="selected"</c:if>>최신순</option>
                   <option value="highreview" <c:if test ="${newbook.orderType eq 'highreview'}"> selected="selected"</c:if>>높은별점순</option>
                   <option value="highprice" <c:if test ="${newbook.orderType eq 'highprice'}"> selected="selected"</c:if>>높은가격순 </option>
                   <option value="lowprice" <c:if test ="${newbook.orderType eq 'lowprice'}"> selected="selected"</c:if>>낮은가격순</option>
                </select>
             </div>
          </div> --%>
       </div>
    </div>
 </div>
</div>
          

<!-- 국내도서 리스트 -->
<c:set var="num" value="${page.totalOb-page.start+1 }"></c:set>
<c:forEach var="oldBook" items="${listOb }">
	<div class="row g-4  row-cols-1 mt-2">
		<div class="row">
		  <div class="col-12">
		     <div class="card card-product">
		        <!-- 한 개 도서상품 내용  -->
		        <div class="card-body">
		           <div class=" row align-items-center">
		              <!-- col -->
		               <div class="col-md-4 col-12">
		                 <div class="text-center position-relative ">
			              <%--    <c:if test="${inNewbook.nb_num eq newbook.hit_nb_num}">
			                 	<div class=" position-absolute top-0">
			                 	   <!-- 조회수가 가장 높은 것 hit로 보여주기 --> 
			                       <span class="badge bg-danger">Hit</span>
			                    </div>
			                 </c:if>  --%>
		                    <a href="#">
		                       <!-- 도서 이미지 -->
		                       <img src="${oldBook.nb_image }" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 13rem;">
		                    </a>
		                 </div>
		              </div>
		              <div class="col-md-8 col-12 flex-grow-1">
		                 <!-- 도서 제목 -->
		                 <h1 class="fs-2 mb-3"><a href="foOldBookDetail?nb_num=${oldBook.nb_num }" class="text-inherit text-decoration-none">${oldBook.nb_title}</a>
		                 </h1>
		                 <!-- 지은이, 출판사, 출판일 -->
		                 <h3 class="fs-6 mb-3">${oldBook.nb_writer} | ${oldBook.nb_publisher} | ${inNewbook.nb_publi_date}
		                 </h3>
		              <div>
	                    <!-- 별점 -->
<%-- 	                    <div class="text-warning">
	                    	<c:forEach var="i" begin="1" end="${oldBook.r_ratingAvg }">
	                    		<i class="bi bi-star-fill"></i>
	                    	</c:forEach>
	                    	<c:forEach var="i" begin="${oldBook.r_ratingAvg + 1}" end="5">
	                    		<i class="bi bi-star"></i>
	                    	</c:forEach>
		                    <span class="text-muted small" style="margin-left: 10px;">${oldBook.r_ratingAvg }(${inNewbook.reviewCnt }건)</span>
	              		</div>
		              </div> --%>
		                 
		                 <!-- 도서가격 + 버튼들 -->
		                 <div class="  mt-8 mb-3">
		                     <!-- 도서 가격 -->
		                    <div>
		                     <span class="text-dark fs-3"><fmt:formatNumber value="${oldBook.ob_sell_price}" groupingUsed="true"/>원</span>
		                     <span id="price_point" class="text-muted ml-5">
		                     		적립포인트 : <fmt:formatNumber value="${oldBook.ob_sell_price * 0.01}" pattern="#"/>p
		                     </span>
		                    </div>
		                    
		                    <!-- 찜, 바로구매,  장바구니 버튼 -->
		                    <div class="mt-2">
		                    
		                       <!-- 바로구매 버튼 -->   
		                       <a href="#!" class="btn btn-primary ">
		                  	   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
		                  		fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
		                  		stroke-linejoin="round" class="feather feather-shopping-bag me-2">
			                  	   <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
			                  	   <line x1="3" y1="6" x2="21" y2="6"></line>
			                       <path d="M16 10a4 4 0 0 1-8 0"></path>
		                 	   </svg>
		                  		바로구매
		                       </a>
		                       <!-- 장바구니 버튼 -->
		                     
		                       </a>
		                       </div>
		                    </div>
		                 </div>
		              </div>
		           </div>
		        </div>
		     </div>
		  </div>
		 </div>
	</div>    
</c:forEach>       




<!-- 페이징 처리 -->
      <c:if test="${page.startPage > page.pageBlock }">
					<a href="folistOb?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
					</c:if>
  				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<a href="folistOb?currentPage=${i}">[${i}]</a>
					</c:forEach>
						<c:if test="${page.endPage < page.totalObPage }">
					<a href="folistOb?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
				</c:if>	
</body>
<%@ include file="../common/footerFo.jsp" %>
</html>