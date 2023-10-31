<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="en">

<head>
  <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
  <title>DADOK</title>

  <link href="./assets/libs/slick-carousel/slick/slick.css" rel="stylesheet" />
<link href="./assets/libs/slick-carousel/slick/slick-theme.css" rel="stylesheet" />
<link href="./assets/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet">

  <!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="./assets/images/favicon/favicon.ico">


<!-- Libs CSS -->
<link href="./assets/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
<link href="./assets/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
<link href="./assets/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">


<!-- Theme CSS -->
<link rel="stylesheet" href="./assets/css/theme.min.css">
  <!-- Google tag (gtag.js) -->



<!-- End Tag -->
</head>

<body>


<!-- 전체 화면 일 때  -->
  <div class="border-bottom ">
    <div class="bg-light py-1">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-12 text-center text-md-start">
          <span> DADOK </span>
          </div>
          	
          	<!-- 우측 최상단 구성 -->
          
        </div>
      </div>
    </div>
    <div class="py-5">
      <div class="container">
        <div class="row w-100 align-items-center gx-lg-2 gx-0">
          <div class="col-xxl-2 col-lg-3">

	<!-- 로고/제목(데스크톱) -->
            <a class="navbar-brand d-none d-lg-block" href="/">
				<h1>DADOK</h1>

            </a>
	
