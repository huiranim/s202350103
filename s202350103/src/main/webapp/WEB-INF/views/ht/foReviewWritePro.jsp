<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content">
		<c:if test="${result > 0}">
			<script type="text/javascript">
				alert("리뷰 작성완료~~!! ");
				location.href="MyReviewList?currentPage=${review.currentPage}";
			</script>
		</c:if>
		<c:if test="${result == 0}">
			<script type="text/javascript">
				alert("이미 작성한 리뷰 입니다. ");
				location.href="MyReviewList?currentPage=${review.currentPage}";
			</script>
		</c:if>
	</div>
</body>
</html>