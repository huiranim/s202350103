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
		<div class="col-lg-12">
		    <!-- 상품목록 -->
		    <div class="mb-8">
		       <!-- heading -->
		       <h1 class="mb-1">새상품 목록</h1>
		       <p>There are 5 products in this wishlist.</p>
		    </div>
		    <div class="col-md-2 col-md-8  d-block">
		    	<!-- 검색 -->
		        <div class="input-group mb-3">
					<select id="search_type" class="w-20 rounded" style="border-color: rgb(223, 226, 225);" >
						<option value="title">도서제목</option>
						<option value="writer">지은이</option>
						<option value="publisher">출판사</option>
					</select>&nbsp;&nbsp;
		            <input id = "search_keyword" class="form-control rounded" type="search" placeholder="찾으실 도서를 검색해보세요." >
		            
		            <!-- 검색 버튼 -->
		            <div class="col-md-2 col-xxl-2 d-none d-lg-block" style="margin-left: 5px;">
		              <button type="button" class="btn  btn-outline-gray-400 text-muted" data-bs-toggle="modal"
		                	data-bs-target="#locationModal" onclick="search()">검색  </button>
		            </div>
		        </div>
			</div>
	            
		    <div>
		       <!-- table -->
		       <div class="table-responsive" style="text-align: center;">
		          <table class="table text-nowrap">
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
		                   <th>지은이</th>
		                   <th>가격</th>
		                   <th>출판사</th>
		                   <th>출간일</th>
		                   <th>국내/해외</th>
		                   <th>카테고리</th>
		                   <th colspan='2'>수정/삭제</th>
		                </tr>
		             </thead>
		             <tbody>
		             	<c:forEach var="newbook" items="${listBoNewbook }">
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
		                      <a href="#"><img src="../../assets/images/products/product-img-18.jpg" class="icon-shape icon-xxl" alt=""></a>
		                   </td>
		                   <td class="align-middle">
		                      <div>
		                      <h5 class="fs-6 mb-0"><a href="#" class="text-inherit">Organic Banana</a></h5>
		                      <small>$.98 / lb</small>
		                      </div>
		                   </td>
		                   <td class="align-middle">홍길동</td>
		                   <td class="align-middle">$35.00</td>
		                   <td class="align-middle">중앙출판사</td>
		                   <td class="align-middle">2023-11-07</td>
		                   <td class="align-middle">국내</td>
		                   <td class="align-middle">경제/경영</td>
		                   <td colspan='2' class="align-middle">
		                      <div class="btn btn-info mb-2">수정</div>
		                      <div class="btn btn-secondary mb-2">삭제</div>
		                   </td>
		                </tr>
		            </c:forEach>
			    </tbody>
			  </table>
			  </div>
			</div>
		</div>
	</div>

</body>
</html>