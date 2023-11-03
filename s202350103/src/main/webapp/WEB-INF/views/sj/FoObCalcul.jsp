<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
   <!-- 정산하기 --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="FoObMain.jsp" %>

<p class="text-center fs-1 ">중고 도서 정산 안내 </p>


<br>
<br>
<br>
<br>
<br>
<br>


<p class="text-center fs-1 ">기준 책 가격 newBook.price   </p>

<br>
<br>
<br>
<br>
<br>
<br>
<p class="text-center fs-1 ">정산 예상 가격  oldBook.ob_pur_price *0.6    </p>
  <br>
  <hr>
  <p class="text-start fs-4 ">계좌 등록    </p>
 <div class="input-group mb-3">
  <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">거래 은행</button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">1</a></li>
    <li><a class="dropdown-item" href="#">2</a></li>
    <li><a class="dropdown-item" href="#">2</a></li>
  </ul>
  <input type="text" class="form-control" placeholder="계좌 번호를 입력해주세요" aria-label="Text input with dropdown button">
 </div>
 
 <br>
 <hr>
 <div class="d-grid gap-2">
    <button class="btn btn-primary" type="button">판매 계속</button>
 </div>
</body>
<%@ include file="../common/footerFo.jsp" %>
</html>