<!-- 화면 줄었을 때 작업 -->
            <div class="d-flex justify-content-between w-100 d-lg-none">
	
	<!-- 로고/제목(모바일) -->	
			<h1>DADOK</h1>
              <div class="d-flex align-items-center lh-1">
		
                <div class="list-inline me-4">
                 
                 
					<!-- 회원가입 아이콘 -->
                  <div class="list-inline-item">
					
                    <a href="#!" class="text-muted" data-bs-toggle="modal" data-bs-target="#userModal">
                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-user">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                        <circle cx="12" cy="7" r="4"></circle>
                      </svg>
                    </a>
                  </div>
                  
                  
                  
            <!--  장바구니 아이콘 -->      
                  <div class="list-inline-item">

                    <a class="text-muted position-relative " data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
                      href="#offcanvasExample" role="button" aria-controls="offcanvasRight">
                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-shopping-bag">
                        <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
                        <line x1="3" y1="6" x2="21" y2="6"></line>
                        <path d="M16 10a4 4 0 0 1-8 0"></path>
                      </svg>
                      
                      <!-- 항목 아이콘 -->
                      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
                        9999
                        <span class="visually-hidden">unread messages</span>
                      </span>
                    
                    
                    </a>
                  </div>

                </div>

              <!-- 메뉴 버튼 -->  
                <button class="navbar-toggler collapsed" type="button" data-bs-toggle="offcanvas" data-bs-target="#navbar-default" aria-controls="navbar-default" aria-label="Toggle navigation">
                  <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                    class="bi bi-text-indent-left text-primary" viewBox="0 0 16 16">
                    <path
                      d="M2 3.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm.646 2.146a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1 0 .708l-2 2a.5.5 0 0 1-.708-.708L4.293 8 2.646 6.354a.5.5 0 0 1 0-.708zM7 6.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm-5 3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z" />
                  </svg>
                </button>

              </div>
            </div>

          </div>
        
       		<div class="col-md-2 col-md-5  d-block">
		    <!-- 검색 -->
		    <form action="#">
		        <div class="input-group">
		            
					<select class="w-25 rounded" style="border-color: rgb(223, 226, 225);" >
						<option>전체</option>
					</select>&nbsp;&nbsp;
		            <input class="form-control rounded" type="search" placeholder="찾으실 도서를 검색해보세요." >
		            <span class="input-group-append">
		                <button class="btn bg-white border border-start-0 ms-n10 rounded-0 rounded-end" type="button">
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
		                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
		                        stroke-linejoin="round" class="feather feather-search">
		                        <circle cx="11" cy="11" r="8"></circle>
		                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
		                    </svg>
		                </button>
		            </span>
		        </div>
		    </form>
		</div>

          
          <!-- 검색 버튼 -->
          <div class="col-md-2 col-xxl-3 d-none d-lg-block">
			
            <button type="button" class="btn  btn-outline-gray-400 text-muted" data-bs-toggle="modal"
              data-bs-target="#locationModal">
              검색
            </button>


          </div>
          
         <!--  전체화면 우측상단 아이콘 메뉴 -->
          <div class="col-md-2 col-xxl-2 text-end d-none d-lg-block">
				
				
     	<!-- 로그인 시  -->
      <!--   <div class="list-inline d-flex align-items-center">
			  로그인 아이콘
			  <div class="list-inline-item me-5" style="margin-top: 7px;">
			    <a href="#!" class="" data-bs-toggle="modal" data-bs-target="#userModal">
			      <i class="feather-icon icon-log-out me-4"></i>
			      <div style="margin-top: 4px;" >
			      Logout
			      </div>
			      <span class="visually-hidden">unread messages</span>
			    </a>
			  </div>
			
			  <div class="list-inline-item me-5">
			    <a href="#!" class="" >
			      <i class="bi bi-person-circle fs-4 me-4"></i>MyPage
			      <span class="visually-hidden">unread messages</span>
			    </a>
			  </div>
			
			  <div class="list-inline-item me-5">
			    <a href="#!" class="" >
			      <i class="bi bi-cart2 fs-4 me-1"></i>Cart
			      <span class="visually-hidden">unread messages</span>
			    </a>
			  </div>
			</div> -->
			
					
			 	<div class="col-md-2 col-xxl-2 text-end d-none d-lg-block">
          
		          	<!-- 비 로그인 시 -->	
		          <div class="list-inline">
		          	<div style="width: 300px;">
			            <c:if test="${sessionScope.member == null }">
			             	<div class="list-inline-item me-6">
							<!-- 로그인 아이콘 -->
					       	<a href="loginForm">                  
					        	<i class="feather-icon icon-log-out me-1">
					        	</i>로그인
			               		<span class="visually-hidden">unread messages</span>
			                </a></div>
			                <a href="memberJoin">회원가입</a>
			            </c:if>
		            </div>
		            
		            <!-- 로그인 시 -->
		            <div style="width: 400px;" >
			     		<c:if test="${sessionScope.member != null }">
			     			<div class="list-inline-item me-6">
								<!-- 로그아웃 아이콘 -->
								${member.m_name }님 환영합니다.<p>
								<a href="memberLogout">로그아웃</a>
			               		<span class="visually-hidden">unread mes</span>
			               	</div>
			                <!-- 마이페이지 아이콘 -->
						    <div class="list-inline-item me-5">
						    	<a href="memberMyPage?m_num=1021" class="" >
						     		<i class="bi bi-person-circle fs-4 me-4"></i>MyPage
						      		<span class="visually-hidden">unread messages</span>
						    	</a>
						    </div>
			                <!-- 장바구니 아이콘 -->
						    <div class="list-inline-item me-5">
						    	<a href="#!" class="" >
						      		<i class="bi bi-cart2 fs-4 me-1"></i>Cart
						     	 	<span class="visually-hidden">unread messages</span>
						    	</a>
						  </div>
			                
			     		</c:if>	
				    </div>
       	  	      </div>
      			</div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <nav class="navbar navbar-expand-lg navbar-light navbar-default py-0 pb-lg-4 " aria-label="Offcanvas navbar large">
    
    <!-- 메인 광고  -->
      <div class="container">


        <div class="offcanvas offcanvas-start" tabindex="-1" id="navbar-default" aria-labelledby="navbar-defaultLabel">
          <div class="offcanvas-header pb-1">
			
			<!-- 로고 위치 이미지 참조  -->
			<a href="./index.html">
				<h1>
				DADOK</h1>
            </a>	
