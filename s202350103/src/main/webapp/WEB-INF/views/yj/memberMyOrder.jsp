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
      
  <div class="card">
       <div class="card-body p-6">
			
			<c:forEach var="order" items="${memberMyOrder }">
			
			<fmt:formatDate value="${order.o_order_date }" pattern="yyyy. MM. dd"/>주문		  
			<div class="card card-product mb-9">
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
		                 
		                 <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>
		                 ${order.nb_writer }
		                 </small></a>
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
		                    <button onclick="cart(${order.nb_num })" class="btn btn-primary">
		                    		장바구니 
		                    </button>
			                 </div>
		                 </div>
		              	</div>
		           </div>
		           
		             <div class="col-md-4 col-12">
                       <div class="d-flex" style="height: 200px; background: #dfe2e1;">
						   <div class="vr text-center"></div>
						   
						   <div class=" mt-3">
						 	<h1 class="fs-6">${order.o_rec_name }</h1>
						   </div>
						   
						 
						  <div class=" mt-3">
		                    <div>
		                    <button onclick="cart(${order.nb_num })" class="btn btn-primary">
		                    		장바구니 
		                    </button>
			                 </div>
		                 </div>
		                 
		                  <div class=" mt-3">
		                    <div>
		                    <button onclick="cart(${order.nb_num })" class="btn btn-primary">
		                    		장바구니 
		                    </button>
			                 </div>
		                 </div>
						 
						 
						 </div>
		           			
		                 
		           			
		           			
	      		  </div>
       			 </div>
				</div>
			</c:forEach>

       </div>
    </div>





	 </div>
  </div><p></p>

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