<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/sideFo.jsp" %>

		      <!-- row -->
		      <div class="row">
		        <div class="col-lg-12">
		          <div class="card py-1 border-0 mb-8">
           			 <div>
             			 <h1 class="fw-bold">찜목록</h1><br>
              			 <h4>총 상품 개수 : ${totalWishList }</h4>
           			 </div>
		          <div>
		            <!-- table -->
		            <div class="table-responsive">
		              <table class="table text-nowrap table-with-checkbox">
		              <c:forEach var="wishList" items="${memberWishList }">
		                <thead class="table-light">
		                  <tr>
		                    <th>
		                      <!-- form check -->
		                      <div class="form-check">
		                        <!-- input --><input class="form-check-input" type="checkbox" value="" id="checkAll">
		                        <!-- label --><label class="form-check-label" for="checkAll">
		
		                        </label>
		                      </div>
		                    </th>
		                    <th></th>
		                    <th>제목</th>
		                    <th>출판사</th>
		                    <th>가격</th>
		                    <th>상태</th>
		                    <th>삭제</th>
		                  </tr>
		                </thead>
		                <tbody>
		                  <tr>
		                    <td class="align-middle">
		                      <!-- form check -->
		                      <div class="form-check">
		                        <!-- input --><input class="form-check-input" type="checkbox" value="" id="chechboxTwo">
		                        <!-- label --><label class="form-check-label" for="chechboxTwo">
		
		                        </label>
		                      </div>
		
		                    </td>
		                    <td class="align-middle">
		                      <a href="newbookDetail?nb_num=${wishList.nb_num }"><img src="${wishList.nb_image }"
		                          class="icon-shape icon-xxl" alt=""></a>
							 
		                    </td>
		                    <td class="align-middle">
		                      <div>
		                        <h5 class="fs-6 mb-0"><a href="newbookDetail?nb_num=${wishList.nb_num }" class="text-inherit">${wishList.nb_title }</a></h5>
		                         <small>${wishList.nb_writer }</small>
		                      </div>
		                    </td>
		                    <td class="align-middle"> ${wishList.nb_publisher }</td>
		                    <td class="align-middle">${wishList.nb_price }</td>
		                    <td class="align-middle">
		                      <div class="btn btn-primary btn-sm">장바구니 추가</div>
		                    </td>
		                    <td class="align-middle "><a href="#" class="text-muted" data-bs-toggle="tooltip"
		                        data-bs-placement="top" title="Delete">
		                        <i class="feather-icon icon-trash-2"></i>
		                      </a></td>
		                  </tr>
		                </tbody>
		                </c:forEach>
		              </table>
		            </div>
		
		          </div>
		        </div>
		
		      </div>
		
		
		
		    </div>
	
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>