<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	function oldbookList() {
		var pNb_num = '${newbook.nb_num}' ;
		alert("현재 도서 번호는 -> "+pNb_num);
		 
		$.ajax({
					url : "/sameOldBookList", 
					data : {nb_num : pNb_num},
					dataType : 'json',
					success : function(data){ // data -> sameOldBookList 값
						var sameOldBookList = JSON.stringify(data);
						// alert("sameOldBookList -> "+sameOldBookList);
						
						if(sameOldBookList == "[]"){
							$("#sameOldBook").empty();
							$('#sameOldBook').append("<p>동일한 중고도서 상품이 없습니다.<p>")
						} else {
							$("#sameOldBook").empty();
							var html = "";
							$(data).each (function() {
								var  v_price = 0;
								html += "<div class='row g-4  row-cols-1 mt-2'>";
								html += "<div class='row justify-content-center'>";
								html += "<div class='col-11'>";
								html += "<div class='card card-product'>";
								html += "<div class='card-body'>";
								html += "<div class='row align-items-center'>";
								html += "<div class='col-md-4 col-12'>";
								html += "<div class='text-center position-relative'>";
								/* 도서 이미지 */
								html += "<a href='newbookDetail?nb_num="+this.ob_num+"'>";
								html += "<img src='"+this.nb_image+"' alt='도서 썸네일' class='mb-3 img-fluid' style='width: 13rem;'>";
								html += "</a></div></div>";
								html += "<div class='col-md-8 col-12 flex-grow-1'>";
								/* 도서 제목 */
								html += "<h1 class='fs-3 mb-3'><a href='newbookDetail?nb_num="+this.ob_num+"' class='text-inherit text-decoration-none'>"+this.nb_title+"</a></h1>";
								/* 도서 지은이, 출판사, 출간일 */
								html += "<h3 class='fs-6 mb-3'>"+this.nb_writer +" | "+ this.nb_publisher +" | "+ this.nb_publi_date +"</h3>";
								html += "<div><div class='mt-8 mb-3'> <div>";
								/* 도서 가격 */
								html += "<span class='text-dark fs-3'>"+this.ob_sell_price+"원</span>";
								html += "</div></div></div></div></div></div></div></div></div></div>";	
							})
							$('#sameOldBook').append(html)
						}
					}
		});
	}
	
	function wishlist(pNb_num) {
		alert("pNb_num ->"+pNb_num);
		
		$.ajax({
			url : "/wish/wishclick", 
			data : {nb_num : pNb_num},
			dataType : 'text',
			success : function(data){
						if (data == '0') {
							alert ("찜 취소 되었습니다.");
							location.reload();
						} 
						else if(data == '1') {
							alert ("찜 되었습니다.");
							location.reload();
						} 
						else {
							location.href = data ;
						}
										
				  }
			});
	}
	
	function cart(pNb_num) {
		var m_num = '${member.m_num}';
		var pC_count = $("#c_count").val();
		
		$.ajax({
			url : "/cart/cartclick",
			data : {nb_num : pNb_num, c_count : pC_count},
			dataType : 'text',
			success : function(data){
				if (data == '0') {
					if(confirm("장바구니에 이미 등록된 상품입니다. \n장바구니로 이동하시겠습니까?")){
						location.href = "memberCartList?m_num"+m_num;
					}
				} 
				else if(data == '1') {
					if(confirm("장바구니에 등록되었습니다. \n장바구니로 이동하시겠습니까?")){
						location.href = "memberCartList?m_num"+m_num;
					}
				} 
				else {
					location.href = data ;
				}
			}
		});
	}
	
	function reviewChange(start,end) {
		//var sendData = $('form').serialize();
		var r_reviewSelect = $('#reviewSel').val();;
		var sendData = 'r_reviewSelect='+r_reviewSelect+'&start='+start+'&end='+end;
	
		location.href="newbookDetail?"+sendData;
	};  

	$(function() {
		// ++5
		$('#chk1').click(function() {
				var sendData = $('form').serialize();
				location.href="newbookDetail?"+sendData;
			   
		 });
	}) 
