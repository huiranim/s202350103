<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/headerFo.jsp" %>
<!DOCTYPE html>
 
<html lang="en">
<head>
<meta charset="utf-8">
  <title>DADOK</title>
</head>
<body>

<!-- 메인 상단 슬라이드( 이벤트 노출? )  -->
  <main>
    <section class="mt-8">
      <div class="container">
        <div class="hero-slider ">
          <div
            style="background: url(./assets/images/slider/mainEx1.png) no-repeat; background-size: cover; border-radius: .5rem; background-position: center;">
            <div class="ps-lg-12 py-lg-16 col-xxl-5 col-md-7 py-14 px-8 text-xs-center">
              <span class="badge text-bg-warning">메인 광고1</span>

              <h2 class="text-dark display-6 fw-bold mt-4">메인 슬라이드 광고 1 </h2>
              <p class="lead">이벤트 광고 입니다</p>
              <a href="#!" class="btn btn-dark mt-3">출석체크 하러가기 <i class="feather-icon icon-arrow-right ms-1"></i></a>
            </div>
          </div>

          <div class=" "
            style="background: url(./assets/images/slider/mainEx2.png) no-repeat; background-size: cover; border-radius: .5rem; background-position: center;">
            <div class="ps-lg-12 py-lg-16 col-xxl-5 col-md-7 py-14 px-8 text-xs-center">
              <span class="badge text-bg-warning">메인 광고 2</span>
              <h2 class="text-dark display-6 fw-bold mt-4">메인광고 2 <br> 메인광고 입니다 <span
                  class="text-primary">우최3</span></h2>
              <p class="lead">광고 설명
              </p>
              <a href="#!" class="btn btn-dark mt-3">바로가기 <i class="feather-icon icon-arrow-right ms-1"></i></a>
            </div>

          </div>

        </div>
      </div>
    </section>
    
    
