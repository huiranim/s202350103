<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"%>
<%@ include file="../common/sideFo.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function myReplyDelete(){
		
		var delcon = confirm("댓글을 삭제 하시겠습니까?");
		
		if(delcon == true){
			return true;
		}else{
			return false;
		}
		
	}

</script>
<style type="text/css">
.center-text {
  text-align: center; /* 텍스트 가운데 정렬 */
  position: absolute;
  top: 50%;
  left: 50%;
  font-weight: bold;
  color:black;
  transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
}

</style>
</head>
<body>

	<h2>내 댓글</h2>
	<div class="mb-8">
		<a href="#">${member.m_id } 님이 작성하신 댓글입니다.</a>
	</div>
	<p>

<div class="offset-lg-2 col-lg-8 col-12">	
	
	<c:if test="${empty memberMyReply}">
		 <div class="row">
		<div class="center-text">
			작성한 댓글이 없습니다. 
		</div>
		</div>
	</c:if>

	<c:forEach items="${memberMyReply}" var="reply">
	
    <div class="row">
        <div class="col-12">
            <div class="mb-3">
                <h5><fmt:formatDate value="${reply.mqr_date}" pattern="MM 월 dd 일" /></h5>
            </div>

            <div class="card card-product mb-4">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                    <div class="mb-3">
                      <c:if test="${member.m_admin == 0 }">
                        	<span style="color: green;">추천 수 
                        <i class="bi bi-hand-thumbs-up-fill" style="color: green;"></i>
                        ${reply.mqr_recomen}</span> 
                      </c:if>
                    </div>
						<span style="font-weight: bold; font-size: 16px;">
		                    ${reply.mqr_content}
						</span>
                    </div>

                    <div class="dropdown">
                        <a href="#" class="text-reset" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="feather-icon icon-more-vertical fs-5"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                 <button class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal${reply.mqr_num }" data-whatever="@mdo">
                                    <i class="bi bi-pencil-square me-3"></i>
                            		        수정
                                </button>
                            </li>
                            
                            <li>
                            <form action="myReplyDelete" method="post" onsubmit="return myReplyDelete();">
                            	<input type="hidden" name="mqr_num" value="${reply.mqr_num }">
                            	<input type="hidden" name="m_num" value="${member.m_num }">
                                <button class="dropdown-item" type="submit" >
                                    <i class="bi bi-trash me-3"></i>
                                 	   삭제
                                </button>
                            
                            </form>
                            </li>
                        </ul>
                    </div>
                    
                    
							<div class="modal fade" id="exampleModal${reply.mqr_num }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelOne" aria-hidden="true">
							  <div class="modal-dialog" role="document">
						        <form action="myReplyUpdate" method="post">
						        <input type="hidden" name="mqr_num" value="${reply.mqr_num }">
						        <input type="hidden" name="m_num" value="${reply.m_num }">
						        
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabelOne">댓글 수정</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							        </button>
							      </div>
							      <div class="modal-body">
							          <div class="mb-3">
							            <label for="recipient-name" class="col-form-label"><span style="font-weight: bold;">기존 댓글</span></label><p>
							           ${reply.mqr_content }
							          </div>
							          <div class="mb-3">
							            <label for="message-text" class="col-form-label"><span style="font-weight: bold;">수정 내용</span></label>
							            <textarea class="form-control" id="message-text" name="mqr_content"></textarea>
							          </div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button type="submit"  class="btn btn btn-success">작성 완료</button>
							      </div>
							    </div>
						        </form>
							  </div>
							</div> 
                            
                    
                    
                    
                    
                </div>

				 <span class="placeholder col-12 placeholder-xs bg-primary"></span>
                
                <div class="card-body">
                	<a href="memberQInfo?mq_num=${reply.mq_num }" class="link-info">${reply.mq_title }</a> 에 남긴 댓글
                
                </div>
                
            </div>
        </div>
    </div>
</c:forEach>
</div>


	<%@ include file="../common/footerFo.jsp"%>

</body>
</html>