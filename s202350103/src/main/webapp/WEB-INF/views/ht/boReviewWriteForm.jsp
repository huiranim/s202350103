<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
	       .rate { display: inline-block;border: 0;margin-right: 15px;}
	.rate > input {display: none;}
	.rate > label {float: right;color: #ddd}
	.rate > label:before {display: inline-block;font-size: 1rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
	.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
	.rate input:checked ~ label, 
	.rate label:hover,.rate label:hover ~ label { color: #f73c32 !important;  } 
	.rate input:checked + .rate label:hover,
	.rate input input:checked ~ label:hover,
	.rate input:checked ~ .rate label:hover ~ label,  
	.rate label:hover ~ input:checked ~ label { color: #f73c32 !important;  } 
</style>
</head>
<body>
 <form action="reviewWritePro">
 	 <input type="hidden" name="o_order_num" value="${review.o_order_num}">
 	 <input type="hidden" name="currentPage" value="${review.currentPage}">
	 <div>
	   <!-- rating -->
	   <h3 class="mb-5">리뷰 작성</h3>
	   <div class="border-bottom py-4 mb-4">
	      <h4 class="mb-3">별점</h4>
	       <fieldset class="rate">
	             <input type="radio" id="rating5" name="r_rating" value="5"><label for="rating5" title="5점"></label>
	             <input type="radio" id="rating4" name="r_rating" value="4"><label for="rating4" title="4점"></label>
	             <input type="radio" id="rating3" name="r_rating" value="3"><label for="rating3" title="3점"></label>
	             <input type="radio" id="rating2" name="r_rating" value="2"><label for="rating2" title="2점"></label>
	             <input type="radio" id="rating1" name="r_rating" value="1"><label for="rating1" title="1점"></label>
            </fieldset>
	      </div>
	   </div>
	 
	   <!-- form control -->
	   <div class="border-bottom py-4 mb-4">
	      <h5>제목</h5>
	      <input type="text" name="r_title" class="form-control" placeholder="제목을 작성해주세요!">
	   </div>
	 
	   <div class=" py-4 mb-4">
	      <!-- heading -->
	      <h5>텍스트 리뷰</h5>
	      <textarea name="r_content" class="form-control" rows="3"
	         placeholder="솔직한 사용후기를 작성해주세요!"></textarea>
	   </div>
	   <!-- button -->
	   <div class="d-flex justify-content-end">
	      <input type="submit" class="btn btn-primary" value="리뷰 저장">
	   </div>
	</div>
 </form>
	
	
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>