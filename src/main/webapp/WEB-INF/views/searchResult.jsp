<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>search page</title>
        <!--부트 스트랩 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        
        <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>

        <!-- 필터-가격바 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/css/ion.rangeSlider.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/js/ion.rangeSlider.min.js"></script>

        <!-- 체크박스 버튼 -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/css/searchPageCss.css">

        <!-- 따로 만든 css for 원희 -->
        <link rel="stylesheet" href="resources/css/searchPageCss2.css">
		
        <style>

        </style>
    </head>
    <body id="body">
        
        <!--내비게이션 바-->
        <section id="search-navi">
            <div>
                <nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: white; border: 2px solid black; border-top: none; border-left: none; border-right: none;">
					<div style="width: 100px;"></div>
<!-- 20220120 사이트 로고 연결 -> 홈페이지로SI -->
				<a class="navbar-brand" href="#">
					<!-- svg => 아이콘 -->
					<svg style="color: rgb(255, 174, 0);" xmlns="http://www.w3.org/2000/svg" 
								width="50px" height="50px" fill="currentColor" class="bi bi-piggy-bank-fill" viewBox="0 0 16 16"
								onclick="location.href='./'">
						<!-- 아이콘 경로 -->
						<path fill-rule="evenodd" d="M7.964 1.527c-2.977 0-5.571 1.704-6.32 4.125h-.55A1 1 0 0 0 .11 6.824l.254 1.46a1.5 1.5 0 0 0 1.478 1.243h.263c.3.513.688.978 1.145 1.382l-.729 2.477a.5.5 0 0 0 .48.641h2a.5.5 0 0 0 .471-.332l.482-1.351c.635.173 1.31.267 2.011.267.707 0 1.388-.095 2.028-.272l.543 1.372a.5.5 0 0 0 .465.316h2a.5.5 0 0 0 .478-.645l-.761-2.506C13.81 9.895 14.5 8.559 14.5 7.069c0-.145-.007-.29-.02-.431.261-.11.508-.266.705-.444.315.306.815.306.815-.417 0 .223-.5.223-.461-.026a.95.95 0 0 0 .09-.255.7.7 0 0 0-.202-.645.58.58	0 0 0-.707-.098.735.735 0 0 0-.375.562c-.024.243.082.48.32.654a2.112 2.112 0 0 1-.259.153c-.534-2.664-3.284-4.595-6.442-4.595zm7.173 3.876a.565.565 0 0 1-.098.21.704.704 0 0 1-.044-.025c-.146-.09-.157-.175-.152-.223a.236.236 0 0 1 .117-.173c.049-.027.08-.021.113.012a.202.202 0 0 1 .064.199zm-8.999-.65A6.613 6.613 0 0 1 7.964 4.5c.666 0 1.303.097 1.893.273a.5.5 0 1 0 .286-.958A7.601 7.601 0 0 0 7.964 3.5c-.734 0-1.441.103-2.102.292a.5.5 0 1 0 .276.962zM5 6.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0z"/>
					</svg>
				</a>
<!-- 20220120 사이트 로고 연결 -> 홈페이지로SI -->


                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarScroll">
                      <ul class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll" style="max-height: 100px;"></ul>
                      <form class="d-flex">
                        <!-- 공지사항 -->
                        <div class="nav-item">
                          <a class="nav-link" href="#" style="font-size: 20px; color: black;">공지사항</a>
                        </div>
                        <!-- 구내식당 -->
                        <div class="nav-item">
                          <a class="nav-link" href="#" style="font-size: 20px; color: black;">구내식당</a>
                        </div>

<!-- 20220120 네비게이션 바 검색SI -->
					<!-- 검색바 -->
					<div class="nav-item dropdown">
						<a class="nav-link" href="#" id="navbarScrollingDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
						<svg xmlns="http://www.w3.org/2000/svg" 
						width="20" height="20" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16" style="color: black;">
							<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
						</svg>
					</a>
               		</form>
					 	<form action="searchResult" method="get" name="naviSearchForm" >
							<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
								<input class="form-control mr-2" type="search" aria-label="Search" name="keyword" placeholder="검색어 입력" value="${keyword }">
								<button type="submit" style="margin: 0px 0px 0px 0px;" class="btn btn-danger" >Search</button>
							</ul>
						</form>
					</div>
<!-- 20220120 네비게이션 바 검색SI -->					
								
					
					
<!-- 20220120 상태 아이콘SI --> 
				<div class="dropdown">
					<img src="/photo/1.png" width="50px" class="btn btn-secondary dropdown-toggle" 
						style="padding:0px; margin-left:10px;" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false"/>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="./myStat">${loginId } 님</a>
						<!-- 20220117 내 정보 보기 쪽에서 할 수 있도록
							<a class="dropdown-item" href="#">내 글 보기</a>
							<a class="dropdown-item" href="#">내 댓글 보기</a>
						-->
						<a class="dropdown-item" href="#">문의하기</a>
						<a class="dropdown-item" href="#">로그아웃</a>
					</div>
				</div>
 
                    <div style="width: 100px;"></div>
<!-- 20220120 상태 아이콘SI -->



        </section>

        <section id="search-two" class="container">
            <div id="search-two-1"></div>
            <div id="search-two-2"></div>
        </section>

        <!--식당소개-->
        <section id="search-three" class="container">
            <!--식당 검색 결과-->
            <div id="search-three-1">
                <!--검색입력-->
                <div id="search-three-1-1">
<!-- 20220120 - 검색페이지 검색SI --> <!--@@@-->
                    <form  action="searchResult" method="get" name="mainSearchForm" >
                        <div style="display: flex;">
                            <div >
                            <!-- 검색바 -->
                                <input class="form-control border-0.5 shadow-0" 
                                    style="width: 300px; height: 50px; font-size: 15px;" type="text"
                                    name="keyword" placeholder="지역, 식당, 메뉴로 검색하세요." value="${keyword }">
                            </div>
                            <div style="width: 5px;"></div>
                            <div >
                            <!-- search 버튼 -->
                                <button class="btn btn-danger btn-lg" style="width: 80px; height: 50px; font-size: 15px;" type="submit">Search </button>
                            </div>
                        </div>
                    </form>
<!-- 20220120 - 검색페이지 검색SI -->                
                  
                    
                </div>
                <!--검색 결과 테이블(검색 결과 수) 좋아요 좋아요 -->
                <div id="search-three-1-2">
                    <div id="search-three-1-2-1">
                        <div id="search-three-1-2-1-1"></div>
                        <div id="search-three-1-2-1-2">
                            <div id="search-three-1-2-1-2-1">
