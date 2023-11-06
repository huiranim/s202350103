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

	<div class="row">
<!-- col -->
    <div class="col-12">
       <div class="p-4">
          <!-- heading -->
          <div class="d-flex justify-content-between mb-6 align-items-center">
              <!-- Toggle State -->
			 <button type="button" class="btn btn-primary" data-bs-toggle="button" autocomplete="off">작성 가능한 리뷰</button>
			 <button type="button" class="btn btn-primary active" data-bs-toggle="button" autocomplete="off" aria-pressed="true">작성한 리뷰</button>
          </div>
          
          <ul class="list-group list-group-flush">
          
          	 <c:forEach var="orderList" items="reviewWriteList">
	             <li class="list-group-item py-5">
	                <div class="d-flex justify-content-between">
	                   <div class="d-flex">
	                      <!-- img -->
	                      <img src="${orderList.nb_image }" alt="책 이미지">
	                      <!-- text -->
	                      <div class="ms-4">
	                          <h5 class="mb-0 h6 h6">${orderList.nb_title }</h5>
	                         <p class="mb-0 small">수량 : ${orderList.o_de_count}
	                        </p>
	                      </div>
	                   </div>
	                   <div>
	                      <button class="btn btn-primary" type="button">리뷰 작성하기</button>
	                   </div>
	                </div>
	             </li>
             </c:forEach>
             
             
             
             <!-- List group item -->
             <li class="list-group-item py-5">
                <div class="d-flex justify-content-between">
                   <div class="d-flex">
                      <!-- img -->
                      <img src="../../assets/images/svg-graphics/mastercard.svg" alt="" class="me-3">
                      <div>
                       <h5 class="mb-0 h6">Mastercard ending in 1234</h5>
                       <p class="mb-0 small">Expires in 03/2026</p>
                      </div>
                   </div>
                   <div>
                      <!-- button-->
                      <a href="#" class="btn btn-outline-gray-400 text-muted btn-sm">리뷰 작성하기</a>
                   </div>
                </div>
             </li>
             
             
  <!--            List group item
             <li class="list-group-item py-5">
                <div class="d-flex justify-content-between">
                   <div class="d-flex">
                      img
                      <img src="../../assets/images/svg-graphics/discover.svg" alt="" class="me-3">
                      <div>
                          text
                                <h5 class="mb-0 h6">Discover ending in 1234</h5>
                             <p class="mb-0 small">Expires in 07/2020 <span class="badge bg-warning text-dark"> This card is
                           expired.</span>
                         </p>
                      </div>
                   </div>
                   <div>
                      btn
                      <a href="#" class="btn btn-outline-gray-400 text-muted btn-sm">Remove</a>
                   </div>
                </div>
             </li>
             List group item
             <li class="list-group-item py-5">
                <div class="d-flex justify-content-between">
                   <div class="d-flex">
                      img
                      <img src="../../assets/images/svg-graphics/americanexpress.svg" alt="" class="me-3">
                      text
                      <div>
                         <h5 class="mb-0 h6">American Express ending in 1234</h5>
                        <p class="mb-0 small">Expires in 12/2021</p>
                      </div>
                   </div>
                   <div>
                      btn
                      <a href="#" class="btn btn-outline-gray-400 text-muted btn-sm">Remove</a>
                   </div>
                </div>
             </li>
             List group item
             <li class="list-group-item py-5 border-bottom">
                <div class="d-flex justify-content-between">
                   <div class="d-flex">
                      img
                      <img src="../../assets/images/svg-graphics/paypal.svg" alt="" class="me-3">
                      <div>
                       text
                        <h5 class="mb-0 h6">Paypal Express ending in 1234</h5>
                         <p class="mb-0 small">Expires in 10/2021</p>
                      </div>
                   </div>
                   <div>
                      btn
                      <a href="#" class="btn btn-outline-gray-400 text-muted btn-sm">Remove</a>
                   </div>
                </div>
             </li> -->
             
             
             
          </ul>
       </div>
    </div>
    </div>
		
<%@ include file="../common/footerFo.jsp" %>	

</body>
</html>