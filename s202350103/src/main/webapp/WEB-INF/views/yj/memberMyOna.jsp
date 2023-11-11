<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"%>
<%@ include file="../common/sideFo.jsp"%>

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
				<p>
					<a href="#">${member.m_id } 님의 문의 목록입니다.</a>
				</p>
			</div>
			<div>


				<div class="card-body p-0">
					<!-- table -->
					<div class="table-responsive ">
						<table
							class="table table-centered table-hover mb-0 text-nowrap table-borderless table-with-checkbox">
							<thead class="bg-light">
								<tr>
									<th>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="checkAll"> <label class="form-check-label"
												for="checkAll"> </label>
										</div>
									</th>
									<th>작성일</th>
									<th>제목</th>
									<th>내용</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="mymq" items="${memberMyQnaList }">

									<tr>
										<td>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value=""
													id="categoryOne"> <label class="form-check-label"
													for="categoryOne"> </label>
											</div>
										</td>

										<td><fmt:formatDate value="${mymq.mq_date }"
												pattern="yyyy-MM-dd HH:ss" /></td>

										<td><textarea rows="6" cols="" class="form-control">${mymq.mq_title }</textarea>
										</td>


										<td><textarea rows="6" cols="" class="form-control">${mymq.mq_content }</textarea>
										</td>

										<td>
											<div class="dropdown">
												<a href="#" class="text-reset" data-bs-toggle="dropdown"
													aria-expanded="false"> <i
													class="feather-icon icon-more-vertical fs-5"></i>
												</a>
												<ul class="dropdown-menu">
													<li><a class="dropdown-item" href="#"><i
															class="bi bi-trash me-3"></i>Delete</a></li>
													<li><a class="dropdown-item" href="#"><i
															class="bi bi-pencil-square me-3 "></i>Edit</a></li>
												</ul>
											</div>
										</td>


									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>

			</div>
		</div>
	</div>


	<%@ include file="../common/footerFo.jsp"%>

</body>
</html>