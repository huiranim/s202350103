<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/headerFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	function deleteCart(pNb_num){
		if(confirm("삭제하시겠습니까?")){
			location.href = "deleteCart?nb_num="+pNb_num;
		}
		
	}
</script>
</head>
<body>
<%@ include file="../common/sideFo.jsp" %>
  <main>
  <section class="mb-lg-14 mb-8">
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-12">
          <!-- 장바구니 헤더 -->
          <div class="card py-1 border-0">
         	<div class="mb-8">
		         <h2>장바구니</h2>
		         <p><a href="#">${member.m_id } 님의 장바구니 목록입니다.</a></p>
		               총 상품 개수 : ${totalCart }		
	      	</div>
          <div>
        </div>
      </div>
      <!-- row -->
      <div class="row">
        <div class="col-lg-8 col-md-7">
          <div class="py-3">
          	<div class="table-responsive">
		        <table class="table text-nowrap table-with-checkbox">
		                <thead class="table-light">
		                  <tr>
		                    <th></th>
		                    <th style="padding-left: 70px;">제목</th>
		                    <th></th>
		                    <th></th>    
		                    <th></th>
		                    <th>수량</th>
		                   	<th style="padding-left: ;padding-right: 0px;padding-left: 70px;">가격</th>
		                  </tr>
		                </thead>
		         </table>
		    </div>
       		<form action="cartList" method="post">
	          <c:forEach var="cart" items="${listCart }" varStatus="status">   
	          	<input type="hidden" name="nb_num" value="${cart.nb_num }">
	            <ul id="cart${status.index }" class="list-group list-group-flush">
	             <li class="list-group-item py-3 py-lg-0 px-0 border-top">  
	              <div class="row align-items-center">
	             	<div class="col-3 col-md-2">
	                    <a href="newbookDetail?nb_num=${cart.nb_num }"><img src="${cart.nb_image}" alt="Ecommerce" class="img-fluid"></a>
	                </div>
	  				<div class="col-4 col-md-5">
	                    <!-- 도서 제목 -->
	                    <a href="newbookDetail?nb_num=${cart.nb_num }" class="text-inherit"><h6 class="mb-0">${cart.nb_title }</h6></a>
	                    <span><small class="text-muted">${cart.nb_publisher }</small></span>
	                    <!-- text -->
	                    <div class="mt-2 small lh-1"> <a onclick="deleteCart(${cart.nb_num})" class="text-decoration-none text-inherit"> <span
	                          class="me-1 align-text-bottom">
	                          <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
	                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
	                            class="feather feather-trash-2 text-success">
	                            <polyline points="3 6 5 6 21 6"></polyline>
	                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
	                            </path>
	                            <line x1="10" y1="11" x2="10" y2="17"></line>
	                            <line x1="14" y1="11" x2="14" y2="17"></line>
	                          </svg></span><span class="text-muted">삭제하기</span></a></div>
	                  </div>
	                   <!-- input group -->
	                  <div class="col-4 col-md-3 col-lg-3">
	                       <!-- input -->
	                  	<div class="input-group input-spinner  ">
	                    	<input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
				            <input type="number" step="1" max="10" value="${cart.c_count }" name="quantity" class="quantity-field form-control-sm form-input">
				            <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
	                  	</div>
	                  </div>
	                    <!-- price -->
	                  <div class="col-2 text-lg-end text-start text-md-end col-md-2" style="padding-left: 0px;">
	                    <span class="fw-bold"><fmt:formatNumber value="${cart.nb_price * cart.c_count}" pattern="#,###" />원</span>
	                  </div>
	                 </div>
					</li> 	
				  </ul>
	             </c:forEach>    
	                 
	            <!-- btn -->
	            <div class="d-flex justify-content-between mt-4">
	              <button type="submit" class="btn btn-dark">수정하기</button>
	            </div>
            </form>
          </div>
          <!-- section -->
		    
		</div>

        <!-- 사이드  결제 버튼 -->
        <div class="col-12 col-lg-4 col-md-5">
          <!-- card -->
          <div class="mb-5 card mt-6">
            <div class="card-body p-6">
              <!-- heading -->
              	<h5>상품금액 <span><fmt:formatNumber value="${totalPrice }" pattern="#,###" /> 원</span></h5> 
              	<h5>배송비 <span>
              	<c:if test="${totalPrice > 50000 }"><fmt:formatNumber value="0" pattern="#,###" /> 원</c:if>
              	<c:if test="${totalPrice <= 50000 }"><fmt:formatNumber value="3000" pattern="#,###" /> 원</c:if></span></h5> 
              <hr>
              	<h5>결제예정금액 <span><fmt:formatNumber value="${totalPrice }" pattern="#,###" /> 원</span></h5> 
              <div class="d-grid mb-1 mt-4">
                <!-- btn -->
                <button class="btn btn-primary justify-content-between align-items-center" type="submit">
                  	주문하기(${totalCart })</button>
              </div>
              </div>
            </div>
          </div>
        </div>
      </div>
  </section>
</main>


<%@ include file="../common/footerFo.jsp" %>
</body>
</html>