<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/headerFo.jsp" %>

<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&display=swap" rel="stylesheet">

<head>
<style>
        table {
            border-collapse: collapse; /* 테이블 셀 병합 */
        }

        table, td {
            border: 1px solid #ecf0ef; /* 테두리 선 */
        }

        td {
        	height: 180px;
        	width: 180px;
            font-size: 20px;
            font-weight: bold;
            margin: 30px;
	        }
        
         th {
           font-size: 25px;
           font: bold;
        }
        
</style>
<meta charset="UTF-8">

	</div>
</div>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>

</head>
	
	<div  style="text-align: center; color: #0aad0a; font-weight: bold; font-size: 25px;">
	   🌟 ${attendance.a_sdate }
	   <span style="color: black;">~ </span>
	     ${attendance.a_edate } 🌟
	</div>

<div class=" mt-8 mb-lg-14 mb-8" style="background: #FAF5EF;">

	 <div class="mb-8">
		<div class="offset-lg-2 col-lg-8 col-12 " >
		
		<p  class="mt-10 mb-8" style="font-size: 80px; text-align: center; color:#3B3B3B; font-family: 'Bagel Fat One';">
			${month} 월 출석 현황
		</p>

	
		<div style="background: white;">
		<div class="table-responsive">
		<table  class="table ">
			<thead>
				<c:forEach var="day" begin="1" end="7">
					<th style="text-align: center; background: #3B3B3B;">
			    	<c:choose>
					    <c:when test="${day eq 1}"><span style="color: #db3030;">일</span>
					    		<small>SUN</small></c:when>
					    <c:when test="${day eq 2}"><span style="color: white;">월</span>
							   	<small>MON</small></c:when>
					    <c:when test="${day eq 3}"><span style="color: white;">화</span>
								<small>TUE</small></c:when>
						<c:when test="${day eq 4}"><span style="color: white;">수</span>
						    	<small>WED</small></c:when>
					    <c:when test="${day eq 5}"><span style="color: white;">목</span>
								<small>THU</small></c:when>	
					    <c:when test="${day eq 6}"><span style="color: white;">금</span>
							   	<small>FRI</small></c:when>
					    <c:when test="${day eq 7}"><span style="color: #6680A2;">토</span>
		  					   	<small>SAT</small></c:when>
					</c:choose>
					</th>
				</c:forEach>
			</thead>
			<tbody>
			    <c:forEach var="i" begin="1" end="${dayOfWeek - 1}">
			        <div style="background: white;">
				            <div class="calDate">
				           		 <td></td>
				            </div>
			        </div>
			    </c:forEach>
			
			    <c:forEach var="i" begin="1" end="${lastday}">
			        <c:set var="today" value="${(i + dayOfWeek - 2) % 7 + 1}" />
						
						
				        <c:choose>
				            <c:when test="${today == 7}">
				                <td class="SUN" style="text-align: left; vertical-align: top; color: #6680A2;" >
				            </c:when>
				            <c:when test="${today == 1}">
				                <td class="SAT" style="text-align: left; vertical-align: top; color:  #db3030;">
				            </c:when>
				            <c:otherwise>
				                <td style="text-align: left; vertical-align: top; color: #664d03; " >
				            </c:otherwise>
				        </c:choose>	      
		
							   <span>${i}</span>
							        <c:forEach var="date" items="${date }">
							            <c:if test="${date == i}">
								            <img src="../assets/images/logo/dadokStamp.png"  style="width: 100%; height: auto;">
							            </c:if>
							        </c:forEach>

			
			        <c:if test="${(i + dayOfWeek - 1) % 7 == 0}">
			            </tr><tr>
			        </c:if>

			    </c:forEach>
			</tbody>
		</table>
		</div>
		</div>
		
		
		<div class="d-grid gap-2 col-4 mx-auto mt-8">
			<input type="button" id="subButton" onClick="checkAtt(${a_num},${m_num}),addAtt(${a_num},${m_num})" disabled="disabled" value="출석체크" class="btn btn-success mb-2">
		</div>
		
		
		<br>
		<hr style="margin-bottom: 50px;">
		
		
		<div class="accordion" id="accordionExample">
		 <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		       <button class="accordion-button" type="button" data-bs-toggle="collapse"
		          data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		       보상안내
		       </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show"
		       aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		       <div class="accordion-body">
		          <strong>[${month}월 출석 이벤트]</strong>
					<br>
						<span>정답 시 : ${quiz.q_point }포인트</span><br>    	
		       </div>
		    </div>
		 </div>
		
		<div class="accordion mt-6 mb-10" id="accordionExample">
		 <div class="accordion-item">
		    <h2 class="accordion-header" id="headingTwo">
		       <button class="accordion-button " type="button" data-bs-toggle="collapse"
		          data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
		       유의사항
		       </button>
		    </h2>
		    <div id="collapseTwo" class="accordion-collapse collapse show"
		       aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
		       <div class="accordion-body">
		          <strong>[${month}월 출석 이벤트]</strong>
					<br>
					<span>[${month}월 출석 이벤트]</span><br>
					<span>일일 출석 체크 : ${attendance.a_point }포인트</span><br>
					<span>연속 출석 체크 : ${attendance.a_addpoint }포인트</span><br>
					<span>[공통 안내]</span><br>
					<span>-본 이벤트는 당사의 사정에 따라 변경 또는 종료될 수 있습니다.</span><br>
					<span>-이벤트 기간 내 ID당 1일 1회 참여 가능합니다.(모바일, PC 중복 응모 불가)</span><br>
					<span>-본 이벤트 혜택은 참여 즉시 자동 지급되며, 최대 1분까지 시간 소요될 수 있습니다.</span><br>
					<span>-당월 내에 연속출석 조건을 만족 할 경우 연속출석 보상을 지급받을 수 있습니다.</span><br>
					<span>-포인트는 적립금으로 부여되며, 지급된 이벤트 혜택은 '마이페이지 -> 포인트' 항목에서 확인 가능합니다.</span><br>
					<span>-타인의 명의도용 등 부정한 방법으로 이벤트 참여 시, 지급된 혜택은 회수될 수 있으며 법적 책임이 따를 수 있습니다.</span><br>
		       </div>
		    </div>
		 </div>
		</div>
		</div>
		
		<div class="mt-13"> 
			&nbsp;
		</div>

