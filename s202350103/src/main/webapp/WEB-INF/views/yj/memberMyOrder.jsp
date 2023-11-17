<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"%>
<%@ include file="../common/sideFo.jsp"%>

<!DOCTYPE html>
<html>
<script type="text/javascript">

function cart(pNb_num) {
	var m_num = '${member.m_num}';
	$.ajax({
		url : "/cart/cartclick",
		data : {nb_num : pNb_num},
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

</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>


<div class="row">
<div class="col-lg-12">
      <div class="mb-8">
         <!-- heading -->
         <h2 class="mb-2">주문 현황</h2>
         <p><a href="#">${member.m_id } 님의 주문 목록입니다.</a></p>
         <p>총 주문 건수 : ${totalOrderCnt }</p>
      </div>
      
       <div class="card-body p-6 ">
       
			<c:forEach var="orderNum" items="${orderNumGroups.keySet() }">
				
				<c:set var="firstOrder" value="${orderNumGroups[orderNum][0] }" />
    			<c:set var="orderDate" value="${firstOrder.o_order_date }" />
				
				<h4 class="mb-1"><a href="#" class="link-success">
					<fmt:formatDate value="${orderDate }" pattern="yyy. MM. dd "/>
					&nbsp; 주문		  
				</a></h4>
				주문번호 <small style="color: #889397;">${orderNum}</small>
				
				
			  	<span style="float: right; margin-right: 20px; font-weight: bold; color: #044504;" class="mb-3">
	         	 <a href="#" class="link-success" style="font-size: 14px;">주문상세보기
	         	 <i class="bi bi-arrow-right-short"></i>
	         	 </a>
	    	   </span>
	    	   
	   			  
	   			  <div style="clear: both;"></div>
				
			<c:forEach var="order" items="${orderNumGroups[orderNum] }">
					
			<!-- 주문정보 -->
			<div class="card card-product mb-10">
		        <div class="card-body mb-4 row align-items-center">

		              <div class="col-md-4 col-12">
		                 <div class="text-center position-relative ">

		                      <img src="${order.nb_image }" alt="썸네일" class="mb-3 img-fluid" width="130px" height="150px">
		                 </div>
		              </div>

		              <div class="col-md-4 col-12">
		                 
		                 <h1 class="fs-5">
							 <c:choose>
	                       	    <c:when test="${order.o_status == 0}">
					               <span>주문접수</span>
	                            </c:when>
	                            
	                     	    <c:when test="${order.o_status == 1}">
					               <span>주문확정</span>
	                            </c:when>
	                            
	                            <c:when test="${order.o_status == 2}">
	                     			<span style="color: red;">배송중</span>
	                            </c:when>
	                            
	                            <c:when test="${order.o_status == 3}">
					               <span>배송완료</span>
	                            </c:when>
	                            
	                            <c:when test="${order.o_status == 4}">
					               <span>구매확정</span>
	                            </c:when>
	                            
	                            <c:when test="${order.o_status == 5}">
					               <span style="color: gray;">취소</span>
	                            </c:when>
	                            
	                            <c:when test="${order.o_status == 6}">
					               <span>교환</span>
	                            </c:when>
	                            
	                            <c:when test="${order.o_status == 7}">
	                     		   <span>반품</span>
	                            </c:when>
	                        </c:choose>
		                 </h1>
		                 
		                 <div class="text-small mb-1"><small>
		                 ${order.nb_writer }
		                 </small>
		                 </div>
		                 
		                 <h2 class="fs-6">
							${order.nb_title }
		                 </h2>
		                 
		                 <div class=" mt-3">
		                    <div><span class="text-dark">
		                    <fmt:formatNumber value="${order.o_pay_price }" pattern="#,###" />원
		                    </span> 
		                    </div>

						 <div class=" mt-3">
		                    <div>
		                    
		                   <h2 class="fs-5" style="color:#581313;">
								${order.o_rec_name }
			                 </h2>
			                
			                 </div>
		                 </div>
		              	</div>
		           </div>
		           
                       <div class="col-md-1 col-1 d-flex" style="height: 200px; color : #dfe2e1;">
						   <div class="vr"></div><p>
		                 </div>
						
						
						 <div class="col-md-2">
						 
						   <div class="flex-column  text-center">
		                   	
		              	
							<c:choose>
								<c:when test="${order.nb_num < 200000 }">
								
							 	 <button onclick="cart(${order.nb_num })" class="btn btn-soft-primary mt-2">
		                    		장바구니 
			                    </button><p>
							 	<a href="foOrderDetail?o_order_num=${order.o_order_num}"  class="btn btn-soft-success mt-2">상세보기</a>
                            	<a href="reviewForm?o_order_num=${order.o_order_num}"  class="btn btn-soft-success mt-2">리뷰작성</a>
								
								</c:when>
								
								<c:otherwise>

								<span style="color: #0aad0a; font-weight: bold;">해당 도서는<br> 중고상품 입니다.</span>
							 	<a href="foOrderDetail?o_order_num=${order.o_order_num}"  class="btn btn-soft-success mt-3">상세보기</a>
								
								</c:otherwise>								

							</c:choose>
		                 
		                   </div> 
						 
						 </div>
		                   
		                 
					    
	      		  
	      		  
				</div> 
		           			
		           			
			</div>
			</c:forEach>
		</c:forEach>

       </div>
    </div>





	 </div>
  <p></p>

<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
	     	 <a class="page-link" href="#">Next</a>
	    </li>
	  </ul>
	</nav>


<%@ include file="../common/footerFo.jsp"%>

</body>
</html>