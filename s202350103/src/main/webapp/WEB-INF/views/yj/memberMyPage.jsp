<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- Container for card layout -->
  <div class="container">
    <!-- Card group using Bootstrap's grid system -->
    <div class="row">
     
     
      <div class="col-md-4">
        <div class="card mb-3">
       		 <a href="memberPointList?m_num=${member.m_num }">
          <div class="card-body">
         	<div class="group mb-10 ">
		       
		          <i class="bi bi-star-fill fs-1 me-1" style="color:#21313c; " >
		          		&nbsp;&nbsp;&nbsp;&nbsp;
		          		<span style="font-size: 20px; font-style: normal;">
		          		<strong>포인트</strong>
		          		</span> 
		          </i>
         	</div>
            <p class="card-text mb-0 ml-auto" style="display: flex; justify-content: flex-end;" >${member.m_point } P</p>
          </div>
      		</a>
        </div>
      </div>
      
    
      <div class="col-md-4">
        <div class="card mb-3">
           <a href="memberMyOrder?m_num=${member.m_num }"> 
          <div class="card-body ">
         	<div class="group mb-10 ">
		          <i class="bi bi-list-ul fs-1 me-1" style="color:#21313c;" >
		          		&nbsp;&nbsp;
		          		<span style=" font-size: 20px; font-style: normal;">
		          		<strong>주문현황</strong>
		          		</span> 
		          </i>
         	</div>
            <p class="card-text mb-0 ml-auto" style="display: flex; justify-content: flex-end;" >3 건</p>
          </div>
	          </a>
        </div>
      </div>
      
      
        <div class="col-md-4">
        <div class="card mb-3">
          <a href="memberSellList?m_num=${member.m_num }">
          <div class="card-body ">
         	<div class="group mb-10 ">
		          <i class="bi bi-currency-dollar fs-1 me-1" style="color:#21313c;">
		          		&nbsp;&nbsp;
		          		<span style=" font-size: 20px; font-style: normal;">
		          		<strong>판매현황</strong>
		          		</span> 
		          </i>
         	</div>
            <p class="card-text mb-0 ml-auto" style="display: flex; justify-content: flex-end;" >${totalSellCnt } 건</p>
          </div>
		          </a>
        </div>
      </div>
      
        <div class="col-md-4">
        <div class="card mb-3">
           <a href="memberMyReview?m_num=${member.m_num }">
          <div class="card-body ">
         	<div class="group mb-10 ">
		          <i class="bi bi-chat-left-text-fill fs-1 me-1" style="color:#21313c;">
		          		&nbsp;&nbsp;&nbsp;&nbsp;
		          		<span style=" font-size: 20px; font-style: normal;">
		          		<strong>내리뷰</strong>
		          		</span> 
		          </i>
         	</div>
            <p class="card-text mb-0 ml-auto" style="display: flex; justify-content: flex-end;" >작성리뷰 바로가기</p>
          </div>
	          </a>
        </div>
      </div>
      
        <div class="col-md-4">
        <div class="card mb-3">
           <a href="memberWishList">
          <div class="card-body ">
         	<div class="group mb-10 ">
		          <i class="bi bi-heart-fill fs-1 me-1" style="color:#21313c;">
		          		&nbsp;&nbsp;&nbsp;&nbsp;
		          		<span style=" font-size: 20px; font-style: normal;">
		          		<strong>찜목록</strong>
		          		</span> 
		          </i>
         	</div>
            <p class="card-text mb-0 ml-auto" style="display: flex; justify-content: flex-end;" >${totalWishList } 개</p>
          </div>
	          </a>
        </div>
      </div>
      
        <div class="col-md-4">
        <div class="card mb-3">
          <a href="memberMyInfo?m_num=${member.m_num }">
          <div class="card-body ">
         	<div class="group mb-10 ">
		          <i class="bi bi-person-fill fs-1 me-1" style="color:#21313c;">
		          		&nbsp;&nbsp;&nbsp;&nbsp;
		          		<span style=" font-size: 20px; font-style: normal;">
		          		<strong>내정보</strong>
		          		</span> 
		          </i>
         	</div>
            <p class="card-text mb-0 ml-auto" style="display: flex; justify-content: flex-end;" >${member.m_name } 님</p>
          </div>
	          </a>
        </div>
      </div>
      
      
      
    </div>
  </div>

  <%@ include file="../common/footerFo.jsp" %>

</body>
</html>
