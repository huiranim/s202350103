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
<title>Quiz이벤트</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript">
	function checkAnswer(){
		var selected = document.querySelector('input[name="select"]:checked');
	    if (!selected || selected === null) {
	        alert("정답을 선택하세요.");
	        return false;
	    } else{ 
				var select = selected.value;
				var answer = $('[name=answer]').val();
				if(select == answer){
					if(${chance} == 0){
						alert("정답입니다! 정말 대단하시군요~");
						location.href="checkQuiz?m_num="+${m_num}+"&eNum="+${eNum};
						return true;
					} else{
						alert("이미 참여하셨습니다");
						return false;
					}
				} else {
					alert("오답입니다. 오달숩니다.");
					return false;
				}
			}
		}
</script>
<body>
<p>${eNum}, ${m_num }<p>
	<h1>Quiz이벤트</h1>
	
	<div>
		
<div class="card card-product mb-8">
    <div class="card-body text-center py-8">
      <h3 class="fs-3 mb-5" style="color: #0a3622;">[오늘의 Quiz]</h3>
		<p>${quiz.q_sdate}~${quiz.q_edate}</p>
		<p><mark>퀴즈를 풀고 포인트를 적립해 보세요 !</mark> </p>    
    
		
		<div>
			<textarea rows="8" class="form-control mb-8" style="border: none; background:#ecf0ef; font-size: 20px; font-weight: bold;"  class="form-control">${quiz.q_question }</textarea>
		</div>
		<div class="form-check" style="display: flex; align-items: center; justify-content: center;">
		<form onsubmit="checkAnswer()">
			<input type="hidden" name="m_num" value="${m_num}">
   			<input type="hidden" name="eNum" value="${eNum}">
			<input type="hidden" name="answer"   value="${quiz.q_answer}">
			
	<div style="display: flex; flex-direction: column; align-items: center;">
   	
   	<label>
         <input class="form-check-input" type="radio" name="select" value="1">${quiz.q_select1}
    </label><br>
    
    <label>
         <input class="form-check-input" type="radio" name="select" value="2">${quiz.q_select2}
    </label><br>
    <label>
        <input class="form-check-input" type="radio" name="select" value="3">${quiz.q_select3}
    </label><br>
    <label>
         <input class="form-check-input" type="radio" name="select" value="4">${quiz.q_select4}
    </label><br>
    <input type="submit" class="btn btn-primary" id="subButton" value="정답 제출" disabled="disabled">
</div>
		</form>
		</div>
	</div>
  </div>
 </div>

<div class="card mb-10">
  <div class="card-header">
    <h6 class="card-title">보상안내</h6>
    	<span style="font-size: 15px;"> 보상 안내 내용
    	</span>

  </div>

  <div class="card-header">
    <h6 class="card-title">유의사항</h6>
    	<span style="font-size: 15px;"> 유의사항 안내 내용
    	</span>

  </div>
</div>
	
	
	<script type="text/javascript">
	$(function(){
		var curDate = new Date();
		var curDate1 = curDate.getFullYear()+"-"+(curDate.getMonth()+1)+"-"+curDate.getDate();
		var a_sdate = '${quiz.q_sdate}';
		var a_edate = '${quiz.q_edate}';
		var sysdate = new Date(curDate1);
		var sdate = convertToDate(a_sdate);
		var edate = convertToDate(a_edate);
		var target = document.getElementById("subButton");
		alert(sysdate);
		alert(sdate);
		alert(edate);
		if(sysdate>=sdate&&sysdate<=edate){
		target.disabled = false;
		} else{
		target.disabled = true;	
		}
		
		function convertToDate(dateStr) {
			  var parts = dateStr.split('-');
			  return new Date(parts[0], parts[1] - 1, parts[2]);
			}
	});
</script>
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>