<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
		   function btnActive()  {
			  const target = document.getElementById('target_btn');
			  target.disabled = false;
			}
		
			function btnDisabled()  {
			  const target = document.getElementById('target_btn');
			  target.disabled = true;
			}
			
			function toggleChk(selectchk) {
				alert("toggleOb_ripped start...");
				var	 chk;
				// checkbox 1일때에 선택 
				if (selectchk == 1)	 {
					chk =  	 $("#chk1").val();
					if (chk1 == '1' ) $("#chk1").val('0');
					else 			 $("#chk1").val('1');
				// checkbox 1일때에 선택 
				}if (selectchk == 2) {
					chk =  	 $("#chk2").val();
					if (chk2 == '1' ) $("#chk2").val('0');
					else 			 $("#chk2").val('1');
				}
				// checkbox 1일때에 선택 
				if (selectchk == 3)	 {
					chk =  	 $("#chk3").val();
					if (chk2 == '1' ) $("#chk3").val('0');
					else 			 $("#chk3").val('1');
				}
			
			}
			//등급 합계
			function toggleSum() {
			    var num1 = $("#chk1").val();
			    var num2 = $("#chk2").val();
			    var num3 = $("#chk3").val();
			    alert ("num1->"+num1);
			    alert ("num2->"+num2);
			    alert ("num3->"+num3);
			    var totalNum = parseInt(num1)+parseInt(num2)+parseInt(num3);
			    var totalNumStr = String(totalNum); 
			    alert ("totalNumStr->"+totalNumStr);
			    
			    $("#totalSum").val(totalNum);
			    
			    if(totalNum == '0'){
			    	$("#totalSum1").val('A');
			    } else if(totalNum == '1'){
			    	$("#totalSum2").val('B');
			    } else if(totalNum == '2'){
			    	$("#totalSum3").val('C');
			    } else if(totalNum == '3'){
			    	$("#totalSum4").val('D');
			    } else {
			    	$("#totalSum5").val('kkk');
			    }
			    
			    
			    //alert ("z"+$("#totalSum"));
			}
			//가격 합계
		/* 	function togglecalcul() {
				
			}
			 */
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="updateOb" method="post">
<p class="fs-1 text-center">중고 검수등록 1 </p>
<table class="table table-bordered">
	    <tr>
		      <td scope="col">신청 일자</td>
		      <td scope="col" colspan="2"><fmt:formatDate value="${oldBook.ob_report_date }" pattern="yyyy-MM-dd KK:mm:ss"></fmt:formatDate></td> 
	    </tr>
	     <tr>
		      <td>중고상품번호 </td>
		      <td colspan="2" id="ob_num" >${oldBook.ob_num }</td>
	    </tr>
	      <tr>
		      <td>검수매입상태</td>
		      <td colspan="2">
	      	<c:choose>		
					<c:when test="${oldBook.ob_status eq '0' }"><c:out value="검수중"/></c:when>
					<c:when test="${oldBook.ob_status eq '1' }"><c:out value="검수완료"/></c:when>
					<c:otherwise><c:out value="매입완료"/></c:otherwise>
			</c:choose>
			<input type="hidden" name="ob_status"  value="1">
	      </td>
	    </tr>
	     <tr>
			      <td>책이름 </td>
			      <td colspan="2">${oldBook.nb_title }</td>
	      </tr>
	     <tr>
			      <td>중고매입가격 </td>
			      <td colspan="2">
			   		${oldBook.nb_price *0.6} 
			      </td>
	       </tr>
	     <tr>					
	      <td rowspan="3"> 검수내역 <button type="button" class="btn btn-dark mb-2" onclick="btnActive()">등록하기</button> </td>
		      <td>찢김</td>
		      <td>
		        <input class="form-check-input" type="checkbox" onclick="toggleChk(1)">
		      	<input  class="form-check-input" type="hidden" name="ob_ripped" id="chk1" value="0">
		      </td>
	     </tr>
	    <tr>
		      <td>오염</td>
		      <td>
		      <input class="form-check-input" type="checkbox" onclick="toggleChk(2)" >
		      <input class="form-check-input" type="hidden" name="ob_smeary" id="chk2" value="0">
		      </td>
	    </tr>
	     <tr>
		      <td>낙서</td>
		    	 <td>
		    	 <input class="form-check-input" type="checkbox" onclick="toggleChk(3)" >
		    	 <input class="form-check-input" type="hidden" name="ob_scribble" id="chk3" value="0"> 
	   		  </td>
	     </tr>
	 
    
     <tr>
      <td>등급 <input type="button"  class="btn btn-dark mb-2" value="등급확인" onclick="toggleSum()"></td>
      <td colspan="2">
       		 	<input type="hidden" name="ob_grade" id="totalSum" value="" >
      		 	
      		 	<p><input type="button" class="btn btn-outline-info mb-2" id="totalSum1" value="" >
      		 	<input type="button" 	class="btn btn-outline-info mb-2" id="totalSum2" value="" >
      		 	<p><input type="button" class="btn btn-outline-info mb-2" id="totalSum3" value="" >
      		 	<input type="button"	class="btn btn-outline-info mb-2" id="totalSum4" value="" >
      		 
      		 	
		
		
	<%-- 	 	<c:set var="grade" id="totalSum" value=""></c:set>
			<c:choose>
				<c:when test="${grade eq '0' }"><c:out value="A"/></c:when>
				<c:when test="${grade eq '1' }"><c:out value="B"/></c:when>
				<c:when test="${grade eq '2' }"><c:out value="C"/></c:when>
				<c:when test="${grade eq '3' }"><c:out value="D"/></c:when>
				<c:otherwise><c:out value="kkk"/></c:otherwise>
			</c:choose> --%>
		</td>
		</tr>
		
	    <tr>
		      <td>중고 정산가격  <input type="button"  class="btn btn-dark mb-2" value="정산가격 계산" onclick="togglecalcul()">  </td>
		      
		 <td colspan="2">
	      <c:choose>
			<c:when test="${oldBook.ob_grade eq '0'}"  > <c:out value="${oldBook.nb_price *0.6 }"/>원 </c:when>
			<c:when test="${oldBook.ob_grade eq '1'}"> <c:out value="${oldBook.nb_price *0.5 }"/>원</c:when>
			<c:when test="${oldBook.ob_grade eq '2'}"> <c:out value="${oldBook.nb_price *0.4 }"/>원</c:when>
			<c:otherwise> <c:out value="${oldBook.nb_price *0.4 }"/> 원  </c:otherwise>
			</c:choose>

	      <input type="hidden" name="ob_pur_price" value="${oldBook.ob_pur_price }">
    	</tr>
  
	</table>
	 
	 	<div class="d-grid gap-2">
		    <button class="btn btn-dark" id="target_btn" type="submit" disabled="disabled" >등록하기</button>
		</div>
	</form>
        <div class="d-grid gap-2">
		    <button class="btn btn-dark" type="button" onclick="location.href='BolistOb'">중고 리스트 보기</button>
		</div>
   


</body>
</html>