<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<script type="text/javascript">
/* 	function target_bnt(){
		$('.sendNb').load("ModetailNb");
		
	} */

</script>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
<title>DADOK-AD</title>
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon"
	href="../assets/images/favicon/favicon.ico">


<!-- Libs CSS -->
<link href="../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css"
	rel="stylesheet">
<link href="../assets/libs/feather-webfont/dist/feather-icons.css"
	rel="stylesheet">
<link href="../assets/libs/simplebar/dist/simplebar.min.css"
	rel="stylesheet">


<!-- Theme CSS -->
<link rel="stylesheet" href="../assets/css/theme.min.css">
<!-- Google tag (gtag.js) -->

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap JS -->
<script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>


<!-- End Tag -->

</head>
<body>
<div class="row">
 <div class="col-12">
       <div class="py-3">
      	  <p class="text-center fs-1 ">새상품 도서 내역 </p>
          <ul class="list-group list-group-flush">
             <!-- list group -->
         	<c:forEach var="oldBook" items="${listMoOb }"> 
             <li class="list-group-item py-3 py-lg-0 px-0 border-top">
                <!-- row -->
                <div class="row align-items-center">
                   <div class="col-3 col-md-2">
                      <!-- img --> <img src="${oldBook.nb_image}" alt="Ecommerce" class="img-fluid">
                  	<input type="hidden" name="nb_image" value="${oldBook.nb_image }">
                   </div>
                   <div class="col-4 col-md-5">
                      <!-- title -->
                      
                        <h6 class="mb-0"><input type="hidden" name="nb_num" value="${oldBook.nb_num}"> 
                        			<input type="hidden"  name="nb_title" value="${oldBook.nb_title }">
                        			${oldBook.nb_title }
                          </h6>
                 
                      <span><small class="text-muted">
	                      <input type="hidden" disabled="disabled" name="nb_writer" value="${oldBook.nb_writer}"> ${oldBook.nb_writer}
	                       / 
	                      <input type="hidden"  name="nb_publisher" value="${oldBook.nb_publisher }">${oldBook.nb_publisher } 
                      </small></span>
                      
                      
                      <!-- text -->
                    </div>
                      <!-- input group -->
                   <div class="col-3 col-md-3 col-lg-3">
                      <!-- input -->
   						<input type="hidden" name="nb_price" value="${oldBook.nb_price }"> 
   						<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price}"/>원   
                   </div>
                   <!-- 넣기 -->
              <div class="col-2 text-lg-end text-start text-md-end col-md-2">
             <span class="fw-bold"> <input type="submit" value="선택" onclick="location.href='ModetailNb?nb_num=${oldBook.nb_num}'"></span>	
               </div>
                </div>
             </li>
             </c:forEach>
             </ul>
           
       </div> 
    </div>
</div>



</body>
</html>