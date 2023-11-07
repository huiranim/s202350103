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
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javaScript">
	function checkAtt(a_num, m_num){	
			if(${chance}==0){
				alert("출석 체크 완료");
				location.href="checkAtt?m_num="+m_num+"&a_num="+a_num;
				return true;
			} else {
				alert("금일 참여하셨습니다.");
				return false;
			}
	}
</script>
</head>

<body>
<h1>${month}월 출석 이벤트</h1>
<caption>${attendance.a_sdate } ~ ${attendance.a_edate }</caption>
<table border="1" width="100%" cellspacing="0">
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
			<th>
	    	<c:choose>
			    <c:when test="${day eq 1}">일요일</c:when>
			    <c:when test="${day eq 2}">월요일</c:when>
			    <c:when test="${day eq 3}">화요일</c:when>
				<c:when test="${day eq 4}">수요일</c:when>
			    <c:when test="${day eq 5}">목요일</c:when>
			    <c:when test="${day eq 6}">금요일</c:when>
			    <c:when test="${day eq 7}">토요일</c:when>
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
	        <td>
	            <span>${i}</span>
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
		<button onclick="checkAtt(${a_num},${m_num })">출석체크</button>
	<c:forEach var="attJoin" items="${attJoin }">
		<p>${attJoin.a_num }</p>
		<p>${attJoin.m_num }</p>
		<p>${attJoin.a_par_pdate }</p>
	</c:forEach>
			
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>