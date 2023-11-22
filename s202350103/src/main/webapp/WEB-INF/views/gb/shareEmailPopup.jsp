<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/none.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.top {
                position: relative;
                display: flex; 
                justify-content: space-between;
                padding: 0.5rem 1.4rem;
                background-color: #3CB371;
                vertical-align: middle;
            }
            
     h1.infoTit {
     				margin-top : 10px;
                    font-size: 20px; 
                    color:#ffffff;
                }
                
     #newbookInfo, #emailInfo  {
                    margin: 1.5em 1.8em;
                    font-size: 1.1em;
                    font-weight: 200;
                }
     #newbookImg {
			     	height: 20%;
			    	margin-left: 20%;
     }
     
</style>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		var mailResult = '${check}' ;
		// alert("mailResult ->"+mailResult);
		var nb_num = '${newbook.nb_num }';
		if(mailResult == 1) {
			alert("메일이 정상적으로 발송되었습니다.")
			// location.href = "newbookDetail?nb_num="+nb_num;
		}else if(mailResult == 2){
			alert("메일 발송에 실패했습니다.");
		}
	})
</script>
</head>
<body>
	<div id="popup">
		<header class="top">
			<h1 class="infoTit">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
				추천도서 메일발송</h1>
		</header>
		<main class="textBox">
			<form action="shareEmailTransport">
				<div id="newbookInfo" style="border: 1px solid;">
					<!-- 도서 정보 확인 -->
					 <div class="card mb-3" style="max-width: 540px;">
					 <input type="hidden" name="nb_num" value="${newbook.nb_num }">
					   <div class="row g-0">
					     <div class="col-md-4">
					       <c:choose>
			                  <c:when test="${fn:contains(newbook.nb_image, 'http')}">
			                     <img id="newbookImg" src="${newbook.nb_image}" alt="${newbook.nb_title}">
			                  </c:when>
			                  <c:otherwise>
			                     <img src="${pageContext.request.contextPath}/upload/${newbook.nb_image}" alt="${newbook.nb_title}">
			                  </c:otherwise>
			               </c:choose>
					     </div>
					     <div class="col-md-8">
					       <div class="card-body">
					         <h5 class="card-title">${newbook.nb_title }</h5>
					         <p class="card-text text-muted">${newbook.nb_writer } 지음 | ${newbook.nb_publisher } | ${newbook.nb_publi_date }</p>
					         <p class="card-text"><fmt:formatNumber value="${newbook.nb_price}" groupingUsed="true"/>원</p>
					       </div>
					     </div>
					   </div>
					 </div>
				</div>
				<hr>
				<div id="emailInfo">
					<!-- 보내는 사람 email -->
					<div class="mb-3">
					  <label class="form-label" for="email">보내시는분 Email</label>
					  <input type="email" id="email" name="m_email" class="form-control" value="${member.m_email }" required="required">
					</div>
					<hr>
					<!-- 보내는 사람 email -->
					<div class="mb-3">
					  <label class="form-label" for="email">받으시는분 Email</label>
					  <input type="email" id="email" name="recipient" class="form-control" placeholder="example@gmail.com" required="required">
					</div>
					<hr>
					<!-- 메일 직접 입력 내용 -->
				 	<div class="mb-3">
				   		<label for="textarea-input" class="form-label">메시지 직접입력</label>
				   		<textarea class="form-control" id="textarea-input" name="e_message" rows="5" placeholder="메일 내용을 작성해보세요"></textarea>
				 	</div>
				 	<hr>
				 	<!-- 발송하기 -->
				 	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				   		<button class="btn btn-dark mb-2" type="submit">발송하기</button>
				 	</div>
  				</div>
			</form>
		</main>
	</div>
</body>
</html>