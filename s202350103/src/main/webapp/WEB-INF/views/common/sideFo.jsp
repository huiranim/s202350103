<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

 
        <!-- col -->
        <aside class="col-lg-3 col-md-4 mb-6 mb-md-0">
          <div class="offcanvas offcanvas-start offcanvas-collapse w-md-50 " tabindex="-1" id="offcanvasCategory" aria-labelledby="offcanvasCategoryLabel">

            <div class="offcanvas-header d-lg-none">
              <h5 class="offcanvas-title" id="offcanvasCategoryLabel">Filter</h5>
              <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body ps-lg-2 pt-lg-0">
            <div class="mb-8">
            <!-- title -->
          
            <h5 class="mb-3">카테고리</h5>
            <!-- nav -->
            <ul class="nav nav-category" id="categoryCollapseMenu">
              
              <!--  국내도서  -->
              <li class="nav-item border-bottom w-100 " ><a href="#"
                  class="nav-link collapsed" data-bs-toggle="collapse"
                  data-bs-target="#categoryFlushOne" aria-expanded="false" aria-controls="categoryFlushOne">국내도서 <i class="feather-icon icon-chevron-right"></i></a>
                <!-- accordion collapse -->
                <div id="categoryFlushOne" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>
                    <!-- nav -->
				
				<!--  국내도서 분류 -->
                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=1&nb_category2=1" class="nav-link">경제/경영 </a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=1&nb_category2=2" class="nav-link">과학</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=1&nb_category2=3" class="nav-link">소설</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=1&nb_category2=4" class="nav-link">역사/문화</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=1&nb_category2=5" class="nav-link">인문</a></li>
                    </ul>
                  </div>
                </div>

              </li>
              
             <!--  해외도서 -->
              <!-- nav item -->
              <li class="nav-item border-bottom w-100 " ><a href="#"
                  class="nav-link collapsed" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                  	해외도서
                  <i class="feather-icon icon-chevron-right"></i>
                </a>

                <!-- collapse -->
                <div id="flush-collapseTwo" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>

                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=2&nb_category2=6" class="nav-link">과학/기술</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="innewbookList?nb_category1=2&nb_category2=7" class="nav-link">문학</a></li>
                    </ul>
                  </div>
                </div>

              </li>
              
              <!-- 중고국내도서 -->
              <li class="nav-item border-bottom w-100 " > <a
                  href="#" class="nav-link collapsed" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                 	중고국내도서
                  <i class="feather-icon icon-chevron-right"></i></a>

                <!-- collapse -->
                <div id="flush-collapseThree" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>
				
                    <!--  국내도서 분류 -->
                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=1&nb_category2=1" class="nav-link">경제/경영 </a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=1&nb_category2=2" class="nav-link">과학</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=1&nb_category2=3" class="nav-link">소설</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=1&nb_category2=4" class="nav-link">역사/문화</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=1&nb_category2=5" class="nav-link">인문</a></li>
                    </ul>
                  </div>
                </div>
              </li>

			<!-- 중고해외도서 -->	
              <li class="nav-item border-bottom w-100 "> <a
                  href="#" class="nav-link collapsed"  data-bs-toggle="collapse"
                  data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                  	중고해외도서
                  <i class="feather-icon icon-chevron-right"></i></a>

                <!-- collapse -->
                <div id="flush-collapseFour" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>
                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=2&nb_category2=6" class="nav-link">과학/기술</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="folistOb?nb_category1=2&nb_category2=7" class="nav-link">문학</a></li>
                    </ul>
                  </div>
                </div>
              </li>
            </ul>
          </div>
          
		<!-- 광고 배너 -->            
          <div class="mb-8 position-relative">
            <div class="position-absolute p-5 py-8">
              <h3 class="mb-0">광고배너 </h3>
              <p>광고내용</p>
              <a href="#" class="btn btn-dark">
				구매하러가기
              <i class="feather-icon icon-arrow-right ms-1"></i></a>
            </div>
			
            <img src="../assets/images/banner/assortment-citrus-fruits.png" alt=""
              class="img-fluid rounded ">
          </div>
          
          </div>
        </div>
        </aside>



    	  <section class="col-lg-9 col-md-12">

