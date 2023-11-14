<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
                        html += "<a href='foOldBookDetail?ob_num="+this.ob_num+"'>";
                        html += "<img src='"+this.nb_image+"' alt='도서 썸네일' class='mb-3 img-fluid' style='width: 13rem;'>";
                        html += "</a></div></div>";
                        html += "<div class='col-md-8 col-12 flex-grow-1'>";
                        /* 도서 제목 */
                        html += "<h1 class='fs-3 mb-3'><a href='foOldBookDetail?ob_num="+this.ob_num+"' class='text-inherit text-decoration-none'>"+this.nb_title+"</a></h1>";
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

    $(function() {
      $('#chk2').change(function() {
            var sendData = $('form').serialize();
            document.getElementById("reviewList").focus();
            location.href="newbookDetail?"+sendData;
       });
   })
   
   // 페이지가 로드될 때 실행되는 함수
   function onPageLoad(p_status){
    	
       if(p_status == 1) {
          //document.getElementById("reviewLists").focus(); //reviewList로 이동
          var reviewsTab = new bootstrap.Tab(document.getElementById("reviews-tab"));
         reviewsTab.show();
         document.getElementById("reviewFocus").scrollIntoView();
       } 
       
      /*  // 최근 본 상품의 nb_num을 담는다.
       var url = window.location.href;
       var nb_numCookie = getProductIDFromURL(url); // getProductIDFromURL(url) -> url에서 nb_num을 가져오는 함수 
       alert("nb_numCookie -> "+nb_numCookie);
       
       if(nb_numCookie){ // nb_numCookie 값이 있으면 실행
    	   var recentProducts = getCookie('recent_products');
       	   // 삼항 연산자 -> 				조건식 	 ? 	참(split(/): /를 기준으로 문자열을 분할) 	: 거짓
       	   var recentProductIds = recentProducts ? recentProducts.split('/') : [];
       	   
       	   if(!recentProductIds.includes(nb_numCookie)){ // 최근 본 상품 리스트에 nb_num이 없다면 실행
       			recentProductIds.push(nb_numCookie);	// recentProductIds 리스트에 nb_num 값을 넣어라
       		}
       	   
       	   // 최대 5개까지만 유지
       	   if(recentProductIds.length > 5) {
       			recentProductIds.shift();
       	   }
       	   
       	   recentProducts = recentProductIds.join('/'); // 문자열들을 / 를 붙여 반환한다.
       		
       	   // 24시간 후의 시간 객체 생성
       	   var expirationDate = new Date();
       		expirationDate.setTime(expirationDate.getTime() + (24*60*60*1000));
       		console.log("expirationDate -> "+expirationDate);
       		
       		// 쿠키에 recent_products 저장 (유효기간 24시간)
       		setCookie('recent_products', recentProducts, expirationDate);
       }       */ 
       
    }
    
    // url에서 nb_num만 따로 추출하는 함수
    function getProductIDFromURL(url){
    	var regex = /[?&]nb_num=(\d+)/; // nb_num을 따로 추출할 수 있도록 하는 정규식
    	var match = regex.exec(url);	// exe(str) -> 처음 일치하는 부분 하나만 배열에 넣어서 return
    	if(match && match[1]){			// match = ?nb_num=100042, 100042
    		return match[1];			// match[0] = ?nb_num=100042
    	}								// match[1] = 100042
    	return null;
    }
    
    // 쿠키를 저장하는 메소드
    function setCookie(cookieName, value, expirationDate){
    	// escape -> 알파벳과 숫자 및 특수문자를 제외한 모든 문자를 16진수로 인코딩
    	var cookieValue = escape(value) + ((expirationDate == null) ? '' : '; expires=' + expirationDate.toUTCString());
    	document.cookie = cookieName + '=' + cookieValue;
    }
    
    // 쿠기 값을 가지고 오는 메소드
    function getCookie(cookieName){
    	var name = cookieName + '=';
    	var decodedCookie = decodeURIComponent(document.cookie);
    	var cookieArray = decodedCookie.split(';');
    	
    	for (var i = 0; i<cookieArray.length; i++){
    		var cookie = cookieArray[i];
    		while (cookie.charAt(0) == ''){
    			cookie = cookie.substring(1);
    		}
    		if(cookie.indexOf(name) == 0){
    			return cookie.substring(name.length, cookie.length);
    		}
    	}
    	return '';
    }

   $(function() {
      // ++5
      $('#chk1').click(function() {
            var sendData = $('form').serialize();
            document.getElementById("reviewList").focus();
            location.href="newbookDetail?"+sendData;
       });
   }) 
   

