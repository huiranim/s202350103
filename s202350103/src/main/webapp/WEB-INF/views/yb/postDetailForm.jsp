<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/headerFo.jsp"%>
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