<!-- 상단 슬라이드 상품 (10개 노출 , 줄일 수 있음)-->
    <section class="mb-lg-10 mt-lg-14 my-8">
      <div class="container">
        <div class="row">
          <div class="col-12 mb-6">
	
	
		<!-- 상단 메뉴 -->
            <!-- row -->
               <div class="row align-items-center mb-6">
                  <div class="col-lg-10 col-10 ">
                     <!-- heading -->
                     <h3 class="mb-0">카테고리별 BEST 도서💕</h3>
                  </div>
                  <div class="col-lg-2 col-2">
                     <div class="slider-arrow  " id="slider-second-arrows"></div>
                  </div>
               </div>
			
          </div>
        </div>
        
        <!--  상품 시작 -->
        <!-- slider -->
               <div class="product-slider-second " id="slider-second">
                  <!-- 다독 전체 1등 -->
                  <div class="item">
                     <!-- item -->
                     <div class="card card-product mb-lg-4">
                        <div class="card-body">
                           <!-- 상단 뱃지 -->
                           <div class="text-center position-relative ">
                              <div class=" position-absolute top-0 start-0">
                                 <span class="badge bg-danger">다독 1등</span>
                              </div>
                              <!-- 도서 이미지 -->
                              <a href="newbookDetail?nb_num=${hitBook1.nb_num }"> 
                              	<c:choose>
								     <c:when test="${fn:contains(hitBook1.nb_image, 'http')}">
								            <img src="${hitBook1.nb_image }" alt="도서 썸네일" class="mb-3 img-fluid" style="height: 21rem;">
								     </c:when>
								     <c:otherwise>
								            <img src="${pageContext.request.contextPath}/upload/${hitBook1.nb_image}" alt="도서 썸네일" class="mb-3 img-fluid" style="height: 21rem;">
								     </c:otherwise>
								</c:choose>
                              </a>
                           </div>
                           <!-- 도서 카테고리 -->
                           <div class="text-small mb-1">
                           	  <a href="newbookDetail?nb_num=${hitBook1.nb_num }" class="text-decoration-none text-muted">
                           	  	<small>
                           	  		<c:choose>
						               <c:when test="${hitBook1.nb_category1 eq 1}">국내도서 </c:when>
						               <c:when test="${hitBook1.nb_category1 eq 2}">해외도서 </c:when>
						            </c:choose>
						            >
						            <c:choose>
						               <c:when test="${hitBook1.nb_category2 eq 1}"> 경제/경영</c:when>
						               <c:when test="${hitBook1.nb_category2 eq 2}"> 과학</c:when>
						               <c:when test="${hitBook1.nb_category2 eq 3}"> 소설</c:when>
						               <c:when test="${hitBook1.nb_category2 eq 4}"> 역사/문화</c:when>
						               <c:when test="${hitBook1.nb_category2 eq 5}"> 인문</c:when>
						               <c:when test="${hitBook1.nb_category2 eq 6}"> 과학/기술</c:when>
						               <c:when test="${hitBook1.nb_category2 eq 7}"> 문학</c:when>
						            </c:choose>
                           	  	</small>
                           	  </a>
                           </div>
                           <!-- 도서 제목 -->
                           <h2 class="fs-6"><a href="newbookDetail?nb_num=${hitBook1.nb_num }" class="text-inherit text-decoration-none">${hitBook1.nb_title }</a>
                           </h2>
                           <!-- 도서 가격 -->
                           <div class="d-flex justify-content-between align-items-center mt-3">
                              <div>
                              	<span class="text-dark"><fmt:formatNumber value="${hitBook1.nb_price}" groupingUsed="true"/>원</span> 
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- 카테고리별 1등-->
                  <c:forEach var="categoryHitBook" items="${hitList }" >
	                  <div class="item">
	                     <!-- item -->
	                     <div class="card card-product mb-lg-4">
	                        <div class="card-body">
	                           <div class="text-center position-relative">
	                              <!-- 상단 뱃지 -->
	                              <div class=" position-absolute top-0 start-0">
	                                 <span class="badge bg-success">
										<c:choose>
				                       		<c:when test="${categoryHitBook.nb_category2 eq '1'}">
				                       			[경제/경영] 1등
				                       		</c:when>
				                       		<c:when test="${categoryHitBook.nb_category2 eq '2'}">
				                       			[과학] 1등
				                       		</c:when>
				                       		<c:when test="${categoryHitBook.nb_category2 eq '3'}">
				                       			[소설] 1등
				                       		</c:when>
				                       		<c:when test="${categoryHitBook.nb_category2 eq '4'}">
				                       			[역사/문화] 1등
				                       		</c:when>
				                       		<c:when test="${categoryHitBook.nb_category2 eq '5'}">
				                       			[인문] 1등
				                       		</c:when>
				                       		<c:when test="${categoryHitBook.nb_category2 eq '6'}">
				                       			[과학/기술] 1등
				                       		</c:when>
				                       		<c:when test="${categoryHitBook.nb_category2 eq '7'}">
				                       			[문학] 1등
				                       		</c:when>
				                       	</c:choose> 
									 </span>
	                              </div>
	                              <!-- img -->
	                              <a href="newbookDetail?nb_num=${categoryHitBook.nb_num }">
	                              	<c:choose>
									     <c:when test="${fn:contains(categoryHitBook.nb_image, 'http')}">
									            <img src="${categoryHitBook.nb_image }" alt="도서 썸네일" class="mb-3 img-fluid" style="height: 21rem;">
									     </c:when>
									     <c:otherwise>
									            <img src="${pageContext.request.contextPath}/upload/${categoryHitBook.nb_image}" alt="도서 썸네일" class="mb-3 img-fluid" style="height: 21rem;">
									     </c:otherwise>
									</c:choose>
	                              </a>
	                           </div>
	                           <!-- 도서 카테고리명 -->
	                           <div class="text-small mb-1">
	                           		<a href="newbookDetail?nb_num=${categoryHitBook.nb_num }" class="text-decoration-none text-muted">
	                           			<small>
	                           				<c:choose>
								               <c:when test="${categoryHitBook.nb_category1 eq 1}">국내도서 </c:when>
								               <c:when test="${categoryHitBook.nb_category1 eq 2}">해외도서 </c:when>
								            </c:choose>
								            >
								            <c:choose>
								               <c:when test="${categoryHitBook.nb_category2 eq 1}"> 경제/경영</c:when>
								               <c:when test="${categoryHitBook.nb_category2 eq 2}"> 과학</c:when>
								               <c:when test="${categoryHitBook.nb_category2 eq 3}"> 소설</c:when>
								               <c:when test="${categoryHitBook.nb_category2 eq 4}"> 역사/문화</c:when>
								               <c:when test="${categoryHitBook.nb_category2 eq 5}"> 인문</c:when>
								               <c:when test="${categoryHitBook.nb_category2 eq 6}"> 과학/기술</c:when>
								               <c:when test="${categoryHitBook.nb_category2 eq 7}"> 문학</c:when>
								            </c:choose>
	                           			</small>
	                           		</a>
	                           </div>
	                           <!-- 도서 제목 -->
	                           <h2 class="fs-6"><a href="newbookDetail?nb_num=${categoryHitBook.nb_num }" class="text-inherit text-decoration-none">${categoryHitBook.nb_title }
	                              </a>
	                           </h2>
	                           <!-- 도서 가격 -->
	                           <div class="d-flex justify-content-between align-items-center mt-3">
	                              <div><span class="text-dark"><fmt:formatNumber value="${categoryHitBook.nb_price}" groupingUsed="true"/>원</span>
	                              </div>
	                           </div>
	                        </div>
	                     </div>
	                  </div>
                  </c:forEach>
               </div>
		<!-- 상단 이미지 슬라이드 끝 -->
      </div>
    </section>

