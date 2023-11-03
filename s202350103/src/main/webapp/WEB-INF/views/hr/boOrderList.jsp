<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/headerBo.jsp" %>

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
         <h1 class="mb-1">주문 목록</h1>
         <p>총 ${cnt } 건</p>
      </div>
      <div>
         <!-- table -->
  			<!-- Button -->
  			<div class="order-operating-buttons">
	  			<button type="button" class="btn btn-success mb-2">발송</button>
	  			<button type="button" class="btn btn-success mb-2">배송완료</button>
	  			<button type="button" class="btn btn-success mb-2">구매확정</button>
	  			<button type="button" class="btn btn-success mb-2">취소</button>
	  			<button type="button" class="btn btn-success mb-2">교환</button>
	  			<button type="button" class="btn btn-success mb-2">반품</button>
  			</div>
         <div class="table-responsive">
         	<c:set var="num" value="${page.total-page.start+1 }"></c:set>
            <table class="table text-nowrap">
               <thead class="table-light">
                  <tr>
                     <th>
                        <!-- form check -->
                        <div class="form-check">
                    <!-- input --><input class="form-check-input" type="checkbox" value="" id="checkAll">
                    <!-- label --><label class="form-check-label" for="checkAll">
                    </label>
                        </div>
                     </th>
                     <th>No.</th>
                     <th>주문번호</th>
                     <th>주문상태</th>
                     <th>주문일시</th>
                     <th>대표 상품명</th>
                     <th>주문자</th>
                     <th>수신자</th>
                     <th>주문유형</th>
                  </tr>
               </thead>
               <tbody>
               <c:forEach var="orderr" items="${orderrList }">
                  <tr>
                     <td class="align-middle">
                        <!-- form check -->
                        <div class="form-check">
                            <!-- input --><input class="form-check-input" type="checkbox" value="" id="chechboxTwo">
                            <!-- label --><label class="form-check-label" for="chechboxTwo">
                            </label>
                        </div>
                     </td>
                     <!-- No. -->
                     <td class="align-middle">${num }</td>
                     <!-- 주문번호 -->
                     <td class="align-middle">
                        <div>
                        <h5 class="fs-6 mb-0"><a href="/boOrderDetail?o_order_num=${orderr.o_order_num}" class="text-inherit">${orderr.o_order_num}</a></h5>
                        </div>
                     </td>
                     <!-- 주문상태 -->
                     <td class="align-middle"><%-- ${orderr.o_status} --%>
                     	<c:if test="${orderr.o_status == 1}">주문접수</c:if>
                     	<c:if test="${orderr.o_status == 2}">배송중</c:if>
                     	<c:if test="${orderr.o_status == 3}">배송완료</c:if>
                     	<c:if test="${orderr.o_status == 4}">주문확정</c:if>
                     	<c:if test="${orderr.o_status == 5}">취소</c:if>
                     	<c:if test="${orderr.o_status == 6}">교환</c:if>
                     	<c:if test="${orderr.o_status == 7}">반품</c:if>
                     </td>
                     <!-- 주문일시 -->
                     <td class="align-middle"><fmt:formatDate value="${orderr.o_order_date}" type="both"/></td>
                     <!-- 주문상품 -->
                     <td class="align-middle">${orderr.nb_title}</td>
                     <!-- 주문자 -->
                     <td class="align-middle">${orderr.m_name}</td>
                     <!-- 수신자 -->
                     <td class="align-middle">${orderr.o_rec_name}</td>
                     <!-- 주문유형 -->
                     <td class="align-middle"><%-- ${orderr.o_type} --%>
                     	<c:if test="${orderr.o_type == 1}">일반</c:if>
                     	<c:if test="${orderr.o_type == 2}">선물</c:if>
                     </td>
                  </tr>
                  <c:set var="num" value="${num-1 }"></c:set>
               </c:forEach>
               </tbody>
            </table>
            
            <%-- <!-- default pagination -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <c:if test="${page.startPage > page.pageBlock }">
			    	<li class="page-item">
			    		<a class="page-link" href="boOrderList?currentPage=${page.startPage-page.pageBlock }">이전</a>
			    	</li>
			    </c:if>
			    
			    <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
			    	<li class="page-item">
			    		<a class="page-link" href="boOrderList?currentPage=${i }">${i }</a>
			    	</li>
			    </c:forEach>
			    
			    <c:if test="${page.endPage < page.totalPage }">
			    	<li class="page-item">
			    		<a class="page-link" href="boOrderList?currentPage=${page.startPage+page.pageBlock }">다음</a>
			    	</li>
			    </c:if>
			  </ul>
			</nav> --%>
			
            <!-- disabled and active states -->
            <nav aria-label="...">
			  <ul class="pagination">
			    <!-- 이전 -->
			    <c:if test="${page.startPage > page.pageBlock }">
				    <li class="page-item disabled">
				      <a class="page-link" href="boOrderList?currentPage=${page.startPage-page.pageBlock }" tabindex="-1" aria-disabled="true">이전</a>
				    </li>
				</c:if>
			    
			    <!-- 1~10 -->
			    <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
			    	<li class="page-item">
			    		<a class="page-link" href="boOrderList?currentPage=${i }">${i }</a>
			    	</li>
			    </c:forEach>
			    
			    <!-- 다음 -->
			    <c:if test="${page.endPage < page.totalPage }">
				    <li class="page-item">
				      <a class="page-link" href="boOrderList?currentPage=${page.startPage+page.pageBlock }">다음</a>
				    </li>
			    </c:if>
			  </ul>
            </nav>
            
            <%-- <c:if test="${page.startPage > page.pageBlock }">
				<a href="boOrderList?currentPage=${page.startPage-page.pageBlock }">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
				<a href="boOrderList?currentPage=${i }">[${i }]</a>
			</c:forEach>
			<c:if test="${page.endPage < page.totalPage }">
				<a href="boOrderList?currentPage=${page.startPage+page.pageBlock }">[다음]</a>
			</c:if> --%>
	
	
         </div>
 </div>
 </div>
 </div>

</body>
</html>