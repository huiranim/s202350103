<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<!DOCTYPE html>
<html>

<head>
<style type="text/css">
#box-right {
  align: right;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>조회수 : ${oldBook.ob_readcnt }</h3>
	<div class="row">
	  <div class="col-md-12 row justify-content-center">
		<!-- 도서 이미지 -->
		 <div class="product" id="product" style="width: 20rem;">
		    <div class="zoom" onmousemove="zoom(event)"
		       style="background-image: url(${oldBook.nb_image})">
		       <!-- img --><img src="${oldBook.nb_image}" alt="${oldBook.nb_title}">
		    </div>
		 </div>
	  <!-- 도서 간략 정보 -->
	  <div class="col-md-6 text-end">
		 <div class="ps-lg-4 mt-4 mt-md-0">
		    <!-- 카테고리 -->
		   <span class="mb-4 d-block">
		    	<c:choose>
					<c:when test="${oldBook.nb_category1 eq 1}">국내도서 </c:when>
					<c:when test="${oldBook.nb_category1 eq 2}">해외도서 </c:when>
				</c:choose>
				>
				<c:choose>
					<c:when test="${oldBook.nb_category2 eq 1}"> 경제/경영</c:when>
					<c:when test="${oldBook.nb_category2 eq 2}"> 과학</c:when>
					<c:when test="${oldBook.nb_category2 eq 3}"> 소설</c:when>
					<c:when test="${oldBook.nb_category2 eq 4}"> 역사/문화</c:when>
					<c:when test="${oldBook.nb_category2 eq 5}"> 인문</c:when>
					<c:when test="${oldBook.nb_category2 eq 6}"> 과학/기술</c:when>
					<c:when test="${oldBook.nb_category2 eq 7}"> 문학</c:when>
				</c:choose>
		    </span>  
	  
	  
		    <!-- 도서명 -->
		    <h1 class="mb-1 text-center">
	      	<c:choose>
					<c:when test="${oldBook.ob_grade eq '0' }"><c:out value="[중고 A]"/></c:when>
					<c:when test="${oldBook.ob_grade eq '1' }"><c:out value="[중고 B]"/></c:when>
					<c:when test="${oldBook.ob_grade eq '2' }"><c:out value="[중고 C]"/></c:when>
					<c:when test="${oldBook.ob_grade eq '3' }"><c:out value="[중고 D]"/></c:when>
					<c:otherwise><c:out value="kkk"/></c:otherwise>
			</c:choose>
		    ${oldBook.nb_title}</h1>
	    <!-- 도서 가격 -->
		    <div class="fs-4 text-center">
		       <!-- 가격 -->
		       <span class="fw-bold text-dark"><fmt:formatNumber value="${oldBook.ob_sell_price}" groupingUsed="true"/>원</span>
		       <!-- 적립포인트 -->
		       <span><small class="fs-6 ms-2 text-muted">
		       		적립포인트 : <fmt:formatNumber value="${oldBook.ob_sell_price * 0.01}" pattern="#"/>p
		       </small></span>
		    </div>
	  
	     
		    <!-- 한 줄 긋기 -->
		    <hr class="my-6">
	  </div>
	    
		    <!-- 도서 간략 내용 -->
		    <div>
		       <!-- table -->
		       <table class="table table-borderless">
		          <tbody>
		             <tr>
		                <td>지은이:</td>
		                <td>${oldBook.nb_writer }</td>
		             </tr>
		             <tr>
		                <td>출판사:</td>
		                <td>${oldBook.nb_publisher }</td>
		             </tr>
		             <tr>
		                <td>출간일:</td>
		                <td>${oldBook.nb_publi_date }</td>
		             </tr>
		                <tr>
		                <td>매입번호 :</td>
		                <td>${oldBook.ob_num }</td>
		             </tr>
		          </tbody>
		       </table>
		    </div>
		    
		
		    
		   <div class="d-grid gap-2 d-md-flex justify-content-md-end">
		       <!-- 수량 선택 버튼 및 구매 버튼, 찜하기 버튼 -->
		       <form action="">
		       <input name="nb_num" type="hidden" value="${oldBook.nb_num }">
		       <div class="input-group input-spinner" >
		       	  <!-- 수량 선택 버튼 -->
		          <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity" style="height: 42px;width: 40px;">
		          <input id="c_count" type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input" style="height: 42px;width: 40px;">
		          <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity" style="height: 42px;width: 40px;">
				  <div class="g-2 align-items-center">
				     <div style="margin-left: 15px;">
				        <!-- 구매 버튼 -->
				     
		  			    <button type="button" class="btn btn-primary"><i class="feather-icon icon-shopping-bag me-2"></i>바로구매</button>
				     </div>
		    	  </div>
		      </div>
		      </form>
		   </div>
		 </div>
	  
	  
	  