<!--        <a href="./index.html"><img src="./assets/images/logo/freshcart-logo.svg" alt="eCommerce HTML Template">
            </a>
 -->            
            
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
          </div>
          
        <!-- 작은화면 메뉴 작업 -->
          <div class="offcanvas-body">
           
            <div class="d-block d-lg-none mb-4">
              <form action="#">
              <!-- 검색(작은화면) -->
                <div class="input-group ">
                  <input class="form-control rounded" type="search" placeholder="검색 ">
                  <span class="input-group-append">
                    <button class="btn bg-white border border-start-0 ms-n10 rounded-0 rounded-end" type="button">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-search">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                      </svg>
                    </button>
                  </span>
                </div>
              </form>
              
              <!-- 검색 버튼 -->
              <div class="mt-2">
                <button type="button" class="btn  btn-outline-gray-400 text-muted w-100 " data-bs-toggle="modal"
                  data-bs-target="#locationModal">
					검색 버튼
                </button>
              </div>
            </div>
            
            <!-- 작은화면 메인메뉴 버튼 -->
            <div class="d-block d-lg-none mb-4">
              <a class="btn btn-primary w-100 d-flex justify-content-center align-items-center" data-bs-toggle="collapse"
                href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                <span class="me-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                    fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"
                    class="feather feather-grid">
                    <rect x="3" y="3" width="7" height="7"></rect>
                    <rect x="14" y="3" width="7" height="7"></rect>
                    <rect x="14" y="14" width="7" height="7"></rect>
                    <rect x="3" y="14" width="7" height="7"></rect>
                  </svg></span> 메인메뉴 버튼
              </a>
              <!-- 작은화면 메인메뉴 버튼 클릭시 옵션 -->
              <div class="collapse mt-2" id="collapseExample">
                <div class="card card-body">
                  <ul class="mb-0 list-unstyled">
                    <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기1</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기2</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기3</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기4</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기5</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기6</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기7</a></li>
                  </ul>
                </div>
              </div>
            </div>
            
           <!-- 전체화면 메뉴 클릭시  -->
            <div class="dropdown me-3 d-none d-lg-block">
              <button class="btn btn-primary px-6 " type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
                aria-expanded="false">
                <span class="me-1">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"
                    class="feather feather-grid">
                    <rect x="3" y="3" width="7" height="7"></rect>
                    <rect x="14" y="3" width="7" height="7"></rect>
                    <rect x="14" y="14" width="7" height="7"></rect>
                    <rect x="3" y="14" width="7" height="7"></rect>
                  </svg></span> 메인메뉴 버튼
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기1</a></li>
                <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기2</a></li>
                <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기3</a></li>
                <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기4</a></li>
                <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기5</a></li>
                <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기6</a></li>
                <li><a class="dropdown-item" href="./pages/shop-grid.html">바로가기7</a></li>
              </ul>
            </div>
            
            
            <div class="">
              <ul class="navbar-nav align-items-center ">
                <li class="nav-item dropdown w-100 w-lg-auto">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
					도서상품
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="helloFo">회원조회Fo</a></li>
                    <li><a class="dropdown-item" href="helloBo">회원조회Bo</a></li>
                    <li><a class="dropdown-item" href="innewbookList">국내도서</a></li>
                    <li><a class="dropdown-item" href="./pages/index-4.html">메뉴 4</a></li>
                   <!-- new 아이콘 -->
                    <li><a class="dropdown-item" href="./pages/index-5.html">메뉴 5 <span
                          class="badge bg-light-info text-dark-info ms-1">New</span></a></li>
                  </ul>
                </li>
                <li class="nav-item dropdown w-100 w-lg-auto">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
					중고도서
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="./pages/shop-grid.html">카테고리 메뉴 1</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-grid-3-column.html">메뉴 2</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-list.html">메뉴 3</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-filter.html">메뉴 4</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-fullwidth.html">메뉴 5</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-single.html">메뉴 6</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-single-2.html">메뉴 7</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-wishlist.html">메뉴 8</a></li>
                    <li><a class="dropdown-item" href="./pages/shop-cart.html">메뉴 9</a></li>
                  </ul>
                </li>
                <li class="nav-item dropdown w-100 w-lg-auto">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
					포인트
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="./pages/store-list.html">메뉴1</a></li>
                    <li><a class="dropdown-item" href="./pages/store-grid.html">메뉴2</a></li>
                    <li><a class="dropdown-item" href="./pages/store-single.html">메뉴3</a></li>
                  </ul>
                </li>


			<!-- 상세 메뉴 필요시 사용  -->                
            <!--     
                <li class="nav-item dropdown w-100 w-lg-auto dropdown-fullwidth">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    상세 메뉴 바로가기
                  </a>
                  <div class=" dropdown-menu pb-0">
                    <div class="row p-2 p-lg-4">
                      <div class="col-lg-3 col-12 mb-4 mb-lg-0">
                        <h6 class="text-primary ps-3">대제목1</h6>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목1</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목2</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목3</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목4</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목5</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목6</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목7</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목8</a>
                      </div>
                      <div class="col-lg-3 col-12 mb-4 mb-lg-0">
                        <h6 class="text-primary ps-3">대제목2</h6>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목1</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목2</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목3</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목4</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목5</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목6</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목7</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목8</a>
                      </div>
                      <div class="col-lg-3 col-12 mb-4 mb-lg-0">
                        <h6 class="text-primary ps-3">대제목3</h6>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목1</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목2</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목3</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목4</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목5</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목6</a>
                        <a class="dropdown-item" href="./pages/shop-grid.html">소제목7</a>
                      </div>
  					
                      <div class="col-lg-3 col-12 mb-4 mb-lg-0">
                        <div class="card border-0">
                          <img src="./assets/images/banner/menu-banner.jpg" alt="eCommerce HTML Template"
                            class="img-fluid">
                          <div class="position-absolute ps-6 mt-8">
                            <h5 class=" mb-0 ">이미지<br>빼도 되고 넣어도되고</h5>
                            <a href="#" class="btn btn-primary btn-sm mt-3">구매 바로가기</a>
                          </div>
                        </div>
                      </div>
                    
                    </div>
                  </div>
                </li>
 -->
