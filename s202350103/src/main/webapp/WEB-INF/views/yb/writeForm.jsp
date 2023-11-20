<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			    width: 20%;
			    
			    box-sizing: border-box;
			    margin-right: 30px;
			    display: flex;
			    flex-direction: column;
			    justify-content: center;
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
				border: 3px dashed #dbdbdb;
	}

	.upload-box .drag-file .image {
  				width: 60px;
	}

	.container {
		 position: absolute;
		  top: 50%;
		  left: 50%;
		
		  width: 600px;
		  height: 650px;
		
		  padding: 40px;
		
		
		  background: linear-gradient(180deg, #f4faf2 0, #f4faf2 473px, #edf7ea 473px, #edf7ea 100%);
		  border-radius: 10px;
		  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
		
		  transform: translateX(-50%) translateY(-50%);
			}
	#cm_bookTitle:hover{background: ##c1c7c6; color: white;}
	#cm_bookTitle {color: black;font-size: bold;}
	.form-label {font-size: bold;}
</style>
<script type="text/javascript">
	function func() {
		document.form.file.click();
		document.form.text1.value = document.form.file.value();
	}
	
	function searchBtn() {
			
			var url = "searchBook";
	        var name = "searchBook";
	        var option = "position= absolute, top= 50%, left= 50%, width= 600, height= 750px, padding= 40px, text-align= center, background-color= rgb(255, 255, 255), border-radius= 10px, box-shadow= 0 2px 3px 0 rgba(34, 36, 38, 0.15), transform= translateX(-50%) translateY(-50%);"
			window.open(url, name, option);

	}
	
	var receivedImageURL = "";
	var receivedImageURLString = "";
	function setChildValue(title, image, nb_num){
		  receivedImageURL = image;
		  receivedImageURLString = image;
		  document.getElementById("image").src = receivedImageURL;
		  document.getElementById("cm_image").value = receivedImageURLString;
		  document.getElementById("nb_title").value = title;
		  document.getElementById("nb_num").value = nb_num;	  
	}
	
	
</script>
</head>
<body>
<section class="my-lg-14 my-8" style="width: 90%; ">
     <!-- container -->
     <div class="container" id="container">
      <div class="row">
       <div class="offset-lg-2 col-lg-8 col-12">
	   <form action="communityInsert" method="post" name="">
	   	<input type="hidden" name="m_num" id="m_num" value="${member.m_num }">
	   	<input type="hidden" name="nb_num" id="nb_num">
	    <div class="col-md-12 mb-3">
          <label class="form-label" for="title"></label>
          <button type="button" id="cm_bookTitle" name="cm_bookTitle" class="rounded btn form-control btn-outline-gray-400" onclick="searchBtn()">책 검색</button>
          <input type="text" id="nb_title" name="nb_title" class="form-control" placeholder="책 제목" style="margin-top: 15px;">
<!--           <input type="text" id="book_image" name="book_image" class="form-control" placeholder=""> -->
        </div>
		<div class="col-md-12 mb-3">
          <label class="form-label" for="title" > 제목 *</label>
          <input type="text" id="cm_title" name="cm_title" class="form-control" placeholder="Your Title" required>
        </div>
       
        <div class="col-md-12 mb-3">
          <label class="form-label" for="comments"> 리뷰 작성 *</label>
          <textarea rows="3" name="cm_content" id="cm_content" class="form-control" placeholder="내용을 10자 이상 입력해 주세요. 주제와 무관한 댓글, 악플, 배송문의 등의 글은 임의 삭제될 수 있습니다."></textarea>
        </div>
        <input type="checkbox" value="spo" style="margin-bottom: 10px;">이 리뷰는 스포일러 내용이 포함되어 있습니다.
        
        <div class="col-md-12 mb-3">
        	<label class="form-label" for="comments"> 책 이미지</label>
        	<div class="upload-box">
			  <div id="drop-file" class="drag-file">
			    <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" id="image" name="image">
			    <input type="hidden" id="cm_image" name="cm_image"> 
			  </div>
			</div>
        </div>
        <div class="col-md-12">
             <!-- btn -->
             <input type="submit" class="btn btn-primary" value="등록">
       </div>
       </form>
   	</div>
   </div>
</div>
</section>

</body>
</html>