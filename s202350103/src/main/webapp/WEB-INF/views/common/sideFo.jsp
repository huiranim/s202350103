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
              
              <!--  카테고리1  -->
              <li class="nav-item border-bottom w-100 " ><a href="#"
                  class="nav-link collapsed" data-bs-toggle="collapse"
                  data-bs-target="#categoryFlushOne" aria-expanded="false" aria-controls="categoryFlushOne">카테고리 대분류 1 <i class="feather-icon icon-chevron-right"></i></a>
                <!-- accordion collapse -->
                <div id="categoryFlushOne" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>
                    <!-- nav -->
				
				<!--  카테고리 1 분류 -->
                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item"><a href="#!" class="nav-link">제목1 </a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="#!" class="nav-link">제목2</a></li>
                    </ul>
                  </div>
                </div>

              </li>
              
             <!--  카테고리 2 -->
              <!-- nav item -->
              <li class="nav-item border-bottom w-100 " ><a href="#"
                  class="nav-link collapsed" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                  카테고리 대분류 2
                  <i class="feather-icon icon-chevron-right"></i>
                </a>

                <!-- collapse -->
                <div id="flush-collapseTwo" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>

                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item"><a href="#!" class="nav-link">제목1</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="#!" class="nav-link">제목2</a></li>
                    </ul>


                  </div>
                </div>

              </li>
              
              <!-- 카테고리 3 -->
              <li class="nav-item border-bottom w-100 " > <a
                  href="#" class="nav-link collapsed" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                  카테고리 대분류 3 
                  <i class="feather-icon icon-chevron-right"></i></a>

                <!-- collapse -->
                <div id="flush-collapseThree" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>
				
                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item">
                        <a class="nav-link" href="#!">제목1</a>
                      </li>
                      <!-- nav item -->
                      <li class="nav-item">
                        <a class="nav-link" href="#!">제목2</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </li>

			<!-- 카테고리  4 -->	
              <li class="nav-item border-bottom w-100 "> <a
                  href="#" class="nav-link collapsed"  data-bs-toggle="collapse"
                  data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                  카테고리 대분류 4
                  <i class="feather-icon icon-chevron-right"></i></a>

                <!-- collapse -->
                <div id="flush-collapseFour" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>
                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item"><a href="#!" class="nav-link">제목1</a></li>
                      <!-- nav item -->
                      <li class="nav-item"><a href="#!" class="nav-link">제목2</a></li>
                    </ul>
                  </div>
                </div>
              </li>

			<!--  카테고리 5 -->
              <li class="nav-item border-bottom w-100 " > <a
                  href="#" class="nav-link collapsed" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
                  카테고리 대분류 5 
                  <i class="feather-icon icon-chevron-right"></i></a>

                <!-- collapse -->
                <div id="flush-collapseFive" class="accordion-collapse collapse"
                  data-bs-parent="#categoryCollapseMenu">
                  <div>
					
                    <ul class="nav flex-column ms-3">
                      <!-- nav item -->
                      <li class="nav-item">
                        <a class="nav-link" href="#!">제목1</a>
                      </li>
                      <!-- nav item -->
                      <li class="nav-item">
                        <a class="nav-link" href="#!">제목2</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </li>

            </ul>
          </div>



          <div class="mb-8">

            <h5 class="mb-3">검색</h5>
            <div class="my-4">

			<!--  검색 인풋 -->
			
			
              <input type="search" class="form-control" placeholder="검색어를 입력하세요">
            </div>
           
            <!-- 쓸거면 쓰고 -->
            <div class="form-check mb-2">
              <!-- input -->
              <input class="form-check-input" type="checkbox" value="" id="eGrocery" checked>
              <label class="form-check-label" for="eGrocery">
                체크
              </label>
            </div>
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