<!-- 20220122 검색결과 건수 표시 -->
                                <h5 id="searchCnt">"${keyword }" 검색결과 - 총 ${size}건( 식당 : ${newResultSize} 개 )</h5>
                            </div>
                            <div id="search-three-1-2-1-2-2"></div>
                            <div id="search-three-1-2-1-2-3" style="display: flex; flex-direction: row-reverse;">
                                <div>
<!-- 20220120 정렬기능 삽입 + script 500라인쯤 -->
                                    <select class="btn btn-outline-dark" id="sortSelect" name="sortSelect" onchange=""> <!-- onchange 함수 필요함 -->
                                        <option value="likeSort" selected="">좋아요순</option>
                                        <option value="viewSort">별점순</option>
                                        <option value="starSort">평점순</option>
                                    </select>
<!-- 20220120 정렬기능 삽입 -->
                                </div>
                            </div>
                        </div>
                        <div id="search-three-1-2-1-1"></div>
                    </div>
                    <div id="search-three-1-2-2"></div>
                </div>
                
                
                
<!-- 20220120 등록글이 하나도 없을 때 처리 -->
			<c:choose>
				<c:when test="${lastResult eq null || size == 0 }">
				<br><br>
					검색 결과와 맞는 식당이 없어요.
					다른 검색어로 시도해보시는건 어떨까요??
				</c:when>
               	<c:when test="${size > 0 }">
               		<c:set var="dayCodeChk" value="0"/>
               		
               		<div id="tbody">
					<c:forEach items="${lastResult }" var="res">
                		<div id="search-three-1-3" onclick="showDetailCafe(${res.cafe_idx})">
		                    <div id="search-three-1-3-1"></div>
		                    <div id="search-three-1-3-2" style="display: flex;">
		                        <div style="width: 2%; height: auto;"></div>
		                        <div style="cursor:pointer; width: 30%; height: auto">
		                           <img style="width:100%; height:auto;" src="/photo/${res.bmem_image1 }"/>  
		                        </div>
		                        <div style="width: 2%; height: auto;"></div>
		                        <div style="width: 64%; height: auto;">
		                            <a>${res.cafe_title }</a>

		                            <li>
<!--좋아요 아이콘-->			
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
											<path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
										</svg>
										<a> ${res.cafe_likecnt } </a>
										<a>|</a>
<!--조회 아이콘-->
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
											<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
										</svg>
										<a> ${res.cafe_ratestaravg }  </a>
										<a>|</a>
<!--별점 아이콘-->							
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
											<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
											<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
										</svg>
										<a> ${res.cafe_hit} </a>

									</li>

		                            <li><a>${res.cafe_diet_price } 원 | 서울시 ${res.bmem_area_name }</a></li>
		                            <li>
		                           		<a>
		                           			<c:choose>
		                           				<c:when test="${res.mem_id ne null }">
		                           					<!-- 댓글이 수정된 시간이 있으면 수정시간 출력 / 없으면 작성시간-->
		                           					<c:choose>
														<c:when test="${res.cafereply_modtime ne null }">
															${res.reply_mem_id } | ${res.cafereply_modtime } <br>
															${res.cafereply_content }(수정됨) <br>
														</c:when>
														<c:when test="${res.cafereply_modtime eq null }">
															${res.reply_mem_id } | ${res.cafereply_posttime } <br>
															${res.cafereply_content } <br>
														</c:when>
													</c:choose>
		                           				</c:when>
		                           				<c:when test="${res.mem_id eq null }">
		                           					<span>등록된 댓글이 아직은 없네요!</span>
		                           				</c:when>
		                           			</c:choose>
		                            	</a>
		                            </li>
		                            <!-- 2. 만약 끼니가 비어있지 않으면(하나라도 메뉴가 나왔다면) -->
									<c:if test="${res.diet_code != 0}">
										<!-- 3. chk 변수에 1 -->
										<c:set var="dayCodeChk" value="1"/>
									</c:if>
		                        </div>
		                        <div style="width: 2%; height: auto;"></div>
		                    </div>
		                    <div id="search-three-1-3-3"></div>
		                    <div id="search-three-1-3-4"></div>
		                </div>
 					</c:forEach>
 					</div>
               	</c:when>
               
               
               </c:choose>
               
              </div>
<!-- 20220120 검색결과 리스트 -->           
            
            
            <div id="search-three-2">
                <div id="search-three-2-1"></div>
                <div id="search-three-2-2"></div>
                <div id="search-three-2-3"></div>
            </div>
<!--필터-->
            <div id="search-three-3">
                <div id="search-three-3-1"></div> 
                <div id="search-three-3-2">
                      <div id="search-three-3-2-1" style="display: flex;">
                        <div style="width: 10%;"><a>필터</a></div>
                        <div style="width: 90%; text-align: right;"><a href="javascript:ClearAll();">전체초기화</a></div> 
                </div>
                    <!--조식,월요일,7,500원-->
                    <div id="search-three-3-2-2">
                        <div id="search-three-3-2-2-1"></div>
                        <div id="search-three-3-2-2-2">

<!-- 20220120 선택한 필터가 있는 영역 -->                      
<div>	
	<ul class="ks-cboxtags" id="selected">
	
	
	</ul>		