<!-- 중단 메뉴 및 바로가기 -->
    <section>
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-6 mb-3 mb-lg-0">
            <div>
              <div class="py-10 px-8 rounded"
                style="background:url(./assets/images/banner/grocery-banner.png)no-repeat; background-size: cover; background-position: center;">
                <div>
                  <h3 class="fw-bold mb-1">새상품 목록
                  </h3>
                  <p class="mb-4">내용 1 </p>
                  <a href="#!" class="btn btn-dark">바로가기</a>
                </div>
              </div>

            </div>

          </div>
          <div class="col-12 col-md-6 ">

            <div>
              <div class="py-10 px-8 rounded"
                style="background:url(./assets/images/banner/grocery-banner-2.jpg)no-repeat; background-size: cover; background-position: center;">
                <div>
                  <h3 class="fw-bold mb-1">중고상품 등록
                  </h3>
                  <p class="mb-4">내용1 </p>
                  <a href="#!" class="btn btn-dark">바로가기</a>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </section>

<!-- 중단 상품  -->
    <section class="my-lg-14 my-8">
      <div class="container">
        <div class="row">
          <div class="col-12 mb-6">

            <h3 class="mb-0">화제의 신상 도서✨</h3>

          </div>
        </div>

        <div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
          <!-- 중단 배치 상품 시작 -->

                <!-- 신작도서 5개 리스트-->
                  <c:forEach var="releaseNewbook" items="${releaseNewbookList }" >
                   <div class="col">
		                     <!-- item -->
		                     <div class="card card-product mb-lg-4">
		                        <div class="card-body">
		                           <div class="text-center position-relative">
		                              <!-- 도서 이미지 -->
		                              <a href="newbookDetail?nb_num=${releaseNewbook.nb_num }">
		                              	<c:choose>
										     <c:when test="${fn:contains(releaseNewbook.nb_image, 'http')}">
										            <img src="${releaseNewbook.nb_image }" alt="도서 썸네일" class="mb-3 img-fluid" style="height: 21rem;">
										     </c:when>
										     <c:otherwise>
										            <img src="${pageContext.request.contextPath}/upload/${releaseNewbook.nb_image}" alt="도서 썸네일" class="mb-3 img-fluid" style="height: 21rem;">
										     </c:otherwise>
										</c:choose>
		                              </a>
		                           </div>
		                           <!-- 도서 카테고리명 -->
		                           <div class="text-small mb-1">
		                           		<a href="newbookDetail?nb_num=${releaseNewbook.nb_num }" class="text-decoration-none text-muted">
		                           			<small>
		                           				<c:choose>
									               <c:when test="${releaseNewbook.nb_category1 eq 1}">국내도서 </c:when>
									               <c:when test="${releaseNewbook.nb_category1 eq 2}">해외도서 </c:when>
									            </c:choose>
									            >
									            <c:choose>
									               <c:when test="${releaseNewbook.nb_category2 eq 1}"> 경제/경영</c:when>
									               <c:when test="${releaseNewbook.nb_category2 eq 2}"> 과학</c:when>
									               <c:when test="${releaseNewbook.nb_category2 eq 3}"> 소설</c:when>
									               <c:when test="${releaseNewbook.nb_category2 eq 4}"> 역사/문화</c:when>
									               <c:when test="${releaseNewbook.nb_category2 eq 5}"> 인문</c:when>
									               <c:when test="${releaseNewbook.nb_category2 eq 6}"> 과학/기술</c:when>
									               <c:when test="${releaseNewbook.nb_category2 eq 7}"> 문학</c:when>
									            </c:choose>
		                           			</small>
		                           		</a>
		                           </div>
		                           <!-- 도서 제목 -->
		                           <h2 class="fs-6"><a href="newbookDetail?nb_num=${releaseNewbook.nb_num }" class="text-inherit text-decoration-none">${releaseNewbook.nb_title }
		                              </a>
		                           </h2>
		                           <!-- 도서 가격 -->
		                           <div class="d-flex justify-content-between align-items-center mt-3">
		                              <div><span class="text-dark"><fmt:formatNumber value="${releaseNewbook.nb_price}" groupingUsed="true"/>원</span>
		                              </div>
		                           </div>
		                        </div>
		                     </div>
		                  </div>
                  </c:forEach>

              <!--  카드 1 끝  -->

        </div>
      </div>
    </section>
    
    
