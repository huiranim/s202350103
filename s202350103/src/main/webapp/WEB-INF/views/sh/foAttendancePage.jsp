<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<style>
        table {
            border-collapse: collapse; /* 테이블 셀 병합 */
            width: 100%;
        }

        table, td {
            border: 1px dashed #889397; /* 테두리 선 */
        }

        td {
        	height: 150px;
            font-size: 17px;
            font: bold;
	        }
        
         th {
           font-size: 19px;
           font: bold;
        }
        
        tbody td {
            width: 14.3%;
        }

</style>
<meta charset="UTF-8">
<title>11월 출석 이벤트</title>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javaScript">
	
</script>
</head>
<body>
<p class="fs-1 mb-5" style="text-align: center;">${month}월 출석 이벤트</p>

<div style="text-align: center; color: #0aad0a;">
    ${attendance.a_sdate } 00:00 ~ ${attendance.a_edate } 00:00
</div>

<div class="table-responsive">
<table cellspacing="0" class="table ">
	<colgroup>
		<col width="14.3%"/>
		<col width="14.3%"/>
		<col width="14.3%"/>
		<col width="14.3%"/>
		<col width="14.3%"/>
		<col width="14.3%"/>
		<col width="14.3%"/>
	</colgroup>	
	<thead>
		<c:forEach var="day" begin="1" end="7">
			<th style="text-align: center;" class="rounded">
	    	<c:choose>
			    <c:when test="${day eq 1}"><span style="color: red;">일요일</span></c:when>
			    <c:when test="${day eq 2}">월요일</c:when>
			    <c:when test="${day eq 3}">화요일</c:when>
				<c:when test="${day eq 4}">수요일</c:when>
			    <c:when test="${day eq 5}">목요일</c:when>
			    <c:when test="${day eq 6}">금요일</c:when>
			    <c:when test="${day eq 7}"><span style="color: #368AFF;">토요일</span></c:when>
			</c:choose>
			</th>
		</c:forEach>
	</thead>
	<tbody>
	    <c:forEach var="i" begin="1" end="${dayOfWeek - 1}">
	        <td>
	            <span></span>
	            <div class="calDate">
	                &nbsp;<!-- 공백 추가 -->
	            </div>
	        </td>
	    </c:forEach>
	
	    <c:forEach var="i" begin="1" end="${lastday}">
	        <td style="text-align: left; vertical-align: top;">
	            <span>${i}</span><hr>
	            <div>
	            <c:forEach var="date" items="${date }">
	    	        <c:if test="${date == i}">
		    	        <img src="../assets/images/png/stamp1.png" width="87px;" height="72px;"/>
		            </c:if>
	            </c:forEach>
	            </div>
	        </td>
	
	        <c:if test="${(i + dayOfWeek - 1) % 7 == 0}">
	            </tr><tr>
	        </c:if>
	    </c:forEach>
	</tbody>
</table>
</div>

<div class="d-grid gap-2 col-6 mx-auto mt-5">
	<input type="button" id="subButton" onClick="checkAtt(${a_num},${m_num}),addAtt(${a_num},${m_num })" disabled="disabled" value="출석" class="btn btn-soft-success">
</div>

<br>
<hr style="margin-bottom: 50px;">

<div class="card mb-10">
   <div class="card-header">
    <h6 class="card-title">보상안내</h6>
    	<span>[${month}월 출석 이벤트]</span><br>
		<span>정답 시 : ${quiz.q_point }포인트</span><br>
  </div>	

  <div class="card-header">
    <h6 class="card-title">유의사항</h6>
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
			alert("체크되었습니다. "+point+"포인트 획득하셨습니다.");
			location.href="checkAtt?a_num="+a_num+"&m_num="+m_num;
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
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>