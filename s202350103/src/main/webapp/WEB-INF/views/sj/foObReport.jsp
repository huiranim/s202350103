<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!-- 앞단 판매신청  -->
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
/*  modal 에 리스트 불러오는 기능 */
	function openfoModalList(){
		$('.modal-content').load("ModalList");
	}

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="writeFormObCal" method="get">
<p class="text-center fs-1 ">중고 도서 판매 신청 </p>
	<p class="text-center fs-3 ">도서 선택 </p>
	<!-- 새상품 서치  -->
	<div class="row">
  <div class="col-12">
     <div class="card card-product">
        <!-- card body -->
        <div class="card-body">
           <div class=" row align-items-center">
              <!-- col -->
              <div class="col-md-4 col-12">
                 <div class="text-center position-relative " >
                    <div class=" position-absolute top-0">
                    <input type="hidden" name="m_num" value="${oldBook.m_num }">
                       <!-- badge --> <span class="badge bg-danger">새상품</span>
                       <input type="hidden"  name="nb_num" value="${oldBook.nb_num }" >
                    </div>
                       <!-- img --><img src="${oldBook.nb_image }"
                         alt="" class="mb-3 img-fluid">
                         <input type="hidden" name="nb_image" value="${oldBook.nb_image }">
                 </div>
              </div>
              <div class="col-md-8 col-12 flex-grow-1">
                 <!-- heading -->
                 <div class="text-small mb-1">
                 </div>
                 <h2 class="fs-6">
                 <br>
                 	책 제목 : ${oldBook.nb_title}
                 <input type="hidden" name="nb_title" value="${oldBook.nb_title }">
                 </h2>
                 <div>
                  <span><small class="text-muted"><input type="hidden" name="nb_writer" value="${oldBook.nb_writer}">지은이 : ${oldBook.nb_writer}/ 
                      <input type="hidden"  name="nb_publisher" value="${oldBook.nb_publisher }">출판사 : ${oldBook.nb_publisher } </small></span>
                 </div>
                 <div class=" mt-6">
                    <!-- price -->
                      <div>
                      <span class="text-dark"> 가격 : <fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price}"/>원    	  <input type="hidden" name="nb_price" value="${oldBook.nb_price }">  </span> 
                      
                    </div>
                    <br>

                    <!-- btn -->
          
                    <!-- btn -->
                    
                  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal-2" 
                  				onclick="openfoModalList()">
   					새상품 조회
</button>
<!-- Modal -->
<div class="modal fade col-lg-8" id="exampleModal-2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- 모달 바디 -->
            <div class="modal-body">
                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
                 </div>
              </div>
           </div>
        </div>
     </div>
  </div>
 </div>	
 
	
	

	<p class="text-start fs-3 ">약관  동의</p>
		<hr>
      		
      		<label class="form-label" for="comments"> 
          <strong >중고 서비스 약관1</strong>
          </label><p>
			<input class="form-check-input"  type="checkbox" value="ck1" id="ck1" required="required">
			서비스 이용약관 1
          <textarea rows="7" id="comments" class="form-control">
		흐헤헤헤헤
		</textarea><p>
			<hr>
      		
      		<label class="form-label" for="comments"> 
          <strong >중고 서비스 약관2</strong>
          </label><p>
			<input class="form-check-input"  type="checkbox" value="ck2" id="ck2" required="required">
			서비스 이용약관 2
          <textarea rows="7" id="comments" class="form-control">
		흐헤헤헤헤
		</textarea><p>
		
			<hr>
      		
      		<label class="form-label" for="comments"> 
          <strong >중고 서비스 약관3</strong>
          </label><p>
			<input class="form-check-input"  type="checkbox" value="ck3" id="ck3" required="required">
			서비스 이용약관 3
          <textarea rows="7" id="comments" class="form-control">
		흐헤헤헤헤
		</textarea><p>
		
	 <div class="d-grid gap-2">
	    <button class="btn btn-dark" type="submit">판매 계속</button>
	 
	 </div>
</form>

</body>
<%@ include file="../common/footerFo.jsp" %>
</html>