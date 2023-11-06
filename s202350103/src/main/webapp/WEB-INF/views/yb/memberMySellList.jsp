<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"%>
<%@ include file="../common/sideFo.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="row">
<div class="col-lg-12">
      <div class="mb-8">
         <!-- heading -->
         <h2 class="mb-2">판매 현황</h2>
         <p><a href="#">${member.m_id } 님의 판매 목록입니다.</a></p>
                총 판매 개수 : ${totalSellCnt }		
      </div>
      <div>
         <!-- table -->
         <div class="table-responsive">
            <table class="table text-nowrap">
               <thead class="table-light">
                  <tr>
                     <th>주문일자 </th>
                     <th>수령인</th>
                     <th></th>
                     <th>내용</th>
                  
                  </tr>
               </thead>
                <tbody>
    				<c:forEach items="${memberSellList }" var="myOrder">
	    				<tr class="align-middle">
							<td><fmt:formatDate value="${myOrder.o_order_date }" pattern="yyyy-MM-dd"/></td>	     					
		                    <td>${myOrder.o_rec_name }</td>	     					
	                       
	                       <td class="align-middle">
                       			<img src="${myOrder.nb_image }" style="width: 80px;" alt="썸네일">
	   	                  </td>

	                       <td class="align-middle">
	                	        <div>
    	                    	<h5 class="fs-6 mb-0">
    	                    		<a href="#" class="text-inherit">${myOrder.nb_title } <small>( ${myOrder.nb_writer } )</small></a>
    	                    	</h5><p>
			        	        	        결제 금액 : 
		        	        	        <mark><small style="font-size: 18px;">
	        	            	   			<fmt:formatNumber value="${myOrder.o_pay_price }" pattern="#,###" />원
			        	                </small></mark><p>
            	        	    	   <p>배송상태 : 
				                        <c:choose>

			                        	    <c:when test="${myOrder.o_status == 1}">
								               <span>배송완료</span>
				                            </c:when>
				                            <c:when test="${myOrder.o_status == 2}">
	                        		         	<span style="color: red;">배송중</span>
				                            </c:when>
				                            <c:otherwise>
		                      		          	 <span style="color: red;">접수중</span>
				                            </c:otherwise>

				                        </c:choose>
				                        
				                        <p></p>
				                        <button onclick="#" class="btn btn-soft-success mb-2">상세조회</button> &nbsp;&nbsp;&nbsp;
				                        <button onclick="#" class="btn btn-soft-success mb-2">리뷰작성</button>
				                        
            	        	    	</div>
                	   		  </td>
								     				
	     				</tr>
	     			
    				</c:forEach>
     			
     			</tbody>
 
 
 			  </table>
 			  
		   </div>
		 </div>
	 </div>
 </div> <p></p>

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