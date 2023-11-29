<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.eventInfo {
	border: none;					 /* 테두리 제거 */
    border-radius: 50%;				 /* 동그라미 */
    width: 70px; 					 /* 넓 */
    height : 70px; 					 /* 높 */
    background-color : #53d57c; 	 /* 배경색 */
    font-weight : bold;				 /* 폰트 굵게*/
    color: #fff; 				 	 /* 글자색 */
    text-align: center;				 /* 글자 위치 */
    line-height : 50px; 			 /* 버튼 위치 */
    position : absolute;			 /* 위치고정 */
    right: 20px; 					 /* 오른 여백*/
    top: 50%; 					 	 /* 화면 상단 중앙 */
    transform: translateY(-50%); 	 /* 화면 수직 중앙 */
}

.card-body {
    padding: 0; 					  /* 카드 이미지 사이 여백*/
}
</style>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript">
	//이벤트 클릭 function
	function checkTime(e_sdate,e_edate){
		var curDate = new Date();
		var curDate1 = curDate.getFullYear()+"-"+(curDate.getMonth()+1)+"-"+curDate.getDate();
		var sysdate = new Date(curDate1);
		var sdate = convertToDate(e_sdate);
		var edate = convertToDate(e_edate);
		var target = document.getElementById("subButton");
		if(sysdate>=sdate&&sysdate<=edate){
			return true;
		} else{
			alert("이벤트 기간이 아닙니다.");
			eventClick(mNum,eNum);
			event.stopPropagation();
			return false;
		}
	}
	
	function convertToDate(dateStr) {
		var parts = dateStr.split('-');
		return new Date(parts[0], parts[1] - 1, parts[2]);
		}
		
	
	function eventClick(mNum, eNum) {
	    if (!mNum) {
	        alert("로그인이 필요한 페이지입니다.");
	        location.href = "loginForm";
	    	}else{
	    	mNum = parseInt(mNum); 
	        location.href = "eventIn?m_num=" + mNum + "&eNum=" + eNum;
	    }
	}
</script>
<body>

   <div class="mb-2">
	  <div class="d-flex align-items-center mb-3">
	    <img alt="" src="../assets/images/favicon/even22.png" style="width: 60px; height: 60px;" class="me-3">
	    <h2 class="mb-1">DADOK 이벤트</h2>
	  </div>
	  <p>다양한 이벤트에 참여하고 포인트를 적립하세요.</p>
	</div>
 
 
 <hr><br>
   	<c:forEach var="event" items="${eventList }">
	    <div class="card card-product mb-5">
			<div class="card-body row align-items-center">
	           <div class="col-12" style="width: 500px; height: 170px;" >
	             <div class="text-center position-relative">
	             	<img src="${pageContext.request.contextPath}/upload/sh/${event.a_image}"
	             		onclick="checkTime('${event.a_sdate }','${event.a_edate }'); eventClick('${member.m_num}',${event.a_num});"
	             		 style="width: 500px; height: 170px;">
						
	             </div>
	           </div>
           
		       <div class="col-md-4 col-12">
				  <div class="text-center">
				  	<h2 class="fs-5 mb-2">${event.a_title }</h2>
							${event.a_sdate } ~ ${event.a_edate }
				  
					<div class="flex-column text-center">
					
					
					<fmt:formatDate value="${sysdate}" pattern="yyyy-MM-dd" var="sys"/>
					
					<c:choose>
						<c:when test="${sys >=  event.a_sdate  && sys <= event.a_edate }">
							<button onclick="checkTime('${event.a_sdate }','${event.a_edate}'); eventClick('${member.m_num}',${event.a_num});" id="subButton" class="eventInfo">참여</button>
						</c:when>
						
						<c:otherwise>
							<br><span style="color: red;">종료된 이벤트 입니다.</span>
						</c:otherwise>

					</c:choose>						
					</div>
			   	  </div>
			 	</div>
			</div> 
		</div>
	</c:forEach>	

<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
		 	<c:if test="${page.startPage > page.pageBlock }">
				 <li class="page-item justify-content-center">					
					<a class="page-link mx-1 text-body"  href="eventList?currentPage=${page.startPge-page.pageBlocck }">이전</a>
				</li>
			</c:if>
				<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
				 <li class="page-item justify-content-center">
						<a class="page-link mx-1 text-body"  href="eventList?currentPage=${i }">${i}</a>
				</li>
			</c:forEach>
				
				<c:if test="${page.endPage < page.totalPage }">
				 <li class="page-item justify-content-center">		 
					<a class="page-link mx-1 text-body"href="eventList?currentPage=${page.startPage+page.pageBlock }">다음</a>
				</li>
			</c:if>
		</ul>
</nav>
   
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>