</div>
                            
                        </div>
                        <div id="search-three-3-2-2-3"></div>
                    </div>
                    <!--요일-->
                    <div id="search-three-3-2-3">
                        <div id="search-three-3-2-3-1">
                            <h4>요일</h4>
                        </div>
                        <div id="search-three-3-2-3-2">
                            <div id="search-three-3-2-3-3">
                                <div>
                                    <ul id="filter" class="ks-cboxtags">
                                        <!-- 20220120 자바스크립트 오늘 요일 기준 다시 그린 부분 
                                        <li>
                                            <input type="checkbox" id="checkbox-01" value="Order Two">
                                            <label for="checkbox-01">월요일</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="checkbox-02" value="Order Two">
                                            <label for="checkbox-02">화요일</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="checkbox-03" value="Order Two">
                                            <label for="checkbox-03">수요일</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="checkbox-04" value="Order Two">
                                            <label for="checkbox-04">목요일</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="checkbox-05" value="Order Two">
                                            <label for="checkbox-05">금요일</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="checkbox-06" value="Order Two">
                                            <label for="checkbox-06">토요일</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="checkbox-07" value="Order Two">
                                            <label for="checkbox-07">일요일</label>
                                        </li> 
										-->
                                    </ul>
                                </div>
                            </div>    
                        </div>
                    </div>
                    <!--식사시간-->
                    <div id="search-three-3-2-4">
                        <div id="search-three-3-2-4-1">
                            <h3>식사시간</h3>
                        </div>
                        <div id="search-three-3-2-4-2">
                            <div>
                                <ul class="ks-cboxtags">
                                    <li>
                                        <input type="checkbox" id="checkbox-08" value="Order Two">
                                        <label for="checkbox-08" class="dayFilter">조(아침)</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-09" value="Order Two">
                                        <label for="checkbox-09" class="dayFilter">중(점심)</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-10" value="Order Two">
                                        <label for="checkbox-10" class="dayFilter">석(저녁)</label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--가격-->
                    <div id="search-three-3-2-5">
                        <div id="search-three-3-2-5-1">
                            <h3>가격</h3>
                        </div>
                        <div id="search-three-3-2-5-2">
                            <input type="text" id="demo_price" name="my_range" value=""/>
                        </div>
                    </div>
                    <!--지역-->
                    <div id="search-three-3-2-6">
                        <div id="search-three-3-2-6-1">
                            <h3>지역</h3>
                        </div>
                        <div id="search-three-3-2-6-2">
                            <div class="input-group input-group-merge mb-6">
                                <input class="form-control form-control-xs search" id="myInput" type="search" placeholder="지역을 입력하세요">
                            </div>
                        </div>
                        <div id="search-three-3-2-6-3">
                            <div id="myTable">
                                <ul class="ks-cboxtags">
                                    <li>
                                        <input type="checkbox" id="checkbox-11" value="Order Two">
                                        <label for="checkbox-11" class="dayFilter">강남구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-12" value="Order Two">
                                        <label for="checkbox-12" id="none-display-buttons" class="dayFilter">강동구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-13" value="Order Two">
                                        <label for="checkbox-13" id="none-display-buttons" class="dayFilter">강북구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-14" value="Order Two">
                                        <label for="checkbox-14" id="none-display-buttons" class="dayFilter">강서구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-15" value="Order Two">
                                        <label for="checkbox-15" id="none-display-buttons" class="dayFilter">관악구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-16" value="Order Two">
                                        <label for="checkbox-16" id="none-display-buttons" class="dayFilter">광진구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-17" value="Order Two">
                                        <label for="checkbox-17" class="dayFilter">구로구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-18" value="Order Two">
                                        <label for="checkbox-18" class="dayFilter">금천구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-19" value="Order Two">
                                        <label for="checkbox-19" id="none-display-buttons" class="dayFilter">노원구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-20" value="Order Two">
                                        <label for="checkbox-20" id="none-display-buttons" class="dayFilter">도봉구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-21" value="Order Two">
                                        <label for="checkbox-21" class="dayFilter">동대문구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-22" value="Order Two">
                                        <label for="checkbox-22" id="none-display-buttons" class="dayFilter">동작구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-23" value="Order Two">
                                        <label for="checkbox-23" class="dayFilter">마포구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-24" value="Order Two">
                                        <label for="checkbox-24" id="none-display-buttons" class="dayFilter">서대문구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-25" value="Order Two">
                                        <label for="checkbox-25" class="dayFilter">서초구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-26" value="Order Two">
                                        <label for="checkbox-26" id="none-display-buttons" class="dayFilter">성동구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-27" value="Order Two">
                                        <label for="checkbox-27" id="none-display-buttons" class="dayFilter">성북구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-28" value="Order Two">
                                        <label for="checkbox-28" class="dayFilter">송파구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-29" value="Order Two">
                                        <label for="checkbox-29" id="none-display-buttons" class="dayFilter">양천구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-30" value="Order Two">
                                        <label for="checkbox-30" class="dayFilter">영등포구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-31" value="Order Two" >
                                        <label for="checkbox-31" id="none-display-buttons" class="dayFilter">용산구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-32" value="Order Two">
                                        <label for="checkbox-32" id="none-display-buttons" class="dayFilter">은평구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-33" value="Order Two">
                                        <label for="checkbox-33" class="dayFilter">종로구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-34" value="Order Two">
                                        <label for="checkbox-34" id="none-display-buttons" class="dayFilter">중구</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-35" value="Order Two">
                                        <label for="checkbox-35" id="none-display-buttons" class="dayFilter">중량구</label>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>

                </div>
                <div id="search-three-3-3"></div>
            </div>
        </section>
        
        <div style="height: 100px;"></div>

        <!-- 푸터 -->
        <footer style="width: 100%; height: 230px; background-color: rgb(29, 29, 29);">
            <div style="width: 100%; height: 7%;"></div>
            <div style="display: flex; width: 100%; height: 85%;">
                <!-- 로고 및 설명 -->
                <div style="width: 20%; height: 100%;">
                    <div tyle="width: 50%; height: 50%;"></div>
                    <div style="width: 100%; height: 50%;">
                        <a href="#">
                            <svg style="color: rgb(255, 174, 0);" xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="currentColor" class="bi bi-piggy-bank-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M7.964 1.527c-2.977 0-5.571 1.704-6.32 4.125h-.55A1 1 0 0 0 .11 6.824l.254 1.46a1.5 1.5 0 0 0 1.478 1.243h.263c.3.513.688.978 1.145 1.382l-.729 2.477a.5.5 0 0 0 .48.641h2a.5.5 0 0 0 .471-.332l.482-1.351c.635.173 1.31.267 2.011.267.707 0 1.388-.095 2.028-.272l.543 1.372a.5.5 0 0 0 .465.316h2a.5.5 0 0 0 .478-.645l-.761-2.506C13.81 9.895 14.5 8.559 14.5 7.069c0-.145-.007-.29-.02-.431.261-.11.508-.266.705-.444.315.306.815.306.815-.417 0 .223-.5.223-.461-.026a.95.95 0 0 0 .09-.255.7.7 0 0 0-.202-.645.58.58 0 0 0-.707-.098.735.735 0 0 0-.375.562c-.024.243.082.48.32.654a2.112 2.112 0 0 1-.259.153c-.534-2.664-3.284-4.595-6.442-4.595zm7.173 3.876a.565.565 0 0 1-.098.21.704.704 0 0 1-.044-.025c-.146-.09-.157-.175-.152-.223a.236.236 0 0 1 .117-.173c.049-.027.08-.021.113.012a.202.202 0 0 1 .064.199zm-8.999-.65A6.613 6.613 0 0 1 7.964 4.5c.666 0 1.303.097 1.893.273a.5.5 0 1 0 .286-.958A7.601 7.601 0 0 0 7.964 3.5c-.734 0-1.441.103-2.102.292a.5.5 0 1 0 .276.962zM5 6.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0z"/>
                            </svg>
                        </a>
                    </div>
                    <div style="display: flex; width: 100%; height: 50%; ">
                        <div style="width: 15%; height: 100;"></div>
                        <!-- text text text -->
                        <div>
                            <p style="color: rgb(151, 151, 151);">
                                
                            </p>
                        </div>
                    </div>
                </div>
                <!-- 주소 및 아이콘 -->
                <div style="width: 70%; height: 100%;">
                    <div style="width: 100%; height: 10%;"> </div>
                    <div class="col text-center" style="width: 100%; color: rgb(151, 151, 151);">
                        <p>
                            <span>㈜000</span>
                            <span>대표이사 : 000</span>
                            <span>사업자등록번호 : 000-00-00000</span>
                            <span>등록연월일 : 2022.01.24</span>
                        </p>
                        <p>
                            <span>주소 : 000 000 000 000 000, 0000</span>
                            <span>개인정보 관리책임자 : 000</span>
                        </p>
                        <p>
                            ©Copyright 2022 - Made by Gudi Project team, Group 4.
                        </p>
                        <div style="width: 100%; height: 10px;"></div>
                      <div style="display: flex; justify-content: center; align-items: center;">
                            <!--아이콘 구글-->
                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16 " style="color: rgb(0, 128, 248);">
                                <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z"/>
                                </svg>
                            </a>
                            <a style="width: 30px;"></a>
                             <!--아이콘 인스타-->
                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16" style="color: rgb(255, 123, 0);">
                                <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                                </svg>
                            </a>
                            <a style="width: 30px;"></a>
                             <!--아이콘 유튜브-->
                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-youtube" viewBox="0 0 16 16" style="color: red;">
                                <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"/>
                                </svg>
                            </a>
                            <a style="width: 30px;"></a>
                             <!--아이콘 위치(지도)-->
                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16" style="color: rgb(0, 155, 26);">
                                <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                </svg>
                            </a>
                            
                            
                        </div>
                    </div>
                    <div style="width: 100%; height: 10%;"></div>
                </div>
                <div style="width: 10%; height: 100%;"></div>
            </div>
            <div style="width: 100%; height: 8%;"></div>
        </footer>
        
    </body>

    
    


    <script>    
    
