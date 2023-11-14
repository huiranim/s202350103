<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
		/* $(window).load(function(){
			location.href = "recentBook";
		}) */
</script>

        <!-- col -->
        <aside class="col-lg-3 col-md-4 mb-6 mb-md-0">
          <div class="offcanvas offcanvas-start offcanvas-collapse w-md-50 " tabindex="-1" id="offcanvasCategory" aria-labelledby="offcanvasCategoryLabel">

            <div class="offcanvas-header d-lg-none">
              <h5 class="offcanvas-title" id="offcanvasCategoryLabel">Filter</h5>
              <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body ps-lg-2 pt-lg-0">
            <div class="mb-8">
            <!-- title -->
          
            <h5 class="mb-3">카테고리</h5>
            <!-- nav -->
            <ul class="nav nav-category" id="categoryCollapseMenu">
              
              <!--  국내도서  -->
              <li class="nav-item border-bottom w-100 " ><a href="#"
                  class="nav-link collapsed" data-bs-toggle="collapse"
                  data-bs-target="#categoryFlushOne" aria-expanded="false" aria-controls="categoryFlushOne">국내도서 <i class="feather-icon icon-chevron-right"></i></a>
                <!-- accordion collapse -->
                <div id="categoryFlushOne" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>
                    <!-- nav -->
				
				<!--  국내도서 분류 -->
                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=1&nb_category2=1" class="nav-link">경제/경영 </a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=1&nb_category2=2" class="nav-link">과학</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=1&nb_category2=3" class="nav-link">소설</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=1&nb_category2=4" class="nav-link">역사/문화</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=1&nb_category2=5" class="nav-link">인문</a></li>
                    </ul>
                  </div>
                </div>

              </li>
              
             <!--  해외도서 -->
              <!-- nav item -->
              <li class="nav-item border-bottom w-100 " ><a href="#"
                  class="nav-link collapsed" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                  	해외도서
                  <i class="feather-icon icon-chevron-right"></i>
                </a>

                <!-- collapse -->
                <div id="flush-collapseTwo" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>

                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=2&nb_category2=6" class="nav-link">과학/기술</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=2&nb_category2=7" class="nav-link">문학</a></li>
                    </ul>
                  </div>
                </div>

              </li>
              
              <!-- 중고국내도서 -->
              <li class="nav-item border-bottom w-100 " > <a
                  href="#" class="nav-link collapsed" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                 	중고국내도서
                  <i class="feather-icon icon-chevron-right"></i></a>

                <!-- collapse -->
                <div id="flush-collapseThree" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>
				
                    <!--  국내도서 분류 -->
                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=1&nb_category2=1" class="nav-link">경제/경영 </a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=1&nb_category2=2" class="nav-link">과학</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=1&nb_category2=3" class="nav-link">소설</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=1&nb_category2=4" class="nav-link">역사/문화</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=1&nb_category2=5" class="nav-link">인문</a></li>
                    </ul>
                  </div>
                </div>
              </li>

			<!-- 중고해외도서 -->	
              <li class="nav-item border-bottom w-100 "> <a
                  href="#" class="nav-link collapsed"  data-bs-toggle="collapse"
                  data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                  	중고해외도서
                  <i class="feather-icon icon-chevron-right"></i></a>

                <!-- collapse -->
                <div id="flush-collapseFour" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>
                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=2&nb_category2=6" class="nav-link">과학/기술</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=2&nb_category2=7" class="nav-link">문학</a></li>
                    </ul>
                  </div>
                </div>
              </li>
            </ul>
          </div>
          
		<!-- 최근 본 상품 리스트 -->
		
		<div style="border:1px solid black">
			<h6>최근 본 상품</h6>
				<!-- 최근 본 상품이 있을 때 -->
				<c:if test="${result == 1}">
					
						<div class="col-lg-4">
						  <div class="card card-product">
						     <div class="card-body">
						       <!-- 도서 이미지 -->
						       <div class="text-center position-relative ">
						         <a href="#!">
						         	<c:choose>
									     <c:when test="${fn:contains(newbook.nb_image, 'http')}">
									        <img src="${newbook.nb_image }" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 13rem;">
									     </c:when>
									     <c:otherwise>
									        <img src="${pageContext.request.contextPath}/upload/${newbook.nb_image}" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 13rem;">
									     </c:otherwise>
									</c:choose> 
						         </a>
						       </div>
						       <!-- 도서 카테고리 -->
						       <div class="text-small mb-1">
						       	<a href="#!" class="text-decoration-none text-muted">
						       		<small>
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
						       		</small>
						       	</a>
						       </div>
						       <!-- 도서 제목 -->	
						       <h2 class="fs-6">
						       		<a href="#" class="text-inherit text-decoration-none">${newbook.nb_title }</a>
						       </h2>
						       <!-- 도서 가격 -->
						       <div class="d-flex justify-content-between align-items-center mt-3">
						         <div>
						         	<span class="text-dark">${newbook.nb_price }</span> 
						         </div>
						       </div>
						     </div>
						   </div>
						 </div>
					 
					</c:if>
			 	</div> 
			 <!-- 최근 본 상품이 없을 때 --> 
			 <c:if test="${result == 0 }">
			 	<h6>최근 본 도서가 없습니다.</h6>
			 </c:if>               
        </div>
       </div>
      </aside>
    	  <section class="col-lg-9 col-md-12">