<!-- 하단 메뉴 -->
    <section>
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-6">
            <h3 class="mb-0">하단 베치 상품</h3>
          </div>
        </div>
      
        <div class="table-responsive-xl pb-6">
        <div class="row row-cols-lg-4 row-cols-1 row-cols-md-2 g-4 flex-nowrap">
          <div class="col">
            <div class=" pt-8 px-6 px-xl-8 rounded"
              style="background:url(./assets/images/banner/banner-deal.jpg)no-repeat; background-size: cover; height: 470px;">
              <div>
                <h3 class="fw-bold text-white">광고 ? 서적 노출
                </h3>
                <p class="text-white">내용</p>
                <a href="#!" class="btn btn-primary">바로가기 <i class="feather-icon icon-arrow-right ms-1"></i></a>
              </div>
            </div>
          </div>
          
          <!--  하단 배치 상품 1 -->
          <div class="col">
            <div class="card card-product">
              <div class="card-body">
              
              <!-- 상품 이미지 -->
                <div class="text-center  position-relative "> <a href="./pages/shop-single.html"><img
                      src="assets/images/products/product-img-11.jpg" alt="Grocery Ecommerce Template"
                      class="mb-3 img-fluid"></a>

                  <div class="card-product-action">
                    <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                      class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                    <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i
                        class="bi bi-heart"></i></a>
                    <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                        class="bi bi-arrow-left-right"></i></a>
                  </div>
                </div>
                <!--  이미지 끝(액션) -->
                
                <!-- 내용 -->
                <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>소제목
                     </small></a></div>
                <h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">메인제목
                   </a></h2>
				
				<!--  별점, 가격 -->
                <div class="d-flex justify-content-between align-items-center mt-3">
                  <div><span class="text-dark">할인가격</span> <span
                      class="text-decoration-line-through text-muted">가격</span>
                  </div>
                  <!--  별점  -->
                  <div>
                    <small class="text-warning"> <i class="bi bi-star-fill"></i>
                      <!--  한개 별 -->
                      <i class="bi bi-star-fill"></i>
                      <i class="bi bi-star-fill"></i>
                      <i class="bi bi-star-fill"></i>
						<!--  반개 별 -->
                      <i class="bi bi-star-half"></i>
                    </small>
                    <span><small>4.5</small></span>
                  </div>
                </div>
                
                <!-- 버튼  -->
                <div class="d-grid mt-2"><a href="#!" class="btn btn-primary ">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                      stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                      class="feather feather-plus">
                      <line x1="12" y1="5" x2="12" y2="19"></line>
                      <line x1="5" y1="12" x2="19" y2="12"></line>
                    </svg>장바구니 추가 </a></div>
                    
			<!-- 남은 기간 표시 가능 -->
                <div class="d-flex justify-content-start text-center mt-3">
                  <div class="deals-countdown w-100" data-countdown="2023/10/28 00:00:00"></div>
                </div>
                
              </div>
            </div>
          </div>
          
          <!--  하단 배치 상품 2 -->
          <div class="col">
            <div class="card card-product">
              <div class="card-body">
                <div class="text-center  position-relative "> <a href="./pages/shop-single.html"><img
                      src="assets/images/products/product-img-12.jpg" alt="Grocery Ecommerce Template"
                      class="mb-3 img-fluid"></a>
                  <div class="card-product-action">
                    <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                        class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                    <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i
                        class="bi bi-heart"></i></a>
                    <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                        class="bi bi-arrow-left-right"></i></a>
                  </div>
                </div>
                <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>Fruits &
                      Vegetables</small></a></div>
                <h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Crushed
                    Tomatoes</a></h2>
                <div class="d-flex justify-content-between align-items-center mt-3">
                  <div><span class="text-dark">$13</span> <span
                      class="text-decoration-line-through text-muted">$18</span>
                  </div>
                  <div>
                    <small class="text-warning"> <i class="bi bi-star-fill"></i>
                      <i class="bi bi-star-fill"></i>
                      <i class="bi bi-star-fill"></i>
                      <i class="bi bi-star-fill"></i>
                      <i class="bi bi-star-half"></i>
                    </small>
                    <span><small>4.5</small></span>
                  </div>
                </div>
                <div class="d-grid mt-2"><a href="#!" class="btn btn-primary ">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                      stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                      class="feather feather-plus">
                      <line x1="12" y1="5" x2="12" y2="19"></line>
                      <line x1="5" y1="12" x2="19" y2="12"></line>
                    </svg> Add to cart </a></div>
                <div class="d-flex justify-content-start text-center mt-3 w-100">
                  <div class="deals-countdown w-100" data-countdown="2028/12/9 00:00:00"></div>
                </div>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card card-product">
              <div class="card-body">
                <div class="text-center  position-relative "> <a href="./pages/shop-single.html"><img
                      src="assets/images/products/product-img-13.jpg" alt="Grocery Ecommerce Template"
                      class="mb-3 img-fluid"></a>
                  <div class="card-product-action">
                    <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                        class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                    <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i
                        class="bi bi-heart"></i></a>
                    <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                        class="bi bi-arrow-left-right"></i></a>
                  </div>
                </div>
                <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>Fruits &
                      Vegetables</small></a></div>
                <h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Golden
                    Pineapple</a></h2>
                <div class="d-flex justify-content-between align-items-center mt-3">
                  <div><span class="text-dark">$13</span> <span
                      class="text-decoration-line-through text-muted">$18</span>
                  </div>
                  <div>
                    <small class="text-warning"> <i class="bi bi-star-fill"></i>
                      <i class="bi bi-star-fill"></i>
                      <i class="bi bi-star-fill"></i>
                      <i class="bi bi-star-fill"></i>
                      <i class="bi bi-star-half"></i></small>
                    <span><small>4.5</small></span>
                  </div>
                </div>
                <div class="d-grid mt-2"><a href="#!" class="btn btn-primary ">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                      stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                      class="feather feather-plus">
                      <line x1="12" y1="5" x2="12" y2="19"></line>
                      <line x1="5" y1="12" x2="19" y2="12"></line>
                    </svg> Add to cart </a></div>
                <div class="d-flex justify-content-start text-center mt-3">
                  <div class="deals-countdown w-100" data-countdown="2028/11/11 00:00:00"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
    </section>
    
    
