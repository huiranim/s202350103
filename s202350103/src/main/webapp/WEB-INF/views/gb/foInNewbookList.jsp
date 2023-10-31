<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	
	function category2Click(currentPage1) {
		// 클릭한 카테고리명
		var category2Value = $("#category2").val();
		var orderTypeValue = $("#orderType").val();
		alert("내가 선택한 카테고리 + 정렬 -> " + category2Value + "+" + orderTypeValue);
		
		if(category2Value == "all"){
			// alert("내가 선택한 카테고리 -> "+category2Value);
			location.href = "/innewbookList?currentPage="+currentPage1+"&orderType="+orderTypeValue;
		}
		else if(category2Value == "economy"){
			// alert("내가 선택한 카테고리 -> "+category2Value);
			location.href = "/innewbookEcoList?currentPage="+currentPage1;
			
		}
		else if(category2Value == "science"){
			// alert("내가 선택한 카테고리 -> "+category2Value);
			location.href = "/innewbookSciList?currentPage="+currentPage1;
			
		}
		else if(category2Value == "novel"){
			// alert("내가 선택한 카테고리 -> "+category2Value);
			location.href = "/innewbookNovList?currentPage="+currentPage1;
			
		}
		else if(category2Value == "history"){
			// alert("내가 선택한 카테고리 -> "+category2Value);
			location.href = "/innewbookHisList?currentPage="+currentPage1;
			
		}
		else if(category2Value == "human"){
			// alert("내가 선택한 카테고리 -> "+category2Value);
			location.href = "/innewbookHumList?currentPage="+currentPage1;
			
		}
		else {
			alert("해당되는 카테고리 없음");
			
		}
		
	}
</script>
</head>
<body>
<!-- 정렬조건 및 카테고리 검색 -->
<div class="row py-5 mb-3" style="background-color: #EBEBEB">
 <div class="col-12">
    <div class="d-lg-flex justify-content-between align-items-center">
       <div class="mb-3 mb-lg-0">
          <p class="mb-0"> <span class="text-dark">${inNewbookCnt} </span> Products found </p>
       </div>
       
       <!-- icon -->
       <div class="d-md-flex justify-content-between align-items-center">
          <div class="d-flex align-items-center justify-content-between">
             <div class="">
                <a href="../../pages/shop-list.html" class="text-muted me-3 active"><i class="bi bi-list-ul"></i></a>
                <a href="../../pages/shop-grid.html" class=" me-3"><i class="bi bi-grid"></i></a>
             </div>
             
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
          
          <div class="d-flex mt-2 mt-lg-0">
             <div class="me-2 flex-grow-1">
               	<!-- 카테고리 검색 -->
                <select id="category2" class="form-select" aria-label="Default select example" onchange = "category2Click(${page.currentPage1 })">
                   <option value="all" <c:if test ="${category eq '0'}"> selected="selected"</c:if>>전체</option>
                   <option value="economy" <c:if test ="${category eq '1'}"> selected="selected"</c:if>>경제/경영</option>
                   <option value="science" <c:if test ="${category eq '2'}"> selected="selected"</c:if>>과학</option>
                   <option value="novel" <c:if test ="${category eq '3'}"> selected="selected"</c:if>>소설</option>
                   <option value="history" <c:if test ="${category eq '4'}"> selected="selected"</c:if>>역사/문화</option>
                   <option value="human" <c:if test ="${category eq '5'}"> selected="selected"</c:if>>인문</option>
     			</select>
             </div>
             
             <div>
                <!-- 정렬 조건 -->
                <select id="orderType" class="form-select" aria-label="Default select example" onchange="category2Click(${page.currentPage1 })">
                   <option value="recently" <c:if test ="${orderType eq 'recently'}"> selected="selected"</c:if>>최신순</option>
                   <option value="highreview" <c:if test ="${orderType eq 'highreview'}"> selected="selected"</c:if>>높은별점순</option>
                   <option value="highprice" <c:if test ="${orderType eq 'highprice'}"> selected="selected"</c:if>>높은가격순 </option>
                   <option value="lowprice" <c:if test ="${orderType eq 'lowprice'}"> selected="selected"</c:if>>낮은가격순</option>
                </select>
             </div>
          </div>
       </div>
    </div>
 </div>
</div>

