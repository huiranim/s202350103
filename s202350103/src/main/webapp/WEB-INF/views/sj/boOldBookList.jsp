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
	
	<div class="row">
	<div class="col-lg-12 col-md-12 col-12 d-block">
	     <div class="py-6 p-md-6 p-lg-10">
	        <!-- heading -->
	       <p class="fs-1 text-center">중고 판매 신청 목록 </p>
	        
	           <!-- Table -->
	           	<c:set var="num" value="${page.totalOb-page.start+1 }"></c:set>
	           	<div class="table">
	         
	           <table class="table text-nowrap " style="border-bottom: 1px">
	              <!-- Table Head -->
	              <thead class="table-light">
	                 <tr>  
		                    <th class="border-0">신청일자</th>
		                    <th class="border-0">매입 번호</th>
		                    <th class="border-0">신청자 명 </th>
		                    <th class="border-0 text-center" >중고 상품</th>
		                    <th class="border-0">매입상태</th>
		                    <th class="border-0 text-center">검수하기/상세보기</th>
	                 </tr>
	              </thead>
	              <c:forEach var="oldBook" items="${listOb }">
	              <tbody>
	                 <!-- Table body -->
	              	   <tr>
	               	     <td class="align-middle">
                            <h6 class="mb-0">${oldBook.ob_report_date}</h6>
	                       <span><small class="text-muted"></small></span>
	                    </td>
	                    <td class="align-middle">
	                      ${oldBook.ob_num }
	                    </td>
	                    <td class="align-middle">
	                    	${oldBook.m_name }
	                    </td>
	                    <td class="align-middle">
	                    
	                     	  ${oldBook.nb_title }
	                       
	                    </td>
	                    <td class="align-middle">
	     		<c:choose>
						<c:when test="${oldBook.ob_status eq '1' }"><c:out value="검수중"/></c:when>
						<c:when test="${oldBook.ob_status eq '2' }"><c:out value="검수완료"/></c:when>
						<c:when test="${oldBook.ob_status eq '3' }"><c:out value="매입완료"/></c:when>
						<c:otherwise><c:out value=""/></c:otherwise>
				</c:choose>
	                    </td>
	                    
	                    <td class="align-middle">
		      			 <c:choose>
							<c:when test="${oldBook.ob_status eq '1' }"><c:out value=""/>
									<input type="button" class="btn btn-soft-success mb-2" value="검수하기" name="ob_num" onclick="location.href='BoupdateObDetailCheck?ob_num=${oldBook.ob_num}'">
								</c:when>
								<c:when test="${oldBook.ob_status eq '2' }"><c:out value=""/>
									<input type="button" class="btn btn-soft-success mb-2" name="ob_num"  value="상세보기" onclick="location.href='BodetailOb?ob_num=${oldBook.ob_num}'">
								</c:when>
								<c:when test="${oldBook.ob_status eq '3' }"><c:out value=""/>
									<input type="button" class="btn btn-soft-success mb-2" name="ob_num"  value="상세보기" onclick="location.href='BodetailOb?ob_num=${oldBook.ob_num}'">
								</c:when>
								<c:otherwise><c:out value=""/>
								</c:otherwise>
						</c:choose>
		                   </td>
		                </tr>
		   			
		       	</c:forEach> 
		       	<hr>
		    </tbody>
		           
		</table>
		<hr>		
<c:set var="num" value="${num - 1 }"></c:set>		
		
		  <ul class="pagination justify-content-center">
			 	<c:if test="${page.startPage > page.pageBlock }">
					 <li class="pagination justify-content-center">					
						<a class="page-link" href="BolistOb?currentPage=${page.startPage-page.pageBlock}">이전</a>
					</li>
				</c:if>
				
 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					 <li class="pagination justify-content-center">
 						<a class="page-link" href="BolistOb?currentPage=${i}">${i}</a>
					</li>
				</c:forEach>
					
				<c:if test="${page.endPage < page.totalObPage }">
					 <li class="pagination justify-content-center">		 
						<a class="page-link" href="BolistOb?currentPage=${page.startPage+page.pageBlock}">다음</a>
					</li>
				</c:if>
		</ul>

						 <div class="d-grid gap-2">
					    <button class="btn btn-soft-success mb-2" type="submit" onclick="location.href='index'">메인화면가기</button>
					</div>	
				</div>
			</div>
		</div>
	</div>

		

</body>
</html>