<!-- 하단 컨텐츠  -->
    <section class="my-lg-14 my-8">
      <div class="container">
        <div class="row">
         <!-- 섹션 1 -->
          <div class="col-md-6 col-lg-3">
            <div class="mb-8 mb-xl-0">
              <div class="mb-6"><img src="assets/images/icons/clock.svg" alt=""></div>
              <h3 class="h5 mb-3">제목1</h3>
              <p>아이콘 만 가져다 쓰거나 바로가기 만들수 있음
              </p>
            </div>
          </div>
          
          <!-- 섹션 2 -->
          <div class="col-md-6  col-lg-3">
            <div class="mb-8 mb-xl-0">
              <div class="mb-6"><img src="assets/images/icons/gift.svg" alt=""></div>
              <h3 class="h5 mb-3">제목2</h3>
              <p>내용
              </p>
            </div>
          </div>
          
          <!--  섹션 3 -->
          <div class="col-md-6 col-lg-3">
            <div class="mb-8 mb-xl-0">
              <div class="mb-6"><img src="assets/images/icons/package.svg" alt=""></div>
              <h3 class="h5 mb-3">제목3</h3>
              <p>내용
              </p>
            </div>
          </div>
          
          
          <!-- 섹션 4 -->
          <div class="col-md-6 col-lg-3">
            <div class="mb-8 mb-xl-0">
              <div class="mb-6"><img src="assets/images/icons/refresh-cw.svg" alt=""></div>
              <h3 class="h5 mb-3">제목4</h3>
              <p>내용
                <a href="#!">임픽트 내용</a>
                </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>