<script type="text/javascript">
	//이벤트 기간 체크 function (자동)
	$(function(){
		var curDate = new Date();
		var curDate1 = curDate.getFullYear()+"-"+(curDate.getMonth()+1)+"-"+curDate.getDate();
		var a_sdate = '${attendance.a_sdate}';
		var a_edate = '${attendance.a_edate}';
		var sysdate = new Date(curDate1);
		var sdate = convertToDate(a_sdate);
		var edate = convertToDate(a_edate);
		var target = document.getElementById("subButton");
		if(sysdate>=sdate&&sysdate<= edate){
		target.disabled = false;
		} else{
		target.disabled = true;	
		}
		
		function convertToDate(dateStr) {
			  var parts = dateStr.split('-');
			  return new Date(parts[0], parts[1] - 1, parts[2]);
			}
	});
	//당일 출석 참여 유무 function
	function checkAtt(a_num, m_num){
		var point = '${attendance.a_point}';
		if(${chance}==0){
			alert("체크되었습니다."+point+"포인트 획득하셨습니다.");
			location.href="checkAtt?a_num="+a_num+"&m_num="+m_num;
			// checkAtt가 실행되면서 addAtt 함수 호출
		    addAtt(a_num, m_num);
			return true;
		} else {
			alert("금일 참여하셨습니다.");
			return false;
		}
	}

	//연속 출석 function 
	function addAtt(a_num, m_num){
		$.ajax({
			url : "/checkAddAtt",
			data : {a_num:a_num, m_num:m_num},
			dataType:"text",
			success : function(result){
				if(result == 1){
					alert(${attendance.a_add}+"일 연속 출석 하셨습니다!");
				}
			}, 
			error : function(){
				alert("오류발생");
			}
		});
	}
</script>
</div>
</div>
</div>
</body>

<%@ include file="../common/footerFo.jsp" %>
</html>