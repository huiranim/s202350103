<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#first::first-letter {
		color:blue;
	}
</style>
</head>
<body>
<%@ include file="../common/sideFo.jsp" %>
	  <!-- row -->
		      <div class="row">
		        <div class="col-lg-12">
		          <div class="card py-1 border-0 mb-8">
           			 <div class="mb-8">
			         <!-- heading -->
				         <h2 class="mb-2">포인트 목록</h2>
				         <p><a href="#">${member.m_id } 님의 포인트 목록입니다.</a></p>
				               총 포인트 : ${member.m_point} P		
			      	</div>
		          <div>
		          <p><p><p>
		            <!-- table -->
		            <div class="table-responsive">
		              <table class="table text-nowrap table-with-checkbox" style="text-align: center;">
		              
		                <thead class="table-light">
		                  <tr>
		                    <th style="padding-right: 100px; padding-left: 50px;">적립 유형</th>
		                    <th>이벤트명(주문번호)</th>
		                    <th>적립 포인트</th>
		                    <th>적립 날짜</th>
		                  </tr>
		                </thead>
		                <tbody>
		                <c:forEach var="point" items="${memberPointList }">
		                  <tr id="pointTable">
		                     <td class="align-middle"; style="padding-right: 100px; padding-left: 50px;">
		                      <div>
		                        <h5 class="fs-6 mb-0">
									<c:choose>
										<c:when test="${point.type1 == 1}"><span>주문 적립</span></c:when>
										<c:when test="${point.type1 == 2}"><span>출석 적립</span></c:when>
										<c:when test="${point.type1 == 3}"><span>퀴즈 적립</span></c:when>
										<c:when test="${point.type1 == 4}"><span>회원가입 적립</span></c:when>
										<c:when test="${point.type1 == 5}"><span>추천인 적립</span></c:when>
										<c:when test="${point.type1 == 6}"><span>포인트 사용</span></c:when>
										<c:when test="${point.type1 == 7}"><span>관리자에 의한 조정</span></c:when>
										
									</c:choose>
								</h5>
		                      </div>
		                    </td>
		                     <td class="align-middle">
		                      <div>
		                        <h5 class="fs-6 mb-0">
			                      	<c:choose>
										<c:when test="${point.title != null}"><span>${point.title }</span></c:when>
										<c:when test="${point.type1 == 4}"><span>회원가입 축하~</span></c:when>
										<c:when test="${point.type1 == 5}"><span>추천인 이벤트</span></c:when>
										<c:when test="${point.type1 == 6}"><span>주문으로 인한 포인트 차감</span></c:when>
										<c:when test="${point.type1 == 7}"><span>관리자에 의한 조정</span></c:when>
									</c:choose>
								</h5>
		                      </div>
		                    </td>
		                    <td class="align-middle">
		                      <div>
		                        <h5 class="fs-6 mb-0">
		                        	<c:choose>
											<c:when test="${point.point > 0 }"><span id=first>+${point.point }P</span></c:when>
											<c:when test="${point.point < 0 }"><span>${point.point }P</span></c:when>
									</c:choose>
		                        </h5>
		                      </div>
		                    </td>
		    				 <td class="align-middle">
		                      <div>
		                        <h5 class="fs-6 mb-0"><fmt:formatDate value="${point.date1 }" pattern="yyyy년MM월dd일"/></h5>
		                      </div>
		                    </td>
		                  </tr>
		                  </c:forEach>
		                </tbody>
		               
		              </table>
		            </div>
		
		          </div>
		        </div>
		
		      </div>
	  <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">

			 	<c:if test="${page.startPage > page.pageBlock }">
					 <li class="page-item justify-content-center">					
						<a class="page-link mx-1 text-body" href="memberCommunity?currentPage=${page.startPage-page.pageBlock}">이전</a>
					</li>
				</c:if>
 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					 <li class="page-item justify-content-center">
 						<a class="page-link mx-1 text-body" href="memberCommunity?currentPage=${i}">${i}</a>
					</li>
				</c:forEach>
					
				<c:if test="${page.endPage < page.totalPage }">
					 <li class="page-item justify-content-center">		 
						<a class="page-link mx-1 text-body" href="memberCommunity?currentPage=${page.startPage+page.pageBlock}">다음</a>
					</li>
				</c:if>
		  </ul>
	   </nav>
		
		
		    </div>



<%@ include file="../common/footerFo.jsp" %>
</body>
</html>