/* 20220120 요일 버튼 배열 기능 추가 */    
	// 요일 버튼 배열
	weekOfDayArray();
	
	// http://jynote.net/entry/JAVASCRIPT-오늘-요일-구하기-오늘이-무슨-요일인지-출력하기 [하늘과 나의 IT 이야기]
	function weekOfDayArray(){
		var d = new Date();		// 오늘 날짜
		var week = new Array('일', '월', '화', '수', '목', '금', '토');
				
		// 요일 div 를 비워주고
		$("#filter").html('');
		
		// 오늘 날짜부터 7개 요일을 배치
		// 1. div 안에 들어갈 HTML
		var content = "";
		
		// 2. 오늘의 요일 담기(월 <= 이런식으로 들감)
		var weekOfDayInt = d.getDay();		// 요일을 숫자로(배열 인덱스로 사용)
		var weekOfDay = week[weekOfDayInt];	// 요일을 찍음
		//console.log(weekOfDay);
		
		//document.write(weekOfDay);
		
		// 20220117 JSTL로 찍을 때 체크했던 변수 dayCodeChk
		var dChk = '<c:out value="${dayCodeChk}"/>';
		
		// 3. 7일을 찍어줄거임
		for(i=1; i<=7; i++){
			content = '';	// content 초기화
			
			// 3.0 요일 계속 받아오기
			weekOfDay = week[weekOfDayInt];
	
			/* 20220117 하나라도 끼니구분 값이 있었다면 필터 활성화 => 20220122 필터 비활성화는 폐기 */
			if(dChk == 1){
				// 3-1. 요일을 붙여서 넣어줌( 화요일 )
				content += '<li><input type="checkbox" id="checkbox-0'+i+'" value="Order Two">';
                content += '<label for="checkbox-0'+i+'" class="dayFilter">'+weekOfDay+'요일</label></li>';
         	}else{ //그렇지 않다면
         		content += '<li><input type="checkbox" id="checkbox-0'+i+'" value="Order Two">';
                content += '<label for="checkbox-0'+i+'" class="dayFilter">'+weekOfDay+'요일</label></li>';
			}

			// 3-2. 만약 오늘 날짜가 토요일이거나, for문 돌다가 토요일에 도착함( 배열 끝 )
			if(weekOfDay==week[6]){
				weekOfDayInt = 0;		// 배열 인덱스 초기화
			}else{
				weekOfDayInt += 1;		// 하나 올리기
			}
			
			$('#filter').append(content);
		}
		
	}    
    
    
    
    
    
    
    
/* 20220120 전체초기화 기능 삽입 */
        function ClearAll(){

            //console.log("함수 실행");
            var chk = $("#search-three-3-2").find("input[type='checkbox']").prop("checked");
            //console.log(chk);   
            $("#search-three-3-2").find("input").prop("checked" ,false);

            $('.selectedFilter').remove();
            
            // 202220122 가격 필터 초기화 추가
            filterPriceCancel();
            
/* 20220117 필터 배열 초기화 */
         	
        		filterValues = [];
        		filterDays = [];
        		filterDiet = [];
        		filterPrice = 0;
        		filterArea = [];		
        		
        		searchPageListSort(filterValues);
        	
		}    
    
    
    
    
    
    
    
    
/* 20220120 검색 결과 리스트 클릭 시 디테일 페이지로 이동하는 함수 추가 */
 	function showDetailCafe(idx){
		var url = "./detail?idx="+idx;
		
		location.href = url;
	}


    
// 20220120 정렬, 필터 기능 삽입    

	// 필터 값 모아놓을 배열
	var filterDays = [];
	var filterDiet = [];
	var filterPrice = 5000;
	var filterArea = [];
	