</script>
</head>
<body onload="onPageLoad(${review.p_status})">
   <h3>조회수 : ${newbook.nb_readcnt }</h3>
   <div class="row">
     <div class="col-md-6 row justify-content-center">
      <!-- 도서 이미지 -->
       <div class="product" id="product" style="width: 20rem;">
          <div class="zoom" onmousemove="zoom(event)"
             style="background-image: url(${newbook.nb_image})">
             <c:set var="nb_image" value="${newbook.nb_image }"/>
             <c:choose>
                  <c:when test="${fn:contains(nb_image, 'http')}">
                     <img src="${newbook.nb_image}" alt="${newbook.nb_title}">
                  </c:when>
                  <c:otherwise>
                     <img src="${pageContext.request.contextPath}/upload/${newbook.nb_image}" alt="${newbook.nb_title}">
                  </c:otherwise>
               </c:choose>
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
                     <!-- <button type="button" class="btn btn-primary"><i class="feather-icon icon-shopping-bag me-2"></i>바로구매</button> -->
                     <a href="orderForm?nb_num=${newbook.nb_num }&paymentType=1" class="btn btn-primary ">
		                  	   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
		                  		fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
		                  		stroke-linejoin="round" class="feather feather-shopping-bag me-2">
			                  	   <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
			                  	   <line x1="3" y1="6" x2="21" y2="6"></line>
			                       <path d="M16 10a4 4 0 0 1-8 0"></path>
		                 	   </svg>
		                  		바로구매
		                       </a>
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
                 <!-- 형택이꺼 -->
                <div class="row" id="reviewList">
					<div class="row">
					 <div class="col-md-4">
					       <div class="me-lg-12 mb-6 mb-md-0">
					          <div class="mb-5">
					             <!-- title -->
					             <h4 class="mb-3">고객 리뷰</h4>
					             <span>
					                <!-- rating -->
					                <small class="text-warning">
					                	<c:forEach begin="1" end="${review.r_review_average}">
					                	<i class="bi bi-star-fill"></i>
						                </c:forEach>
					                </small><span class="ms-3">${review.r_review_average } out of 5</span>
					                <small class="ms-3">리뷰 총 수량 : ${review.r_review_total}</small>
					             </span>
					          </div>
					          <div class="mb-8">
					             <!-- progress -->
					             <div class="d-flex align-items-center mb-2">
					                <div class="text-nowrap me-3 text-muted"><span
					                   class="d-inline-block align-middle text-muted">5</span><i
					                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
					                <div class="w-100">
					                   <div class="progress" style="height: 6px;">
					                      <div class="progress-bar bg-warning" role="progressbar" style="width: ${review.r_rating5+20}%;"
					                         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
					                   </div>
					                </div>
					                <span class="text-muted ms-3">${review.r_rating5}%</span>
					             </div>
					             <!-- progress -->
					             <div class="d-flex align-items-center mb-2">
					                <div class="text-nowrap me-3 text-muted"><span
					                   class="d-inline-block align-middle text-muted">4</span><i
					                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
					                <div class="w-100">
					                   <div class="progress" style="height: 6px;">
					                      <div class="progress-bar bg-warning" role="progressbar" style="width: ${review.r_rating4+20}%;"
					                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="50"></div>
					                   </div>
					                </div>
					                <span class="text-muted ms-3">${review.r_rating4}%</span>
					             </div>
					             <!-- progress -->
					             <div class="d-flex align-items-center mb-2">
					                <div class="text-nowrap me-3 text-muted"><span
					                   class="d-inline-block align-middle text-muted">3</span><i
					                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
					                <div class="w-100">
					                   <div class="progress" style="height: 6px;">
					                      <div class="progress-bar bg-warning" role="progressbar" style="width: ${review.r_rating3+20}%;"
					                        aria-valuenow="35" aria-valuemin="0" aria-valuemax="35"></div>
					                   </div>
					                </div>
					                <span class="text-muted ms-3">${review.r_rating3}%</span>
					             </div>
					             <!-- progress -->
					             <div class="d-flex align-items-center mb-2">
					                <div class="text-nowrap me-3 text-muted"><span
					                   class="d-inline-block align-middle text-muted">2</span><i
					                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
					                <div class="w-100">
					                   <div class="progress" style="height: 6px;">
					                      <div class="progress-bar bg-warning" role="progressbar" style="width: ${review.r_rating2+20}%;"
					                     aria-valuenow="22" aria-valuemin="0" aria-valuemax="22"></div>
					                   </div>
					                </div>
					                <span class="text-muted ms-3">${review.r_rating2}%</span>
					             </div>
					             <!-- progress -->
					             <div class="d-flex align-items-center mb-2">
					                <div class="text-nowrap me-3 text-muted"><span
					                   class="d-inline-block align-middle text-muted">1</span><i
					                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
					                <div class="w-100">
					                   <div class="progress" style="height: 6px;">
					                      <div class="progress-bar bg-warning" role="progressbar" style="width: ${review.r_rating1+20}%;"
					                    aria-valuenow="14" aria-valuemin="0" aria-valuemax="14"></div>
					                   </div>
					                </div>
					                <span class="text-muted ms-3">${review.r_rating1}%</span>
					             </div>
					          </div>
					          <div class="d-grid">
					             <h4>해당 상품 리뷰</h4>
					             <p class="mb-0">다른 고객분들을 위해서 리뷰를 작성해주세요.</p>
					             <a href="MyReviewList" class="btn btn-outline-gray-400 mt-4 text-muted">리뷰 작성하기</a>
					          </div>
					       </div>
					    </div>
					    <!-- col -->
					    <div class="col-md-8">
					       <div class="mb-10">
					          <div class="d-flex justify-content-between align-items-center mb-8">
					             <div>
					                <!-- heading -->
					                <h4>리뷰</h4>
					             </div>
					             <div>
					             	<form action="" >
					             	   <select name="r_reviewSelect" id="chk2" 
					                	        class="form-select" 
					                	        aria-label="Default select example"
					                	        > <!-- onchange="reviewChange(1,5,1)" -->
						                   <option value="1" <c:if test="${review.r_reviewSelect == '1' }">selected</c:if> >최신순</option>
						                   <option value="2" <c:if test="${review.r_reviewSelect == '2' }">selected</c:if> >별점순</option>
						                </select>
					                </form>
					             </div>
					           </div>
					           <div id="reviewFocus">
						            <c:forEach var="reviews" items="${listReview}" >
							          <div class="d-flex border-bottom pb-6 mb-6">
							             <!-- img -->
							             <img src="${reviews.m_image}" alt="member_image"
							                class="rounded-circle avatar-lg">
							             <div class="ms-5">
							                <h6 class="mb-1">
							                 ${reviews.m_name }
							                </h6>
							                <!-- select option -->
							                <!-- content -->
							                <p class="small"> <span class="text-muted">
							                <fmt:formatDate value="${reviews.r_create_date}" pattern="yyyy-MM-dd"/>
							                </span>
							                </p>
							                <!-- rating -->
							                <div class=" mb-2">
												<c:forEach begin="1" end="${reviews.r_rating}">
								                   <i class="bi bi-star-fill text-warning"></i>
								                </c:forEach>
							                   <span class="ms-3 text-dark fw-bold">${reviews.r_title}</span>
							                </div>
							                <!-- text-->
							                <p>${reviews.r_content}</p>
							             </div>
							          </div>
					                </c:forEach>
					          	
					                <form action="">
					           	       <input type="hidden" name="start"   value="1">
					          	       <input type="hidden" name="end"     value="${review.end + 5}">
					          	       <input type="hidden" name="p_status" value="1">   
					            	   <input type="button" id="chk1" class="btn btn-outline-gray-400 text-muted" value="리뷰 더보기">
									</form>
									<!-- 형택이꺼   reviewFocus -->
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