<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../common/headerFo.jsp" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- jquery안에  ajax 함수가 있기 때문에 jquery.js 가져와야 한다. -->
<script type="text/javascript">
	$(function() {
		$('#chk1').click(function() {
			var sendData = $('form').serialize();
			location.href="reviewList?"+sendData;
		});              //? 뒤로는 파라미터를 보내주는 것이라서 ajax를 호출하지 않아도 데이터를 보낼 수 있다.        
	}) 
</script>
</head>

	

<body>
<div class="row">
 <div class="col-md-4">
       <div class="me-lg-12 mb-6 mb-md-0">
          <div class="mb-5">
             <!-- title -->
             <h4 class="mb-3">고객 리뷰</h4>
             <span>
                <!-- rating --> <small class="text-warning"> <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-half"></i></small><span class="ms-3">4.1 out of 5</span><small
                   class="ms-3">11,130 global ratings</small>
             </span>
          </div>
          <div class="mb-8">
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">5</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: 60%;"
                         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">53%</span>
             </div>
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">4</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: 50%;"
                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="50"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">22%</span>
             </div>
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">3</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: 35%;"
                        aria-valuenow="35" aria-valuemin="0" aria-valuemax="35"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">14%</span>
             </div>
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">2</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: 22%;"
                     aria-valuenow="22" aria-valuemin="0" aria-valuemax="22"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">5%</span>
             </div>
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">1</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: 14%;"
                    aria-valuenow="14" aria-valuemin="0" aria-valuemax="14"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">7%</span>
             </div>
          </div>
          <div class="d-grid">
             <h4>해당 상품 리뷰</h4>
             <p class="mb-0">다른 고객분들을 위해서 리뷰를 작성해주세요.</p>
             <a href="MyReviewList" class="btn btn-outline-gray-400 mt-4 text-muted">리뷰 작성하기</a>
          </div>
       </div>
    </div>
    <!-- col -->
    <div class="col-md-8">
       <div class="mb-10">
          <div class="d-flex justify-content-between align-items-center mb-8">
             <div>
                <!-- heading -->
                <h4>리뷰</h4>
             </div>
             <div>
                <select class="form-select" aria-label="Default select example">
                   <option selected>Top Review</option>
                   <option value="1">One</option>
                   <option value="2">Two</option>
                   <option value="3">Three</option>
                </select>
             </div>
          </div>
	            <c:forEach var="review" items="${listReview}" >
		          <div class="d-flex border-bottom pb-6 mb-6">
		             <!-- img -->
		             <img src="${review.nb_image}" alt="product_image"
		                class="rounded-circle avatar-lg">
		             <div class="ms-5">
		                <h6 class="mb-1">
		                 ${review.m_name }
		                </h6>
		                <!-- select option -->
		                <!-- content -->
		                <p class="small"> <span class="text-muted">${review.r_create_date}</span>
		                </p>
		                <!-- rating -->
		                <div class=" mb-2">
							<c:forEach begin="1" end="${review.r_rating}">
			                   <i class="bi bi-star-fill text-warning"></i>
			                </c:forEach>
		                   <span class="ms-3 text-dark fw-bold">${review.r_title}</span>
		                </div>
		                <!-- text-->
		                <p>${review.r_content}</p>
		             </div>
		          </div>
                </c:forEach>
                <form action="">
           	       <input type="hidden" name="start" value="1">
          	       <input type="hidden" name="end" value="${end + 5}">

               	   <input type="button" id="chk1" class="btn btn-outline-gray-400 text-muted" value="리뷰 더보기">
				</form>