// 요일 필터 - 동적으로 생긴 버튼은 이렇게 on 을 줘야 이벤트 주기 가능
	$(document).on("click",".dayFilter", sortFilterSearch);

	function sortFilterSearch(filterDiv){
		//console.log(filterDiv);
		
		// 현재 필터 배열에 해당 값이 없으면
		if(!filterValues.includes($(this).text())){
			// 필터 배열에 넣을 값
			var filterValue = $(this).text();
			
			//console.log($(this).text());
			
/* Front쪽 처리 => 필터 영역에 값 추가하기 */
 			// 20220122 - 가격 필터를 선택한 경우 필터 영역에 추가되지 않는다( 따로 뺐음 )
 			// https://hianna.tistory.com/385
 			if(isNaN(filterDiv)){	// 숫자가 아닐경우 추가
				var filterContent = '<label class="selectedFilter btn btn-outline-danger btn-sm" onclick="filterCancel(this)">'+filterValue+' X</label>';
				$('#selected').append(filterContent);
 			}
/* Front쪽 처리 => 필터 영역에 값 추가하기 */
		
		
			// 요일 push
			if(filterValue == '월요일' || filterValue == '화요일' || filterValue == '수요일'
			|| filterValue == '목요일' || filterValue == '금요일' || filterValue == '토요일'
			|| filterValue == '일요일')
			{
				/* Back쪽 처리 => 필터 배열에 값 넣기 */
				filterDays.push(filterValue);
				
			}
			
			
			
			// 아침, 점심, 저녁 => 1, 2, 3으로 바꿔서 push
			if(filterValue == '조(아침)'){ 
				//20220117 - 아,점,저 => 1,2,3 은 여기서 바꾸면 값 비교가 안되기 때문에, 다 하고 나서 바꾸기 
				//filterValue = 1; 
				filterDiet.push(filterValue); 
				}
			else if(filterValue == '중(점심)'){ 
				//filterValue = 2; 
				filterDiet.push(filterValue); 
				}
			else if(filterValue == '석(저녁)'){	
				//filterValue = 3; 
				filterDiet.push(filterValue); 
				}
					
			
			
			
// 20220122 - 가격 필터 추가 => 가격 필터는 change 이벤트로 계속 바뀌기 때문에 무조건 여길 탄다
			if(!isNaN(filterDiv)){
				filterPrice = filterDiv; // 최대 값
				
			}
			
			
			
			
			// 지역			
			// 강동구 강북구 강서구 관악구 광진구 구로구 금천구 노원구 도봉구 동대문구 동작구 마포구 
			// 서대문구 서초구 성동구 성북구 송파구 양천구 영등포구 용산구 은평구 종로구 중구 중랑구
			if(filterValue == '강남구' || filterValue == '강동구' || filterValue == '강북구' || filterValue == '강서구' ||
				filterValue == '관악구' || filterValue == '광진구' || filterValue == '구로구' ||
				filterValue == '금천구' || filterValue == '노원구' || filterValue == '도봉구' ||
				filterValue == '동대문구' || filterValue == '동작구' || filterValue == '마포구' ||
				filterValue == '서대문구' || filterValue == '서초구' || filterValue == '성동구' ||
				filterValue == '성북구' || filterValue == '송파구' || filterValue == '양천구' ||
				filterValue == '영등포구' || filterValue == '용산구' || filterValue == '은평구' ||
				filterValue == '종로구' || filterValue == '중구' || filterValue == '중랑구')
			{
				filterArea.push(filterValue);
			}
		
			
		}else{
			// 필터 배열에서 뺄 값
			var filterValue = $(this).text();
			
/* Front쪽 처리 => 필터 영역에서 값 제거하기 */
			filterCancelFront(filterValue);
/* Front쪽 처리 => 필터 영역에서 값 제거하기 */
			
			// 필터 값에서 요일 빼기
			if(filterValue == '월요일' || filterValue == '화요일' || filterValue == '수요일'
			|| filterValue == '목요일' || filterValue == '금요일' || filterValue == '토요일'
			|| filterValue == '일요일')
			{
				filterDays = filterDays.filter((element) => element !== filterValue);
			}
			
			// 아침, 점심, 저녁 => 1, 2, 3으로 바꿔서 빼기
			if(filterValue == '조(아침)'){ 
				//20220117 - 아,점,저 => 1,2,3 은 여기서 바꾸면 값 비교가 안되기 때문에, 다 하고 나서 바꾸기
				//service 쪽에서 바꿔줬어요
				//filterValue = 1; 
				filterDiet = filterDiet.filter((element) => element !== filterValue);
				}
			else if(filterValue == '중(점심)'){
				//filterValue = 2; 
				filterDiet = filterDiet.filter((element) => element !== filterValue);
				}
			else if(filterValue == '석(저녁)'){
				//filterValue = 3; 
				filterDiet = filterDiet.filter((element) => element !== filterValue);
				}
			
			// 지역 빼기
			if(filterValue == '강남구' || filterValue == '강동구' || filterValue == '강북구' || filterValue == '강서구' ||
				filterValue == '관악구' || filterValue == '광진구' || filterValue == '구로구' ||
				filterValue == '금천구' || filterValue == '노원구' || filterValue == '도봉구' ||
				filterValue == '동대문구' || filterValue == '동작구' || filterValue == '마포구' ||
				filterValue == '서대문구' || filterValue == '서초구' || filterValue == '성동구' ||
				filterValue == '성북구' || filterValue == '송파구' || filterValue == '양천구' ||
				filterValue == '영등포구' || filterValue == '용산구' || filterValue == '은평구' ||
				filterValue == '종로구' || filterValue == '중구' || filterValue == '중랑구'){
				filterArea = filterArea.filter((element) => element !== filterValue);
				}
			
		}
		//console.log('filterDays 길이 : ', filterDays.length);
		//console.log('filterDiet 길이 : ', filterDiet.length);
		//console.log('filterPrice 길이 : ', filterPrice.length);
		//console.log('filterArea 길이 : ', filterArea.length);
		
		// 요일
		filterValues = filterDays.concat('/');
		// 끼니		
		filterValues = filterValues.concat(filterDiet).concat('/');
		// 가격
		filterValues = filterValues.concat(filterPrice).concat('/');
		// 지역
		filterValues = filterValues.concat(filterArea).concat('/');
		
		console.log('filterValues : ',filterValues);
		
		searchPageFilter(filterValues);
	}

