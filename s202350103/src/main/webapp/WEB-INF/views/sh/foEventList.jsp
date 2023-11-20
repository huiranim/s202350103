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
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>

<body>


<div class="row">
  <div class="col-12">
     <div class="card card-product">
        <!-- card body -->
        <div class="card-body">
           <div class=" row align-items-center">
              <!-- col -->
              <div class="col-md-4 col-12" style="width: 600px; height: 170px; border-right: solid;" >
                 <div class="text-center position-relative ">
                    <a href="shop-single.html">
                       <!-- img --><img src="../../assets/images/products/product-img-1.jpg"
                         alt="Grocery Ecommerce Template" class="mb-3 img-fluid" style="width: 600px; height: 170px;">
                    </a>
                 </div>
              </div>
           </div>
        </div>
     </div>
  </div>
 </div>




     <div class="card card-product">

			<div class="card-body mb-4 row align-items-center">

		               <div class="col-md-4 col-12" style="width: 600px; height: 170px; border-right: solid;" >
		                 <div class="text-center position-relative ">

                    <a href="shop-single.html">
                       <!-- img --><img src="../../assets/images/products/product-img-1.jpg"
                         alt="Grocery Ecommerce Template" class="mb-3 img-fluid" style="width: 600px; height: 170px;">
                    </a>

		                 </div>
		              </div>

		           
						<div class="col-md-4 col-12">
								sadasdsa
						   
						   <div class="text-center">
						   <div class="flex-column  text-center">
		              	
							 	 <button onclick="cart(${order.nb_num })" class="btn btn-soft-primary mt-2">
		                    		장바구니 
			                    </button><p>
		                 
		                   </div> 
		                   </div>
						 
						 </div>
		                   
						</div> 

</div>










<h1>Event List</h1>
		 <div class="card-body py-8">
			<c:forEach var="event" items="${eventList }">
						<img src="${pageContext.request.contextPath}/upload/${event.a_image}" onclick="checkTime('${event.a_sdate }','${event.a_edate }'); eventClick('${member.m_num}',${event.a_num});" width="500" height="200">
							${event.a_title }
							${event.a_sdate }~${event.a_edate }
						<button onclick="checkTime('${event.a_sdate }','${event.a_edate}'), eventClick('${member.m_num}',${event.a_num})" id="subButton">버튼</button>
					<div class="border border-primary" style="margin-bottom: 50px;" >
						<span style="width:50%;"><img src="${pageContext.request.contextPath}/upload/${event.a_image}" onclick="checkTime('${event.a_sdate }','${event.a_edate }'); eventClick('${member.m_num}',${event.a_num});" width="500" height="200"></span>
							<span class="border border-white" style="vertical-align:sub; width: 40%; height: 200px;">
								<span class="fw-bold">${event.a_title }</span>	
								<span>${event.a_sdate }~${event.a_edate }</span>
							</span>
					<span class="mt-2" style=" width:10%; height:200px;">
                    	<a onclick="checkTime('${event.a_sdate }','${event.a_edate}'), eventClick('${member.m_num}',${event.a_num})" id="subButton" class="btn btn-primary ">
                  		이동하기
                       </a>
                    </span>
					</div>
			</c:forEach>	
		</div>

		<span id="pageNum">
			<c:if test="${page.startPage > page.pageBlock }">
				<a href="eventList?currentPage=${page.startPge-page.pageBlocck }">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
				<a href="eventList?currentPage=${i }">[${i }]</a>
			</c:forEach>
			<c:if test="${page.endPage < page.totalPage }">
				<a href="eventList?currentPage=${page.startPage+page.pageBlock }">[다음]</a>
			</c:if>
		</span>


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

<%@ include file="../common/footerFo.jsp" %>
</body>
</html>