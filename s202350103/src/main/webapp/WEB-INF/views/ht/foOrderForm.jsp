<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  #k {
    border: 1px solid #ccc; /* 태두리 스타일 및 색상 지정 */
    border-radius: 10px; /* 라운드 처리 */
    text-align: center; /* 텍스트 중앙 정렬 */
  }

  .nav-link {
    padding: 10px; /* 옆 여백 추가 */
  }
</style>

 <!-- 주소검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>	

<!--   메세지 선택이 직접입력일 경우 메모 표시 -->
<script>
  // 직접입력 선택될 경우, o_rec_msg의 value값이 직접입력에서 textarea의 값으로 바뀌는 작업임
  document.getElementById('omessage_select').addEventListener('change', function () {
    var textareaDiv = document.querySelector('.ec-shippingInfo-omessageInput');
    var selectedOption = this.options[this.selectedIndex].value;
    var omessageTextarea = document.getElementById('omessage');
    var o_rec_msgInput = document.querySelector('[name="o_rec_msg"]');

    if (selectedOption === '직접 입력') {
      textareaDiv.style.display = 'block';
      omessageTextarea.required = true; // 직접 입력이 선택되었을 때 필수로 설정
    } else {
      textareaDiv.style.display = 'none';
      omessageTextarea.required = false; // 직접 입력이 아닌 경우 필수 해제
      o_rec_msgInput.value = selectedOption; // 선택된 값을 직접 입력 값으로 설정
      omessageTextarea.value = ''; // 값 초기화
    }
  });
