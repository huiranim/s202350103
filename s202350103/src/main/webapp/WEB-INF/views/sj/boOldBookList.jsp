<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" >
		      <div class="col-lg-12 col-md-12 col-12 d-block  container">
			  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
				  <label class="btn btn-outline-primary" for="btnradio1">1주</label>
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
				  <label class="btn btn-outline-primary" for="btnradio2">3개월</label>
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
				  <label class="btn btn-outline-primary" for="btnradio3">6개월</label>
				</div>
				   
               <form action="#">
                 <div class="input-group">
                   <input class="form-control rounded" type="search" placeholder="Search for products">
                   <span class="input-group-append">
                     <button class="btn bg-white border border-start-0 ms-n10 rounded-0 rounded-end" type="button">
                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-search">
                         <circle cx="11" cy="11" r="8"></circle>
                         <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                       </svg>
                     </button>
                     <input class="btn btn-primary" type="button" value="조회하기">
                   </span>
                 </div>
		      </form> 
			</div>
	<div class="row">
	<div class="col-lg-12 col-md-12 col-12 d-block">
	     <div class="py-6 p-md-6 p-lg-10">
	        <!-- heading -->
	       <p class="fs-1 text-center">중고 리스트 </p>
	        <div class="table-responsive border-0">
	           <!-- Table -->
	           	<c:set var="num" value="${page.total-page.start+1 }"></c:set>
	           <table class="table table-bordered border-primary">
	              <!-- Table Head -->
	              <thead class="table-light">
	                 <tr>  
		                    <th class="border-0">신청일자</th>
		                    <th class="border-0">매입 번호</th>
		                    <th class="border-0">중고 상품</th>
		                    <th class="border-0">매입상태</th>
		                    <th class="border-0 text-center">검수/등록하기</th>
	                 </tr>
	              </thead>
	              <c:forEach var="oldBook" items="${listOb }">
	              <tbody>
	                 <!-- Table body -->
	              	   <tr>
	               	     <td class="align-middle border-top-0">
                            <h6 class="mb-0"> <fmt:formatDate value="${oldBook.ob_report_date}" pattern="yyyy-MM-dd KK:mm:ss"></fmt:formatDate></h6>
	                       <span><small class="text-muted"></small></span>
	                    </td>
	                    <td class="align-middle border-top-0">
	                       <a href="#" class="text-inherit">${oldBook.ob_num }</a>
	                    </td>
	                    <td class="align-middle border-top-0">
	                    <a href="#" class="fw-semi-bold text-inherit">
	                     	  ${oldBook.ob_acc_num }
	                        </a>
	                    </td>
	                    <td class="align-middle border-top-0">
	     		<c:choose>
						<c:when test="${oldBook.ob_status eq '0' }"><c:out value="검수중"/></c:when>
						<c:when test="${oldBook.ob_status eq '1' }"><c:out value="검수완료"/></c:when>
						<c:otherwise><c:out value="매입완료"/></c:otherwise>
				</c:choose>
	                    </td>
	                    
	                    <td class="align-middle border-top-0">
      			 <c:choose>
					<c:when test="${oldBook.ob_status eq '0' }"><c:out value=""/>
							<input type="button" value="검수하기" name="ob_num" onclick="location.href='BoupdateObDetailCheck?ob_num=${oldBook.ob_num}'">								
							<input type="button" value="등록하기" name="ob_num"  onclick="#">
							<input type="button" class="btn-primary" name="ob_num"  value="상세보기" onclick="location.href='BodetailOb?ob_num=${oldBook.ob_num}'">
						</c:when>
							<c:when test="${oldBook.ob_status eq '1' }"><c:out value=""/>
							<input type="button" value="등록하기" onclick="#">
							<input type="button" class="btn-primary" name="ob_num"  value="상세보기" onclick="location.href='BodetailOb?ob_num=${oldBook.ob_num}'">
						</c:when>
						<c:otherwise><c:out value=""/>
						<input type="button" class="btn-primary" name="ob_num"  value="상세보기" onclick="location.href='BodetailOb?ob_num=${oldBook.ob_num}'">
						</c:otherwise>
				
				</c:choose>
	                
	                    </td>
	                    
	                 </tr>
	        			<c:set var="num" value="${num - 1 }"></c:set>
		            	</c:forEach>  
	              </tbody>
		</table>	
			<c:if test="${page.startPage > page.pageBlock }">
					<a href="listob?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
					</c:if>
						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<a href="listob?currentPage=${i}">[${i}]</a>
					</c:forEach>
						<c:if test="${page.endPage < page.totalPage }">
					<a href="listob?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
				</c:if>	
			        </div>
			     </div>
			  </div>  
		</div>
		
			 <div class="d-grid gap-2">
		    <button class="btn btn-dark" type="button" onclick="location.href='index.html'">메인화면가기</button>

			</div>	
			
		</form>

		

</body>
</html>