</div>
	
 
   
	 
		    <!-- 별점 -->
		<%--     <div class="mb-4">
                <div class="text-warning">
                	<c:forEach var="i" begin="1" end="${newbook.r_ratingAvg }">
                		<i class="bi bi-star-fill"></i>
                	</c:forEach>
                	<c:forEach var="i" begin="${newbook.r_ratingAvg + 1}" end="5">
                		<i class="bi bi-star"></i>
                	</c:forEach>
                 <span class="text-muted small" style="margin-left: 10px;">${newbook.r_ratingAvg }(${newbook.reviewCnt }건)</span>
          		</div>
		    </div> --%>
		    <!-- 도서 가격 -->
		
		 
		  
	
	<div class="container">
      <div class="row justify-content-center">
        <div class="col-md-10 mt-5">
          <!-- 탭 메뉴들 -->
          <ul class="nav nav-pills nav-lb-tab" id="myTab" role="tablist">
            <!-- 도서 상세 내용 탭 버튼 -->
            <li class="nav-item" role="presentation">
              <!-- btn --> <button class="nav-link active" id="product-tab" data-bs-toggle="tab"
                data-bs-target="#product-tab-pane" type="button" role="tab" aria-controls="product-tab-pane"
                aria-selected="true">상세 정보</button>
            </li>
            <!-- 동일 중고 도서 리스트 탭 버튼 -->
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="details-tab" data-bs-toggle="tab"
                data-bs-target="#details-tab-pane" type="button" role="tab" aria-controls="details-tab-pane"
                aria-selected="false" onclick="oldbookList()">동일 새상품 도서 구현합시다!!</button>
            </li>
            <!-- 리뷰 탭 버튼 -->
      <!--       <li class="nav-item" role="presentation">
              btn <button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
                data-bs-target="#reviews-tab-pane" type="button" role="tab" aria-controls="reviews-tab-pane"
                aria-selected="false">리뷰</button>
            </li> -->
          </ul>
          <!-- 탭 상세 내용들 -->
          <div class="tab-content" id="myTabContent">
            <!-- 도서 상세 내용 -->
            <div class="tab-pane fade show active" id="product-tab-pane" role="tabpanel" aria-labelledby="product-tab"
              tabindex="0">
              <div class="my-8">
                <div class="mb-5">
                  <h3 class="mb-3">줄거리</h3>
                  <p class="mb-0 fs-5">${oldBook.nb_summary }</p>
                </div>
                
                <div class="mb-5">
                  <h3 class="mb-3">기본정보</h3>
                   <table class="table fs-6" style="width: 25rem;">
				     <tr>
				       <th class="table-light text-center">ISBN</th>
				       <td>${oldBook.nb_isbn }</td>
				     </tr>
					 <tr>
				       <th class="table-light text-center">쪽수</th>
				       <td>${oldBook.nb_page }</td>
				     </tr>
				     <tr>
				       <th class="table-light text-center">크기</th>
				       <td>${oldBook.nb_size }</td>
				     </tr>  
				   </table>
                </div>
              </div>
            </div>
            <!-- 동일 중고 도서 리스트 -->
            <div class="tab-pane fade" id="details-tab-pane" role="tabpanel" aria-labelledby="details-tab" tabindex="0">
              <div class="my-8">
                <div class="row">
                  <div class="col-12">
                    <h4 class="mb-4">동일한 새상품 도서 내역  구현합시다!!</h4>
                  </div>
                  
                  <!-- Ajax로 동일한 중고도서 리스트 넣기 -->
                  <div id="sameOldBook" class="row g-4  row-cols-1 mt-2">
                  	
                  </div>
                  
                </div>
              </div>
            </div>
            <!-- 리뷰 화면 -->
            <div class="tab-pane fade" id="reviews-tab-pane" role="tabpanel" aria-labelledby="reviews-tab" tabindex="0">
              <div class="my-8">
                <!-- row -->
                <div class="row">
					<%@ include file="../ht/boProductReviewList.jsp" %>
					</div>
                </div>
              </div>
            </div>
            </div>
          </div>
        </div>

    </div>
</body>
<%@ include file="../common/footerFo.jsp" %>
</html>