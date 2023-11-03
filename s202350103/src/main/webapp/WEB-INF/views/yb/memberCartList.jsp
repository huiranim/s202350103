<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/headerFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/sideFo.jsp" %>




<!-- Shop Cart -->

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header border-bottom">
    <div class="text-start">
      <h5 id="offcanvasRightLabel" class="mb-0 fs-4">장바구니</h5>
    </div>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">

    <div class="">
      <!-- alert -->
      <ul class="list-group list-group-flush">
        <!-- list group -->
        <li class="list-group-item py-3 ps-0 border-top">
          <!-- row -->
          <div class="row align-items-center">

            <div class="col-6 col-md-6 col-lg-7">
              <div class="d-flex">
              <img src="../assets/images/products/product-img-1.jpg" alt="Ecommerce"
                class="icon-shape icon-xxl">
                <div class="ms-3">
              <!-- title -->
              <a href="../pages/shop-single.html" class="text-inherit">
                <h6 class="mb-0">Haldiram's Sev Bhujia</h6>
              </a>
              <span><small class="text-muted">.98 / lb</small></span>
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
                    </svg></span><span class="text-muted">Remove</span></a></div>
                  </div>
                </div>
            </div>
            <!-- input group -->
            <div class="col-4 col-md-3 col-lg-3">
              <!-- input -->
              <!-- input -->
              <div class="input-group input-spinner  ">
                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
                <input type="number" step="1" max="10" value="1" name="quantity"
                  class="quantity-field form-control-sm form-input   ">
                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
              </div>

            </div>
            <!-- price -->
            <div class="col-2 text-lg-end text-start text-md-end col-md-2">
              <span class="fw-bold">$5.00</span>

            </div>
          </div>

        </li>
       
 

      </ul>
      <!-- btn -->
      <div class="d-flex justify-content-between mt-4">
        <a href="#!" class="btn btn-primary">Continue Shopping</a>
        <a href="#!" class="btn btn-dark">Update Cart</a>
      </div>

    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="locationModal" tabindex="-1" aria-labelledby="locationModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-body p-6">
        <div class="d-flex justify-content-between align-items-start ">
          <div>
            <h5 class="mb-1" id="locationModalLabel">Choose your Delivery Location</h5>
            <p class="mb-0 small">Enter your address and we will specify the offer you area. </p>
          </div>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="my-5">
          <input type="search" class="form-control" placeholder="Search your area">
        </div>
        <div class="d-flex justify-content-between align-items-center mb-2">
          <h6 class="mb-0">Select Location</h6>
          <a href="#" class="btn btn-outline-gray-400 text-muted btn-sm">Clear All</a>


        </div>
        <div>
          <div data-simplebar style="height:300px;">
            <div class="list-group list-group-flush">

              <a href="#"
                class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action active">
                <span>Alabama</span><span>Min:$20</span></a>
              <a href="#"
                class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                <span>Alaska</span><span>Min:$30</span></a>
              <a href="#"
                class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                <span>Arizona</span><span>Min:$50</span></a>
              <a href="#"
                class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                <span>California</span><span>Min:$29</span></a>
              <a href="#"
                class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                <span>Colorado</span><span>Min:$80</span></a>
              <a href="#"
                class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                <span>Florida</span><span>Min:$90</span></a>
              <a href="#"
                class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                <span>Arizona</span><span>Min:$50</span></a>
              <a href="#"
                class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                <span>California</span><span>Min:$29</span></a>
              <a href="#"
                class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                <span>Colorado</span><span>Min:$80</span></a>
              <a href="#"
                class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                <span>Florida</span><span>Min:$90</span></a>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>
  <main>

  <section class="mb-lg-14 mb-8 mt-8">
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-12">
          <!-- card -->
          <div class="card py-1 border-0 mb-8">
            <div>
              <h1 class="fw-bold">장바구니</h1><br>
              	<h4>총 상품 개수 : ${totalCart }</h4>
            </div>
          </div>
        </div>
      </div>
      <!-- row -->
      <div class="row">
        <div class="col-lg-8 col-md-7">
	
          <div class="py-3">
       
          <c:forEach var="cart" items="${listCart }">
          
            <ul class="list-group list-group-flush">
             <li class="list-group-item py-3 py-lg-0 px-0 border-top">  
              <div class="row align-items-center">
             	<div class="col-3 col-md-2">
                    <a href="newbookDetail?nb_num=${cart.nb_num }"><img src="${cart.nb_image}" alt="Ecommerce" class="img-fluid"></a>
                </div>
  				<div class="col-4 col-md-5">
                    <!-- title -->
                    <a href="newbookDetail?nb_num=${cart.nb_num }" class="text-inherit"><h6 class="mb-0">${cart.nb_title }</h6></a>
                    <span><small class="text-muted">${cart.nb_publisher }</small></span>
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
                          </svg></span><span class="text-muted">삭제하기</span></a></div>
                  </div>
                   <!-- input group -->
                  <div class="col-4 col-md-3 col-lg-2">
                       <!-- input -->
                  	<div class="input-group input-spinner  ">
                    	<input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
                    	<input type="number" step="1" max="10" value="${cart.c_count }" name="quantity" class="quantity-field form-control-sm form-input   ">
                    	<input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
                  	</div>
                  </div>
                    <!-- price -->
                  <div class="col-2 text-lg-end text-start text-md-end col-md-2">
                    <span class="fw-bold">${cart.nb_price}</span>
                  </div>
                 </div>
				</li> 	
			  </ul>
             </c:forEach>    
                 
                 
            
            <!-- btn -->
            <div class="d-flex justify-content-between mt-4">
              <a href="#!" class="btn btn-primary">쇼핑 계속하기</a>
              <a href="#!" class="btn btn-dark">수정하기</a>
            </div>

          </div>
          <!-- section -->
		    
		
		</div>

        <!-- sidebar -->
        <div class="col-12 col-lg-4 col-md-5">
          <!-- card -->
          <div class="mb-5 card mt-6">
            <div class="card-body p-6">
              <!-- heading -->
              <h2 class="h5 mb-4">총 상품 개수 : ${totalCart }</h2>
              <h2 class="h5 mb-4">총 금액 : <fmt:formatNumber value="${totalPrice }" pattern="#,###" /> 원</h2>
              <div class="d-grid mb-1 mt-4">
                <!-- btn -->
                <button class="btn btn-primary btn-lg d-flex justify-content-between align-items-center" type="submit">
                  	결제하러 가기<span class="fw-bold"><fmt:formatNumber value="${totalPrice }" pattern="#,###" />원</span></button>
              </div>
              <!-- text -->
              <p><small>By placing your order, you agree to be bound by the Freshcart <a href="#!">Terms of Service</a>
                  and <a href="#!">Privacy Policy.</a> </small></p>

              <!-- heading -->
              <div class="mt-8">
                <h2 class="h5 mb-3">Add Promo or Gift Card</h2>
                <form>
                  <div class="mb-2">
                    <!-- input -->
                    <label for="giftcard" class="form-label sr-only">Email address</label>
                    <input type="text" class="form-control" id="giftcard" placeholder="Promo or Gift Card">

                  </div>
                  <!-- btn -->
                  <div class="d-grid"><button type="submit" class="btn btn-outline-dark mb-1">Redeem</button></div>
                  <p class="text-muted mb-0"> <small>Terms & Conditions apply</small></p>
                </form>
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