<!--  상품 상세보기 클릭시 액션-->
<div class="modal fade" id="quickViewModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-body p-8">
        <div class="position-absolute top-0 end-0 me-3 mt-3">
          <!-- X 버튼 눌러 상세보기 닫기  -->
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
          
        </div>
         
        <!--  상세 보기클릭시 메인 이미지 액션 -->
        <div class="row">
          <div class="col-lg-6">
			<!--  이미지 슬라이드  -->
            <div class="product productModal" id="productModal">
             <!--  마우스 오버시 확대 기능 -->
              <div
                class="zoom"
                onmousemove="zoom(event)"
                style="
                  background-image: url(./assets/images/products/product-single-img-1.jpg);
                "
              >
                <!-- img -->
                <img
                  src="./assets/images/products/product-single-img-1.jpg"
                  alt=""
            >
              </div>
              <div>
                <div
                  class="zoom"
                  onmousemove="zoom(event)"
                  style="
                    background-image: url(./assets/images/products/product-single-img-2.jpg);
                  "
                >
                  <!-- img -->
                  <img
                    src="./assets/images/products/product-single-img-2.jpg"
                    alt=""
              >
                </div>
              </div>
              <div>
                <div
                  class="zoom"
                  onmousemove="zoom(event)"
                  style="
                    background-image: url(./assets/images/products/product-single-img-3.jpg);
                  "
                >
                  <!-- img -->
                  <img
                    src="./assets/images/products/product-single-img-3.jpg"
                    alt=""
              >
                </div>
              </div>
              <div>
                <div
                  class="zoom"
                  onmousemove="zoom(event)"
                  style="
                    background-image: url(./assets/images/products/product-single-img-4.jpg);
                  "
                >
                  <!-- img -->
                  <img
                    src="./assets/images/products/product-single-img-4.jpg"
                    alt=""
              >
                </div>
              </div>
            </div>
            
            
            <!-- 하단 이미지 -->
            <div class="product-tools">
              <div class="thumbnails row g-3" id="productModalThumbnails">
                <div class="col-3" class="tns-nav-active">
                  <div class="thumbnails-img">
                    <!-- 이미지 1 -->
                    <img
                      src="./assets/images/products/product-single-img-1.jpg"
                      alt=""
                >
                  </div>
                </div>
                <div class="col-3">
                  <div class="thumbnails-img" >
                    <!-- 이미지 2 -->
                    <img
                      src="./assets/images/products/product-single-img-2.jpg"
                      alt=""
                >
                  </div>
                </div>
                <div class="col-3">
                  <div class="thumbnails-img">
                    <!-- 이미지 3 -->
                    <img
                      src="./assets/images/products/product-single-img-3.jpg"
                      alt=""
                >
                  </div>
                </div>
                <div class="col-3">
                  <div class="thumbnails-img">
                    <!-- 이미지 4 -->
                    <img
                      src="./assets/images/products/product-single-img-4.jpg"
                      alt=""
                >
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <!--  상세보기 이미지 내용 -->
          <div class="col-lg-6">
            <div class="ps-lg-8 mt-6 mt-lg-0">
              <a href="#!" class="mb-4 d-block">뭐 어쩌고 저쩌고</a>
              <h2 class="mb-1 h1">상품 제목</h2>
             <!--  별점  -->
              <div class="mb-4">
                <small class="text-warning">
                  <i class="bi bi-star-fill"></i>
                  <i class="bi bi-star-fill"></i>
                  <i class="bi bi-star-fill"></i>
                  <i class="bi bi-star-fill"></i>
                  <i class="bi bi-star-half"></i></small
                ><a href="#" class="ms-2">(30 reviews)</a>
              </div>
				
				<!-- 가격 -->
              <div class="fs-4">
                <span class="fw-bold text-dark">$실제가격</span>
                <span class="text-decoration-line-through text-muted">$할인가격</span
                ><span
                  ><small class="fs-6 ms-2 text-danger">할인률% Off</small></span
                >
              </div>
              <hr class="my-6">
             
             <!--  버튼  -->
              <div class="mb-4">
                <button type="button" class="btn btn-outline-secondary">
                  버튼1
                </button>
                <button type="button" class="btn btn-outline-secondary">
                  버튼2
                </button>
                <button type="button" class="btn btn-outline-secondary">
                  버튼3
                </button>
              </div>
		
			<!--  수량 증감소 -->              
              <div>
                <!-- input -->
                <div class="input-group input-spinner  ">
                  <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
                  <input type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input   ">
                  <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
                </div>
              </div>
              <div
                class="mt-3 row justify-content-start g-2 align-items-center"
              >

                <div class="col-lg-4 col-md-5 col-6 d-grid">
                  <!-- button -->
                  <!-- btn -->
                  <button type="button" class="btn btn-primary">
                    <i class="feather-icon icon-shopping-bag me-2"></i>
                    장바구니 담기
                  </button>
                </div>
                
                
                <div class="col-md-4 col-5">
                  <!-- 버튼 1 -->
                  <a
                    class="btn btn-light"
                    href="#"
                    data-bs-toggle="tooltip"
                    data-bs-html="true"
                    aria-label="Compare"
                    ><i class="bi bi-arrow-left-right"></i
                  ></a>
                 
                 <!-- 버튼 2 찜하기? -->
                  <a
                    class="btn btn-light"
                    href="#!"
                    data-bs-toggle="tooltip"
                    data-bs-html="true"
                    aria-label="Wishlist"
                    ><i class="feather-icon icon-heart"></i
                  ></a>
                </div>
              </div>
              
              <!--  상품 정보 -->
              <hr class="my-6">
              <div>
                <table class="table table-borderless">
                  <tbody>
                    <tr>
                      <td>대략적 상품정보 노출?</td>
                      <td>값</td>
                    </tr>
                    <tr>
                      <td>Availability:</td>
                      <td>In Stock</td>
                    </tr>
                    <tr>
                      <td>Type:</td>
                      <td>Fruits</td>
                    </tr>
                    <tr>
                      <td>Shipping:</td>
                      <td>
                        <small
                          >01 day shipping.<span class="text-muted"
                            >( Free pickup today)</span
                          ></small
                        >
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="common/footerFo.jsp" %>

</body>

</html>