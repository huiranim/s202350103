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
                     <td class="align-middle">주문번호</td>
                     <th class="table-light">주문일시</th>
                     <td class="align-middle">주문일시</td>
            </tr>
            <tr>
                     <th class="table-light">주문상태</th>
                     <td class="align-middle">주문상태</td>
                     <th class="table-light">주문유형</th>
                     <td class="align-middle">주문유형</td>
            </tr>
            <tr>
                     <th class="table-light">결제 수단</th>
                     <td class="align-middle">결제 수단</td>
                     <th class="table-light">택배사/송장번호</th>
                     <td class="align-middle">택배사/송장번호</td>
            </tr>
            </table>
         </div>
         <!-- 상품 정보 -->
         <div class="table-responsive">
            <p>상품 정보</p>
            <table class="table text-nowrap">
            <tr>
                     <th class="table-light">대표 상품명</th>
                     <td class="align-middle">대표 상품명</td>
                     <th class="table-light">주문수량</th>
                     <td class="align-middle">주문수량</td>
            </tr>
            <tr>
                     <th class="table-light">상품금액</th>
                     <td class="align-middle">상품금액</td>
                     <th class="table-light">결제금액</th>
                     <td class="align-middle">결제금액</td>
            </tr>
            </table>
         </div>
         <!-- 주문자 정보 -->
         <div class="table-responsive">
            <p>주문자 정보</p>
            <table class="table text-nowrap">
            <tr>
                     <th class="table-light">아이디</th>
                     <td class="align-middle">아이디</td>
                     <th class="table-light">이름</th>
                     <td class="align-middle">이름</td>
            </tr>
            <tr>
                     <th class="table-light">전화번호</th>
                     <td class="align-middle">전화번호</td>
            </tr>
            </table>
         </div>
         <!-- 수신자 정보 -->
         <div class="table-responsive">
            <p>수신자 정보</p>
            <table class="table text-nowrap">
            <tr>
                     <th class="table-light">이름</th>
                     <td class="align-middle">이름</td>
                     <th class="table-light">전화번호</th>
                     <td class="align-middle">전화번호</td>
            </tr>
            <tr>
                     <th class="table-light">배송지</th>
                     <td class="align-middle">배송지</td>
                     <th class="table-light">배송메시지</th>
                     <td class="align-middle">배송메시지</td>
            </tr>
            </table>
         </div>
 </div>
 </div>
 </div>
</body>
</html>