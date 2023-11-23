<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
	.file-label {
				  margin-top: 30px;
				  background-color: #5b975b;
				  color: #fff;
				  text-align: center;
				  padding: 10px 0;
				  width: 65%;
				  border-radius: 6px;
				  cursor: pointer;
				}
	.file {
	 			display: none;
	}
   .upload-box {
			    box-sizing: border-box;
			    margin-right: 20px;
				display: flex;
			    align-items: center;
    }
	.upload-box .drag-file {
				position: relative;
				width: 100%;
				height: 100px;
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				border: 2px dashed #a6d529;
				margin: 0px 10px 0 10px;
	}

	.upload-box .drag-file .image {
  				width: 100px; height: 95px;
	}

	.container {
		 position: absolute;
		  top: 50%;
		  left: 50%;
		  width: 600px;
		  height: auto;
		  padding: 40px;
		  background: linear-gradient(180deg, #f4faf2 0, #f4faf2 473px, #edf7ea 473px, #edf7ea 100%);
		  border-radius: 10px;
		  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
		  transform: translateX(-50%) translateY(-50%);
			}
	#cm_bookTitle:hover{background: ##c1c7c6; color: white;}
	#cm_bookTitle {color: black;font-size: bold;}
	.form-label {font-size: bold;}
	.star-rating {
	  display: flex;
	  flex-direction: row-reverse;
	  font-size: 2.25rem;
	  line-height: 2.5rem;
	  justify-content: space-around;
	  padding: 0 0.2em;
	  text-align: center;
	  width: 5em;
	}
 
	.star-rating input {
	  display: none;
	}
	 
	.star-rating label {
	  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
	  -webkit-text-stroke-width: 2.3px;
	  -webkit-text-stroke-color: #2b2a29;
	  cursor: pointer;
	}
	 
	.star-rating :checked ~ label {
	  -webkit-text-fill-color: gold;
	}
	 
	.star-rating label:hover,
	.star-rating label:hover ~ label {
	  -webkit-text-fill-color: #fff58c;
	}
	#textLabel:hover {
		color: white;
	}
	#textLabel {
		font-style: bold; font-size: 20px;
	}
</style>
<script type="text/javascript">
	document.getElementById("image").src = cm_image;
	document.setElementById("cm_image").src = cm_image;
	
</script>
</head>
<body>
<section class="my-lg-14 my-8" style="width: 90%; ">
     <!-- container -->
     <div class="container" id="container">
      <div class="row">
       <div class="offset-lg-2 col-lg-8 col-12">
	   <form action="communityUpdateDo" method="post" name="" enctype="multipart/form-data">
		   <input type="hidden" name="cm_num" value="${community.cm_num }">
		   <input type="hidden" name="m_num" value="${community.m_num }">
		   <input type="hidden" name="nb_num" value="${community.nb_num }">
		   <input type="hidden" name="cm_num" value="${community.cm_num }">
		   <input type="hidden" name="cm_image" value="${community.cm_image }">
		   
		    <div class="col-md-12 mb-3">
	          <label class="form-label" for="title"></label>
	          <input type="text" id="nb_title" name="nb_title" class="form-control" placeholder="책 제목" style="margin-top: 15px;" value="${community.nb_title }" readonly="readonly">
	<!--           <input type="text" id="book_image" name="book_image" class="form-control" placeholder=""> -->
	        </div>
			<div class="col-md-12 mb-3">
	          <label class="form-label" for="title"> 제목 *</label>
	          <input type="text" id="cm_title" name="cm_title" class="form-control" required value="${community.cm_title }">
	        </div>
	       
	        <div class="col-md-12 mb-3">
	          <label class="form-label" for="comments"> 내용 *</label>
	          <textarea rows="3" name="cm_content" id="cm_content" class="form-control">${community.cm_content }</textarea>
	        </div>
	        <div class="col-md-12 mb-3">
		      <label class="form-label" for="comments"> 별점 *</label>
		       <div class="star-rating space-x-4 mx-auto">
					<input type="radio" id="5-stars" name="cm_rating" value="5"/>
					<label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="cm_rating" value="4"/>
					<label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="cm_rating" value="3"/>
					<label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="cm_rating" value="2"/>
					<label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star"  name="cm_rating" value="1" />
					<label for="1-star" class="star">★</label>
				</div>
		      </div>
        
	        <div class="col-md-12 mb-3">
	        	<label class="form-label" for="comments"> 책 이미지</label>
	        	<div class="upload-box">
				  <span id="drop-file" class="drag-file">
				    <img src="${community.cm_image }" alt="파일 아이콘" class="image" id="image" name="image">
				    <input type="hidden" id="cm_image" name="cm_image"> 
				  </span>
				  <span id="drop-file" class="drag-file custom-image">
				    <c:if test="${community.cm_image1 != null}" >
						<img src="${pageContext.request.contextPath}/upload/yb/${community.cm_image1}" alt="파일 아이콘" class="image" id="image1" name="cm_image1" width="60px" height="90px">
					</c:if> 
				  </span>
				  <c:if test="${community.cm_image2 != null}" >
				  	<span id="drop-file" class="drag-file custom-image">
						<img src="${pageContext.request.contextPath}/upload/yb/${community.cm_image2}" alt="파일 아이콘" class="image" id="image1" name="cm_image2" width="60px" height="90px">
				  	</span>
				  </c:if>
				</div>
	        </div>
	        <div class="d-grid gap-2 col-3 mx-auto">
			   <input type="file" id="imgUpload" name="multiFile" style="display:none;"></input>
			   <label for="imgUpload" id="textLabel">이미지 변경</label> <br>
	        </div>
	       <div class="d-grid gap-2 col-3 mx-auto">
			    <input type="submit" class="btn btn-soft-primary" value="수정">
		   </div>
       </form>
   	</div>
   </div>
</div>
</section>

</body>
</html>
</body>
</html>