</script>
</head>
<body>
	<h3>조회수 : ${newbook.nb_readcnt }</h3>
	<div class="row">
	  <div class="col-md-6 row justify-content-center">
		<!-- 도서 이미지 -->
		 <div class="product" id="product" style="width: 20rem;">
		    <div class="zoom" onmousemove="zoom(event)"
		       style="background-image: url(${newbook.nb_image})">
		       <!-- img --><img src="${newbook.nb_image}" alt="${newbook.nb_title}">
		    </div>
		 </div>
	  </div>

	
	<!-- 도서 간략 정보 -->
	 <div class="col-md-6">
		 <div class="ps-lg-10 mt-6 mt-md-0">
		    <!-- 카테고리 -->
		    <span class="mb-4 d-block">
		    	<c:choose>
					<c:when test="${newbook.nb_category1 eq 1}">국내도서 </c:when>
					<c:when test="${newbook.nb_category1 eq 2}">해외도서 </c:when>
				</c:choose>
				>
				<c:choose>
					<c:when test="${newbook.nb_category2 eq 1}"> 경제/경영</c:when>
					<c:when test="${newbook.nb_category2 eq 2}"> 과학</c:when>
					<c:when test="${newbook.nb_category2 eq 3}"> 소설</c:when>
					<c:when test="${newbook.nb_category2 eq 4}"> 역사/문화</c:when>
					<c:when test="${newbook.nb_category2 eq 5}"> 인문</c:when>
					<c:when test="${newbook.nb_category2 eq 6}"> 과학/기술</c:when>
					<c:when test="${newbook.nb_category2 eq 7}"> 문학</c:when>
				</c:choose>
		    </span>
		    <!-- 도서명 -->
		    <h1 class="mb-1">${newbook.nb_title}</h1>
		    <!-- 별점 -->
		    <div class="mb-4">
                <div class="text-warning">
                	<c:forEach var="i" begin="1" end="${newbook.r_ratingAvg }">
                		<i class="bi bi-star-fill"></i>
                	</c:forEach>
                	<c:forEach var="i" begin="${newbook.r_ratingAvg + 1}" end="5">
                		<i class="bi bi-star"></i>
                	</c:forEach>
                 <span class="text-muted small" style="margin-left: 10px;">${newbook.r_ratingAvg }(${newbook.reviewCnt }건)</span>
          		</div>
		    </div>
		    <!-- 도서 가격 -->
		    <div class="fs-4">
		       <!-- 가격 -->
		       <span class="fw-bold text-dark"><fmt:formatNumber value="${newbook.nb_price}" groupingUsed="true"/>원</span>
		       <!-- 적립포인트 -->
		       <span><small class="fs-6 ms-2 text-muted">
		       		적립포인트 : <fmt:formatNumber value="${newbook.nb_price * 0.01}" pattern="#"/>p
		       </small></span>
		    </div>
		    
		    <!-- 한 줄 긋기 -->
		    <hr class="my-6">
		    
		    <!-- 도서 간략 내용 -->
		    <div>
		       <!-- table -->
		       <table class="table table-borderless">
		          <tbody>
		             <tr>
		                <td>지은이:</td>
		                <td>${newbook.nb_writer }</td>
		             </tr>
		             <tr>
		                <td>출판사:</td>
		                <td>${newbook.nb_publisher }</td>
		             </tr>
		             <tr>
		                <td>출간일:</td>
		                <td>${newbook.nb_publi_date }</td>
		             </tr>
		          </tbody>
		       </table>
		    </div>
		    
		    <!-- 한 줄 긋기 -->
		    <hr class="my-6">
		    
		   <div>
		       <!-- 수량 선택 버튼 및 구매 버튼, 찜하기 버튼 -->
		       <form action="">
		       <input name="nb_num" type="hidden" value="${newbook.nb_num }">
		       <div class="input-group input-spinner">
		       	  <!-- 수량 선택 버튼 -->
		          <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity" style="height: 42px;width: 40px;">
		          <input id="c_count" type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input" style="height: 42px;width: 40px;">
		          <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity" style="height: 42px;width: 40px;">
				  <div class="g-2 align-items-center">
				     <div style="margin-left: 15px;">
				        <!-- 구매 버튼 -->
				        <input type="submit" value="선물하기" class="btn btn-warning" onclick="javascript: form.action='/foGivingGift';"><i class="feather-icon icon-shopping-bag me-2"></i>
				        <button type="button" class="btn btn-secondary" onclick="cart(${newbook.nb_num })"><i class="feather-icon icon-shopping-bag me-2"></i>장바구니</button>
		  			    <button type="button" class="btn btn-primary"><i class="feather-icon icon-shopping-bag me-2"></i>바로구매</button>
				        <!-- 찜하기 버튼 -->	
                        <c:choose>
                       	  <c:when test="${newbook.w_wish == 0}">
	                         <a id="wish" class="btn btn-icon btn-sm btn-outline-gray-400 text-muted"
	                            data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist" onclick="wishlist(${newbook.nb_num })">
	                            <i id="wishbtn" class="bi bi-heart"></i></a>
	                      </c:when>
	                      <c:when test="${newbook.w_wish == 1}">
	                         <a id="wish" class="btn btn-icon btn-sm btn-outline-gray-400 text-muted"
	                            data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist" onclick="wishlist(${newbook.nb_num })">
	                            <i id="wishbtn" class="bi bi-heart-fill"></i></a>
	                      </c:when>
                       </c:choose>
				     </div>
		    	  </div>
		      </div>
		      </form>
		   </div>
		 </div>
	  </div>
	 </div>
	
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
                aria-selected="false" onclick="oldbookList()">동일 중고 도서(${newbook.same_obCnt })</button>
            </li>
            <!-- 리뷰 탭 버튼 -->
            <li class="nav-item" role="presentation">
              <!-- btn --> <button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
                data-bs-target="#reviews-tab-pane" type="button" role="tab" aria-controls="reviews-tab-pane"
                aria-selected="false">리뷰</button>
            </li>
          </ul>
          <!-- 탭 상세 내용들 -->
          <div class="tab-content" id="myTabContent">
            <!-- 도서 상세 내용 -->
            <div class="tab-pane fade show active" id="product-tab-pane" role="tabpanel" aria-labelledby="product-tab"
              tabindex="0">
              <div class="my-8">
                <div class="mb-5">
                  <h3 class="mb-3">줄거리</h3>
                  <p class="mb-0 fs-5">${newbook.nb_summary }</p>
                </div>
                
                <div class="mb-5">
                  <h3 class="mb-3">기본정보</h3>
                   <table class="table fs-6" style="width: 25rem;">
				     <tr>
				       <th class="table-light text-center">ISBN</th>
				       <td>${newbook.nb_isbn }</td>
				     </tr>
					 <tr>
				       <th class="table-light text-center">쪽수</th>
				       <td>${newbook.nb_page }</td>
				     </tr>
				     <tr>
				       <th class="table-light text-center">크기</th>
				       <td>${newbook.nb_size }</td>
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
                    <h4 class="mb-4">동일한 중고 도서 내역</h4>
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
</body>
<%@ include file="../common/footerFo.jsp" %>
</html>