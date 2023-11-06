<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!-- 운송장 -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="FoObMain.jsp" %>

<p class="text-center fs-1 ">중고 도서 운송장 등록 </p>


<br>
<br>
<br>
<br>
<br>
<br>


<p class="text-center fs-1 "> 발송 운송장 정보  </p>
 <div class="input-group mb-3">
  <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">택배사</button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">1</a></li>
    <li><a class="dropdown-item" href="#">2</a></li>
    <li><a class="dropdown-item" href="#">2</a></li>
  </ul>
  <input type="text" class="form-control" placeholder="운송장 번호를 입력해주세요" aria-label="Text input with dropdown button">
 </div>

<br>
<br>
 <br>
 <hr>
 <div class="d-grid gap-2">
    <button class="btn btn-primary" type="button">판매계속 등록하기</button>
 </div>
</body>

<%@ include file="../common/footerFo.jsp" %>
</html>