/* 20220120 - 필터 기능 추가 */
	// 20220117 - 필터를 클릭시 현재 정렬 순서를 가지고 가게
	function searchPageFilter(filterValues){
		$.ajax({
			type: 'POST',
			url: 'searchPageFilter',
			traditional: true,
			data:{
				'keyword': '${keyword}',
				'sortValue': sortValue,
				'filterValues': filterValues
				},
			dataType: 'json',
			
			success:function(data){
				//listCall 호출
				listDraw(data);
			},
			error:function(e){
				//console.log(e);
			}
		});
	}
/* 20220120 - 필터 기능 추가 */
	
	
	
	
/* 20220120 - Front쪽 처리 - 선택된 필터를 클릭시 선택필터 영역에서 제거 + 밑 필터 영역에서도 제거 */
	function filterCancel(filterTag){
		// 선택된 필터 지우기
		//console.log(filterTag);
		filterTag.remove();
		
	// 같은 값을 가진 필터도 checked 해제하기
		// 1. 지우려고 클릭한 필터 라벨의 text 가져오기		
		var strArray = filterTag.outerText.split(' ');
		//console.log(strArray[0]);
		
		// 2. text와 똑같은 걸 필터에서 찾아서 checked 해제
		var chkLabel = $("#search-three-3-2").find("label");
		var labelName = '';
		
		
		// 3. 요일 필터 제거를 위해 오늘 날짜부터 7개 요일의 배열 만들기(newWeek)
		var d = new Date();
		var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
		var newWeek = [];
		
		//console.log('오늘 요일 : ', week[d.getDay()]);
		var weekOfDay = d.getDay();
		//console.log(weekOfDay);
		
		// 4. newWeek 새로운 배열에 요일값 넣기
		newWeek.push(week[weekOfDay]);
		for(var j=0; j<6; j++){
			weekOfDay = weekOfDay+1;

			if(weekOfDay < 7){
				newWeek.push(week[weekOfDay]);
			}else{
				weekOfDay = 0;
				newWeek.push(week[weekOfDay]);
			}
			
		}
		
		// 확인
		//console.log(newWeek);
		
		
		// 4. 필터 제거
		for(var i=0; i<chkLabel.length; i++){
			if(strArray[0] == chkLabel[i].outerText){
				//console.log('여기서 확인 : ',chkLabel[i]);
				//console.log(chkLabel[i].previousElementSibling);
				
				labelName = chkLabel[i].outerText;
				
				switch(labelName){
				case newWeek[0] : $('#checkbox-01').prop("checked", false); filterRemove(strArray[0]); break;
				case newWeek[1] : $('#checkbox-02').prop("checked", false); filterRemove(strArray[0]); break;
				case newWeek[2] : $('#checkbox-03').prop("checked", false); filterRemove(strArray[0]); break;
				case newWeek[3] : $('#checkbox-04').prop("checked", false); filterRemove(strArray[0]); break;
				case newWeek[4] : $('#checkbox-05').prop("checked", false); filterRemove(strArray[0]); break;
				case newWeek[5] : $('#checkbox-06').prop("checked", false); filterRemove(strArray[0]); break;
				case newWeek[6] : $('#checkbox-07').prop("checked", false); filterRemove(strArray[0]); break;
								
				
				case '조(아침)': $('#checkbox-08').prop("checked", false); filterRemove(strArray[0]); break;
				case '중(점심)': $('#checkbox-09').prop("checked", false); filterRemove(strArray[0]); break;
				case '석(저녁)': $('#checkbox-10').prop("checked", false); filterRemove(strArray[0]); break;
				
				case '강남구': $('#checkbox-11').prop("checked", false); filterRemove(strArray[0]); break;
				case '강동구': $('#checkbox-12').prop("checked", false); filterRemove(strArray[0]); break;
				case '강북구': $('#checkbox-13').prop("checked", false); filterRemove(strArray[0]); break;
				case '강서구': $('#checkbox-14').prop("checked", false); filterRemove(strArray[0]); break;
				case '관악구': $('#checkbox-15').prop("checked", false); filterRemove(strArray[0]); break;
				case '광진구': $('#checkbox-16').prop("checked", false); filterRemove(strArray[0]);  break;
				case '구로구': $('#checkbox-17').prop("checked", false); filterRemove(strArray[0]); break;
				case '금천구': $('#checkbox-18').prop("checked", false); filterRemove(strArray[0]); break;
				case '노원구': $('#checkbox-19').prop("checked", false); filterRemove(strArray[0]); break;
				case '도봉구': $('#checkbox-20').prop("checked", false); filterRemove(strArray[0]); break;
				case '동대문구': $('#checkbox-21').prop("checked", false); filterRemove(strArray[0]); break;
				case '동작구': $('#checkbox-22').prop("checked", false); filterRemove(strArray[0]); break;
				case '마포구': $('#checkbox-23').prop("checked", false); filterRemove(strArray[0]); break;
				case '서대문구': $('#checkbox-24').prop("checked", false); filterRemove(strArray[0]); break;
				case '서초구': $('#checkbox-25').prop("checked", false); filterRemove(strArray[0]); break;
				case '성동구': $('#checkbox-26').prop("checked", false); filterRemove(strArray[0]); break;
				case '성북구': $('#checkbox-27').prop("checked", false); filterRemove(strArray[0]); break;
				case '송파구': $('#checkbox-28').prop("checked", false); filterRemove(strArray[0]); break;
				case '양천구': $('#checkbox-29').prop("checked", false); filterRemove(strArray[0]); break;
				case '영등포구': $('#checkbox-30').prop("checked", false); filterRemove(strArray[0]); break;
				case '용산구': $('#checkbox-31').prop("checked", false); filterRemove(strArray[0]); break;
				case '은평구': $('#checkbox-32').prop("checked", false); filterRemove(strArray[0]); break;
				case '종로구': $('#checkbox-33').prop("checked", false); filterRemove(strArray[0]); break;
				case '중구': $('#checkbox-34').prop("checked", false); filterRemove(strArray[0]); break;
				case '중량구': $('#checkbox-35').prop("checked", false); filterRemove(strArray[0]); break;
				
				}
			}
		}
	};
	
/* 20220120 - Front쪽 처리 - 선택된 필터를 클릭시 선택필터 영역에서 제거+밑 필터 영역에서도 제거 */
	
