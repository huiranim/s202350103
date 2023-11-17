<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<!DOCTYPE html>
<html>
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
		var url = "writeForm";
        var name = "writeForm";
        var option = "width = 500, height = 500, top = 300, left = 500, location = no, toolbars = no,status no"
        window.open(url, name, option);

		
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
    ${comListTotalCnt }
    <div style="float: right;"  >
	   <button type="submit" class="btn btn-dark" style="margin-right: 20px;">내가 쓴 글</button>
	   <button type="submit" class="btn btn-dark" id="openWrite" onclick="openWrite()">글 쓰기</button>
	 </div>
	
<!-- <div id="div1"  > -->
<!-- 	<a href="NewFile">ㅋㅋ</a> -->
<!-- 	<!-- container --> -->
<!-- 	<section class="mb-lg-14 mb-8"> -->
	
<%-- 	<c:set var="i" value="0" /> --%>
<%-- 		<c:set var="j" value="3" /> --%>
<!-- 		<table style="border-style: none;" > -->
<%-- 		  <c:forEach items="${communityList }" var="community"> --%>
<%-- 		    <c:if test="${i%j == 0 }"> --%>
<!-- 		    <tr> -->
<%-- 		    </c:if> --%>
<!-- 		       <td width="350px" height="150px;" style="padding-right: 50px;"> -->
<!-- 		       	    <div class="container"> -->
<!-- 				      row -->
<!-- 				      <div class="row"> -->
<!-- 				        col -->
<!-- 				        <div class="col-12 col-md-6 col-lg-4 mb-10 card card-product" style="width: 100%"> -->
<!-- 				          <div class="mb-4"> -->
<%-- 				            <a href="newbookDetail?nb_num=${community.cm_num }"> --%>
<!-- 				              img -->
<!-- 				              <div class="img-zoom">   -->
<!-- 				                도서 이미지 -->
<%-- 				                     <c:set var="nb_image" value="${community.cm_image }"/> --%>
<%-- 				                  <c:choose> --%>
<%-- 				               		<c:when test="${fn:contains(cm_image, 'http')}"> --%>
<%-- 				               			<img src="${community.cm_image }" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 8rem;"> --%>
<%-- 				               		</c:when> --%>
<%-- 				               		<c:otherwise> --%>
<%-- 				               			<img src="${pageContext.request.contextPath}/upload/${community.cm_image}" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 8rem;"> --%>
<%-- 				               		</c:otherwise> --%>
<%-- 				                  </c:choose> --%>
<!-- 				              </div> -->
<!-- 				            </a></div> -->
<!-- 				          <div class="mb-3"> -->
<%-- 				          	<a href="newbookDetail?nb_num=${community.cm_num }" class="text-inherit text-decoration-none">${community.cm_title}</a> --%>
<!-- 						  </div> -->
<!-- 				          text -->
<!-- 				          <div> -->
<%-- 				            <h2 class="h5"><a href="#!" class="text-inherit">${community.cm_bookTitle}</a></h2> --%>
<%-- 				            <p>${community.cm_content }</p> --%>
<%-- 				            <div class="d-flex justify-content-between text-muted mt-4"><span><small><fmt:formatDate value="${community.cm_regDate }" pattern="yyyy년MM월dd일"/> --%>
<%-- 				                  </small></span><span><small>조회수: <span class="text-dark fw-bold">(${community.cm_readCnt }건)</span></small></span> --%>
<!-- 				            </div> -->
<!-- 				          </div> -->
				
<!-- 				        </div>  -->
<!-- 				      </div> -->
<!-- 				   </div> -->
<!-- 	    		</td> -->
<%-- 		    <c:if test="${i%j == j-1 }"> --%>
<!-- 		    </tr> -->
<%-- 		    </c:if> --%>
<%-- 		    <c:set var="i" value="${i+1 }" /> --%>
<%-- 		  </c:forEach> --%>
<!-- 		</table>  -->
	
<!-- 	</section>    -->
<!-- </div> -->

<div id="div1"  >
	 <div class="row g-4 row-cols-xl-3 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
	 	<c:forEach items="${communityList }" var="community">
			<div class="col">
              <!-- card -->
              <div class="card card-product">
                <div class="card-body">

                  <!-- badge -->
                  <div class="text-center position-relative ">
                    <div class=" position-absolute top-0 start-0">
                      <span class="badge bg-danger">Sale</span>
                    </div>
				            <a href="newbookDetail?nb_num=${community.cm_num }">
				              <!-- img -->
				              <div class="img-zoom">  
				                <!-- 도서 이미지 -->
				                     <c:set var="nb_image" value="${community.cm_image }"/>
				                  <c:choose>
				               		<c:when test="${fn:contains(cm_image, 'http')}">
				               			<img src="${community.cm_image }" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 8rem;">
				               		</c:when>
				               		<c:otherwise>
				               			<img src="${pageContext.request.contextPath}/upload/${community.cm_image}" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 8rem;">
				               		</c:otherwise>
				                  </c:choose>
				              </div>
				            </a>
                    <!-- action btn -->
                    <div class="card-product-action">
                      <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                          class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                      <a href="shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
                        title="Wishlist"><i class="bi bi-heart"></i></a>
                      <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                          class="bi bi-arrow-left-right"></i></a>
                    </div>
                  </div>
                  <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>${community.cm_title}</small></a></div>
	              <div>
			            <h2 class="h5"><a href="#!" class="text-inherit">${community.cm_bookTitle}</a></h2>
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