<!--  
				상단 메뉴 바로가기 시 참고 
				
                <li class="nav-item w-100 w-lg-auto">
                  <a class="nav-link" href="./dashboard/index.html">
                    바로가기 6
                  </a>
                </li>
-->
				
              </ul>
            </div>
          </div>
        </div>
      </div>
    </nav>


</div>


<!-- 마이페이지 아이콘 클릭시  -->
<!--  로그인 팝업으로 써도 될듯? -->
<div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-4">
      <div class="modal-header border-0">
        <h5 class="modal-title fs-3 fw-bold" id="userModalLabel">로그인</h5>

        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="fullName" class="form-label">이름</label>
            <input type="text" class="form-control" id="fullName" placeholder="이름을 입력하세요 " required="">
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">이메일 주소</label>
            <input type="email" class="form-control" id="email" placeholder="이메일을 입력하세요" required="">
          </div>

          <div class="mb-5">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요" required="">
            <small class="form-text"> 어쩌고 저쩌고 <a href="#!">뭐 임펙트 줄라고 쓸때 쓸꺼면 쓰고</a> & <a
                href="#!">아니면 말고</a></small>
          </div>

          <button type="submit" class="btn btn-primary">로그인</button>
        </form>
      </div>
      <div class="modal-footer border-0 justify-content-center">

        계정이 없슴? <a href="#">회원가입 ㄱㄱ </a>
      </div>
    </div>
  </div>
</div>

<!--  장바구니 아이콘 클릭시 -->

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header border-bottom">
    <div class="text-start">
      <h5 id="offcanvasRightLabel" class="mb-0 fs-4">장바구니</h5>
      <small>안영준 님</small>
    </div>
  <!-- X 버튼 클릭시 사이드바 슬라이드 -->
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">

    <div class="">
      <div class="alert alert-danger p-2" role="alert">
        뭐 경고 문구 대충 이런거  <a href="#!" class="alert-link">써도되고 안써도 되고</a>
      </div>