</script>
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
            <h3 style="align: center;">배송지</h3><p>
          </div>
          <!-- form -->
          <form class="row" action="foGivingGiftAction">
          	
          	<div class="col-md-12 mb-3">
          		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				  <li class="nav-item col" id="k">
				    <a class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">최근 배송지</a>
				  </li>
				  <li class="nav-item col" id="k">
				    <a class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">직접 입력</a>
				  </li>
				</ul>
				<div class="tab-content" id="pills-tabContent">
				
				   <!-- 최근 배송지 -->
				  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
		              <!-- input -->
		            <input type="hidden" name="m_name" value="${member.m_name }">
		            <input type="hidden" name="m_addr" value="${member.m_addr }">
		            <input type="hidden" name="m_ph"   value="${member.m_ph }">
		            
		            <div class="col-md-12 mb-3">
		              <label class="form-label"> 이름</label>
		              <h6 class="h6">${member.m_name }</h6>
		            </div>
		            <div class="col-md-12 mb-3">
		              <!-- input -->
		              <label class="form-label"> 주소</label>
		              <h6 class="h6">${splitAddr[0]} ${splitAddr[1]}</h6>
	              	  <h6 class="h6">${splitAddr[2]}</h6>
		            </div>
		            <div class="col-md-12 mb-3">
		              <!-- input -->
		              <label class="form-label"> 휴대전화</label>
		              <h6 class="h6">${member.m_ph }</h6>
		            </div>
				  </div>
				  
				  
				  
				   <!-- 직접 입력 -->
				  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
				  	<div class="col-md-12 mb-3">
		              <label class="form-label" for="o_rec_name"> 이름<span class="text-danger">*</span></label>
		              <input type="text" id="o_rec_name" class="form-control" name="m_name" placeholder="홍길동" required  style="width: 150px;">
		            </div>
		            <div class="col-md-12 mb-3">
		              <label class="form-label" for="o_rec_name"> 주소<span class="text-danger">*</span></label><br>
		            <label class="form-label" for="o_rec_name">
	                	<input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호">
	                </label>
	                <label class="form-label" for="o_rec_name">
						<input type="button" class="form-control" name="m_addr1" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="background-color: lightgray;">
					</label><br>
					<label class="form-label" for="o_rec_name">
						<input type="text" id="sample6_address" name="m_addr2" class="form-control" placeholder="주소">
					</label><br>
					<label class="form-label" for="o_rec_name">
					<input type="text" id="sample6_extraAddress" class="form-control" placeholder="참고항목" readonly>
					</label><br>
					<label class="form-label" for="o_rec_name">
					<input type="text" id="sample6_detailAddress" name="m_addr" class="form-control" placeholder="상세주소" required="required">
					</label>
		            
		            
		            
		            </div>
		            <div class="col-md-12 mb-3">
		              <!-- input -->
		              <label class="form-label" for="o_rec_ph"> 휴대전화<span class="text-danger">*</span></label>
		              <div class="form-group">
					    <div class="d-flex">
					     <input type="text" id="o_rec_ph1" name="m_ph1" class="form-control" placeholder="010" required>
					     <span class="mx-1">-</span>
					     <input type="text" id="o_rec_ph2" name="m_ph2" class="form-control" placeholder="0000" required>
					     <span class="mx-1">-</span>
					     <input type="text" id="o_rec_ph3" name="m_ph3" class="form-control" placeholder="0000" required>
					    </div>
					  </div>
		            </div>
				  </div>
				</div>
          	</div>
          	<p><hr><p>
          	
          	<div class="mb-3">
			  <select class="form-select" id="omessage_select" name="o_rec_msg" fw-filter="" fw-label="배송 메세지" fw-msg="">
			    <option selected>-- 메시지 선택 (선택사항) --</option>
			    <option value="배송 전에 미리 연락바랍니다.">배송 전에 미리 연락바랍니다.</option>
			    <option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
			    <option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
			    <option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
			    <option value="택배함에 보관해 주세요.">택배함에 보관해 주세요.</option>
			    <option value="직접 입력">직접 입력</option>
			  </select>
			</div>
			
			<div class="mb-3">
			  <div class="ec-shippingInfo-omessageInput gBlank10" style="display:none;">
			    <textarea class="form-control" id="omessage" name="ec-shippingInfo-omessageInput" fw-filter="" fw-label="배송 메세지" fw-msg="" maxlength="30" cols="50" rows="1"></textarea>
			  </div>
			</div>
			
          	
            <p><p><hr class="my-4" style="border-width: 2px; border-color: #333;"><p><p>
            
            <h5 class="h5">주문 상품</h5><p>
				<div class="row">
				  <div class="col-12">
				     <div style="border: 1px solid #dfe2e1;
				     			 border-radius: 0.5rem;
				     			 padding: 0.55rem 1rem;">
				     <div>
				        <!-- 주문 리스트 -->
				        <div class="card-body">
				           <div class=" row align-items-center">
				           
				           	<c:forEach var="newbook" items="orderList">
				              <!-- col -->
				              <div class="col-md-4 col-12">
				                 <div class="text-center position-relative ">
				                       <!-- img --><img src="${newbook.nb_image}" alt="${newbook.nb_title}" class="mb-3 img-fluid" style="height: 150px;">
				                 </div>
				              </div>
				              <div class="col-md-8 col-12 flex-grow-1">
				                 <!-- heading -->
				                 <h2 class="fs-6">${newbook.nb_title}</h2>
				                 <div class="text-small mb-1"><small><fmt:formatNumber value="${newbook.c_count}" groupingUsed="true"/>개</small></div>
				                 <div class=" mt-6">
				                    <!-- price -->
				                    <div><span class="text-dark"><fmt:formatNumber value="${newbook.nb_price}" groupingUsed="true"/>원</span></div>
				                 </div>
				              </div>
				             </c:forEach> 
				              
				           </div>
				        </div>
				     </div>
				     </div>
				  </div>
				</div>
				
            <p><p><hr class="my-4" style="border-width: 2px; border-color: #333;"><p><p>
    
    
            <p><p><hr class="my-4" style="border-width: 2px; border-color: #333;"><p><p>
            
            <h5 class="h5">결제 수단</h5><p>
            	<div class="d-grid gap-2 col-6 mx-auto">
	            	<button type="button" class="btn btn-soft-secondary mb-2">카카오</button>
	            	<button type="button" class="btn btn-soft-secondary mb-2">토스</button>
            	</div>
            	
            <p><p><hr class="my-4" style="border-width: 2px; border-color: #333;"><p><p>
            	
            <div class="d-grid gap-2">
	            <input class="btn btn-primary" type="submit" value="결제하기">
            </div>

          </form>

        </div>
      </div>
    </div>

  </section>


<%@ include file="../common/footerFo.jsp" %>
</body>
</html>