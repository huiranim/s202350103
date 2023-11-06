<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/none.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>안녕안녕!!!</h1>

         <div class="table-responsive">
            <p>주문 정보</p>
            <table class="table text-nowrap">
               <thead class="table-light">
                  <tr>
                     <th class="table-light">상품명</th>
                     <th class="table-light">수량</th>
                     <th class="table-light">가격</th>
                     <th class="table-light">유형</th>
                  </tr>
               </thead>
               <tbody> 
               <c:forEach var="orderDetail" items="${orderDetailList }">
                  <tr>
                     <!-- 상품명 -->
                     <td class="align-middle">${orderDetail.nb_title}</td>
                     <!-- 수량 -->
                     <td class="align-middle">${orderDetail.o_de_count}</td>
                     <!-- 가격 -->
                     <td class="align-middle">${orderDetail.nb_price}</td>
                     <!-- 유형 -->
                     <td class="align-middle">${orderDetail.o_de_prodtype}</td>
                  </tr>
               </c:forEach>
               </tbody>
            </table>
         </div>
</body>
</html>