<!-- 사이드바 장바구니 메뉴 -->
      <ul class="list-group list-group-flush">

	<!-- 장바구니 리스트 -->
        <li class="list-group-item py-3 ps-0 border-top">
			
          <div class="row align-items-center">

            <div class="col-6 col-md-6 col-lg-7">
              <div class="d-flex">
            
            <!--  이미지 1  -->
              <img src="./assets/images/products/product-img-1.jpg" alt="Ecommerce"
                class="icon-shape icon-xxl">
                <div class="ms-3">
			<!--  이미지 1 제목 -->
              <a href="./pages/shop-single.html" class="text-inherit">
                <h6 class="mb-0">제목 1</h6>
              </a>
              <span><small class="text-muted">내용 1</small></span>


              <!-- text -->
              <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span
                    class="me-1 align-text-bottom">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                      stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                      class="feather feather-trash-2 text-success">
                      <polyline points="3 6 5 6 21 6"></polyline>
                      <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                      </path>
                      <line x1="10" y1="11" x2="10" y2="17"></line>
                      <line x1="14" y1="11" x2="14" y2="17"></line>
                    </svg></span><span class="text-muted">삭제 아이콘</span></a></div>
                  </div>
                </div>
            </div>

		<!-- 수량 input 버튼 -->
            <div class="col-4 col-md-3 col-lg-3">
			
		<!-- 수량 증 감소 -->	
              <div class="input-group input-spinner  ">
                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
                <input type="number" step="1" max="10" value="1" name="quantity"
                  class="quantity-field form-control-sm form-input   ">
                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
              </div>

            </div>
     
		<!--  가격 -->
            <div class="col-2 text-lg-end text-start text-md-end col-md-2">
              <span class="fw-bold">$5.00</span>

            </div>
          </div>

        </li>
       
		<!-- 장바구니 리스트 2 -->
        <li class="list-group-item py-3 ps-0 border-bottom">
          <div class="row align-items-center">
            <div class="col-6 col-md-6 col-lg-7">
              <div class="d-flex">
              <img src="./assets/images/products/product-img-5.jpg" alt="Ecommerce"
                class="icon-shape icon-xxl">
                <div class="ms-3">
			
              <a href="./pages/shop-single.html" class="text-inherit">
                <h6 class="mb-0">제목2 </h6>
              </a>
              <span><small class="text-muted">내용2</small></span>

              <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span
                    class="me-1 align-text-bottom">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                      stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                      class="feather feather-trash-2 text-success">
                      <polyline points="3 6 5 6 21 6"></polyline>
                      <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                      </path>
                      <line x1="10" y1="11" x2="10" y2="17"></line>
                      <line x1="14" y1="11" x2="14" y2="17"></line>
                    </svg></span><span class="text-muted">삭제 아이콘</span></a></div>
                  </div>
                </div>
            </div>
			
			<!-- 수량 증감소 -->
            <div class="col-4 col-md-3 col-lg-3">
              <div class="input-group input-spinner  ">
                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
                <input type="number" step="1" max="10" value="1" name="quantity"
                  class="quantity-field form-control-sm form-input   ">
                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
              </div>
            </div>
			<!-- 가격 -->
            <div class="col-2 text-lg-end text-start text-md-end col-md-2">
              <span class="fw-bold">$15.00</span>
            </div>
          </div>

        </li>

      </ul>
	<!--  장바구니 그룹  버튼 -->
      <div class="d-flex justify-content-between mt-4">
        <a href="#!" class="btn btn-primary">당장사버리기</a>
        <a href="#!" class="btn btn-dark">업데이트</a>
      </div>

    </div>
  </div>
</div>