<!-- 국내도서 리스트 -->
<c:forEach var="inNewbook" items="${listInNewbook }">
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
		                    <a href="shop-single.html">
		                       <!-- 도서 이미지 -->
		                       <img src="${inNewbook.nb_image }" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 13rem;">
		                    </a>
		                 </div>
		              </div>
		              <div class="col-md-8 col-12 flex-grow-1">
		                 <!-- 도서 제목 -->
		                 <h1 class="fs-2 mb-3"><a href="shop-single.html" class="text-inherit text-decoration-none">${inNewbook.nb_title}</a>
		                 </h1>
		                 <!-- 지은이, 출판사, 출판일 -->
		                 <h3 class="fs-6 mb-3">${inNewbook.nb_writer} | ${inNewbook.nb_publisher} | ${inNewbook.nb_publi_date}
		                 </h3>
		              <div>
		                    <!-- 별점 -->
		                    <div class="text-warning"> <i class="bi bi-star-fill"></i>
		                    <i class="bi bi-star-fill"></i>
		                    <i class="bi bi-star-fill"></i>
		                    <i class="bi bi-star-fill"></i>
		                    <i class="bi bi-star-half"></i></div> <span class="text-muted small">4.5(149)</span>
		              </div>
		                 
		                 <!-- 도서가격 + 버튼들 -->
		                 <div class="  mt-8 mb-3">
		                    <!-- 도서 가격 -->
		                    <div>
		                     <span class="text-dark fs-3">${inNewbook.nb_price}원</span>
		                     <span id="price_point" class="text-muted ml-5">적립포인트 : ${inNewbook.nb_price * 0.01}p</span>
		                    </div>
		                    
		                    <!-- 찜, 바로구매,  장바구니 버튼 -->
		                    <div class="mt-2">
		                       <!-- 찜하기 버튼 -->	
		                       <a href="shop-wishlist.html" class="btn btn-icon btn-sm btn-outline-gray-400 text-muted"
		                          data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i
		                          class="bi bi-heart"></i></a>
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
		                       <a href="#!" class="btn btn-secondary ">
		                  	   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
		                  		fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
		                  		stroke-linejoin="round" class="feather feather-shopping-bag me-2">
			                  	   <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
			                  	   <line x1="3" y1="6" x2="21" y2="6"></line>
			                       <path d="M16 10a4 4 0 0 1-8 0"></path>
		                 	   </svg>
		                  		장바구니
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
</c:forEach>       
  