=======
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script> <!-- jquery안에  ajax 함수가 있기 때문에 jquery.js 가져와야 한다. -->
<script type="text/javascript">
	function moreReview(pCurrentPage){
		console.log(pCurrentPage);
		//alert("pCurrentPage->"+pCurrentPage); //잘 오는지 테스트용
		
		//Ajax현재번호  보내고 부서명 받음
		$.ajax(
			 {     //context는 위에 정의되어 있음  안써도 되는데 못찾아갈까봐 쓰는 것
				url :"<%=context%>/ajaxReviewList", //getDeptName 메소드를 호출한다 그런데 메소드가  @ResponseBody가 되어 있으니까 몸통에 값이 들어가 있다. 몸통에 값이 들어간걸 가져오는건 function에 deptName이다.
				data:{currentPage : pCurrentPage}, // url에 호출할 메소드에 보낼 데이터
				dataType:'text', // 두 가지 있다. 호출한 메소드의 반환값이 String이면 text이고, 객체면 json이다.
				success:function(currentPage){ //몸통의 값은 여기에 들어간다. 즉, getDeptName 메소드의 반환값인 deptname의 값이 여기에 들어감
					// alert("success ajax Data-> "+deptName);
					 $("#currentPage").val(currentPage + 1);  	/* input Tag */   //input태그는 값을 넣을때 val을 쓴다.
				}
			}	
		);		
	}
</script>


</head>
<body>
<div class="row">
 <div class="col-md-4">
       <div class="me-lg-12 mb-6 mb-md-0">
          <div class="mb-5">
             <!-- title -->
             <h4 class="mb-3">고객 리뷰</h4>
             <span>
                <!-- rating --> <small class="text-warning"> <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-half"></i></small><span class="ms-3">4.1 out of 5</span><small
                   class="ms-3">11,130 global ratings</small>
             </span>
          </div>
          <div class="mb-8">
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">5</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: 60%;"
                         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">53%</span>
             </div>
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">4</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: 50%;"
                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="50"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">22%</span>
             </div>
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">3</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: 35%;"
                        aria-valuenow="35" aria-valuemin="0" aria-valuemax="35"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">14%</span>
             </div>
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">2</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: 22%;"
                     aria-valuenow="22" aria-valuemin="0" aria-valuemax="22"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">5%</span>
             </div>
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">1</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: 14%;"
                    aria-valuenow="14" aria-valuemin="0" aria-valuemax="14"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">7%</span>
             </div>
          </div>
          <div class="d-grid">
             <h4>해당 상품 리뷰</h4>
             <p class="mb-0">다른 고객분들을 위해서 리뷰를 작성해주세요.</p>
             <a href="MyReviewList" class="btn btn-outline-gray-400 mt-4 text-muted">리뷰 작성하기</a>
          </div>
       </div>
    </div>
    <!-- col -->
    <div class="col-md-8">
       <div class="mb-10">
          <div class="d-flex justify-content-between align-items-center mb-8">
             <div>
                <!-- heading -->
                <h4>리뷰</h4>
             </div>
             <div>
                <select class="form-select" aria-label="Default select example">
                   <option selected>Top Review</option>
                   <option value="1">One</option>
                   <option value="2">Two</option>
                   <option value="3">Three</option>
                </select>
             </div>
          </div>
	            <c:forEach var="review" items="${listReview}" >
		          <div class="d-flex border-bottom pb-6 mb-6">
		             <!-- img -->
		             <!-- img --><img src="../../assets/images/avatar/avatar-10.jpg" alt=""
		                class="rounded-circle avatar-lg">
		             <div class="ms-5">
		                <h6 class="mb-1">
		                 <%--   ${review.m_name } --%>
		                </h6>
		                <!-- select option -->
		                <!-- content -->
		                <p class="small"> <span class="text-muted">${review.r_create_date}</span>
		                </p>
		                <!-- rating -->
		                <div class=" mb-2">
							<c:forEach begin="1" end="${review.r_rating}">
			                   <i class="bi bi-star-fill text-warning"></i>
			                </c:forEach>
		                   <span class="ms-3 text-dark fw-bold">${review.r_title}</span>
		                </div>
		                <!-- text-->
		                <p>${review.r_content}</p>
		             </div>
		          </div>
                </c:forEach>
                <!-- <a href="reviewList" class="btn btn-outline-gray-400 text-muted">리뷰 더보기</a> -->  
				<form action="ajaxReviewList">
					<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage}">
                	<input type="button" class="btn btn-outline-gray-400 text-muted" value="리뷰 더보기">
                	<%-- <input type="button" class="btn btn-outline-gray-400 text-muted" value="리뷰 더보기" onclick="moreReview(${page.currentPage })"> --%>
                </form>

          </div>
       </div>
      
    </div>
 </div>


  
<%@ include file="../common/footerFo.jsp" %>

</body>
</html>