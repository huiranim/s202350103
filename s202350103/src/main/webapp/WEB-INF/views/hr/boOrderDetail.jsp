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
<div class="row" >
<div class="col-30">
      <div class="mb-8">
         <!-- heading -->
         <h1 class="mb-1">주문 상세</h1>
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
           
         <!-- 주문 정보 -->
         <div class="table-responsive">
            <p>주문 정보</p>
            <table class="table text-nowrap">
            <tr>
                     <th class="table-light">주문번호</th>
                     <td class="align-middle">${orderr.o_order_num}</td>
                     <th class="table-light">주문일시</th>
                     <td class="align-middle"><fmt:formatDate value="${orderr.o_order_date}" type="both"/></td>
            </tr>
            <tr>
                     <th class="table-light">주문상태</th>
                     <td class="align-middle">
                     	<c:if test="${orderr.o_status == 1}">주문접수</c:if>
                     	<c:if test="${orderr.o_status == 2}">배송중</c:if>
                     	<c:if test="${orderr.o_status == 3}">배송완료</c:if>
                     	<c:if test="${orderr.o_status == 4}">주문확정</c:if>
                     	<c:if test="${orderr.o_status == 5}">취소</c:if>
                     	<c:if test="${orderr.o_status == 6}">교환</c:if>
                     	<c:if test="${orderr.o_status == 7}">반품</c:if>
                     </td>
                     <th class="table-light">주문유형</th>
                     <td class="align-middle">
                     	<c:if test="${orderr.o_type == 1}">일반</c:if>
                     	<c:if test="${orderr.o_type == 2}">선물</c:if>
                     </td>
            </tr>
            <tr>
                     <th class="table-light">결제 수단</th>
                     <td class="align-middle">
                     	<c:if test="${orderr.o_type == 1}">카카오페이</c:if>
                     	<c:if test="${orderr.o_type == 2}">토스</c:if>
                     </td>
                     <th class="table-light">택배사/송장번호</th>
                     <td class="align-middle">
                     	<c:if test="${orderr.o_deliv_com == 1}">대한통운</c:if>
                     	<c:if test="${orderr.o_deliv_com == 2}">우체국택배</c:if>
                     	<c:if test="${orderr.o_deliv_com == 3}">로젠택배</c:if>
                     	<c:if test="${orderr.o_deliv_com == 4}">한진택배</c:if>
                     	<c:if test="${orderr.o_deliv_com == 5}">롯데택배</c:if>
                     /${orderr.o_deliv_track}
                     </td>
            </tr>
            </table>
         </div>
         <!-- 상품 정보 -->
         <div class="table-responsive">
            <p>상품 정보</p>
            <table class="table text-nowrap">
            <tr>
                     <th class="table-light">대표 상품명</th>
                     <td class="align-middle">${orderr.nb_title}</td>
                     <th class="table-light">주문수량</th>
                     <td class="align-middle"><fmt:formatNumber value="${orderr.o_order_count}" groupingUsed="true"/></td>
            </tr>
            <tr>
                     <th class="table-light">상품금액</th>
                     <td class="align-middle"><fmt:formatNumber value="${orderr.o_order_price}" groupingUsed="true"/></td>
                     <th class="table-light">결제금액</th>
                     <td class="align-middle"><fmt:formatNumber value="${orderr.o_pay_price}" groupingUsed="true"/></td>
            </tr>
            </table>
         </div>
         <!-- 주문자 정보 -->
         <div class="table-responsive">
            <p>주문자 정보</p>
            <table class="table text-nowrap">
            <tr>
                     <th class="table-light">아이디</th>
                     <td class="align-middle">${orderr.m_id}</td>
                     <th class="table-light">이름</th>
                     <td class="align-middle">${orderr.m_name}</td>
            </tr>
            <tr>
                     <th class="table-light">전화번호</th>
                     <td class="align-middle">${orderr.m_ph}</td>
            </tr>
            </table>
         </div>
         <!-- 수신자 정보 -->
         <div class="table-responsive">
            <p>수신자 정보</p>
            <table class="table text-nowrap">
            <tr>
                     <th class="table-light">이름</th>
                     <td class="align-middle">${orderr.o_rec_name}</td>
                     <th class="table-light">전화번호</th>
                     <td class="align-middle">${orderr.o_rec_ph}</td>
            </tr>
            <tr>
                     <th class="table-light">배송지</th>
                     <td class="align-middle">${orderr.o_rec_addr}</td>
                     <th class="table-light">배송메시지</th>
                     <td class="align-middle">${orderr.o_rec_msg}</td>
            </tr>
            </table>
         </div>
 </div>
 </div>
 </div>
</body>
</html>