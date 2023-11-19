<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="headerBo.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    var memberCnt = 40; 

    // 스타일 속성 업데이트 함수
    function updateProgressBarWidth() {
        var progressBar = document.querySelector(".progress-bar");
        progressBar.style.width = memberCnt + "%";
        progressBar.setAttribute("aria-valuenow", memberCnt);
    }

    // 페이지 로드 시 초기 업데이트 수행
    window.onload = updateProgressBarWidth;
</script>

</head>
<body>

		 <div class="row ">
 
                        <div class="col-xl-6 col-lg-6 col-md-12 col-12 mb-6">
                            <!-- card -->
                            <div class="card h-100 card-lg">
                                <!-- card body -->
                                <div class="card-body p-6">
                                    <h3 class="mb-0 fs-5">회원 분석(진행중)</h3>
                                    <div class="mt-6">
                                        <!-- text -->
                                        <div class="mb-5">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h5 class="fs-6">관리자</h5>
                                                <span><span class="me-1 text-dark">$1,619</span> (8.6%)</span>
                                            </div>
                                            <!-- main wrapper -->
                                            <div>
                                                <!-- progressbar -->
                                                <div class="progress bg-light-primary" style="height: 6px;">
                                                    <div class="progress-bar bg-primary" role="progressbar"

                                                        aria-label="Example 1px high" style="width: ${memberCnt}%;"
                                                        aria-valuenow="${memberCnt}" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mb-5">
                                            <!-- text -->
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h5 class="fs-6">Total Income</h5>
                                                <span><span class="me-1 text-dark">$3,571</span> (86.4%)</span>
                                            </div>
                                            <div>
                                                <!-- progressbar -->
                                                <div class="progress bg-info-soft" style="height: 6px;">
                                                    <div class="progress-bar bg-info" role="progressbar"
                                                        aria-label="Example 1px high" style="width: 88%;"
                                                        aria-valuenow="88" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <!-- text -->
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h5 class="fs-6">Total Expenses</h5>
                                                <span><span class="me-1 text-dark">$3,430</span> (74.5%)</span>
                                            </div>
                                            <div>
                                                <!-- progressbar -->
                                                <div class="progress bg-light-danger" style="height: 6px;">
                                                    <div class="progress-bar bg-danger" role="progressbar"
                                                        aria-label="Example 1px high" style="width: 45%;"
                                                        aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
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
                                    <h3 class="mb-0 fs-5">Total Sales </h3>
                                    <div id="totalSale" class="mt-6 d-flex justify-content-center"></div>
                                    <div class="mt-4">
                                        <!-- list -->
                                        <ul class="list-unstyled mb-0">
                                            <li class="mb-2"><svg xmlns="http://www.w3.org/2000/svg" width="8"
                                                    height="8" fill="currentColor"
                                                    class="bi bi-circle-fill text-primary" viewBox="0 0 16 16">
                                                    <circle cx="8" cy="8" r="8" />
                                                </svg> <span class="ms-1"><span class="text-dark">Shippings
                                                        $32.98</span> (2%)</span></li>
                                            <li class="mb-2"><svg xmlns="http://www.w3.org/2000/svg" width="8"
                                                    height="8" fill="currentColor"
                                                    class="bi bi-circle-fill text-warning" viewBox="0 0 16 16">
                                                    <circle cx="8" cy="8" r="8" />
                                                </svg> <span class="ms-1"><span class="text-dark">Refunds $11</span>
                                                    (11%)</span></li>
                                            <li class="mb-2"><svg xmlns="http://www.w3.org/2000/svg" width="8"
                                                    height="8" fill="currentColor" class="bi bi-circle-fill text-danger"
                                                    viewBox="0 0 16 16">
                                                    <circle cx="8" cy="8" r="8" />
                                                </svg> <span class="ms-1"><span class="text-dark">Order $14.87</span>
                                                    (1%)</span></li>
                                            <li><svg xmlns="http://www.w3.org/2000/svg" width="8" height="8"
                                                    fill="currentColor" class="bi bi-circle-fill text-info"
                                                    viewBox="0 0 16 16">
                                                    <circle cx="8" cy="8" r="8" />
                                                </svg> <span class="ms-1"><span class="text-dark">Income 3,271</span>
                                                    (86%)</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
           </div>
                        
                        


<%@ include file="footerBo.jsp" %>

</body>
</html>