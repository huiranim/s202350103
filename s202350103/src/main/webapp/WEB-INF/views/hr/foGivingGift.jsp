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
            <h1 class="h3" style="align: center;">선물하기</h1><p>
          </div>
          <!-- form -->
          <form class="row">
            <h5 class="h5">보내는 사람</h5><p>
              <!-- input -->
            <div class="col-md-12 mb-3">
            
            
              <label class="form-label" for="fname"> 이름</label>
              <h6 class="h6">홍길동</h6>
              <!-- <input type="text" id="fname" class="form-control" name="fname" placeholder="홍길동" required> -->
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="lname"> 이메일</label>
              <h6 class="h6">hong@dadok.com</h6>
              <!-- <input type="text" id="lname" class="form-control" name="lname" placeholder="hong@dadok.com" required> -->
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="company"> 휴대전화</label>
              <h6 class="h6">010-0000-0000</h6>
              <!-- <input type="text" id="company" name="company" class="form-control" placeholder="010-0000-0000" required> -->
            </div>
            <p><p>
            
            <h5 class="h5">받는 사람</h5><p>
              <!-- input -->
            <div class="col-md-12 mb-3">
              <label class="form-label" for="fname"> 이름<span class="text-danger">*</span></label>
              <input type="text" id="fname" class="form-control" name="fname" placeholder="홍길동" required>
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="company"> 휴대전화<span class="text-danger">*</span></label>
              <input type="text" id="company" name="company" class="form-control" placeholder="010-0000-0000" required>
            </div>
            
            <p><p><hr><p><p>
            
            <h5 class="h5">메시지 카드</h5><p>
            <div class="col-md-12 mb-3">
            	<input type="radio" name="card" value="card1"><img alt="card1" src="../assets/images/gift/giftcard1.png"><br>
            	<input type="radio" name="card" value="card2"><img alt="card2" src="../assets/images/gift/giftcard2.png"><br>
            	<textarea rows="3" name="msg" class="form-control" placeholder="메시지를 입력해주세요."></textarea>
            </div>
            
            <p><p><hr><p><p>
            
            <h5 class="h5">주문 상품</h5><p>
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
				                       <!-- img --><img src="../../assets/images/products/product-img-1.jpg"
				                         alt="Grocery Ecommerce Template" class="mb-3 img-fluid">
				                 </div>
				              </div>
				              <div class="col-md-8 col-12 flex-grow-1">
				                 <!-- heading -->
				                 <h2 class="fs-6">상품명</h2>
				                 <div class="text-small mb-1"><small>수량</small></div>
				                 <div class=" mt-6">
				                    <!-- price -->
				                    <div><span class="text-dark">가격</span></div>
				                 </div>
				              </div>
				           </div>
				        </div>
				     </div>
				     </div>
				  </div>
				</div>
				
            <p><p><hr><p><p>
            
            <h5 class="h5">할인/부가결제</h5><p>
              <!-- input -->
            <div class="col-md-12 mb-3">
              <label class="form-label" for="fname"> 사용 포인트</label>
              <input type="text" id="fname" class="form-control" name="point">
            </div>
				
            <p><p><hr><p><p>
            
            <h5 class="h5">결제 정보</h5><p>
              <!-- input -->
            <div class="col-md-12 mb-3">
            	<table style="width: 100%;">
            		<tr>
            			<td class="form-label" width="70%">상품금액</td>
            			<td class="h6" width="30%" align="right">10,000 원</td>
            		</tr>
            		<tr>
            			<td class="form-label" width="70%">배송비</td>
            			<td class="h6" width="30%" align="right">3,000 원</td>
            		</tr>
            		<tr>
            			<td class="form-label" width="70%">할인/부가결제</td>
            			<td class="h6" width="30%" align="right">- 1,000 원</td>
            		</tr>
            		<tr style="border-top: 1px solid #dfe2e1;
            				   border-bottom: 1px solid #dfe2e1;"
            				   >
            			<td class="form-label" width="70%">최종 결제 금액</td>
            			<td class="h6" width="30%" align="right">12,000 원</td>
            		</tr>
            		<tr>
            			<td class="form-label" width="70%">적립 혜택</td>
            			<td class="h6" width="30%" align="right">120 원</td>
            		</tr>
            	</table>
            </div>
				
            <p><p><hr><p><p>
            
            <h5 class="h5">결제 수단</h5><p>
            	버튼 버튼 버튼
            
            <div class="col-md-12">
              <!-- btn -->
              <button type="submit" class="btn btn-primary">결제하기</button>
            </div>


          </form>

        </div>
      </div>
    </div>

  </section>

<%@ include file="../common/footerFo.jsp" %>
</body>
</html>