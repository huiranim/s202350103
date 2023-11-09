<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	
	<div class="row">
<div class="col-lg-12">
      <div class="mb-8">
         <!-- heading -->
         <h2 class="mb-2">내 문의함</h2>
         <p><a href="#">${member.m_id } 님의 문의 목록입니다.</a></p>
      </div>
      <div>
         <!-- table -->
         <div class="table-responsive">
            <table class="table text-nowrap">
               <thead class="table-light">
                  <tr>
                     <th>No. 작성일</th>
                     <th>제목</th>
                     <th>내용</th>
                  </tr>
               </thead>
               <tbody>
    	           <tr>	
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    
                  </tr>
     </tbody>
   </table>
   
   
   </div>
 </div>
 </div>
 </div>

<%@ include file="../common/footerFo.jsp" %>

</body>
</html>