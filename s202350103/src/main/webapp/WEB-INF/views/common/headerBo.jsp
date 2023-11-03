<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
<title>DADOK-AD</title>
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon"
	href="../assets/images/favicon/favicon.ico">


<!-- Libs CSS -->
<link href="../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css"
	rel="stylesheet">
<link href="../assets/libs/feather-webfont/dist/feather-icons.css"
	rel="stylesheet">
<link href="../assets/libs/simplebar/dist/simplebar.min.css"
	rel="stylesheet">


<!-- Theme CSS -->
<link rel="stylesheet" href="../assets/css/theme.min.css">
<!-- Google tag (gtag.js) -->

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap JS -->
<script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>


<!-- End Tag -->

</head>

<body>
	<!-- main -->
	<div>
		<nav class="navbar navbar-expand-lg navbar-glass">
			<div class="container-fluid">
				<div class="d-flex justify-content-between align-items-center w-100">
					<div class="d-flex align-items-center">

						<a class="text-inherit d-block d-xl-none me-4"
							data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
							aria-controls="offcanvasExample"> <svg
								xmlns="http://www.w3.org/2000/svg" width="32" height="32"
								fill="currentColor" class="bi bi-text-indent-right"
								viewBox="0 0 16 16">
                    <path
									d="M2 3.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm10.646 2.146a.5.5 0 0 1 .708.708L11.707 8l1.647 1.646a.5.5 0 0 1-.708.708l-2-2a.5.5 0 0 1 0-.708l2-2zM2 6.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z" />
                  </svg>
						</a>

				  <!-- <form role="search">
                    <input class="form-control" type="search" placeholder="Search" aria-label="Search">

                </form>  -->
                	<a href="/">
                	<div>
	                	<i class="bi bi-universal-access-circle me-1" ></i>
	                	회원페이지 전환
                	</div>
                	</a>
                	
                
					</div>
					<div></div>
				</div>


			</div>
	</div>

	<div class="main-wrapper">

		<!-- 전체회면  -->
		<nav class="navbar-vertical-nav d-none d-xl-block ">
			<div class="navbar-vertical">
				<div class="px-4 py-5">
					<a href="/" class="navbar-brand">
						<h3>DADOK</h3>
					</a>
				</div>
				<div class="navbar-vertical-content flex-grow-1" data-simplebar="">
					<ul class="navbar-nav flex-column" id="sideNavbar">

						<li class="nav-item "><a class="nav-link  active " href="#">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"> <i class="bi bi-house"></i></span>
									<span class="nav-link-text">MAIN</span>
								</div>
						</a></li>
						<li class="nav-item mt-6 mb-3"><span class="nav-label">관리자
								메뉴</span></li>
						<li class="nav-item"><a class="nav-link   collapsed "
							href="#" data-bs-toggle="collapse" data-bs-target="#navMembers"
							aria-expanded="false" aria-controls="navCategoriesOrders">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-people"></i></span>
									<span class="nav-link-text">회원관리</span>
								</div>
						</a>
							<div id="navMembers" class="collapse "
								data-bs-parent="#sideNavbar">
								<ul class="nav flex-column">
									<li class="nav-item "><a class="nav-link "
										href="../dashboard/order-list.html"> 메뉴1 </a></li>
									<!-- Nav item -->
									<li class="nav-item "><a class="nav-link "
										href="../dashboard/order-single.html"> 메뉴2 </a></li>
								</ul>
							</div></li>

						<li class="nav-item"><a class="nav-link   collapsed "
							href="#" data-bs-toggle="collapse" data-bs-target="#navProducts"
							aria-expanded="false" aria-controls="navCategoriesOrders">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-book"></i></span> <span
										class="nav-link-text">상품관리</span>
								</div>
						</a>
							<div id="navProducts" class="collapse "
								data-bs-parent="#sideNavbar">
								<ul class="nav flex-column">
									<li class="nav-item "><a class="nav-link "
										href="../dashboard/order-list.html"> 메뉴1 </a></li>
									<!-- Nav item -->
									<li class="nav-item "><a class="nav-link "
										href="../dashboard/order-single.html"> 메뉴2 </a></li>
								</ul>
							</div></li>


						<li class="nav-item"><a class="nav-link   collapsed "
							href="#" data-bs-toggle="collapse"
							data-bs-target="#navOldProducts" aria-expanded="false"
							aria-controls="navCategoriesOrders">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-journal"></i></span>
									<span class="nav-link-text">중고상품관리</span>
								</div>
						</a>
							<div id="navOldProducts" class="collapse "
								data-bs-parent="#sideNavbar">
								<ul class="nav flex-column">
									<li class="nav-item "><a class="nav-link "
										href="../dashboard/order-list.html"> 메뉴1 </a></li>
									<!-- Nav item -->
									<li class="nav-item "><a class="nav-link "
										href="../dashboard/order-single.html"> 메뉴2 </a></li>
								</ul>
							</div></li>


						<li class="nav-item"><a class="nav-link   collapsed "
							href="#" data-bs-toggle="collapse" data-bs-target="#navOrders"
							aria-expanded="false" aria-controls="navCategoriesOrders">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-cart"></i></span> <span
										class="nav-link-text">주문관리</span>
								</div>
						</a>
							<div id="navOrders" class="collapse "
								data-bs-parent="#sideNavbar">
								<ul class="nav flex-column">
									<li class="nav-item "><a class="nav-link "
										href="../dashboard/order-list.html"> 메뉴1 </a></li>
									<!-- Nav item -->
									<li class="nav-item "><a class="nav-link "
										href="../dashboard/order-single.html"> 메뉴2 </a></li>
								</ul>
							</div></li>


						<li class="nav-item"><a class="nav-link   collapsed "
							href="#" data-bs-toggle="collapse" data-bs-target="#navEvent"
							aria-expanded="false" aria-controls="navCategoriesOrders">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-star"></i></span> <span
										class="nav-link-text">이벤트관리</span>
								</div>
						</a>
							<div id="navEvent" class="collapse " data-bs-parent="#sideNavbar">
								<ul class="nav flex-column">
									<li class="nav-item "><a class="nav-link "
										href="../dashboard/order-list.html"> 메뉴1 </a></li>
									<!-- Nav item -->
									<li class="nav-item "><a class="nav-link "
										href="../dashboard/order-single.html"> 메뉴2 </a></li>
								</ul>
							</div></li>





					</ul>
				</div>
			</div>
		</nav>

		<!-- 화면 줄었을 때    -->
		<nav
			class="navbar-vertical-nav offcanvas offcanvas-start navbar-offcanvac"
			tabindex="-1" id="offcanvasExample">
			<div class="navbar-vertical">
				<div
					class="px-4 py-5 d-flex justify-content-between align-items-center">
					<a href="/" class="navbar-brand">
						<h3>DADOK</h3>
					</a>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				<div class="navbar-vertical-content flex-grow-1" data-simplebar="">
					<ul class="navbar-nav flex-column">
						<li class="nav-item "><a class="nav-link  active "
							href="../dashboard/index.html">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"> <i class="bi bi-house"></i></span>
									<span>MAIN</span>
								</div>
						</a></li>
						<li class="nav-item mt-6 mb-3"><span class="nav-label">관리자
								메뉴</span></li>

						<li class="nav-item"><a class="nav-link   collapsed "
							href="#" data-bs-toggle="collapse" data-bs-target="#navMembers"
							aria-expanded="false" aria-controls="navOrders">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"> <i class="bi bi-people"></i></span>
									<span class="nav-link-text">회원관리</span>
								</div>
						</a>
							<div id="navMembers" class="collapse "
								data-bs-parent="#sideNavbar">
								<ul class="nav flex-column">
									<li class="nav-item "><a class="nav-link " href="#">
											메뉴1 </a></li>
									<!-- Nav item -->
									<li class="nav-item "><a class="nav-link " href="#">
											메뉴2 </a></li>
								</ul>
							</div></li>

						<li class="nav-item"><a class="nav-link   collapsed "
							href="#" data-bs-toggle="collapse" data-bs-target="#navProducts"
							aria-expanded="false" aria-controls="navOrders">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"> <i class="bi bi-book"></i></span>
									<span class="nav-link-text">상품관리</span>
								</div>
						</a>
							<div id="navProducts" class="collapse "
								data-bs-parent="#sideNavbar">
								<ul class="nav flex-column">
									<li class="nav-item "><a class="nav-link " href="#">
											메뉴1 </a></li>
									<!-- Nav item -->
									<li class="nav-item "><a class="nav-link " href="#">
											메뉴2 </a></li>
								</ul>
							</div></li>

						<li class="nav-item"><a class="nav-link   collapsed "
							href="#" data-bs-toggle="collapse"
							data-bs-target="#navOldProducts" aria-expanded="false"
							aria-controls="navOrders">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"> <i class="bi bi-journal"></i></span>
									<span class="nav-link-text">중고상품관리</span>
								</div>
						</a>
							<div id="navOldProducts" class="collapse "
								data-bs-parent="#sideNavbar">
								<ul class="nav flex-column">
									<li class="nav-item "><a class="nav-link " href="#">
											메뉴1 </a></li>
									<!-- Nav item -->
									<li class="nav-item "><a class="nav-link " href="#">
											메뉴2 </a></li>
								</ul>
							</div></li>


						<li class="nav-item"><a class="nav-link   collapsed "
							href="#" data-bs-toggle="collapse" data-bs-target="#navOrders"
							aria-expanded="false" aria-controls="navOrders">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-cart"></i></span> <span
										class="nav-link-text">주문관리</span>
								</div>
						</a>
							<div id="navOrders" class="collapse "
								data-bs-parent="#sideNavbar">
								<ul class="nav flex-column">
									<li class="nav-item "><a class="nav-link " href="#">
											메뉴1 </a></li>
									<!-- Nav item -->
									<li class="nav-item "><a class="nav-link " href="#">
											메뉴2 </a></li>
								</ul>
							</div></li>


						<li class="nav-item">
							<!-- 토글 버튼에 고유한 data-bs-target 부여 --> <a
							class="nav-link   collapsed " href="#navEvents"
							data-bs-toggle="collapse" data-bs-target="#navEvents"
							aria-expanded="false" aria-controls="navEvents">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-star"></i></span> <span
										class="nav-link-text">이벤트관리</span>
								</div>
						</a> <!-- 메뉴를 감싸는 div 요소에 고유한 id 부여 -->
							<div id="navEvents" class="collapse" data-bs-parent="#sideNavbar">
								<ul class="nav flex-column">
									<li class="nav-item"><a class="nav-link" href="#"> 메뉴1
									</a></li>
									<!-- Nav item -->
									<li class="nav-item"><a class="nav-link" href="#"> 메뉴2
									</a></li>
								</ul>
							</div>
						</li>

					</ul>
				</div>
			</div>

		</nav>


		<!-- main wrapper -->
		<main class="main-content-wrapper">
			<section class="container">

				<!-- row -->
				<div class="row ">
					<div class="col-xl-12 col-lg-12 col-md-12 col-12 mb-6">
						<div class="card h-100 card-lg">
							<!-- heading -->
							<div class="p-6">
								<h3 class="mb-0 fs-5">관리자 페이지 입니다</h3>
							</div>
						</div>
					</div>
				</div>


				<div class="row mb-10">
					<div class="col-md-10">
					<!-- 내용 -->
					
					
					
