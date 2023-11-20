<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html> 
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
  <title>Contact eCommerce HTML Template - FreshCart </title>
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/favicon.ico">


<!-- Libs CSS -->
<link href="../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
<link href="../assets/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
<link href="../assets/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">


<!-- Theme CSS -->
<link rel="stylesheet" href="../assets/css/theme.min.css">
<!-- Google tag (gtag.js) -->
<title>Insert title here</title>
<style type="text/css">
	#container {
		 position: absolute;
		  top: 50%;
		  left: 50%;
		
		  width: 600px;
		  height: 650px;
		
		  padding: 40px;
		
		
		  background-color: rgb(255, 255, 255);
		  border-radius: 10px;
		  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
		
		  transform: translateX(-50%) translateY(-50%);
			}
</style>
<script type="text/javascript">
	function searchBtn(nb_num) {
		location.href="writeForm?nb_num="+nb_num
	}
	function sendChildValue(title, image, nb_num){
		opener.setChildValue(title, image, nb_num);
		window.close();
	}
</script>
</head>
<body>
<div id="container">

	<form action="searchListBook" method="post">
	 <div class="input-group">
		<select name="search_type" class="w-25 rounded" style="border-color: rgb(223, 226, 225);" >
			<option value="nb_title">도서제목</option>
			<option value="nb_writer">지은이</option>
			<option value="nb_publisher">출판사</option>
		</select>&nbsp;&nbsp;
        <input name = "search_keyword" class="form-control rounded" type="search" placeholder="찾으실 도서를 검색해보세요." style="margin-right : 10px;">
        <input type="submit" class="rounded btn  btn-outline-gray-400 text-muted" value="검색">
	 </div>
	</form>
      <!-- row -->
      <div class="row">
	        <div class="col-lg-8 col-md-7">
	          <div class="py-3">
	          	<div class="">
			        <table class="table text-nowrap table-with-checkbox" style="margin-bottom: 0px;">
			                <thead class="table-light">
			                  <tr>
			                    <th></th>
			                    <th width="40">제목</th>
			                    <td></td>
			                  </tr>
			                </thead>
			                <tbody>
			                	<c:forEach var="book" items="${searchListBook }" varStatus="status">   		          				
				                	<tr>
				                		<td>
				                			<div class="col-3 col-md-2">
							                	<c:choose>
						                           <c:when test="${fn:contains(book.nb_image, 'http')}">
						                              <img src="${book.nb_image}" alt="Ecommerce"  width="75px" height="90px">
						                           </c:when>
						                           <c:otherwise>
						                              <img src="${pageContext.request.contextPath}/upload/${book.nb_image}" alt="Ecommerce"  width="75px" height="90px">
						                           </c:otherwise>
					                        	</c:choose>
							                </div>
				                		</td>
				                		<td width="40">
				                			<div class="col-4 col-md-5">
							                    <!-- 도서 제목 -->
							                    <a href="newbookDetail?nb_num=${book.nb_num }" class="text-inherit"><h6 class="mb-0">${book.nb_title }</h6></a>
							                    <span><small class="text-muted">${book.nb_publisher }</small></span>
							                    <!-- text -->
							                    <span class="text-muted">${book.nb_writer }</span>
							                </div>
				                		</td>
				                		
				                		<td  width="10px;" style="padding-top: 30px;">
				                			<a href="javascript:sendChildValue('${book.nb_title}', '${book.nb_image }', '${book.nb_num }')">
				                				<button type="button" class="rounded btn  btn-outline-gray-400 text-muted">선택</button>
				                			</a>
				                		</td>
				                	</tr>
				                </c:forEach>
			                </tbody>
			         </table>
			    </div>
			    
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
		
					 	<c:if test="${page.startPage > page.pageBlock }">
							 <li class="page-item justify-content-center">					
								<a class="page-link mx-1 text-body" href="searchBook?currentPage=${page.startPage-page.pageBlock}">이전</a>
							</li>
						</c:if>
		 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							 <li class="page-item justify-content-center">
		 						<a class="page-link mx-1 text-body" href="searchBook?currentPage=${i}">${i}</a>
							</li>
						</c:forEach>
							
						<c:if test="${page.endPage < page.totalPage }">
							 <li class="page-item justify-content-center">		 
								<a class="page-link mx-1 text-body" href="searchBook?currentPage=${page.startPage+page.pageBlock}">다음</a>
							</li>
						</c:if>
				    </ul>
			     </nav>

	          </div>

			    
			</div>
		</div>
</div>


</body>
</html>