/* 20220120 - back 쪽 처리 - 필터 영역에서 클릭시 제거 */
function filterRemove(labelName){
	// 필터 배열에서 뺄 값
	var filterValue = labelName;
	
	// 필터 값에서 요일 빼기
	if(filterValue == '월요일' || filterValue == '화요일' || filterValue == '수요일'
	|| filterValue == '목요일' || filterValue == '금요일' || filterValue == '토요일'
	|| filterValue == '일요일')
	{
		filterDays = filterDays.filter((element) => element !== filterValue);
	}
	
	// 아침, 점심, 저녁 => 1, 2, 3으로 바꿔서 빼기
	if(filterValue == '조(아침)'){ 
		//20220117 - 아,점,저 => 1,2,3 은 여기서 바꾸면 값 비교가 안되기 때문에, 다 하고 나서 바꾸기
		//service 쪽에서 바꿔줬어요
		//filterValue = 1; 
		filterDiet = filterDiet.filter((element) => element !== filterValue);
		}
	else if(filterValue == '중(점심)'){
		//filterValue = 2; 
		filterDiet = filterDiet.filter((element) => element !== filterValue);
		}
	else if(filterValue == '석(저녁)'){
		//filterValue = 3; 
		filterDiet = filterDiet.filter((element) => element !== filterValue);
		}
	
	// 지역 빼기
	if(filterValue == '강남구' || filterValue == '강동구' || filterValue == '강북구' || filterValue == '강서구' ||
		filterValue == '관악구' || filterValue == '광진구' || filterValue == '구로구' ||
		filterValue == '금천구' || filterValue == '노원구' || filterValue == '도봉구' ||
		filterValue == '동대문구' || filterValue == '동작구' || filterValue == '마포구' ||
		filterValue == '서대문구' || filterValue == '서초구' || filterValue == '성동구' ||
		filterValue == '성북구' || filterValue == '송파구' || filterValue == '양천구' ||
		filterValue == '영등포구' || filterValue == '용산구' || filterValue == '은평구' ||
		filterValue == '종로구' || filterValue == '중구' || filterValue == '중랑구'){
		filterArea = filterArea.filter((element) => element !== filterValue);
		}
	
	
	//console.log('filterDays 길이 : ', filterDays.length);
	//console.log('filterDiet 길이 : ', filterDiet.length);
	//console.log('filterPrice 길이 : ', filterPrice.length);
	//console.log('filterArea 길이 : ', filterArea.length);
	
	// 요일
	filterValues = filterDays.concat('/');
	// 끼니		
	filterValues = filterValues.concat(filterDiet).concat('/');
	// 가격
	filterValues = filterValues.concat(filterPrice).concat('/');
	// 지역
	filterValues = filterValues.concat(filterArea).concat('/');
	
	//console.log('filterValues : ',filterValues);
	
	searchPageFilter(filterValues);

}


/* 20220120 요일필터를 다시 선택시 필터 영역에서도 버튼이 빠지게 */
function filterCancelFront(filterValue){
	// 텍스트를 가지고 필터 영역에 있는 라벨중에 이름이 같은거 제거시키면 된다
	//console.log(filterValue);
	
	var chkLabel = $('.selectedFilter');
	//console.log(chkLabel);	
	
	for(var k=0; k<chkLabel.length; k++){
		//console.log('1 : ',chkLabel[k].outerText.split(' '));
		//console.log('2 : ',filterValue);
		
		// 뒤에 X 빼주고
		var labels = chkLabel[k].outerText.split(' ');
		
		// 삭제
		if(labels[0]==filterValue){
			chkLabel[k].remove();
		}
	}
}
/* 20220120 요일필터를 다시 선택시 필터 영역에서도 버튼이 빠지게 */