<!-- 메인 상단 슬라이드( 이벤트 노출? )  -->
  <main>
    <section class="mt-8">
      <div class="container">
        <div class="hero-slider ">
          <div
            style="background: url(./assets/images/slider/slider-11.jpg) no-repeat; background-size: cover; border-radius: .5rem; background-position: center;">
            <div class="ps-lg-12 py-lg-16 col-xxl-5 col-md-7 py-14 px-8 text-xs-center">
              <span class="badge text-bg-warning">메인 광고1</span>

              <h2 class="text-dark display-5 fw-bold mt-4">메인 슬라이드 광고 1 </h2>
              <p class="lead">이벤트 광고 입니다</p>
              <a href="#!" class="btn btn-dark mt-3">출석체크 하러가기 <i class="feather-icon icon-arrow-right ms-1"></i></a>
            </div>
          </div>

          <div class=" "
            style="background: url(./assets/images/slider/slide-12.jpg) no-repeat; background-size: cover; border-radius: .5rem; background-position: center;">
            <div class="ps-lg-12 py-lg-16 col-xxl-5 col-md-7 py-14 px-8 text-xs-center">
              <span class="badge text-bg-warning">메인 광고 2</span>
              <h2 class="text-dark display-5 fw-bold mt-4">메인광고 2 <br> 메인광고 입니다 <span
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
            <h3 class="mb-0">상단 슬라이드 상품</h3>

          </div>
        </div>
        
        <!--  상품 시작 -->
        <div class="category-slider ">

          <div class="item"> <a href="../pages/shop-grid.html" class="text-decoration-none text-inherit">
              <div class="card card-product mb-lg-4">
                <div class="card-body text-center py-8">
                  <img src="assets/images/category/category-dairy-bread-eggs.jpg" alt="Grocery Ecommerce Template"
                    class="mb-3 img-fluid">
                  <div class="text-truncate">이미지 1</div>
                </div>
              </div>
            </a></div>
          <div class="item"> <a href="../pages/shop-grid.html" class="text-decoration-none text-inherit">
              <div class="card card-product mb-lg-4">
                <div class="card-body text-center py-8">
                  <img src="assets/images/category/category-snack-munchies.jpg" alt="Grocery Ecommerce Template"
                    class="mb-3">
                  <div class="text-truncate">이미지 2</div>
                </div>
              </div>
            </a></div>
          <div class="item"> <a href="../pages/shop-grid.html" class="text-decoration-none text-inherit">
              <div class="card card-product mb-lg-4">
                <div class="card-body text-center py-8">
                  <img src="assets/images/category/category-bakery-biscuits.jpg" alt="Grocery Ecommerce Template"
                    class="mb-3">
                  <div class="text-truncate">이미지 3</div>
                </div>
              </div>
            </a></div>
          <div class="item"> <a href="../pages/shop-grid.html" class="text-decoration-none text-inherit">
              <div class="card card-product mb-lg-4">
                <div class="card-body text-center py-8">
                  <img src="assets/images/category/category-instant-food.jpg" alt="Grocery Ecommerce Template"
                    class="mb-3">
                  <div class="text-truncate">이미지 4</div>
                </div>
              </div>
            </a></div>
          <div class="item"> <a href="../pages/shop-grid.html" class="text-decoration-none text-inherit">
              <div class="card card-product mb-lg-4">
                <div class="card-body text-center py-8">
                  <img src="assets/images/category/category-tea-coffee-drinks.jpg" alt="Grocery Ecommerce Template"
                    class="mb-3">
                  <div class="text-truncate">이미지 5</div>
                </div>
              </div>
            </a></div>
          <div class="item"><a href="../pages/shop-grid.html" class="text-decoration-none text-inherit">
              <div class="card card-product mb-lg-4">
                <div class="card-body text-center py-8">
                  <img src="assets/images/category/category-atta-rice-dal.jpg" alt="Grocery Ecommerce Template"
                    class="mb-3">
                  <div class="text-truncate">이미지 6</div>
                </div>
              </div>
            </a></div>

          <div class="item"> <a href="../pages/shop-grid.html" class="text-decoration-none text-inherit">
              <div class="card card-product mb-lg-4">
                <div class="card-body text-center py-8">
                  <img src="assets/images/category/category-baby-care.jpg" alt="Grocery Ecommerce Template"
                    class="mb-3">
                  <div class="text-truncate">이미지 7</div>
                </div>
              </div>
            </a></div>
          <div class="item"> <a href="../pages/shop-grid.html" class="text-decoration-none text-inherit">
              <div class="card card-product mb-lg-4">
                <div class="card-body text-center py-8">
                  <img src="assets/images/category/category-chicken-meat-fish.jpg" alt="Grocery Ecommerce Template"
                    class="mb-3">
                  <div class="text-truncate">이미지 8</div>
                </div>
              </div>
            </a></div>
          <div class="item"> <a href="../pages/shop-grid.html" class="text-decoration-none text-inherit">
              <div class="card card-product mb-lg-4">
                <div class="card-body text-center py-8">
                  <img src="assets/images/category/category-cleaning-essentials.jpg" alt="Grocery Ecommerce Template"
                    class="mb-3">
                  <div class="text-truncate">이미지 9</div>
                </div>
              </div>
            </a></div>
          <div class="item"> <a href="../pages/shop-grid.html" class="text-decoration-none text-inherit">
              <div class="card card-product mb-lg-4">
                <div class="card-body text-center py-8">
                  <img src="assets/images/category/category-pet-care.jpg" alt="Grocery Ecommerce Template" class="mb-3">
                  <div class="text-truncate">이미지 10</div>
                </div>
              </div>
            </a></div>


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

            <h3 class="mb-0">중단 배치 상품</h3>

          </div>
        </div>

        <div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
          <!-- 중단 배치 상품 시작 -->
          <div class="col">
            <div class="card card-product">
         	<!--  중단 카드 1 -->
              <div class="card-body">

                <div class="text-center position-relative ">
                  <div class=" position-absolute top-0 start-0">
                    <span class="badge bg-danger">핫 아이콘</span>
                  </div>
                <!-- 이미지 상품 -->
                  <a href="#!"> <img src="assets/images/products/product-img-1.jpg" alt="Grocery Ecommerce Template"
                      class="mb-3 img-fluid"></a>
				
                  <div class="card-product-action">
                    <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                        class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                    <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i
                        class="bi bi-heart"></i></a>
                    <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                        class="bi bi-arrow-left-right"></i></a>
                  </div>
				<!-- 이미지 끝(액션) -->
				
                </div>
                <!-- 상품 내용  -->
                <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>소제목 
                     </small></a></div>
                <h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">메인제목</a></h2>
                <div>
				
				<!--  별점  -->
                  <small class="text-warning"> <i class="bi bi-star-fill"></i>
					<!-- 한개 별 -->
                    <i class="bi bi-star-fill"></i>
					<!-- 반개 별 -->
                    <i class="bi bi-star-half"></i></small> <span class="text-muted small">4.5(149)</span>
                </div>
 
 				<!--  가격  -->
                <div class="d-flex justify-content-between align-items-center mt-3">
                  <div><span class="text-dark">$18</span> <span
                      class="text-decoration-line-through text-muted">$24</span>
                  </div>
                  <div><a href="#!" class="btn btn-primary btn-sm">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-plus">
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                      </svg> 추가</a></div>
                </div>
              </div>
            </div>
          </div>
              <!--  카드 1 끝  -->

		<!--  카드 2 -->
          <div class="col">
            <div class="card card-product">
              <div class="card-body">
                <div class="text-center position-relative">
                  <div class=" position-absolute top-0 start-0">
                    <span class="badge bg-success">14%</span>
                  </div>
                  <a href="./pages/shop-single.html"><img src="assets/images/products/product-img-2.jpg"
                      alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
                  <div class="card-product-action">
                    <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                        class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                    <a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
                      title="Wishlist"><i class="bi bi-heart"></i></a>
                    <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                        class="bi bi-arrow-left-right"></i></a>
                  </div>

                </div>
                <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>Bakery &
                      Biscuits</small></a></div>
                <h2 class="fs-6"><a href="./pages/shop-single.html"
                    class="text-inherit text-decoration-none">NutriChoice Digestive </a></h2>
                <div class="text-warning">

                  <small> <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-half"></i></small> <span class="text-muted small">4.5 (25)</span>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-3">
                  <div><span class="text-dark">$24</span>
                  </div>
                  <div><a href="#!" class="btn btn-primary btn-sm">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-plus">
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                      </svg> Add</a></div>
                </div>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card card-product">
              <div class="card-body">
                <div class="text-center position-relative"> <a href="./pages/shop-single.html"><img
                      src="assets/images/products/product-img-3.jpg" alt="Grocery Ecommerce Template"
                      class="mb-3 img-fluid"></a>
                  <div class="card-product-action">
                    <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                        class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                    <a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
                      title="Wishlist"><i class="bi bi-heart"></i></a>
                    <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                        class="bi bi-arrow-left-right"></i></a>
                  </div>
                </div>
                <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>Bakery &
                      Biscuits</small></a></div>
                <h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Cadbury 5
                    Star Chocolate</a></h2>
                <div class="text-warning">

                  <small> <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i></small> <span class="text-muted small">5 (469)</span>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-3">
                  <div><span class="text-dark">$32</span> <span
                      class="text-decoration-line-through text-muted">$35</span>
                  </div>
                  <div><a href="#!" class="btn btn-primary btn-sm">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-plus">
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                      </svg> Add</a></div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col">
            <div class="card card-product">
              <div class="card-body">
                <div class="text-center position-relative"> <a href="./pages/shop-single.html"><img
                      src="assets/images/products/product-img-4.jpg" alt="Grocery Ecommerce Template"
                      class="mb-3 img-fluid"></a>
                  <div class="card-product-action">
                    <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                        class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                    <a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
                      title="Wishlist"><i class="bi bi-heart"></i></a>
                    <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                        class="bi bi-arrow-left-right"></i></a>
                  </div>
                  <div class=" position-absolute top-0 start-0">
                    <span class="badge bg-danger">Hot</span>
                  </div>
                </div>
                <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>Snack &
                      Munchies</small></a></div>
                <h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Onion
                    Flavour Potato</a></h2>
                <div class="text-warning">

                  <small> <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-half"></i>
                    <i class="bi bi-star"></i></small> <span class="text-muted small">3.5 (456)</span>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-3">
                  <div><span class="text-dark">$3</span> <span class="text-decoration-line-through text-muted">$5</span>
                  </div>
                  <div><a href="#!" class="btn btn-primary btn-sm">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-plus">
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                      </svg> Add</a></div>
                </div>
              </div>
            </div>
          </div>
         
           <div class="col">
            <div class="card card-product">
              <div class="card-body">
                <div class="text-center position-relative"> <a href="./pages/shop-single.html"><img
                      src="assets/images/products/product-img-4.jpg" alt="Grocery Ecommerce Template"
                      class="mb-3 img-fluid"></a>
                  <div class="card-product-action">
                    <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                        class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                    <a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
                      title="Wishlist"><i class="bi bi-heart"></i></a>
                    <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                        class="bi bi-arrow-left-right"></i></a>
                  </div>
                  <div class=" position-absolute top-0 start-0">
                    <span class="badge bg-danger">Hot</span>
                  </div>
                </div>
                <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>Snack &
                      Munchies</small></a></div>
                <h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Onion
                    Flavour Potato</a></h2>
                <div class="text-warning">

                  <small> <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-half"></i>
                    <i class="bi bi-star"></i></small> <span class="text-muted small">3.5 (456)</span>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-3">
                  <div><span class="text-dark">$3</span> <span class="text-decoration-line-through text-muted">$5</span>
                  </div>
                  <div><a href="#!" class="btn btn-primary btn-sm">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-plus">
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                      </svg> Add</a></div>
                </div>
              </div>
            </div>
          </div>
         
         
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


  <!-- footer -->
