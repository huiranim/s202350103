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

카카오페이 결제가 정상적으로 완료되었습니다.
 
결제일시:     ${ka.approved_at}<br/>
주문번호:     ${ka.partner_order_id}<br/>
상품명:      ${ka.item_name}<br/>
상품수량:     ${ka.quantity}<br/>
결제금액:     ${ka.amount.total}<br/>
결제방법:     ${ka.payment_method_type}<br/>

 
</body>
</html>