<!-- 페이징 처리 -->
<div class="row mt-8">
  <div class="col">
    <!-- nav -->
    <nav>
      <ul class="pagination">
        <!-- 이전버튼 -->
        <c:if test="${page.startPage > page.pageLimit}">
        	<!-- 전체도서 검색할 때 -->
	        <c:if test="${category eq '0'}">
		        <li class="page-item">
		          <a class="page-link  mx-1 " href="innewbookList?currentPage=${page.startPage-page.pageLimit}" aria-label="Previous">
		            <i class="feather-icon icon-chevron-left"></i>
		          </a>
		        </li>
	        </c:if>
	        <c:if test="${category eq '1'}">
		        <li class="page-item">
		          <a class="page-link  mx-1 " href="innewbookEcoList?currentPage=${page.startPage-page.pageLimit}" aria-label="Previous">
		            <i class="feather-icon icon-chevron-left"></i>
		          </a>
		        </li>
	        </c:if>
	        <c:if test="${category eq '2'}">
		        <li class="page-item">
		          <a class="page-link  mx-1 " href="innewbookSciList?currentPage=${page.startPage-page.pageLimit}" aria-label="Previous">
		            <i class="feather-icon icon-chevron-left"></i>
		          </a>
		        </li>
	        </c:if>
	        <c:if test="${category eq '3'}">
		        <li class="page-item">
		          <a class="page-link  mx-1 " href="innewbookNovList?currentPage=${page.startPage-page.pageLimit}" aria-label="Previous">
		            <i class="feather-icon icon-chevron-left"></i>
		          </a>
		        </li>
	        </c:if>
	        <c:if test="${category eq '4'}">
		        <li class="page-item">
		          <a class="page-link  mx-1 " href="innewbookHisList?currentPage=${page.startPage-page.pageLimit}" aria-label="Previous">
		            <i class="feather-icon icon-chevron-left"></i>
		          </a>
		        </li>
	        </c:if>
	        <c:if test="${category eq '5'}">
		        <li class="page-item">
		          <a class="page-link  mx-1 " href="innewbookHumList?currentPage=${page.startPage-page.pageLimit}" aria-label="Previous">
		            <i class="feather-icon icon-chevron-left"></i>
		          </a>
		        </li>
	        </c:if>
        </c:if>
        
        <!-- 페이지 넘버 -->
        <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
        	<c:if test="${category eq '0'}">
        		<li class="page-item"><a class="page-link mx-1 text-body" href="innewbookList?currentPage=${i }">${i }</a></li>
        	</c:if>
        	<c:if test="${category eq '1'}">
        		<li class="page-item"><a class="page-link mx-1 text-body" href="innewbookEcoList?currentPage=${i }">${i }</a></li>
        	</c:if>
        	<c:if test="${category eq '2'}">
        		<li class="page-item"><a class="page-link mx-1 text-body" href="innewbookSciList?currentPage=${i }">${i }</a></li>
        	</c:if>
        	<c:if test="${category eq '3'}">
        		<li class="page-item"><a class="page-link mx-1 text-body" href="innewbookNovList?currentPage=${i }">${i }</a></li>
        	</c:if>
        	<c:if test="${category eq '4'}">
        		<li class="page-item"><a class="page-link mx-1 text-body" href="innewbookHisList?currentPage=${i }">${i }</a></li>
        	</c:if>
        	<c:if test="${category eq '5'}">
        		<li class="page-item"><a class="page-link mx-1 text-body" href="innewbookHumList?currentPage=${i }">${i }</a></li>
        	</c:if>
        </c:forEach>
        
        
        <!-- <li class="page-item "><a class="page-link  mx-1 active" href="#">1</a></li>
        <li class="page-item"><a class="page-link mx-1 text-body" href="#">2</a></li>
        <li class="page-item"><a class="page-link mx-1 text-body" href="#">...</a></li>
        <li class="page-item"><a class="page-link mx-1 text-body" href="#">12</a></li>
         -->
         
        <!-- 다음 버튼 -->
        <c:if test="${page.endPage < page.totalPage}">
        	<c:if test="${category eq '0'}">
		        <li class="page-item">
		          <a class="page-link mx-1 text-body" href="innewbookList?currentPage=${page.startPage+page.pageLimit }" aria-label="Next">
		            <i class="feather-icon icon-chevron-right"></i>
		          </a>
		        </li>
	        </c:if>
	        <c:if test="${category eq '1'}">
		        <li class="page-item">
		          <a class="page-link mx-1 text-body" href="innewbookEcoList?currentPage=${page.startPage+page.pageLimit }" aria-label="Next">
		            <i class="feather-icon icon-chevron-right"></i>
		          </a>
		        </li>
	        </c:if>
	        <c:if test="${category eq '2'}">
		        <li class="page-item">
		          <a class="page-link mx-1 text-body" href="innewbookSciList?currentPage=${page.startPage+page.pageLimit }" aria-label="Next">
		            <i class="feather-icon icon-chevron-right"></i>
		          </a>
		        </li>
	        </c:if>
	        <c:if test="${category eq '3'}">
		        <li class="page-item">
		          <a class="page-link mx-1 text-body" href="innewbookNovList?currentPage=${page.startPage+page.pageLimit }" aria-label="Next">
		            <i class="feather-icon icon-chevron-right"></i>
		          </a>
		        </li>
	        </c:if>
	        <c:if test="${category eq '4'}">
		        <li class="page-item">
		          <a class="page-link mx-1 text-body" href="innewbookHisList?currentPage=${page.startPage+page.pageLimit }" aria-label="Next">
		            <i class="feather-icon icon-chevron-right"></i>
		          </a>
		        </li>
	        </c:if>
	        <c:if test="${category eq '5'}">
		        <li class="page-item">
		          <a class="page-link mx-1 text-body" href="innewbookHumList?currentPage=${page.startPage+page.pageLimit }" aria-label="Next">
		            <i class="feather-icon icon-chevron-right"></i>
		          </a>
		        </li>
	        </c:if>
        </c:if>
       
      </ul>
    </nav>
  </div>
</div>


</body>
<%@ include file="../common/footerFo.jsp" %>
</html>