<footer class="footer">
  <div class="container">
    <div class="row g-4 py-4">
   
       <!-- 푸터 항목 -->
      <div class="col-12 col-md-12 col-lg-4">
        <h6 class="mb-4">항목 1</h6>
        <div class="row">
          <div class="col-6">
            <!-- 항목 리스트 1 -->
            <ul class="nav flex-column">
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용1</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용2</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용3</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용4</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용5</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용6</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용7</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용8</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용9</a></li>
            </ul>
          </div>
          <div class="col-6">
			<!--  항목 1에 이어 지려고 하면 사용 -->
            <ul class="nav flex-column">
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용10</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용11</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용12</a></li>
            </ul>
          </div>
        </div>
      </div>
      
      <!-- 푸터 항목 2 -->
      <div class="col-12 col-md-12 col-lg-8">
        <div class="row g-4">
          <div class="col-6 col-sm-6 col-md-3">
            <h6 class="mb-4">항목2</h6>
			<!-- 항목 리스트 2 -->
            <ul class="nav flex-column">
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용1</a></li>
            </ul>
          </div>
          
          
            <!-- 푸터 항목 3 -->
          <div class="col-6 col-sm-6 col-md-3">
            <h6 class="mb-4">항목3</h6>
            <ul class="nav flex-column">
				<!--  항목 리스트 -->
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용1</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용2</a></li>
            </ul>
          </div>

   		  <!-- 푸터 항목 4 -->
          <div class="col-6 col-sm-6 col-md-3">
            <h6 class="mb-4">항목4</h6>
            <ul class="nav flex-column">
				<!--  항목 리스트 -->
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용1</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용2</a></li>
            </ul>
          </div>
          
               <!-- 푸터 항목 5 -->
          <div class="col-6 col-sm-6 col-md-3">
            <h6 class="mb-4">항목5</h6>
            <ul class="nav flex-column">
				<!--  항목 리스트 -->
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용1</a></li>
              <li class="nav-item mb-2"><a href="#!" class="nav-link">내용2</a></li>
            </ul>
          </div>
          
        </div>
      </div>
      
    </div>
    
    
    
<!-- 저작권 -->
    <div class="border-top py-4">
      <div class="row align-items-center">
        <div class="col-md-6">
	
	  © 2023 DADOK All rights reserved
      <span>  <a href=""></a>.</span></div>
		

      </div>

    </div>
  </div>
</footer>

  <!-- Javascript-->

  <!-- Libs JS -->
<script src="./assets/libs/jquery/dist/jquery.min.js"></script>
<script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="./assets/libs/simplebar/dist/simplebar.min.js"></script>

<!-- Theme JS -->
<script src="./assets/js/theme.min.js"></script>
  <script src="./assets/libs/jquery-countdown/dist/jquery.countdown.min.js"></script>
  <script src="./assets/js/vendors/countdown.js"></script>
  <script src="./assets/libs/slick-carousel/slick/slick.min.js"></script>
  <script src="./assets/js/vendors/slick-slider.js"></script>
  <script src="./assets/libs/tiny-slider/dist/min/tiny-slider.js"></script>
  <script src="./assets/js/vendors/tns-slider.js"></script>
  <script src="./assets/js/vendors/zoom.js"></script>
<script src="./assets/js/vendors/increment-value.js"></script>



</body>

</html>