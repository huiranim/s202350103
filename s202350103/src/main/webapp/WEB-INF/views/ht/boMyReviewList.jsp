<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@ include file="../common/headerFo.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.btnn {
	 		width  : 300px;
	 		margin : 0px auto;
 			border : 20px solid maroon;
			}
</style>

</head>
<body>

	<div class="row">
	<!-- col -->
	    <div class="col-12">
	       <div class="p-4">
	          <!-- heading -->
	          <div class="d-flex justify-content-between mb-6 align-items-center">
	            <div>
	             <a href="#" class="btnn">작성 가능한 리뷰 </a>
	            </div>
	            <div>
	             <a href="#" class="btnn">작성한 리뷰 </a>
	            </div>
	          </div>
	          <ul class="list-group list-group-flush">
	             
	            <c:forEach var="list" items="">
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
	                      <a href="#" class="btn btn-outline-gray-400 text-muted btn-sm">Remove</a>
	                   </div>
	                </div>
	             </li>
	            </c:forEach>  
	             
	          </ul>
	       </div>
	    </div>
	</div>
	
<%@ include file="../common/footerFo.jsp" %>	

</body>
</html>