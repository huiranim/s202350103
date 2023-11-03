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
<script type="text/javascript">
	//이벤트 클릭 function
	function eventClick(m_num){
		console.log("function eventClick Start..");
		if (m_num === "number"){
			alert(${member.m_num});
			alert("로그인이 필요한 페이지입니다.");
			location.href="loginForm";
			return true;
		} else {
			alert(m_num);
		}
	 } 
</script>
<body>
	<div class="tbody">
		<h1>${member.m_num}</h1>
		<form>
			<c:forEach var="event" items="${eventList }">
					<div class="tr" style="border: 1px solid black; margin-bottom: 30px;">
						<span>${event.a_image }</span>
						<span>
							<span>${event.a_title }</span>
							<span>${event.a_sdate }~${event.a_edate }</span>
						</span>
						<span><button onclick="eventClick('${member.m_num }')">버튼</button></span>
					</div>
			</c:forEach>	
		</form>
	</div>
	<div>
		<span id="pageNum">
			<c:if test="${page.startPage > page.pageBlock }">
				<a href="eventList?currentPage=${page.startPge-page.pageBlocck }">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
				<a href="eventList?currentPage=${i }">[${i }]</a>
			</c:forEach>
			<c:if test="${page.endPage < page.totalPage }">
				<a href="eventList?currentPage=${page.startPage+page.pageBlock }">[다음]</a>
			</c:if>
		</span>
	</div>
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>