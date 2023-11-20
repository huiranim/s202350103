<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="headerBo.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

.chart {
 width: 290px; 
 height: 290px; 
}

</style>


<title>Insert title here</title>
</head>
<body>
		
		 <div class="row ">
 
                        <div class="col-xl-6 col-lg-6 col-md-12 col-12 mb-6">
                            <!-- card -->
                            <div class="card h-100 card-lg">
                                <!-- card body -->
                                <div class="card-body p-6">
                                    <h3 class="mb-2 fs-5">회원 분석 </h3>
                                    <h4 class="mb-0 fs-6">총 회원 : ${totalMember } 명</h4>
                                    <div class="mt-6">
                                        <!-- text -->
                                        <div class="mb-5">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h5 class="fs-6">일반 회원</h5>
                                                <span><span class="me-1 text-dark">${nomalMember } 명</span>( ${averNomalMember } % )</span>
                                            </div>
                                            <!-- main wrapper -->
                                            <div>
                                                <!-- progressbar -->
                                                <div class="progress bg-light-primary" style="height: 6px;">
                                                    <div class="progress-bar bg-primary" role="progressbar"
                                                        aria-label="Example 1px high" style="width: ${averNomalMember}%;"
                                                        aria-valuenow="${averNomalMember}" aria-valuemin="0" aria-valuemax="${totalMember }"></div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                            <div class="mb-5">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h5 class="fs-6">관리자</h5>
                                                <span><span class="me-1 text-dark">${adminMember } 명</span>( ${averAdminMember } % )</span>
                                            </div>
                                            <!-- main wrapper -->
                                            <div>
                                                <!-- progressbar -->
                                                <div class="progress bg-info-soft" style="height: 6px;">
                                                    <div class="progress-bar bg-warning" role="progressbar"

                                                        aria-label="Example 1px high" style="width: ${averAdminMember}%;"
                                                        aria-valuenow="${averAdminMember }" aria-valuemin="0" aria-valuemax="${totalMember }"></div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="mb-5">
                                            <!-- text -->
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h5 class="fs-6">활동 회원</h5>
                                                <span><span class="me-1 text-dark">${activeMember } 명</span>( ${averActiveMember } % )</span>
                                            </div>
                                            <div>
                                                <!-- progressbar -->
                                                <div class="progress bg-info-soft" style="height: 6px;">
                                                    <div class="progress-bar bg-info" role="progressbar"
                                                        aria-label="Example 1px high" style="width: ${averActiveMember}%;"
                                                        aria-valuenow="${averActiveMember }" aria-valuemin="0" aria-valuemax="${totalMember }"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <!-- text -->
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h5 class="fs-6">탈퇴 회원</h5>
                                                <span><span class="me-1 text-dark">${wdMember } 명</span>( ${averWdMember } % )</span>
                                            </div>
                                            <div>
                                                <!-- progressbar -->
                                                <div class="progress bg-light-danger" style="height: 6px;">
                                                    <div class="progress-bar bg-danger" role="progressbar"
                                                        aria-label="Example 1px high" style="width: ${averWdMember}%;"
                                                        aria-valuenow="${averWdMember }" aria-valuemin="0" aria-valuemax="${totalMember }"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="col-xl-6 col-lg-6 col-12 mb-6">
                            <!-- card -->
                            <div class="card h-100 card-lg">
                                <!-- card body -->
                                <div class="card-body p-6">
                                    <!-- heading -->
                                    <h3 class="mb-0 fs-5">Member Chart </h3>
                                    <div class="mt-4 d-flex justify-content-center">
										
										<div class="chart">
												<canvas id="memberChart"></canvas>
										</div>

												<script>
												var ctx = document.getElementById('memberChart').getContext('2d');

												// 차트 데이터 
												var data = {
												  labels: ['일반 회원','활동회원','관리자', '탈퇴회원' ],
												  datasets: [{
												    data: [${nomalMember },${activeMember },${adminMember }, ${wdMember }],
												    backgroundColor: [
												      '#0aad0a',
												      '#016bf8',
												      '#ffc107',
												      '#db3030',
												    ]
												  }]
												};

												//  차트 생성
												var memberChart = new Chart(ctx, {
												  type: 'pie',
												  data: data
												});
												</script>



                                    </div>
                                </div>
                            </div>
                        </div>
                        
           </div>
                        
                        


<%@ include file="footerBo.jsp" %>

</body>
</html>