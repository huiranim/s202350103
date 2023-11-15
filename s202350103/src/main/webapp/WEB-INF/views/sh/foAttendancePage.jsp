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
<title>Insert title here</title>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javaScript">
	
</script>
</head>
<body>
<!-- 회원 번호 굳이 노출 할 필요 없을 듯 해서 주석 해놓을겡 -->
<!-- 
<a href="boPointList">${a_num}</a>
 -->

<p class="fs-1 mb-5">${month}월 출석 이벤트</p>

<div class="fs-2 mb-2" style="text-align: center; color: #0aad0a;">
    ${attendance.a_sdate } ~ ${attendance.a_edate }
</div>

<div class="table-responsive">
<table  cellspacing="0" class="table ">
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
	                &nbsp; <!-- 공백 추가 -->
	            </div>
	        </td>
	    </c:forEach>
	
	    <c:forEach var="i" begin="1" end="${lastday}">
	        <td style="text-align: left; vertical-align: top;">
	            <span>${i}</span><hr>
	            <div>
	            <c:forEach var="date" items="${date }">
	    	        <c:if test="${date == i}">
		    	        <img src="../assets/images/png/stamp.png"/>
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
		if(${chance}==0){
			alert("출석 체크 완료");
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
					alert("3일 연속 출석 하셨습니다!");
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