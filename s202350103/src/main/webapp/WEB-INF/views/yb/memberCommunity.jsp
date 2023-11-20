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
	<a href="cont">cont</a>
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
	   <button type="button" class="btn btn-dark" style="margin-right: 20px;">내가 쓴 글</button>
	   <button type="button" class="btn btn-dark" id="openWrite" onclick="openWrite()">글 쓰기</button>
	 </div>
	<a href="modal">모달</a>

<div id="div1" class="mb-3">
		  <div class="mb-3 mt-6">
	         <p><a href="#">게시글 목록입니다.</a></p>
<%-- 	         <p><a href="#">${member.m_id } 님의 장바구니 목록입니다.</a></p> --%>
	               총 게시글 : ${comListTotalCnt }		
          </div>
	 <div class="row g-4 row-cols-xl-3 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
	 	<c:forEach items="${communityList }" var="community">
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
                  <div class="text-small mb-1">
                  	<a href="#!" class="text-decoration-none text-muted"><small>${community.cm_title}</small></a></div>
	              <div>
<%-- 			            <h2 class="h5"><a href="#!" class="text-inherit">${community.cm_bookTitle}</a></h2> --%>
			            <p>${community.cm_content }</p>
			            <div class="d-flex justify-content-between text-muted mt-4"><span><small><fmt:formatDate value="${community.cm_regDate }" pattern="yyyy년MM월dd일"/>
			                  </small></span><span><small>조회수: <span class="text-dark fw-bold">(${community.cm_readCnt }건)</span></small></span>
			            </div>
				 </div>
                </div>
              </div>
            </div>
         </c:forEach>
	</div>
</div>

</main>

<%@ include file="../common/footerFo.jsp" %>

</body>

</html>