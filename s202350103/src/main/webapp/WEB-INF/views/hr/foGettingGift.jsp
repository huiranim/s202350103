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

  <!-- section -->

  <section class="my-lg-14 my-8">
      <!-- container -->
    <div class="container">
      <div class="row">
          <!-- col -->
        <div class="offset-lg-2 col-lg-8 col-12">
          <div class="mb-8">
              <!-- heading -->
            <h3 style="align: center;">선물받기</h3><p>
          </div>
          <!-- form -->
          <form class="row" action="foGettingGiftAction">
          
            <h5 class="h5">메시지 카드</h5><p>
			<div class="card">
			   <img src="../assets/images/gift/giftcard${orderGift.o_gift_card }.png" class="card-img-top" alt="card" style="margin-top: 17px;">
			     <div class="card-body">
			       <h5 class="card-title">${orderGift.o_gift_msg }</h5>
			     </div>
			</div>
            
            <p><p><hr><p><p>
               
            <h5 class="h5">보내는 사람</h5><p>
              <!-- input -->
            <div class="col-md-12 mb-3">
              <label class="form-label"> 이름</label>
              <h6 class="h6">${orderr.m_name }</h6>
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label"> 휴대전화</label>
              <h6 class="h6">${orderr.m_ph }</h6>
            </div>
            
            <p><p><hr><p><p>
            
            <h5 class="h5">받는 사람
            	<span style="width: 10px;" class="badge bg-secondary" data-bs-toggle="tooltip" data-placement="right" title="보낸 사람이 입력한 정보를 확인 또는 수정해주세요. 주소는 새로 입력해주세요."> ? </span>
            </h5><p>
              <!-- input -->
            <div class="col-md-12 mb-3">
              <label class="form-label" for="o_rec_name"> 이름<span class="text-danger">*</span></label>
              <input type="text" id="o_rec_name" class="form-control" name="o_rec_name" value="${orderr.o_rec_name }" required>
            </div>
            <div class="col-md-12 mb-3">
              <label class="form-label" for="o_rec_mail"> 이메일<span class="text-danger">*</span></label>
              <input type="text" id="o_rec_mail" class="form-control" name="o_rec_mail" value="${orderr.o_rec_mail }" required>
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="o_rec_ph"> 휴대전화<span class="text-danger">*</span></label>
              <input type="text" id="o_rec_ph" name="o_rec_ph" class="form-control" value="${orderr.o_rec_ph }" required>
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="o_rec_addr"> 주소<span class="text-danger">*</span></label>
              <input type="text" id="o_rec_addr" name="o_rec_addr" class="form-control" value="${orderr.o_rec_addr }" required>
            </div>
            
            <p><p><hr><p><p>
            
            <h5 class="h5">상품</h5><p>
				<div class="row">
				  <div class="col-12">
				     <div style="border: 1px solid #dfe2e1;
				     			 border-radius: 0.5rem;
				     			 padding: 0.55rem 1rem;">
				     <div>
				        <!-- card body -->
				        <div class="card-body">
				           <div class=" row align-items-center">
				              <!-- col -->
				              <div class="col-md-4 col-12">
				                 <div class="text-center position-relative ">
				                       <!-- img --><img src="${orderr.nb_image}" alt="${orderr.nb_title}" class="mb-3 img-fluid" style="height: 150px;">
				                 </div>
				              </div>
				              <div class="col-md-8 col-12 flex-grow-1">
				                 <!-- heading -->
				                 <h2 class="fs-6">${orderr.nb_title}</h2>
				                 <div class="text-small mb-1"><small><fmt:formatNumber value="${orderr.o_de_count}" groupingUsed="true"/>개</small></div>
				              </div>
				           </div>
				        </div>
				     </div>
				     </div>
				  </div>
				</div>
            	
            <p><p><p><p><p><p>
            	
            <div class="d-grid gap-2">
	            <input class="btn btn-primary" type="submit" value="선물받기">
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

<%@ include file="../common/footerFo.jsp" %>
</body>
</html>