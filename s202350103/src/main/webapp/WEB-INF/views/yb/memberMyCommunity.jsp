<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#div1 {
		background: linear-gradient(180deg, #f4faf2 0, #f4faf2 473px, #edf7ea 473px, #edf7ea 100%);
	}

</style>
<script type="text/javascript">
	function openWrite() {
		if(${sessionScope.member == null }) {
			alert("로그인 후 이용해주시기 바랍니다.");
			window.close();
			location.href = "loginForm"
		} else {
			var url = "writeForm";
	        var name = "writeForm";
	        var option = "position= absolute, top= 50%, left= 50%, width= 600, height= 750px, padding= 40px, text-align= center, background-color= rgb(255, 255, 255), border-radius= 10px, box-shadow= 0 2px 3px 0 rgba(34, 36, 38, 0.15), transform= translateX(-50%) translateY(-50%);"
	        
	        window.open(url, name, option);
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
                <img alt="" src="../../upload/community.jpg" width="150%" height="250px;">

          </div>
        </div>

      </div>

    </div>
    <div style="float: right; margin-bottom: 20px;" >
       <a href="memberCommunity">
	     <button type="button" class="btn btn-dark" style="margin-right: 20px;">전체 목록</button>
	   </a>
	   <button type="button" class="btn btn-dark" id="openWrite" onclick="openWrite()">글 쓰기</button>
	 </div>

<div id="div1" class="mb-3">
		  <div class="mb-3 mt-6">
	         <p><a href="#">독후감 목록입니다.</a></p>
	         <p><a href="#">${member.m_name } 님의 독후감 목록입니다.</a></p>
	               총 게시글 : ${comMyListTotalCnt }		
          </div>
	 <div class="row g-4 row-cols-xl-3 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
	 	<c:forEach items="${communityMyList }" var="community">
			<div class="col" style="margin-bottom:16px;" >
              <!-- card -->
              <div class="card card-product">
                <div class="card-body">

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
				<a href="listEmp?currentPage=${page.startPage+page.pageBlock }">[다음]</a>
			</c:if>
	    </ul>
	</nav>
</div>

</main>

<%@ include file="../common/footerFo.jsp" %>

</body>

</html>