// 정렬정보와 필터정보를 저장할 변수 선언( 정렬과 필터가 언제나 같이 작동되도록 )
var sortValue = 1;		// 기본값 좋아요순
var filterValues = [];
	
	$('#sortSelect').on('change', function(){
		var sort = $(this).val();
		//console.log(sort);
		
		if(sort == 'likeSort'){
			sortValue = 1;
			searchPageListSort();
		}else if(sort == 'viewSort'){
			sortValue = 2;
			searchPageListSort();
		}else{
			sortValue = 3;
			searchPageListSort();
		}
	});
	
	// 20220120 버튼으로 했을 때 이벤트
	/* $('#likeSort').click(function(){	// 좋아요 정렬
		sortValue = 1;
		searchPageListSort();
	});
	
	$('#viewSort').click(function(){	// 조회순 정렬
		sortValue = 2;
		searchPageListSort();
	});
	
	$('#starSort').click(function(){	// 별점순 정렬
		sortValue = 3;
		searchPageListSort();
	}); */
	
	// console.log('${lastResult}');
	
	// keyword와 정렬category를 가지고 ajax
	function searchPageListSort(){
		//console.log(filterValues);
			$.ajax({
				type:'POST',
				url:'searchPageFilter',
				traditional: true,
				data:
					{
					'keyword': '${keyword}',
					'sortValue': sortValue,
					'filterValues': filterValues
					},
				dataType:'json',
				
				success:function(data){					
					
					//listCall 호출
					listDraw(data);
				},
				error:function(e){
					//console.log(e);
				}
			});
	} 
	
		function listDraw(data){	// 배열안에 있는 내용을 표로 그리는 함수
		
		/*  
		20220117 검색에서 지역이나 식당을 검색했을 때( 끼니구분이 0이거나 요일이 null )
		끼니와 요일 필터를 막는다 ==> front dayCodeChk 변수 / 밑 weekOfDayArray() 메서드와 연결 / dChk 변수도 연결
		*/
		var codeDateChk = 0;		// 변수 선언은 해줘야함( 필터, 정렬이 모두 여길 탄다 )
		
		for(var i=0; i<Object.keys(data).length; i++){
			//console.log(data[i].diet_code);			// 0
			//console.log(data[i].diet_date_name);		// null
		}
		
		// 하나라도 끼니나 요일이 있다면 1
		/* for(var i=0; i<Object.keys(data).length; i++){
			if(data[i].diet_code != 0 || data[i].diet_Date_name != null){
				codeDateChk = 1;
			}
		} */
				
		// 원래 있던 데이터 비우기
		$("#tbody").html('');	
	
		// 20220211 검색 결과 갯수도 바꾸기
		$("#searchCnt").html(''); 
		var filterCnt = 0;
		
		
	
		// 값 만들어서 한줄씩 append
		for(var i=0; i<Object.keys(data).length; i++){
// 검색결과 갯수(20220122)
			filterCnt = filterCnt + 1;
			
			var content = "";
			
			content += '<div id="search-three-1-3" onclick="showDetailCafe('+data[i].cafe_idx+')">';
			content += '<div id="search-three-1-3-1"></div>';
			content += '<div id="search-three-1-3-2" style="display: flex;">';
			content += '<div style="width: 2%; height: auto;"></div>';
			content += '<div style="cursor:pointer; width: 30%; height: auto">';
			content += '<img style="width:100%; height:auto;" src="/photo/'+data[i].bmem_image1+'"/>';
			content += '</div>';
			content += '<div style="width: 2%; height: auto;"></div>';
			content += '<div style="width: 64%; height: auto;">';
			content += '<a>'+data[i].cafe_title+'</a>';
			
			content += '<li>';
			content += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">';
			content += '<path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>';
			content += '</svg>';
			content += '<a>&nbsp;'+data[i].cafe_likecnt+'&nbsp;</a>';
			content += '<a>|&nbsp;</a>';
			content += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">';
			content += '<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>';
			content += '</svg>';
			/* https://squll1.tistory.com/entry/javascript-%EC%86%8C%EC%88%98%EC%A0%90-%EC%9E%90%EB%A6%AC%EC%88%98-%EC%A7%80%EC%A0%95%EC%9E%90%EB%A5%B4%EA%B8%B0 */
			content += '<a>&nbsp;'+parseFloat(data[i].cafe_ratestaravg).toFixed(1)+'&nbsp;</a>';
			content += '<a>|</a>&nbsp;';
			content += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">';
			content += '<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>';
			content += '<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>';
			content += '</svg>';
			content += '<a>&nbsp;'+data[i].cafe_hit+'&nbsp;&nbsp;</a>';
			content += '</li>';			
			
			content += '<li><a>'+data[i].cafe_diet_price+ ' 원 | 서울시  '+data[i].bmem_area_name+'</a></li>';
			content += '<li>';
			content += '<a>';

			if(data[i].cafereply_mem_id != null){		// 등록된 댓글이 없으면
				content += '등록된 댓글이 없네요';
			}else{										
				if(data[i].cafereply_modtime!=null){	// 댓글이 있고, 수정날짜가 있으면
					content += data[i].reply_mem_id+' | '+formatDate(data[i].cafereply_modtime)+'<br>';		// 수정날짜로 표시
					content += data[i].cafereply_content +'(수정됨)';
				}else{
					content += data[i].reply_mem_id+' | '+formatDate(data[i].cafereply_posttime)+'<br>';	// 작성날짜로 표시
					content += data[i].cafereply_content;
				}
			}		
			
			
			
			content += '</a>';
			content += '</li>';
						
			/*
			listDraw() 시작할때 처리
			<c:if test="${res.diet_code != 0}">
				<c:set var="dayCodeChk" value="1"/>
			</c:if>
			*/
			
			content += '</div>';
			content += '<div style="width: 2%; height: auto;"></div>';
			content += '</div>';
			content += '<div id="search-three-1-3-3"></div>';
			content += '<div id="search-three-1-3-4"></div>';
			content += '</div>'

		
			$("#tbody").append(content);
		}
	
// 20220122 => 필터에 따라 검색결과 건수 바꾸기SI
		if(filterDays.length == 0 & filterDiet.length == 0 & filterPrice == 5000 & filterArea == 0){
			$('#searchCnt').html('"${keyword }" 검색결과 - 총 ${size}건( 식당 : ${newResultSize} 개 )');
		}else{
			$("#searchCnt").html('"${keyword }" 검색결과 - 총 ${size}건( 필터 후 식당 : '+ filterCnt +' 개 )');
		}
		
		
	}
		
		
		
	// 날짜 출력 모양 변경
	function formatDate(date){
		var d = new Date(date);
		
		// 출력 모양 변경( yyyy-mm-dd )
		month = '' + (d.getMonth() + 1), 
		day = '' + d.getDate(), 
		year = d.getFullYear(); 
		
		if (month.length < 2) {
			month = '0' + month;			
		}
		if (day.length < 2) {
			day = '0' + day;			
		}
		
		return [year, month, day].join('-');

	}
	
// 20220120 정렬, 필터 BACK 쪽 기능 삽입 -->    
    
    
    
    
    
    
    
    
    
    
    
    
// 20220122 - 지역 필터SI
        $(document).ready(function(){
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable label").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        
                
                });
               
            });
        });
        
        
        
        
        
        
// 20220122 - 지역 필터SI        
        


// 20220122 - 가격 필터SI
        $("#demo_price").ionRangeSlider({
	            skin: "flat",
	            min: 5000,
	            max: 8000,
	            from: 5000,
	            step: 500,
	            grid: true,
	            grid_snap: true,
	            onStart: function (data) {
	                //console.log(data.min);          // MIN value
	                //console.log(data.max);          // MAX values
	                //console.log(data.from);         // FROM value
	                //console.log(data.from_percent); // FROM value in percent
	                //console.log(data.from_value);   // FROM index in values array (if used)
	            },
	            onChange: function (data) {
	                //console.log(data.from);
	            },
	            onFinish: function (data) {
// 20220122 - 가격 필터 등록SI
	            	// 바 움직이고 나서 끝날 때 값 찍어줌
	            	//console.log(data.from);
	
					$('.selectedPriceFilter').remove();
// Front 쪽 처리( 있는지 확인 후 무조건 지우고 새로 append) => 요일, 끼니, 지역과 따로 감( 사실 앞에 세개도 따로 갔어야 돼 )
		          	if(data.min != data.from){		// 5000~5000 은 안돼
		           		var filterPrice = '<label class="selectedPriceFilter btn btn-outline-danger btn-sm" onclick="filterPriceCancel()"> &nbsp'+data.min+'원~'+data.from+'원 X &nbsp</label>';
						$('#selected').append(filterPrice);
		          	}
// Front
// Back 쪽 처리
			sortFilterSearch(data.from);
	
// Back
		          
		          		
		          		
		          		
            },
            onUpdate: function (data) {
                //console.log(data.from_percent);
            }
        });
		
	
		
        // 가격 필터 영역에서 클릭시 제거
        function filterPriceCancel(){
        	$('.selectedPriceFilter').remove();
        	
        	$(".js-range-slider").ionRangeSlider();
        	
        	 // 2. Save instance to variable
            let my_range = $("#demo_price").data("ionRangeSlider");
            
            // 4. Reset range slider to initial values
            my_range.reset();
            
            sortFilterSearch(5000);
            
        }
        
        
        
        
        
// 20220122 - 가격필터SI        
        
        
        
        
    </script>
  
</html>
