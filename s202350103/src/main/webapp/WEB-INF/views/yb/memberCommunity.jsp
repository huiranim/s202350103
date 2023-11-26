<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#div1 {
		  background-color: rgb(255, 255, 255);
		  border-radius: 10px;
		  box-shadow: 0 5px 5px 0 rgba(34, 36, 38, 0.3);
		
	}
	.pagination .page-item {
						    width: 50%;
						    text-align: center;
    }
    #imageBanner {
     	  border-radius: 10px;
     	  border: 1px solid black;
    }
</style>
<script type="text/javascript">
function openWrite() {
	if(${sessionScope.member == null }) {
		alert("로그인 후 이용해주시기 바랍니다.");
		window.close();
		location.href = "loginForm"
	} else {
		var popupW = 600;
		var popupH = 900;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
	
		var url = "writeForm";
        var name = "writeForm";
        
        window.open(url, name, 'width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')
	}
}
</script>
</head>

<body>

        
<main>
<%@ include file="../common/headerFo.jsp"  %>
    <!-- contianer -->
    <div class="container">
      <div class="row">
        <!-- col -->
        <div class="col-12" style="margin-bottom: 30px;">
          <!-- cta -->
          <div
            class="d-lg-flex justify-content-between align-items-center py-6 py-lg-3 px-8 text-center text-lg-start rounded">
            <!-- img -->
                <img alt="" src="../../upload/yb/community.jpg" width="150%" height="500px;" id="bannerImage">

          </div>
        </div>

      </div>

    </div>
    	    
    <div id="div1" class="mb-3">
       <h3 class="mb-0">인기 있는</h3>
       <div id="container1">
          
          <c:forEach items="${popularList }" var="popList" varStatus="status" end="2"></c:forEach>
         <div class="col-md-8 col-12 flex-grow-1">
                <!-- heading -->
                 <h2 class="fs-6"><a href="shop-single.html" class="text-inherit text-decoration-none">${popList.nb_title }</a>
                </h2>
                <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>${popList.cm_title }</small></a></div>
               
                  <p><div class="mb-4">
                            <div class="text-warning">
                               <c:forEach var="i" begin="1" end="2">
                                  <i class="bi bi-star-fill"></i>
                               </c:forEach>
                               <c:forEach var="i" begin="${popList.cm_rating + 1}" end="5">
                                  <i class="bi bi-star"></i>
                               </c:forEach>
                             <span class="text-muted small" style="margin-left: 10px;">(${popList.cm_rating })</span>
                            </div>
                      </div>
                <div class=" mt-6">
                  <!-- price -->
                  <div><span class="text-dark"></span> <span
                      class="text-decoration-line-through text-muted">$24</span>
                  </div>
                  
                  </div>
                </div>
          </div>
       </div>
 
    <div style="float: right; margin-bottom: 20px;" >
	   
	   <nav aria-label="...">
		<ul class="pagination pagination-lg justify-content-center">
		  <li  class="page-item active">
		  	<a href="memberCommunity" class="page-link">전체 독후감</a>
		  </li>
		  <li  class="page-item ">
		  	<a href="memberMyCommunity" class="page-link">내 독후감</a>
		  </li>
		  
		</ul>
	</nav>
	   
	 </div>

<div id="div1" class="mb-3">
  	 <div class="mb-3 mt-6">
        <p><a href="#">독후감 목록입니다.</a></p>
              총 독후감 : ${comListTotalCnt }		
     </div>
     <button type="button" class="btn btn-soft-primary mb-2" id="openWrite" onclick="openWrite()">작성하기</button>
	 <div class="row g-4 row-cols-xl-3 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
	 	<c:forEach items="${communityList }" var="community">
			<div class="col" style="margin-bottom:16px;" >
              <!-- card -->
              <div class="card card-product">
                <div class="card-body" style="height: 450px;">

                  <!-- badge -->
                  <div class="text-center position-relative ">
				            <a href="postDetailForm?cm_num=${community.cm_num }">
				              <!-- img -->
				              <div class="img-zoom">  
				                <!-- 도서 이미지 -->	
				                  <c:set var="cm_image" value="${community.cm_image }"/>
				                  <c:choose>
				               		<c:when test="${fn:contains(cm_image, 'http')}">
				               			<img src="${community.cm_image }" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 8rem; height: 10rem;">
				               		</c:when>
				               		<c:otherwise>
				               			<img src="${pageContext.request.contextPath}/upload/${community.cm_image}" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 8rem;  height: 10rem;">
				               		</c:otherwise>
				                  </c:choose>
				              </div>
				            </a>
                    <!-- action btn -->
                	
                  </div>
                  <h5 class="text-dark" ><a href="#!" class="text-inherit">${community.nb_title}</a></h5>
                  <div class="text-small text-dark mb-1">
                  	<a href="#!" class="text-dark text-muted"><small>${community.m_name}</small></a></div>
	              <div>
	              
			            
			           <small>${community.cm_title}</small>
			            <p><div class="mb-4">
				                <div class="text-warning">
				                   <c:forEach var="i" begin="1" end="${community.cm_rating}">
				                      <i class="bi bi-star-fill"></i>
				                   </c:forEach>
				                   <c:forEach var="i" begin="${community.cm_rating + 1}" end="5">
				                      <i class="bi bi-star"></i>
				                   </c:forEach>
				                 <span class="text-muted small" style="margin-left: 10px;">(${community.cm_rating })</span>
				                </div>
				          </div></p>
				          <p><div class="mb-4"><i class="bi bi-hand-thumbs-up"></i>(${community.cm_hitCnt })</div></p>
			            <div class="d-flex justify-content-between text-muted mt-4"><span><small><fmt:formatDate value="${community.cm_regDate }" pattern="yyyy년MM월dd일"/>
			                  </small></span><span><small>조회수: <span class="text-dark fw-bold">(${community.cm_readCnt }건)</span></small></span>
			            </div>
				 </div>
                </div>
              </div>
            </div>
         </c:forEach>
	</div>
	
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  

		 	<c:if test="${page.startPage > page.pageBlock }">
				<a href="memberCommunity?currentPage=${page.startPage-page.pageBlock }">[이전]</a>
			</c:if>
			
			<c:if test="${newbook.search_keyword != null }">
				<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
					<a href="memberCommunity?currentPage=${i}&search=${newbook.search_type }&keyword=${newbook.search_keyword}">[${i}]</a>
				</c:forEach>
			</c:if>
			<c:if test="${newbook.search_keyword == null }">
					<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
						<a href="memberCommunity?currentPage=${i}">[${i}]</a>
					</c:forEach>
				</c:if>
			<c:if test="${page.endPage < page.totalPage }">
				<a href="memberCommunity?currentPage=${page.startPage+page.pageBlock }">[다음]</a>
			</c:if>
	    </ul>
	</nav>
</div>

</main>

<%@ include file="../common/footerFo.jsp" %>

</body>

</html>